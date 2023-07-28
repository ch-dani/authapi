-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: bsc_portal
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bsc_customer`
--

DROP TABLE IF EXISTS `bsc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_customer` (
  `bsc_cust_id` int NOT NULL AUTO_INCREMENT,
  `bsc_cust_u_id` int NOT NULL,
  `bsc_cust_name` varchar(45) NOT NULL,
  `bsc_cust_gender` varchar(45) NOT NULL,
  `bsc_cust_its` int NOT NULL,
  `bsc_cust_dob` date NOT NULL,
  `bsc_cust_jamaat` varchar(45) NOT NULL,
  `bsc_cust_is_minor` int NOT NULL DEFAULT '0',
  `bsc_cust_parent_name` varchar(45) DEFAULT NULL,
  `bsc_cust_parent_email` varchar(100) DEFAULT NULL,
  `bsc_cust_parent_phone` varchar(15) DEFAULT NULL,
  `bsc_cust_added_by` int DEFAULT NULL,
  `bsc_cust_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_cust_updated_by` int DEFAULT NULL,
  `bsc_cust_updated_on` datetime DEFAULT NULL,
  `bsc_cust_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_cust_id`),
  UNIQUE KEY `bsc_cust_its` (`bsc_cust_its`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_customer`
--

LOCK TABLES `bsc_customer` WRITE;
/*!40000 ALTER TABLE `bsc_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsc_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_event`
--

DROP TABLE IF EXISTS `bsc_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_event` (
  `bsc_event_id` int NOT NULL AUTO_INCREMENT,
  `bsc_event_title` text NOT NULL,
  `bsc_event_sport_id` int DEFAULT NULL,
  `bsc_event_gender` varchar(5) NOT NULL,
  `bsc_event_guest_fee` double NOT NULL,
  `bsc_event_no_show_fee` double NOT NULL,
  `bsc_event_seats` int NOT NULL,
  `bsc_event_start_datetime` datetime DEFAULT NULL,
  `bsc_event_end_datetime` datetime DEFAULT NULL,
  `bsc_event_venue` text,
  `bsc_event_part_in_tournament` varchar(3) NOT NULL DEFAULT 'No',
  `bsc_event_list_of_captains` text,
  `bsc_event_background` text,
  `bsc_event_signup_starts` int DEFAULT NULL,
  `bsc_event_signup_ends` int DEFAULT NULL,
  `bsc_event_notify_coordinator` int DEFAULT NULL,
  `bsc_event_is_recurring` varchar(3) NOT NULL DEFAULT 'no',
  `bsc_event_added_by` int NOT NULL,
  `bsc_event_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_event_updated_by` int DEFAULT NULL,
  `bsc_event_updated_on` datetime DEFAULT NULL,
  `bsc_event_status` int NOT NULL DEFAULT '2' COMMENT '1=publish, 2=draft, 0=deleted',
  PRIMARY KEY (`bsc_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_event`
--

LOCK TABLES `bsc_event` WRITE;
/*!40000 ALTER TABLE `bsc_event` DISABLE KEYS */;
INSERT INTO `bsc_event` VALUES (1,'Marathon',NULL,'Both',100,0,200,'2023-06-15 09:00:00','2023-06-15 14:00:00','12340 Boggy Creek Road, Orlando, FL, USA','No','','event_bg_marathon.jpg',24,2,48,'yes',5,'2023-06-01 07:38:30',NULL,NULL,2),(2,'Marathon 1',NULL,'Both',30,0,50,'2023-07-04 08:00:00','2023-07-04 12:00:00','12345 North Lamar Boulevard, Austin, TX, USA','Yes','John, Mike, Williams, Jonathan','event_bg_marathon.jpg',12,2,24,'no',5,'2023-06-27 04:27:04',NULL,NULL,2);
/*!40000 ALTER TABLE `bsc_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_event_has_team`
--

DROP TABLE IF EXISTS `bsc_event_has_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_event_has_team` (
  `bsc_eht_id` int NOT NULL AUTO_INCREMENT,
  `bsc_eht_event_id` int NOT NULL,
  `bsc_eht_team_id` int NOT NULL,
  `bsc_eht_added_by` int NOT NULL,
  `bsc_eht_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_eht_updated_by` int DEFAULT NULL,
  `bsc_eht_updated_on` datetime DEFAULT NULL,
  `bsc_eht_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_eht_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_event_has_team`
--

LOCK TABLES `bsc_event_has_team` WRITE;
/*!40000 ALTER TABLE `bsc_event_has_team` DISABLE KEYS */;
INSERT INTO `bsc_event_has_team` VALUES (2,2,3,5,'2023-06-28 08:56:29',NULL,NULL,1),(3,2,4,5,'2023-06-28 08:56:29',NULL,NULL,1);
/*!40000 ALTER TABLE `bsc_event_has_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_jamaat`
--

DROP TABLE IF EXISTS `bsc_jamaat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_jamaat` (
  `bsc_jamaat_id` int NOT NULL AUTO_INCREMENT,
  `bsc_jamaat_name` text NOT NULL,
  `bsc_jamaat_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_jamaat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_jamaat`
--

LOCK TABLES `bsc_jamaat` WRITE;
/*!40000 ALTER TABLE `bsc_jamaat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsc_jamaat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_recurr_details`
--

DROP TABLE IF EXISTS `bsc_recurr_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_recurr_details` (
  `bsc_rd_id` int NOT NULL AUTO_INCREMENT,
  `bsc_rd_type` varchar(15) DEFAULT 'Monthly',
  `bsc_rd_value` text,
  `bsc_rd_event_id` int DEFAULT NULL,
  `bsc_rd_nos_of_events` varchar(45) DEFAULT NULL,
  `bsc_rd_create` varchar(45) DEFAULT NULL,
  `bsc_rd_start_date` date DEFAULT NULL,
  `bsc_rd_end_date` date DEFAULT NULL,
  `bsc_rd_creation` int DEFAULT NULL,
  PRIMARY KEY (`bsc_rd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_recurr_details`
--

LOCK TABLES `bsc_recurr_details` WRITE;
/*!40000 ALTER TABLE `bsc_recurr_details` DISABLE KEYS */;
INSERT INTO `bsc_recurr_details` VALUES (1,'Weekly','Friday,Saturday',1,NULL,'Date Range','2023-06-15','2023-08-15',72),(2,'Monthly',NULL,2,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bsc_recurr_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_role_module_permission`
--

DROP TABLE IF EXISTS `bsc_role_module_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_role_module_permission` (
  `bsc_rmp_id` int NOT NULL AUTO_INCREMENT,
  `bsc_rmp_ur_id` int NOT NULL,
  `bsc_rmp_m_id` int NOT NULL,
  `bsc_rmp_value` varchar(45) NOT NULL,
  `bsc_rmp_added_by` int NOT NULL,
  `bsc_rmp_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_rmp_updated_by` int DEFAULT NULL,
  `bsc_rmp_updated_on` datetime DEFAULT NULL,
  `bsc_rmp_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_rmp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_role_module_permission`
--

LOCK TABLES `bsc_role_module_permission` WRITE;
/*!40000 ALTER TABLE `bsc_role_module_permission` DISABLE KEYS */;
INSERT INTO `bsc_role_module_permission` VALUES (41,1,1,'[\"r\",\"c\",\"u\",\"d\"]',1,'2023-03-30 01:17:52',NULL,NULL,1),(42,1,2,'[\"r\",\"c\",\"u\",\"d\"]',1,'2023-03-30 01:17:52',NULL,NULL,1),(43,1,3,'[\"r\",\"c\",\"u\",\"d\"]',1,'2023-03-30 01:17:52',NULL,NULL,1),(44,1,4,'[\"r\",\"c\",\"u\",\"d\"]',1,'2023-03-30 01:17:52',NULL,NULL,1),(49,3,1,'[\"r\"]',5,'2023-03-31 11:44:08',NULL,NULL,1),(50,3,2,'[\"r\",\"c\",\"u\",\"d\"]',5,'2023-03-31 11:44:08',NULL,NULL,1),(51,3,3,'[\"r\"]',5,'2023-03-31 11:44:08',NULL,NULL,1),(52,3,4,'[\"r\",\"c\",\"u\",\"d\"]',5,'2023-03-31 11:44:08',NULL,NULL,1),(57,4,1,'[\"r\"]',5,'2023-03-31 11:44:28',NULL,NULL,1),(58,4,2,'[]',5,'2023-03-31 11:44:28',NULL,NULL,1),(59,4,3,'[\"r\"]',5,'2023-03-31 11:44:28',NULL,NULL,1),(60,4,4,'[]',5,'2023-03-31 11:44:28',NULL,NULL,1),(61,5,1,'[\"r\"]',5,'2023-03-31 11:45:02',NULL,NULL,1),(62,5,2,'[]',5,'2023-03-31 11:45:02',NULL,NULL,1),(63,5,3,'[\"r\"]',5,'2023-03-31 11:45:02',NULL,NULL,1),(64,5,4,'[]',5,'2023-03-31 11:45:02',NULL,NULL,1),(65,6,1,'[\"r\"]',5,'2023-03-31 11:45:15',NULL,NULL,1),(66,6,2,'[]',5,'2023-03-31 11:45:15',NULL,NULL,1),(67,6,3,'[\"r\"]',5,'2023-03-31 11:45:15',NULL,NULL,1),(68,6,4,'[]',5,'2023-03-31 11:45:15',NULL,NULL,1),(69,1,5,'[\"r\",\"c\",\"u\",\"d\"]',1,'2023-05-03 10:47:25',NULL,NULL,1),(75,1,6,'[\"r\",\"c\",\"u\",\"d\"]',1,'2023-05-12 03:08:45',NULL,NULL,1),(81,2,1,'[\"r\",\"c\",\"u\",\"d\"]',5,'2023-06-01 11:06:37',NULL,NULL,1),(82,2,2,'[]',5,'2023-06-01 11:06:37',NULL,NULL,1),(83,2,3,'[\"r\",\"c\",\"u\",\"d\"]',5,'2023-06-01 11:06:37',NULL,NULL,1),(84,2,4,'[]',5,'2023-06-01 11:06:37',NULL,NULL,1),(85,2,5,'[\"r\",\"c\",\"u\",\"d\"]',5,'2023-06-01 11:06:37',NULL,NULL,1);
/*!40000 ALTER TABLE `bsc_role_module_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_sport`
--

DROP TABLE IF EXISTS `bsc_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_sport` (
  `bsc_sport_id` int NOT NULL AUTO_INCREMENT,
  `bsc_sport_name` varchar(45) NOT NULL,
  `bsc_sport_signup_fee` double DEFAULT NULL,
  `bsc_sport_recurring_fee_type` varchar(15) NOT NULL DEFAULT 'Monthly',
  `bsc_sport_recurring_fee` double DEFAULT NULL,
  `bsc_sport_short_desc` text,
  `bsc_sport_long_desc` text,
  `bsc_sport_gender` varchar(7) NOT NULL,
  `bsc_sport_second_discount_type` varchar(15) DEFAULT NULL,
  `bsc_sport_second_discount` double DEFAULT NULL,
  `bsc_sport_third_discount_type` varchar(15) DEFAULT NULL,
  `bsc_sport_third_discount` double DEFAULT NULL,
  `bsc_sport_fourth_discount_type` varchar(15) DEFAULT NULL,
  `bsc_sport_fourth_discount` double DEFAULT NULL,
  `bsc_sport_fifth_discount_type` varchar(15) DEFAULT NULL,
  `bsc_sport_fifth_discount` double DEFAULT NULL,
  `bsc_sport_added_by` int NOT NULL,
  `bsc_sport_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_sport_updated_by` int DEFAULT NULL,
  `bsc_sport_updated_on` datetime DEFAULT NULL,
  `bsc_sport_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_sport`
--

LOCK TABLES `bsc_sport` WRITE;
/*!40000 ALTER TABLE `bsc_sport` DISABLE KEYS */;
INSERT INTO `bsc_sport` VALUES (2,'Women Volleyball',20,'Monthly',35,'Burhani Sports Club presents WOMEN&#039;S VOLLEYBALL\r\n\r\nOne of our most popular sports, join us weekly for 6 on 6 three touch volleyball.','','Female','Percentage',10,'Percentage',10,'',NULL,'',NULL,5,'2023-04-28 04:52:44',5,'2023-05-04 07:41:35',1),(4,'Volleyball Men',20,'Monthly',35,'Burhani Sports Club presents MEN&#039;S VOLLEYBALL\r\n\r\nOne of our most popular sports, join us weekly for 6 on 6 three touch volleyball.','','Male','Percentage',10,'Percentage',10,'',NULL,'',NULL,5,'2023-05-04 07:42:57',NULL,'2023-05-04 09:17:12',1);
/*!40000 ALTER TABLE `bsc_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_team`
--

DROP TABLE IF EXISTS `bsc_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_team` (
  `bsc_team_id` int NOT NULL AUTO_INCREMENT,
  `bsc_team_title` varchar(25) NOT NULL,
  `bsc_team_logo` text,
  `bsc_team_color` varchar(25) DEFAULT NULL,
  `bsc_team_added_by` int NOT NULL,
  `bsc_team_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_team_updated_by` int DEFAULT NULL,
  `bsc_team_updated_on` datetime DEFAULT NULL,
  `bsc_team_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_team`
--

LOCK TABLES `bsc_team` WRITE;
/*!40000 ALTER TABLE `bsc_team` DISABLE KEYS */;
INSERT INTO `bsc_team` VALUES (1,'Volleyball Black','team_logo_logo14-new.png','Black',5,'2023-05-03 11:53:10',5,'2023-05-04 02:43:16',0),(2,'Volleyball Red','team_logo_favicon.png','Red',5,'2023-05-04 02:06:10',NULL,'2023-05-04 07:48:13',1),(3,'Volleyball Pink','team_logo_favicon.png','Pink',5,'2023-05-04 02:07:06',NULL,NULL,1),(4,'Marathan Jul 04','team_logo_favicon.png','Blue',5,'2023-06-27 04:27:43',NULL,NULL,1);
/*!40000 ALTER TABLE `bsc_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_team_has_member`
--

DROP TABLE IF EXISTS `bsc_team_has_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_team_has_member` (
  `bsc_thm_id` int NOT NULL AUTO_INCREMENT,
  `bsc_thm_eht_id` int NOT NULL,
  `bsc_thm_user_id` int NOT NULL,
  `bsc_thm_added_by` int NOT NULL,
  `bsc_thm_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_thm_updated_by` int DEFAULT NULL,
  `bsc_thm_updated_on` datetime DEFAULT NULL,
  `bsc_thm_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_thm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_team_has_member`
--

LOCK TABLES `bsc_team_has_member` WRITE;
/*!40000 ALTER TABLE `bsc_team_has_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsc_team_has_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_user`
--

DROP TABLE IF EXISTS `bsc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_user` (
  `bsc_u_id` int NOT NULL AUTO_INCREMENT,
  `bsc_u_ur_id` int NOT NULL,
  `bsc_u_username` varchar(45) DEFAULT NULL,
  `bsc_u_password` varchar(500) NOT NULL,
  `bsc_u_auth_key` varchar(500) DEFAULT NULL,
  `bsc_u_is_verified` int NOT NULL DEFAULT '1',
  `bsc_u_added_by` int DEFAULT NULL,
  `bsc_u_added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bsc_u_updated_by` int DEFAULT NULL,
  `bsc_u_updated_on` datetime DEFAULT NULL,
  `bsc_u_status` int NOT NULL DEFAULT '1',
  `email` varchar(45) DEFAULT NULL,
  `parent_email` varchar(45) DEFAULT NULL,
  `ITS` int NOT NULL DEFAULT '1',
  `DOB` date NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `jamaat` varchar(45) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `name` varchar(405) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `parent_name` varchar(45) DEFAULT NULL,
  `parent_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bsc_u_id`),
  UNIQUE KEY `bsc_u_username` (`bsc_u_username`),
  UNIQUE KEY `parent_email_UNIQUE` (`parent_email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_user`
--

LOCK TABLES `bsc_user` WRITE;
/*!40000 ALTER TABLE `bsc_user` DISABLE KEYS */;
INSERT INTO `bsc_user` VALUES (1,1,'KBizzAdmin','7c4a8d09ca3762af61e59520943dc26494f8941b','',1,1,'2023-03-22 03:44:28',NULL,NULL,1,NULL,NULL,1,'0000-00-00','M','0',NULL,NULL,NULL,NULL,NULL,NULL),(5,1,'BSCAdmin1','7c222fb2927d828af22f592134e8932480637c0d','641c61e111795',1,1,'2023-03-23 07:27:45',1,NULL,1,NULL,NULL,1,'0000-00-00','M','0',NULL,NULL,NULL,NULL,NULL,NULL),(6,1,'hf','7c4a8d09ca3762af61e59520943dc26494f8941b','641c793ac80c4',1,1,'2023-03-23 09:07:22',NULL,NULL,1,NULL,NULL,1,'0000-00-00','M','0',NULL,NULL,NULL,NULL,NULL,NULL),(7,1,'msalim','8cb2237d0679ca88db6464eac60da96345513964','64272a5e38ba6',1,5,'2023-03-31 11:45:50',NULL,NULL,0,NULL,NULL,1,'0000-00-00','M','0',NULL,NULL,NULL,NULL,NULL,NULL),(8,2,'Sports1','7c222fb2927d828af22f592134e8932480637c0d','6478dd130dcfe',1,5,'2023-06-01 11:01:55',NULL,NULL,1,NULL,NULL,1,'0000-00-00','M','0',NULL,NULL,NULL,NULL,NULL,NULL),(9,1,'John Doe','$2y$10$JpaAC7bdPXFZizEia21Qb.hCZ97vCtX0WGKtS4KjTM1MQMbtLlLru',NULL,1,NULL,'2023-07-11 16:49:29',NULL,NULL,1,NULL,'johndoe@example.com',153626,'1990-01-01','M','12345','2023-07-11','2023-07-11',NULL,NULL,NULL,NULL),(11,1,NULL,'$2y$10$o8INWesrWShi3P5sSwZr7uhIiw9EL2AII5UcrYcjb70y0a.d.2r2y',NULL,1,NULL,'2023-07-11 16:58:05',NULL,NULL,1,'johndoe1@example.com','johndoe1@example.com',152626,'1990-01-01','M','12345','2023-07-11','2023-07-11','John Doe',NULL,NULL,NULL),(12,1,NULL,'$2y$10$R.pol/ATGd.f5QaKtPgAoe9ErgvFTjz4WftJZVBhnxwXSR/CPCF7O',NULL,1,NULL,'2023-07-11 17:30:30',NULL,NULL,1,'johndoe2@example.com',NULL,152636,'1990-01-01','M','12345','2023-07-11','2023-07-11','John Doe','$2y$10$R.pol/ATGd.f5QaKtPgAoe9ErgvFTjz4WftJZVBhnxwXSR/CPCF7O',NULL,NULL),(39,1,NULL,'$2y$10$l/X8v9bxTP21GnvtrPFyouWQNZn6evS0rRbxsPbICW0f9PI89Gwp2',NULL,1,NULL,'2023-07-13 09:39:16',NULL,NULL,1,'ranamzulqarnain1@gmail.com','gdgdg@gmail.com',152666,'1990-01-01','M','12345','2023-07-13','2023-07-13','John Doe',NULL,'hdhgs','636363673');
/*!40000 ALTER TABLE `bsc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_user_role`
--

DROP TABLE IF EXISTS `bsc_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_user_role` (
  `bsc_ur_id` int NOT NULL AUTO_INCREMENT,
  `bsc_ur_name` varchar(20) NOT NULL,
  `bsc_ur_color` varchar(25) DEFAULT NULL,
  `bsc_ur_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`bsc_ur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_user_role`
--

LOCK TABLES `bsc_user_role` WRITE;
/*!40000 ALTER TABLE `bsc_user_role` DISABLE KEYS */;
INSERT INTO `bsc_user_role` VALUES (1,'Administrator','primary',1),(2,'Coordinator','info',1),(3,'Account','warning',1),(4,'Digital Marketing','success',1),(5,'Member',NULL,1),(6,'Subscriber',NULL,1);
/*!40000 ALTER TABLE `bsc_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (3,'App\\Models\\User',11,'authToken','d7844f8871ce13d73ce869f9e85a333ba089deff4c3d65eb5fb90534a912eef4','[\"*\"]',NULL,NULL,'2023-07-11 06:58:05','2023-07-11 06:58:05'),(4,'App\\Models\\User',12,'authToken','c794d0812b882a1ca39a65aef64a9e1f9dd4a1a5361813b90e0eb3e136fa013b','[\"*\"]',NULL,NULL,'2023-07-11 07:30:30','2023-07-11 07:30:30'),(5,'App\\Models\\User',13,'authToken','796db4b75fc3665dcc4445d62a69c2a028cb3f439ff9417fd5be6ee1bca25d98','[\"*\"]',NULL,NULL,'2023-07-11 23:38:34','2023-07-11 23:38:34'),(6,'App\\Models\\User',14,'authToken','33a6db36e6b28c4a9bf268fbd9415ec3de956bc193aa5e1cb350a3f82cdf8456','[\"*\"]',NULL,NULL,'2023-07-11 23:42:48','2023-07-11 23:42:48'),(7,'App\\Models\\User',15,'authToken','abb8c69196097bbeaca676d6260d5af96d9447291a7d27a330f2021460a1d72b','[\"*\"]',NULL,NULL,'2023-07-11 23:46:44','2023-07-11 23:46:44'),(8,'App\\Models\\User',16,'authToken','e7386e0c5be072c9310b8d669200933beb84ef0cdef26f1af9ed03591aff6bfe','[\"*\"]',NULL,NULL,'2023-07-12 00:14:03','2023-07-12 00:14:03'),(9,'App\\Models\\User',17,'authToken','73815c5c92c8d1b7edf860113cfe43da849e17be55e9f9cd6cea3f2cb61c6e4a','[\"*\"]',NULL,NULL,'2023-07-12 00:30:10','2023-07-12 00:30:10'),(10,'App\\Models\\User',18,'authToken','63918835703f25def423579f33a57561418f89ef39b4ab274baca8ced16b16ed','[\"*\"]',NULL,NULL,'2023-07-12 00:31:38','2023-07-12 00:31:38'),(11,'App\\Models\\User',19,'authToken','f6aa2aa2bbbbb155206cb894aa9606873e6994c9d77625e0468341624a14fbf5','[\"*\"]',NULL,NULL,'2023-07-12 01:34:09','2023-07-12 01:34:09'),(12,'App\\Models\\User',20,'authToken','afde69c3664bae8b704fd8b79f0c35d5f15b86d9db4507ee4515148c8d20c8f3','[\"*\"]',NULL,NULL,'2023-07-12 01:37:37','2023-07-12 01:37:37'),(13,'App\\Models\\User',21,'authToken','1634218c6b844659497a5b5b409e67b79ad8b2a814344c39fd0639f0048d6059','[\"*\"]',NULL,NULL,'2023-07-12 01:53:11','2023-07-12 01:53:11'),(14,'App\\Models\\User',22,'authToken','d476fa782b8c97b1529c1b1193b0b56ff5db427c6224e477b246e372f011c475','[\"*\"]',NULL,NULL,'2023-07-12 01:54:01','2023-07-12 01:54:01'),(15,'App\\Models\\User',23,'authToken','42a5e72a5d5d31fb8530ea56ee43df06c0597e7c3436909a9395cfe9a9649821','[\"*\"]',NULL,NULL,'2023-07-12 01:56:44','2023-07-12 01:56:44'),(16,'App\\Models\\User',24,'authToken','ffab6f1f18f57b022e52b996ca7e5882a23d2fd4477d531002bd35e6769e838b','[\"*\"]',NULL,NULL,'2023-07-12 01:58:07','2023-07-12 01:58:07'),(17,'App\\Models\\User',25,'authToken','2ce54c23399943178379698d5fb57280b3a9cf62522e8a0a32a3ccfbebdb13fb','[\"*\"]',NULL,NULL,'2023-07-12 02:08:35','2023-07-12 02:08:35'),(18,'App\\Models\\User',26,'authToken','f9510b86b6d9f63c37511b8a33399d017cf1938e2ed0f5598d3df8e4cbc3e835','[\"*\"]',NULL,NULL,'2023-07-12 02:32:57','2023-07-12 02:32:57'),(19,'App\\Models\\User',27,'authToken','d61116c191c56cbd3c9e6a52c2915e965312a5e4be96416f5b4c4b3d74461e81','[\"*\"]',NULL,NULL,'2023-07-12 02:47:15','2023-07-12 02:47:15'),(20,'App\\Models\\User',28,'authToken','0e2ab3485e96894f846f25cc3a40cdeea38f9a35433d348b991421402afc5c64','[\"*\"]',NULL,NULL,'2023-07-12 02:49:51','2023-07-12 02:49:51'),(21,'App\\Models\\User',29,'authToken','78bd678a8bf5d41095404e41f59863ca1bea72364cf91c319e283fd329417659','[\"*\"]',NULL,NULL,'2023-07-12 02:58:43','2023-07-12 02:58:43'),(22,'App\\Models\\User',30,'authToken','d77e103947d9c44f55ed72f4065fd3345c53c59aaa36db15ba2395e2753a5e79','[\"*\"]',NULL,NULL,'2023-07-12 03:05:52','2023-07-12 03:05:52'),(23,'App\\Models\\User',31,'authToken','3224d75bb89d4c3e18c77507163be1ca96060bc9998b19d58d543fe5703e2b75','[\"*\"]',NULL,NULL,'2023-07-12 11:19:40','2023-07-12 11:19:40'),(24,'App\\Models\\User',32,'authToken','4177de6103f5d99ea42085d838a26a0d581bc892859d614c61476effd1dacec2','[\"*\"]',NULL,NULL,'2023-07-12 11:27:49','2023-07-12 11:27:49'),(25,'App\\Models\\User',33,'authToken','dfef2a3a3a8a5b053dd096d0da6ae5b49fcc287af62f4051132161489e959af0','[\"*\"]',NULL,NULL,'2023-07-12 11:28:58','2023-07-12 11:28:58'),(26,'App\\Models\\User',34,'authToken','79fdd6198567612aa7c1ddf889b5434e9cec4d69f258dfa7462fc3ddc26a2021','[\"*\"]',NULL,NULL,'2023-07-12 11:35:03','2023-07-12 11:35:03'),(27,'App\\Models\\User',35,'authToken','d83f8b458bd9fde8bc84d8b57e0248c168f077f9acb8dde83462fc758ab225a2','[\"*\"]',NULL,NULL,'2023-07-12 11:39:59','2023-07-12 11:39:59'),(28,'App\\Models\\User',36,'authToken','6df5803b19114adbf686fcd62985f91ffb7f19c58fd0ab4ee65c5fe93f5e0d84','[\"*\"]',NULL,NULL,'2023-07-12 12:43:37','2023-07-12 12:43:37'),(29,'App\\Models\\User',37,'authToken','1d55cbdc670be9474e9e2c6d268e012b0b59ab30e6b1767dcecddb0305c95945','[\"*\"]',NULL,NULL,'2023-07-12 13:01:29','2023-07-12 13:01:29'),(30,'App\\Models\\User',38,'authToken','a77323bc8361691e2adc7a059085f18d7849c2550471f4010b42c8a6c43d097e','[\"*\"]',NULL,NULL,'2023-07-12 13:03:43','2023-07-12 13:03:43'),(31,'App\\Models\\User',39,'authToken','d74ea450b81d45fa4996180d4560e0396750a9570ef31dd5427feb638cbd8112','[\"*\"]',NULL,NULL,'2023-07-12 23:39:16','2023-07-12 23:39:16');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_module`
--

DROP TABLE IF EXISTS `sys_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_module` (
  `sys_m_id` int NOT NULL AUTO_INCREMENT,
  `sys_m_name` varchar(20) NOT NULL,
  `sys_m_dirname` varchar(20) NOT NULL,
  `sys_m_icon` varchar(20) DEFAULT NULL,
  `sys_m_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`sys_m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module`
--

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` VALUES (1,'Sports','sport','dribbble',1),(2,'Users','user','users',1),(3,'Events','event','calendar',1),(4,'Orders','order','dollar-sign',1),(5,'Teams','team','users',1);
/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bsc_portal'
--

--
-- Dumping routines for database 'bsc_portal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 16:18:57
