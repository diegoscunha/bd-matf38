CREATE DATABASE  IF NOT EXISTS `geracao_distribuida` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `geracao_distribuida`;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_detalhe_pessoa_fisica`
--

LOCK TABLES `cad_detalhe_pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `cad_detalhe_pessoa_fisica` DISABLE KEYS */;
INSERT INTO `cad_detalhe_pessoa_fisica` VALUES (1,1,'M','07914090077','1986-01-01'),(2,3,'M','02124598562','1986-12-29'),(6,10,'M','16448967028','1986-12-29'),(8,17,'M','71521374040','1986-12-29');
/*!40000 ALTER TABLE `cad_detalhe_pessoa_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cad_detalhe_pessoa_juridica`
--

DROP TABLE IF EXISTS `cad_detalhe_pessoa_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_detalhe_pessoa_juridica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cad_produtor` bigint(20) NOT NULL,
  `nn_cnpj` char(14) NOT NULL,
  `nm_razao_social` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nn_cnpj` (`nn_cnpj`),
  KEY `fk_cad_detalhe_pessoa_juridica_cad_consumidor_idx` (`id_cad_produtor`),
  CONSTRAINT `fk_cad_detalhe_pessoa_juridica_cad_consumidor` FOREIGN KEY (`id_cad_produtor`) REFERENCES `cad_produtor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_detalhe_pessoa_juridica`
--

LOCK TABLES `cad_detalhe_pessoa_juridica` WRITE;
/*!40000 ALTER TABLE `cad_detalhe_pessoa_juridica` DISABLE KEYS */;
INSERT INTO `cad_detalhe_pessoa_juridica` VALUES (1,2,'36968769000145','Empresa Tudo Lindo S.A.'),(2,4,'57204898000137','Raz??o Social'),(4,12,'64236433000123','Raz??o Social'),(7,15,'48529517000107','Raz??o Social');
/*!40000 ALTER TABLE `cad_detalhe_pessoa_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cad_distribuidora`
--

DROP TABLE IF EXISTS `cad_distribuidora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_distribuidora` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nn_cnpj` varchar(14) NOT NULL,
  `nm_distribuidora` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nn_cnpj_UNIQUE` (`nn_cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_distribuidora`
--

LOCK TABLES `cad_distribuidora` WRITE;
/*!40000 ALTER TABLE `cad_distribuidora` DISABLE KEYS */;
INSERT INTO `cad_distribuidora` VALUES (1,'27812487000163','Eletro'),(2,'02049870000180','Coelba');
/*!40000 ALTER TABLE `cad_distribuidora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cad_grupo_fornecimento`
--

DROP TABLE IF EXISTS `cad_grupo_fornecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_grupo_fornecimento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nm_grupo_fornecimento` char(3) NOT NULL,
  `tensao` enum('A','M','B') NOT NULL COMMENT 'A - Alta Tens??o - 88 kV ou mais \nM - M??dia Tens??o -  2,3 kV at?? 69 kV \nB - Baixa Tens??o - inferior aos 2.300 Volts',
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
INSERT INTO `cad_grupo_fornecimento` VALUES (1,'A1','A','230 kV ou mais'),(2,'A2','A','88 kV a 138 kV'),(3,'A3','M','69 kV'),(4,'A3a','M','30 kV a 44 kV'),(5,'A4','M','2,3 kV a 25 kV'),(6,'B1','B','Residencial'),(7,'B2','B','Rural'),(8,'B3','B','Demais Classes'),(9,'B4','B','Ilumin????o P??blica');
/*!40000 ALTER TABLE `cad_grupo_fornecimento` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `cad_produtor`
--

DROP TABLE IF EXISTS `cad_produtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_produtor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cad_tipo_produtor` enum('PF','PJ') NOT NULL,
  `dt_cadastro` datetime NOT NULL,
  `nm_produtor` varchar(100) NOT NULL,
  `ds_email` varchar(100) NOT NULL,
  `ds_telefone` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ds_email_UNIQUE` (`ds_email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_produtor`
--

LOCK TABLES `cad_produtor` WRITE;
/*!40000 ALTER TABLE `cad_produtor` DISABLE KEYS */;
INSERT INTO `cad_produtor` VALUES (1,'PF','2021-11-25 00:00:00','Hugo Borges','hemborges@hotmail.com','71999999999'),(2,'PJ','2021-11-11 00:00:00','Empresa Fantasma da Bahia','empresa.fantasma@empresafantasma.com.br','71988888888'),(3,'PF','2021-12-05 20:11:44','diego cunha','diego@gmail.com','71981114626'),(4,'PJ','2021-12-05 20:13:17','Nome fantasia','email@gmail.com','71981114626'),(10,'PF','2021-12-05 20:39:31','diego cunha','diego1@gmail.com','71981114626'),(12,'PJ','2021-12-05 20:41:23','Nome fantasia','email1@gmail.com','71981114626'),(15,'PJ','2021-12-05 21:26:11','Nome fantasia','email2@gmail.com','71981114626'),(17,'PF','2021-12-05 21:31:06','diego cunha','diego2@gmail.com','71981114626');
/*!40000 ALTER TABLE `cad_produtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cad_tipo_unid_geracao`
--

DROP TABLE IF EXISTS `cad_tipo_unid_geracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_tipo_unid_geracao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nm_sigla` char(3) NOT NULL,
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
INSERT INTO `cad_tipo_unid_geracao` VALUES (1,'UHE','Usinas Hidrel??tricas'),(2,'UTE','Usinas Termel??tricas'),(3,'PCH','Pequenas Centrais Hidrel??tricas'),(4,'EOL',' Usinas Eolioel??tricas'),(5,'UTN',' Usinas Termonucleares'),(6,'SOL',' Fontes Alternativas de Energia'),(7,'CGH',' Central Geradora Hidrel??trica');
/*!40000 ALTER TABLE `cad_tipo_unid_geracao` ENABLE KEYS */;
UNLOCK TABLES;

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
  `id_endereco` bigint(20) NOT NULL,
  `dt_instalacao` datetime NOT NULL,
  `nn_potencia_instalada` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cad_unid_geracao_distribuida_cad_consumidor_idx` (`id_cad_produtor`),
  KEY `fk_cad_unid_geracao_distribuida_cad_distribuidora_idx` (`id_cad_distribuidora`),
  KEY `fk_cad_unid_geracao_distribuida_cad_tipo_unid_geracao_idx` (`id_cad_tipo_unid_geracao`),
  KEY `fk_cad_unid_geracao_distribuida_cad_grupo_fornecimento_idx` (`id_cad_grupo_fornecimento`),
  KEY `fk_cad_unid_geracao_distribuida_endereco_idx` (`id_endereco`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_consumidor` FOREIGN KEY (`id_cad_produtor`) REFERENCES `cad_produtor` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_distribuidora` FOREIGN KEY (`id_cad_distribuidora`) REFERENCES `cad_distribuidora` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_grupo_fornecimento` FOREIGN KEY (`id_cad_grupo_fornecimento`) REFERENCES `cad_grupo_fornecimento` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_cad_tipo_unid_geracao` FOREIGN KEY (`id_cad_tipo_unid_geracao`) REFERENCES `cad_tipo_unid_geracao` (`id`),
  CONSTRAINT `fk_cad_unid_geracao_distribuida_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_unid_geracao_distribuida`
--

LOCK TABLES `cad_unid_geracao_distribuida` WRITE;
/*!40000 ALTER TABLE `cad_unid_geracao_distribuida` DISABLE KEYS */;
INSERT INTO `cad_unid_geracao_distribuida` VALUES (1,1,1,1,1,1,'2021-11-11 00:00:00',4000),(2,2,2,1,1,1,'2021-09-30 00:00:00',6000),(3,3,1,4,1,1,'2021-11-11 00:00:00',8000);
/*!40000 ALTER TABLE `cad_unid_geracao_distribuida` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `geracao_distribuida`.`cad_unid_geracao_distribuida_AFTER_INSERT` AFTER INSERT ON `cad_unid_geracao_distribuida` FOR EACH ROW
BEGIN
    DECLARE nm_sigla_new CHAR(3);
    
	SET nm_sigla_new = (SELECT `nm_sigla` FROM `cad_tipo_unid_geracao` WHERE `id`= NEW.`id_cad_tipo_unid_geracao`);
        
	INSERT INTO `hist_unid_geracao_distribuida`
	(`id_cad_unid_geracao_distribuida`,`old_tipo_unid_geracao`,`new_tipo_unid_geracao`,`ds_historico`) 
	VALUES
	(NEW.`id`,NULL,NEW.`id_cad_tipo_unid_geracao`,CONCAT('TIPO CRIADO COM [',nm_sigla_new,'].'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `geracao_distribuida`.`cad_unid_geracao_distribuida_AFTER_UPDATE` AFTER UPDATE ON `cad_unid_geracao_distribuida` FOR EACH ROW
BEGIN
	DECLARE nm_sigla_old CHAR(3);
    DECLARE nm_sigla_new CHAR(3);

	IF NEW.`id_cad_tipo_unid_geracao` != OLD.`id_cad_tipo_unid_geracao` THEN
		SET nm_sigla_old = (SELECT `nm_sigla` FROM `cad_tipo_unid_geracao` WHERE `id`= OLD.`id_cad_tipo_unid_geracao`);
		SET nm_sigla_new = (SELECT `nm_sigla` FROM `cad_tipo_unid_geracao` WHERE `id`= NEW.`id_cad_tipo_unid_geracao`);
        
		INSERT INTO `hist_unid_geracao_distribuida`
        (`id_cad_unid_geracao_distribuida`,`old_tipo_unid_geracao`,`new_tipo_unid_geracao`,`ds_historico`) 
        VALUES
        (NEW.`id`, OLD.`id_cad_tipo_unid_geracao`,NEW.`id_cad_tipo_unid_geracao`,CONCAT('TIPO ALTERADO DE [',nm_sigla_old, '] PARA [',nm_sigla_new,'].'));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cep` char(9) NOT NULL,
  `ds_logradouro` varchar(150) NOT NULL,
  `ds_complemento` varchar(45) DEFAULT NULL,
  `nm_numero` varchar(20) NOT NULL,
  `ds_bairro` varchar(100) NOT NULL,
  `id_municipio` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_endereco_municipio_idx` (`id_municipio`),
  CONSTRAINT `fk_endereco_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'42710400','Rua Ministro Ant??nio Carlos Magalh??es','Pr??ximo ao Supermercado MixBahia','556','Buraquinho',336);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nm_estado` varchar(100) NOT NULL,
  `nm_sigla` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nm_sigla` (`nm_sigla`),
  KEY `idx_nm_uf` (`nm_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (11,'Rond??nia','RO'),(12,'Acre','AC'),(13,'Amazonas','AM'),(14,'Roraima','RR'),(15,'Par??','PA'),(16,'Amap??','AP'),(17,'Tocantins','TO'),(21,'Maranh??o','MA'),(22,'Piau??','PI'),(23,'Cear??','CE'),(24,'Rio Grande do Norte','RN'),(25,'Para??ba','PB'),(26,'Pernambuco','PE'),(27,'Alagoas','AL'),(28,'Sergipe','SE'),(29,'Bahia','BA'),(31,'Minas Gerais','MG'),(32,'Esp??rito Santo','ES'),(33,'Rio de Janeiro','RJ'),(35,'S??o Paulo','SP'),(41,'Paran??','PR'),(42,'Santa Catarina','SC'),(43,'Rio Grande do Sul','RS'),(50,'Mato Grosso do Sul','MS'),(51,'Mato Grosso','MT'),(52,'Goi????s','GO'),(53,'Distrito Federal','DF');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hist_unid_geracao_distribuida`
--

DROP TABLE IF EXISTS `hist_unid_geracao_distribuida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hist_unid_geracao_distribuida` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cad_unid_geracao_distribuida` bigint(20) NOT NULL,
  `old_tipo_unid_geracao` bigint(20) DEFAULT NULL,
  `new_tipo_unid_geracao` bigint(20) NOT NULL,
  `ds_historico` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hist_unid_geracao_distribuida_cad_tipo_unid_geracao_idx` (`old_tipo_unid_geracao`),
  KEY `fk_hist_unid_geracao_distribuida_cad_tipo_unid_geracao_new_idx` (`new_tipo_unid_geracao`),
  KEY `fk_hist_unid_geracao_distribuida_cad_unid_geracao_distribui_idx` (`id_cad_unid_geracao_distribuida`),
  CONSTRAINT `fk_hist_unid_geracao_distribuida_cad_tipo_unid_geracao_new` FOREIGN KEY (`new_tipo_unid_geracao`) REFERENCES `cad_tipo_unid_geracao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hist_unid_geracao_distribuida_cad_tipo_unid_geracao_old` FOREIGN KEY (`old_tipo_unid_geracao`) REFERENCES `cad_tipo_unid_geracao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hist_unid_geracao_distribuida_cad_unid_geracao_distribuida` FOREIGN KEY (`id_cad_unid_geracao_distribuida`) REFERENCES `cad_unid_geracao_distribuida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hist_unid_geracao_distribuida`
--

LOCK TABLES `hist_unid_geracao_distribuida` WRITE;
/*!40000 ALTER TABLE `hist_unid_geracao_distribuida` DISABLE KEYS */;
INSERT INTO `hist_unid_geracao_distribuida` VALUES (1,1,NULL,1,'TIPO CRIADO COM [UHE].'),(2,2,NULL,1,'TIPO CRIADO COM [UHE].'),(3,3,NULL,3,'TIPO CRIADO COM [PCH].'),(4,3,3,4,'TIPO ALTERADO DE [PCH] PARA [EOL].');
/*!40000 ALTER TABLE `hist_unid_geracao_distribuida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_estado` bigint(20) NOT NULL,
  `nm_municipio` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_municipio_log_estado_idx` (`id_estado`),
  CONSTRAINT `fk_municipio_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,29,'Aba??ra'),(2,29,'Abar??'),(3,29,'Acajutiba'),(4,29,'Adustina'),(5,29,'??gua Fria'),(6,29,'??rico Cardoso'),(7,29,'Aiquara'),(8,29,'Alagoinhas'),(9,29,'Alcoba??a'),(10,29,'Almadina'),(11,29,'Amargosa'),(12,29,'Am??lia Rodrigues'),(13,29,'Am??rica Dourada'),(14,29,'Anag??'),(15,29,'Andara??'),(16,29,'Andorinha'),(17,29,'Angical'),(18,29,'Anguera'),(19,29,'Antas'),(20,29,'Ant??nio Cardoso'),(21,29,'Ant??nio Gon??alves'),(22,29,'Apor??'),(23,29,'Apuarema'),(24,29,'Aracatu'),(25,29,'Ara??as'),(26,29,'Araci'),(27,29,'Aramari'),(28,29,'Arataca'),(29,29,'Aratu??pe'),(30,29,'Aurelino Leal'),(31,29,'Baian??polis'),(32,29,'Baixa Grande'),(33,29,'Banza??'),(34,29,'Barra'),(35,29,'Barra da Estiva'),(36,29,'Barra do Cho??a'),(37,29,'Barra do Mendes'),(38,29,'Barra do Rocha'),(39,29,'Barreiras'),(40,29,'Barro Alto'),(41,29,'Barrocas'),(42,29,'Governador Lomanto J??nior'),(43,29,'Belmonte'),(44,29,'Belo Campo'),(45,29,'Biritinga'),(46,29,'Boa Nova'),(47,29,'Boa Vista do Tupim'),(48,29,'Bom Jesus da Lapa'),(49,29,'Bom Jesus da Serra'),(50,29,'Boninal'),(51,29,'Bonito'),(52,29,'Boquira'),(53,29,'Botupor??'),(54,29,'Brej??es'),(55,29,'Brejol??ndia'),(56,29,'Brotas de Maca??bas'),(57,29,'Brumado'),(58,29,'Buerarema'),(59,29,'Buritirama'),(60,29,'Caatiba'),(61,29,'Cabaceiras do Paragua??u'),(62,29,'Cachoeira'),(63,29,'Cacul??'),(64,29,'Ca??m'),(65,29,'Caetanos'),(66,29,'Caetit??'),(67,29,'Cafarnaum'),(68,29,'Cairu'),(69,29,'Caldeir??o Grande'),(70,29,'Camacan'),(71,29,'Cama??ari'),(72,29,'Camamu'),(73,29,'Campo Alegre de Lourdes'),(74,29,'Campo Formoso'),(75,29,'Can??polis'),(76,29,'Canarana'),(77,29,'Canavieiras'),(78,29,'Candeal'),(79,29,'Candeias'),(80,29,'Candiba'),(81,29,'C??ndido Sales'),(82,29,'Cansan????o'),(83,29,'Canudos'),(84,29,'Capela do Alto Alegre'),(85,29,'Capim Grosso'),(86,29,'Cara??bas'),(87,29,'Caravelas'),(88,29,'Cardeal da Silva'),(89,29,'Carinhanha'),(90,29,'Casa Nova'),(91,29,'Castro Alves'),(92,29,'Catol??ndia'),(93,29,'Catu'),(94,29,'Caturama'),(95,29,'Central'),(96,29,'Chorroch??'),(97,29,'C??cero Dantas'),(98,29,'Cip??'),(99,29,'Coaraci'),(100,29,'Cocos'),(101,29,'Concei????o da Feira'),(102,29,'Concei????o do Almeida'),(103,29,'Concei????o do Coit??'),(104,29,'Concei????o do Jacu??pe'),(105,29,'Conde'),(106,29,'Conde??ba'),(107,29,'Contendas do Sincor??'),(108,29,'Cora????o de Maria'),(109,29,'Cordeiros'),(110,29,'Coribe'),(111,29,'Coronel Jo??o s??'),(112,29,'Correntina'),(113,29,'Cotegipe'),(114,29,'Cravol??ndia'),(115,29,'Cris??polis'),(116,29,'Crist??polis'),(117,29,'Cruz Das Almas'),(118,29,'Cura????'),(119,29,'D??rio Meira'),(120,29,'Dias D????vila'),(121,29,'Dom Bas??lio'),(122,29,'Dom Macedo Costa'),(123,29,'El??sio Medrado'),(124,29,'Encruzilhada'),(125,29,'Entre Rios'),(126,29,'Esplanada'),(127,29,'Euclides da Cunha'),(128,29,'Eun??polis'),(129,29,'F??tima'),(130,29,'Feira da Mata'),(131,29,'Feira de Santana'),(132,29,'Filad??lfia'),(133,29,'Firmino Alves'),(134,29,'Floresta Azul'),(135,29,'Formosa do Rio Preto'),(136,29,'Gandu'),(137,29,'Gavi??o'),(138,29,'Gentio do Ouro'),(139,29,'Gl??ria'),(140,29,'Gongogi'),(141,29,'Governador Mangabeira'),(142,29,'Guajeru'),(143,29,'Guanambi'),(144,29,'Guaratinga'),(145,29,'Heli??polis'),(146,29,'Ia??u'),(147,29,'Ibiassuc??'),(148,29,'Ibicara??'),(149,29,'Ibicoara'),(150,29,'Ibicu??'),(151,29,'Ibipeba'),(152,29,'Ibipitanga'),(153,29,'Ibiquera'),(154,29,'Ibirapitanga'),(155,29,'Ibirapu??'),(156,29,'Ibirataia'),(157,29,'Ibitiara'),(158,29,'Ibitit??'),(159,29,'Ibotirama'),(160,29,'Ichu'),(161,29,'Igapor??'),(162,29,'Igrapi??na'),(163,29,'Igua??'),(164,29,'Ilh??us'),(165,29,'Inhambupe'),(166,29,'Ipecaet??'),(167,29,'Ipia??'),(168,29,'Ipir??'),(169,29,'Ipupiara'),(170,29,'Irajuba'),(171,29,'Iramaia'),(172,29,'Iraquara'),(173,29,'Irar??'),(174,29,'Irec??'),(175,29,'Itabela'),(176,29,'Itaberaba'),(177,29,'Itabuna'),(178,29,'Itacar??'),(179,29,'Itaet??'),(180,29,'Itagi'),(181,29,'Itagib??'),(182,29,'Itagimirim'),(183,29,'Itagua??u da Bahia'),(184,29,'Itaju do Col??nia'),(185,29,'Itaju??pe'),(186,29,'Itamaraju'),(187,29,'Itamari'),(188,29,'Itamb??'),(189,29,'Itanagra'),(190,29,'Itanh??m'),(191,29,'Itaparica'),(192,29,'Itap??'),(193,29,'Itapebi'),(194,29,'Itapetinga'),(195,29,'Itapicuru'),(196,29,'Itapitanga'),(197,29,'Itaquara'),(198,29,'Itarantim'),(199,29,'Itatim'),(200,29,'Itiru??u'),(201,29,'Iti??ba'),(202,29,'Itoror??'),(203,29,'Itua??u'),(204,29,'Ituber??'),(205,29,'Iui??'),(206,29,'Jaborandi'),(207,29,'Jacaraci'),(208,29,'Jacobina'),(209,29,'Jaguaquara'),(210,29,'Jaguarari'),(211,29,'Jaguaripe'),(212,29,'Janda??ra'),(213,29,'Jequi??'),(214,29,'Jeremoabo'),(215,29,'Jiquiri????'),(216,29,'Jita??na'),(217,29,'Jo??o Dourado'),(218,29,'Juazeiro'),(219,29,'Jucuru??u'),(220,29,'Jussara'),(221,29,'Jussari'),(222,29,'Jussiape'),(223,29,'Lafaiete Coutinho'),(224,29,'Lagoa Real'),(225,29,'Laje'),(226,29,'Lajed??o'),(227,29,'Lajedinho'),(228,29,'Lajedo do Tabocal'),(229,29,'Lamar??o'),(230,29,'Lap??o'),(231,29,'Lauro de Freitas'),(232,29,'Len????is'),(233,29,'Lic??nio de Almeida'),(234,29,'Livramento de Nossa Senhora'),(235,29,'Lu??s Eduardo Magalh??es'),(236,29,'Macajuba'),(237,29,'Macarani'),(238,29,'Maca??bas'),(239,29,'Macurur??'),(240,29,'Madre de Deus'),(241,29,'Maetinga'),(242,29,'Maiquinique'),(243,29,'Mairi'),(244,29,'Malhada'),(245,29,'Malhada de Pedras'),(246,29,'Manoel Vitorino'),(247,29,'Mansid??o'),(248,29,'Marac??s'),(249,29,'Maragogipe'),(250,29,'Mara??'),(251,29,'Marcion??lio Souza'),(252,29,'Mascote'),(253,29,'Mata de S??o Jo??o'),(254,29,'Matina'),(255,29,'Medeiros Neto'),(256,29,'Miguel Calmon'),(257,29,'Milagres'),(258,29,'Mirangaba'),(259,29,'Mirante'),(260,29,'Monte Santo'),(261,29,'Morpar??'),(262,29,'Morro do Chap??u'),(263,29,'Mortugaba'),(264,29,'Mucug??'),(265,29,'Mucuri'),(266,29,'Mulungu do Morro'),(267,29,'Mundo Novo'),(268,29,'Muniz Ferreira'),(269,29,'Muqu??m de S??o Francisco'),(270,29,'Muritiba'),(271,29,'Mutu??pe'),(272,29,'Nazar??'),(273,29,'Nilo Pe??anha'),(274,29,'Nordestina'),(275,29,'Nova Cana??'),(276,29,'Nova F??tima'),(277,29,'Nova Ibi??'),(278,29,'Nova Itarana'),(279,29,'Nova Reden????o'),(280,29,'Nova Soure'),(281,29,'Nova Vi??osa'),(282,29,'Novo Horizonte'),(283,29,'Novo Triunfo'),(284,29,'Olindina'),(285,29,'Oliveira Dos Brejinhos'),(286,29,'Ouri??angas'),(287,29,'Ourol??ndia'),(288,29,'Palmas de Monte Alto'),(289,29,'Palmeiras'),(290,29,'Paramirim'),(291,29,'Paratinga'),(292,29,'Paripiranga'),(293,29,'Pau Brasil'),(294,29,'Paulo Afonso'),(295,29,'p?? de Serra'),(296,29,'Pedr??o'),(297,29,'Pedro Alexandre'),(298,29,'Piat??'),(299,29,'Pil??o Arcado'),(300,29,'Pinda??'),(301,29,'Pindoba??u'),(302,29,'Pintadas'),(303,29,'Pira?? do Norte'),(304,29,'Pirip??'),(305,29,'Piritiba'),(306,29,'Planaltino'),(307,29,'Planalto'),(308,29,'Po????es'),(309,29,'Pojuca'),(310,29,'Ponto Novo'),(311,29,'Porto Seguro'),(312,29,'Potiragu??'),(313,29,'Prado'),(314,29,'Presidente Dutra'),(315,29,'Presidente J??nio Quadros'),(316,29,'Presidente Tancredo Neves'),(317,29,'Queimadas'),(318,29,'Quijingue'),(319,29,'Quixabeira'),(320,29,'Rafael Jambeiro'),(321,29,'Remanso'),(322,29,'Retirol??ndia'),(323,29,'Riach??o Das Neves'),(324,29,'Riach??o do Jacu??pe'),(325,29,'Riacho de Santana'),(326,29,'Ribeira do Amparo'),(327,29,'Ribeira do Pombal'),(328,29,'Ribeir??o do Largo'),(329,29,'Rio de Contas'),(330,29,'Rio do Ant??nio'),(331,29,'Rio do Pires'),(332,29,'Rio Real'),(333,29,'Rodelas'),(334,29,'Ruy Barbosa'),(335,29,'Salinas da Margarida'),(336,29,'Salvador'),(337,29,'Santa B??rbara'),(338,29,'Santa Br??gida'),(339,29,'Santa Cruz Cabr??lia'),(340,29,'Santa Cruz da Vit??ria'),(341,29,'Santa In??s'),(342,29,'Santaluz'),(343,29,'Santa Luzia'),(344,29,'Santa Maria da Vit??ria'),(345,29,'Santana'),(346,29,'Santan??polis'),(347,29,'Santa Rita de C??ssia'),(348,29,'Santa Teresinha'),(349,29,'Santo Amaro'),(350,29,'Santo Ant??nio de Jesus'),(351,29,'Santo Est??v??o'),(352,29,'S??o Desid??rio'),(353,29,'S??o Domingos'),(354,29,'S??o F??lix'),(355,29,'S??o F??lix do Coribe'),(356,29,'S??o Felipe'),(357,29,'S??o Francisco do Conde'),(358,29,'S??o Gabriel'),(359,29,'S??o Gon??alo Dos Campos'),(360,29,'S??o Jos?? da Vit??ria'),(361,29,'S??o Jos?? do Jacu??pe'),(362,29,'S??o Miguel Das Matas'),(363,29,'S??o Sebasti??o do Pass??'),(364,29,'Sapea??u'),(365,29,'S??tiro Dias'),(366,29,'Saubara'),(367,29,'Sa??de'),(368,29,'Seabra'),(369,29,'Sebasti??o Laranjeiras'),(370,29,'Senhor do Bonfim'),(371,29,'Serra do Ramalho'),(372,29,'Sento s??'),(373,29,'Serra Dourada'),(374,29,'Serra Preta'),(375,29,'Serrinha'),(376,29,'Serrol??ndia'),(377,29,'Sim??es Filho'),(378,29,'S??tio do Mato'),(379,29,'S??tio do Quinto'),(380,29,'Sobradinho'),(381,29,'Souto Soares'),(382,29,'Tabocas do Brejo Velho'),(383,29,'Tanha??u'),(384,29,'Tanque Novo'),(385,29,'Tanquinho'),(386,29,'Tapero??'),(387,29,'Tapiramut??'),(388,29,'Teixeira de Freitas'),(389,29,'Teodoro Sampaio'),(390,29,'Teofil??ndia'),(391,29,'Teol??ndia'),(392,29,'Terra Nova'),(393,29,'Tremedal'),(394,29,'Tucano'),(395,29,'Uau??'),(396,29,'Uba??ra'),(397,29,'Ubaitaba'),(398,29,'Ubat??'),(399,29,'Uiba??'),(400,29,'Umburanas'),(401,29,'Una'),(402,29,'Urandi'),(403,29,'Uru??uca'),(404,29,'Utinga'),(405,29,'Valen??a'),(406,29,'Valente'),(407,29,'V??rzea da Ro??a'),(408,29,'V??rzea do Po??o'),(409,29,'V??rzea Nova'),(410,29,'Varzedo'),(411,29,'Vera Cruz'),(412,29,'Vereda'),(413,29,'Vit??ria da Conquista'),(414,29,'Wagner'),(415,29,'Wanderley'),(416,29,'Wenceslau Guimar??es'),(417,29,'Xique-xique');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ope_consumo`
--

DROP TABLE IF EXISTS `ope_consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ope_consumo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cad_prod_geracao_distribuida` bigint(20) NOT NULL,
  `nn_consumo` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ope_consumo_consumidor_idx` (`id_cad_prod_geracao_distribuida`),
  CONSTRAINT `fk_ope_consumo_consumidor` FOREIGN KEY (`id_cad_prod_geracao_distribuida`) REFERENCES `cad_prod_geracao_distribuida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ope_consumo`
--

LOCK TABLES `ope_consumo` WRITE;
/*!40000 ALTER TABLE `ope_consumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ope_consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'geracao_distribuida'
--

--
-- Dumping routines for database 'geracao_distribuida'
--
/*!50003 DROP FUNCTION IF EXISTS `validar_cnpj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validar_cnpj`(CNPJ CHAR(14)) RETURNS smallint(1)
BEGIN
	DECLARE INDICE INT;
    DECLARE SOMA INT;
    DECLARE DIGITO_1 INT;
    DECLARE DIGITO_2 INT;
    DECLARE VAR1 INT;
    DECLARE VAR2 INT;
    DECLARE DIGITO_1_CNPJ CHAR(1);
    DECLARE DIGITO_2_CNPJ CHAR(1);
    DECLARE NR_DOCUMENTO_AUX VARCHAR(14);
    SET SOMA = 0;
    SET INDICE = 1;
    SET VAR1 = 5;
	/* Verificando se o formato ?? valido */
	SET NR_DOCUMENTO_AUX = LTRIM(RTRIM(CNPJ));
    IF (NR_DOCUMENTO_AUX IN ('00000000000000', '11111111111111', '22222222222222', '33333333333333', '44444444444444', '55555555555555', '66666666666666', '77777777777777', '88888888888888', '99999999999999')) THEN
		RETURN 0;
    END IF;
    
    IF (LENGTH(NR_DOCUMENTO_AUX) <> 14) THEN
		RETURN 0;
    END IF;
	/* Iniciando a validacao */
	SET DIGITO_1_CNPJ = SUBSTRING(CNPJ, LENGTH(CNPJ)- 1, 1);
    SET DIGITO_2_CNPJ = SUBSTRING(CNPJ, LENGTH(CNPJ), 1);
 
	WHILE (INDICE <= 4 ) DO
		SET SOMA = SOMA + CAST(SUBSTRING(CNPJ, INDICE, 1) AS UNSIGNED) * VAR1;
        SET INDICE = INDICE + 1;
        SET VAR1 = VAR1 - 1;
	END WHILE;
 
       
    SET VAR2 = 9;
    WHILE (INDICE <= 12 ) DO
        SET SOMA = SOMA + CAST(SUBSTRING(CNPJ, INDICE, 1) AS UNSIGNED) * VAR2;
        SET INDICE = INDICE + 1;
        SET VAR2 = VAR2 - 1;
    END WHILE;
 
    SET DIGITO_1 = (SOMA % 11 );
 
	/* Primeiro Digito Verificador */
    IF DIGITO_1 < 2 THEN
        SET DIGITO_1 = 0;
    ELSE
        SET DIGITO_1 = 11 - (SOMA % 11);
	END IF;

    SET INDICE = 1;
    SET SOMA = 0;
    SET VAR1 = 6;
    
 
    WHILE (INDICE <= 5 ) DO
        SET SOMA = SOMA + CAST(SUBSTRING(CNPJ, INDICE, 1) AS UNSIGNED) * VAR1;
        SET INDICE = INDICE + 1;
        SET VAR1 = VAR1 - 1;
    END WHILE;
 
    SET VAR2 = 9;
    WHILE (INDICE <= 13 ) DO
        SET SOMA = SOMA + CAST(SUBSTRING(CNPJ, INDICE, 1) AS UNSIGNED) * VAR2;
        SET INDICE = INDICE + 1;
        SET VAR2 = VAR2 - 1;       
    END WHILE;
    
    SET DIGITO_2 = (SOMA % 11);
	/* Segundo Digito Verificador */
    IF DIGITO_2 < 2 THEN
        SET DIGITO_2 = 0;
    ELSE
        SET DIGITO_2 = 11 - (SOMA % 11 );
	END IF;
    
	/* Validando os digitos verificadores calculados com os digitos verificadores do CNPJ informado */
    IF (DIGITO_1 = DIGITO_1_CNPJ) AND (DIGITO_2 = DIGITO_2_CNPJ) THEN
        RETURN 1;
    ELSE
        RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validar_cpf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validar_cpf`(CPF CHAR(11)) RETURNS smallint(1)
BEGIN
	DECLARE SOMA INT;
    DECLARE INDICE INT;
    DECLARE DIGITO_1 INT;
    DECLARE DIGITO_2 INT;
    DECLARE NR_DOCUMENTO_AUX VARCHAR(11);
   
	DECLARE DIGITO_1_CPF CHAR(2);
    DECLARE DIGITO_2_CPF CHAR(2);
    /*
    Remove os CPFs onde todos os n??meros s??o iguais
    */
    SET NR_DOCUMENTO_AUX = LTRIM(RTRIM(CPF));
    IF (NR_DOCUMENTO_AUX IN ('00000000000', '11111111111', '22222222222', '33333333333', '44444444444', '55555555555', '66666666666', '77777777777', '88888888888', '99999999999', '12345678909')) THEN
		RETURN 0;
    END IF;
	/*
	O CPF deve ter 11 caracteres 
	*/
    IF (LENGTH(NR_DOCUMENTO_AUX) <> 11) THEN
		RETURN 0;
    ELSE 
		/* 
		Armazendo os digitos verificadores do CPF informado 
		*/
		SET DIGITO_1_CPF = SUBSTRING(NR_DOCUMENTO_AUX,LENGTH(NR_DOCUMENTO_AUX)-1,1);
		SET DIGITO_2_CPF = SUBSTRING(NR_DOCUMENTO_AUX,LENGTH(NR_DOCUMENTO_AUX),1);
		/*C??lculo do primeiro d??gito verificador*/
		SET SOMA = 0;
		SET INDICE = 1;
		WHILE (INDICE <= 9) DO          
			SET Soma = Soma + CAST(SUBSTRING(NR_DOCUMENTO_AUX,INDICE,1) AS UNSIGNED) * (11 - INDICE);             
			SET INDICE = INDICE + 1;      
		END WHILE;      
		
		SET DIGITO_1 = 11 - (SOMA % 11);      
		
		IF (DIGITO_1 > 9) THEN
			SET DIGITO_1 = 0;
		END IF;
		
		/* C??lculo do segundo d??gito verificador */
		SET SOMA = 0;
		SET INDICE = 1;
		
		WHILE (INDICE <= 10) DO
			SET Soma = Soma + CAST(SUBSTRING(NR_DOCUMENTO_AUX,INDICE,1) AS UNSIGNED) * (12 - INDICE);              
			SET INDICE = INDICE + 1;
		END WHILE;
		
		SET DIGITO_2 = 11 - (SOMA % 11);
		
		IF DIGITO_2 > 9 THEN
			SET DIGITO_2 = 0;
		END IF;
		
		/* Validando os digitos verificadores calculados com os digitos verificadores do CPF informado */
		IF (DIGITO_1 = DIGITO_1_CPF) AND (DIGITO_2 = DIGITO_2_CPF) THEN
			RETURN 1;
		ELSE
			RETURN 0;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrar_produtor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrar_produtor`(IN cpf_cnpj VARCHAR(14), IN nm_produtor VARCHAR(100), IN ds_email VARCHAR(100), IN ds_telefone VARCHAR(11), IN pf_sexo CHAR(1), IN pf_dt_nascimento DATE, IN pj_nm_razao_social VARCHAR(100))
BEGIN
	DECLARE ID_PRODUTOR BIGINT(20);
    DECLARE ERRO BOOLEAN;
	DECLARE MSG_ERROR VARCHAR(100);
    DECLARE MSG_SUCESSO VARCHAR(100);
    DECLARE MSG VARCHAR(100);
    DECLARE MSG_ERRO_BD VARCHAR(100);
    
    DECLARE CPF_CNPJ_INVALIDO VARCHAR(45);
    DECLARE CPF_CADASTRADO VARCHAR(45);
    DECLARE CNPJ_CADASTRADO VARCHAR(45); 
    
    DECLARE ERRO_BD SMALLINT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ERRO_BD = 1;
    
    SET MSG_SUCESSO = 'CADASTRO REALIZADO COM SUCESSO!';
    SET MSG_ERRO_BD = 'ERRO DE BANCO DE DADOS!';
    SET MSG_ERROR = 'CPF OU CNPJ INV??LIDO!';
    SET CPF_CNPJ_INVALIDO = 'CPF OU CNPJ INV??LIDO!';
    SET CPF_CADASTRADO = 'CPF J?? CADASTRADO!';
    SET CNPJ_CADASTRADO = 'CNPJ J?? CADASTRADO!';
    
    START TRANSACTION;
    
    /* VERIFICAR SE S?? POSSUI N??MEROS */
	IF cpf_cnpj REGEXP ('^[0-9]+$') THEN
		/* VALIDAR TAMANHO */
		IF CHAR_LENGTH(cpf_cnpj) = 11 THEN
			/* VALIDAR CPF */
            IF validar_cpf(cpf_cnpj) THEN
                SET ID_PRODUTOR = (SELECT `pf`.`id` FROM `cad_produtor` `p`
								   INNER JOIN `cad_detalhe_pessoa_fisica` `pf` ON `p`.`id` = `pf`.`id_cad_produtor`
								   WHERE `pf`.`nn_cpf` = cpf_cnpj);
                
                IF ID_PRODUTOR THEN
					SET ERRO = TRUE;
					SET MSG = CPF_CADASTRADO;
				ELSE
                    INSERT INTO `cad_produtor` (`cad_tipo_produtor`,`dt_cadastro`,`nm_produtor`,`ds_email`,`ds_telefone`) 
                    VALUES ('PF',NOW(),nm_produtor,ds_email,ds_telefone);
                    
                    SET ID_PRODUTOR = LAST_INSERT_ID();
                    
                    INSERT INTO `cad_detalhe_pessoa_fisica` (`id_cad_produtor`,`sexo`,`nn_cpf`,`dt_nascimento`)
                    VALUES (ID_PRODUTOR,pf_sexo,cpf_cnpj,pf_dt_nascimento);
                    
                    IF ERRO_BD = 1 THEN
						ROLLBACK;
                        SET ERRO = TRUE;
						SET MSG = MSG_ERRO_BD;
					ELSE
						COMMIT;
                        SET ERRO = FALSE;
						SET MSG = MSG_SUCESSO;
                    END IF;
                END IF;
            ELSE
				SET ERRO = TRUE;
				SET MSG = 'CPF INV??LIDO!';
            END IF;
		ELSEIF CHAR_LENGTH(cpf_cnpj) = 14 THEN
			/* VALIDAR CNPJ */
			IF validar_cnpj(cpf_cnpj) THEN
				SET ID_PRODUTOR = (SELECT `pj`.`id` FROM `cad_produtor` `p`
								   INNER JOIN `cad_detalhe_pessoa_juridica` `pj` ON `p`.`id` = `pj`.`id_cad_produtor`
								   WHERE `pj`.`nn_cnpj` = cpf_cnpj);
				
				IF ID_PRODUTOR THEN
					SET ERRO = TRUE;
					SET MSG = CNPJ_CADASTRADO;
				ELSE
                    INSERT INTO `cad_produtor` (`cad_tipo_produtor`,`dt_cadastro`,`nm_produtor`,`ds_email`,`ds_telefone`) 
                    VALUES ('PJ',NOW(),nm_produtor,ds_email,ds_telefone);
                    
                    SET ID_PRODUTOR = LAST_INSERT_ID();
                    
                    INSERT INTO `cad_detalhe_pessoa_juridica` (`id_cad_produtor`,`nn_cnpj`,`nm_razao_social`)
                    VALUES (ID_PRODUTOR,cpf_cnpj,pj_nm_razao_social);
					
                    IF ERRO_BD = 1 THEN
						ROLLBACK;
                        SET ERRO = TRUE;
						SET MSG = MSG_ERRO_BD;
					ELSE
						COMMIT;
						SET ERRO = FALSE;
						SET MSG = MSG_SUCESSO;
                    END IF;
                END IF;
            ELSE
				SET ERRO = TRUE;
				SET MSG = 'CNPJ INV??LIDO!';
            END IF;
		ELSE
			SET ERRO = TRUE;
			SET MSG = CPF_CNPJ_INVALIDO;
		END IF;
	ELSE 
		SET ERRO = TRUE;
        SET MSG = CPF_CNPJ_INVALIDO;
	END IF;
    
    IF ERRO THEN
		SELECT FALSE AS RETORNO, MSG AS MENSAGEM;
    ELSE
		SELECT TRUE AS RETORNO, MSG AS MENSAGEM;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `exibir_unidade_geracao_distribuida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `exibir_unidade_geracao_distribuida`(IN numero INT)
BEGIN 
	SELECT * FROM `cad_unid_geracao_distribuida` AS gd LIMIT numero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `exibir_unidade_geracao_distribuida_por_concessionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `exibir_unidade_geracao_distribuida_por_concessionaria`(IN concessionaria VARCHAR(255))
BEGIN
	DECLARE id_concessionaria INT;
	
	SET id_concessionaria = (SELECT `id` FROM `cad_distribuidora` WHERE `nm_distribuidora` = concessionaria);

	SELECT * FROM `cad_unid_geracao_distribuida` WHERE `id_cad_distribuidora` = id_concessionaria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 18:47:27
