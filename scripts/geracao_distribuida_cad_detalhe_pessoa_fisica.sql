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
-- Table structure for table `cad_detalhe_pessoa_fisica`
--

DROP TABLE IF EXISTS `cad_detalhe_pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_detalhe_pessoa_fisica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cad_produtor` bigint(20) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `nn_cpf` char(11) NOT NULL,
  `dt_nascimento` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nn_cpf` (`nn_cpf`),
  KEY `fk_cad_detalhe_pessoa_fisica_cad_consumidor_idx` (`id_cad_produtor`),
  CONSTRAINT `fk_cad_detalhe_pessoa_fisica_cad_consumidor` FOREIGN KEY (`id_cad_produtor`) REFERENCES `cad_produtor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_detalhe_pessoa_fisica`
--

LOCK TABLES `cad_detalhe_pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `cad_detalhe_pessoa_fisica` DISABLE KEYS */;
INSERT INTO `cad_detalhe_pessoa_fisica` VALUES (1,1,'M','12345678900','1986-01-01');
/*!40000 ALTER TABLE `cad_detalhe_pessoa_fisica` ENABLE KEYS */;
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
