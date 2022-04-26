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
-- Table structure for table `employee_designation`
--

DROP TABLE IF EXISTS `employee_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_designation` (
  `employee_designation_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `designation_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_designation_id`),
  KEY `employee_designation_ibfk_1` (`employee_id`),
  KEY `employee_designation_ibfk_2` (`designation_id`),
  CONSTRAINT `employee_designation_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_designation_ibfk_2` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designation`
--

LOCK TABLES `employee_designation` WRITE;
/*!40000 ALTER TABLE `employee_designation` DISABLE KEYS */;
INSERT INTO `employee_designation` VALUES (1,1,1),(2,2,4),(3,3,9),(4,4,2),(5,5,8),(6,6,15),(7,7,2),(8,8,11),(9,9,15),(10,10,15),(11,11,28),(12,12,6),(13,13,4),(14,14,29),(15,15,8),(16,16,21),(17,17,23),(18,18,22),(19,19,12),(20,20,24),(21,21,6),(22,22,14),(23,23,25),(24,24,27),(25,25,5),(26,26,25),(27,27,20),(28,28,25),(29,29,26),(30,30,8),(31,31,17),(32,32,11),(33,33,16),(34,34,9),(35,35,10),(36,36,25),(37,37,1),(38,38,25),(39,39,29),(40,40,25),(41,41,18),(42,42,23),(43,43,5),(44,44,26),(45,45,23),(46,46,16),(47,47,27),(48,48,9),(49,49,23),(50,50,9),(51,51,23),(52,52,13),(53,53,23),(54,54,20),(55,55,10),(56,56,14),(57,57,30),(58,58,23),(59,59,6),(60,60,7),(61,61,7),(62,62,21),(63,63,13),(64,64,12),(65,65,7),(66,66,3),(67,67,22),(68,68,13),(69,69,18),(70,70,21),(71,71,22),(72,72,3),(73,73,27),(74,74,25),(75,75,20),(76,76,8),(77,77,24),(78,78,27),(79,79,24),(80,80,16),(81,81,22),(82,82,21),(83,83,5),(84,84,29),(85,85,16),(86,86,29),(87,87,25),(88,88,10),(89,89,6),(90,90,21),(91,91,11),(92,92,10),(93,93,6),(94,94,14),(95,95,25),(96,96,30),(97,97,28),(98,98,21),(99,99,10),(100,100,15),(101,101,12);
/*!40000 ALTER TABLE `employee_designation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 23:55:13
