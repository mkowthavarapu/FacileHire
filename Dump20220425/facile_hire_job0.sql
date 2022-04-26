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
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `requirements` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `roles` text,
  `recruiter_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`job_id`,`recruiter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (14,'Python Developer','Work experience as a Python Developer\r\n• Expertise in at least one popular Python framework (like Django, Flask or Pyramid)\r\n• Knowledge of object-relational mapping (ORM)\r\n• Familiarity with front-end technologies (like JavaScript and HTML5)\r\n• Team spirit\r\n• Good problem-solving skills','2022-04-22 00:48:31','2022-04-22 01:05:04','We are looking for a Python Developer to join our engineering team and help us develop and maintain various software products. Python Developer responsibilities include writing and testing code, debugging programs and integrating applications with third-party web services. To be successful in this role, you should have experience using server-side logic and work well in a team. Ultimately, you’ll build highly responsive web applications that align with our business needs.','Write effective, scalable code\r\n• Develop back-end components to improve responsiveness and overall performance\r\n• Integrate user-facing elements into applications\r\n• Test and debug programs\r\n• Improve functionality of existing systems\r\n• Implement security and data protection solutions\r\n• Assess and prioritize feature requests\r\n• Coordinate with internal teams to understand user requirements and provide technical solutions',1,126799,'open'),(15,'Software Development Engineer AWS','Programming experience with at least one software programming language\r\n•\r\n1+ years of experience in software development\r\n•\r\nFull stack experience is a bonus\r\n•\r\nExperience building complex software systems that have been successfully delivered to customers\r\n•\r\nExperience with distributed systems and web services design and implementation\r\n•\r\nAWS product experience and development on the AWS platform\r\n•\r\nExperience communicating with users, software development engineering teams, management to collect requirements, describe software product features and technical designs\r\n•\r\nHigh sense of ownership, urgency, and drive\r\n•\r\nMeets/exceeds Amazon’s leadership principles requirements for this role','2022-04-25 03:53:05','2022-04-25 04:02:11','Amazon Web Services (AWS) is the world leader in providing a highly reliable, scalable, low-cost infrastructure platform in the cloud that powers hundreds of thousands of businesses in 190 countries around the world\r\n\r\nWe need Developers who move fast, are capable of breaking down and solving complex problems, and have a strong will to get things done. Developers at Amazon work on real world problems on a global scale, own their systems end to end and influence the direction of our technology that impacts hundreds of millions customers around the world.\r\n\r\nThe challenges SDEs solve for at Amazon are big and influence millions of customers, sellers, and products around the world. We are looking for individuals who are passionate about creating new products, features, and services from scratch while managing ambiguity and the pace of a company where development cycles are measured in weeks, not years.','• Collaborate with experienced cross-disciplinary Amazonians to conceive, design, and bring innovative products and services to market.\r\n• Design and build innovative technologies in a large distributed computing environment and help lead fundamental changes in the industry.\r\n• Create solutions to run predictions on distributed systems with exposure to innovative technologies at incredible scale and speed.\r\n• Build distributed storage, index, and query systems that are scalable, fault-tolerant, low cost, and easy to manage/use.\r\n• Design and code the right solutions starting with broadly defined problems.\r\n• Work in an agile environment to deliver high-quality software.',1,144895,'open');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 23:55:14
