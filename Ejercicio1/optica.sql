CREATE DATABASE  IF NOT EXISTS `cul_dampolla` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cul_dampolla`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: cul_dampolla
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `id_city` int DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `number` varchar(10) DEFAULT NULL,
  `apartment` varchar(10) NOT NULL,
  `door` varchar(10) DEFAULT NULL,
  `zip_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `id_city_idx` (`id_city`),
  CONSTRAINT `id_city` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'Avenida Principal','101','A','1B','28001'),(2,2,'Calle Secundaria','202','B','2A','28002'),(3,3,'Paseo del Prado','303','C','3C','28003'),(4,4,'Gran Vía','404','D','4D','28004'),(5,5,'Calle Mayor','505','E','5E','28005');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id_brands` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_brands`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Nike'),(2,'Adidas'),(3,'Ray-Ban'),(4,'Oakley'),(5,'Puma');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_country` int DEFAULT NULL,
  PRIMARY KEY (`id_city`),
  KEY `fk_id_country_idx` (`id_country`),
  CONSTRAINT `fk_id_country` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id_country`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Barcelona',NULL),(2,'Madrid',NULL),(3,'París',NULL),(4,'Roma',NULL),(5,'Lisboa',NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id_color` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Rojo'),(2,'Azul'),(3,'Verde'),(4,'Negro'),(5,'Blanco');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id_country` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_country`),
  UNIQUE KEY `id_country_UNIQUE` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'España'),(2,'Francia'),(3,'Italia'),(4,'Alemania'),(5,'Portugal');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_address` int DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `register_date` date NOT NULL,
  `recomended` int DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `id_customer_UNIQUE` (`id_customer`),
  KEY `id_address_idx` (`id_address`),
  KEY `id_custumer_idx` (`recomended`),
  CONSTRAINT `id_address` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_customers` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Juan Pérez',1,'123456789','juan@example.com','2025-02-21',NULL),(2,'Ana García',2,'987654321','ana@example.com','2025-02-20',1),(3,'Carlos Ruiz',3,'555666777','carlos@example.com','2025-02-19',2),(4,'María López',4,'888999000','maria@example.com','2025-02-18',NULL),(5,'Luis Fernández',5,'111222333','luis@example.com','2025-02-17',3);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frames`
--

DROP TABLE IF EXISTS `frames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frames` (
  `id_frame` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('FLOTANTE','PASTA','METALICO') DEFAULT NULL,
  `id_color` int DEFAULT NULL,
  PRIMARY KEY (`id_frame`),
  KEY `fk_id_color_idx` (`id_color`),
  CONSTRAINT `fk_id_color_frames` FOREIGN KEY (`id_color`) REFERENCES `colors` (`id_color`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frames`
--

LOCK TABLES `frames` WRITE;
/*!40000 ALTER TABLE `frames` DISABLE KEYS */;
INSERT INTO `frames` VALUES (1,'FLOTANTE',1),(2,'PASTA',2),(3,'METALICO',3),(4,'FLOTANTE',4),(5,'PASTA',5);
/*!40000 ALTER TABLE `frames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `id_glass` int NOT NULL AUTO_INCREMENT,
  `id_brand` int DEFAULT NULL,
  `id_frame` int DEFAULT NULL,
  `id_glasses_lens` int DEFAULT NULL,
  `id_supplier` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_glass`),
  KEY `fk_id_brand_idx` (`id_brand`),
  KEY `fk_id_glasses_lens_idx` (`id_glasses_lens`),
  KEY `fk_id_supplier_idx` (`id_supplier`),
  KEY `fk_id_frames_idx` (`id_frame`),
  CONSTRAINT `fk_id_brand` FOREIGN KEY (`id_brand`) REFERENCES `brands` (`id_brands`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_frames` FOREIGN KEY (`id_frame`) REFERENCES `frames` (`id_frame`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_glasses_lens` FOREIGN KEY (`id_glasses_lens`) REFERENCES `glasses_lenses` (`id_glases_lens`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (6,1,1,1,1,50.00,0.00),(7,2,2,2,2,80.00,0.00),(8,3,3,3,3,100.00,0.00),(9,4,4,4,4,60.00,0.00),(10,5,5,5,5,120.00,0.00);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses_lenses`
--

DROP TABLE IF EXISTS `glasses_lenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses_lenses` (
  `id_glases_lens` int NOT NULL AUTO_INCREMENT,
  `eye` enum('DERECHO','IZQUIERDO') NOT NULL,
  `id_color` int NOT NULL,
  PRIMARY KEY (`id_glases_lens`),
  KEY `fk_id_color_idx` (`id_color`),
  CONSTRAINT `fk_id_color` FOREIGN KEY (`id_color`) REFERENCES `colors` (`id_color`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses_lenses`
--

LOCK TABLES `glasses_lenses` WRITE;
/*!40000 ALTER TABLE `glasses_lenses` DISABLE KEYS */;
INSERT INTO `glasses_lenses` VALUES (1,'DERECHO',1),(2,'IZQUIERDO',2),(3,'DERECHO',3),(4,'IZQUIERDO',4),(5,'DERECHO',5);
/*!40000 ALTER TABLE `glasses_lenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_details` (
  `id_sale_detail` int NOT NULL AUTO_INCREMENT,
  `id_sale` int DEFAULT NULL,
  `id_glass` int DEFAULT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id_sale_detail`),
  KEY `fk_id_sale_idx` (`id_sale`),
  KEY `fk_id_glase_idx` (`id_glass`),
  CONSTRAINT `fk_id_glass` FOREIGN KEY (`id_glass`) REFERENCES `glasses` (`id_glass`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_sale` FOREIGN KEY (`id_sale`) REFERENCES `sales` (`id_sale`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_details`
--

LOCK TABLES `sale_details` WRITE;
/*!40000 ALTER TABLE `sale_details` DISABLE KEYS */;
INSERT INTO `sale_details` VALUES (16,1,6,2),(17,2,7,1),(18,3,8,3),(19,4,9,4),(20,5,10,1);
/*!40000 ALTER TABLE `sale_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id_sale` int NOT NULL AUTO_INCREMENT,
  `id_customer` int DEFAULT NULL,
  `id_seller` int DEFAULT NULL,
  `date_sale` date NOT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `fk_id_custumer_idx` (`id_customer`),
  KEY `fk_id_seller_idx` (`id_seller`),
  CONSTRAINT `fk_id_custumer` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_seller` FOREIGN KEY (`id_seller`) REFERENCES `sellers` (`id_seller`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,1,'2025-02-21'),(2,2,2,'2025-02-20'),(3,3,3,'2025-02-19'),(4,4,4,'2025-02-18'),(5,5,5,'2025-02-17');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id_seller` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_seller`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Vendedor 1'),(2,'Vendedor 2'),(3,'Vendedor 3'),(4,'Vendedor 4'),(5,'Vendedor 5');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nif` char(9) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `id_address` int DEFAULT NULL,
  PRIMARY KEY (`id_supplier`),
  KEY `id_address_idx` (`id_address`),
  CONSTRAINT `fk_id_address` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Proveedor 1','B12345678','123123123','123123124',1),(2,'Proveedor 2','B23456789','234234234','234234235',2),(3,'Proveedor 3','B34567890','345345345','345345346',3),(4,'Proveedor 4','B45678901','456456456','456456457',4),(5,'Proveedor 5','B56789012','567567567','567567568',5);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-25 18:23:45
