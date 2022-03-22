-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(13,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `units_in_stock` int DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'BOOK-TECH-1000','Crash Course in Python','Learn Python at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',14.99,'assets/images/products/books/book-1000.png',_binary '',100,'2021-05-05 16:22:53.000000',NULL,1),(2,'BOOK-TECH-1001','Become a Guru in JavaScript','Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',20.99,'assets/images/products/books/book-1001.png',_binary '',100,'2021-05-05 16:22:54.000000',NULL,1),(3,'BOOK-TECH-1002','Exploring Vue.js','Learn Vue.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',14.99,'assets/images/products/books/book-1002.png',_binary '',100,'2021-05-05 16:22:56.000000',NULL,1),(4,'BOOK-TECH-1003','Advanced Techniques in Big Data','Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',13.99,'assets/images/products/books/book-1003.png',_binary '',100,'2021-05-05 16:22:57.000000',NULL,1),(5,'BOOK-TECH-1004','Crash Course in Big Data','Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',18.99,'assets/images/products/books/book-1004.png',_binary '',100,'2021-05-05 16:22:58.000000',NULL,1),(6,'BOOK-TECH-1005','JavaScript Cookbook','Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',23.99,'assets/images/products/books/book-1005.png',_binary '',100,'2021-05-05 16:22:59.000000',NULL,1),(7,'COFFEEMUG-1000','Coffee Mug - Express','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-1000.png',_binary '',100,'2021-05-05 16:23:02.000000',NULL,2),(8,'COFFEEMUG-1001','Coffee Mug - Cherokee','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-1001.png',_binary '',100,'2021-05-05 16:23:03.000000',NULL,2),(9,'COFFEEMUG-1002','Coffee Mug - Sweeper','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-1002.png',_binary '',100,'2021-05-05 16:23:04.000000',NULL,2),(10,'COFFEEMUG-1003','Coffee Mug - Aspire','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-1003.png',_binary '',100,'2021-05-05 16:23:05.000000',NULL,2),(11,'COFFEEMUG-1004','Coffee Mug - Dorian','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-1004.png',_binary '',100,'2021-05-05 16:23:06.000000',NULL,2),(12,'COFFEEMUG-1005','Coffee Mug - Columbia','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-1005.png',_binary '',100,'2021-05-05 16:23:07.000000',NULL,2),(13,'MOUSEPAD-1000','Mouse Pad - Express','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-1.png',_binary '',100,'2021-05-07 14:18:45.000000',NULL,3),(14,'MOUSEPAD-1001','Mouse Pad - Cherokee','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-2.png',_binary '',100,'2021-05-07 14:18:46.000000',NULL,3),(15,'MOUSEPAD-1002','Mouse Pad - Sweeper','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-3.png',_binary '',100,'2021-05-07 14:18:47.000000',NULL,3),(16,'MOUSEPAD-1003','Mouse Pad - Aspire','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-4.png',_binary '',100,'2021-05-07 14:18:48.000000',NULL,3),(17,'MOUSEPAD-1004','Mouse Pad - Dorian','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-5.png',_binary '',100,'2021-05-07 14:18:49.000000',NULL,3),(18,'MOUSEPAD-1005','Mouse Pad - Columbia','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-6.png',_binary '',100,'2021-05-07 14:19:00.000000',NULL,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'BOOKS'),(2,'Coffee Mugs'),(3,'Mouse Pads');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-22  9:40:06
