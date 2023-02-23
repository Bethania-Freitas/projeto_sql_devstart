-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `CARRO`
--

DROP TABLE IF EXISTS `CARRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARRO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cor` enum('PRETO','PRATA','BRANCO') NOT NULL,
  `categoria` enum('Aventureiro','Hatch','Sedã','Familar','Picape','SUV','Esportivo','Conversível','Van','Jipe','Furgão','Caminhão') NOT NULL,
  `id_versão` int NOT NULL,
  `km_atual` decimal(7,3) NOT NULL,
  `valor_diaria` decimal(7,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_versao_idx` (`id_versão`),
  CONSTRAINT `id_versao` FOREIGN KEY (`id_versão`) REFERENCES `VERSAO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARRO`
--

LOCK TABLES `CARRO` WRITE;
/*!40000 ALTER TABLE `CARRO` DISABLE KEYS */;
INSERT INTO `CARRO` VALUES (1,'PRETO','SUV',12,30.000,1.20),(2,'BRANCO','Sedã',10,45.000,2.00);
/*!40000 ALTER TABLE `CARRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `status` enum('ATIVO','INATIVO','INLOCA') NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `CNH` varchar(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
INSERT INTO `CLIENTE` VALUES (1,'ATIVO','Beth','Freitas','33322255544','55544789'),(2,'INATIVO','osé','Roberto','5554478','22225444');
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMAIL`
--

DROP TABLE IF EXISTS `EMAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMAIL` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_email_cliente_idx` (`id_cliente`),
  CONSTRAINT `id_email_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMAIL`
--

LOCK TABLES `EMAIL` WRITE;
/*!40000 ALTER TABLE `EMAIL` DISABLE KEYS */;
INSERT INTO `EMAIL` VALUES (1,1,'bethaniafreitas@yahoo.com.br'),(2,2,'joseinacio@gmail.com'),(3,2,'mariainacio@hotmail.com');
/*!40000 ALTER TABLE `EMAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENDERECO`
--

DROP TABLE IF EXISTS `ENDERECO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENDERECO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `rua/av` varchar(45) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_end_cliente_idx` (`id_cliente`),
  CONSTRAINT `id_end_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENDERECO`
--

LOCK TABLES `ENDERECO` WRITE;
/*!40000 ALTER TABLE `ENDERECO` DISABLE KEYS */;
INSERT INTO `ENDERECO` VALUES (1,1,'SP','Atibaia','Rua Jo´se Inacio',25,'casa A'),(2,2,'RJ','Rio de Janeiro','Av Santana',3541,NULL);
/*!40000 ALTER TABLE `ENDERECO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FRANQUIAS`
--

DROP TABLE IF EXISTS `FRANQUIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FRANQUIAS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `rua/av` varchar(45) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FRANQUIAS`
--

LOCK TABLES `FRANQUIAS` WRITE;
/*!40000 ALTER TABLE `FRANQUIAS` DISABLE KEYS */;
INSERT INTO `FRANQUIAS` VALUES (1,'anhanguera','1245789','SP','são paulo','anhanguera',1200,NULL),(2,'rio-santos','4578951','RJ','rio de janeiro','rodovia rio santos',12456,'prox posto 15');
/*!40000 ALTER TABLE `FRANQUIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCACAO`
--

DROP TABLE IF EXISTS `LOCACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCACAO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_local_retirada` int NOT NULL,
  `id_local_devolucao` int DEFAULT NULL,
  `id_carro` int NOT NULL,
  `data_retirada` datetime NOT NULL,
  `data_entrega` datetime DEFAULT NULL,
  `total_diarias` int DEFAULT NULL,
  `total_km_rodado` decimal(7,0) DEFAULT NULL,
  `status` enum('ATIVA','CONCLUIDA') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_loca_cliente_idx` (`id_cliente`),
  KEY `id_retirada_idx` (`id_local_retirada`),
  KEY `id_devolucao_idx` (`id_local_devolucao`),
  KEY `id_carro_idx` (`id_carro`),
  CONSTRAINT `id_carro` FOREIGN KEY (`id_carro`) REFERENCES `CARRO` (`ID`),
  CONSTRAINT `id_devolucao` FOREIGN KEY (`id_local_devolucao`) REFERENCES `FRANQUIAS` (`ID`),
  CONSTRAINT `id_loca_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`ID`),
  CONSTRAINT `id_retirada` FOREIGN KEY (`id_local_retirada`) REFERENCES `FRANQUIAS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCACAO`
--

LOCK TABLES `LOCACAO` WRITE;
/*!40000 ALTER TABLE `LOCACAO` DISABLE KEYS */;
INSERT INTO `LOCACAO` VALUES (1,1,1,2,1,'2023-01-01 00:00:00','2023-01-10 00:00:00',10,5,'CONCLUIDA'),(2,2,2,NULL,2,'2023-02-23 00:00:00',NULL,NULL,NULL,'ATIVA');
/*!40000 ALTER TABLE `LOCACAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODELO`
--

DROP TABLE IF EXISTS `MODELO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODELO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_montadora` int NOT NULL,
  `modelo` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_montadora_idx` (`id_montadora`),
  CONSTRAINT `id_montadora` FOREIGN KEY (`id_montadora`) REFERENCES `MONTADORA` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELO`
--

LOCK TABLES `MODELO` WRITE;
/*!40000 ALTER TABLE `MODELO` DISABLE KEYS */;
INSERT INTO `MODELO` VALUES (1,1,'Corolla'),(2,1,'Yaris'),(3,1,'RAV4'),(4,2,'Polo'),(5,2,'Jetta'),(6,2,'Gol'),(7,2,'Cross'),(8,3,'Mustang'),(9,3,'Ka'),(10,3,'Ecosport'),(11,5,'Civic'),(12,5,'City'),(13,6,'Pulse'),(14,6,'Argo'),(15,6,'Mobi');
/*!40000 ALTER TABLE `MODELO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MONTADORA`
--

DROP TABLE IF EXISTS `MONTADORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MONTADORA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `montadora` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MONTADORA`
--

LOCK TABLES `MONTADORA` WRITE;
/*!40000 ALTER TABLE `MONTADORA` DISABLE KEYS */;
INSERT INTO `MONTADORA` VALUES (1,'Toyota'),(2,'Volkswagen'),(3,'Ford'),(4,'Hyunday'),(5,'Honda'),(6,'Fiat'),(7,'General Motors');
/*!40000 ALTER TABLE `MONTADORA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TELEFONE`
--

DROP TABLE IF EXISTS `TELEFONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TELEFONE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `telefone` varchar(13) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_tel_cliente'_idx` (`id_cliente`),
  CONSTRAINT `id_tel_cliente'` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TELEFONE`
--

LOCK TABLES `TELEFONE` WRITE;
/*!40000 ALTER TABLE `TELEFONE` DISABLE KEYS */;
INSERT INTO `TELEFONE` VALUES (4,1,'(11)88888888'),(5,1,'(11)99999999'),(6,2,'(12)77777777');
/*!40000 ALTER TABLE `TELEFONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERSAO`
--

DROP TABLE IF EXISTS `VERSAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VERSAO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_modelo` int NOT NULL,
  `versao` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_modelo_idx` (`id_modelo`),
  CONSTRAINT `id_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `MODELO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERSAO`
--

LOCK TABLES `VERSAO` WRITE;
/*!40000 ALTER TABLE `VERSAO` DISABLE KEYS */;
INSERT INTO `VERSAO` VALUES (1,1,'Gli'),(2,1,'Altis'),(3,4,'Track'),(4,4,'Base'),(5,4,'GTS'),(6,6,'G1'),(7,6,'Last Editon'),(8,6,'Base'),(9,11,'LX'),(10,11,'Sport'),(11,11,'EXL'),(12,15,'Like'),(13,15,'Trekking');
/*!40000 ALTER TABLE `VERSAO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 17:46:13
