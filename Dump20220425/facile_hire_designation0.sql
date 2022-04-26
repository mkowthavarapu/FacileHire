-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: facile_hire
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `designation_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`designation_id`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'Chief Architect\n','1','2022-04-23 14:50:43',NULL),(2,'Product Manager\n','4','2022-04-23 14:50:43',NULL),(3,'Software Architect\n','2','2022-04-23 14:50:43',NULL),(4,'Engineering Project Manager\n','3','2022-04-23 14:50:43',NULL),(5,'Technical Lead\n','2','2022-04-23 14:50:43',NULL),(6,'Team Lead\n','3','2022-04-23 14:50:43',NULL),(7,'Principal Software Engineer\n','2','2022-04-23 14:50:43',NULL),(8,'Senior Software Engineer\n','1','2022-04-23 14:50:43',NULL),(9,'Senior Software Developer\n','2','2022-04-23 14:50:43',NULL),(10,'Software Engineer\n','2','2022-04-23 14:50:43',NULL),(11,'Software Developer\n','3','2022-04-23 14:50:43',NULL),(12,'Junior Software Developer\n','4','2022-04-23 14:50:43',NULL),(13,'Intern Software Developer\n','1','2022-04-23 14:50:43',NULL),(14,'Technical Project Manager\n','5','2022-04-23 14:50:43',NULL),(15,'Big Data Architect\n','3','2022-04-23 14:50:43',NULL),(16,'Big Data Engineer\n','4','2022-04-23 14:50:43',NULL),(17,'Big Data Specialist\n','4','2022-04-23 14:50:43',NULL),(18,'Data Analysts\n','2','2022-04-23 14:50:43',NULL),(19,'Data Architect\n','2','2022-04-23 14:50:43',NULL),(20,'DevOps Architect\n','5','2022-04-23 14:50:43',NULL),(21,'DevOps Engineer\n','2','2022-04-23 14:50:43',NULL),(22,'ELK Engineer\n','2','2022-04-23 14:50:43',NULL),(23,'Senior DevOps Engineer\n','3','2022-04-23 14:50:43',NULL),(24,'Android Developer\n','5','2022-04-23 14:50:43',NULL),(25,'AWS DevOps Engineer\n','1','2022-04-23 14:50:43',NULL),(26,'AWS Solutions Architect\n','3','2022-04-23 14:50:43',NULL),(27,'Cloud administrator\n','3','2022-04-23 14:50:43',NULL),(28,'Cloud architect\n','3','2022-04-23 14:50:43',NULL),(29,'Cloud automation engineer\n','5','2022-04-23 14:50:43',NULL),(30,'Cloud engineer\n','5','2022-04-23 14:50:43',NULL),(31,'Cloud network engineer\n','4','2022-04-23 14:50:43',NULL),(32,'Cloud Security Engineer\n','1','2022-04-23 14:50:43',NULL),(33,'Data Scientist','4','2022-04-23 14:50:43',NULL);
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 23:55:08
