<?php

namespace App\DataFixtures;

use App\Entity\Comment;
use App\Entity\Conference;
use App\Entity\User;
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

        $user1 = new User();
        $user1->setRoles(['ROLE_ADMIN']);
        $user1->setUsername('Leo');
        $user1->setPassword($this->passwordHasherFactory->getPasswordHasher(User::class)->hash('admin'));
        $manager->persist($user1);

        $user2 = new User();
        $user2->setRoles(['ROLE_CONFERENCE_MANAGER']);
        $user2->setUsername('Gonza');
        $user2->setPassword($this->passwordHasherFactory->getPasswordHasher(User::class)->hash('manager'));
        $manager->persist($user2);

        $comment1 = new Comment();
        $comment1->setConference($amsterdam);
        $comment1->setAuthor('Leo');
        $comment1->setAuthorId(1);
        $comment1->setText('Texto de ejemplo');
        $comment1->setState('published');
        $manager->persist($comment1);

        $comment2 = new Comment();
        $comment2->setConference($amsterdam);
        $comment2->setAuthor('Gonza');
        $comment2->setAuthorId(2);
        $comment2->setText('Texto de ejemplo 2');
        $comment2->setState('published');
        $manager->persist($comment2);
        
        $manager->flush();
    }
}
