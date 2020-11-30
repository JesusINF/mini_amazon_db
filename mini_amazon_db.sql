-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: mini_amazon_db
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCARRITOS` smallint unsigned DEFAULT NULL,
  `cantidad` tinyint unsigned DEFAULT NULL,
  `total` decimal(9,2) unsigned DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `idPRODUCTOS` smallint unsigned DEFAULT NULL,
  `precio` decimal(7,2) unsigned DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `especificaciones` varchar(255) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `numero_fabricante` varchar(15) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `accion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,NULL,NULL,NULL,NULL,7,16999.99,'Laptop Omen','Intel i7 9na generación, GTX 1650','HP','181250652002402','Pita@DESKTOP-4B1HOAG','2020-11-29 19:08:16','Insertó');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `idCARRITOS` smallint unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint unsigned NOT NULL DEFAULT '0',
  `total` decimal(9,2) unsigned NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCARRITOS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
INSERT INTO `carritos` VALUES (1,5,1760.00,'2020-10-21 22:53:19'),(2,3,5997.00,'2020-10-21 22:53:19'),(3,4,13596.00,'2020-10-21 22:53:19'),(4,8,7192.00,'2020-10-21 22:53:19'),(5,6,11916.00,'2020-10-21 22:53:19');
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Pita`@`%`*/ /*!50003 TRIGGER `insertarCarritos` AFTER INSERT ON `carritos` FOR EACH ROW INSERT INTO Bitacora (idCARRITOS, cantidad, total, fecha_hora, usuario, fecha, accion)
VALUES(new.idCARRITOS, new.cantidad, new.total, new.fecha_hora, user(), now(), 'Insertó') */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Pita`@`%`*/ /*!50003 TRIGGER `actualizarCarritos` BEFORE UPDATE ON `carritos` FOR EACH ROW INSERT INTO Bitacora (idCARRITOS, cantidad, total, fecha_hora, usuario, fecha, accion)
VALUES(old.idCARRITOS, old.cantidad, old.total, old.fecha_hora, user(), now(), 'Actualizó') */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Pita`@`%`*/ /*!50003 TRIGGER `borrarCarritos` BEFORE DELETE ON `carritos` FOR EACH ROW INSERT INTO Bitacora (idCARRITOS, cantidad, total, fecha_hora, usuario, fecha, accion)
VALUES(old.idCARRITOS, old.cantidad, old.total, old.fecha_hora, user(), now(), 'Borró') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `idENVIOS` smallint unsigned NOT NULL AUTO_INCREMENT,
  `origen` varchar(200) NOT NULL,
  `destino` varchar(200) NOT NULL,
  `paqueteria` varchar(50) NOT NULL,
  `VENTAS_idVENTAS` smallint unsigned NOT NULL,
  PRIMARY KEY (`idENVIOS`),
  KEY `fk_ENVIOS_VENTAS1_idx` (`VENTAS_idVENTAS`),
  FULLTEXT KEY `destino` (`destino`) /*!80000 INVISIBLE */,
  FULLTEXT KEY `origen` (`origen`),
  CONSTRAINT `fk_ENVIOS_VENTAS1` FOREIGN KEY (`VENTAS_idVENTAS`) REFERENCES `ventas` (`idVENTAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_pago`
--

DROP TABLE IF EXISTS `formas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pago` (
  `idFORMAS_PAGO` smallint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  `tipo` char(2) NOT NULL COMMENT 'EF = efectivo\nTD = tarjeta debido\nTC = tarjeta credito\nTE = transferencia electronica',
  PRIMARY KEY (`idFORMAS_PAGO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pago`
--

LOCK TABLES `formas_pago` WRITE;
/*!40000 ALTER TABLE `formas_pago` DISABLE KEYS */;
INSERT INTO `formas_pago` VALUES (1,'MasterCard','TC'),(2,'Visa','TD'),(3,'American Express','TC'),(4,'Amazon Cash','TE'),(5,'MasterCard','TD');
/*!40000 ALTER TABLE `formas_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_carrito`
--

DROP TABLE IF EXISTS `items_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_carrito` (
  `idITEMS_CARRITO` smallint unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint unsigned NOT NULL DEFAULT '0',
  `precio` decimal(7,2) unsigned NOT NULL,
  `importe` decimal(9,2) unsigned NOT NULL,
  `PRODUCTOS_idPRODUCTOS` smallint unsigned NOT NULL,
  `CARRITOS_idCARRITOS` smallint unsigned NOT NULL,
  PRIMARY KEY (`idITEMS_CARRITO`),
  KEY `fk_ITEMS_CARRITO_PRODUCTOS1_idx` (`PRODUCTOS_idPRODUCTOS`),
  KEY `fk_ITEMS_CARRITO_CARRITOS1_idx` (`CARRITOS_idCARRITOS`),
  CONSTRAINT `fk_ITEMS_CARRITO_CARRITOS1` FOREIGN KEY (`CARRITOS_idCARRITOS`) REFERENCES `carritos` (`idCARRITOS`),
  CONSTRAINT `fk_ITEMS_CARRITO_PRODUCTOS1` FOREIGN KEY (`PRODUCTOS_idPRODUCTOS`) REFERENCES `productos` (`idPRODUCTOS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_carrito`
--

LOCK TABLES `items_carrito` WRITE;
/*!40000 ALTER TABLE `items_carrito` DISABLE KEYS */;
INSERT INTO `items_carrito` VALUES (1,5,352.00,1760.00,1,1),(2,3,1999.00,5997.00,2,2),(3,4,3399.00,13596.00,3,3),(4,8,899.00,7192.00,4,4),(5,6,1986.00,11916.00,5,5);
/*!40000 ALTER TABLE `items_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_venta`
--

DROP TABLE IF EXISTS `items_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_venta` (
  `idITEMS_VENTA` smallint unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint unsigned NOT NULL DEFAULT '0',
  `precio` decimal(7,2) unsigned NOT NULL,
  `importe` decimal(9,2) unsigned NOT NULL,
  `PRODUCTOS_idPRODUCTOS` smallint unsigned NOT NULL,
  `VENTAS_idVENTAS` smallint unsigned NOT NULL,
  PRIMARY KEY (`idITEMS_VENTA`),
  KEY `fk_ITEMS_VENTA_PRODUCTOS1_idx` (`PRODUCTOS_idPRODUCTOS`),
  KEY `fk_ITEMS_VENTA_VENTAS1_idx` (`VENTAS_idVENTAS`),
  CONSTRAINT `fk_ITEMS_VENTA_PRODUCTOS1` FOREIGN KEY (`PRODUCTOS_idPRODUCTOS`) REFERENCES `productos` (`idPRODUCTOS`),
  CONSTRAINT `fk_ITEMS_VENTA_VENTAS1` FOREIGN KEY (`VENTAS_idVENTAS`) REFERENCES `ventas` (`idVENTAS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_venta`
--

LOCK TABLES `items_venta` WRITE;
/*!40000 ALTER TABLE `items_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idPRODUCTOS` smallint unsigned NOT NULL AUTO_INCREMENT,
  `precio` decimal(7,2) unsigned NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `especificaciones` varchar(255) NOT NULL,
  `marca` varchar(40) NOT NULL,
  `numero_fabricante` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idPRODUCTOS`),
  UNIQUE KEY `numero_fabricante_UNIQUE` (`numero_fabricante`),
  FULLTEXT KEY `descripcion` (`descripcion`) /*!80000 INVISIBLE */,
  FULLTEXT KEY `especificaciones` (`especificaciones`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,352.00,'Photomax: camara fotográfica.','La cámara que te hará volar tus sesos con su increíble lente de 1080p * 720p a un precio increíble, con memoria incluida.','Photosplus','181250652002408'),(2,1999.00,'Monitor Gamer Full HD','21 pulgadas, 60Hz, Full HD','Vorago','254890653521478'),(3,3399.00,'Procesador Ryzen 3400G.','6 nucleos, 5ta generación de AMD Ryzen, 6GB de memoria, Radeon VirusFX Graphics incluida.','AMD','378525146452314'),(4,899.00,'Memoria RAM Xpg','Memoria DDR4, 8GB de RAM, 2666Mhz.','ADATA','179863154278956'),(5,1986.00,'HyperX Alloy FPS','Teclado tipo mecánico, con teclas CherryMX Red, con 10millones de clics por tecla de garantía, retroiluminado.','Kingston','756892348567125'),(7,16999.99,'Laptop Omen','Intel i7 9na generación, GTX 1650','HP','181250652002402');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Pita`@`%`*/ /*!50003 TRIGGER `insertarProductos` AFTER INSERT ON `productos` FOR EACH ROW INSERT INTO Bitacora (idPRODUCTOS, precio, descripcion, especificaciones, marca, numero_fabricante, usuario,fecha,accion)
VALUES(new.idPRODUCTOS, new.precio, new.descripcion, new.especificaciones, new.marca, new.numero_fabricante, user(), now(), 'Insertó') */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Pita`@`%`*/ /*!50003 TRIGGER `actualizarProductos` BEFORE UPDATE ON `productos` FOR EACH ROW INSERT INTO Bitacora (idPRODUCTOS, precio, descripcion, especificaciones, marca, numero_fabricante, usuario,fecha,accion)
VALUES(old.idPRODUCTOS, old.precio, old.descripcion, old.especificaciones, old.marca, old.numero_fabricante, user(), now(), 'Actualizó') */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Pita`@`%`*/ /*!50003 TRIGGER `borrarProductos` BEFORE DELETE ON `productos` FOR EACH ROW INSERT INTO Bitacora (idPRODUCTOS, precio, descripcion, especificaciones, marca, numero_fabricante, usuario,fecha,accion)
VALUES(old.idPRODUCTOS, old.precio, old.descripcion, old.especificaciones, old.marca, old.numero_fabricante, user(), now(), 'Borró') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productossinstock`
--

