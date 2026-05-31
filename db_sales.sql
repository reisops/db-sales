/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_sales
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categorias` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES
(1,'Bebidas'),
(2,'Alimentos'),
(3,'Limpeza');
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clientes`
--

DROP TABLE IF EXISTS `tbl_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_clientes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `cpf` char(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `rua` varchar(30) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pontos_fidelidade` tinyint(4) DEFAULT 0,
  `categoria_fidelidade` varchar(6) DEFAULT 'Bronze',
  `data_cadastro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clientes`
--

LOCK TABLES `tbl_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_clientes` DISABLE KEYS */;
INSERT INTO `tbl_clientes` VALUES
(1,'12345678901','Cliente Teste',NULL,NULL,NULL,NULL,NULL,'22999999999','cliente@email.com',0,'Bronze','2026-04-16 18:45:49');
/*!40000 ALTER TABLE `tbl_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_colaboradores`
--

DROP TABLE IF EXISTS `tbl_colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_colaboradores` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `cpf` char(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cargo` varchar(32) NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT 1,
  `data_admissao` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_colaboradores`
--

LOCK TABLES `tbl_colaboradores` WRITE;
/*!40000 ALTER TABLE `tbl_colaboradores` DISABLE KEYS */;
INSERT INTO `tbl_colaboradores` VALUES
(1,'12345678910','Funcionário 1','func1@email.com','21999999999','Caixa',1,'2026-04-16 18:47:56');
/*!40000 ALTER TABLE `tbl_colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fornecedores`
--

DROP TABLE IF EXISTS `tbl_fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_fornecedores` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fornecedores`
--

LOCK TABLES `tbl_fornecedores` WRITE;
/*!40000 ALTER TABLE `tbl_fornecedores` DISABLE KEYS */;
INSERT INTO `tbl_fornecedores` VALUES
(1,'Fornecedor A','21999999999','contato@a.com'),
(2,'Fornecedor B','21988888888','contato@b.com'),
(3,'Fornecedor C','21977777777','contato@c.com');
/*!40000 ALTER TABLE `tbl_fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_itens_venda`
--

DROP TABLE IF EXISTS `tbl_itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_itens_venda` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_venda` mediumint(9) NOT NULL,
  `id_produto` mediumint(9) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_venda_produto` (`id_venda`,`id_produto`),
  KEY `fk_item_produto` (`id_produto`),
  CONSTRAINT `fk_item_produto` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produtos` (`id`),
  CONSTRAINT `fk_item_venda` FOREIGN KEY (`id_venda`) REFERENCES `tbl_vendas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_itens_venda`
--

LOCK TABLES `tbl_itens_venda` WRITE;
/*!40000 ALTER TABLE `tbl_itens_venda` DISABLE KEYS */;
INSERT INTO `tbl_itens_venda` VALUES
(6,2,1,2,4.99),
(10,2,2,2,10.00);
/*!40000 ALTER TABLE `tbl_itens_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_baixa_estoque
AFTER INSERT ON tbl_itens_venda
FOR EACH ROW
BEGIN
    UPDATE tbl_produtos
    SET qnt_estoque = qnt_estoque - NEW.quantidade
    WHERE id = NEW.id_produto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_produtos`
--

DROP TABLE IF EXISTS `tbl_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_produtos` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(32) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `unidade_medida` varchar(2) NOT NULL,
  `codigo_barras` char(13) NOT NULL,
  `qnt_estoque` int(11) NOT NULL DEFAULT 0,
  `id_categoria` mediumint(9) NOT NULL,
  `id_fornecedor` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_categoria` (`id_categoria`),
  KEY `fk_produto_fornecedor` (`id_fornecedor`),
  KEY `idx_produtos_barras` (`codigo_barras`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id`),
  CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produtos`
--

LOCK TABLES `tbl_produtos` WRITE;
/*!40000 ALTER TABLE `tbl_produtos` DISABLE KEYS */;
INSERT INTO `tbl_produtos` VALUES
(1,'Leite',4.99,'LT','1234567890123',47,1,1),
(2,'Arroz',19.90,'KG','1234567890124',25,2,2),
(3,'Detergente',2.50,'UN','1234567890125',100,3,3);
/*!40000 ALTER TABLE `tbl_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vendas`
--

DROP TABLE IF EXISTS `tbl_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vendas` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_cliente` mediumint(9) NOT NULL,
  `id_colaborador` mediumint(9) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `forma_pagamento` varchar(8) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venda_cliente` (`id_cliente`),
  KEY `fk_venda_colaborador` (`id_colaborador`),
  KEY `idx_vendas_data` (`data_hora`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_clientes` (`id`),
  CONSTRAINT `fk_venda_colaborador` FOREIGN KEY (`id_colaborador`) REFERENCES `tbl_colaboradores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vendas`
--

LOCK TABLES `tbl_vendas` WRITE;
/*!40000 ALTER TABLE `tbl_vendas` DISABLE KEYS */;
INSERT INTO `tbl_vendas` VALUES
(2,1,1,'2026-04-16 18:48:14','DINHEIRO',29.88,'ABERTA');
/*!40000 ALTER TABLE `tbl_vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 13:04:35
