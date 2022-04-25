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
-- Table structure for table `candidate_designation`
--

DROP TABLE IF EXISTS `candidate_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_designation` (
  `candidate_designation_id` int NOT NULL AUTO_INCREMENT,
  `candidate_id` int DEFAULT NULL,
  `designation_id` int DEFAULT NULL,
  PRIMARY KEY (`candidate_designation_id`),
  KEY `candidate_designation_ibfk_1` (`candidate_id`),
  KEY `candidate_designation_ibfk_2` (`designation_id`),
  CONSTRAINT `candidate_designation_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candidate_designation_ibfk_2` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_designation`
--

LOCK TABLES `candidate_designation` WRITE;
/*!40000 ALTER TABLE `candidate_designation` DISABLE KEYS */;
INSERT INTO `candidate_designation` VALUES (1,204,27),(2,205,15),(3,206,8),(4,207,10),(5,208,14),(6,209,5),(7,210,10),(8,211,21),(9,212,7),(10,213,23),(11,214,26),(12,215,3),(13,216,13),(14,217,12),(15,218,25),(16,219,15),(17,220,23),(18,221,19),(19,222,10),(20,223,13),(21,224,9),(22,225,27),(23,226,15),(24,227,9),(25,228,27),(26,229,24),(27,230,28),(28,231,16),(29,232,22),(30,233,9),(31,234,30),(32,235,9),(33,236,13),(34,237,17),(35,238,30),(36,239,15),(37,240,25),(38,241,1),(39,242,16),(40,243,2),(41,244,7),(42,245,17),(43,246,28),(44,247,22),(45,248,16),(46,249,19),(47,250,12),(48,251,21),(49,252,20),(50,253,12),(51,254,15),(52,255,24),(53,256,28),(54,257,13),(55,258,16),(56,259,19),(57,260,16),(58,261,8),(59,262,26),(60,263,19),(61,264,23),(62,265,6),(63,266,30),(64,267,15),(65,268,29),(66,269,14),(67,270,18),(68,271,10),(69,272,20),(70,273,22),(71,274,11),(72,275,21),(73,276,9),(74,277,22),(75,278,29),(76,279,2),(77,280,19),(78,281,29),(79,282,14),(80,283,23),(81,284,12),(82,285,29),(83,286,29),(84,287,18),(85,288,23),(86,289,5),(87,290,22),(88,291,19),(89,292,6),(90,293,28),(91,294,4),(92,295,26),(93,296,12),(94,297,11),(95,298,29),(96,299,22),(97,300,26),(98,301,28),(99,302,24),(100,303,30);
/*!40000 ALTER TABLE `candidate_designation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24 21:23:27
