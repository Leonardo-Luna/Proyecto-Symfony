<?php

namespace App\Controller;

use App\Entity\Conference;
use App\Form\ConferenceType;
use App\Repository\ConferenceRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Notifier\Notification\Notification;
use Symfony\Component\Notifier\NotifierInterface;
use Symfony\Component\Routing\Attribute\Route;

class ManagerController extends AbstractController
{

    public function __construct(private EntityManagerInterface $entityManager)
    {
        
    }

    #[Route('/manager/{slug}', name: 'app_manager_remove')]
    public function index(Request $request, ConferenceRepository $conferenceRepository): Response
    {

        $uri = explode('/', $request->getUri());
        $slug = end($uri);
        $conference = $conferenceRepository->findBy(['slug' => $slug]);

        $this->entityManager->remove($conference[0]);
        $this->entityManager->flush();

        return $this->redirectToRoute(('homepage'));
    }

    #[Route('/manager', name: 'app_manager_add')]
    public function addConference(Request $request, NotifierInterface $notifier): Response
    {
        $conference = new Conference();
        $form = $this->createForm(ConferenceType::class, $conference);

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) {

            $newConference = $form->getData();

            $this->entityManager->persist($newConference);
            $this->entityManager->flush();

            return $this->redirectToRoute('homepage');

        }

        if($form->isSubmitted()) {
            $notifier->send(new Notification('Please check your submission.', ['browser']));
        }

        return $this->render('manager/conference_form.html.twig', [
            'conference_form' => $form,
        ]);
    }
}
