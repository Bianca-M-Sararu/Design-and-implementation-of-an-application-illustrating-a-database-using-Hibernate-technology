-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: platforma_de_streaming_audio
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `albume`
--

DROP TABLE IF EXISTS `albume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albume` (
  `idalbum` bigint NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL,
  `numarpiese` int NOT NULL,
  `dataLansare` date DEFAULT NULL,
  `stilmuzical` varchar(255) NOT NULL,
  PRIMARY KEY (`idalbum`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albume`
--

LOCK TABLES `albume` WRITE;
/*!40000 ALTER TABLE `albume` DISABLE KEYS */;
INSERT INTO `albume` VALUES (5,'My Songs',15,'2019-05-23','pop'),(6,'Goodbye Yellow Brick Road',17,'1973-10-05','pop'),(7,'Let\'s Talk About Love',15,'1997-11-14','pop');
/*!40000 ALTER TABLE `albume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `melodii`
--

DROP TABLE IF EXISTS `melodii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `melodii` (
  `idmelodie` bigint NOT NULL AUTO_INCREMENT,
  `idalbum` bigint NOT NULL,
  `idmuzician` bigint NOT NULL,
  `nume` varchar(255) NOT NULL,
  `durataMinute` int NOT NULL,
  `dataLansare` date DEFAULT NULL,
  `premiu` varchar(255) NOT NULL,
  PRIMARY KEY (`idmelodie`),
  KEY `fk_melodii_1_idx` (`idalbum`),
  KEY `fk_melodii_2_idx` (`idmuzician`),
  CONSTRAINT `fk_melodii_1` FOREIGN KEY (`idalbum`) REFERENCES `albume` (`idalbum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_melodii_2` FOREIGN KEY (`idmuzician`) REFERENCES `muzicieni` (`idmuzician`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `melodii`
--

LOCK TABLES `melodii` WRITE;
/*!40000 ALTER TABLE `melodii` DISABLE KEYS */;
INSERT INTO `melodii` VALUES (7,5,6,'Desert Rose',5,'2000-01-01','Sting Awards'),(8,5,6,'Every Breath You Take',4,'1983-05-26','Premiul Grammy pentru melodia anului'),(9,6,7,'Candle In The Wind',4,'1977-09-06','Grammy Award for Best Male Pop Vocal Performance'),(10,7,8,'Tell Him',5,'1997-11-03','Grammy Award for Best Male Pop Vocal Performance');
/*!40000 ALTER TABLE `melodii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muzicieni`
--

DROP TABLE IF EXISTS `muzicieni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muzicieni` (
  `idmuzician` bigint NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL,
  `prenume` varchar(255) NOT NULL,
  `numescena` varchar(255) NOT NULL,
  `aninceputactivitate` int NOT NULL,
  `varsta` int NOT NULL,
  `stilmuzical` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmuzician`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muzicieni`
--

LOCK TABLES `muzicieni` WRITE;
/*!40000 ALTER TABLE `muzicieni` DISABLE KEYS */;
INSERT INTO `muzicieni` VALUES (6,'Sumner','Gordon Matthew Thomas','STING',1980,73,'pop'),(7,'Elton','John','Elton John',1967,77,'pop'),(8,'Dion','Celine','Celine Dion',1982,56,'pop');
/*!40000 ALTER TABLE `muzicieni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-19 21:56:30
