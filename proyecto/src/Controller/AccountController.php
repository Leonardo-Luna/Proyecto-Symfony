<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\EditUserType;
use App\Repository\CommentRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Notifier\Notification\Notification;
use Symfony\Component\Notifier\NotifierInterface;
use Symfony\Component\PasswordHasher\Hasher\PasswordHasherFactory;
use Symfony\Component\PasswordHasher\Hasher\PasswordHasherFactoryInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasher;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

class AccountController extends AbstractController
{

    public function __construct(private EntityManagerInterface $entityManager)
    {
    }

    #[Route('/account', name: 'app_account')]
    public function index(Request $request,
                        UserRepository $userRepository,
                        PasswordHasherFactoryInterface $passwordHasherFactory,
                        NotifierInterface $notifier): Response
    {
        $currentUser = new User();
        $currentUser->setPassword("");
        $currentUser->setUsername($this->getUser()->getUsername());
        $currentUser->setId($this->getUser()->getId());

        $user = new User();
        $form = $this->createForm(EditUserType::class, $user, ['data' => $currentUser]);

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) {
            # Si se envió un formulario correcto:
            $dbUser = $userRepository->findBy(['id' => $currentUser->getId()]);
            $dbUser[0]->setUsername($form['username']->getData());

            $hashedPassword = $passwordHasherFactory->getPasswordHasher(User::class)->hash($form['password']->getData());
            $dbUser[0]->setPassword($hashedPassword);
            
            $this->entityManager->flush();
        }

        if($form->isSubmitted()) {
            # Si hubo algún problema:
            $notifier->send(new Notification('Please check your submission.', ['browser']));
        }

        return $this->render('account/index.html.twig', [
            'user' => $this->getUser(),
            'edit_user' => $form,
        ]);
    }

    #[Route('/account/comments', name: 'app_my_comments')]
    public function showOwnComments(CommentRepository $commentRepository): Response
    {
        $comments = $commentRepository->findBy(['AuthorId' => $this->getUser()->getId()]);

        return $this->render('account/show.html.twig', [
            'user' => $this->getUser(),
            'comments' => $comments,
        ]);
    }
}
