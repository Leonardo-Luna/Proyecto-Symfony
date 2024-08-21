-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `photo_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conference_id` int NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submitted',
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526C604B8382` (`conference_id`),
  CONSTRAINT `FK_9474526C604B8382` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Leo','Texto de ejemplo','2024-08-21 21:31:29',NULL,1,'published',1),(2,'Gonza','Texto de ejemplo 2','2024-08-21 21:31:29',NULL,1,'published',2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_international` tinyint(1) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_911533C8989D9B62` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (1,'Amsterdam','2019',1,'amsterdam-2019'),(2,'Paris','2020',0,'paris-2020');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `sess_id` varbinary(128) NOT NULL,
  `sess_data` longblob NOT NULL,
  `sess_lifetime` int unsigned NOT NULL,
  `sess_time` int unsigned NOT NULL,
  PRIMARY KEY (`sess_id`),
  KEY `sess_lifetime_idx` (`sess_lifetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (_binary '23d46f42776bf4c53793f08038fd89f1',_binary '_sf2_attributes|a:4:{s:23:\"_security.last_username\";s:17:\"conferencemanager\";s:14:\"_security_main\";s:498:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:4:\"main\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":4:{s:19:\"\0App\\Entity\\User\0id\";i:3;s:25:\"\0App\\Entity\\User\0username\";s:17:\"conferencemanager\";s:22:\"\0App\\Entity\\User\0roles\";a:1:{i:0;s:23:\"ROLE_CONFERENCE_MANAGER\";}s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$9qDdfx3b/CEJ1A/Zyd3XHux4Iuvg9zo5vf3pZ7l0xlrri11BrFk16\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:2:{i:0;s:23:\"ROLE_CONFERENCE_MANAGER\";i:1;s:9:\"ROLE_USER\";}}}\";s:13:\"_csrf/comment\";s:43:\"JfXqdOCId-iWSUKWh5jwZkdReySWH7CJc-T-Ahqv5I8\";s:18:\"_csrf/authenticate\";s:43:\"LuQJg06xLV8--k0ZsNN3ekzzkXPiu2tT6-ADszoxSe0\";}_sf2_meta|a:3:{s:1:\"u\";i:1724254695;s:1:\"c\";i:1724254216;s:1:\"l\";i:0;}',1724256135,1724254695),(_binary '28a0554526cf8971948870b93bb1029e',_binary '_sf2_attributes|a:4:{s:13:\"_csrf/comment\";s:43:\"uJ5WdpvGqxfsRmNYytiKvUoaZVASeMrI48TzlagpGSo\";s:26:\"_security.main.target_path\";s:27:\"http://127.0.0.1:8000/admin\";s:18:\"_csrf/authenticate\";s:43:\"ffXDUbbjv4JiALhF4BaJmNjYRyXiQ_hhl4mnVEYTbIo\";s:23:\"_security.last_username\";s:5:\"admin\";}_sf2_meta|a:3:{s:1:\"u\";i:1723602938;s:1:\"c\";i:1723602066;s:1:\"l\";i:0;}',1723604378,1723602938),(_binary '36b5c6a86bac2c6a9a43672ce60c9923',_binary '_sf2_attributes|a:1:{s:13:\"_csrf/comment\";s:43:\"62-Lv7GEJPwvHCy7YjgG2n77tuCAowtK-F_kkOaea7g\";}_sf2_meta|a:3:{s:1:\"u\";i:1723600056;s:1:\"c\";i:1723600056;s:1:\"l\";i:0;}',1723601497,1723600057),(_binary '78c363be08102a444b4e6af4776348ee',_binary '_sf2_attributes|a:1:{s:13:\"_csrf/comment\";s:43:\"a1jn3eCseNxjLxiNNtdLss8RLarpvuRwy-EEFzRLGGc\";}_sf2_meta|a:3:{s:1:\"u\";i:1723591273;s:1:\"c\";i:1723591273;s:1:\"l\";i:0;}',1723592713,1723591273),(_binary '7f4376b95e7d5ec515fb46c86b573a37',_binary '_sf2_attributes|a:6:{s:23:\"_security.last_username\";s:5:\"admin\";s:14:\"_security_main\";s:459:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:4:\"main\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":4:{s:19:\"\0App\\Entity\\User\0id\";i:2;s:25:\"\0App\\Entity\\User\0username\";s:5:\"admin\";s:22:\"\0App\\Entity\\User\0roles\";a:1:{i:0;s:10:\"ROLE_ADMIN\";}s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$DPXH.3kqZKHU74RCi4fwt.F5BXWCr3qJAZgh5g1l8hLb5mp9ZTChq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}}}\";s:15:\"_csrf/ea-toggle\";s:43:\"3nc2mWUsq7tifPRyWVMguILOke-XsAjoHgsbPRf9uSE\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"MMjG3sYJcnf4MA99f8PsOND7XEordqS3EFhWzA5eqwI\";s:15:\"_csrf/ea-delete\";s:43:\"xaPBN6NCfJSmUXDYu7vdVwIP62t46g3g6qx_5-NVyAE\";s:10:\"_csrf/User\";s:43:\"Zli30se0BOxI0QT-XJPtxX1VGzVtS2OCIFwunkzzcmM\";}_sf2_meta|a:3:{s:1:\"u\";i:1724265246;s:1:\"c\";i:1724262378;s:1:\"l\";i:0;}',1724266686,1724265246),(_binary 'a43cd71e290aeeebf22f2630e5f30d49',_binary '_sf2_attributes|a:6:{s:23:\"_security.last_username\";s:5:\"admin\";s:14:\"_security_main\";s:464:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:4:\"main\";i:2;a:5:{i:0;O:16:\"App\\Entity\\Admin\":4:{s:20:\"\0App\\Entity\\Admin\0id\";i:1;s:26:\"\0App\\Entity\\Admin\0username\";s:5:\"admin\";s:23:\"\0App\\Entity\\Admin\0roles\";a:1:{i:0;s:10:\"ROLE_ADMIN\";}s:26:\"\0App\\Entity\\Admin\0password\";s:60:\"$2y$13$7xVEaQh7wuHXJdDLrlO6Jeuv2rAdU.kwi6wa/.63K16AHpQGbxjoC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}}}\";s:15:\"_csrf/ea-toggle\";s:43:\"kvpYiWKOspi6eRNqvJJWgV91PKiUGOniLv8fxBJSRzQ\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"Bk0fMNWgt8xuWFO1AD4qJjTFjGsYWa8oBi9AhDJGHKI\";s:15:\"_csrf/ea-delete\";s:43:\"jHtv6hVHGulAQvEL2OALQphMIm3a1Wbt87BdrwV-lkk\";s:13:\"_csrf/comment\";s:43:\"wI41_hyhG6SkDZyGkcobYDB7bksgm3ZRCVD4UiM41VQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1723586615;s:1:\"c\";i:1723585346;s:1:\"l\";i:0;}',1723588055,1723586615),(_binary 'a840af658c159d989ae1f1a6cdfd6b80',_binary '_sf2_attributes|a:7:{s:23:\"_security.last_username\";s:5:\"admin\";s:14:\"_security_main\";s:459:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:4:\"main\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":4:{s:19:\"\0App\\Entity\\User\0id\";i:2;s:25:\"\0App\\Entity\\User\0username\";s:5:\"admin\";s:22:\"\0App\\Entity\\User\0roles\";a:1:{i:0;s:10:\"ROLE_ADMIN\";}s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$DPXH.3kqZKHU74RCi4fwt.F5BXWCr3qJAZgh5g1l8hLb5mp9ZTChq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}}}\";s:15:\"_csrf/ea-toggle\";s:43:\"W18qDJjN5mEP5uKjzoAXZOj--jBJfOAXzC6JBCExjv8\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"maxOAvuZ2BmIYiodKMuBG2HmFpAWaCTBkVi1F2D0Ylc\";s:15:\"_csrf/ea-delete\";s:43:\"YJaqNqr-1JbVxEGdG_dkzD8DjDvCW691MkFsxQE8oQ0\";s:16:\"_csrf/Conference\";s:43:\"WQ3wpswAiV6VUsZaLzTiLHgfZ1UWCxX_4sa1GcgUlm8\";s:13:\"_csrf/comment\";s:43:\"i2gtnsPQSNifHDn1NjaUKIEH89AJVKTa9iURGL6WY5M\";}_sf2_meta|a:3:{s:1:\"u\";i:1724262275;s:1:\"c\";i:1724262116;s:1:\"l\";i:0;}',1724263715,1724262275),(_binary 'cb9ab437fc1417fa800a82c2dcd215c1',_binary '_sf2_attributes|a:8:{s:23:\"_security.last_username\";s:5:\"admin\";s:14:\"_security_main\";s:464:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:4:\"main\";i:2;a:5:{i:0;O:16:\"App\\Entity\\Admin\":4:{s:20:\"\0App\\Entity\\Admin\0id\";i:1;s:26:\"\0App\\Entity\\Admin\0username\";s:5:\"admin\";s:23:\"\0App\\Entity\\Admin\0roles\";a:1:{i:0;s:10:\"ROLE_ADMIN\";}s:26:\"\0App\\Entity\\Admin\0password\";s:60:\"$2y$13$t6tQHz..fqA7nGYk13Ndi.9tM4034nsb9HOgnwg5htXmnucLR3aV6\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}}}\";s:15:\"_csrf/ea-toggle\";s:43:\"nM5BprUuMJ4vD5fFMYFoph_DKNEUTqBwVDl4ahQncBc\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"-TZ2TVZqqScPKnx-i2PS0U0Wtb54Z0Ei7dWemmGRJ2o\";s:15:\"_csrf/ea-delete\";s:43:\"w8abwws42ACy3F3HXbSSV0mwC1vGLkXwGTLqFhUdAs4\";s:13:\"_csrf/Comment\";s:43:\"xt5rSooZNrKztbe69PZ9fpGTIP5ActppMTwsXxJC4x4\";s:16:\"_csrf/Conference\";s:43:\"1CzoyYoJFEk7W8CvZUWFQHrGyw7ZnA68tpElgwNgI90\";s:13:\"_csrf/comment\";s:43:\"4GLiMmBvIAMd3SXYxxsgPvxFAxkxUCmxT8u5_es9hjc\";}_sf2_meta|a:3:{s:1:\"u\";i:1723846645;s:1:\"c\";i:1723845774;s:1:\"l\";i:0;}',1723848085,1723846645),(_binary 'f51bf70af0956ddbb686e9b41816064f',_binary '_sf2_attributes|a:6:{s:23:\"_security.last_username\";s:6:\"admin2\";s:14:\"_security_main\";s:706:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:4:\"main\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:19:\"\0App\\Entity\\User\0id\";i:2;s:25:\"\0App\\Entity\\User\0username\";s:5:\"admin\";s:22:\"\0App\\Entity\\User\0roles\";a:1:{i:0;s:10:\"ROLE_ADMIN\";}s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$2z4sJ533xVYJHluCJHiTl.UV63em8p/QIC/26OzV9dAMEd6ilt05e\";s:25:\"\0App\\Entity\\User\0comments\";O:33:\"Doctrine\\ORM\\PersistentCollection\":2:{s:13:\"\0*\0collection\";O:43:\"Doctrine\\Common\\Collections\\ArrayCollection\":1:{s:53:\"\0Doctrine\\Common\\Collections\\ArrayCollection\0elements\";a:0:{}}s:14:\"\0*\0initialized\";b:0;}}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}}}\";s:15:\"_csrf/edit_user\";s:43:\"cNBKIhyOq1EGSSzgZEJz3WYcA5AWu40Zin3kpm8_tzs\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"f231XjXx1evWeb-KkDCQU3Ewou5FTXT6kTMcCnjvYCU\";s:15:\"_csrf/ea-delete\";s:43:\"HkHXjIxm4Gu74xHNFiupCGtnfYoDnDbdr2xhtQkYjo8\";s:13:\"_csrf/comment\";s:43:\"L1hSQCS6_j-405XJCkowSvIPjTo6GPNXcgGp0f4QEpY\";}_sf2_meta|a:3:{s:1:\"u\";i:1724275311;s:1:\"c\";i:1724273200;s:1:\"l\";i:0;}',1724276751,1724275311);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Leo','[\"ROLE_ADMIN\"]','$2y$13$s13eYwa1/lAQ2NNzDVj3DuVxNHNHUQJUvNkIoDEi8xnRhZWpSSAFO'),(2,'Gonza','[\"ROLE_CONFERENCE_MANAGER\"]','$2y$13$mosPh0Snu6J2RkS1qJVCzeFdzC/e735uVFcJzV7VRtPa/X084ryqe');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-21 21:32:01
