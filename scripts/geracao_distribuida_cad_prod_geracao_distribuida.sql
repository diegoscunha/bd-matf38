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
-- Table structure for table `cad_prod_geracao_distribuida`
--

DROP TABLE IF EXISTS `cad_prod_geracao_distribuida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_prod_geracao_distribuida` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cad_unid_geracao_distribuida` bigint(20) NOT NULL,
  `dt_periodo_inicio` date NOT NULL,
  `dt_periodo_fim` date NOT NULL,
  `nn_producao` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cad_prod_geracao_distribuida_cad_unid_geracao_distribuid_idx` (`id_cad_unid_geracao_distribuida`),
  CONSTRAINT `fk_cad_prod_geracao_distribuida_cad_unid_geracao_distribuida` FOREIGN KEY (`id_cad_unid_geracao_distribuida`) REFERENCES `cad_unid_geracao_distribuida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_prod_geracao_distribuida`
--

LOCK TABLES `cad_prod_geracao_distribuida` WRITE;
/*!40000 ALTER TABLE `cad_prod_geracao_distribuida` DISABLE KEYS */;
/*!40000 ALTER TABLE `cad_prod_geracao_distribuida` ENABLE KEYS */;
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
