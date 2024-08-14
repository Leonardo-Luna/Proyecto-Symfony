<?php

namespace App\DataFixtures;

use App\Entity\Admin;
use App\Entity\Comment;
use App\Entity\Conference;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\PasswordHasherFactoryInterface;

class AppFixtures extends Fixture
{

    public function __construct(private PasswordHasherFactoryInterface $passwordHasherFactory)
    {
        
    }

    public function load(ObjectManager $manager): void
    {
        $amsterdam = new Conference();
        $amsterdam->setCity('Amsterdam');
        $amsterdam->setYear('2019');
        $amsterdam->setInternational(True);
        $manager->persist($amsterdam);

        $paris = new Conference();
        $paris->setCity('Paris');
        $paris->setYear('2020');
        $paris->setInternational(false);
        $manager->persist($paris);

        $comment1 = new Comment();
        $comment1->setConference($amsterdam);
        $comment1->setAuthor('Leo');
        $comment1->setEmail('asd@gmail.com');
        $comment1->setText('Texto de ejemplo');
        $manager->persist($comment1);

        $admin = new Admin();
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setUsername('admin');
        $admin->setPassword($this->passwordHasherFactory->getPasswordHasher(Admin::class)->hash('admin'));
        $manager->persist($admin);
        
        $manager->flush();
    }
}
