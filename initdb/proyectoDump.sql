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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'Leo','Texto de prueba','2024-08-13 19:45:38','418f6fc868152e706e67',2,'asd@gmail.com'),(3,'Gonza','Texto de prueba 2','2024-08-13 19:47:36','b50feb29c7432e706e67',2,'asd2@gmail.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (2,'La Plata','2023',1,'la-plata-2023');
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
INSERT INTO `sessions` VALUES (_binary '55b71e6bf75641cf61fa63136f7012f7',_binary '_sf2_attributes|a:3:{s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"VXbpsppqb5FoG6WXzYSgLtYev_efiRCqVwTBmnjnEZ8\";s:15:\"_csrf/ea-delete\";s:43:\"uvhy6rHDApMgAnIwCXDsXGKqFZvLOEl-YtIOxw74zMs\";s:16:\"_csrf/Conference\";s:43:\"03oZwMNdkWuk0SO1BvkrZ0kI8hWcGb0XLizDCXHgkpA\";}_sf2_meta|a:3:{s:1:\"u\";i:1723517530;s:1:\"c\";i:1723517055;s:1:\"l\";i:0;}',1723518970,1723517530),(_binary '55d1f8154e572537e271cf6c610bee32',_binary '_sf2_attributes|a:6:{s:13:\"_csrf/comment\";s:43:\"E1DFElMoC9t7RjAsBlFtWXGohgHNISlH_ecfwf2sCyg\";s:15:\"_csrf/ea-toggle\";s:43:\"SnmRKxh7TV4QiNG3b3ev9euET50CwiY1uzRRV7RQ0f8\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"3PaJQQx8-ZtC-hoy785Dw3_qbf-aJfaNx_rm0RO7bOo\";s:15:\"_csrf/ea-delete\";s:43:\"k7Z0FeEFK9A2xIL-fOqHzPC5ggXywXBxrgdThBSRvd8\";s:13:\"_csrf/Comment\";s:43:\"bx8NBzr13RSxs2JiqeOvxXRaxJNxk9KbWmTl9N2Iugc\";s:16:\"_csrf/Conference\";s:43:\"fSx2iUMTjJj2Poo2PON6AkmaSPdEQIh6OCd3oMJHMMM\";}_sf2_meta|a:3:{s:1:\"u\";i:1723581247;s:1:\"c\";i:1723578000;s:1:\"l\";i:0;}',1723582687,1723581247),(_binary 'ec3b8406e07da71bf37788b94aaafeb3',_binary '_sf2_attributes|a:6:{s:15:\"_csrf/ea-toggle\";s:43:\"NabY9j0CgpqALhTv2ENI15MCfYdRDNx8eybjPiSRVZE\";s:33:\"_csrf/ea-batch-action-batchDelete\";s:43:\"oNaX3qEQmrJD8whERMgpcESxoBW-lAb_G_DWNxXeCbA\";s:15:\"_csrf/ea-delete\";s:43:\"kaBCuU-SNeDpUXiiAxclQnV10UsKs3fhIj-UHB0C7Wg\";s:13:\"_csrf/Comment\";s:43:\"_GQju1jU2pUj5qTBMT1aWXNMbi3ZV3mrfJdCPJEF0SE\";s:16:\"_csrf/Conference\";s:43:\"mEh9DEgd8ACLCnWPBPmdpN5F-HkJbMw_2FB2bAdjJes\";s:13:\"_csrf/comment\";s:43:\"2FU9knpe8sUTwQltwW2f4gAP-d17lcgcFVI0lAGYLqU\";}_sf2_meta|a:3:{s:1:\"u\";i:1723519890;s:1:\"c\";i:1723519644;s:1:\"l\";i:0;}',1723521330,1723519890);
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

-- Dump completed on 2024-08-13 20:40:35
