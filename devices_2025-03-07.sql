-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: devices
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admin_login_device`
--

DROP TABLE IF EXISTS `admin_login_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_login_device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `platform` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manufacturer` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `build_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fcm_token` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `admin_id_2` (`admin_id`,`device_id`) USING BTREE,
  KEY `isActive` (`isActive`),
  CONSTRAINT `admin_login_device_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users`.`admin` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_login_device`
--

LOCK TABLES `admin_login_device` WRITE;
/*!40000 ALTER TABLE `admin_login_device` DISABLE KEYS */;
INSERT INTO `admin_login_device` VALUES (1,1,'SKQ1.211202.001',NULL,NULL,'POCO','M2010J19CI',NULL,NULL,'dU4qUbSxSdu8cZW5dvW-hu:APA91bGW0JAlXX3SH_ic8NZKGWeTUB9uGOjEE9xu8zsmJb6CL0ANPbGvKlCvj-CwB8ZC0EtBH5_0_MMb7PJ0WPZRhUVozPJ0ZBhiphv0MswOj_moZ95MvV8',1,'2024-11-18 20:07:24','2025-02-13 22:00:23'),(2,1,'UP1A.230620.001',NULL,NULL,'OPPO','CPH2591',NULL,NULL,'c3ERoKNzQUuw8hC50SXFov:APA91bE2uKwmRCInSTofPb9KVfni_-sOen4pRIKQOn3J7OaBoNv1jMmHvZuXcpypfcV3jVtmr5qjYSLj69Wo17pwoXPokcl0SB7z60G_X3uxfA0U2wVVOmo',1,'2024-11-19 22:02:44','2024-11-27 23:21:05'),(3,2,'RKQ1.201004.002',NULL,NULL,'POCO','M2010J19CI',NULL,NULL,'cl6NGUSbR-qH8sxfxQyP57:APA91bEGMpzUndFDJ-QlYqyD0bz2bijmRgT_IFmXZigWf8dxt2zn3FH1NAX-JCsNEqYM4ocfCgokIlGeJbDQitjJO-hYoxDaahrTj7FHujjvmCnOT-8-PZk',1,'2024-11-23 20:45:32','2025-02-11 09:11:09'),(4,2,'TKQ1.221114.001',NULL,NULL,'Redmi','2201117TI',NULL,NULL,'c2lQIUSiRlGLH1V11JFeeF:APA91bET-RK-QxDyST2N9YSy58Q6txS1Ivnzo2OZpPOEXgxoPKCLp4WNPfaQXy_P9hiWw_zUrSHcwzdqs-OcTWZYG74Se1JTSrbS0q0mQ3Nsl-9_fXMTOeE',1,'2024-12-18 21:48:14','2025-02-05 19:52:24'),(5,2,'SKQ1.211202.001',NULL,NULL,'POCO','M2010J19CI',NULL,NULL,'',0,'2025-02-05 18:29:27','2025-02-13 22:00:06');
/*!40000 ALTER TABLE `admin_login_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_login_device`
--

DROP TABLE IF EXISTS `delivery_login_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_login_device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `platform` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manufacturer` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `build_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fcm_token` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`,`device_id`) USING BTREE,
  KEY `isActive` (`isActive`),
  CONSTRAINT `delivery_login_device_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `users`.`delivery_persons` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_login_device`
--

LOCK TABLES `delivery_login_device` WRITE;
/*!40000 ALTER TABLE `delivery_login_device` DISABLE KEYS */;
INSERT INTO `delivery_login_device` VALUES (1,1,'SKQ1.211202.001',NULL,NULL,'POCO','M2010J19CI',NULL,NULL,'fwezTRdRS7aoSOtcHqSFU_:APA91bFzDtG5BicChpjC5q-eWAp7scHvz72hQzFtVts256ZkGsT1lRB5zIEvmOA0dv9uWriqOkRA0b-DUsJX4TQ-v62mb9vZWNYN9__8kNSVLjNVAKBKzMw',1,'2024-11-18 20:35:22','2025-02-03 14:16:50'),(2,1,'UP1A.230620.001',NULL,NULL,'OPPO','CPH2591',NULL,NULL,'',0,'2024-11-22 18:58:11','2024-11-30 14:20:44');
/*!40000 ALTER TABLE `delivery_login_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_device`
--

DROP TABLE IF EXISTS `login_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `platform` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manufacturer` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `build_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fcm_token` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`device_id`) USING BTREE,
  KEY `isActive` (`isActive`),
  CONSTRAINT `login_device_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_device`
--

LOCK TABLES `login_device` WRITE;
/*!40000 ALTER TABLE `login_device` DISABLE KEYS */;
INSERT INTO `login_device` VALUES (1,1,'SKQ1.211202.001','Android','Xiaomi','POCO','M2010J19CI','1.0.0','1','fKMAH_KKS_6aA_Y_JnVbrq:APA91bF-0Cr89N3n8N4VgARSmszP3os5Hg5YGeLVhaOD78g2HQ0OhXciegTATqhegQy0VkPRVdXDbtWitnfaKZCeWYTKV_Gd5p-6zeYfbCpaqO_IvdqdHMw',1,'2024-11-18 20:05:55','2025-02-13 17:59:18'),(2,1,'UP1A.230620.001',NULL,NULL,'OPPO','CPH2591',NULL,NULL,'fS7Fl2ujQbOxgdPwPPPlBK:APA91bHCi7Cx9nlw08JJm5X37JqYN7WTGUD26hhUw97GT-oumoqco2YPUDSHjWXOy9XmVoyVWaZBfI8dt_ThjfIcdQrx4OTpHz4LAoAQtcJGBxhK-w6UVcE',1,'2024-11-21 14:00:55','2024-11-21 14:00:55'),(3,2,'RKQ1.201004.002',NULL,NULL,'POCO','M2010J19CI',NULL,NULL,'',0,'2024-11-26 09:09:41','2025-01-03 21:23:33'),(4,3,'TKQ1.221114.001',NULL,NULL,'Redmi','2201117TI',NULL,NULL,'',0,'2024-12-05 15:06:44','2024-12-05 15:14:03'),(5,1,'QP1A.190711.020',NULL,NULL,'samsung','SM-M013F',NULL,NULL,'flAFrmJDSP-86HEED52pbs:APA91bFhJkbFWoufDDhhGLN5mAoTbaCSV6M5bGadePMhtu53ohfPf2H_eciCf9ZdDBtvhvDDb3ozuzU5Mg_aDZFqr_5IFZhn62PGWT3rJtCrhIbx84e275k',1,'2025-01-13 16:16:53','2025-01-13 16:16:53'),(6,4,'SKQ1.211202.001','Android','Xiaomi','POCO','M2010J19CI','1.0.0','1','',0,'2025-01-25 15:55:45','2025-01-25 16:22:48'),(7,1,'UP1A.231005.007','Android','samsung','samsung','SM-A055F','1.0.0','1','eG-TnpolTzOV1ImWDgeZZ0:APA91bEnmcjoeFbYmIUiIEWyuXtgXSqSYIwvvo3ZCfvpBOPNO0X50HtBG1i4hqJ6GJ-IB4NroRX5_JVVQIbiFvALx3v4nXz8t4_I_kfJYEDTPuroh43_1c0',1,'2025-01-26 14:16:51','2025-01-31 00:45:58'),(8,4,'UP1A.231005.007','Android','samsung','samsung','SM-A055F','1.0.0','1','',0,'2025-01-27 20:51:34','2025-02-13 18:14:56');
/*!40000 ALTER TABLE `login_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_login_device`
--

DROP TABLE IF EXISTS `vendor_login_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_login_device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `platform` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manufacturer` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `build_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fcm_token` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`device_id`) USING BTREE,
  KEY `isActive` (`isActive`),
  CONSTRAINT `vendor_login_device_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `qfoods`.`restaurant_users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_login_device`
--

LOCK TABLES `vendor_login_device` WRITE;
/*!40000 ALTER TABLE `vendor_login_device` DISABLE KEYS */;
INSERT INTO `vendor_login_device` VALUES (1,1,'UP1A.230620.001',NULL,NULL,'OPPO','CPH2591',NULL,NULL,'fS8oUSviTFyrlDy2fvUL5M:APA91bFdw02698u7zkRdLMoM5ABD8XGgiz3aSiOQHdc_6mHwpU0GETSEAfba7VMRs8onF-0McMM_kgZ0RyUt2hnde4iee7r_yENaOGiLC3f7y0g4QxE28Iw',1,'2024-11-21 21:42:21','2024-11-21 22:31:38'),(2,1,'SKQ1.211202.001',NULL,NULL,'POCO','M2010J19CI',NULL,NULL,'cVx-w4_1ToKbeQw8i7Cykm:APA91bFkGrC3ToVPjuzvQPksROA6nTYyhq1qmIJoNYcwgOlyvWv3GeUuws_D4k9c6CcbackNW2CekAwgsnINmDGsdawxvMC7XqNDnSx00JKmbwyXvpvx9bI',1,'2024-11-23 20:01:08','2025-01-28 14:14:00'),(3,1,'RKQ1.201004.002',NULL,NULL,'POCO','M2010J19CI',NULL,NULL,'',0,'2024-11-30 18:30:57','2024-12-29 19:28:02');
/*!40000 ALTER TABLE `vendor_login_device` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 11:16:49
