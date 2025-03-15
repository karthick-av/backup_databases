-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: qfoods
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
-- Table structure for table `applied_coupons`
--

DROP TABLE IF EXISTS `applied_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applied_coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`,`coupon_code`) USING BTREE,
  CONSTRAINT `applied_coupons_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `applied_coupons_ibfk_3` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `applied_coupons_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied_coupons`
--

LOCK TABLES `applied_coupons` WRITE;
/*!40000 ALTER TABLE `applied_coupons` DISABLE KEYS */;
INSERT INTO `applied_coupons` VALUES (3,2,1,2,'test','2024-11-18 15:24:20'),(4,21,1,6,'karthik','2025-01-04 18:09:10');
/*!40000 ALTER TABLE `applied_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancel_orders`
--

DROP TABLE IF EXISTS `cancel_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancel_orders` (
  `cancel_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `cancellor_id` varchar(100) NOT NULL,
  `cancellor_name` varchar(100) DEFAULT NULL,
  `cancellor_type` int NOT NULL,
  `cancelled_reason` varchar(500) NOT NULL,
  `cancelled_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cancel_id`),
  KEY `cancellor_type` (`cancellor_type`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `cancel_orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cancel_orders_ibfk_2` FOREIGN KEY (`cancellor_type`) REFERENCES `details`.`user_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancel_orders`
--

LOCK TABLES `cancel_orders` WRITE;
/*!40000 ALTER TABLE `cancel_orders` DISABLE KEYS */;
INSERT INTO `cancel_orders` VALUES (1,16,'3','Aravind Aj',1,'I want to change the order. ','2024-12-05 15:13:44'),(2,43,'4','karthicck',1,'vggggy','2025-01-28 14:11:24');
/*!40000 ALTER TABLE `cancel_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` int NOT NULL,
  `retail_price` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `quantity` (`quantity`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`) USING BTREE,
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (51,4,1,1,35,26,'2025-02-05 22:55:10','2025-02-05 22:55:10'),(126,1,163,2,12,9,'2025-03-13 10:33:37','2025-03-13 10:33:37'),(127,1,164,2,13,10,'2025-03-13 10:33:40','2025-03-13 10:33:40');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items_variants`
--

DROP TABLE IF EXISTS `cart_items_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `item_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `price` int NOT NULL,
  `retail_price` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `variant_id` (`variant_id`),
  KEY `item_id` (`item_id`),
  KEY `cart_id` (`cart_id`) USING BTREE,
  CONSTRAINT `cart_items_variants_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart_items` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_items_variants_ibfk_3` FOREIGN KEY (`variant_id`) REFERENCES `dish_item_variants` (`variant_item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_variants_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items_variants`
--

LOCK TABLES `cart_items_variants` WRITE;
/*!40000 ALTER TABLE `cart_items_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_dishes`
--

DROP TABLE IF EXISTS `coupon_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `item_id` int NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `coupon_id` (`coupon_id`) USING BTREE,
  CONSTRAINT `coupon_dishes_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coupon_dishes_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_dishes`
--

LOCK TABLES `coupon_dishes` WRITE;
/*!40000 ALTER TABLE `coupon_dishes` DISABLE KEYS */;
INSERT INTO `coupon_dishes` VALUES (1,4,1,'2024-11-19 22:39:29');
/*!40000 ALTER TABLE `coupon_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_restaurants`
--

DROP TABLE IF EXISTS `coupon_restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_restaurants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `coupon_id` (`coupon_id`) USING BTREE,
  CONSTRAINT `coupon_restaurants_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coupon_restaurants_ibfk_3` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_restaurants`
--

LOCK TABLES `coupon_restaurants` WRITE;
/*!40000 ALTER TABLE `coupon_restaurants` DISABLE KEYS */;
INSERT INTO `coupon_restaurants` VALUES (1,1,1,'2024-11-18 20:32:38'),(2,5,1,'2024-11-19 22:44:18');
/*!40000 ALTER TABLE `coupon_restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_types`
--

DROP TABLE IF EXISTS `coupon_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`),
  KEY `type_id` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_types`
--

LOCK TABLES `coupon_types` WRITE;
/*!40000 ALTER TABLE `coupon_types` DISABLE KEYS */;
INSERT INTO `coupon_types` VALUES (1,'default','2024-05-11 23:06:27','2024-05-11 23:06:27'),(2,'dishes','2024-05-11 23:06:36','2024-05-11 23:06:36'),(3,'restaurant','2024-05-11 23:06:49','2024-05-11 23:06:49'),(4,'user','2024-07-13 14:27:48','2024-07-13 14:27:48');
/*!40000 ALTER TABLE `coupon_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_users`
--

DROP TABLE IF EXISTS `coupon_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `user_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `coupon_id` (`coupon_id`) USING BTREE,
  CONSTRAINT `coupon_users_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coupon_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_users`
--

LOCK TABLES `coupon_users` WRITE;
/*!40000 ALTER TABLE `coupon_users` DISABLE KEYS */;
INSERT INTO `coupon_users` VALUES (1,6,1,'2024-11-19 22:51:53');
/*!40000 ALTER TABLE `coupon_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `minimum_amount` int NOT NULL,
  `maximum_amount` int NOT NULL,
  `usage_limit` int NOT NULL,
  `usage_limit_per_user` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `type` int DEFAULT NULL,
  `coupon_type` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_type` (`type`),
  KEY `coupon_type` (`coupon_type`),
  KEY `coupon_code` (`coupon_code`,`minimum_amount`,`maximum_amount`,`usage_limit`,`usage_limit_per_user`,`start_time`,`end_time`,`type`,`id`,`is_deleted`) USING BTREE,
  FULLTEXT KEY `coupon_code_2` (`coupon_code`),
  CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`coupon_type`) REFERENCES `coupon_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_type` FOREIGN KEY (`type`) REFERENCES `details`.`types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'HOTSPOT',40,30,100,5,1,'2024-11-18 20:34:00','2024-11-21 20:31:00',1,3,'2024-11-18 15:02:38','2024-11-18 15:02:38',0),(2,'TEST',20,10,50,1,1,'2024-11-18 20:35:00','2024-11-21 20:33:00',1,1,'2024-11-18 15:04:17','2024-11-18 15:04:17',0),(3,'DEFAULT ',20,20,50,1,1,'2024-11-19 22:37:00','2024-11-20 22:34:00',1,1,'2024-11-19 17:05:00','2024-11-19 17:05:00',0),(4,'DISHES',20,20,500,1,1,'2024-11-19 22:41:00','2024-11-21 22:39:00',1,2,'2024-11-19 17:09:29','2024-11-19 17:12:08',0),(5,'RESTAURANT',20,21,500,1,1,'2024-11-19 22:45:00','2024-11-21 22:43:00',1,3,'2024-11-19 17:14:18','2024-11-19 17:20:32',0),(6,'KARTHIK',20,21,1000,2,2,'2025-02-06 22:54:00','2025-02-14 22:52:00',1,4,'2024-11-19 17:21:53','2025-02-06 17:24:13',0);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_duration`
--

DROP TABLE IF EXISTS `delivery_duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_duration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `min_kms` decimal(4,1) NOT NULL,
  `max_kms` decimal(4,1) NOT NULL,
  `min_minutes` int NOT NULL DEFAULT '0',
  `max_minutes` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `min_kms` (`min_kms`,`max_kms`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_duration`
--

LOCK TABLES `delivery_duration` WRITE;
/*!40000 ALTER TABLE `delivery_duration` DISABLE KEYS */;
INSERT INTO `delivery_duration` VALUES (1,0.0,2.0,15,25,'2025-01-06 12:15:00','2025-01-06 12:15:09'),(3,2.1,5.0,30,40,'2025-01-06 12:15:47','2025-01-06 12:15:47'),(4,5.1,8.0,45,55,'2025-01-06 12:16:30','2025-01-06 12:16:30');
/*!40000 ALTER TABLE `delivery_duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_reviews`
--

DROP TABLE IF EXISTS `delivery_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `person_id` int NOT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `review` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `comment` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `order_id` (`order_id`),
  KEY `person_id` (`person_id`),
  KEY `user_id` (`user_id`,`isDeleted`,`rating`) USING BTREE,
  CONSTRAINT `delivery_reviews_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `delivery_reviews_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `users`.`delivery_persons` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `delivery_reviews_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_reviews`
--

LOCK TABLES `delivery_reviews` WRITE;
/*!40000 ALTER TABLE `delivery_reviews` DISABLE KEYS */;
INSERT INTO `delivery_reviews` VALUES (1,4,1,1,4,'','Friendly','2024-11-26 14:56:05','2024-11-26 14:56:05',0),(2,44,4,1,5,'','','2025-01-28 14:17:19','2025-01-28 14:17:19',0),(3,42,1,1,4,'','','2025-02-06 01:18:58','2025-02-06 01:18:58',0);
/*!40000 ALTER TABLE `delivery_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_categories`
--

DROP TABLE IF EXISTS `dish_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `thumbnail_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `thumbnail_height` int NOT NULL DEFAULT '220',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`),
  KEY `category_id` (`category_id`,`isDeleted`) USING BTREE,
  FULLTEXT KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_categories`
--

LOCK TABLES `dish_categories` WRITE;
/*!40000 ALTER TABLE `dish_categories` DISABLE KEYS */;
INSERT INTO `dish_categories` VALUES (11,'Fresh juice','a700693a-05be-4950-92a4-25bf9a22ea4b.jpg','',220,'2024-12-31 14:09:47','2024-12-31 14:11:04',0),(12,'Briyani','c68987aa-7f96-497c-bc3f-ff14346b3774.jpg','f1f17d53-3540-495d-848c-3ba50b0a9942.jpg',220,'2025-01-13 12:41:49','2025-03-11 08:32:49',0),(13,'Milkshake','0351a4d6-f13b-4993-ab7e-586de548be75.jpg','',220,'2025-01-13 12:46:16','2025-02-08 21:43:35',0),(14,'Ice Cream','a28a4247-5e9c-4a96-b934-2e3c72c41d64.jpg','',220,'2025-01-13 12:48:39','2025-02-08 21:44:14',0),(15,'Noodles','c7ca249b-0ef3-42a7-ab05-80302d1de542.jpg','',220,'2025-01-21 23:03:02','2025-02-08 21:42:57',0);
/*!40000 ALTER TABLE `dish_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_categories_items`
--

DROP TABLE IF EXISTS `dish_categories_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_categories_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `item_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `category_id` (`category_id`) USING BTREE,
  CONSTRAINT `dish_categories_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `dish_categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dish_categories_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_categories_items`
--

LOCK TABLES `dish_categories_items` WRITE;
/*!40000 ALTER TABLE `dish_categories_items` DISABLE KEYS */;
INSERT INTO `dish_categories_items` VALUES (20,11,1,'2024-12-31 14:10:18'),(21,11,3,'2024-12-31 14:10:18'),(22,11,11,'2024-12-31 14:10:18'),(23,11,58,'2024-12-31 14:10:18'),(24,11,62,'2024-12-31 14:10:18'),(25,11,103,'2024-12-31 14:10:18'),(26,11,4,'2025-01-13 12:41:34'),(27,11,5,'2025-01-13 12:41:34'),(28,11,6,'2025-01-13 12:41:34'),(29,11,7,'2025-01-13 12:41:34'),(30,11,8,'2025-01-13 12:41:34'),(31,11,10,'2025-01-13 12:41:34'),(32,11,9,'2025-01-13 12:41:34'),(33,11,59,'2025-01-13 12:41:34'),(34,11,60,'2025-01-13 12:41:34'),(35,11,61,'2025-01-13 12:41:34'),(36,12,16,'2025-01-13 12:43:06'),(37,12,77,'2025-01-13 12:43:06'),(38,12,17,'2025-01-13 12:43:42'),(39,12,18,'2025-01-13 12:43:42'),(40,12,76,'2025-01-13 12:43:42'),(41,12,138,'2025-01-13 12:43:42'),(42,13,108,'2025-01-13 12:47:18'),(43,13,116,'2025-01-13 12:47:18'),(44,13,117,'2025-01-13 12:47:18'),(45,13,115,'2025-01-13 12:47:18'),(46,13,114,'2025-01-13 12:47:18'),(47,13,113,'2025-01-13 12:47:18'),(48,13,112,'2025-01-13 12:47:18'),(49,13,111,'2025-01-13 12:47:18'),(50,13,110,'2025-01-13 12:47:18'),(51,13,109,'2025-01-13 12:47:18'),(52,13,107,'2025-01-13 12:47:18'),(53,13,106,'2025-01-13 12:47:18'),(54,13,45,'2025-01-13 12:48:05'),(55,13,46,'2025-01-13 12:48:19'),(56,14,118,'2025-01-13 12:48:59'),(57,14,119,'2025-01-13 12:48:59'),(58,14,120,'2025-01-13 12:48:59'),(59,14,121,'2025-01-13 12:48:59'),(60,14,122,'2025-01-13 12:48:59'),(61,14,123,'2025-01-13 12:48:59'),(62,14,24,'2025-01-13 12:49:41'),(63,14,28,'2025-01-13 12:49:52'),(64,14,25,'2025-01-13 12:50:11');
/*!40000 ALTER TABLE `dish_categories_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_home_categories`
--

DROP TABLE IF EXISTS `dish_home_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_home_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `row_id` int NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `dish_home_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `dish_categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_home_categories`
--

LOCK TABLES `dish_home_categories` WRITE;
/*!40000 ALTER TABLE `dish_home_categories` DISABLE KEYS */;
INSERT INTO `dish_home_categories` VALUES (13,14,1,4,1,'2025-01-13 12:55:04','2025-01-13 12:55:44'),(14,13,1,3,1,'2025-01-13 12:55:04','2025-01-13 12:55:44'),(15,12,1,2,1,'2025-01-13 12:55:04','2025-01-13 12:55:44'),(16,11,1,1,1,'2025-01-13 12:55:04','2025-01-13 12:55:44'),(17,15,1,5,1,'2025-01-21 23:03:10','2025-01-21 23:03:17');
/*!40000 ALTER TABLE `dish_home_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_home_tags`
--

DROP TABLE IF EXISTS `dish_home_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_home_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int NOT NULL,
  `row_id` int NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `dish_home_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `dish_tags` (`tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_home_tags`
--

LOCK TABLES `dish_home_tags` WRITE;
/*!40000 ALTER TABLE `dish_home_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `dish_home_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_item_variants`
--

DROP TABLE IF EXISTS `dish_item_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_item_variants` (
  `variant_item_id` int NOT NULL AUTO_INCREMENT,
  `variant_id` int NOT NULL,
  `dish_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `price` int NOT NULL DEFAULT '0',
  `sale_price` int NOT NULL DEFAULT '0',
  `retail_price` int NOT NULL DEFAULT '0',
  `veg_type` int NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '1',
  `visible` int NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`variant_item_id`),
  KEY `variant_id` (`variant_id`),
  KEY `dish_id` (`dish_id`,`variant_item_id`,`status`) USING BTREE,
  FULLTEXT KEY `name` (`name`,`description`),
  CONSTRAINT `dish_item_variants_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dish_item_variants_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `dish_variants_list` (`variant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_item_variants`
--

LOCK TABLES `dish_item_variants` WRITE;
/*!40000 ALTER TABLE `dish_item_variants` DISABLE KEYS */;
INSERT INTO `dish_item_variants` VALUES (1,1,2,'half','',120,0,100,0,'',1,1,0,'2024-11-19 14:53:58','2024-11-19 14:53:58',0),(2,1,2,'full','',180,0,150,0,'',1,1,0,'2024-11-19 14:53:58','2024-11-19 14:53:58',0),(3,2,3,'Lemon Soda Sweet','',45,50,34,0,'',0,1,0,'2024-11-26 09:07:27','2025-02-15 14:19:58',0),(4,2,3,'Lemon Soda Salt','',45,50,34,0,'',1,1,0,'2024-11-26 09:12:57','2024-12-04 22:58:35',0),(5,2,3,'Lemon Soda Sweet & Salt','',45,50,34,0,'',1,1,0,'2024-11-26 09:13:30','2024-12-25 20:57:50',0),(7,5,20,'BBQ - Quarter','',110,120,85,1,'',1,1,0,'2024-11-29 10:34:02','2024-12-15 23:31:17',0),(11,5,20,'BBQ - Half','',210,220,170,1,'',1,1,0,'2024-11-29 10:53:42','2024-12-15 23:31:24',0),(12,5,20,'BBQ - Full','',420,450,360,1,'',1,1,0,'2024-11-29 10:54:14','2024-12-15 23:31:29',0),(13,7,21,'Crispy Chicken (2Pcs) ','',130,150,102,0,'',1,1,0,'2024-11-29 10:55:31','2024-12-05 13:15:18',0),(14,7,21,'Crispy Chicken (4Pcs) ','',250,280,204,0,'',1,1,0,'2024-11-29 10:56:14','2024-12-05 13:15:39',0),(15,7,21,'Crispy Chicken (8Pcs) ','',500,550,408,0,'',1,1,0,'2024-11-29 10:57:13','2024-12-05 13:15:45',0),(16,15,29,'French Fries - Classic','',45,50,34,0,'',1,1,0,'2024-11-29 19:43:16','2024-11-29 19:43:16',0),(17,15,29,'French Fries - Peri Peri','',55,60,43,0,'',1,1,0,'2024-11-29 19:44:15','2024-12-05 13:18:08',0),(18,15,29,'French Fries - Loaded Cheese','',85,90,68,0,'',1,1,0,'2024-11-29 19:45:27','2024-12-05 13:18:14',0),(19,15,29,'French Fries - Loaded Cheese With Chicken','',110,120,85,0,'',1,1,0,'2024-11-29 19:46:19','2024-12-05 13:18:22',0),(26,19,37,'Classic Maggie','',45,50,34,0,'',1,1,0,'2024-11-29 21:33:16','2024-12-05 13:20:51',0),(27,19,37,'Cheese Maggie','',55,60,43,0,'',1,1,0,'2024-11-29 21:33:36','2024-12-05 13:20:58',0),(28,19,37,'Paneer Bhurji Maggie','',65,70,51,0,'',1,1,0,'2024-11-29 21:34:03','2024-12-05 13:21:04',0),(29,19,37,'Egg Maggie','',65,70,51,0,'',1,1,0,'2024-11-29 21:34:28','2024-12-05 13:21:11',0),(30,31,41,'Corn & Cheese','',65,70,51,0,'',1,1,0,'2024-11-30 14:46:30','2024-11-30 14:52:08',0),(31,31,41,'Mushroom','',75,80,60,0,'',1,1,0,'2024-11-30 14:47:04','2024-12-05 13:23:55',0),(32,31,41,'Paneer','',85,90,68,0,'',1,1,0,'2024-11-30 14:48:21','2024-12-05 13:24:01',0),(35,31,41,'Chicken Cheese','',95,100,77,0,'',1,1,0,'2024-11-30 14:54:34','2024-12-05 13:24:06',0),(36,36,58,'Lemon','',35,40,25,0,'',1,1,0,'2024-12-01 20:25:29','2024-12-01 20:25:29',0),(37,36,58,'Ginger Lemon','',45,50,34,0,'',1,1,0,'2024-12-01 20:26:08','2024-12-01 20:26:08',0),(38,36,58,'Spicy Lemon','',45,50,34,0,'',1,1,0,'2024-12-01 20:26:29','2024-12-01 20:26:29',0),(39,36,58,'Pineapple Lemon','',45,50,34,0,'',1,1,0,'2024-12-01 20:26:42','2024-12-01 20:26:42',0),(40,37,3,'test1111','',20,30,15,0,'',1,1,0,'2024-12-05 00:26:25','2025-02-15 13:40:09',0),(41,37,3,'test2','',30,40,20,0,'',1,1,0,'2024-12-05 00:26:46','2025-02-13 22:00:46',0),(42,38,63,'Classic','',85,95,68,0,'',1,1,0,'2024-12-08 20:30:21','2024-12-19 16:36:58',0),(43,38,63,'Spicy','',95,100,77,0,'',1,1,0,'2024-12-08 20:30:21','2024-12-19 16:37:07',0),(44,38,63,'Mexican','',95,100,77,0,'',1,1,0,'2024-12-08 20:30:21','2024-12-19 16:37:14',0),(45,38,63,'BBQ','',95,100,77,0,'',1,1,0,'2024-12-08 20:30:21','2024-12-19 16:37:20',0),(46,38,63,'Only Meat','',120,130,102,0,'',1,1,0,'2024-12-08 20:30:21','2024-12-19 16:37:27',0),(50,44,67,'Spicy','',160,170,128,0,'',1,1,0,'2024-12-19 15:47:01','2024-12-19 16:38:50',0),(51,44,67,'Mexican','',160,170,128,0,'',1,1,0,'2024-12-19 15:47:26','2024-12-19 16:39:00',0),(52,44,67,'BBQ','',160,170,128,0,'',1,1,0,'2024-12-19 15:47:55','2024-12-19 16:39:09',0),(53,44,67,'Only Chicken','',200,210,162,0,'',1,1,0,'2024-12-19 15:48:15','2024-12-19 16:39:53',0),(54,45,106,'Strawberry(Add on Ice cream) ','',80,90,64,0,'',1,1,0,'2024-12-21 18:37:09','2024-12-21 18:37:09',0),(55,46,107,'Butterscotch(Add on Ice cream) ','',80,90,64,0,'',1,1,0,'2024-12-21 18:46:21','2024-12-21 18:46:21',0),(56,47,108,'Blackcurrant(Add on Ice cream) ','',80,90,64,0,'',1,1,0,'2024-12-21 18:47:11','2024-12-21 18:47:11',0),(57,48,109,'Choco Mocha(Add on Ice cream) ','',80,90,64,0,'',1,1,0,'2024-12-21 18:47:59','2024-12-21 18:47:59',0),(58,49,110,'Cold Boost(Add on Ice cream) ','',80,90,64,0,'',1,1,0,'2024-12-21 18:48:47','2024-12-21 18:48:47',0),(59,50,111,'Choco Oreo(Add on Ice cream) ','',90,100,73,0,'',1,1,0,'2024-12-21 18:49:28','2024-12-21 18:53:12',0),(60,51,112,'Nutty Berry(Add on Ice cream) ','',90,100,73,0,'',1,1,0,'2024-12-21 18:54:22','2024-12-21 18:54:22',0),(61,52,113,'Vanilla(Add on Ice cream) ','',90,100,73,0,'',1,1,0,'2024-12-21 18:55:13','2024-12-21 18:55:13',0),(62,53,114,'Chocolate(Add on Ice cream) ','',90,100,73,0,'',1,1,0,'2024-12-21 18:55:55','2024-12-21 18:55:55',0),(63,54,115,'KitKat(Add on Ice cream) ','',110,120,90,0,'',1,1,0,'2024-12-21 18:57:11','2024-12-21 18:57:11',0),(64,55,116,'Dark Fantasy(Add on Ice cream) ','',110,120,90,0,'',1,1,0,'2024-12-21 18:58:07','2024-12-21 18:58:07',0),(65,56,117,'High Protein(Add on Ice cream) ','',135,140,107,0,'',1,1,0,'2024-12-21 18:59:20','2024-12-21 18:59:54',0);
/*!40000 ALTER TABLE `dish_item_variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`qfoods_admin`@`%`*/ /*!50003 TRIGGER `before_insert_dish_item_variant_set_visible` BEFORE INSERT ON `dish_item_variants` FOR EACH ROW BEGIN
    IF NEW.price = 0 OR NEW.retail_price = 0 THEN
        SET NEW.visible = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`qfoods_admin`@`%`*/ /*!50003 TRIGGER `before_update_dish_item_variant_set_visible` BEFORE UPDATE ON `dish_item_variants` FOR EACH ROW BEGIN
    IF NEW.price = 0 OR NEW.retail_price = 0 THEN
        SET NEW.visible = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dish_items`
--

DROP TABLE IF EXISTS `dish_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_items` (
  `dish_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `price` int NOT NULL DEFAULT '0',
  `sale_price` int NOT NULL DEFAULT '0',
  `retail_price` int NOT NULL DEFAULT '0',
  `veg_type` int DEFAULT '0',
  `max_quantity` int NOT NULL DEFAULT '10',
  `keywords` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '1',
  `visible` int NOT NULL DEFAULT '1',
  `variants` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`dish_id`),
  KEY `restaurant_id` (`restaurant_id`,`dish_id`,`price`,`veg_type`,`status`,`variants`,`max_quantity`,`visible`,`isDeleted`) USING BTREE,
  FULLTEXT KEY `name` (`name`,`description`,`keywords`),
  CONSTRAINT `dish_items_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_items`
--

LOCK TABLES `dish_items` WRITE;
/*!40000 ALTER TABLE `dish_items` DISABLE KEYS */;
INSERT INTO `dish_items` VALUES (1,1,'Lemon juice','Loremm Ipsum is simpy. Lorem Ipsum siy','dc83af33-179c-439d-8128-f95d50213f6b.jpg',35,40,26,0,10,'',1,1,0,'2024-11-18 20:25:46','2025-01-12 16:16:53',0),(2,1,'Country style pizza','','7b8af2ad-2886-4869-af53-68aaebb22623.jpg',130,140,102,1,10,'',1,1,1,'2024-11-19 14:53:57','2024-11-30 14:33:57',0),(3,1,'Lemon soda ','','d760496f-391a-4e91-9be3-dfe4586fc547.jpg',45,50,34,0,10,'',1,1,1,'2024-11-26 09:00:07','2024-11-26 14:29:51',0),(4,1,'Papaya Juice','','58267d4f-d32d-43e8-9001-c047105618ad.jpg',55,60,44,0,10,'',1,1,0,'2024-11-26 10:08:23','2025-02-15 14:23:59',0),(5,1,'Musk melon juice','','053af7d3-78ff-4e79-bf11-c8c7e4a98982.jpg',55,60,44,0,10,'',1,1,0,'2024-11-26 13:41:40','2024-11-26 14:31:42',0),(6,1,'Water melon juice','','e1ae1047-cd64-4b21-b714-37d0cf39baf8.jpg',55,60,44,0,10,'',1,1,0,'2024-11-26 13:44:30','2024-11-26 14:31:54',0),(7,1,'Pineapple juice','','3fcd74de-f9c8-4d61-864a-c48cecac7e17.jpg',65,70,51,0,10,'',1,1,0,'2024-11-26 14:23:10','2024-11-26 14:32:52',0),(8,1,'Mosambi juice','','b3777bca-755e-4dbb-a425-fe51754db16d.jpg',75,80,59,0,10,'',1,1,0,'2024-11-26 14:35:03','2024-11-26 14:37:41',0),(9,1,'Pomegranate juice','','c6a7fc45-6f3b-407d-bcef-7153e96c45c7.jpg',85,90,68,0,10,'',1,1,0,'2024-11-26 14:39:56','2024-11-26 14:39:56',0),(10,1,'Apple juice','','8054a611-3c17-4661-b8b4-88438ee6cb7c.jpg',85,90,68,0,10,'',1,1,0,'2024-11-26 14:41:39','2024-11-26 14:41:39',0),(11,1,'Lemon Mint','','fbb32446-1297-412f-a9e3-7e53eb525c8b.jpg',65,70,54,0,10,'',1,1,0,'2024-11-26 14:56:57','2024-11-26 14:56:57',0),(12,1,'Water melon','','c65b21b2-5355-4d3b-a8c9-119a2a43ff2f.jpg',65,70,54,0,10,'',1,1,0,'2024-11-26 15:02:20','2024-11-26 15:02:20',0),(13,1,'Blue Ocean','','f68e8b48-b616-44bb-a225-3fbeb4792f35.jpg',75,80,59,0,10,'',1,1,0,'2024-11-26 15:04:48','2024-11-26 15:08:17',0),(14,1,'Strawberry ','','7f8a5c4e-1e6b-40ef-978a-1d48a57d655a.jpg',75,80,59,0,10,'',1,1,0,'2024-11-26 15:14:28','2024-11-26 15:14:28',0),(15,1,'Green Apple','','d082a409-7814-4137-a21c-6548d9078691.jpg',85,90,68,0,10,'',1,1,0,'2024-11-26 15:18:23','2024-11-26 15:18:23',0),(16,1,'Plain Biryani','','c68987aa-7f96-497c-bc3f-ff14346b3774.jpg',85,90,68,1,10,'',1,1,0,'2024-11-29 09:50:19','2025-01-13 11:20:46',0),(17,1,'Chicken Biryani','','74f716ea-1d6d-4da7-9ebd-0c186e903fb4.jpg',130,140,102,1,10,'',1,1,0,'2024-11-29 09:55:14','2025-01-13 11:20:51',0),(18,1,'Mohal Biryani - Chicken','','d3df5f0f-a63f-44f3-96bb-533f503002d5.webp',150,160,119,1,10,'',1,1,0,'2024-11-29 09:57:10','2025-01-13 11:20:59',0),(19,1,'Chicken 65 - 100g','','bea318d2-1b61-4534-84be-b5d4f584bd5c.jpg',65,70,51,1,10,'',1,1,0,'2024-11-29 09:59:02','2025-01-13 11:21:04',0),(20,1,'BBQ','','39f46519-add6-4aa9-9f2d-f1b2a7428b0d.jpg',110,120,85,1,10,'',1,1,1,'2024-11-29 10:23:48','2025-01-13 11:21:11',0),(21,1,'Crispy Chicken  ','','73148a05-82f3-45be-ab6b-ca0de73153da.jpg',130,140,102,1,10,'',1,1,1,'2024-11-29 10:44:27','2025-01-13 11:21:19',0),(22,1,'Gulkand Rosemilk','','95abd4f1-65d4-451f-8896-a8000865c0d8.jpg',65,70,51,0,10,'',1,1,0,'2024-11-29 11:00:59','2024-11-29 11:03:13',0),(23,1,'Hotspot Falooda','','0c442a45-b2db-4d84-bf3f-36a72e4417c0.jpg',120,130,94,0,10,'',1,1,0,'2024-11-29 11:05:58','2024-11-29 11:05:58',0),(24,1,'Vanilla ','','a834db35-3f4a-42bc-a6b0-4922ded0b89c.jpg',55,60,44,0,10,'',1,1,0,'2024-11-29 16:13:18','2024-11-29 16:13:18',0),(25,1,'Strawberry','','bebceed9-69cb-4e82-bd60-d3bdaea92f48.jpg',65,70,51,0,10,'',1,1,0,'2024-11-29 16:15:25','2024-11-29 16:15:25',0),(26,1,'Butterscotch','','12f39f59-7243-4a3f-b58c-6fbf0fb99e20.jpg',65,70,51,0,10,'',1,1,0,'2024-11-29 16:17:37','2024-11-29 16:17:37',0),(27,1,'Chocolate','','0bb42b24-a7c0-4d70-b194-301227ff4b0d.jpg',65,70,51,0,10,'',1,1,0,'2024-11-29 16:18:59','2024-11-29 16:18:59',0),(28,1,'Blackcurrant','','a28a4247-5e9c-4a96-b934-2e3c72c41d64.jpg',75,80,59,0,10,'',1,1,0,'2024-11-29 16:20:46','2024-11-29 16:20:46',0),(29,1,'French Fries','','07c31276-1c83-4112-a2af-8ba1198be2cc.jpg',45,50,34,0,10,'',1,1,1,'2024-11-29 19:41:40','2024-12-05 13:19:03',0),(30,1,'Bread Omelette','','24a2a95e-f52f-427a-bcc2-9a6ca5bd4403.png',45,50,34,1,10,'',1,1,0,'2024-11-29 19:53:29','2025-01-13 11:21:29',0),(31,1,'Cheese Balls (5Pcs) ','','a44ced57-42eb-49fb-9b03-7203734ceb62.jpg',55,60,43,0,10,'',1,1,0,'2024-11-29 19:58:16','2024-11-29 19:58:16',0),(32,1,'Chilly Garlic Bread','','98696888-2085-4937-91fd-e50262072f91.jpg',55,60,43,0,10,'',1,1,0,'2024-11-29 20:00:24','2024-11-29 20:00:24',0),(33,1,'Fish Finger (5Pcs) ','','504e0c9b-aa78-4571-a6b6-2fd0ee74fcec.png',150,160,119,1,10,'',1,1,0,'2024-11-29 20:02:08','2025-01-13 11:21:49',0),(34,1,'Crab Lollipop (5pcs) ','','1f4d5511-02ca-438d-80d0-72f0346fb4f4.jpg',150,160,119,1,10,'',1,1,0,'2024-11-29 20:03:55','2025-01-13 11:21:38',0),(35,1,'Veg Fry Momo\'s','','382d18a6-ac33-4e28-8c86-f2e29cc70b0f.jpg',85,90,68,0,10,'',1,1,0,'2024-11-29 20:07:27','2024-11-29 20:10:14',0),(36,1,'Chicken Fry Momo\'s (5Pcs)','','3a7e0cd8-80c7-47c9-a41d-5a16e52d2e26.jpg',110,120,85,1,10,'',1,1,0,'2024-11-29 20:10:03','2025-02-16 13:32:12',0),(37,1,'Maggie','','c7ca249b-0ef3-42a7-ab05-80302d1de542.jpg',45,50,34,0,10,'',1,1,1,'2024-11-29 21:23:38','2024-12-05 13:22:12',0),(38,1,'Veg Burger','','4c873ade-d73c-4be5-a3af-555de70082ef.jpg',65,70,51,0,10,'',1,1,0,'2024-11-30 14:28:30','2024-11-30 14:28:30',0),(39,1,'Chicken Cheese Burger','','d20d7b48-ea69-4ccd-bea4-cfd0447a2fab.jpg',75,80,60,1,10,'',1,1,0,'2024-11-30 14:31:06','2025-01-13 11:23:02',0),(40,1,'BBQ Chicken Pizza','','c2890d25-e31a-4649-a7ce-23ef259de807.jpg',130,140,102,1,10,'',1,1,0,'2024-11-30 14:37:19','2025-01-13 11:20:38',0),(41,1,'Corn & Cheese','','9603205e-3154-487e-bcbc-1e3f0b209f25.jpg',65,70,51,0,10,'',1,1,1,'2024-11-30 14:43:09','2024-11-30 14:43:09',0),(42,1,'Cheese Corn Onion ','','c1dd9a51-47f9-4df4-8d30-1fcc432b2c91.jpg',65,70,51,0,10,'',1,1,0,'2024-11-30 15:00:33','2024-11-30 15:04:50',0),(43,1,'Chicken Wrap','','aa3b50bf-336f-461c-b193-871b6897f8c3.jpg',85,90,68,0,10,'',1,1,0,'2024-11-30 15:03:03','2024-11-30 15:03:03',0),(44,1,'Cold Coffee','','d1503294-359d-48d7-b7e3-1e79976093bf.jpg',65,70,51,0,10,'',1,1,0,'2024-11-30 15:07:19','2024-11-30 15:07:19',0),(45,1,'Strawberry ','','2a6dc14b-6092-44f9-bc17-f0fb4b75a830.jpg',75,80,60,0,10,'',1,1,0,'2024-11-30 15:09:41','2024-11-30 15:10:47',0),(46,1,'Vanilla','','96ad8227-5338-4cd6-b5cb-275935c4ba8d.jpg',75,80,60,0,10,'',1,1,0,'2024-11-30 15:12:35','2024-11-30 15:14:43',0),(47,1,'Dates ','','b9bbe616-7cb1-4235-af4c-05c129b4d41f.jpg',75,80,60,0,10,'',1,1,0,'2024-11-30 15:16:21','2024-11-30 15:16:21',0),(48,1,'Butterscotch ','','b75ce6a3-c645-4429-a6f3-5da9482a986b.png',85,90,68,0,10,'',1,1,0,'2024-11-30 15:55:48','2024-11-30 15:55:48',0),(49,1,'Peanut Butter','','0351a4d6-f13b-4993-ab7e-586de548be75.jpg',85,90,68,0,10,'',1,1,0,'2024-11-30 15:58:20','2024-11-30 15:58:55',0),(50,1,'Chocolate','','356ff970-29ad-4407-9275-5b3a2cb428ec.jpg',85,90,68,0,10,'',1,1,0,'2024-11-30 16:01:16','2024-11-30 16:01:16',0),(51,1,'Bubble Gum shake','','a7f80588-22e6-4e7a-b6bb-2a6f0f68be93.png',85,90,68,0,10,'',1,1,0,'2024-11-30 16:05:18','2024-11-30 16:06:19',0),(52,1,'Black Currant ','','7a8a6a6f-a5b7-46b9-b9aa-33e04944bbd6.jpg',95,100,77,0,10,'',1,1,0,'2024-11-30 16:09:28','2024-11-30 16:10:13',0),(53,1,'Oreo ','','5588ea86-88a5-4d56-914b-cd004c1f3d4b.jpg',95,100,77,0,10,'',1,1,0,'2024-11-30 16:12:16','2024-11-30 16:12:16',0),(54,1,'Dairy Milk','','a1b6a586-65eb-402e-a739-13ccbaa4a160.jpg',95,100,77,0,10,'',1,1,0,'2024-11-30 16:15:00','2024-11-30 16:15:00',0),(55,1,'Kesar Badam','','9940db7c-dd6f-4bb5-bd6c-7b4cf7a30a54.jpg',95,100,77,0,10,'',1,1,0,'2024-11-30 16:16:27','2024-11-30 16:16:27',0),(56,1,'Kitkat','','1b794fd0-3950-490d-92a1-dcb10dd5e912.jpg',95,100,77,0,10,'',1,1,0,'2024-11-30 16:18:30','2024-11-30 16:18:30',0),(57,1,'Protein Shake','','cc082515-53c6-412e-9dc1-cc02aec2fdfc.jpg',110,120,85,0,10,'',1,1,0,'2024-11-30 16:25:10','2024-11-30 16:25:10',0),(58,2,'Lemon Juice ','','fb47cb66-a21c-4e87-8453-0965c57c8418.jpg',35,40,25,0,10,'',1,1,1,'2024-12-01 20:24:23','2025-01-03 22:28:42',0),(59,2,'Pineapple Juice','','5723ccd0-92b7-4dfb-89b8-f376ad3b7a43.jpg',55,60,43,0,10,'',1,1,0,'2024-12-01 20:32:19','2024-12-01 20:32:33',0),(60,2,'Muskmelon Juice','','515f2838-c020-47e5-b840-1cc648338885.jpg',55,60,43,0,10,'',1,1,0,'2024-12-01 20:33:39','2024-12-01 20:33:39',0),(61,2,'Watermelon Juice','','92f41233-c2a1-49c3-8b13-e36da4d5ab37.jpg',55,60,43,0,10,'',1,1,0,'2024-12-01 20:34:33','2024-12-01 20:34:33',0),(62,2,'Sweet Lemon (Saathukudi) ','','4c560e98-49ef-4c34-b68b-7288daf72d7b.jpg',65,70,51,0,10,'',1,1,0,'2024-12-01 20:42:15','2024-12-01 20:42:15',0),(63,2,'Classic Shawarma','','65c65481-dbc5-4a92-aa30-c7bc90be0220.jpg',85,95,68,1,10,'',1,1,1,'2024-12-08 20:30:21','2024-12-19 16:36:39',0),(67,2,'Spicy Shawarma','','09646255-e7fc-4a47-aba2-ccd0fc52a606.jpg',160,170,128,1,10,'',1,1,1,'2024-12-19 15:29:10','2024-12-19 16:38:22',0),(69,2,'Veg Sandwich','','9d755858-7a71-4353-99df-3bae46392968.png',55,60,43,0,10,'',1,1,0,'2024-12-19 16:01:21','2024-12-19 16:40:58',0),(70,2,'Chicken Sandwich','','5bd22ff5-8b98-4007-ae02-6da3d40ff58b.png',85,90,68,1,10,'',1,1,0,'2024-12-19 16:02:50','2025-01-13 11:17:36',0),(71,2,'Chicken Cheese Sandwich','','1c806d58-0056-432e-969b-fd9e222d6618.jpg',110,120,85,1,10,'',1,1,0,'2024-12-19 16:03:31','2025-01-13 11:17:42',0),(72,2,'French Fries','','5d02705f-2192-41e5-a241-4ccaf015d2bd.png',75,80,60,0,10,'',1,1,0,'2024-12-19 16:04:00','2024-12-19 16:42:20',0),(73,2,'Bread Omelette','','ca38e7ed-e1f1-4d5c-9639-a3760660d8ab.jpg',55,60,43,1,10,'',1,1,0,'2024-12-19 16:14:27','2025-01-13 11:17:55',0),(74,2,'Spl Bread Omelette','','05ddca1c-3b15-423f-a9a9-eac6da1dea02.jpg',75,80,60,1,10,'',1,1,0,'2024-12-19 16:14:59','2025-01-13 11:18:04',0),(75,2,'Cheese Bread Omelette','','f1d46c00-6840-4352-b87a-c98a4357832e.jpg',95,100,77,1,10,'',1,1,0,'2024-12-19 16:15:59','2025-01-13 11:18:10',0),(76,2,'Chicken Biryani','','9dbe386c-7458-44aa-beee-76957bd7f280.jpg',110,130,85,1,10,'briyani, briyani',1,1,0,'2024-12-19 16:32:10','2025-01-13 11:18:18',0),(77,2,'Plain Biryani','','0780be75-097b-461f-8f30-df426e9168e7.jpg',75,90,60,1,10,'',1,1,0,'2024-12-19 16:33:23','2025-01-13 11:18:22',0),(78,2,'Veg Fried Rice','','9ba62ac8-2aed-4193-9a83-f0ee38a03c3f.jpg',75,90,60,0,10,'',1,1,0,'2024-12-19 19:11:02','2024-12-19 19:11:17',0),(79,2,'Veg Noodles','','534d191a-7bfc-4565-bdb9-19e1848ebd64.jpg',75,90,60,0,10,'',1,1,0,'2024-12-19 19:11:50','2024-12-19 19:11:50',0),(80,2,'Mushroom Fried Rice','','c8ab0576-2296-47f5-88f7-14d9332836b7.jpg',85,100,68,0,10,'',1,1,0,'2024-12-19 19:12:50','2024-12-19 19:12:50',0),(81,2,'Mushroom Noodles','','847654c2-95eb-4d8b-8657-4a952a64ac98.jpg',85,100,68,0,10,'',1,1,0,'2024-12-19 19:13:33','2024-12-19 19:15:04',0),(82,2,'Egg Fried Rice','','8b781029-049f-4e2a-83ac-b167ab873c84.png',85,100,68,1,10,'',1,1,0,'2024-12-19 19:34:04','2025-01-13 11:18:32',0),(83,2,'Egg Noodles','','29352dee-d22e-40df-8371-a3cea5a3e408.jpg',85,100,68,1,10,'',1,1,0,'2024-12-19 19:34:24','2025-01-13 11:18:36',0),(84,2,'Chicken Fried Rice','','78d37964-070b-49a5-8dad-5e80f4864e17.jpg',95,110,77,1,10,'',1,1,0,'2024-12-19 19:35:14','2025-01-13 11:18:41',0),(85,2,'Chicken Noodles','','bbec1837-3145-495c-8f00-f2025bfdea06.jpg',95,110,77,1,10,'',1,1,0,'2024-12-19 19:35:54','2025-01-13 11:18:46',0),(86,2,'Singapore Chicken Rice','','f477691d-8682-4471-a448-e738ac062b46.jpg',120,130,94,1,10,'',1,1,0,'2024-12-19 19:36:47','2025-01-13 11:18:52',0),(87,2,'Egg Podimas','','3488ae72-2c43-4000-b14d-79992ccea55e.jpg',35,40,26,1,10,'',1,1,0,'2024-12-20 18:23:27','2025-01-13 11:19:06',0),(88,2,'Chicken 65','','ceb68dc6-e099-49de-bbb0-9d4cfe044305.png',55,60,43,1,10,'',1,1,0,'2024-12-20 18:25:22','2025-01-13 11:19:12',0),(89,2,'Mushroom 65','','0a76f25e-2d12-437c-9a8e-a1692b90b964.jpg',75,80,60,0,10,'',1,1,0,'2024-12-20 18:28:39','2024-12-20 18:28:39',0),(90,2,'Gobi 65','','896278cc-5606-4d53-9375-a6bb0def75e7.jpg',75,80,60,0,10,'',1,1,0,'2024-12-20 18:30:08','2024-12-20 18:30:08',0),(91,2,'Gobi Manchurian','','19f95e2e-1ac3-4c02-8e2f-03aba9ac11c0.jpg',110,120,85,0,10,'',1,1,0,'2024-12-20 18:31:38','2024-12-20 18:31:38',0),(92,2,'Mushroom Manchurian','','8bd40dc7-a940-4da3-8551-ea0d0143ee49.jpg',110,120,85,0,10,'',1,1,0,'2024-12-20 18:32:51','2024-12-20 18:32:51',0),(93,2,'Lollipop(5 pcs) ','','ab51c123-096a-43da-b161-6f4091ee9296.jpg',110,120,85,1,10,'',1,1,0,'2024-12-20 18:34:25','2025-01-13 11:19:23',0),(94,2,'Chilli Chicken','','26e2e662-66da-4873-bfbc-47dd6930333e.jpg',140,150,111,1,10,'',1,1,0,'2024-12-20 18:36:36','2025-01-13 11:19:39',0),(95,2,'Chicken Manchurian','','f9252cef-95df-440f-951e-2198f605a2bc.jpg',140,150,111,1,10,'',1,1,0,'2024-12-20 18:39:23','2025-01-13 11:19:50',0),(96,2,'Lollipop Saucy','','0ca28e80-46e4-4a54-b0e5-1911fe328ac9.jpg',140,150,111,1,10,'',1,1,0,'2024-12-20 18:43:04','2025-01-13 11:19:56',0),(97,2,'Royal Falooda','','f7973f8d-ec3c-4e75-986c-89cb3c84a5e9.jpg',85,90,68,0,10,'',1,1,0,'2024-12-21 16:28:57','2024-12-21 16:28:57',0),(98,2,'Big Temple Falooda','','94100c4e-9c39-4a20-9c45-fd40922a9a59.jpg',150,160,119,0,10,'',1,1,0,'2024-12-21 16:29:46','2024-12-21 16:30:16',0),(99,2,'Blue Ocean Mojito','','13737ee2-5c05-4d2b-8bc6-2995d002daa6.jpg',65,70,51,0,10,'',1,1,0,'2024-12-21 16:42:08','2024-12-27 16:52:06',0),(100,2,'Classic Mint Mojito','','e48bde8c-4dd4-4452-b72b-b35ee5f5130e.jpg',65,70,51,0,10,'',1,1,0,'2024-12-21 16:42:47','2024-12-21 16:42:47',0),(101,2,'Greenland Mojito','','a6e8ea60-6057-46f9-b035-9061b9786129.jpg',75,80,60,0,10,'',1,1,0,'2024-12-21 16:43:33','2024-12-21 16:43:33',0),(102,2,'Lichy Mojito','','64e2e5bf-c839-487f-a388-d27170726b3a.jpg',75,80,60,0,10,'',1,1,0,'2024-12-21 16:44:22','2024-12-21 16:44:22',0),(103,2,'Lemon Soda(Sweet) ','','45be33c2-c14e-4356-bf85-a0265aa606ae.jpg',35,40,26,0,10,'',1,1,0,'2024-12-21 16:52:07','2024-12-21 16:52:07',0),(104,2,'Lemon Soda(Salt) ','','9f6973be-4603-4533-bf9a-11c8449818a1.jpg',35,40,26,0,10,'',1,1,0,'2024-12-21 16:52:31','2024-12-21 16:52:31',0),(105,2,'Masala Soda','','85f47c50-a782-4569-af13-b1f5bd862f06.jpg',45,50,34,0,10,'',1,1,0,'2024-12-21 16:53:09','2024-12-21 16:54:28',0),(106,2,'Strawberry milkshake','','8d711c40-3bfc-4454-b157-45d19e72ff4f.jpg',55,60,43,0,10,'',1,1,1,'2024-12-21 18:13:53','2025-01-13 12:52:25',0),(107,2,'Butterscotch Milkshake','','4c9ed4da-14d9-41cd-a63b-4dd3acb4bcf8.jpg',55,60,43,0,10,'',1,1,1,'2024-12-21 18:15:57','2025-01-13 12:52:30',0),(108,2,'Blackcurrant Milkshake','','6e807e0b-b282-48ae-afae-84368797e6ab.jpg',55,60,43,0,10,'',1,1,1,'2024-12-21 18:18:37','2025-01-13 12:52:34',0),(109,2,'Chocomocha Milkshake','','89c7d3ac-4303-41c3-9b76-eff64be2b626.jpg',55,60,43,0,10,'',1,1,1,'2024-12-21 18:20:22','2025-01-13 12:52:38',0),(110,2,'Cold Boost Milkshake','','189fe5b7-398d-47c4-9df8-10bffd2c2c8c.jpg',55,60,43,0,10,'',1,1,1,'2024-12-21 18:21:48','2025-01-13 12:52:44',0),(111,2,'Choco Oreo Milkshake','','cf9298d3-63d0-4352-8551-8433844931e3.jpg',65,70,51,0,10,'',1,1,1,'2024-12-21 18:23:11','2025-01-13 12:52:50',0),(112,2,'Nutty Berry Milkshake','','3247b5d1-3904-430d-8f29-7cb73af5e546.jpg',65,70,51,0,10,'',1,1,1,'2024-12-21 18:24:25','2025-01-13 12:52:54',0),(113,2,'Vanilla Milkshake','','a341e165-58c3-4360-8254-68ba82afcfa4.jpg',65,70,51,0,10,'',1,1,1,'2024-12-21 18:25:33','2025-01-13 12:52:58',0),(114,2,'Chocolate Milkshake','','22881019-947b-4fe4-bfb7-b698736279ba.jpg',65,70,51,0,10,'',1,1,1,'2024-12-21 18:27:09','2025-01-13 12:53:06',0),(115,2,'KitKat Milkshake','','6c850bed-f71e-45d9-b04d-823ae94fede9.jpg',85,90,68,0,10,'',1,1,1,'2024-12-21 18:28:43','2025-01-13 12:53:10',0),(116,2,'Dark Fantasy Milkshake','','11d346de-c9bf-44ac-b9e2-35e2a7749247.jpg',85,90,68,0,10,'',1,1,1,'2024-12-21 18:29:52','2025-01-13 12:53:14',0),(117,2,'High Protein Milkshake','','63844eae-83ae-4522-93f7-8fe40c47e5df.jpg',110,120,85,0,10,'',1,1,1,'2024-12-21 18:31:39','2025-01-13 12:53:21',0),(118,2,'Vanilla Ice cream','','444eb2da-e637-4295-9613-edb60384acbf.png',45,50,34,0,10,'',1,1,0,'2024-12-23 16:01:16','2024-12-23 16:01:16',0),(119,2,'Strawberry Ice cream','','6812c34d-3031-4e5b-b629-ceebe10237d5.png',45,50,34,0,10,'',1,1,0,'2024-12-23 16:02:30','2024-12-23 16:02:30',0),(120,2,'Pista Ice cream','','ff2320e3-60e6-4fe4-b34c-a34339fd3677.png',45,50,34,0,10,'',1,1,0,'2024-12-23 16:03:31','2024-12-23 16:03:31',0),(121,2,'Chocolate Ice cream','','60664f47-8fff-4c8d-8703-71a0b91059db.png',55,60,43,0,10,'',1,1,0,'2024-12-23 16:10:19','2024-12-23 16:10:19',0),(122,2,'Butterscotch Ice cream','','784228f4-73b7-44bd-af06-7d242d45645c.png',55,60,43,0,10,'',1,1,0,'2024-12-23 16:12:16','2024-12-23 16:12:16',0),(123,2,'Blackcurrant Ice cream','','bec7b5b8-8b3b-45e4-a8cb-361891d4e772.png',65,70,51,0,10,'',1,1,0,'2024-12-23 16:13:26','2024-12-23 16:14:51',0),(124,2,'VSP Mix','','2e9e75ce-83da-4eac-8130-9a28511e51a4.png',85,90,68,0,10,'',1,1,0,'2024-12-23 16:16:29','2024-12-23 16:16:29',0),(125,2,'BBC Mix','','8792e4fe-14d5-4675-a2a3-f83d7bfe12bf.png',95,100,77,0,10,'',1,1,0,'2024-12-23 16:17:49','2024-12-23 16:17:49',0),(126,2,'Death by Choco','','645d28db-e166-4f0c-ac02-1148d9a63dab.png',130,140,102,0,10,'',1,1,0,'2024-12-23 16:19:00','2024-12-23 16:19:00',0),(127,2,'BBQ Qtr','','963a28aa-1db0-4725-8a80-29066240c150.png',110,120,85,1,10,'',1,1,0,'2024-12-23 18:02:09','2025-01-13 11:20:13',0),(128,2,'BBQ Half','','c63af862-ffde-4fb4-8436-ecd37c4e7d44.png',220,230,170,1,10,'',1,1,0,'2024-12-23 18:04:32','2025-01-13 11:20:17',0),(129,2,'BBQ Full','','0ff35391-32a1-41d4-be03-4cf6ebb5e38a.png',420,430,332,1,10,'',1,1,0,'2024-12-23 18:07:11','2025-01-13 11:20:21',0),(130,2,'Sweet Lassi','','71e26644-05c8-4e7c-a75d-c42288f8547b.png',35,40,26,0,10,'',1,1,0,'2024-12-23 18:28:56','2024-12-23 18:30:16',0),(131,2,'Rosemilk Lassi','','1fadc84c-2d03-4713-a541-10d2bc1e6bb9.png',35,40,26,0,10,'',1,1,0,'2024-12-23 18:31:25','2024-12-23 18:31:25',0),(132,2,'Strawberry Lassi','','50a794ab-2eec-4149-985a-ffaab0869c0a.png',55,60,43,0,10,'',1,1,0,'2024-12-23 18:33:00','2024-12-23 18:33:48',0),(133,2,'Dates Lassi','','cc6ff043-dc71-43da-b5a4-71f8209d3c08.png',55,60,43,0,10,'',1,1,0,'2024-12-23 18:34:40','2024-12-23 18:34:40',0),(134,2,'Gulkanth Lassi','','792df811-9d61-4c44-b051-251fcf846b00.png',55,60,43,0,10,'',1,1,0,'2024-12-23 18:36:02','2024-12-23 18:36:02',0),(138,3,'Chicken Biriyani(Half Plate) ','','f7f6260d-804e-48d2-9f76-067f325a3d5f.jpg',120,130,94,1,10,'',1,1,0,'2024-12-29 17:12:14','2025-01-13 11:14:35',0),(139,3,'Empty Biriyani(Half Plate) ','','d426d7b0-f2c4-41ef-b884-94657b582f57.jpg',75,80,60,1,10,'',1,1,0,'2024-12-29 17:13:51','2025-01-13 11:14:45',0),(140,3,'Mutton Biriyani(Half Plate) ','','b065d384-f80b-40e0-9b90-399408ef886d.png',220,230,170,1,10,'',1,1,0,'2024-12-29 17:18:02','2025-01-13 11:14:50',0),(141,3,'Meals(Limited) ','','8a2bb0a4-06eb-44b3-9154-6fa2d6243609.png',95,100,77,0,10,'',1,1,0,'2024-12-29 17:25:09','2024-12-29 17:25:09',0),(142,3,'Meals(Parcel) ','','441a24c8-ba08-4f3e-8606-ff7a93179efd.png',110,120,85,0,10,'',1,1,0,'2024-12-29 17:26:29','2024-12-29 17:26:29',0),(143,3,'Mutton Fry','','99aa8143-b131-4ef9-b0bf-9221ff0631c6.png',85,90,68,1,10,'',1,1,0,'2024-12-29 17:31:32','2025-01-13 11:14:57',0),(144,3,'Mutton Liver Fry','','67d7d001-5f9e-4414-82b9-90a67868e652.png',75,80,60,1,10,'',1,1,0,'2024-12-29 17:37:20','2025-01-13 11:15:03',0),(145,3,'Mutton Intestine(Kudal) Roast','','93285366-5b9f-4300-94ea-11a840ccbb85.png',75,80,60,1,10,'',1,1,0,'2024-12-29 17:43:59','2025-01-13 11:15:08',0),(146,3,'Chicken Roast','','baebc83b-e50e-47d8-a0b0-ac62dffa57bc.png',75,80,60,1,10,'',1,1,0,'2024-12-29 17:48:31','2025-01-13 11:15:40',0),(147,3,'Fish Fry','','4cf6661c-3b86-4a62-b326-a9e71b9253e5.png',55,60,43,1,10,'',1,1,0,'2024-12-29 17:52:27','2025-01-13 11:15:45',0),(148,3,'Quail(Kaadai) Fry','','ecee59ef-b8cf-4a1d-a9e5-35c147e26c44.png',95,100,77,1,10,'',1,1,0,'2024-12-29 18:06:23','2025-01-13 11:15:51',0),(149,3,'Omelette','','404e17c0-aada-47ac-a2e0-2d07bd84eec4.png',25,30,17,1,10,'',1,1,0,'2024-12-29 18:14:16','2025-01-13 11:15:58',0),(150,3,'Half Boil','','f1636842-5442-4137-9689-5c3085b5aa08.png',20,25,13,1,10,'',1,1,0,'2024-12-29 18:19:18','2025-01-13 11:16:03',0),(151,3,'Kalaki','','8b20d86d-bdea-44e1-bfe2-64d9a4999ca3.png',20,25,13,1,10,'',1,1,0,'2024-12-29 18:28:43','2025-01-13 11:16:09',0),(152,3,'Kozhambu Kalaki','','ee026654-2b1b-4895-86ef-93a55084b582.png',25,30,17,1,10,'',1,1,0,'2024-12-29 18:31:29','2025-01-13 11:16:13',0),(153,3,'Dosa','','6f872289-4ef9-4cea-b67c-bad283777eeb.png',35,40,26,0,10,'',1,1,0,'2024-12-29 18:35:23','2024-12-29 18:35:44',0),(154,3,'Spl Roast','','06686757-f2ed-4181-bb41-ae2001724f57.png',45,50,34,0,10,'',1,1,0,'2024-12-29 18:39:23','2024-12-29 18:39:23',0),(155,3,'Uthappam','','b2014acc-b857-499e-9d0b-5f69efebad3b.png',35,40,26,0,10,'',1,1,0,'2024-12-29 18:43:03','2024-12-29 18:43:03',0),(156,3,'Onion Uthappam','','1db90c6a-3068-4ffb-9db4-1042f36cc3c2.png',55,60,43,0,10,'',1,1,0,'2024-12-29 18:46:27','2024-12-29 18:47:29',0),(157,3,'Parotta','','00c1e535-7367-4376-92be-e32ee942ec24.png',17,20,10,0,10,'',1,1,0,'2024-12-29 18:51:18','2024-12-29 18:52:09',0),(158,3,'Mutta Parotta','','692c8552-bc16-4402-aaa4-8b2695ad41b6.png',95,100,77,1,10,'',1,1,0,'2024-12-29 18:56:24','2025-01-13 11:17:03',0),(159,3,'Veechu Parotta','','e6e6fbff-3807-4080-834d-2095ac39fe25.png',25,30,17,0,10,'',1,1,0,'2024-12-29 19:01:25','2024-12-29 19:01:25',0),(160,3,'Mutta Veechu Parotta','','6559fe6b-4f51-48e3-85f8-cfe55a7074bf.png',35,40,26,1,10,'',1,1,0,'2024-12-29 19:03:29','2025-01-13 11:16:33',0),(161,3,'Mutta Lappa','','9dbf5d92-569c-4a8d-b89c-af7f97cf8056.png',55,60,43,1,10,'',1,1,0,'2024-12-29 19:07:50','2025-01-13 11:16:39',0),(162,3,'Egg Poriyal','','677e1c4f-e38e-44c7-92cb-50679cca36b3.png',35,40,26,1,10,'',1,1,0,'2024-12-29 19:09:38','2025-01-13 11:16:44',0),(163,5,'Idly','','a71650b2-c6f7-440b-b8ac-71a1d09b52e4.png',12,15,9,0,10,'',1,1,0,'2024-12-30 15:53:43','2025-01-02 18:55:22',0),(164,5,'Vadai','','fe731cde-723d-40a3-8695-b763c6fbb169.png',13,15,10,0,10,'',1,1,0,'2024-12-30 15:57:05','2025-01-02 18:56:15',0),(165,5,'Pongal','','1bdd951b-6dd7-4b7d-8b04-60a3f47267e2.png',55,60,43,0,10,'',1,1,0,'2024-12-30 16:00:09','2024-12-30 16:00:51',0),(166,5,'Poori','','6c106408-438e-4f11-8c81-a9e17e017ef8.png',55,60,43,0,10,'',1,1,0,'2024-12-30 16:03:14','2024-12-30 16:03:14',0),(167,5,'Dosa','','f3cabac4-80e3-4f90-b55f-6bdb8a0f3295.png',55,60,43,0,10,'',1,1,0,'2024-12-30 16:11:00','2024-12-30 16:11:00',0),(168,5,'Roast','','55ab9dfc-ca8d-43ae-82f3-13c56c43cfd4.png',70,75,55,0,10,'',1,1,0,'2024-12-30 16:12:54','2024-12-30 16:12:54',0),(169,5,'Podi Dosa','','e6ab596b-5529-4fb0-b1a7-205edc1d9119.png',70,75,55,0,10,'',1,1,0,'2024-12-30 16:16:35','2024-12-30 16:17:27',0),(170,5,'Ghee Roast','','4b95efb5-3cc2-487a-be10-9b4f28022de4.png',85,90,68,0,10,'',1,1,0,'2024-12-30 16:20:40','2024-12-30 16:20:40',0),(171,5,'Masala Dosa','','de50733f-c323-42a0-a2fb-28c4cd268abb.png',85,90,68,0,10,'',1,1,0,'2024-12-30 16:23:30','2024-12-30 16:24:07',0),(172,5,'Onion Dosa','','76b52ced-0242-4812-a402-85f72a75e1bc.png',85,90,68,0,10,'',1,1,0,'2024-12-30 18:07:23','2024-12-30 18:07:23',0),(173,5,'Ghee Onion Dosa','','66bc2051-bb35-42cf-b184-8c0dc6f6149a.png',90,100,72,0,10,'',1,1,0,'2024-12-30 18:08:34','2024-12-30 18:11:12',0),(174,5,'Rava Dosa','','2af2c84c-1ebf-496a-a0ec-6e67d541ca34.png',60,65,47,0,10,'',1,1,0,'2024-12-30 18:12:16','2024-12-30 18:13:46',0),(175,5,'Spl Rava Dosa','','9ff270d7-0d14-4792-93f7-534afe8e88f5.png',70,75,55,0,10,'',1,1,0,'2024-12-30 18:15:20','2024-12-30 18:18:43',0),(176,5,'Onion Rava Dosa','','42b2e4c2-5aec-4e3e-9dee-aa99e302acaf.png',80,90,64,0,10,'',1,1,0,'2024-12-30 18:19:56','2024-12-30 18:19:56',0),(177,5,'Ghee Rava Dosa','','b2efa808-71db-4c33-87ad-950f0be74202.png',80,90,64,0,10,'',1,1,0,'2024-12-30 18:21:58','2024-12-30 18:21:58',0),(178,5,'Ghee Onion Rava Dosa','','c951841e-7812-4a1c-b02d-536c60c76fb2.png',95,100,77,0,10,'',1,1,0,'2024-12-30 18:23:41','2024-12-30 18:23:41',0),(179,5,'Ghee Podi Dosa','','082549b5-37fe-48f3-8260-480808052c49.png',80,85,64,0,10,'',1,1,0,'2024-12-30 18:25:39','2024-12-30 18:30:50',0),(180,5,'Ghee Masal Dosa','','ada87568-fdec-4c9c-8ae3-be3b163a7f2c.png',90,95,72,0,10,'',1,1,0,'2024-12-30 18:27:29','2024-12-30 18:31:00',0),(181,5,'Ghee Podi Masal Dosa','','35487135-42ce-457a-a1c2-6fa44eaaa602.png',95,100,77,0,10,'',1,1,0,'2024-12-30 18:30:36','2024-12-30 18:30:36',0),(182,5,'Uthappam','','3fa00a98-c817-45bd-b26c-464602b69954.png',55,60,43,0,10,'',1,1,0,'2024-12-30 18:32:04','2024-12-30 18:32:04',0),(183,5,'Onion Uthappam','','ddef2788-72de-4b5e-bec3-3fe9c89a9df1.png',85,90,68,0,10,'',1,1,0,'2024-12-30 18:32:52','2024-12-30 18:32:52',0),(184,5,'Ghee Podi Onion Uthappam','','7374570f-5f3e-4790-bd1a-6e30119301e9.png',95,100,77,0,10,'',1,1,0,'2024-12-30 18:36:09','2024-12-30 18:36:09',0),(185,5,'Meals','','6a469880-a81c-4ffa-bd86-e562a2de6ced.png',95,100,77,0,10,'',1,1,0,'2024-12-30 18:41:17','2024-12-30 18:44:06',0),(186,5,'Sambar Rice','','56ba54e4-9184-4078-9d98-748fb773b8b5.png',55,60,43,0,10,'',1,1,0,'2024-12-30 18:42:29','2024-12-30 18:42:29',0),(187,5,'Lemon Rice','','3261906d-6052-4076-9719-0fa89072a1e9.png',50,55,38,0,10,'',1,1,0,'2024-12-30 18:46:01','2024-12-30 18:46:01',0),(188,5,'Tomato Rice','','b22165c5-4237-46af-8932-d1dede9e4090.png',50,55,38,0,10,'',1,1,0,'2024-12-30 18:47:38','2024-12-30 18:48:35',0),(189,5,'Curd Rice','','b62d3757-c5aa-4da6-b041-a57620785a43.png',50,55,38,0,10,'',1,1,0,'2024-12-30 18:50:37','2024-12-30 18:50:37',0),(190,5,'Veg Biriyani','','991b1c27-5cb6-40fd-9d90-966c37bd5095.png',65,70,51,0,10,'',1,1,0,'2024-12-30 18:54:07','2024-12-30 18:54:48',0),(191,5,'Parotta','','cd802ac1-aed1-4723-821e-2edccc33ac32.png',20,25,13,0,10,'',1,1,0,'2024-12-30 18:56:19','2024-12-30 18:56:53',0),(192,5,'Veg Fried Rice','','ef4e631e-b57d-4b43-a72e-857aa1fe3146.jpg',95,100,77,0,10,'',1,1,0,'2024-12-31 16:19:59','2024-12-31 16:19:59',0),(193,5,'Mushroom Fried Rice','','89b9ed52-d27e-434c-bc78-7c835966a14b.jpg',120,130,94,0,10,'',1,1,0,'2024-12-31 16:20:48','2024-12-31 16:22:06',0),(194,5,'Gobi Fried Rice','','a93d957a-ead7-40bc-8d8d-5cbde91a8509.png',120,130,94,0,10,'',1,1,0,'2024-12-31 16:22:58','2024-12-31 16:23:43',0),(195,5,'Paneer Fried Rice','','dc28e9b6-e9bb-47df-af19-75ab3e257e79.png',150,160,119,0,10,'',1,1,0,'2024-12-31 16:24:32','2024-12-31 16:24:32',0),(196,5,'Schezwan Fried Rice','','2a857c76-01a0-496e-b7ef-4538ddd27dcc.png',140,150,111,0,10,'',1,1,0,'2024-12-31 16:26:31','2024-12-31 16:27:52',0),(197,5,'Veg Biriyani','','94865333-a223-4e2b-94d6-ff91dcb82e1c.png',65,70,51,0,10,'',1,1,0,'2024-12-31 16:28:48','2024-12-31 16:28:48',0),(198,5,'Mushroom Biriyani','','101e2c4e-904d-411d-ab98-f5bb1263c87f.png',130,140,102,0,10,'',1,1,0,'2024-12-31 16:29:49','2024-12-31 16:30:16',0),(199,5,'Paneer Biriyani','','bb51f23d-7a5f-4da7-b333-785d6a236033.png',150,160,119,0,10,'',1,1,0,'2024-12-31 16:31:05','2024-12-31 16:31:05',0),(200,5,'Chilli Parotta','','80e112fe-bc04-429e-9a62-165ed2752752.png',85,90,68,0,10,'',1,1,0,'2024-12-31 16:31:55','2024-12-31 16:33:08',0),(201,5,'Kaima Parotta','','02c254da-9758-450e-a210-325489c512d4.png',95,100,77,0,10,'',1,1,0,'2024-12-31 16:32:43','2024-12-31 16:32:54',0),(202,5,'Veg Noodles','','05f7ba81-8197-433b-b4c2-bed22ffa31dd.jpg',110,120,85,0,10,'',1,1,0,'2025-01-01 16:07:53','2025-01-01 16:07:53',0),(203,5,'Mushroom Noodles','','590050c2-8446-40da-a119-7e0303b25df2.jpg',120,130,94,0,10,'',1,1,0,'2025-01-01 16:09:13','2025-01-01 16:09:13',0),(204,5,'Gobi Noodles','','927c24b8-3437-4435-80e1-0f0245a104a8.png',120,130,94,0,10,'',1,1,0,'2025-01-01 16:10:06','2025-01-01 16:12:25',0),(205,5,'Paneer Noodles','','9af6ce16-0201-4cb7-85c7-50e1de2c7387.png',150,160,119,0,10,'',1,1,0,'2025-01-01 16:13:04','2025-01-01 16:13:27',0),(206,5,'Schezwan Noodles','','27f3b7b8-c9b0-4c1f-8a2b-35b83cf9e82e.png',150,160,119,0,10,'',1,1,0,'2025-01-01 16:14:17','2025-01-01 16:14:17',0),(207,5,'Mixed Noodles','','a7c136e3-bfb5-41e8-afc7-c8aef6167e3b.png',150,160,119,0,10,'',1,1,0,'2025-01-01 16:15:10','2025-01-01 16:15:35',0),(208,5,'Gobi Manchurian','','1695c54b-4225-40a7-8c6f-fee0980f4f02.jpg',120,130,94,0,10,'',1,1,0,'2025-01-01 16:23:35','2025-01-01 16:24:49',0),(209,5,'Mushroom Manchurian','','c6d78cbf-0d6a-4f27-988d-b98e2accace7.jpg',130,140,102,0,10,'',1,1,0,'2025-01-01 16:25:33','2025-01-01 16:25:33',0),(210,5,'Paneer Manchurian','','377a15be-919b-42ff-a5c3-a0df3156d470.png',150,160,119,0,10,'',1,1,0,'2025-01-01 16:26:14','2025-01-01 16:27:17',0),(211,5,'Paneer Butter Masala','','da08b5f4-0813-4495-af1a-c3ec94048047.png',150,160,119,0,10,'',1,1,0,'2025-01-01 16:43:36','2025-01-01 16:43:36',0),(212,5,'Mushroom Masala','','58f70926-b461-4359-9537-f4a51822b2bd.png',130,140,102,0,10,'',1,1,0,'2025-01-01 16:44:59','2025-01-01 16:49:21',0),(213,5,'Gobi Masala','','73482817-254c-401e-b134-0c0a343fdfe6.png',130,140,102,0,10,'',1,1,0,'2025-01-01 16:49:51','2025-01-01 16:49:59',0),(214,5,'Mix Veg Gravy','','62bc84ae-2ea0-4e72-8918-7249aaa8b6cc.png',150,160,119,0,10,'',1,1,0,'2025-01-01 16:50:44','2025-01-01 16:51:01',0),(215,5,'Kadai Paneer','','f1707e80-c2cd-4e7d-8fe0-392059ef8900.png',130,140,102,0,10,'',1,1,0,'2025-01-01 16:51:40','2025-01-01 16:51:40',0),(216,5,'Gobi Masal Dosa','','21e49f3d-99ad-4f9a-9157-8aae55444be3.png',95,100,77,0,10,'evening, dinner, testing',1,1,0,'2025-01-01 18:17:53','2025-01-04 15:11:25',0),(217,5,'Mushroom Masal Dosa','','0a6221a2-224d-477e-91c2-bd898f9802e0.png',95,100,77,0,10,'',1,1,0,'2025-01-01 18:20:48','2025-01-01 18:23:02',0),(218,5,'Paneer Masal Dosa','','b833e79a-11dc-4411-b129-ebff09362d2f.png',120,130,94,0,10,'',1,1,0,'2025-01-01 18:24:02','2025-01-01 18:24:20',0),(219,5,'Chola Poori','','95ec216c-69c3-4317-b036-c20043d27c46.png',65,70,51,0,10,'',1,1,0,'2025-01-01 18:25:04','2025-01-01 18:26:36',0),(220,5,'Chapati','','a4c39bd4-9a89-475d-bc84-69a7df955505.png',55,60,43,0,10,'',1,1,0,'2025-01-01 18:27:33','2025-01-01 18:29:11',0),(221,5,'Parotta','','744a18ba-f846-4696-9192-31e00fe9594d.png',20,25,13,0,10,'',1,1,0,'2025-01-01 18:30:17','2025-01-03 17:55:14',1);
/*!40000 ALTER TABLE `dish_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`qfoods_admin`@`%`*/ /*!50003 TRIGGER `before_insert_dish_set_visible` BEFORE INSERT ON `dish_items` FOR EACH ROW BEGIN
    IF NEW.price = 0 OR NEW.retail_price = 0 THEN
        SET NEW.visible = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`qfoods_admin`@`%`*/ /*!50003 TRIGGER `before_update_dish_set_visible` BEFORE UPDATE ON `dish_items` FOR EACH ROW BEGIN
    IF NEW.price = 0 OR NEW.retail_price = 0 THEN
        SET NEW.visible = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dish_tags`
--

DROP TABLE IF EXISTS `dish_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_tags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `thumbnail_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `thumbnail_height` int NOT NULL DEFAULT '220',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  KEY `tag_id` (`tag_id`,`isDeleted`) USING BTREE,
  FULLTEXT KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_tags`
--

LOCK TABLES `dish_tags` WRITE;
/*!40000 ALTER TABLE `dish_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `dish_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_tags_items`
--

DROP TABLE IF EXISTS `dish_tags_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_tags_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int NOT NULL,
  `item_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `product_id` (`item_id`) USING BTREE,
  CONSTRAINT `dish_tags_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dish_tags_items_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `dish_tags` (`tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_tags_items`
--

LOCK TABLES `dish_tags_items` WRITE;
/*!40000 ALTER TABLE `dish_tags_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `dish_tags_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_variants_list`
--

DROP TABLE IF EXISTS `dish_variants_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_variants_list` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `dish_item_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int NOT NULL,
  `price_type` int DEFAULT NULL,
  `default_variant` int DEFAULT NULL,
  `clear` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  `position` int DEFAULT '0',
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`variant_id`),
  KEY `type` (`type`),
  KEY `dish_item_id` (`dish_item_id`,`variant_id`,`isDeleted`) USING BTREE,
  KEY `price_type` (`price_type`),
  KEY `default_variant` (`default_variant`),
  FULLTEXT KEY `name` (`name`),
  CONSTRAINT `dish_variants_list_ibfk_1` FOREIGN KEY (`type`) REFERENCES `select_variant_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dish_variants_list_ibfk_2` FOREIGN KEY (`dish_item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dish_variants_list_ibfk_3` FOREIGN KEY (`price_type`) REFERENCES `price_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dish_variants_list_ibfk_4` FOREIGN KEY (`default_variant`) REFERENCES `dish_item_variants` (`variant_item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_variants_list`
--

LOCK TABLES `dish_variants_list` WRITE;
/*!40000 ALTER TABLE `dish_variants_list` DISABLE KEYS */;
INSERT INTO `dish_variants_list` VALUES (1,2,'',1,NULL,NULL,0,1,1,0),(2,3,'',1,NULL,3,0,1,1,0),(5,20,'',1,NULL,NULL,0,1,1,0),(7,21,'',1,NULL,NULL,0,1,1,0),(15,29,'',1,NULL,NULL,0,1,1,0),(19,37,'',1,NULL,NULL,0,1,1,0),(31,41,'',1,NULL,NULL,0,1,1,0),(36,58,'',1,NULL,NULL,0,1,1,0),(37,3,'',2,NULL,NULL,1,1,2,0),(38,63,'',1,NULL,42,0,1,1,0),(44,67,'',1,NULL,50,0,1,1,0),(45,106,'Strawberry',1,NULL,NULL,0,1,1,0),(46,107,'Butterscotch',1,NULL,55,0,1,1,0),(47,108,'Blackcurrant',1,NULL,56,0,1,1,0),(48,109,'Choco Mocha',1,NULL,57,0,1,1,0),(49,110,'Cold Boost',1,NULL,58,0,1,1,0),(50,111,'Choco Oreo',1,NULL,59,0,1,1,0),(51,112,'Nutty Berry',1,NULL,60,0,1,1,0),(52,113,'Vanilla',1,NULL,61,0,1,1,0),(53,114,'Chocolate',1,NULL,62,0,1,1,0),(54,115,'KitKat',1,NULL,63,0,1,1,0),(55,116,'Dark Fantasy',1,NULL,64,0,1,1,0),(56,117,'High Protein',1,NULL,65,0,1,1,0);
/*!40000 ALTER TABLE `dish_variants_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_rows`
--

DROP TABLE IF EXISTS `home_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_rows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `type_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `list_rows` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_rows`
--

LOCK TABLES `home_rows` WRITE;
/*!40000 ALTER TABLE `home_rows` DISABLE KEYS */;
INSERT INTO `home_rows` VALUES (1,1,'category',1,'2024-11-25 15:12:14','2025-01-13 12:54:54'),(2,2,'tag',1,'2024-11-25 15:12:14','2024-12-29 19:14:09');
/*!40000 ALTER TABLE `home_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_offer_types`
--

DROP TABLE IF EXISTS `item_offer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_offer_types` (
  `item_offer_id` int NOT NULL AUTO_INCREMENT,
  `offer` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_offer_types`
--

LOCK TABLES `item_offer_types` WRITE;
/*!40000 ALTER TABLE `item_offer_types` DISABLE KEYS */;
INSERT INTO `item_offer_types` VALUES (1,'up offer','2025-01-10 22:30:30','2025-01-10 22:30:30'),(2,'bottom offer','2025-01-10 22:30:42','2025-01-10 22:30:42');
/*!40000 ALTER TABLE `item_offer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_offers`
--

DROP TABLE IF EXISTS `item_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_offers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `offer_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_offer_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `offer_id` (`offer_id`),
  KEY `item_offer_id` (`item_offer_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `item_offers_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`offer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_offers_ibfk_2` FOREIGN KEY (`item_offer_id`) REFERENCES `item_offer_types` (`item_offer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_offers_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_offers`
--

LOCK TABLES `item_offers` WRITE;
/*!40000 ALTER TABLE `item_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items_list`
--

DROP TABLE IF EXISTS `menu_items_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `item_id` int NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_list_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_items_list_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items_list`
--

LOCK TABLES `menu_items_list` WRITE;
/*!40000 ALTER TABLE `menu_items_list` DISABLE KEYS */;
INSERT INTO `menu_items_list` VALUES (1,1,1,1),(2,2,2,1),(3,1,3,2),(4,1,4,3),(5,1,5,4),(6,1,6,5),(7,1,7,6),(8,1,8,7),(9,1,9,8),(10,1,10,9),(11,3,11,1),(12,3,12,2),(13,3,13,3),(14,3,14,4),(15,3,15,5),(16,4,16,1),(17,4,17,1),(18,4,18,1),(19,5,20,1),(20,4,19,4),(21,6,21,1),(22,7,22,1),(23,7,23,1),(24,8,24,1),(25,8,25,1),(26,8,26,1),(27,8,27,1),(28,8,28,1),(29,9,29,1),(30,9,30,2),(31,9,31,3),(32,9,32,3),(33,9,33,3),(34,9,34,3),(35,10,35,1),(36,10,36,1),(37,11,37,1),(38,12,38,1),(39,12,39,1),(40,2,40,2),(41,13,41,1),(42,14,42,1),(43,14,43,1),(44,15,44,1),(45,15,45,1),(46,15,46,1),(47,15,47,1),(48,15,48,1),(49,15,49,1),(50,15,50,1),(51,15,51,1),(52,15,52,1),(53,15,53,10),(54,15,54,10),(55,15,55,10),(56,15,56,10),(57,15,57,10),(58,16,58,1),(59,16,59,2),(60,16,60,3),(61,16,61,4),(62,16,62,5),(63,17,63,1),(64,18,67,1),(66,19,69,1),(67,19,70,2),(68,19,71,2),(69,19,72,2),(70,20,73,1),(71,20,74,1),(72,20,75,1),(73,21,76,1),(74,21,77,1),(75,22,78,1),(76,22,79,1),(77,22,80,1),(78,22,81,1),(79,22,82,5),(80,22,83,5),(81,22,84,5),(82,22,85,5),(83,22,86,5),(84,23,87,1),(85,23,88,1),(86,23,89,1),(87,23,90,1),(88,23,92,1),(89,23,91,1),(90,23,93,1),(91,23,94,1),(92,23,95,1),(93,23,96,10),(94,24,97,1),(95,24,98,1),(96,25,99,1),(97,25,100,1),(98,25,101,1),(99,25,102,1),(100,26,103,1),(101,26,104,1),(102,26,105,1),(103,27,106,1),(104,27,107,1),(105,27,108,1),(106,27,109,1),(107,27,110,1),(108,27,111,1),(109,27,112,1),(110,27,113,1),(111,27,114,1),(112,27,115,10),(113,27,116,10),(114,27,117,10),(115,28,118,1),(116,28,119,1),(117,28,120,1),(118,28,121,1),(119,28,122,1),(120,28,123,1),(121,28,124,1),(122,28,125,1),(123,28,126,1),(124,29,127,1),(125,29,128,1),(126,29,129,1),(127,30,130,1),(128,30,131,1),(129,30,132,1),(130,30,133,1),(131,30,134,1),(132,35,138,1),(133,35,139,1),(134,35,140,3),(135,35,141,4),(136,35,142,4),(137,35,143,6),(138,35,144,6),(139,35,145,8),(140,35,146,8),(141,35,147,8),(142,35,148,8),(143,35,149,8),(144,35,150,8),(145,35,151,8),(146,35,152,8),(147,35,153,16),(148,35,154,16),(149,35,155,16),(150,35,156,16),(151,35,157,16),(152,35,158,16),(153,35,159,16),(154,35,160,16),(155,35,161,16),(156,35,162,25),(157,36,163,1),(158,36,164,1),(159,36,165,1),(160,36,166,1),(161,36,167,1),(162,36,168,1),(163,36,169,1),(164,36,170,1),(165,36,171,1),(166,36,172,10),(167,36,173,10),(168,36,174,12),(169,36,175,12),(170,36,176,12),(171,36,177,12),(172,36,178,12),(173,36,179,12),(174,36,180,12),(175,36,181,12),(176,36,182,12),(177,36,184,21),(178,36,183,21),(179,37,185,1),(180,37,186,1),(181,37,187,1),(182,37,188,1),(183,37,189,1),(184,37,190,1),(185,37,191,1),(186,39,192,1),(187,39,193,1),(188,39,194,1),(189,39,195,1),(190,39,196,1),(191,39,197,1),(192,39,198,1),(193,39,199,1),(194,39,200,1),(195,39,201,10),(196,41,202,1),(197,41,203,1),(198,41,204,1),(199,41,205,1),(200,41,206,1),(201,41,207,1),(202,42,208,1),(203,42,209,1),(204,42,210,1),(205,43,211,1),(206,43,212,1),(207,43,213,1),(208,43,214,1),(209,43,215,1),(210,44,216,1),(211,44,217,1),(212,44,218,1),(213,44,219,1),(214,44,220,1),(215,44,221,1);
/*!40000 ALTER TABLE `menu_items_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `restaurant_id` int NOT NULL,
  `image` varchar(120) NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  `visible` int DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `menu_id` (`menu_id`,`status`,`visible`,`isDeleted`) USING BTREE,
  FULLTEXT KEY `menu_name` (`menu_name`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Fresh juice',1,'9eb8266f-e406-4ddc-b1a1-c1d109fd68b8.jpg',1,1,1,'2024-11-18 20:27:00','2024-12-31 14:09:08',0),(2,'Pizza',1,'',1,3,1,'2024-11-19 14:49:12','2024-11-30 14:34:18',0),(3,'Mojitos',1,'',1,4,1,'2024-11-26 14:51:10','2024-11-29 21:01:19',0),(4,'Biryani',1,'',1,5,1,'2024-11-29 09:59:17','2024-11-29 21:01:19',0),(5,'BBQ',1,'',1,6,1,'2024-11-29 10:22:08','2024-11-29 21:01:19',0),(6,'Crispy Chicken',1,'',1,7,1,'2024-11-29 10:39:24','2024-11-29 21:01:19',0),(7,'Hotspot Signature',1,'',1,8,1,'2024-11-29 11:00:08','2024-11-29 21:01:19',0),(8,'Ice Cream',1,'',1,9,1,'2024-11-29 16:01:17','2025-01-13 12:38:02',0),(9,'Ready to Eat',1,'',1,10,1,'2024-11-29 19:39:35','2024-11-29 21:01:19',0),(10,'Momo\'s',1,'',1,2,1,'2024-11-29 20:06:39','2024-11-29 21:01:19',0),(11,'Maggie Bowls',1,'',1,11,1,'2024-11-29 21:21:42','2024-11-29 21:21:42',0),(12,'Burger',1,'',1,12,1,'2024-11-30 14:26:55','2024-11-30 14:26:55',0),(13,'Sandwich',1,'',1,13,1,'2024-11-30 14:44:25','2024-11-30 14:44:25',0),(14,'Wrap',1,'',1,14,1,'2024-11-30 15:05:10','2025-02-03 22:37:46',0),(15,'Milkshake',1,'',1,15,1,'2024-11-30 15:05:54','2025-02-03 22:37:46',0),(16,'Fresh Juice',2,'',1,1,1,'2024-12-01 20:30:58','2024-12-01 20:30:58',0),(17,'Shawarma(Rool) ',2,'',1,2,1,'2024-12-08 20:30:53','2024-12-19 15:22:45',0),(18,'Shawarma(Plate) ',2,'',1,3,1,'2024-12-19 15:23:09','2024-12-19 15:23:09',0),(19,'Sandwich',2,'',1,4,1,'2024-12-19 15:50:08','2024-12-19 15:50:08',0),(20,'Bread Omelette',2,'',1,5,1,'2024-12-19 16:05:18','2024-12-19 16:05:49',0),(21,'Biryani',2,'',1,6,1,'2024-12-19 16:17:03','2024-12-19 16:17:03',0),(22,'Chinese',2,'',1,7,1,'2024-12-19 18:53:18','2024-12-19 18:53:18',0),(23,'Side Dish',2,'',1,8,1,'2024-12-20 18:05:24','2024-12-20 18:05:24',0),(24,'Falooda',2,'',1,9,1,'2024-12-21 16:27:46','2024-12-21 16:27:46',0),(25,'Mojito',2,'',1,10,1,'2024-12-21 16:41:27','2024-12-21 16:41:27',0),(26,'Soda',2,'',1,11,1,'2024-12-21 16:51:03','2024-12-21 16:51:03',0),(27,'Milkshake',2,'',1,12,1,'2024-12-21 18:13:11','2024-12-21 18:13:11',0),(28,'Ice Cream',2,'',1,13,1,'2024-12-23 15:46:06','2024-12-23 15:46:06',0),(29,'Barbeque',2,'',1,14,1,'2024-12-23 18:00:56','2024-12-23 18:00:56',0),(30,'Lassi',2,'',1,15,1,'2024-12-23 18:22:32','2024-12-23 18:22:32',0),(35,'Menu',3,'',1,1,1,'2024-12-29 17:17:00','2024-12-29 17:17:00',0),(36,'Breakfast',5,'',1,1,1,'2024-12-30 15:50:35','2024-12-30 15:50:35',0),(37,'Lunch-South Indian',5,'',1,2,1,'2024-12-30 18:38:40','2024-12-30 18:38:40',0),(39,'Lunch-North Indian/Chinese',5,'',1,3,1,'2024-12-31 16:18:51','2024-12-31 16:19:01',0),(40,'Starter',5,'',1,4,1,'2025-01-01 15:55:05','2025-01-01 15:55:05',0),(41,'Noodles',5,'',1,5,1,'2025-01-01 15:56:49','2025-01-01 15:56:49',0),(42,'Manchurian-Dry or Gravy',5,'',1,6,1,'2025-01-01 16:18:32','2025-01-01 16:18:58',0),(43,'North Indian-Gravy',5,'',1,7,1,'2025-01-01 16:28:42','2025-01-01 16:28:42',0),(44,'Evening Spl',5,'',1,8,1,'2025-01-01 17:56:52','2025-01-01 17:56:52',0);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `offer_id` int NOT NULL AUTO_INCREMENT,
  `offer` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `background_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `isDeleted` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`offer_id`),
  KEY `isDeleted` (`isDeleted`),
  KEY `offer` (`background_color`,`color`) USING BTREE,
  FULLTEXT KEY `offer_2` (`offer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (2,'testing','#DCFCE7','#3CD956',0,'2025-01-10 22:37:21','2025-01-10 22:37:21');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_address`
--

DROP TABLE IF EXISTS `order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `receiver_name` varchar(150) NOT NULL DEFAULT '',
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL,
  `kms` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `alternate_phone_number` varchar(255) NOT NULL,
  `instructions` varchar(255) NOT NULL,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `order_address_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_address_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_address_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `details`.`address_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_address`
--

LOCK TABLES `order_address` WRITE;
/*!40000 ALTER TABLE `order_address` DISABLE KEYS */;
INSERT INTO `order_address` VALUES (1,1,1,1,'','10.845123','78.956739','0.3','test','test','','','','2024-11-25 22:17:27'),(2,1,2,1,'','10.845123','78.956739','0.3','kk','kk','','','','2024-11-25 23:45:57'),(3,2,3,1,'','10.8507142','78.9551627','0.3','1/25','SVP Nagar','Vasanth Hospital','','','2024-11-26 11:34:50'),(4,1,4,1,'','10.845123','78.956739','0.3','test','test','','','','2024-11-26 14:52:40'),(5,1,5,1,'','10.845123','78.956739','0.3','test','test','','','','2024-11-30 17:04:57'),(6,1,6,1,'','10.845123','78.956739','0.3','test','test','','','','2024-11-30 17:08:54'),(7,1,7,1,'','10.845123','78.956739','0.3','test','test','','','','2024-11-30 17:17:36'),(8,2,8,1,'','10.8507142','78.9551627','0.3','1/25','SVP Nagar','Vasanth Hospital','','','2024-11-30 18:36:06'),(9,1,9,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-02 18:44:02'),(10,1,10,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-04 23:58:06'),(11,1,11,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-04 23:59:13'),(12,1,12,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-05 00:01:16'),(13,1,13,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-05 00:34:06'),(14,1,14,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-05 00:44:37'),(15,2,15,1,'','10.8507142','78.9551627','0.3','1/25','SVP Nagar','Vasanth Hospital','','','2024-12-05 09:07:38'),(16,3,16,1,'','10.849','78.9542','0.2','7','South Street','Murugan Temple','','','2024-12-05 15:11:59'),(17,1,17,1,'','10.845123','78.956739','0.2','test','test','','','','2024-12-23 23:18:18'),(18,1,18,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-23 23:18:50'),(19,1,19,1,'','10.845123','78.956739','0.3','test','test','','','','2024-12-30 17:44:34'),(20,2,20,1,'','10.8507142','78.9551627','0.2','1/25','SVP Nagar','Vasanth Hospital','','','2025-01-03 21:24:40'),(21,1,21,1,'','10.845123','78.956739','0.5','test','test','','','','2025-01-04 23:39:10'),(22,1,22,1,'','10.845123','78.956739','0.3','test','test','','','','2025-01-05 00:00:26'),(23,1,23,1,'','10.845123','78.956739','0.3','test','test','','','','2025-01-05 00:03:05'),(24,1,24,1,'','10.845123','78.956739','0.3','test','test','','','','2025-01-05 00:25:36'),(25,1,25,1,'','10.845123','78.956739','0.3','test','test','','','','2025-01-05 00:28:53'),(26,1,26,1,'','10.845123','78.956739','0.3','test','test','','','','2025-01-05 00:39:01'),(27,1,27,1,'10.8495269','10.8495269','78.9576715','0.4','thirukattupalli','thaikkal street','','','','2025-01-08 22:41:21'),(28,1,28,1,'karthikeyan','10.8491964','78.9576371','0.4','thaikkal street','thirukattupalli','','8807413622','','2025-01-08 22:45:38'),(29,1,29,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-09 00:14:26'),(30,1,30,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-09 11:07:56'),(31,1,31,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-11 20:33:44'),(32,1,32,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-11 20:38:55'),(33,1,33,1,'karthikeyan','10.8491964','78.9576371','0.6','thaikkal street','thirukattupalli','','8807413622','','2025-01-11 20:52:09'),(38,1,38,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-12 12:07:37'),(39,1,39,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-12 13:10:55'),(40,1,40,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-12 13:12:25'),(41,1,41,1,'karthikeyan','10.8491964','78.9576371','0.3','thaikkal street','thirukattupalli','','8807413622','','2025-01-12 16:16:40'),(42,1,42,1,'10.8495269','10.8495269','78.9576715','0.3','thirukattupalli','thaikkal street','','','','2025-01-26 14:22:33'),(43,4,43,1,'karthick','10.8493916','78.9576729','0.3','street','ttttt','','','','2025-01-28 14:08:59'),(44,4,44,1,'hhhhyh','10.8493916','78.9576729','0.3','hhhhhhh','hhhbh','','','','2025-01-28 14:12:33'),(45,4,45,1,'karthick','10.8493916','78.9576729','0.3','street','ttttt','','','','2025-02-03 14:12:31'),(46,1,46,1,'10.8495269','10.8495269','78.9576715','0.3','thirukattupalli','thaikkal street','','','','2025-03-09 18:03:37');
/*!40000 ALTER TABLE `order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_alerts`
--

DROP TABLE IF EXISTS `order_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_alerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_type` int NOT NULL,
  `alert` longtext COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_type` (`user_type`),
  CONSTRAINT `order_alerts_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_alerts_ibfk_2` FOREIGN KEY (`user_type`) REFERENCES `details`.`user_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_alerts`
--

LOCK TABLES `order_alerts` WRITE;
/*!40000 ALTER TABLE `order_alerts` DISABLE KEYS */;
INSERT INTO `order_alerts` VALUES (1,3,1,3,'hhh','2024-11-26 19:11:31','2024-11-26 19:11:31'),(2,3,1,3,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2024-11-26 19:47:10','2024-11-26 19:47:10'),(3,3,1,3,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2024-11-26 19:47:49','2024-11-26 19:47:49'),(4,3,1,3,'vbb','2024-11-26 19:49:12','2024-11-26 19:49:12'),(5,3,1,3,'b','2024-11-26 19:49:50','2024-11-26 19:49:50'),(6,3,1,3,'bb','2024-11-26 19:51:55','2024-11-26 19:51:55'),(7,3,1,3,'tt','2024-11-26 19:52:15','2024-11-26 19:52:15'),(8,3,1,3,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.','2024-11-26 19:52:23','2024-11-26 19:52:23'),(9,3,1,3,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2024-11-26 23:07:27','2024-11-26 23:07:27'),(10,3,1,3,'tt','2024-11-26 23:39:52','2024-11-26 23:39:52'),(11,3,1,3,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2024-11-26 23:40:33','2024-11-26 23:40:33'),(15,9,1,2,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2024-12-02 23:58:35','2024-12-02 23:58:35'),(16,9,1,2,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.','2024-12-02 23:59:32','2024-12-02 23:59:32'),(17,9,1,2,'test','2024-12-02 23:59:45','2024-12-02 23:59:45'),(18,9,1,3,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.','2024-12-03 00:04:14','2024-12-03 00:13:21'),(19,9,1,2,'test','2024-12-03 12:53:32','2024-12-03 12:53:32'),(20,9,1,2,'test','2024-12-03 12:54:52','2024-12-03 12:54:52'),(21,9,1,2,'test','2024-12-03 12:58:45','2024-12-03 12:58:45'),(22,9,1,2,'test','2024-12-03 13:00:04','2024-12-03 13:00:04'),(23,9,1,2,'test','2024-12-03 13:02:22','2024-12-03 13:02:22'),(24,14,1,2,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2024-12-07 23:43:36','2024-12-07 23:43:36'),(25,14,1,2,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.','2024-12-08 14:35:01','2024-12-08 14:35:01'),(26,14,1,2,'We sincerely apologize for the delay in fulfilling your order. Due to heavy rain, there may be some delays in our delivery service. We\'re doing our best to ensure your meal arrives as quickly and safely as possible. We greatly appreciate your patience and understanding.','2024-12-08 14:35:38','2024-12-08 14:35:38'),(27,13,1,2,'delay','2024-12-08 19:45:36','2024-12-08 19:45:36'),(28,20,2,2,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.','2025-01-03 21:43:42','2025-01-03 21:43:42'),(29,28,1,2,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2025-01-08 23:29:19','2025-01-08 23:29:19'),(30,43,1,2,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2025-01-28 14:10:43','2025-01-28 14:10:43'),(31,43,1,2,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.','2025-01-28 14:10:49','2025-01-28 14:10:49'),(32,45,1,2,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.','2025-02-03 14:13:40','2025-02-03 14:13:40');
/*!40000 ALTER TABLE `order_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_chat_inbox`
--

DROP TABLE IF EXISTS `order_chat_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_chat_inbox` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_last_read` int NOT NULL DEFAULT '0',
  `admin_last_read` int NOT NULL DEFAULT '0',
  `delivery_last_read` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`,`user_last_read`,`admin_last_read`,`delivery_last_read`),
  CONSTRAINT `order_chat_inbox_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_chat_inbox`
--

LOCK TABLES `order_chat_inbox` WRITE;
/*!40000 ALTER TABLE `order_chat_inbox` DISABLE KEYS */;
INSERT INTO `order_chat_inbox` VALUES (1,1,0,0,0,'2024-11-25 22:17:27','2024-11-25 22:17:27'),(2,2,0,0,0,'2024-11-25 23:45:57','2024-11-25 23:45:57'),(3,3,0,0,0,'2024-11-26 11:34:50','2024-11-26 11:34:50'),(4,4,0,0,0,'2024-11-26 14:52:40','2024-11-26 14:52:40'),(5,5,0,0,0,'2024-11-30 17:04:57','2024-11-30 17:04:57'),(6,6,0,0,0,'2024-11-30 17:08:54','2024-11-30 17:08:54'),(7,7,0,0,0,'2024-11-30 17:17:36','2024-11-30 17:17:36'),(8,8,0,0,0,'2024-11-30 18:36:06','2024-11-30 18:36:06'),(9,9,0,0,0,'2024-12-02 18:44:02','2024-12-02 18:44:02'),(10,10,0,0,0,'2024-12-04 23:58:06','2024-12-04 23:58:06'),(11,11,0,0,0,'2024-12-04 23:59:13','2024-12-04 23:59:13'),(12,12,2,0,0,'2024-12-05 00:01:16','2024-12-12 11:35:21'),(13,13,0,0,0,'2024-12-05 00:34:06','2024-12-05 00:34:06'),(14,14,0,0,0,'2024-12-05 00:44:37','2024-12-05 00:44:37'),(15,15,0,0,0,'2024-12-05 09:07:38','2024-12-05 09:07:38'),(16,16,1,0,0,'2024-12-05 15:11:59','2024-12-05 15:12:30'),(17,17,0,0,0,'2024-12-23 23:18:18','2024-12-23 23:18:18'),(18,18,0,0,0,'2024-12-23 23:18:50','2024-12-23 23:18:50'),(19,19,0,0,0,'2024-12-30 17:44:34','2024-12-30 17:44:34'),(20,20,0,0,0,'2025-01-03 21:24:40','2025-01-03 21:24:40'),(21,21,0,0,0,'2025-01-04 23:39:10','2025-01-04 23:39:10'),(22,22,0,0,0,'2025-01-05 00:00:26','2025-01-05 00:00:26'),(23,23,0,0,0,'2025-01-05 00:03:05','2025-01-05 00:03:05'),(24,24,0,0,0,'2025-01-05 00:25:36','2025-01-05 00:25:36'),(25,25,0,0,0,'2025-01-05 00:28:53','2025-01-05 00:28:53'),(26,26,5,5,0,'2025-01-05 00:39:01','2025-01-07 20:12:48'),(27,27,0,0,0,'2025-01-08 22:41:21','2025-01-08 22:41:21'),(28,28,0,0,0,'2025-01-08 22:45:38','2025-01-08 22:45:38'),(29,29,0,0,0,'2025-01-09 00:14:26','2025-01-09 00:14:26'),(30,30,0,0,0,'2025-01-09 11:07:56','2025-01-09 11:07:56'),(31,31,0,0,0,'2025-01-11 20:33:44','2025-01-11 20:33:44'),(32,32,0,0,0,'2025-01-11 20:38:55','2025-01-11 20:38:55'),(33,33,8,8,0,'2025-01-11 20:52:09','2025-01-11 20:52:59'),(38,38,0,0,0,'2025-01-12 12:07:37','2025-01-12 12:07:37'),(39,39,0,0,0,'2025-01-12 13:10:55','2025-01-12 13:10:55'),(40,40,26,0,0,'2025-01-12 13:12:25','2025-02-02 16:50:50'),(41,41,32,32,0,'2025-01-12 16:16:40','2025-02-15 12:33:12'),(42,42,0,0,0,'2025-01-26 14:22:33','2025-01-26 14:22:33'),(43,43,24,24,0,'2025-01-28 14:08:59','2025-01-28 14:09:50'),(44,44,0,0,0,'2025-01-28 14:12:33','2025-01-28 14:12:33'),(45,45,28,28,0,'2025-02-03 14:12:31','2025-02-03 14:13:30'),(46,46,0,0,0,'2025-03-09 18:03:37','2025-03-09 18:03:37');
/*!40000 ALTER TABLE `order_chat_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_chat_messages`
--

DROP TABLE IF EXISTS `order_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_chat_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_type` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`,`isDeleted`),
  KEY `sender_id` (`sender_id`) USING BTREE,
  KEY `user_type` (`user_type`),
  CONSTRAINT `order_chat_messages_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_chat_messages_ibfk_2` FOREIGN KEY (`user_type`) REFERENCES `details`.`user_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_chat_messages`
--

LOCK TABLES `order_chat_messages` WRITE;
/*!40000 ALTER TABLE `order_chat_messages` DISABLE KEYS */;
INSERT INTO `order_chat_messages` VALUES (1,16,3,'Hi Bro',1,'2024-12-05 15:12:30','2024-12-05 15:12:30',0),(2,12,1,'bjbb',1,'2024-12-12 11:35:21','2024-12-12 11:35:21',0),(3,26,1,'hi😍',2,'2025-01-07 20:08:23','2025-01-07 20:08:23',0),(4,26,1,'ggh',1,'2025-01-07 20:08:32','2025-01-07 20:08:32',0),(5,26,1,'😍😍🥰😝😝😝😝😝😝😘☺😋😋🧐😏🤓😛🙂',2,'2025-01-07 20:12:46','2025-01-07 20:12:46',0),(6,33,1,'hi\n',1,'2025-01-11 20:52:29','2025-01-11 20:52:29',0),(7,33,1,'hi ⌚',2,'2025-01-11 20:52:51','2025-01-11 20:52:51',0),(8,33,1,'hhhhhhh',2,'2025-01-11 20:52:58','2025-01-11 20:52:58',0),(9,41,1,'hh',1,'2025-01-19 21:49:14','2025-01-19 21:49:14',0),(10,41,1,'Domains like social media analysis, e-commerce, and healthcare data management require querying through large chunks of structured and unstructured',1,'2025-01-19 21:50:04','2025-01-19 21:50:04',0),(11,41,1,'Domains like social media analysis, e-commerce, and healthcare data management require querying through large chunks of structured and unstructured',1,'2025-01-19 21:50:10','2025-01-19 21:50:10',0),(12,41,1,'Domains like social media analysis, e-commerce, and healthcare data management require querying through large chunks of structured and unstructured',1,'2025-01-19 21:50:14','2025-01-19 21:50:14',0),(13,41,1,'vv',1,'2025-01-19 21:50:17','2025-01-19 21:50:17',0),(14,41,1,'Domains like social media analysis, e-commerce, and healthcare data management require querying through large chunks of structured and unstructured',1,'2025-01-19 21:50:22','2025-01-19 21:50:22',0),(15,41,1,'vvvvv',1,'2025-01-19 21:50:25','2025-01-19 21:50:25',0),(16,41,1,'Domains like social media analysis, e-commerce, and healthcare data management require querying through large chunks of structured and unstructured',1,'2025-01-19 21:50:30','2025-01-19 21:50:30',0),(17,41,1,'Domains like social media analysis, e-commerce, and healthcare data management require querying through large chunks of structured and unstructured',1,'2025-01-19 21:50:34','2025-01-19 21:50:34',0),(18,41,1,'hhh',2,'2025-01-19 21:51:25','2025-01-19 21:51:25',0),(19,41,1,'. ',2,'2025-01-19 21:51:35','2025-01-19 21:51:35',0),(20,41,1,'h',1,'2025-01-25 22:23:56','2025-01-25 22:23:56',0),(21,41,1,'hi',1,'2025-01-26 14:17:47','2025-01-26 14:17:47',0),(22,41,1,'😊😚🤑😝😗🫠🤪🤪☺️😚🤑😝',1,'2025-01-26 22:37:07','2025-01-26 22:37:07',0),(23,43,1,'hi',2,'2025-01-28 14:09:33','2025-01-28 14:09:33',0),(24,43,1,'vhh',2,'2025-01-28 14:09:50','2025-01-28 14:09:50',0),(25,41,1,'hi',1,'2025-02-02 16:50:19','2025-02-02 16:50:19',0),(26,40,1,'hi',1,'2025-02-02 16:50:50','2025-02-02 16:50:50',0),(27,45,4,'hi',1,'2025-02-03 14:13:25','2025-02-03 14:13:25',0),(28,45,1,'djd',2,'2025-02-03 14:13:30','2025-02-03 14:13:30',0),(29,41,1,'🃏🃏🃏🃏🃏🃏🃏🃏🃏🃏🃏🃏🔥🔥🔥🔥☕☕☕☕💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀✅✅✅✅🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🐐🤡🤡🤡🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌',1,'2025-02-12 08:54:12','2025-02-12 08:54:12',0),(30,41,1,'hbb',2,'2025-02-15 11:38:01','2025-02-15 11:38:01',0),(31,41,1,'vhb',2,'2025-02-15 12:33:02','2025-02-15 12:33:02',0),(32,41,1,'hvu',1,'2025-02-15 12:33:11','2025-02-15 12:33:11',0);
/*!40000 ALTER TABLE `order_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_dish_variant_items`
--

DROP TABLE IF EXISTS `order_dish_variant_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_dish_variant_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `dish_id` int DEFAULT NULL,
  `variant_item_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `retail_price` int NOT NULL DEFAULT '0',
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  KEY `variant_item_id` (`variant_item_id`),
  KEY `cart_id` (`order_id`) USING BTREE,
  CONSTRAINT `order_dish_variant_items_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_dish_variant_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_dish_variant_items_ibfk_3` FOREIGN KEY (`variant_item_id`) REFERENCES `dish_item_variants` (`variant_item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_dish_variant_items`
--

LOCK TABLES `order_dish_variant_items` WRITE;
/*!40000 ALTER TABLE `order_dish_variant_items` DISABLE KEYS */;
INSERT INTO `order_dish_variant_items` VALUES (1,1,2,1,'half',120,100,'2024-11-25 22:17:27'),(2,6,3,5,'Lemon Soda Sweet & Salt',45,34,'2024-11-30 17:08:54'),(3,8,37,27,'Cheese Maggie',55,43,'2024-11-30 18:36:06'),(4,10,3,4,'Lemon Soda Salt',45,34,'2024-12-04 23:58:06'),(5,11,3,5,'Lemon Soda Sweet & Salt',45,34,'2024-12-04 23:59:13'),(6,12,3,4,'Lemon Soda Salt',45,34,'2024-12-05 00:01:16'),(7,13,3,3,'Lemon Soda Sweet',45,34,'2024-12-05 00:34:06'),(8,13,3,40,'test1',20,15,'2024-12-05 00:34:06'),(9,13,3,41,'test2',30,20,'2024-12-05 00:34:06'),(10,14,3,3,'Lemon Soda Sweet',45,34,'2024-12-05 00:44:37'),(11,14,3,41,'test2',30,20,'2024-12-05 00:44:37'),(12,14,3,40,'test1',20,15,'2024-12-05 00:44:37'),(13,17,58,36,'Lemon',35,25,'2024-12-23 23:18:18'),(14,22,3,4,'Lemon Soda Salt',45,34,'2025-01-05 00:00:26'),(15,22,3,41,'test2',30,20,'2025-01-05 00:00:26'),(17,23,3,4,'Lemon Soda Salt',45,34,'2025-01-05 00:03:05'),(18,23,3,41,'test2',30,20,'2025-01-05 00:03:05'),(19,33,58,36,'Lemon',35,25,'2025-01-11 20:52:09'),(20,33,63,46,'Only Meat',120,102,'2025-01-11 20:52:09'),(21,33,67,53,'Only Chicken',200,162,'2025-01-11 20:52:09'),(22,33,106,54,'Strawberry(Add on Ice cream) ',80,64,'2025-01-11 20:52:09'),(23,33,107,55,'Butterscotch(Add on Ice cream) ',80,64,'2025-01-11 20:52:09'),(24,33,108,56,'Blackcurrant(Add on Ice cream) ',80,64,'2025-01-11 20:52:09'),(25,33,109,57,'Choco Mocha(Add on Ice cream) ',80,64,'2025-01-11 20:52:09'),(26,33,110,58,'Cold Boost(Add on Ice cream) ',80,64,'2025-01-11 20:52:09'),(27,33,111,59,'Choco Oreo(Add on Ice cream) ',90,73,'2025-01-11 20:52:09'),(28,33,112,60,'Nutty Berry(Add on Ice cream) ',90,73,'2025-01-11 20:52:09'),(34,38,3,4,'Lemon Soda Salt',45,34,'2025-01-12 12:07:37'),(35,38,3,41,'test2',30,20,'2025-01-12 12:07:37'),(37,39,3,4,'Lemon Soda Salt',45,34,'2025-01-12 13:10:55'),(38,39,3,41,'test2',30,20,'2025-01-12 13:10:55'),(40,40,3,4,'Lemon Soda Salt',45,34,'2025-01-12 13:12:25'),(41,40,3,41,'test2',30,20,'2025-01-12 13:12:25'),(42,42,3,5,'Lemon Soda Sweet & Salt',45,34,'2025-01-26 14:22:33'),(43,42,3,41,'test2',30,20,'2025-01-26 14:22:33'),(44,46,3,40,'test1111',20,15,'2025-03-09 18:03:37');
/*!40000 ALTER TABLE `order_dish_variant_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_dishes`
--

DROP TABLE IF EXISTS `order_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `dish_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `retail_price` int NOT NULL DEFAULT '0',
  `price_type` int DEFAULT NULL,
  `total` int NOT NULL,
  `retail_total` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `cart_id` (`dish_id`) USING BTREE,
  CONSTRAINT `order_dishes_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_dishes_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_dishes`
--

LOCK TABLES `order_dishes` WRITE;
/*!40000 ALTER TABLE `order_dishes` DISABLE KEYS */;
INSERT INTO `order_dishes` VALUES (1,1,1,'lemon juice',25,17,1,50,34,2,'2024-11-25 22:17:27'),(2,1,2,'country style pizza',120,100,1,240,200,2,'2024-11-25 22:17:27'),(4,2,1,'lemon juice',25,17,1,25,17,1,'2024-11-25 23:45:57'),(5,3,1,'Lemon juice',25,17,1,25,17,1,'2024-11-26 11:34:50'),(6,4,4,'Papaya Juice',55,44,1,165,132,3,'2024-11-26 14:52:40'),(7,5,1,'Lemon juice',35,26,1,35,26,1,'2024-11-30 17:04:57'),(8,6,3,'Lemon soda ',45,34,1,45,34,1,'2024-11-30 17:08:54'),(9,7,5,'Musk melon juice',55,44,1,55,44,1,'2024-11-30 17:17:36'),(10,8,37,'Classic Maggie',55,43,1,55,43,1,'2024-11-30 18:36:06'),(11,9,1,'Lemon juice',35,26,1,35,26,1,'2024-12-02 18:44:02'),(12,10,3,'Lemon soda ',45,34,NULL,45,34,1,'2024-12-04 23:58:06'),(13,11,3,'Lemon soda ',45,34,NULL,90,68,2,'2024-12-04 23:59:13'),(14,12,3,'Lemon soda ',45,34,1,45,34,1,'2024-12-05 00:01:16'),(15,13,3,'Lemon soda ',45,34,1,45,34,1,'2024-12-05 00:34:06'),(16,14,3,'Lemon soda ',95,69,1,190,138,2,'2024-12-05 00:44:37'),(17,15,1,'Lemon juice',35,26,NULL,35,26,1,'2024-12-05 09:07:38'),(18,16,17,'Chicken Biryani',130,102,NULL,130,102,1,'2024-12-05 15:11:59'),(19,17,58,'Lemon Juice ',35,25,1,105,75,3,'2024-12-23 23:18:18'),(20,18,1,'Lemon juice',35,26,NULL,35,26,1,'2024-12-23 23:18:50'),(21,19,4,'Papaya Juice',55,44,NULL,165,132,3,'2024-12-30 17:44:34'),(22,19,1,'Lemon juice',35,26,NULL,140,104,4,'2024-12-30 17:44:34'),(24,20,163,'Idly',12,9,NULL,120,90,10,'2025-01-03 21:24:40'),(25,21,187,'Lemon Rice',50,38,NULL,50,38,1,'2025-01-04 23:39:10'),(26,22,3,'Lemon soda ',75,54,1,75,54,1,'2025-01-05 00:00:26'),(27,23,3,'Lemon soda ',75,54,1,75,54,1,'2025-01-05 00:03:05'),(28,24,4,'Papaya Juice',55,44,NULL,55,44,1,'2025-01-05 00:25:36'),(29,25,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-05 00:28:53'),(30,26,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-05 00:39:01'),(31,27,190,'Veg Biriyani',65,51,NULL,65,51,1,'2025-01-08 22:41:21'),(32,28,138,'Chicken Biriyani(Half Plate) ',120,94,NULL,120,94,1,'2025-01-08 22:45:38'),(33,29,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-09 00:14:26'),(34,30,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-09 11:07:56'),(35,31,1,'Lemon juice',35,26,NULL,70,52,2,'2025-01-11 20:33:44'),(36,32,163,'Idly',12,9,NULL,36,27,3,'2025-01-11 20:38:55'),(37,32,164,'Vadai',13,10,NULL,13,10,1,'2025-01-11 20:38:55'),(38,32,165,'Pongal',55,43,NULL,55,43,1,'2025-01-11 20:38:55'),(39,32,166,'Poori',55,43,NULL,55,43,1,'2025-01-11 20:38:55'),(40,32,167,'Dosa',55,43,NULL,55,43,1,'2025-01-11 20:38:55'),(41,32,168,'Roast',70,55,NULL,210,165,3,'2025-01-11 20:38:55'),(43,33,58,'Lemon Juice ',35,25,1,35,25,1,'2025-01-11 20:52:09'),(44,33,63,'Classic Shawarma',120,102,1,120,102,1,'2025-01-11 20:52:09'),(45,33,67,'Spicy Shawarma',200,162,1,600,486,3,'2025-01-11 20:52:09'),(46,33,106,'Strawberry milkshake',80,64,1,160,128,2,'2025-01-11 20:52:09'),(47,33,107,'Butterscotch Milkshake',80,64,1,160,128,2,'2025-01-11 20:52:09'),(48,33,108,'Blackcurrant Milkshake',80,64,1,80,64,1,'2025-01-11 20:52:09'),(49,33,109,'Chocomocha Milkshake',80,64,1,160,128,2,'2025-01-11 20:52:09'),(50,33,110,'Cold Boost Milkshake',80,64,1,160,128,2,'2025-01-11 20:52:09'),(51,33,111,'Choco Oreo Milkshake',90,73,1,180,146,2,'2025-01-11 20:52:09'),(52,33,112,'Nutty Berry Milkshake',90,73,1,180,146,2,'2025-01-11 20:52:09'),(58,38,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-12 12:07:37'),(59,38,3,'Lemon soda ',45,34,1,45,34,1,'2025-01-12 12:07:37'),(61,39,1,'Lemon juice',35,26,NULL,70,52,2,'2025-01-12 13:10:55'),(62,39,3,'Lemon soda ',45,34,1,90,68,2,'2025-01-12 13:10:55'),(64,40,1,'Lemon juice',35,26,NULL,70,52,2,'2025-01-12 13:12:25'),(65,40,3,'Lemon soda ',75,54,1,150,108,2,'2025-01-12 13:12:25'),(67,41,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-12 16:16:40'),(68,42,1,'Lemon juice',35,26,NULL,140,104,4,'2025-01-26 14:22:33'),(69,42,3,'Lemon soda ',75,54,1,150,108,2,'2025-01-26 14:22:33'),(71,43,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-28 14:08:59'),(72,44,1,'Lemon juice',35,26,NULL,35,26,1,'2025-01-28 14:12:33'),(73,45,1,'Lemon juice',35,26,NULL,70,52,2,'2025-02-03 14:12:31'),(74,46,31,'Cheese Balls (5Pcs) ',55,43,NULL,55,43,1,'2025-03-09 18:03:37'),(75,46,5,'Musk melon juice',55,44,NULL,55,44,1,'2025-03-09 18:03:37'),(76,46,4,'Papaya Juice',55,44,NULL,55,44,1,'2025-03-09 18:03:37'),(77,46,6,'Water melon juice',55,44,NULL,55,44,1,'2025-03-09 18:03:37'),(78,46,7,'Pineapple juice',65,51,NULL,65,51,1,'2025-03-09 18:03:37'),(79,46,8,'Mosambi juice',75,59,NULL,150,118,2,'2025-03-09 18:03:37'),(80,46,35,'Veg Fry Momo\'s',85,68,NULL,255,204,3,'2025-03-09 18:03:37'),(81,46,11,'Lemon Mint',65,54,NULL,195,162,3,'2025-03-09 18:03:37'),(82,46,3,'Lemon soda ',20,15,2,20,15,1,'2025-03-09 18:03:37'),(83,46,1,'Lemon juice',35,26,NULL,70,52,2,'2025-03-09 18:03:37');
/*!40000 ALTER TABLE `order_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_logs`
--

DROP TABLE IF EXISTS `order_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `log` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`,`order_id`) USING BTREE,
  CONSTRAINT `order_logs_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `details`.`user_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_logs`
--

LOCK TABLES `order_logs` WRITE;
/*!40000 ALTER TABLE `order_logs` DISABLE KEYS */;
INSERT INTO `order_logs` VALUES (1,1,1,1,'Order created','2024-11-25 22:17:27','2024-11-25 22:17:27'),(2,1,1,3,'Order taken','2024-11-25 22:17:45','2024-11-25 22:17:45'),(3,1,1,3,'updated status into On The Way','2024-11-25 22:17:48','2024-11-25 22:17:48'),(4,1,1,3,'8988 otp has been updated','2024-11-25 22:17:48','2024-11-25 22:17:48'),(5,1,1,3,'updated status into Order Delivered','2024-11-25 22:17:59','2024-11-25 22:17:59'),(6,2,1,1,'Order created','2024-11-25 23:45:57','2024-11-25 23:45:57'),(7,2,1,3,'Order taken','2024-11-25 23:46:55','2024-11-25 23:46:55'),(8,3,2,1,'Order created','2024-11-26 11:34:50','2024-11-26 11:34:50'),(9,4,1,1,'Order created','2024-11-26 14:52:40','2024-11-26 14:52:40'),(10,4,1,3,'Order taken','2024-11-26 14:54:44','2024-11-26 14:54:44'),(11,4,1,3,'updated status into On The Way','2024-11-26 14:55:00','2024-11-26 14:55:00'),(12,4,1,3,'8681 otp has been updated','2024-11-26 14:55:00','2024-11-26 14:55:00'),(13,4,1,3,'updated status into Order Delivered','2024-11-26 14:55:16','2024-11-26 14:55:16'),(14,3,1,3,'Order taken','2024-11-26 18:48:48','2024-11-26 18:48:48'),(15,5,1,1,'Order created','2024-11-30 17:04:57','2024-11-30 17:04:57'),(16,6,1,1,'Order created','2024-11-30 17:08:54','2024-11-30 17:08:54'),(17,7,1,1,'Order created','2024-11-30 17:17:36','2024-11-30 17:17:36'),(18,8,2,1,'Order created','2024-11-30 18:36:06','2024-11-30 18:36:06'),(19,8,1,3,'Order taken','2024-12-02 18:07:29','2024-12-02 18:07:29'),(20,8,1,3,'updated status into On The Way','2024-12-02 18:07:32','2024-12-02 18:07:32'),(21,8,1,3,'8706 otp has been updated','2024-12-02 18:07:32','2024-12-02 18:07:32'),(22,8,1,3,'updated status into Order Delivered','2024-12-02 18:08:33','2024-12-02 18:08:33'),(23,9,1,1,'Order created','2024-12-02 18:44:02','2024-12-02 18:44:02'),(24,10,1,1,'Order created','2024-12-04 23:58:06','2024-12-04 23:58:06'),(25,11,1,1,'Order created','2024-12-04 23:59:13','2024-12-04 23:59:13'),(26,12,1,1,'Order created','2024-12-05 00:01:16','2024-12-05 00:01:16'),(27,13,1,1,'Order created','2024-12-05 00:34:06','2024-12-05 00:34:06'),(28,14,1,1,'Order created','2024-12-05 00:44:37','2024-12-05 00:44:37'),(29,15,2,1,'Order created','2024-12-05 09:07:38','2024-12-05 09:07:38'),(30,16,3,1,'Order created','2024-12-05 15:11:59','2024-12-05 15:11:59'),(31,16,3,1,'Order cancelled','2024-12-05 15:13:44','2024-12-05 15:13:44'),(32,17,1,1,'Order created','2024-12-23 23:18:18','2024-12-23 23:18:18'),(33,18,1,1,'Order created','2024-12-23 23:18:50','2024-12-23 23:18:50'),(34,19,1,1,'Order created','2024-12-30 17:44:34','2024-12-30 17:44:34'),(35,20,2,1,'Order created','2025-01-03 21:24:40','2025-01-03 21:24:40'),(36,21,1,1,'Order created','2025-01-04 23:39:10','2025-01-04 23:39:10'),(37,22,1,1,'Order created','2025-01-05 00:00:26','2025-01-05 00:00:26'),(38,23,1,1,'Order created','2025-01-05 00:03:05','2025-01-05 00:03:05'),(39,24,1,1,'Order created','2025-01-05 00:25:36','2025-01-05 00:25:36'),(40,25,1,1,'Order created','2025-01-05 00:28:53','2025-01-05 00:28:53'),(41,26,1,1,'Order created','2025-01-05 00:39:01','2025-01-05 00:39:01'),(42,27,1,1,'Order created','2025-01-08 22:41:21','2025-01-08 22:41:21'),(43,28,1,1,'Order created','2025-01-08 22:45:38','2025-01-08 22:45:38'),(44,29,1,1,'Order created','2025-01-09 00:14:26','2025-01-09 00:14:26'),(45,30,1,1,'Order created','2025-01-09 11:07:56','2025-01-09 11:07:56'),(46,31,1,1,'Order created','2025-01-11 20:33:44','2025-01-11 20:33:44'),(47,32,1,1,'Order created','2025-01-11 20:38:55','2025-01-11 20:38:55'),(48,33,1,1,'Order created','2025-01-11 20:52:09','2025-01-11 20:52:09'),(49,38,1,1,'Order created','2025-01-12 12:07:37','2025-01-12 12:07:37'),(50,39,1,1,'Order created','2025-01-12 13:10:55','2025-01-12 13:10:55'),(51,40,1,1,'Order created','2025-01-12 13:12:25','2025-01-12 13:12:25'),(52,41,1,1,'Order created','2025-01-12 16:16:40','2025-01-12 16:16:40'),(53,42,1,1,'Order created','2025-01-26 14:22:33','2025-01-26 14:22:33'),(54,43,4,1,'Order created','2025-01-28 14:08:59','2025-01-28 14:08:59'),(55,43,4,1,'Order cancelled','2025-01-28 14:11:24','2025-01-28 14:11:24'),(56,44,4,1,'Order created','2025-01-28 14:12:33','2025-01-28 14:12:33'),(57,44,1,4,'Order taken','2025-01-28 14:15:37','2025-01-28 14:15:37'),(58,44,1,3,'Order taken','2025-01-28 14:15:45','2025-01-28 14:15:45'),(59,44,1,3,'updated status into On The Way','2025-01-28 14:15:58','2025-01-28 14:15:58'),(60,44,1,3,'5615 otp has been updated','2025-01-28 14:15:58','2025-01-28 14:15:58'),(61,44,1,3,'updated status into Order Delivered','2025-01-28 14:16:15','2025-01-28 14:16:15'),(62,42,1,3,'Order taken','2025-01-28 22:17:03','2025-01-28 22:17:03'),(63,42,1,3,'updated status into On The Way','2025-01-28 22:17:11','2025-01-28 22:17:11'),(64,42,1,3,'3885 otp has been updated','2025-01-28 22:17:11','2025-01-28 22:17:11'),(65,42,1,3,'updated status into On The Way','2025-01-28 22:20:32','2025-01-28 22:20:32'),(66,42,1,3,'1767 otp has been updated','2025-01-28 22:20:32','2025-01-28 22:20:32'),(67,42,1,3,'updated status into On The Way','2025-01-28 22:21:28','2025-01-28 22:21:28'),(68,42,1,3,'1497 otp has been updated','2025-01-28 22:21:28','2025-01-28 22:21:28'),(69,42,1,3,'updated status into On The Way','2025-01-28 22:22:52','2025-01-28 22:22:52'),(70,42,1,3,'2093 otp has been updated','2025-01-28 22:22:52','2025-01-28 22:22:52'),(71,42,1,3,'updated status into On The Way','2025-01-28 22:24:27','2025-01-28 22:24:27'),(72,42,1,3,'3809 otp has been updated','2025-01-28 22:24:27','2025-01-28 22:24:27'),(73,42,1,3,'updated status into On The Way','2025-01-28 22:27:51','2025-01-28 22:27:51'),(74,42,1,3,'6887 otp has been updated','2025-01-28 22:27:51','2025-01-28 22:27:51'),(75,42,1,3,'updated status into Order Delivered','2025-01-28 22:28:11','2025-01-28 22:28:11'),(76,41,1,3,'Order taken','2025-01-28 22:30:32','2025-01-28 22:30:32'),(77,45,4,1,'Order created','2025-02-03 14:12:31','2025-02-03 14:12:31'),(78,45,1,3,'Order taken','2025-02-03 14:15:34','2025-02-03 14:15:34'),(79,46,1,1,'Order created','2025-03-09 18:03:37','2025-03-09 18:03:37');
/*!40000 ALTER TABLE `order_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `payment_name` varchar(255) NOT NULL,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `order_payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_payment_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `details`.`payment_method` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
INSERT INTO `order_payment` VALUES (1,1,1,'Cash On Delivery','2024-11-25 22:17:27'),(2,2,1,'Cash On Delivery','2024-11-25 23:45:57'),(3,3,1,'Cash On Delivery','2024-11-26 11:34:50'),(4,4,1,'Cash On Delivery','2024-11-26 14:52:40'),(5,5,1,'Cash On Delivery','2024-11-30 17:04:57'),(6,6,1,'Cash On Delivery','2024-11-30 17:08:54'),(7,7,1,'Cash On Delivery','2024-11-30 17:17:36'),(8,8,1,'Cash On Delivery','2024-11-30 18:36:06'),(9,9,1,'Cash On Delivery','2024-12-02 18:44:02'),(10,10,1,'Cash On Delivery','2024-12-04 23:58:06'),(11,11,1,'Cash On Delivery','2024-12-04 23:59:13'),(12,12,1,'Cash On Delivery','2024-12-05 00:01:16'),(13,13,1,'Cash On Delivery','2024-12-05 00:34:06'),(14,14,1,'Cash On Delivery','2024-12-05 00:44:37'),(15,15,1,'Cash On Delivery','2024-12-05 09:07:38'),(16,16,1,'Cash On Delivery','2024-12-05 15:11:59'),(17,17,1,'Cash On Delivery','2024-12-23 23:18:18'),(18,18,1,'Cash On Delivery','2024-12-23 23:18:50'),(19,19,1,'Cash On Delivery','2024-12-30 17:44:34'),(20,20,1,'Cash On Delivery','2025-01-03 21:24:40'),(21,21,1,'Cash On Delivery','2025-01-04 23:39:10'),(22,22,1,'Cash On Delivery','2025-01-05 00:00:26'),(23,23,1,'Cash On Delivery','2025-01-05 00:03:05'),(24,24,1,'Cash On Delivery','2025-01-05 00:25:36'),(25,25,1,'Cash On Delivery','2025-01-05 00:28:53'),(26,26,1,'Cash On Delivery','2025-01-05 00:39:01'),(27,27,1,'Cash On Delivery','2025-01-08 22:41:21'),(28,28,1,'Cash On Delivery','2025-01-08 22:45:38'),(29,29,1,'Cash On Delivery','2025-01-09 00:14:26'),(30,30,1,'Cash On Delivery','2025-01-09 11:07:56'),(31,31,1,'Cash On Delivery','2025-01-11 20:33:44'),(32,32,1,'Cash On Delivery','2025-01-11 20:38:55'),(33,33,1,'Cash On Delivery','2025-01-11 20:52:09'),(34,38,1,'Cash On Delivery','2025-01-12 12:07:37'),(35,39,1,'Cash On Delivery','2025-01-12 13:10:55'),(36,40,1,'Cash On Delivery','2025-01-12 13:12:25'),(37,41,1,'Cash On Delivery','2025-01-12 16:16:40'),(38,42,1,'Cash On Delivery','2025-01-26 14:22:33'),(39,43,1,'Cash On Delivery','2025-01-28 14:08:59'),(40,44,1,'Cash On Delivery','2025-01-28 14:12:33'),(41,45,1,'Cash On Delivery','2025-02-03 14:12:31'),(42,46,1,'Cash On Delivery','2025-03-09 18:03:37');
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `updated_at` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_status_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status_list` (`status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,1,1,'2024-11-25 22:17:27'),(2,1,2,'2024-11-25 22:17:45'),(3,1,3,'2024-11-25 22:17:48'),(4,1,4,'2024-11-25 22:17:59'),(8,2,1,'2024-11-25 23:45:57'),(9,2,2,'2024-11-25 23:46:55'),(10,2,3,''),(11,2,4,''),(15,3,1,'2024-11-26 11:34:50'),(16,3,2,'2024-11-26 18:48:48'),(17,3,3,''),(18,3,4,''),(22,4,1,'2024-11-26 14:52:40'),(23,4,2,'2024-11-26 14:54:44'),(24,4,3,'2024-11-26 14:55:00'),(25,4,4,'2024-11-26 14:55:16'),(29,5,1,'2024-11-30 17:04:57'),(30,5,2,''),(31,5,3,''),(32,5,4,''),(36,6,1,'2024-11-30 17:08:54'),(37,6,2,''),(38,6,3,''),(39,6,4,''),(43,7,1,'2024-11-30 17:17:36'),(44,7,2,''),(45,7,3,''),(46,7,4,''),(50,8,1,'2024-11-30 18:36:06'),(51,8,2,'2024-12-02 18:07:29'),(52,8,3,'2024-12-02 18:07:32'),(53,8,4,'2024-12-02 18:08:33'),(57,9,1,'2024-12-02 18:44:02'),(58,9,2,''),(59,9,3,''),(60,9,4,''),(64,10,1,'2024-12-04 23:58:06'),(65,10,2,''),(66,10,3,''),(67,10,4,''),(71,11,1,'2024-12-04 23:59:13'),(72,11,2,''),(73,11,3,''),(74,11,4,''),(78,12,1,'2024-12-05 00:01:16'),(79,12,2,''),(80,12,3,''),(81,12,4,''),(85,13,1,'2024-12-05 00:34:06'),(86,13,2,''),(87,13,3,''),(88,13,4,''),(92,14,1,'2024-12-05 00:44:37'),(93,14,2,''),(94,14,3,''),(95,14,4,''),(99,15,1,'2024-12-05 09:07:38'),(100,15,2,''),(101,15,3,''),(102,15,4,''),(106,16,1,'2024-12-05 15:11:59'),(107,16,2,''),(108,16,3,''),(109,16,4,''),(110,17,1,'2024-12-23 23:18:18'),(111,17,2,''),(112,17,3,''),(113,17,4,''),(117,18,1,'2024-12-23 23:18:50'),(118,18,2,''),(119,18,3,''),(120,18,4,''),(124,19,1,'2024-12-30 17:44:34'),(125,19,2,''),(126,19,3,''),(127,19,4,''),(131,20,1,'2025-01-03 21:24:40'),(132,20,2,''),(133,20,3,''),(134,20,4,''),(138,21,1,'2025-01-04 23:39:10'),(139,21,2,''),(140,21,3,''),(141,21,4,''),(145,22,1,'2025-01-05 00:00:26'),(146,22,2,''),(147,22,3,''),(148,22,4,''),(152,23,1,'2025-01-05 00:03:05'),(153,23,2,''),(154,23,3,''),(155,23,4,''),(159,24,1,'2025-01-05 00:25:36'),(160,24,2,''),(161,24,3,''),(162,24,4,''),(166,25,1,'2025-01-05 00:28:53'),(167,25,2,''),(168,25,3,''),(169,25,4,''),(170,26,1,'2025-01-05 00:39:01'),(171,26,2,''),(172,26,3,''),(173,26,4,''),(177,27,1,'2025-01-08 22:41:21'),(178,27,2,''),(179,27,3,''),(180,27,4,''),(184,28,1,'2025-01-08 22:45:38'),(185,28,2,''),(186,28,3,''),(187,28,4,''),(191,29,1,'2025-01-09 00:14:26'),(192,29,2,''),(193,29,3,''),(194,29,4,''),(195,30,1,'2025-01-09 11:07:56'),(196,30,2,''),(197,30,3,''),(198,30,4,''),(199,31,1,'2025-01-11 20:33:44'),(200,31,2,''),(201,31,3,''),(202,31,4,''),(206,32,1,'2025-01-11 20:38:55'),(207,32,2,''),(208,32,3,''),(209,32,4,''),(213,33,1,'2025-01-11 20:52:09'),(214,33,2,''),(215,33,3,''),(216,33,4,''),(220,38,1,'2025-01-12 12:07:37'),(221,38,2,''),(222,38,3,''),(223,38,4,''),(227,39,1,'2025-01-12 13:10:55'),(228,39,2,''),(229,39,3,''),(230,39,4,''),(234,40,1,'2025-01-12 13:12:25'),(235,40,2,''),(236,40,3,''),(237,40,4,''),(241,41,1,'2025-01-12 16:16:40'),(242,41,2,'2025-01-28 22:30:32'),(243,41,3,''),(244,41,4,''),(245,42,1,'2025-01-26 14:22:33'),(246,42,2,'2025-01-28 22:17:03'),(247,42,3,'2025-01-28 22:27:51'),(248,42,4,'2025-01-28 22:28:11'),(252,43,1,'2025-01-28 14:08:59'),(253,43,2,''),(254,43,3,''),(255,43,4,''),(259,44,1,'2025-01-28 14:12:33'),(260,44,2,'2025-01-28 14:15:37'),(261,44,3,'2025-01-28 14:15:58'),(262,44,4,'2025-01-28 14:16:15'),(266,45,1,'2025-02-03 14:12:31'),(267,45,2,'2025-02-03 14:15:34'),(268,45,3,''),(269,45,4,''),(270,46,1,'2025-03-09 18:03:37'),(271,46,2,''),(272,46,3,''),(273,46,4,'');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_list`
--

DROP TABLE IF EXISTS `order_status_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_list` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `short_form` varchar(100) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `short_form` (`short_form`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_list`
--

LOCK TABLES `order_status_list` WRITE;
/*!40000 ALTER TABLE `order_status_list` DISABLE KEYS */;
INSERT INTO `order_status_list` VALUES (2,'Confirmed','Order Confirmed'),(4,'Delivered','Order Delivered'),(3,'On The Way','On The Way'),(1,'Placed','Order Received');
/*!40000 ALTER TABLE `order_status_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `restaurant_id` int DEFAULT NULL,
  `type` int NOT NULL,
  `sub_total` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `delivery_charges` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `delivery_discount` int NOT NULL DEFAULT '0',
  `delivery_share_price` int NOT NULL DEFAULT '0',
  `savings` int NOT NULL DEFAULT '0',
  `free_delivery` int NOT NULL DEFAULT '0',
  `platform_fee` int NOT NULL DEFAULT '0',
  `grand_total` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `coupon_code` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `coupon_amount` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `isCancelled` int NOT NULL DEFAULT '0',
  `isDelivered` int NOT NULL DEFAULT '0',
  `delivery_person_id` int DEFAULT NULL,
  `order_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cooking_instructions` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor_id` int DEFAULT NULL,
  `order_taken` int DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `otp_expired` datetime DEFAULT NULL,
  `delay_duration` int NOT NULL DEFAULT '120',
  `alert` longtext,
  PRIMARY KEY (`order_id`),
  KEY `delivery_person_id` (`delivery_person_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `order_taken` (`order_taken`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `type` (`type`),
  KEY `order_created` (`order_created`),
  KEY `status` (`status`,`otp`),
  KEY `isCancelled` (`isDelivered`,`isCancelled`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`delivery_person_id`) REFERENCES `users`.`delivery_persons` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`vendor_id`) REFERENCES `restaurant_users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`order_taken`) REFERENCES `details`.`user_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`type`) REFERENCES `restaurant_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,'290','10',15,8,0,0,6,'306','',0,4,0,1,1,'2024-11-25 22:17:27','',NULL,3,8988,'2024-11-25 22:57:48',120,NULL),(2,1,1,1,'25','10',15,8,0,0,6,'41','',0,2,0,0,1,'2024-11-25 23:45:57','',NULL,3,NULL,NULL,120,NULL),(3,2,1,1,'25','10',15,8,10,0,6,'41','',0,2,0,0,1,'2024-11-26 14:07:01','',NULL,3,NULL,NULL,120,NULL),(4,1,1,1,'165','10',15,8,20,0,6,'181','',0,4,0,1,1,'2024-11-26 14:52:40','',NULL,3,8681,'2024-11-26 15:35:00',120,NULL),(5,1,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2024-11-30 17:04:57','',NULL,NULL,NULL,NULL,180,NULL),(6,1,1,1,'45','10',15,8,10,0,6,'61','',0,1,0,0,NULL,'2024-11-30 17:08:54','',NULL,NULL,NULL,NULL,180,NULL),(7,1,1,1,'55','10',15,8,10,0,6,'71','',0,1,0,0,NULL,'2024-11-30 17:24:00','',NULL,NULL,NULL,NULL,300,NULL),(8,2,1,1,'55','10',15,8,10,0,6,'71','',0,4,0,1,1,'2024-12-02 17:57:00','',NULL,3,8706,'2024-12-02 18:47:32',180,NULL),(9,1,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2024-12-02 18:44:02','',NULL,NULL,NULL,NULL,180,'test'),(10,1,1,1,'45','10',15,8,10,0,6,'61','',0,1,0,0,NULL,'2024-12-04 23:58:06','',NULL,NULL,NULL,NULL,180,NULL),(11,1,1,1,'90','10',15,8,15,0,6,'106','',0,1,0,0,NULL,'2024-12-04 23:59:13','',NULL,NULL,NULL,NULL,180,NULL),(12,1,1,1,'45','10',15,8,10,0,6,'61','',0,1,0,0,NULL,'2024-12-05 00:01:16','',NULL,NULL,NULL,NULL,180,NULL),(13,1,1,1,'95','10',15,8,30,0,6,'111','',0,1,0,0,NULL,'2024-12-05 00:34:06','',NULL,NULL,NULL,NULL,180,'delay'),(14,1,1,1,'190','10',15,8,55,0,6,'206','',0,1,0,0,NULL,'2024-12-05 00:44:37','',NULL,NULL,NULL,NULL,180,'We sincerely apologize for the delay in fulfilling your order. Due to heavy rain, there may be some delays in our delivery service. We\'re doing our best to ensure your meal arrives as quickly and safely as possible. We greatly appreciate your patience and understanding.'),(15,2,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2024-12-05 09:07:38','',NULL,NULL,NULL,NULL,180,NULL),(16,3,1,1,'130','10',15,8,15,0,6,'146','',0,1,1,0,NULL,'2024-12-05 15:11:59','Less Oil\nMedium Spicy',NULL,NULL,NULL,NULL,180,NULL),(17,1,2,1,'105','10',15,8,20,0,6,'121','',0,1,0,0,NULL,'2024-12-23 23:18:18','',NULL,NULL,NULL,NULL,180,NULL),(18,1,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2024-12-23 23:18:50','',NULL,NULL,NULL,NULL,180,NULL),(19,1,1,1,'305','10',15,8,40,0,6,'321','',0,1,0,0,NULL,'2024-12-30 17:44:34','',NULL,NULL,NULL,NULL,180,NULL),(20,2,5,1,'120','10',15,8,35,0,6,'136','',0,1,0,0,NULL,'2025-01-03 21:24:40','',NULL,NULL,NULL,NULL,180,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.'),(21,1,5,1,'50','10',15,8,30,0,6,'46','karthik',20,1,0,0,NULL,'2025-01-04 23:39:10','',NULL,NULL,NULL,NULL,180,NULL),(22,1,1,1,'75','10',15,8,20,0,6,'91','',0,1,0,0,NULL,'2025-01-05 00:00:26','',NULL,NULL,NULL,NULL,180,NULL),(23,1,1,1,'75','10',15,8,20,0,6,'91','',0,1,0,0,NULL,'2025-01-05 00:03:05','',NULL,NULL,NULL,NULL,180,NULL),(24,1,1,1,'55','10',15,8,10,0,6,'71','',0,1,0,0,NULL,'2025-01-05 00:25:36','',NULL,NULL,NULL,NULL,180,NULL),(25,1,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2025-01-05 00:28:53','',NULL,NULL,NULL,NULL,180,NULL),(26,1,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2025-01-05 00:39:01','',NULL,NULL,NULL,NULL,180,NULL),(27,1,5,1,'65','10',15,8,10,0,6,'81','',0,1,0,0,NULL,'2025-01-08 22:41:21','',NULL,NULL,NULL,NULL,180,NULL),(28,1,3,1,'120','10',15,8,15,0,6,'136','',0,1,0,0,NULL,'2025-01-08 22:45:38','',NULL,NULL,NULL,NULL,180,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.'),(29,1,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2025-01-09 00:14:26','',NULL,NULL,NULL,NULL,180,NULL),(30,1,1,1,'35','10',15,8,10,0,6,'51','',0,1,0,0,NULL,'2025-01-09 11:07:56','',NULL,NULL,NULL,NULL,180,NULL),(31,1,1,1,'70','10',15,8,15,0,6,'86','',0,1,0,0,NULL,'2025-01-11 20:33:44','',NULL,NULL,NULL,NULL,180,NULL),(32,1,5,1,'424','10',15,8,46,0,6,'440','',0,1,0,0,NULL,'2025-01-11 20:38:55','',NULL,NULL,NULL,NULL,180,NULL),(33,1,2,1,'1835','0',15,8,190,1,6,'1841','',0,1,0,0,NULL,'2025-01-11 20:52:09','',NULL,NULL,NULL,NULL,180,NULL),(38,1,1,1,'110','10',15,8,25,0,6,'126','',0,1,0,0,NULL,'2025-01-12 12:07:37','',NULL,NULL,NULL,NULL,180,NULL),(39,1,1,1,'220','10',15,8,45,0,6,'236','',0,1,0,0,NULL,'2025-01-12 13:10:55','',NULL,NULL,NULL,NULL,180,NULL),(40,1,1,1,'220','10',15,8,45,0,6,'236','',0,1,0,0,NULL,'2025-01-12 13:12:25','',NULL,NULL,NULL,NULL,180,NULL),(41,1,1,1,'35','10',15,8,7,0,6,'51','',0,2,0,0,1,'2025-01-28 16:16:40','',NULL,3,NULL,NULL,180,NULL),(42,1,1,1,'290','10',15,8,55,0,6,'306','',0,4,0,1,1,'2025-01-28 14:22:33','',NULL,3,6887,'2025-01-28 23:07:51',180,NULL),(43,4,1,1,'35','10',15,8,10,0,6,'51','',0,1,1,0,NULL,'2025-01-28 14:08:59','',NULL,NULL,NULL,NULL,180,'We sincerely apologize for the delay in fulfilling your order. Due to heavy traffic, our delivery is running behind schedule. We are doing everything we can to get your meal to you as quickly as possible. We truly appreciate your patience and understanding.'),(44,4,1,1,'35','10',15,8,10,0,6,'51','',0,4,0,1,1,'2025-01-28 14:12:33','',1,3,5615,'2025-01-28 14:55:58',180,NULL),(45,4,1,1,'70','10',15,8,15,0,6,'86','',0,2,0,0,1,'2025-02-03 14:12:31','',NULL,3,NULL,NULL,180,'We sincerely apologize for the delay in fulfilling your order. We are working hard to ensure the best quality, and your meal will be ready shortly. We truly appreciate your patience and understanding.'),(46,1,1,1,'975','0',15,8,100,1,6,'981','',0,1,0,0,NULL,'2025-03-09 18:03:37','',NULL,NULL,NULL,NULL,180,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`qfoods_admin`@`%`*/ /*!50003 TRIGGER `order_chat_inbox_insert` AFTER INSERT ON `orders` FOR EACH ROW INSERT INTO order_chat_inbox (order_id) VALUES (NEW.order_id) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `price_types`
--

DROP TABLE IF EXISTS `price_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_types`
--

LOCK TABLES `price_types` WRITE;
/*!40000 ALTER TABLE `price_types` DISABLE KEYS */;
INSERT INTO `price_types` VALUES (1,'individual','2024-06-24 13:51:53','2024-06-24 13:51:53'),(2,'with item price','2024-06-24 13:51:53','2024-06-24 13:51:53');
/*!40000 ALTER TABLE `price_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_dishes`
--

DROP TABLE IF EXISTS `related_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_id` int NOT NULL,
  `item_id` int NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dish_id` (`dish_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `related_dishes_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `related_dishes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_dishes`
--

LOCK TABLES `related_dishes` WRITE;
/*!40000 ALTER TABLE `related_dishes` DISABLE KEYS */;
INSERT INTO `related_dishes` VALUES (5,17,1,1,1,'2024-12-24 15:01:13','2024-12-24 15:01:13'),(6,17,3,2,1,'2024-12-24 15:01:13','2024-12-24 15:01:13');
/*!40000 ALTER TABLE `related_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_carousel`
--

DROP TABLE IF EXISTS `restaurant_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_carousel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `item_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`item_id`),
  KEY `type_id` (`type_id`,`isDeleted`) USING BTREE,
  CONSTRAINT `restaurant_carousel_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `restaurant_carousel_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_carousel`
--

LOCK TABLES `restaurant_carousel` WRITE;
/*!40000 ALTER TABLE `restaurant_carousel` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_carousel_types`
--

DROP TABLE IF EXISTS `restaurant_carousel_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_carousel_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_carousel_types`
--

LOCK TABLES `restaurant_carousel_types` WRITE;
/*!40000 ALTER TABLE `restaurant_carousel_types` DISABLE KEYS */;
INSERT INTO `restaurant_carousel_types` VALUES (1,'category','2024-05-04 22:18:49','2024-05-04 22:18:49'),(2,'tag','2024-05-04 22:18:49','2024-05-04 22:18:49'),(3,'restaurant','2024-07-13 13:25:07','2024-07-13 13:25:07'),(4,'search','2025-01-05 22:33:06','2025-01-05 22:33:06'),(6,'link','2025-02-05 01:28:00','2025-02-05 01:28:00'),(7,'Announcements','2025-02-05 01:28:00','2025-02-05 01:28:00');
/*!40000 ALTER TABLE `restaurant_carousel_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_item_reviews`
--

DROP TABLE IF EXISTS `restaurant_item_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_item_reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `item_id` int NOT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `review` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `comment` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `user_id` (`user_id`,`isDeleted`) USING BTREE,
  CONSTRAINT `restaurant_item_reviews_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `dish_items` (`dish_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `restaurant_item_reviews_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `restaurant_item_reviews_ibfk_3` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `restaurant_item_reviews_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users`.`users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_item_reviews`
--

LOCK TABLES `restaurant_item_reviews` WRITE;
/*!40000 ALTER TABLE `restaurant_item_reviews` DISABLE KEYS */;
INSERT INTO `restaurant_item_reviews` VALUES (1,4,1,1,4,4,'','Price','2024-11-26 14:56:05','2024-11-26 14:56:05',0),(2,44,4,1,1,5,'','','2025-01-28 14:17:19','2025-01-28 14:17:19',0),(3,42,1,1,1,4,'','','2025-02-06 01:18:58','2025-02-06 01:18:58',0),(4,42,1,1,3,5,'','','2025-02-06 01:18:58','2025-02-06 01:18:58',0);
/*!40000 ALTER TABLE `restaurant_item_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_offer`
--

DROP TABLE IF EXISTS `restaurant_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_offer` (
  `offer_id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`offer_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `restaurant_offer_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `restaurant_carousel_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_offer`
--

LOCK TABLES `restaurant_offer` WRITE;
/*!40000 ALTER TABLE `restaurant_offer` DISABLE KEYS */;
INSERT INTO `restaurant_offer` VALUES (2,4,NULL,'eaa4bb64-ca21-413f-b7d2-e5e8a2080fdf.jpg','#084869','#FFFFFF',1,200,'pongal',1,'2024-12-16 23:38:28','2025-02-08 22:46:33');
/*!40000 ALTER TABLE `restaurant_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_offer_types`
--

DROP TABLE IF EXISTS `restaurant_offer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_offer_types` (
  `restaurant_offer_id` int NOT NULL AUTO_INCREMENT,
  `offer` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`restaurant_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_offer_types`
--

LOCK TABLES `restaurant_offer_types` WRITE;
/*!40000 ALTER TABLE `restaurant_offer_types` DISABLE KEYS */;
INSERT INTO `restaurant_offer_types` VALUES (1,'bottom offer','2025-01-10 22:29:54','2025-01-10 22:29:54');
/*!40000 ALTER TABLE `restaurant_offer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_offers`
--

DROP TABLE IF EXISTS `restaurant_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_offers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `offer_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `offer_type_id` int NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `offer_id` (`offer_id`),
  KEY `offer_type_id` (`offer_type_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `restaurant_offers_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`offer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `restaurant_offers_ibfk_2` FOREIGN KEY (`offer_type_id`) REFERENCES `restaurant_offer_types` (`restaurant_offer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `restaurant_offers_ibfk_3` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_offers`
--

LOCK TABLES `restaurant_offers` WRITE;
/*!40000 ALTER TABLE `restaurant_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_types`
--

DROP TABLE IF EXISTS `restaurant_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_types`
--

LOCK TABLES `restaurant_types` WRITE;
/*!40000 ALTER TABLE `restaurant_types` DISABLE KEYS */;
INSERT INTO `restaurant_types` VALUES (1,'restaurant','2024-09-22 10:53:50','2024-09-22 10:53:50');
/*!40000 ALTER TABLE `restaurant_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_users`
--

DROP TABLE IF EXISTS `restaurant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone_number` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `add_item` int NOT NULL DEFAULT '0',
  `edit_item` int NOT NULL DEFAULT '0',
  `delete_item` int NOT NULL DEFAULT '0',
  `add_variant` int NOT NULL DEFAULT '0',
  `edit_variant` int NOT NULL DEFAULT '0',
  `delete_variant` int NOT NULL DEFAULT '0',
  `add_variant_item` int NOT NULL DEFAULT '0',
  `edit_variant_item` int NOT NULL DEFAULT '0',
  `delete_variant_item` int NOT NULL DEFAULT '0',
  `add_menu` int NOT NULL DEFAULT '0',
  `edit_menu` int NOT NULL DEFAULT '0',
  `delete_menu` int NOT NULL DEFAULT '0',
  `add_menu_item` int NOT NULL DEFAULT '0',
  `edit_menu_item` int NOT NULL DEFAULT '0',
  `delete_menu_item` int NOT NULL DEFAULT '0',
  `add_price` int NOT NULL DEFAULT '0',
  `edit_price` int NOT NULL DEFAULT '0',
  `add_sale_price` int NOT NULL DEFAULT '0',
  `edit_sale_price` int NOT NULL DEFAULT '0',
  `edit_image` int NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  `blocked` int NOT NULL DEFAULT '0',
  `restaurant_status` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `password` (`phone_number`,`password`) USING BTREE,
  CONSTRAINT `restaurant_users_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_users`
--

LOCK TABLES `restaurant_users` WRITE;
/*!40000 ALTER TABLE `restaurant_users` DISABLE KEYS */;
INSERT INTO `restaurant_users` VALUES (1,1,'tester','1234567890','751fb626f90dde1f3113657126cfe8de',0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,'2024-11-18 20:23:46','2024-12-25 20:56:13'),(2,2,'Maharaj ','8825923820','e9b36680435bff800ab6e03db544e0b3',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,'2024-12-01 20:01:19','2024-12-19 15:16:18'),(3,3,'Pandian Mess','7373345834','98c9bf1015025f63fde89144e3d53774',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,'2024-12-25 20:40:30','2024-12-25 20:40:30'),(5,5,'Saravanan','9942114499','bec22435fa78904fcfff1895b381e263',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,'2024-12-29 21:39:58','2024-12-29 21:39:58');
/*!40000 ALTER TABLE `restaurant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` int NOT NULL DEFAULT '1',
  `short_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `latitude` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `longitude` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `keywords` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sale_item_offer` int NOT NULL DEFAULT '0',
  `sale_item_background_color` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `sale_item_color` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `visible` int NOT NULL DEFAULT '1',
  `isDeleted` int NOT NULL DEFAULT '0',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`restaurant_id`),
  KEY `latitude` (`latitude`,`longitude`),
  KEY `type` (`type`,`isDeleted`,`visible`,`status`,`sale_item_offer`,`sale_item_background_color`,`sale_item_color`) USING BTREE,
  FULLTEXT KEY `restaurant_name` (`restaurant_name`,`description`,`address`,`short_description`,`keywords`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`type`) REFERENCES `restaurant_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Hot spot restaurant',1,'Biryani, chicken 65','Chicken rice','6d5e185d-1b97-4484-909c-1704acff5167.jpg','budalur road, tkp','1234567890','10.847723','78.955211',1,'biryani',1,'#DCFCE7','#3CD956',1,0,'2025-01-11 15:29:46'),(2,'TN49 Food Safari',1,'BBQ, Shawarma','Biryani, Chicken 65','a69bc175-8de1-4985-bc16-4e6abea13b67.jpg','Budalur Road, Thirukkattupalli','8825923820','10.8434499','78.9577974',1,'Biryani, Milkshake, Shawarma, BBQ',1,'#DCFCE7','#3CD956',1,0,'2025-01-11 15:34:29'),(3,'Pandian Mess',1,'Parotta, Biriyani, Dosa','','002f1c8b-6271-45f7-8acf-f40146f9d936.png','Onbathuveli, Thirukkattupalli','7373345834','10.851684820272105','78.95473552634708',1,'',1,'#DCFCE7','#3CD956',1,0,'2025-01-11 15:34:35'),(5,'New Ariya Bhavan',1,'Idly, Poori, Pongal, Dosa, Parotta, Chola Poori','South Indian, Chinese','035ec100-42ae-4bb7-9636-a15dcf28956c.jpg','Near Bus stand, Thirukkattupalli','9942114499','10.8494090','78.9546036',1,'Veg restaurant',1,'#DCFCE7','#3CD956',1,0,'2025-01-10 22:18:58');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `select_variant_types`
--

DROP TABLE IF EXISTS `select_variant_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `select_variant_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `select_variant_types`
--

LOCK TABLES `select_variant_types` WRITE;
/*!40000 ALTER TABLE `select_variant_types` DISABLE KEYS */;
INSERT INTO `select_variant_types` VALUES (1,'radio','2024-05-13 11:33:19','2024-05-13 11:33:19'),(2,'checkbox','2024-05-13 11:33:19','2024-05-13 11:33:19');
/*!40000 ALTER TABLE `select_variant_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_restaurants`
--

DROP TABLE IF EXISTS `top_restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_restaurants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `position` int DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `top_restaurants_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_restaurants`
--

LOCK TABLES `top_restaurants` WRITE;
/*!40000 ALTER TABLE `top_restaurants` DISABLE KEYS */;
INSERT INTO `top_restaurants` VALUES (1,1,1,1,'2024-11-18 20:39:33','2024-11-18 20:39:33'),(2,2,2,1,'2024-12-01 20:30:13','2024-12-01 20:30:13'),(3,3,3,1,'2024-12-29 20:33:39','2024-12-29 20:34:26'),(4,5,4,1,'2024-12-30 17:24:09','2024-12-30 17:24:09');
/*!40000 ALTER TABLE `top_restaurants` ENABLE KEYS */;
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
