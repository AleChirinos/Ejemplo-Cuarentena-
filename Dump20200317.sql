-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cuarentena2
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `PacienteID` int NOT NULL,
  `DoctorID` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`PacienteID`,`DoctorID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`PacienteID`) REFERENCES `paciente` (`ID`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,1,'2010-01-02 00:00:00'),(2,2,'2011-05-16 00:00:00'),(3,3,'2012-09-30 00:00:00'),(4,4,'2013-07-23 00:00:00'),(5,5,'2014-03-09 00:00:00');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `piso` int NOT NULL,
  `nro` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,1,101),(2,3,302),(3,1,103),(4,5,504),(5,7,705);
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `personaID` int NOT NULL,
  `consultorioID` int NOT NULL,
  `especialidadID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `personaID` (`personaID`),
  KEY `consultorioID` (`consultorioID`),
  KEY `especialidadID` (`especialidadID`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`personaID`) REFERENCES `persona` (`CI`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`consultorioID`) REFERENCES `consultorio` (`ID`),
  CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`especialidadID`) REFERENCES `especialidad` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,6721876,1,1),(2,8723454,2,2),(3,4573281,3,3),(4,2629876,4,4),(5,2310153,5,5);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Perdiatria'),(2,'Dermatologia'),(3,'Gastroenterologia'),(4,'Traumatologia'),(5,'Oftalmologia');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `personaID` int NOT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `personaID` (`personaID`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`personaID`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,6721876,'2014-12-01 00:00:00'),(2,8723454,'2010-07-03 00:00:00'),(3,4573281,'2010-07-03 00:00:00'),(4,2629876,'2010-07-03 00:00:00'),(5,2310153,'2010-07-03 00:00:00');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `CI` int NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (2310153,'Freddy','Chirinos','1967-10-14 00:00:00'),(2629876,'Maria','Valle','1970-09-21 00:00:00'),(4573281,'Samuel','Chirinos','1998-05-04 00:00:00'),(6721876,'Alejandra','Chirinos','2001-02-27 00:00:00'),(8723454,'Nicolas','Chirinos','2004-11-11 00:00:00');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-17 17:30:19
