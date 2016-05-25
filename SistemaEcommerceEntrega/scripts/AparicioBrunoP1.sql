CREATE DATABASE  IF NOT EXISTS `dbecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbecommerce`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: dbecommerce
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `CD_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `DS_CATEGORIA` varchar(255) DEFAULT NULL,
  `NM_CATEGORIA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CD_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'Categoria1','Categoria1'),(2,'Categoria2','Categoria2'),(3,'Categoria3','Categoria3');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `CD_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `DS_CARGO` varchar(255) DEFAULT NULL,
  `DS_CEP` varchar(255) DEFAULT NULL,
  `DS_CIDADE` varchar(255) DEFAULT NULL,
  `DS_ENDERECO` varchar(255) DEFAULT NULL,
  `DS_FAX` varchar(255) DEFAULT NULL,
  `NM_CLIENTE` varchar(255) DEFAULT NULL,
  `DS_PAIS` varchar(255) DEFAULT NULL,
  `DS_TELEFONE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CD_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Trabalhador','11111-111','Uberlandia','Rua Brasil','12132133','Aparicio','Brasil','3040-2255'),(2,'Estudante','2222-111','Uberlandia','Rua Para','12132133','Bruno','Brasil','3020-2255'),(3,'Pedreiro','3333-111','Uberlandia','Rua Piaui','12132133','Carlos','Brasil','3011-2255');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalhe_pedido`
--

DROP TABLE IF EXISTS `tb_detalhe_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalhe_pedido` (
  `CD_PRODUTO` int(11) NOT NULL,
  `NR_PEDIDO` int(11) NOT NULL,
  `VL_DESCONTO` double DEFAULT NULL,
  `VL_PRECO` double DEFAULT NULL,
  `QT_SOLICITADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_PRODUTO`,`NR_PEDIDO`),
  KEY `FK_5kr2sgryblkd3i5trxn47p2qp` (`NR_PEDIDO`),
  CONSTRAINT `FK_5kr2sgryblkd3i5trxn47p2qp` FOREIGN KEY (`NR_PEDIDO`) REFERENCES `tb_pedido` (`NR_PEDIDO`),
  CONSTRAINT `FK_mafd2374w2cvh0w0612h2ppxf` FOREIGN KEY (`CD_PRODUTO`) REFERENCES `tb_produto` (`CD_PRODUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalhe_pedido`
--

LOCK TABLES `tb_detalhe_pedido` WRITE;
/*!40000 ALTER TABLE `tb_detalhe_pedido` DISABLE KEYS */;
INSERT INTO `tb_detalhe_pedido` VALUES (1,1,10,50,2),(2,1,5,25,1),(3,2,10,20,2),(3,3,3,30,2);
/*!40000 ALTER TABLE `tb_detalhe_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedido` (
  `NR_PEDIDO` int(11) NOT NULL AUTO_INCREMENT,
  `DT_PEDIDO` datetime DEFAULT NULL,
  `TP_STATUS` varchar(255) DEFAULT NULL,
  `CD_CLIENTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`NR_PEDIDO`),
  KEY `FK_nv44v4cjdhj8xukbt8elc5vv7` (`CD_CLIENTE`),
  CONSTRAINT `FK_nv44v4cjdhj8xukbt8elc5vv7` FOREIGN KEY (`CD_CLIENTE`) REFERENCES `tb_cliente` (`CD_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
INSERT INTO `tb_pedido` VALUES (1,'2016-07-04 00:00:00','CANCELADO',1),(2,'2016-06-10 00:00:00','NOVO',2),(3,'2016-01-10 00:00:00','NOVO',3);
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto` (
  `CD_PRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `NM_PRODUTO` varchar(255) DEFAULT NULL,
  `NM_IMAGEM` varchar(255) DEFAULT NULL,
  `VL_PRECO` double DEFAULT NULL,
  `QT_ESTOQUE` int(11) DEFAULT NULL,
  `CD_CATEGORIA` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_PRODUTO`),
  KEY `FK_h975te91xr6keycvv9ekt3qw5` (`CD_CATEGORIA`),
  CONSTRAINT `FK_h975te91xr6keycvv9ekt3qw5` FOREIGN KEY (`CD_CATEGORIA`) REFERENCES `tb_categoria` (`CD_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
INSERT INTO `tb_produto` VALUES (1,'Caneta','caneta.jpg',2,50,1),(2,'Lapis de Cor','lapis.jpg',3,20,2),(3,'Regua','regua.jpg',4,10,3),(4,'Borracha','borracha.jpg',5,5,1);
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-18 22:19:49
