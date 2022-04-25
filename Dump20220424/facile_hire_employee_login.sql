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
-- Table structure for table `employee_login`
--

DROP TABLE IF EXISTS `employee_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_login` (
  `employee_login_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`employee_login_id`,`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_login`
--

LOCK TABLES `employee_login` WRITE;
/*!40000 ALTER TABLE `employee_login` DISABLE KEYS */;
INSERT INTO `employee_login` VALUES (1,'kmanohar@gmail.com','kmanohar123','2022-04-05 23:58:12','2022-04-21 12:29:36',1),(2,'jamesmiller@yahoo.com','jamesmiller123','2022-04-21 23:25:09',NULL,2),(3,'robertbrown@gmail.com','robertbrown123','2022-04-21 23:25:09',NULL,3),(4,'elizabethbrown@outlook.com','elizabethbrown123','2022-04-21 23:25:09',NULL,4),(5,'lindamorales@gmail.com','lindamorales123','2022-04-21 23:25:09',NULL,5),(6,'marycampbell@outlook.com','marycampbell123','2022-04-21 23:25:09',NULL,6),(7,'andreabrown@yahoo.com','andreabrown123','2022-04-21 23:25:09',NULL,7),(8,'aaronward@outlook.com','aaronward123','2022-04-21 23:25:09',NULL,8),(9,'josephgarcia@yahoo.com','josephgarcia123','2022-04-21 23:25:09',NULL,9),(10,'kylewilson@gmail.com','kylewilson123','2022-04-21 23:25:09',NULL,10),(11,'anngarcia@outlook.com','anngarcia123','2022-04-21 23:25:09',NULL,11),(12,'jamesbrown@rediff.com','jamesbrown123','2022-04-21 23:25:09',NULL,12),(13,'aaroncruz@rediff.com','aaroncruz123','2022-04-21 23:25:09',NULL,13),(14,'michaelbrown@rediff.com','michaelbrown123','2022-04-21 23:25:09',NULL,14),(15,'heatherlee@rediff.com','heatherlee123','2022-04-21 23:25:09',NULL,15),(16,'patriciacampbell@rediff.com','patriciacampbell123','2022-04-21 23:25:09',NULL,16),(17,'franklee@yahoo.com','franklee123','2022-04-21 23:25:09',NULL,17),(18,'pamelamartin@outlook.com','pamelamartin123','2022-04-21 23:25:09',NULL,18),(19,'stephenwilson@gmail.com','stephenwilson123','2022-04-21 23:25:09',NULL,19),(20,'heatherlee@rediff.com','heatherlee123','2022-04-21 23:25:09',NULL,20),(21,'jenniferward@yahoo.com','jenniferward123','2022-04-21 23:25:09',NULL,21),(22,'sararamirez@rediff.com','sararamirez123','2022-04-21 23:25:09',NULL,22),(23,'elizabethhoward@gmail.com','elizabethhoward123','2022-04-21 23:25:09',NULL,23),(24,'ralphwilson@yahoo.com','ralphwilson123','2022-04-21 23:25:09',NULL,24),(25,'stephenlee@outlook.com','stephenlee123','2022-04-21 23:25:09',NULL,25),(26,'patricialee@outlook.com','patricialee123','2022-04-21 23:25:09',NULL,26),(27,'lindaramirez@outlook.com','lindaramirez123','2022-04-21 23:25:09',NULL,27),(28,'elizabethmorris@rediff.com','elizabethmorris123','2022-04-21 23:25:09',NULL,28),(29,'michaelcruz@gmail.com','michaelcruz123','2022-04-21 23:25:09',NULL,29),(30,'josephcarter@yahoo.com','josephcarter123','2022-04-21 23:25:09',NULL,30),(31,'marthagreen@outlook.com','marthagreen123','2022-04-21 23:25:09',NULL,31),(32,'marthamorris@rediff.com','marthamorris123','2022-04-21 23:25:09',NULL,32),(33,'anngreen@outlook.com','anngreen123','2022-04-21 23:25:09',NULL,33),(34,'heathermiller@outlook.com','heathermiller123','2022-04-21 23:25:09',NULL,34),(35,'aarongomez@rediff.com','aarongomez123','2022-04-21 23:25:09',NULL,35),(36,'austinwalker@outlook.com','austinwalker123','2022-04-21 23:25:09',NULL,36),(37,'josephcollins@yahoo.com','josephcollins123','2022-04-21 23:25:09',NULL,37),(38,'patriciacollins@gmail.com','patriciacollins123','2022-04-21 23:25:09',NULL,38),(39,'andrearobinson@yahoo.com','andrearobinson123','2022-04-21 23:25:09',NULL,39),(40,'josephwalker@yahoo.com','josephwalker123','2022-04-21 23:25:09',NULL,40),(41,'robertcruz@rediff.com','robertcruz123','2022-04-21 23:25:09',NULL,41),(42,'jennifermiller@outlook.com','jennifermiller123','2022-04-21 23:25:09',NULL,42),(43,'josephrobinson@rediff.com','josephrobinson123','2022-04-21 23:25:09',NULL,43),(44,'jenniferbrown@gmail.com','jenniferbrown123','2022-04-21 23:25:09',NULL,44),(45,'ralphcollins@rediff.com','ralphcollins123','2022-04-21 23:25:09',NULL,45),(46,'cherylhughes@yahoo.com','cherylhughes123','2022-04-21 23:25:09',NULL,46),(47,'frankward@outlook.com','frankward123','2022-04-21 23:25:09',NULL,47),(48,'robertwalker@rediff.com','robertwalker123','2022-04-21 23:25:09',NULL,48),(49,'pamelarobinson@rediff.com','pamelarobinson123','2022-04-21 23:25:09',NULL,49),(50,'robertwalker@rediff.com','robertwalker123','2022-04-21 23:25:09',NULL,50),(51,'jennifergarcia@gmail.com','jennifergarcia123','2022-04-21 23:25:09',NULL,51),(52,'kylegarcia@gmail.com','kylegarcia123','2022-04-21 23:25:09',NULL,52),(53,'aaronhughes@gmail.com','aaronhughes123','2022-04-21 23:25:09',NULL,53),(54,'ralphmorales@gmail.com','ralphmorales123','2022-04-21 23:25:09',NULL,54),(55,'kylehughes@rediff.com','kylehughes123','2022-04-21 23:25:09',NULL,55),(56,'ralphgarcia@yahoo.com','ralphgarcia123','2022-04-21 23:25:09',NULL,56),(57,'saramiller@rediff.com','saramiller123','2022-04-21 23:25:09',NULL,57),(58,'sararamirez@yahoo.com','sararamirez123','2022-04-21 23:25:09',NULL,58),(59,'jenniferramirez@gmail.com','jenniferramirez123','2022-04-21 23:25:09',NULL,59),(60,'elizabethramirez@gmail.com','elizabethramirez123','2022-04-21 23:25:09',NULL,60),(61,'pamelalee@rediff.com','pamelalee123','2022-04-21 23:25:09',NULL,61),(62,'marthagomez@rediff.com','marthagomez123','2022-04-21 23:25:09',NULL,62),(63,'heatherbrown@outlook.com','heatherbrown123','2022-04-21 23:25:09',NULL,63),(64,'andreamorris@rediff.com','andreamorris123','2022-04-21 23:25:09',NULL,64),(65,'stephenmorales@yahoo.com','stephenmorales123','2022-04-21 23:25:09',NULL,65),(66,'marthamartin@outlook.com','marthamartin123','2022-04-21 23:25:09',NULL,66),(67,'pamelahoward@outlook.com','pamelahoward123','2022-04-21 23:25:09',NULL,67),(68,'josephhoward@yahoo.com','josephhoward123','2022-04-21 23:25:09',NULL,68),(69,'heatherrobinson@rediff.com','heatherrobinson123','2022-04-21 23:25:09',NULL,69),(70,'andrearamirez@yahoo.com','andrearamirez123','2022-04-21 23:25:09',NULL,70),(71,'josephwilson@yahoo.com','josephwilson123','2022-04-21 23:25:09',NULL,71),(72,'sararobinson@rediff.com','sararobinson123','2022-04-21 23:25:09',NULL,72),(73,'frankrivera@outlook.com','frankrivera123','2022-04-21 23:25:09',NULL,73),(74,'ralphmorris@yahoo.com','ralphmorris123','2022-04-21 23:25:09',NULL,74),(75,'heathersmith@yahoo.com','heathersmith123','2022-04-21 23:25:09',NULL,75),(76,'michaelgreen@gmail.com','michaelgreen123','2022-04-21 23:25:09',NULL,76),(77,'franksmith@yahoo.com','franksmith123','2022-04-21 23:25:09',NULL,77),(78,'josephramirez@yahoo.com','josephramirez123','2022-04-21 23:25:09',NULL,78),(79,'lindacarter@yahoo.com','lindacarter123','2022-04-21 23:25:09',NULL,79),(80,'cherylrivera@outlook.com','cherylrivera123','2022-04-21 23:25:09',NULL,80),(81,'jenniferramirez@yahoo.com','jenniferramirez123','2022-04-21 23:25:09',NULL,81),(82,'saralee@outlook.com','saralee123','2022-04-21 23:25:09',NULL,82),(83,'jennifercarter@outlook.com','jennifercarter123','2022-04-21 23:25:09',NULL,83),(84,'stephenmorales@rediff.com','stephenmorales123','2022-04-21 23:25:09',NULL,84),(85,'lindacollins@rediff.com','lindacollins123','2022-04-21 23:25:09',NULL,85),(86,'jennifercruz@rediff.com','jennifercruz123','2022-04-21 23:25:09',NULL,86),(87,'marywilson@gmail.com','marywilson123','2022-04-21 23:25:09',NULL,87),(88,'kylerobinson@outlook.com','kylerobinson123','2022-04-21 23:25:09',NULL,88),(89,'patriciahoward@gmail.com','patriciahoward123','2022-04-21 23:25:09',NULL,89),(90,'robertgomez@gmail.com','robertgomez123','2022-04-21 23:25:09',NULL,90),(91,'elizabethflores@outlook.com','elizabethflores123','2022-04-21 23:25:09',NULL,91),(92,'patriciagarcia@rediff.com','patriciagarcia123','2022-04-21 23:25:09',NULL,92),(93,'lindamiller@gmail.com','lindamiller123','2022-04-21 23:25:09',NULL,93),(94,'robertmorris@outlook.com','robertmorris123','2022-04-21 23:25:09',NULL,94),(95,'cherylgomez@outlook.com','cherylgomez123','2022-04-21 23:25:09',NULL,95),(96,'andreaflores@rediff.com','andreaflores123','2022-04-21 23:25:09',NULL,96),(97,'cheryllee@rediff.com','cheryllee123','2022-04-21 23:25:09',NULL,97),(98,'martharobinson@outlook.com','martharobinson123','2022-04-21 23:25:09',NULL,98),(99,'andreacampbell@outlook.com','andreacampbell123','2022-04-21 23:25:09',NULL,99),(100,'heatherramirez@outlook.com','heatherramirez123','2022-04-21 23:25:09',NULL,100),(101,'marymorris@outlook.com','marymorris123','2022-04-21 23:25:09',NULL,101);
/*!40000 ALTER TABLE `employee_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24 21:23:21
