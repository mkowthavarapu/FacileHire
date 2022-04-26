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
-- Table structure for table `recruiter_login`
--

DROP TABLE IF EXISTS `recruiter_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruiter_login` (
  `recuriter_login_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `recruiter_id` int NOT NULL,
  PRIMARY KEY (`recuriter_login_id`,`recruiter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruiter_login`
--

LOCK TABLES `recruiter_login` WRITE;
/*!40000 ALTER TABLE `recruiter_login` DISABLE KEYS */;
INSERT INTO `recruiter_login` VALUES (1,'manohar@gmail.com','manohar123','2022-04-05 23:48:16','2022-04-21 23:12:39',1),(102,'stephengarcia@rediff.com','stephengarcia123','2022-04-21 23:23:14',NULL,2),(103,'pamelahughes@outlook.com','pamelahughes123','2022-04-21 23:23:14',NULL,3),(104,'cherylcollins@outlook.com','cherylcollins123','2022-04-21 23:23:14',NULL,4),(105,'michaelmorris@rediff.com','michaelmorris123','2022-04-21 23:23:14',NULL,5),(106,'patriciarobinson@rediff.com','patriciarobinson123','2022-04-21 23:23:14',NULL,6),(107,'johnrobinson@gmail.com','johnrobinson123','2022-04-21 23:23:14',NULL,7),(108,'annbrown@rediff.com','annbrown123','2022-04-21 23:23:14',NULL,8),(109,'stephenmorales@outlook.com','stephenmorales123','2022-04-21 23:23:14',NULL,9),(110,'kylecarter@outlook.com','kylecarter123','2022-04-21 23:23:14',NULL,10),(111,'marycollins@gmail.com','marycollins123','2022-04-21 23:23:14',NULL,11),(112,'ralphmiller@rediff.com','ralphmiller123','2022-04-21 23:23:14',NULL,12),(113,'elizabethcollins@yahoo.com','elizabethcollins123','2022-04-21 23:23:14',NULL,13),(114,'austinrivera@rediff.com','austinrivera123','2022-04-21 23:23:14',NULL,14),(115,'elizabethmorales@rediff.com','elizabethmorales123','2022-04-21 23:23:14',NULL,15),(116,'annrobinson@gmail.com','annrobinson123','2022-04-21 23:23:14',NULL,16),(117,'patriciaflores@rediff.com','patriciaflores123','2022-04-21 23:23:14',NULL,17),(118,'elizabethrivera@outlook.com','elizabethrivera123','2022-04-21 23:23:14',NULL,18),(119,'saragomez@outlook.com','saragomez123','2022-04-21 23:23:14',NULL,19),(120,'frankcruz@yahoo.com','frankcruz123','2022-04-21 23:23:14',NULL,20),(121,'pamelamorris@rediff.com','pamelamorris123','2022-04-21 23:23:14',NULL,21),(122,'lindagomez@rediff.com','lindagomez123','2022-04-21 23:23:14',NULL,22),(123,'jenniferbrown@yahoo.com','jenniferbrown123','2022-04-21 23:23:14',NULL,23),(124,'heatherflores@outlook.com','heatherflores123','2022-04-21 23:23:14',NULL,24),(125,'frankflores@outlook.com','frankflores123','2022-04-21 23:23:14',NULL,25),(126,'michaelgreen@rediff.com','michaelgreen123','2022-04-21 23:23:14',NULL,26),(127,'ralphwilson@gmail.com','ralphwilson123','2022-04-21 23:23:14',NULL,27),(128,'patriciacarter@rediff.com','patriciacarter123','2022-04-21 23:23:14',NULL,28),(129,'heathermorales@rediff.com','heathermorales123','2022-04-21 23:23:14',NULL,29),(130,'kylecollins@rediff.com','kylecollins123','2022-04-21 23:23:14',NULL,30),(131,'cherylcruz@gmail.com','cherylcruz123','2022-04-21 23:23:14',NULL,31),(132,'austinlee@gmail.com','austinlee123','2022-04-21 23:23:14',NULL,32),(133,'robertgomez@outlook.com','robertgomez123','2022-04-21 23:23:14',NULL,33),(134,'elizabethcollins@gmail.com','elizabethcollins123','2022-04-21 23:23:14',NULL,34),(135,'sararamirez@rediff.com','sararamirez123','2022-04-21 23:23:14',NULL,35),(136,'johnsmith@gmail.com','johnsmith123','2022-04-21 23:23:14',NULL,36),(137,'josephhughes@outlook.com','josephhughes123','2022-04-21 23:23:14',NULL,37),(138,'saragreen@rediff.com','saragreen123','2022-04-21 23:23:14',NULL,38),(139,'franklee@yahoo.com','franklee123','2022-04-21 23:23:14',NULL,39),(140,'frankcarter@yahoo.com','frankcarter123','2022-04-21 23:23:14',NULL,40),(141,'heathergomez@rediff.com','heathergomez123','2022-04-21 23:23:14',NULL,41),(142,'jennifercollins@yahoo.com','jennifercollins123','2022-04-21 23:23:14',NULL,42),(143,'stephensmith@outlook.com','stephensmith123','2022-04-21 23:23:14',NULL,43),(144,'michaelflores@outlook.com','michaelflores123','2022-04-21 23:23:14',NULL,44),(145,'jameshoward@gmail.com','jameshoward123','2022-04-21 23:23:14',NULL,45),(146,'heatherwilson@yahoo.com','heatherwilson123','2022-04-21 23:23:14',NULL,46),(147,'saramartin@gmail.com','saramartin123','2022-04-21 23:23:14',NULL,47),(148,'andreacollins@outlook.com','andreacollins123','2022-04-21 23:23:14',NULL,48),(149,'franksmith@rediff.com','franksmith123','2022-04-21 23:23:14',NULL,49),(150,'kylelee@outlook.com','kylelee123','2022-04-21 23:23:14',NULL,50),(151,'austingreen@yahoo.com','austingreen123','2022-04-21 23:23:14',NULL,51),(152,'marthaward@yahoo.com','marthaward123','2022-04-21 23:23:14',NULL,52),(153,'lindabrown@rediff.com','lindabrown123','2022-04-21 23:23:14',NULL,53),(154,'aaronsmith@rediff.com','aaronsmith123','2022-04-21 23:23:14',NULL,54),(155,'elizabethcollins@outlook.com','elizabethcollins123','2022-04-21 23:23:14',NULL,55),(156,'ralphramirez@rediff.com','ralphramirez123','2022-04-21 23:23:14',NULL,56),(157,'michaelwilson@rediff.com','michaelwilson123','2022-04-21 23:23:14',NULL,57),(158,'pamelacampbell@gmail.com','pamelacampbell123','2022-04-21 23:23:14',NULL,58),(159,'sararamirez@yahoo.com','sararamirez123','2022-04-21 23:23:14',NULL,59),(160,'robertcollins@gmail.com','robertcollins123','2022-04-21 23:23:14',NULL,60),(161,'josephrivera@gmail.com','josephrivera123','2022-04-21 23:23:14',NULL,61),(162,'marymorris@gmail.com','marymorris123','2022-04-21 23:23:14',NULL,62),(163,'sararamirez@gmail.com','sararamirez123','2022-04-21 23:23:14',NULL,63),(164,'elizabethrivera@gmail.com','elizabethrivera123','2022-04-21 23:23:14',NULL,64),(165,'austincampbell@outlook.com','austincampbell123','2022-04-21 23:23:14',NULL,65),(166,'ralphcruz@outlook.com','ralphcruz123','2022-04-21 23:23:14',NULL,66),(167,'pamelacollins@outlook.com','pamelacollins123','2022-04-21 23:23:14',NULL,67),(168,'josephrobinson@rediff.com','josephrobinson123','2022-04-21 23:23:14',NULL,68),(169,'michaelmorales@gmail.com','michaelmorales123','2022-04-21 23:23:14',NULL,69),(170,'robertmartin@yahoo.com','robertmartin123','2022-04-21 23:23:14',NULL,70),(171,'kylegomez@gmail.com','kylegomez123','2022-04-21 23:23:14',NULL,71),(172,'elizabethmorris@outlook.com','elizabethmorris123','2022-04-21 23:23:14',NULL,72),(173,'patriciacollins@yahoo.com','patriciacollins123','2022-04-21 23:23:14',NULL,73),(174,'pamelaflores@yahoo.com','pamelaflores123','2022-04-21 23:23:14',NULL,74),(175,'annbrown@gmail.com','annbrown123','2022-04-21 23:23:14',NULL,75),(176,'marywilson@rediff.com','marywilson123','2022-04-21 23:23:14',NULL,76),(177,'maryramirez@outlook.com','maryramirez123','2022-04-21 23:23:14',NULL,77),(178,'maryhughes@yahoo.com','maryhughes123','2022-04-21 23:23:14',NULL,78),(179,'ralphmiller@gmail.com','ralphmiller123','2022-04-21 23:23:14',NULL,79),(180,'frankcampbell@gmail.com','frankcampbell123','2022-04-21 23:23:14',NULL,80),(181,'ralphmartin@gmail.com','ralphmartin123','2022-04-21 23:23:14',NULL,81),(182,'ralphrivera@yahoo.com','ralphrivera123','2022-04-21 23:23:14',NULL,82),(183,'andreamorris@yahoo.com','andreamorris123','2022-04-21 23:23:14',NULL,83),(184,'maryflores@yahoo.com','maryflores123','2022-04-21 23:23:14',NULL,84),(185,'kylemorales@outlook.com','kylemorales123','2022-04-21 23:23:14',NULL,85),(186,'pamelabrown@yahoo.com','pamelabrown123','2022-04-21 23:23:14',NULL,86),(187,'cheryllee@gmail.com','cheryllee123','2022-04-21 23:23:14',NULL,87),(188,'michaelwalker@gmail.com','michaelwalker123','2022-04-21 23:23:14',NULL,88),(189,'heatherbrown@rediff.com','heatherbrown123','2022-04-21 23:23:14',NULL,89),(190,'heatherramirez@gmail.com','heatherramirez123','2022-04-21 23:23:14',NULL,90),(191,'robertramirez@gmail.com','robertramirez123','2022-04-21 23:23:14',NULL,91),(192,'saramorales@rediff.com','saramorales123','2022-04-21 23:23:14',NULL,92),(193,'roberthughes@yahoo.com','roberthughes123','2022-04-21 23:23:14',NULL,93),(194,'frankmorris@outlook.com','frankmorris123','2022-04-21 23:23:14',NULL,94),(195,'lindarobinson@outlook.com','lindarobinson123','2022-04-21 23:23:14',NULL,95),(196,'maryhughes@yahoo.com','maryhughes123','2022-04-21 23:23:14',NULL,96),(197,'robertrobinson@rediff.com','robertrobinson123','2022-04-21 23:23:14',NULL,97),(198,'marthahoward@rediff.com','marthahoward123','2022-04-21 23:23:14',NULL,98),(199,'josephlee@outlook.com','josephlee123','2022-04-21 23:23:14',NULL,99),(200,'lindalee@gmail.com','lindalee123','2022-04-21 23:23:14',NULL,100),(201,'cherylmartin@rediff.com','cherylmartin123','2022-04-21 23:23:14',NULL,101);
/*!40000 ALTER TABLE `recruiter_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 23:55:09
