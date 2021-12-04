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
-- Table structure for table `cad_unid_geracao_distribuida`
--

DROP TABLE IF EXISTS `cad_unid_geracao_distribuida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_unid_geracao_distribuida` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cad_produtor` bigint(20) NOT NULL,
  `id_cad_distribuidora` bigint(20) NOT NULL,
  `id_cad_tipo_unid_geracao` bigint(20) NOT NULL,
  `id_cad_grupo_fornecimento` bigint(20) NOT NULL,
  `id_log_endereco` bigint(20) NOT NULL,
  `dt_instalacao` datetime NOT NULL,
  `nn_potencia_instalada` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cad_unid_geracao_distribuida_cad_consumidor_idx` (`id_cad_produtor`),
  KEY `fk_cad_unid_geracao_distribuida_cad_distribuidora_idx` (`id_cad_distribuidora`),
  KEY `fk_cad_unid_geracao_distribuida_cad_tipo_unid_geracao_idx` (`id_cad_tipo_unid_geracao`),
  KEY `fk_cad_unid_geracao_distribuida_cad_grupo_fornecimento_idx` (`id_cad_grupo_fornecimento`),
  KEY `fk_cad_unid_geracao_distribuida_endereco_idx` (`id_log_endereco`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_consumidor` FOREIGN KEY (`id_cad_produtor`) REFERENCES `cad_produtor` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_distribuidora` FOREIGN KEY (`id_cad_distribuidora`) REFERENCES `cad_distribuidora` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_grupo_fornecimento` FOREIGN KEY (`id_cad_grupo_fornecimento`) REFERENCES `cad_grupo_fornecimento` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_tipo_unid_geracao` FOREIGN KEY (`id_cad_tipo_unid_geracao`) REFERENCES `cad_tipo_unid_geracao` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_endereco` FOREIGN KEY (`id_log_endereco`) REFERENCES `endereco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_unid_geracao_distribuida`
--

LOCK TABLES `cad_unid_geracao_distribuida` WRITE;
/*!40000 ALTER TABLE `cad_unid_geracao_distribuida` DISABLE KEYS */;
INSERT INTO `cad_unid_geracao_distribuida` VALUES (1,1,1,1,1,1,'2021-11-11 00:00:00',4000),(2,2,2,1,1,1,'2021-09-30 00:00:00',6000);
/*!40000 ALTER TABLE `cad_unid_geracao_distribuida` ENABLE KEYS */;
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
