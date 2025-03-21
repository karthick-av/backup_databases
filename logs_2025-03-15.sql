-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: logs
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
-- Table structure for table `otp_logs`
--

DROP TABLE IF EXISTS `otp_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sent` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`,`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_logs`
--

LOCK TABLES `otp_logs` WRITE;
/*!40000 ALTER TABLE `otp_logs` DISABLE KEYS */;
INSERT INTO `otp_logs` VALUES (1,'Nm7HYjfRTbrzExu','8807413622','227233',1,'2024-11-18 20:05:37','2024-11-18 20:05:37'),(2,'eM073DPfboVFOKE','8807413622','423660',1,'2024-11-21 14:00:35','2024-11-21 14:00:35'),(3,'qeGZ43RuaJY0HEh','8807413622','709098',1,'2024-11-23 18:58:03','2024-11-23 18:58:03'),(4,'fvLjRXHNZlsVPi7','7373345834','810120',1,'2024-11-26 09:09:21','2024-11-26 09:09:21'),(5,'paIEfG51cygkCjm','8807413622','475507',1,'2024-11-30 15:59:36','2024-11-30 15:59:36'),(6,'VfeDaPXcLJOMvq2','8807413622','832010',1,'2024-12-03 12:45:24','2024-12-03 12:45:24'),(7,'E8c4l5A0n7JOgQP','8870785952','703835',1,'2024-12-05 15:06:30','2024-12-05 15:06:30'),(8,'DJ3E7jxBqiNoplW','8807413622','908191',1,'2024-12-08 20:00:24','2024-12-08 20:00:24'),(9,'LFVn94tI2EhjcNo','8807413622','848098',1,'2024-12-08 22:51:39','2024-12-08 22:51:39'),(10,'MxJuOFaBWpEjwnH','8807413622','560340',1,'2024-12-17 10:00:50','2024-12-17 10:00:50'),(11,'o8WAbFLnuf3rEt1','8807413622','132833',1,'2024-12-25 20:11:16','2024-12-25 20:11:16'),(12,'NKCQghqy8IoYDtX','8807413622','683887',1,'2024-12-26 14:27:33','2024-12-26 14:27:33'),(13,'5kd84e1xNiyVlvL','8807413622','169010',1,'2024-12-27 13:20:09','2024-12-27 13:20:09'),(14,'KHoQSO1mknsA5we','8807413622','728873',1,'2024-12-30 16:52:43','2024-12-30 16:52:43'),(15,'mhlAMbnWpiJ2DaO','8807413622','927151',1,'2024-12-30 17:38:33','2024-12-30 17:38:33'),(16,'nU7eq15sQ6PFugm','8807413622','575529',1,'2025-01-01 09:32:56','2025-01-01 09:32:56'),(17,'QCApwvyktLh0oPG','8807413622','732618',1,'2025-01-01 20:19:58','2025-01-01 20:19:58'),(18,'GdNi5uTtYj1H2PK','8807413622','301506',1,'2025-01-01 21:20:07','2025-01-01 21:20:07'),(19,'SJvka9NgpyLU2rw','7373345834','771752',1,'2025-01-03 21:23:44','2025-01-03 21:23:44'),(20,'E64KPFt1dxgNcHZ','8807413622','304185',1,'2025-01-05 11:50:54','2025-01-05 11:50:54'),(21,'gGw8tZnhMoHNCaR','8807413622','219261',1,'2025-01-08 22:11:47','2025-01-08 22:11:47'),(22,'ps6gcFbuEmRSKz0','8807413622','889468',1,'2025-01-08 22:16:21','2025-01-08 22:16:21'),(23,'0Urzt6I4dRAPGa3','8807413622','951857',1,'2025-01-13 11:41:11','2025-01-13 11:41:11'),(24,'tn0UGeq4HwXjldy','8807413622','140895',1,'2025-01-13 11:42:44','2025-01-13 11:42:44'),(25,'RNEMpAz6kc7VtKe','8807413622','327339',1,'2025-01-13 11:56:56','2025-01-13 11:56:56'),(26,'ANlSsDyx09Uv5Ze','8807413622','311746',1,'2025-01-13 16:16:27','2025-01-13 16:16:27'),(27,'QDjKmghMy6rXkA3','8807413622','136221',1,'2025-01-13 16:31:29','2025-01-13 16:31:29'),(28,'8Rx9jEpZIcF6XS5','8807413622','714291',1,'2025-01-14 12:06:07','2025-01-14 12:06:07'),(29,'p2xdeA17oCYhZlP','8807413622','768668',1,'2025-01-14 13:07:18','2025-01-14 13:07:18'),(30,'wWyd3vqRbkuoj8S','8807413622','839980',1,'2025-01-14 13:07:57','2025-01-14 13:07:57'),(31,'INLl4AHXrGf3gC9','8807413622','790241',1,'2025-01-17 11:34:14','2025-01-17 11:34:14'),(32,'DX7YvaeLghqSft6','8807413622','338891',1,'2025-01-18 22:38:15','2025-01-18 22:38:15'),(33,'fWUwre3iZ6vtyXn','8807413622','647447',1,'2025-01-18 22:59:19','2025-01-18 22:59:19'),(34,'ArDVcx3I1WR0vjh','8807413622','573754',1,'2025-01-19 23:24:08','2025-01-19 23:24:08'),(35,'bKa5fP0uQTFq84y','8807413622','541764',1,'2025-01-20 23:03:58','2025-01-20 23:03:58'),(36,'OKuUiz0a3Zd5bQx','8807413622','311754',1,'2025-01-22 22:15:46','2025-01-22 22:15:46'),(37,'las6GShjImp3Udq','8807413622','634005',1,'2025-01-22 22:31:24','2025-01-22 22:31:24'),(38,'tbksxihwuG5PcHE','8807413622','835912',1,'2025-01-22 22:33:09','2025-01-22 22:33:09'),(39,'bmtMkyNlPKYgZ1z','8807413622','424361',1,'2025-01-22 23:16:21','2025-01-22 23:16:21'),(40,'r2i9N7mnXPjMAFW','8807413622','877850',1,'2025-01-25 14:26:03','2025-01-25 14:26:03'),(41,'glT5rzv9Ce073VS','8807413622','241046',1,'2025-01-25 14:41:28','2025-01-25 14:41:28'),(42,'n8MfmB4tT7kViPF','8807413622','443202',1,'2025-01-25 14:57:34','2025-01-25 14:57:34'),(43,'G761oUR0S4cOklp','8807413622','957339',1,'2025-01-25 15:29:41','2025-01-25 15:29:41'),(44,'9GUsWEBm28tp4Ir','8807413622','766739',1,'2025-01-25 15:47:48','2025-01-25 15:47:48'),(45,'vIRWEe6d489b5F3','9443827489','412084',1,'2025-01-25 15:54:32','2025-01-25 15:54:32'),(46,'m1qRWUJ7KGxTo3X','8807413622','855872',1,'2025-01-25 16:22:59','2025-01-25 16:22:59'),(47,'0ObVJN71PLjUTSt','8807413622','555139',1,'2025-01-25 22:05:27','2025-01-25 22:05:27'),(48,'TrO8PVCHK1cpFs7','8807413622','477584',1,'2025-01-25 22:11:20','2025-01-25 22:11:20'),(49,'9CVNv0TYU5ZohIM','8807413622','341453',1,'2025-01-26 00:27:32','2025-01-26 00:27:32'),(50,'wlDqMuIebZLfWO9','8807413622','103646',1,'2025-01-26 00:41:18','2025-01-26 00:41:18'),(51,'jvSlYCJPtyMfdgi','8807413622','559598',1,'2025-01-26 14:16:33','2025-01-26 14:16:33'),(52,'iSPVqgurbzREOdF','9443827489','564981',1,'2025-01-27 20:51:19','2025-01-27 20:51:19'),(53,'Thz7eCmJDq3HrAW','8807413622','728152',1,'2025-01-28 22:41:13','2025-01-28 22:41:13'),(54,'Zt9gPjvuAnQz4b3','8807413622','132798',1,'2025-01-29 23:32:12','2025-01-29 23:32:12'),(55,'nxUfdXFYMV0o3QN','8807413622','597667',1,'2025-01-31 00:35:47','2025-01-31 00:35:47'),(56,'BlLQz8R53uevUTD','8807413622','909242',1,'2025-01-31 00:45:41','2025-01-31 00:45:41'),(57,'2Z6jqXnSist893k','8807413622','135150',1,'2025-01-31 23:58:53','2025-01-31 23:58:53'),(58,'5wnxq7M3jOAaU4X','8807413622','165704',1,'2025-02-02 14:44:15','2025-02-02 14:44:15'),(59,'k5g72hZf6Dsj9ow','8807413622','789789',1,'2025-02-02 15:07:42','2025-02-02 15:07:42'),(60,'njGJP6Yvq5Ffbsy','8807413622','390428',1,'2025-02-02 22:39:31','2025-02-02 22:39:31'),(61,'LOis25ZINAeqkbc','9443827489','989819',1,'2025-02-03 14:07:43','2025-02-03 14:07:43'),(62,'k3Fv0WAdGfnKzPO','9443827489','422432',1,'2025-02-05 22:52:42','2025-02-05 22:52:42'),(63,'7myeDhYMsJIlPSL','9443827489','203470',1,'2025-02-06 23:02:48','2025-02-06 23:02:48'),(64,'op0BEu6KZj8Qa5U','9443827489','535649',1,'2025-02-06 23:06:28','2025-02-06 23:06:28'),(65,'1SotA7ex3B8RKET','8807413622','816214',1,'2025-02-08 22:44:15','2025-02-08 22:44:15'),(66,'BpYlc93zaVgysGT','8807413622','602120',1,'2025-02-09 23:16:14','2025-02-09 23:16:14'),(67,'nZBPfCH7L1vcb4m','8807413622','782831',1,'2025-02-10 17:17:01','2025-02-10 17:17:01'),(68,'boVBcqIjKW97SaD','8807413622','353027',1,'2025-02-10 18:23:57','2025-02-10 18:23:57'),(69,'C6qz5Zmj7p2YoQF','8807413622','461245',1,'2025-02-10 19:18:57','2025-02-10 19:18:57'),(70,'RlAZOXBby45fPL8','8807413622','158015',1,'2025-02-11 14:11:12','2025-02-11 14:11:12'),(71,'V0yAvFOm8K2xgZc','8807413622','192317',1,'2025-02-13 17:58:59','2025-02-13 17:58:59'),(72,'YUh0XqnivAJuL1E','9443827489','250349',1,'2025-02-13 18:10:50','2025-02-13 18:10:50');
/*!40000 ALTER TABLE `otp_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_offer_logs`
--

DROP TABLE IF EXISTS `restaurant_offer_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_offer_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `offer_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `background_color` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `is_color` int NOT NULL DEFAULT '1',
  `height` int DEFAULT NULL,
  `search` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `visible` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_offer_logs`
