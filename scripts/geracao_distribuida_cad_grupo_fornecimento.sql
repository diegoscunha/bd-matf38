-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: geracao_distribuida
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
-- Table structure for table `cad_grupo_fornecimento`
--

DROP TABLE IF EXISTS `cad_grupo_fornecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_grupo_fornecimento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nm_grupo_fornecimento` char(3) NOT NULL,
  `tensao` enum('A','M','B') NOT NULL COMMENT 'A - Alta Tensão - 88 kV ou mais \nM - Média Tensão -  2,3 kV até 69 kV \nB - Baixa Tensão - inferior aos 2.300 Volts',
  `ds_grupo_fornecimento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nm_grupo_fornecimento` (`nm_grupo_fornecimento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_grupo_fornecimento`
--

LOCK TABLES `cad_grupo_fornecimento` WRITE;
/*!40000 ALTER TABLE `cad_grupo_fornecimento` DISABLE KEYS */;
INSERT INTO `cad_grupo_fornecimento` VALUES (1,'A1','A','230 kV ou mais'),(2,'A2','A','88 kV a 138 kV'),(3,'A3','M','69 kV'),(4,'A3a','M','30 kV a 44 kV'),(5,'A4','M','2,3 kV a 25 kV'),(6,'B1','B','Residencial'),(7,'B2','B','Rural'),(8,'B3','B','Demais Classes'),(9,'B4','B','Iluminção Pública');
/*!40000 ALTER TABLE `cad_grupo_fornecimento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-04  7:38:39
