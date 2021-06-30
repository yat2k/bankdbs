-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `acc_no` int NOT NULL,
  `branch_name` varchar(25) DEFAULT NULL,
  `balance` float(10,3) DEFAULT NULL,
  PRIMARY KEY (`acc_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (10,'SUB8',90000.000),(12,'SUB8',90000.000),(16,'SUB9',66000.000),(25,'SUB9',66000.000),(123,'MAIN',46000.000),(321,'MAIN',35000.000),(456,'SUB1',46000.000),(654,'SUB2',57000.000),(789,'SUB3',77000.000),(987,'SUB3',77000.000),(988,'SUB4',80000.000),(1000,'SUB5',80000.000),(1012,'SUB7',90000.000),(10001,'SUB6',88000.000),(10012,'SUB9',90000.000),(100012,'SUB6',90000.000);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower` (
  `cust_name` varchar(25) DEFAULT NULL,
  `loan_no` int DEFAULT NULL,
  KEY `cust_name` (`cust_name`),
  KEY `loan_no` (`loan_no`),
  CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `customer` (`cust_name`),
  CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES ('HARI',1234),('PRIYA',3456),('PRIYA',10456),('AMAN',34596),('ANKIT',104596),('UTKARSH',14596),('UJJWAL',5678),('YATHIN',1456),('NIE',11456),('LUCKY',345689);
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_name` varchar(25) NOT NULL,
  `branch_city` varchar(25) DEFAULT NULL,
  `assets` int DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('MAIN','HYDERABAD',30000),('SUB1','CHENNAI',45000),('SUB10','PUNE',88000),('SUB2','VIJAYWADA',56000),('SUB3','VIZAG',36000),('SUB4','RANCHI',60000),('SUB5','LUCKNOW',59000),('SUB6','DELHI',75000),('SUB7','MUMBAI',100000),('SUB8','MYSORE',95000),('SUB9','BANGALORE',1000000);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_name` varchar(25) NOT NULL,
  `cust_street` varchar(25) DEFAULT NULL,
  `cust_city` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`cust_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('AMAN','NEW AREA GANDHI NAGAR','RANCHI'),('ANKIT','DOCKYARD ROAD','CHENNAI'),('HARI','ABC','VIAZG'),('LUCKY','PQR','CHENNAI'),('NIE','MANANTHVADI ROAD','MYSORE'),('PINKY','BNM STREET','VIJAYAGAR'),('PRIYA','ABC','HYDERABAD'),('UJJWAL','BHARAT SINGH ROAD','LUCKNOW'),('UTKARSH','XYZ','HYDERABAD'),('YATHIN','WHITE FIELD','BANGALORE');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositor`
--

DROP TABLE IF EXISTS `depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depositor` (
  `cust_name` varchar(20) DEFAULT NULL,
  `acc_no` int DEFAULT NULL,
  KEY `cust_name` (`cust_name`),
  KEY `acc_no` (`acc_no`),
  CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `customer` (`cust_name`),
  CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`acc_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositor`
--

LOCK TABLES `depositor` WRITE;
/*!40000 ALTER TABLE `depositor` DISABLE KEYS */;
INSERT INTO `depositor` VALUES ('PRIYA',123),('PRIYA',123),('HARI',321),('LUCKY',456),('PINKY',1012),('AMAN',100012),('ANKIT',10012),('UTKARSH',12),('UJJWAL',16),('YATHIN',25),('NIE',988);
/*!40000 ALTER TABLE `depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_name` varchar(25) DEFAULT NULL,
  `branch_name` varchar(20) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('ANKITA','MAIN',45000),('ASH','SUB1',45000),('DEEPAK','SUB1',45000),('DEEPIKA','SUB5',45000),('SID','SUB5',55000),('SHIKHA','SUB7',55000),('KIARA','SUB6',65000),('AMITABH','SUB8',88000),('PAUL','SUB9',95000),('SHREYA','SUB9',75000),('AKHIL','SUB3',75000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_no` int NOT NULL,
  `branch_name` varchar(25) DEFAULT NULL,
  `amount` float(10,3) DEFAULT NULL,
  PRIMARY KEY (`loan_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1234,'MAIN',25000.000),(1456,'SUB3',95000.000),(3456,'SUB2',66000.000),(3459,'SUB4',75000.000),(5678,'SUB1',50000.000),(10456,'SUB7',90000.000),(11456,'SUB4',95000.000),(14056,'SUB5',99000.000),(14596,'SUB6',88000.000),(34568,'SUB3',70000.000),(34596,'SUB5',80000.000),(104596,'SUB6',87000.000),(345689,'SUB3',70000.000);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 11:35:27
