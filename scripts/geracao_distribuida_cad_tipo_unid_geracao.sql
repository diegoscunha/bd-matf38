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
-- Table structure for table `cad_tipo_unid_geracao`
--

DROP TABLE IF EXISTS `cad_tipo_unid_geracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_tipo_unid_geracao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nm_sigla` varchar(3) NOT NULL,
  `nm_tipo_unid_geracao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nm_sigla_UNIQUE` (`nm_sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_tipo_unid_geracao`
--

LOCK TABLES `cad_tipo_unid_geracao` WRITE;
/*!40000 ALTER TABLE `cad_tipo_unid_geracao` DISABLE KEYS */;
INSERT INTO `cad_tipo_unid_geracao` VALUES (1,'UHE','Usinas Hidrelétricas'),(2,'UTE','Usinas Termelétricas'),(3,'PCH','Pequenas Centrais Hidrelétricas'),(4,'EOL',' Usinas Eolioelétricas'),(5,'UTN',' Usinas Termonucleares'),(6,'SOL',' Fontes Alternativas de Energia'),(7,'CGH',' Central Geradora Hidrelétrica');
/*!40000 ALTER TABLE `cad_tipo_unid_geracao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-04  7:38:40
