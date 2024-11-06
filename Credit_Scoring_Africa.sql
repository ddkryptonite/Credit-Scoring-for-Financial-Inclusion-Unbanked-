CREATE DATABASE  IF NOT EXISTS `creditscoringafrica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `creditscoringafrica`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: creditscoringafrica
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `creditscorehistory`
--

DROP TABLE IF EXISTS `creditscorehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditscorehistory` (
  `ScoreID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `Score` int DEFAULT NULL,
  `DateUpdated` date DEFAULT NULL,
  PRIMARY KEY (`ScoreID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `creditscorehistory_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditscorehistory`
--

LOCK TABLES `creditscorehistory` WRITE;
/*!40000 ALTER TABLE `creditscorehistory` DISABLE KEYS */;
INSERT INTO `creditscorehistory` VALUES (1,1,650,'2024-01-01'),(2,1,670,'2024-03-01'),(3,2,600,'2024-01-01'),(4,3,550,'2024-01-01'),(5,4,700,'2024-01-01'),(6,5,620,'2024-01-01'),(7,6,580,'2024-01-01'),(8,7,640,'2024-02-01'),(9,8,620,'2024-03-01'),(10,9,590,'2024-04-01'),(11,10,670,'2024-05-01'),(12,6,590,'2024-06-01'),(13,7,650,'2024-07-01'),(14,8,630,'2024-08-01'),(15,9,610,'2024-09-01'),(16,10,680,'2024-10-01');
/*!40000 ALTER TABLE `creditscorehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Income` decimal(10,2) DEFAULT NULL,
  `EmploymentStatus` varchar(20) DEFAULT NULL,
  `AccountAge` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Ama','Mensah',28,'Ghana',450.00,'Employed',24),(2,'John','Doe',35,'Nigeria',800.00,'Self-Employed',36),(3,'Amina','Hassan',22,'Kenya',300.00,'Unemployed',12),(4,'Kwame','Nkrumah',40,'Ghana',1200.00,'Employed',48),(5,'Zainab','Abdullah',31,'Uganda',600.00,'Employed',30),(6,'Nana','Asante',29,'Ghana',700.00,'Self-Employed',40),(7,'Grace','Ochieng',27,'Kenya',500.00,'Employed',20),(8,'Julius','Okeke',32,'Nigeria',900.00,'Unemployed',60),(9,'Fatima','Ali',34,'Uganda',850.00,'Employed',50),(10,'Sam','Abebe',45,'Ethiopia',1200.00,'Self-Employed',72),(11,'Ayo','Folarin',31,'Nigeria',400.00,'Employed',25),(12,'Linda','Mwangi',26,'Kenya',620.00,'Unemployed',18),(13,'Kofi','Baah',38,'Ghana',1100.00,'Employed',36);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanapplications`
--

DROP TABLE IF EXISTS `loanapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanapplications` (
  `LoanID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `LoanAmount` decimal(10,2) DEFAULT NULL,
  `ApplicationDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LoanID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `loanapplications_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanapplications`
--

LOCK TABLES `loanapplications` WRITE;
/*!40000 ALTER TABLE `loanapplications` DISABLE KEYS */;
INSERT INTO `loanapplications` VALUES (1,1,300.00,'2024-01-05','Approved'),(2,2,500.00,'2024-02-15','Rejected'),(3,3,150.00,'2024-03-10','Approved'),(4,4,1000.00,'2024-04-12','Rejected'),(5,5,200.00,'2024-05-22','Approved'),(6,6,400.00,'2024-01-15','Rejected'),(7,7,300.00,'2024-02-22','Approved'),(8,8,200.00,'2024-03-05','Approved'),(9,9,750.00,'2024-04-10','Rejected'),(10,10,1000.00,'2024-05-18','Approved'),(11,6,150.00,'2024-06-05','Rejected'),(12,7,500.00,'2024-06-28','Approved'),(13,8,120.00,'2024-07-08','Rejected'),(14,9,330.00,'2024-08-01','Approved'),(15,10,600.00,'2024-08-15','Rejected');
/*!40000 ALTER TABLE `loanapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobileusage`
--

DROP TABLE IF EXISTS `mobileusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobileusage` (
  `UsageID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `MonthlyDataUsage` decimal(6,2) DEFAULT NULL,
  `AverageMonthlyCalls` int DEFAULT NULL,
  `DateRecorded` date DEFAULT NULL,
  PRIMARY KEY (`UsageID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `mobileusage_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobileusage`
--

LOCK TABLES `mobileusage` WRITE;
/*!40000 ALTER TABLE `mobileusage` DISABLE KEYS */;
INSERT INTO `mobileusage` VALUES (1,1,1024.50,200,'2024-01-01'),(2,2,2048.75,150,'2024-02-01'),(3,3,512.00,300,'2024-03-01'),(4,4,3072.60,400,'2024-04-01'),(5,5,1024.30,250,'2024-05-01'),(6,6,1536.50,220,'2024-01-01'),(7,7,2450.80,180,'2024-02-01'),(8,8,768.00,280,'2024-03-01'),(9,9,3680.70,430,'2024-04-01'),(10,10,1260.90,240,'2024-05-01'),(11,6,1650.50,230,'2024-06-01'),(12,7,2575.20,190,'2024-07-01'),(13,8,810.00,290,'2024-08-01'),(14,9,3795.40,450,'2024-09-01'),(15,10,1305.20,250,'2024-10-01');
/*!40000 ALTER TABLE `mobileusage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `TransactionDate` date DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,50.00,'2024-01-15','Debit'),(2,1,200.00,'2024-02-15','Credit'),(3,2,150.00,'2024-03-20','Debit'),(4,3,100.00,'2024-04-22','Credit'),(5,4,500.00,'2024-05-05','Debit'),(6,5,70.00,'2024-06-18','Credit'),(7,6,300.00,'2024-01-20','Credit'),(8,7,75.00,'2024-02-10','Debit'),(9,8,250.00,'2024-03-18','Credit'),(10,9,150.00,'2024-04-22','Debit'),(11,10,125.00,'2024-05-15','Credit'),(12,6,500.00,'2024-06-01','Debit'),(13,7,320.00,'2024-06-12','Credit'),(14,8,480.00,'2024-06-25','Debit'),(15,9,90.00,'2024-07-05','Credit'),(16,10,130.00,'2024-07-15','Debit');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-06 20:29:31
