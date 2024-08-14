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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,'admin','[\"ROLE_ADMIN\"]','$2y$13$OMkxZEJRXLywJRC4jhEo7.Xvi4nGQsvDSi75hbRRz3V5SAQESLsF.');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526C604B8382` (`conference_id`),
  CONSTRAINT `FK_9474526C604B8382` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (15,'Leo','Texto de ejemplo','2024-08-14 02:39:47',NULL,5,'asd@gmail.com');
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
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_911533C8989D9B62` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (5,'Amsterdam','2019',1,'amsterdam-2019'),(6,'Paris','2020',0,'paris-2020');
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
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20240809175300','2024-08-09 17:53:09',133),('DoctrineMigrations\\Version20240812224753','2024-08-12 22:48:06',31),('DoctrineMigrations\\Version20240813203845','2024-08-13 20:38:53',38);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES (_binary '28a0554526cf8971948870b93bb1029e',_binary '_sf2_attributes|a:4:{s:13:\"_csrf/comment\";s:43:\"uJ5WdpvGqxfsRmNYytiKvUoaZVASeMrI48TzlagpGSo\";s:26:\"_security.main.target_path\";s:27:\"http://127.0.0.1:8000/admin\";s:18:\"_csrf/authenticate\";s:43:\"ffXDUbbjv4JiALhF4BaJmNjYRyXiQ_hhl4mnVEYTbIo\";s:23:\"_security.last_username\";s:5:\"admin\";}_sf2_meta|a:3:{s:1:\"u\";i:1723602938;s:1:\"c\";i:1723602066;s:1:\"l\";i:0;}',1723604378,1723602938),(_binary '36b5c6a86bac2c6a9a43672ce60c9923',_binary '_sf2_attributes|a:1:{s:13:\"_csrf/comment\";s:43:\"62-Lv7GEJPwvHCy7YjgG2n77tuCAowtK-F_kkOaea7g\";}_sf2_meta|a:3:{s:1:\"u\";i:1723600056;s:1:\"c\";i:1723600056;s:1:\"l\";i:0;}',1723601497,1723600057),(_binary '78c363be08102a444b4e6af4776348ee',_binary '_sf2_attributes|a:1:{s:13:\"_csrf/comment\";s:43:\"a1jn3eCseNxjLxiNNtdLss8RLarpvuRwy-EEFzRLGGc\";}_sf2_meta|a:3:{s:1:\"u\";i:1723591273;s:1:\"c\";i:1723591273;s:1:\"l\";i:0;}',1723592713,1723591273),(_binary 'a43cd71e290aeeebf22f2630e5f30d49',_binary '_sf2_attributes|a:6:{s:23:\"_security.last_username\";s:5:\"admin\";s:14:\"_security_main\";s:464:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:4:\"main\";i:2;a:5:{i:0;O:16:\"App\\Entity\\Admin\":4:{s:20:\"\0App\\Entity\\Admin\0id\";i:1;s:26:\"\0App\\Entity\\Admin\0username\";s:5:\"admin\";s:23:\"\0App\\Entity\\Admin\0roles\";a:1:{i:0;s:10:\"ROLE_ADMIN\";}s:26:\"\0App\\Entity\\Admin\0password\";s:60:\"$2y$13$7xVEaQh7wuHXJdDLrlO6Jeuv2rAdU.kwi6wa/.63K16AHpQGbxjoC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}}}\";s:15:\"_csrf/ea-toggle\";s:43:\"kvpYiWKOspi6eRNqvJJWgV91PKiUGOniLv8fxBJSRzQ\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"Bk0fMNWgt8xuWFO1AD4qJjTFjGsYWa8oBi9AhDJGHKI\";s:15:\"_csrf/ea-delete\";s:43:\"jHtv6hVHGulAQvEL2OALQphMIm3a1Wbt87BdrwV-lkk\";s:13:\"_csrf/comment\";s:43:\"wI41_hyhG6SkDZyGkcobYDB7bksgm3ZRCVD4UiM41VQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1723586615;s:1:\"c\";i:1723585346;s:1:\"l\";i:0;}',1723588055,1723586615);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14  2:40:12