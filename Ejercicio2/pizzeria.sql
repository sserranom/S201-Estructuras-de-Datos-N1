CREATE DATABASE  IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
  `zip_code` varchar(25) NOT NULL,
  `address` varchar(250) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `id_city_idx` (`id_city`),
  CONSTRAINT `id_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'08020','Calle Huelva 32, piso 1 p6'),(2,2,'00002','Direccion 2'),(3,3,'00003','Direccion 3'),(4,4,'08004','Direccion 4'),(11,5,'08005','Direccion 5');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_pizzas`
--

DROP TABLE IF EXISTS `category_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_pizzas` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_pizzas`
--

LOCK TABLES `category_pizzas` WRITE;
/*!40000 ALTER TABLE `category_pizzas` DISABLE KEYS */;
INSERT INTO `category_pizzas` VALUES (1,'Vegana'),(2,'Vegetariana');
/*!40000 ALTER TABLE `category_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_province` int DEFAULT NULL,
  PRIMARY KEY (`id_city`),
  KEY `id_province_idx` (`id_province`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Hospitalet de Llobregat',1),(2,'Alcalá de Henares',2),(3,'Dos Hermanas',3),(4,'Gandía',4),(5,'Marbellat',5);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id_custumer` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `id_address` int DEFAULT NULL,
  PRIMARY KEY (`id_custumer`),
  KEY `fk_id_address_idx` (`id_address`),
  CONSTRAINT `fk_id_address` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Sergio','Serrano','12345678',1),(2,'Juan','Perez','12345679',2),(3,'Fulano','De Tal','12345610',3),(4,'Pedro','Gonzalez','12345611',4),(5,'Jose','Gutierrez','12345612',11);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_details`
--

DROP TABLE IF EXISTS `delivery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_details` (
  `id_delivery_detail` int NOT NULL AUTO_INCREMENT,
  `id_order` int DEFAULT NULL,
  `id_employee` int DEFAULT NULL,
  `id_address` int DEFAULT NULL,
  `delivered` datetime NOT NULL,
  PRIMARY KEY (`id_delivery_detail`),
  KEY `fk_id_order_idx` (`id_order`),
  KEY `fk_id_employee_idx` (`id_employee`),
  KEY `id_address_idx` (`id_address`),
  CONSTRAINT `fk_id_employees` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id_employee`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_addresses` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_details`
--

LOCK TABLES `delivery_details` WRITE;
/*!40000 ALTER TABLE `delivery_details` DISABLE KEYS */;
INSERT INTO `delivery_details` VALUES (1,1,1,1,'2025-02-23 16:30:00'),(2,2,2,2,'2025-02-23 16:15:00'),(3,3,3,3,'2025-02-23 15:30:00'),(4,4,4,4,'2025-02-23 18:30:00'),(5,5,3,11,'2025-02-23 19:30:00');
/*!40000 ALTER TABLE `delivery_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `id_location` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `nif` char(9) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `type` enum('COCINERO','REPARTIDOR') NOT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `id_location_idx` (`id_location`),
  CONSTRAINT `id_location` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1,'Victor','Gonzalez','111111111','55555555','REPARTIDOR'),(2,2,'Carlos','Cruz','222222222','63259486','REPARTIDOR'),(3,3,'Daniel','Torres','333333333','64161366','REPARTIDOR'),(4,4,'Alan','Solano','444444444','96548265','REPARTIDOR'),(5,5,'Jorger','Perez','555655576','69532569','COCINERO');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id_location` int NOT NULL AUTO_INCREMENT,
  `id_address` int DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `id_address_idx` (`id_address`),
  CONSTRAINT `id_address` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,1,'Sucursal 1'),(2,2,'Sucursal 2'),(3,3,'Sucursal 3'),(4,4,'Sucursal 4'),(5,11,'Sucursal 5');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id_order_details` int NOT NULL AUTO_INCREMENT,
  `id_product` int DEFAULT NULL,
  `amount` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_order` int DEFAULT NULL,
  PRIMARY KEY (`id_order_details`),
  KEY `fk_id_order_idx` (`id_order`),
  KEY `fk_id_product_idx` (`id_product`),
  CONSTRAINT `fk_id_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,2,32.50,1),(2,2,4,6.40,2),(3,3,3,4.80,3),(4,4,2,3.20,4),(5,5,5,8.00,5);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `order_type` enum('PICKUP','DELIVERY') NOT NULL,
  `id_customer` int NOT NULL,
  `id_location` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_id_custumer_idx` (`id_customer`),
  KEY `fk_id_location_idx` (`id_location`),
  CONSTRAINT `fk_id_custumer` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_custumer`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_location` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-23 12:30:00','DELIVERY',1,1),(2,'2025-02-23 14:30:00','DELIVERY',2,2),(3,'2025-02-23 15:30:00','PICKUP',3,3),(4,'2025-02-23 14:15:00','DELIVERY',4,1),(5,'2025-02-23 12:10:00','PICKUP',5,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` enum('PIZZAS','HAMBURGUESAS','BEBIDAS') NOT NULL,
  `image` varchar(250) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_category_pizza` int DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `fk_id_category_pizza_idx` (`id_category_pizza`),
  CONSTRAINT `fk_id_category_pizza` FOREIGN KEY (`id_category_pizza`) REFERENCES `category_pizzas` (`id_category`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Coca Cola','500ml','BEBIDAS','https://midominio/recursos/img1',1.60,NULL),(2,'Pepsi','500ml','BEBIDAS','https://midominio/recursos/img2',1.60,NULL),(3,'Pizza full vegetales','Familiar','PIZZAS','https://midominio/recursos/img2',1.60,1),(4,'Hawaiana','Mediana','PIZZAS','https://midominio/recursos/img3',1.60,2),(5,'Big Burger','Grande','HAMBURGUESAS','https://midominio/recursos/img4',16.50,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id_province` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_province`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Barcelona'),(2,'Madrid'),(5,'Malaga'),(3,'Sevilla'),(4,'Valencia');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 19:41:28