DROP TABLE IF EXISTS `productossinstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productossinstock` (
  `id` int NOT NULL,
  `nombre` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productossinstock`
--

LOCK TABLES `productossinstock` WRITE;
/*!40000 ALTER TABLE `productossinstock` DISABLE KEYS */;
INSERT INTO `productossinstock` VALUES (1,'Microfono Condensador: RedLemon');
/*!40000 ALTER TABLE `productossinstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idPROVEEDORES` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `rfc` char(13) NOT NULL,
  `telefono` char(10) NOT NULL,
  `cp` char(5) NOT NULL,
  PRIMARY KEY (`idPROVEEDORES`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  FULLTEXT KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Enrique García','Calle Arteaga #46 Col. Las Cañadas','HGTV950115KM2','3521869875','59784'),(2,'Jesús Israel Naranjo Fuentes','Calle Arroyo Delgado #178 Col. Infonavit','NAFJ001026HJ1','3521456321','59390'),(3,'Jaime Enriquez','Calle Rio de Janeiro #54 Col. México','HEBR001018RF1','3521544818','59340'),(4,'Joel Iván Pita Orozco','Calle Lago de Zirahuen #78 Col. Fovisste','PIOJ001029JI2','3521893250','59380'),(5,'Raul Herrera Ruiz','Calle Mariano Jiménez #46 Col. Centro','HERR620415RU5','3521253614','59310'),(6,'Heriberto Hernandez Naranjo','Calle Arteaga #47 Col. Las Cañadas','HGTV950115KM3','3521869455','59783'),(8,'Heriberto Bravo Naranjo','Calle Arteaga #41 Col. Las Cañadas','HGTV950115TM3','3521869055','59773'),(21,'Héctor Ramírez Camacho','Calle uno #13 Col. Arroyo Delgado','HRC141570ZC0','3318495231','59385'),(23,'Mario García Enriquez','Calle siete #39, Col. Arroyo Delgado','MGERCS831K2SF','3398589391','59741'),(27,'Etesech Camacho','Calle uno #13 Col. Arroyo Delgado','ESC141570ZC0','3318495232','59385'),(30,'Pepe Galindo Pérez','Calle Independencia #47 Col. Centro','PGP146523ZC5','3354687815','59354'),(31,'Heriberto Bravo Nuñez','Calle Arteaga #50 Col. Las Cañadas','HGTV950115TM4','3521869035','59773');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento` (
  `idSEGUIMIENTO` smallint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_hora` varchar(45) NOT NULL DEFAULT 'now()',
  `ENVIOS_idENVIOS` smallint unsigned NOT NULL,
  PRIMARY KEY (`idSEGUIMIENTO`),
  KEY `fk_SEGUIMIENTO_ENVIOS1_idx` (`ENVIOS_idENVIOS`),
  FULLTEXT KEY `descripcion` (`descripcion`),
  CONSTRAINT `fk_SEGUIMIENTO_ENVIOS1` FOREIGN KEY (`ENVIOS_idENVIOS`) REFERENCES `envios` (`idENVIOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento`
--

LOCK TABLES `seguimiento` WRITE;
/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vende`
--

DROP TABLE IF EXISTS `vende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vende` (
  `idVENDE` smallint unsigned NOT NULL AUTO_INCREMENT,
  `costo` decimal(5,2) unsigned NOT NULL,
  `PROVEEDORES_idPROVEEDORES` smallint unsigned NOT NULL,
  `PRODUCTOS_idPRODUCTOS` smallint unsigned NOT NULL,
  PRIMARY KEY (`idVENDE`),
  KEY `fk_VENDE_PROVEEDORES1_idx` (`PROVEEDORES_idPROVEEDORES`),
  KEY `fk_VENDE_PRODUCTOS1_idx` (`PRODUCTOS_idPRODUCTOS`),
  CONSTRAINT `fk_VENDE_PRODUCTOS1` FOREIGN KEY (`PRODUCTOS_idPRODUCTOS`) REFERENCES `productos` (`idPRODUCTOS`),
  CONSTRAINT `fk_VENDE_PROVEEDORES1` FOREIGN KEY (`PROVEEDORES_idPROVEEDORES`) REFERENCES `proveedores` (`idPROVEEDORES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vende`
--

LOCK TABLES `vende` WRITE;
/*!40000 ALTER TABLE `vende` DISABLE KEYS */;
/*!40000 ALTER TABLE `vende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idVENTAS` smallint unsigned NOT NULL AUTO_INCREMENT,
  `folio` char(10) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `importe_total` decimal(9,2) GENERATED ALWAYS AS ((`importe_envio` + `subtotal`)) VIRTUAL,
  `cantidad` tinyint unsigned NOT NULL DEFAULT '0',
  `importe_envio` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `subtotal` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `nombre_comprador` varchar(50) NOT NULL,
  `FORMAS_PAGO_idFORMAS_PAGO` smallint unsigned NOT NULL,
  `CARRITOS_idCARRITOS` smallint unsigned NOT NULL,
  PRIMARY KEY (`idVENTAS`),
  UNIQUE KEY `folio_UNIQUE` (`folio`),
  KEY `fk_VENTAS_FORMAS_PAGO1_idx` (`FORMAS_PAGO_idFORMAS_PAGO`),
  KEY `fk_VENTAS_CARRITOS1_idx` (`CARRITOS_idCARRITOS`),
  FULLTEXT KEY `comprador` (`nombre_comprador`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_VENTAS_CARRITOS1` FOREIGN KEY (`CARRITOS_idCARRITOS`) REFERENCES `carritos` (`idCARRITOS`),
  CONSTRAINT `fk_VENTAS_FORMAS_PAGO1` FOREIGN KEY (`FORMAS_PAGO_idFORMAS_PAGO`) REFERENCES `formas_pago` (`idFORMAS_PAGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 20:26:20