--

LOCK TABLES `restaurant_offer_logs` WRITE;
/*!40000 ALTER TABLE `restaurant_offer_logs` DISABLE KEYS */;
INSERT INTO `restaurant_offer_logs` VALUES (4,1,3,1,'3fe17f27-0729-4862-844f-6c5153fda370.jpg','#021B3A','#FFFFFF',1,150,NULL,0,'2024-12-16 23:35:05','2024-12-16 23:35:05'),(5,1,3,1,'3fe17f27-0729-4862-844f-6c5153fda370.jpg','#021B3A','#FFFFFF',1,242,NULL,0,'2024-12-16 23:35:43','2024-12-16 23:35:43'),(6,1,2,5,'3fe17f27-0729-4862-844f-6c5153fda370.jpg','#021B3A','#FFFFFF',1,242,NULL,0,'2024-12-16 23:36:10','2024-12-16 23:36:10'),(7,2,NULL,NULL,'f84f35aa-bff5-401d-877e-deb504a372cf.jpg','#0C1121','#FFFFFF',1,NULL,NULL,1,'2024-12-16 23:38:28','2024-12-16 23:38:28'),(8,2,3,1,'c889c7e7-c06a-4415-baff-576dbad1b0fd.jpg','#F18F7C','#FFFFFF',1,242,NULL,0,'2024-12-28 15:37:00','2024-12-28 15:37:00'),(9,2,3,1,'c889c7e7-c06a-4415-baff-576dbad1b0fd.jpg','#F18F7C','#FFFFFF',1,242,NULL,1,'2024-12-28 15:40:19','2024-12-28 15:40:19'),(10,2,3,1,'c889c7e7-c06a-4415-baff-576dbad1b0fd.jpg','#F18F7C','#FFFFFF',1,242,NULL,0,'2024-12-28 16:25:26','2024-12-28 16:25:26'),(11,2,3,1,'c3b40f06-895f-41cc-824e-62eb645e69dc.jpg','#252032','#FFFFFF',1,242,NULL,0,'2024-12-31 22:15:10','2024-12-31 22:15:10'),(12,2,3,1,'c3b40f06-895f-41cc-824e-62eb645e69dc.jpg','#252032','#FFFFFF',1,242,NULL,1,'2024-12-31 22:15:15','2024-12-31 22:15:15'),(13,2,3,1,'5931f678-ac09-4ddb-a056-df271c1678d2.jpg','#910D04','#FFFFFF',1,200,NULL,1,'2025-01-01 00:10:15','2025-01-01 00:10:15'),(14,2,3,1,'1fe0a9e9-a114-4595-aa40-7ee8c9038340.png','#F88018','#FFFFFF',1,200,NULL,1,'2025-01-01 20:54:27','2025-01-01 20:54:27'),(15,2,3,1,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#410D0B','#FFFFFF',1,200,NULL,1,'2025-01-01 21:35:21','2025-01-01 21:35:21'),(16,2,3,1,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#000000','#FFFFFF',0,200,NULL,1,'2025-01-02 15:37:54','2025-01-02 15:37:54'),(17,2,3,1,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#000000','#FFFFFF',1,200,NULL,1,'2025-01-02 15:37:59','2025-01-02 15:37:59'),(18,2,4,NULL,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#000000','#FFFFFF',1,200,'tt',1,'2025-01-05 23:12:27','2025-01-05 23:12:27'),(19,2,4,NULL,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#000000','#FFFFFF',1,200,'briyani',1,'2025-01-05 23:12:48','2025-01-05 23:12:48'),(20,2,3,5,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#000000','#FFFFFF',1,200,'briyani',1,'2025-01-05 23:13:35','2025-01-05 23:13:35'),(21,2,4,NULL,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#000000','#FFFFFF',1,200,'briyani',0,'2025-01-10 11:33:55','2025-01-10 11:33:55'),(22,2,4,NULL,'7b6f02f6-f257-4560-861a-fa40c8b0a403.webp','#000000','#FFFFFF',1,200,'briyani',1,'2025-01-10 11:34:00','2025-01-10 11:34:00'),(23,2,4,NULL,'92b634be-67ce-4f28-912a-e154138b7f97.jpg','#E0EFF8','#FFFFFF',0,200,'briyani',1,'2025-01-13 01:27:26','2025-01-13 01:27:26'),(24,2,4,NULL,'cafd879e-e70b-47ca-8a00-90fd0c7011f2.png','#684858','#FFFFFF',1,200,'briyani',1,'2025-01-13 01:38:03','2025-01-13 01:38:03'),(25,2,4,NULL,'df2160a3-77f5-49da-be60-fda272bd133a.jpg','#684858','#FFFFFF',1,200,'briyani',1,'2025-01-13 01:40:16','2025-01-13 01:40:16'),(26,2,4,NULL,'07384002-5c07-43c2-ae48-40aec86157ee.jpg','#32144E','#FFFFFF',1,200,'briyani',1,'2025-01-13 01:50:28','2025-01-13 01:50:28'),(27,2,4,NULL,'07384002-5c07-43c2-ae48-40aec86157ee.jpg','#32144E','#FFFFFF',1,200,'pongal',1,'2025-01-13 01:54:17','2025-01-13 01:54:17'),(28,2,4,NULL,'27e71d99-c7b8-4566-bdff-3ec813f96b6a.jpg','#32144E','#FFFFFF',1,200,'pongal',1,'2025-01-13 01:56:08','2025-01-13 01:56:08'),(29,2,4,NULL,'c54adef7-22d5-451b-b752-f723cfe88eff.jpg','#F8A800','#FFFFFF',1,200,'pongal',1,'2025-01-13 02:05:09','2025-01-13 02:05:09'),(30,2,4,NULL,'37b9e570-608d-48e3-8809-503a8d26d880.jpg','#67178F','#FFFFFF',1,200,'pongal',1,'2025-01-13 02:07:50','2025-01-13 02:07:50'),(31,2,4,NULL,'b53f942a-e7bf-4a5d-8cca-6e86d1cbcbef.jpg','#084869','#FFFFFF',1,200,'pongal',1,'2025-01-13 10:03:06','2025-01-13 10:03:06'),(32,2,4,NULL,'eaa4bb64-ca21-413f-b7d2-e5e8a2080fdf.jpg','#084869','#FFFFFF',1,200,'pongal',1,'2025-02-08 22:46:33','2025-02-08 22:46:33');
/*!40000 ALTER TABLE `restaurant_offer_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-15  4:41:00
