-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: fooddb
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20250805110148_CreateFoodTable','7.0.2'),('20250805111016_AddRatingToFoodItem','7.0.2'),('20250805125120_AddStockToFoodItem','7.0.2'),('20250805195559_AddUserTable','7.0.2'),('20250805210713_AddCartItemTable','7.0.2');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitems` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FoodItemId` int NOT NULL,
  `Username` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_CartItems_FoodItemId` (`FoodItemId`),
  CONSTRAINT `FK_CartItems_FoodItems_FoodItemId` FOREIGN KEY (`FoodItemId`) REFERENCES `fooditems` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` VALUES (13,3,'alpha',8);
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooditems`
--

DROP TABLE IF EXISTS `fooditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fooditems` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ingredients` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `OriginalPrice` decimal(65,30) NOT NULL,
  `DiscountedPrice` decimal(65,30) NOT NULL,
  `ImagePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Rating` int NOT NULL DEFAULT '0',
  `Stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooditems`
--

LOCK TABLES `fooditems` WRITE;
/*!40000 ALTER TABLE `fooditems` DISABLE KEYS */;
INSERT INTO `fooditems` VALUES (2,'Pizza','Thin crust pizza with fine baked.','capsicum, tomato, corn, cheese',200.000000000000000000000000000000,150.000000000000000000000000000000,'/images/download.jpg',4,10),(3,'Pizza','thin crust , cheese burst pizza\r\n','base, tomato, origano',300.000000000000000000000000000000,199.000000000000000000000000000000,'/images/classic-cheese-pizza-FT-RECIPE0422-31a2c938fc2546c9a07b7011658cfd05.jpg',4,12),(4,'Pizza','Healthy and tasty','base, capsicum, paneer',200.000000000000000000000000000000,149.000000000000000000000000000000,'/images/Pizza-3007395.jpg',3,12),(5,'Pizza','spicy pizza','base, tomato, onion, origano,red chilli',399.000000000000000000000000000000,299.000000000000000000000000000000,'/images/Supreme_Pizza_006-3b04db62117d404e9c37b126d7a7f0a2.jpg',3,20),(6,'garlic bread','garlic bread with cheese','garlic bread , cheese, tomato',299.000000000000000000000000000000,159.000000000000000000000000000000,'/images/garlic bread.jpg',4,50),(7,'garlic bread with cheese burst','garlic bread ','corn, garlic bread',200.000000000000000000000000000000,149.000000000000000000000000000000,'/images/images.jpg',4,23),(8,'Pizza','cheese burst tasty pizza with thin base and extra joy','base, onion,capsicum,corn',899.000000000000000000000000000000,799.000000000000000000000000000000,'/images/images (1).jpg',5,50),(9,'Pizza','tomato pizza','tommato, cheese, base',499.000000000000000000000000000000,399.000000000000000000000000000000,'/images/images (2).jpg',4,50),(10,'Meal','enjoy meal with pizza,burger,cock','capsicum pizza,single pattie burger, pepsi',299.000000000000000000000000000000,199.000000000000000000000000000000,'/images/fIcG7rz2-400-400.webp',5,80),(11,'pizza','chicken pizza','chicken , base, cheese',599.000000000000000000000000000000,549.000000000000000000000000000000,'/images/images (3).jpg',5,150),(12,' meal','burger , friess, coke','double pattie burger , peri peri fries, coke',399.000000000000000000000000000000,249.000000000000000000000000000000,'/images/images (4).jpg',4,200),(13,'burger + pepsi','double pattie burger with veggies and fries','bun , veges , aloo tiki , cheese',299.000000000000000000000000000000,199.000000000000000000000000000000,'/images/images (5).jpg',5,150);
/*!40000 ALTER TABLE `fooditems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Users_Email` (`Email`),
  UNIQUE KEY `IX_Users_Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alpha','alpha@rathitech.me','1234'),(2,'bravo','bravo@rathitech.me','1234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-07  1:35:02
