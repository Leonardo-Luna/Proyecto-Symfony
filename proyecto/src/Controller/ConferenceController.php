<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Conference;
use App\Form\CommentType;
use App\Message\CommentMessage;
use App\Repository\CommentRepository;
use App\Repository\ConferenceRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\DependencyInjection\Attribute\Autowire;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Messenger\MessageBusInterface;
use Symfony\Component\Notifier\Notification\Notification;
use Symfony\Component\Notifier\NotifierInterface;
use Symfony\Component\Routing\Attribute\Route;

class ConferenceController extends AbstractController
{

    public function __construct(private EntityManagerInterface $entityManager, private MessageBusInterface $bus)
    {

    }

    #[Route('/', name: 'homepage')]
    public function index(ConferenceRepository $conferenceRepository): Response
    {
        
        if($this->getUser()) {
            $userIsManager = in_array('ROLE_CONFERENCE_MANAGER',$this->getUser()->getRoles());
        }
        else {
            $userIsManager = false;
        }

        return $this->render('conference/index.html.twig', [
            'conferences' => $conferenceRepository->findAll(),
            'has_permission' => $userIsManager,
        ]);
    }

    #[Route('/conference_header', name: 'conference_header')]
    public function conferenceHeader(ConferenceRepository $conferenceRepository): Response
    {
        return $this->render('conference/header.html.twig', [
            'conferences' => $conferenceRepository->findAll(),
        ])->setSharedMaxAge(3600);
    }

    #[Route('/conference/{slug}', name: 'conference')]
    public function show(Request $request, Conference $conference,
                        CommentRepository $commentRepository,
                        NotifierInterface $notifier,
                        #[Autowire('%photo_dir%')] string $photoDir): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        
        if($this->getUser()) {
            $isLogged = true;

            $comment->setAuthor($this->getUser()->getUsername());
            $comment->setAuthorId($this->getUser()->getId());

            $form->handleRequest($request);
            if($form->isSubmitted() && $form->isValid()) {
                $comment->setConference($conference);

                if($photo = $form['photo']->getData()) {
                    $filename = bin2hex(random_bytes(6).'.'.$photo->guessExtension());
                    $photo->move($photoDir, $filename);
                    $comment->setPhotoFilename($filename);
                }
            
                $this->entityManager->persist($comment);
                $this->entityManager->flush();

                $context = [
                    'user_ip' => $request->getClientIp(),
                    'user_agent' => $request->headers->get('user-agent'),
                    'referrer' => $request->headers->get('referrer'),
                    'permalink' => $request->getUri(),
                ];

                $reviewUrl = $this->generateUrl('review_comment', ['id' => $comment->getId()]);
                $this->bus->dispatch(new CommentMessage($comment->getId(), $reviewUrl, $context));

                $notifier->send(new Notification('Thank you for the feedback; your comment will be posted after moderation.', ['browser']));

                return $this->redirectToRoute('conference', ['slug' => $conference->getSlug()]);
            }

            if($form->isSubmitted()) {
                $notifier->send(new Notification('Please check your submission.', ['browser']));
            }
        }
        else {
            $isLogged = false;
        }

        $offset = max(0, $request->query->getInt('offset', 0));
        $paginator = $commentRepository->getCommentPaginator($conference, $offset);

        return $this->render('conference/show.html.twig', [
            'conference' => $conference,
            'comments' => $paginator,
            'previous' => $offset - CommentRepository::COMMENTS_PER_PAGE,
            'next' => min(count($paginator), $offset + CommentRepository::COMMENTS_PER_PAGE),
            'is_logged' => $isLogged,
            'comment_form' => $form,
        ]);
    }

}
