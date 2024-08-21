<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ManagerController extends AbstractController
{
    #[Route('/manager/{slug}', name: 'app_manager_remove')]
    public function index(): Response
    {
        return $this->render('manager/index.html.twig', [
            'controller_name' => 'ManagerController',
        ]);
    }

    #[Route('/manager/add', name: 'app_manager_add')]
    public function addConference(): Response
    {
        return $this->render('manager/conference_form.html.twig', [
            
        ]);
    }
}
