-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: techsentry
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `cambios`
--

DROP TABLE IF EXISTS `cambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambios` (
  `idcambio` int NOT NULL AUTO_INCREMENT,
  `idequipo` int DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT NULL,
  `usuario_que_realiza_cambio` varchar(50) DEFAULT NULL,
  `descripcion_cambio` text,
  `tipo_cambio` varchar(50) DEFAULT NULL,
  `estado_equipo` varchar(50) DEFAULT NULL,
  `duracion_cambio` time DEFAULT NULL,
  `costo_cambio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idcambio`),
  KEY `idequipo` (`idequipo`),
  CONSTRAINT `cambios_ibfk_1` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios`
--

LOCK TABLES `cambios` WRITE;
/*!40000 ALTER TABLE `cambios` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Gómez','30567890','juan.gomez@gmail.com'),(2,'María','López','23456789','1167890123'),(3,'Carlos','Rodríguez','34567890','carlos.rod@gmail.com'),(4,'Laura','Fernández','45678901','1145678901'),(5,'Jorge','Pérez','56789012','jorge.perez@gmail.com'),(6,'Sofía','Díaz','67890123','1134567890'),(7,'Lucas','Martínez','78901234','lucas.mart@gmail.com'),(8,'Valentina','Giménez','89012345','1145678901'),(9,'Martín','Sánchez','90123456','martin.san@gmail.com'),(10,'Camila','Torres','01234567','1167890123'),(11,'Luis','Hernández','12345678','luis.hern@gmail.com'),(12,'Ana','Pereyra','23456789','1145678901'),(13,'Diego','Ramírez','34567890','diego.ram@gmail.com'),(14,'Valeria','Silva','45678901','1134567890'),(15,'Nicolás','Luna','56789012','nico.luna@gmail.com'),(16,'Paula','Rojas','67890123','1167890123'),(17,'Fernando','Castro','78901234','fer.castro@gmail.com'),(18,'Andrea','Vargas','89012345','1145678901'),(19,'Pablo','Aguirre','90123456','pablo.aguirre@gmail.com'),(20,'Silvina','Molina','01234567','1167890123'),(21,'Pedro','Fernández','12345678','1156789012'),(22,'Elena','Díaz','23456789','elena.diaz@gmail.com'),(23,'Alejandro','Ortiz','34567890','1134567890'),(24,'Cecilia','García','45678901','cecilia.gar@gmail.com'),(25,'Andrés','Sosa','56789012','1134567890'),(26,'Romina','Blanco','67890123','romina.blanco@hotmail.com'),(27,'Gustavo','Villa','78901234','1123456789'),(28,'Natalia','Ferrer','89012345','natalia.fer@gmail.com'),(29,'Gonzalo','Morales','90123456','1167890123'),(30,'Agustina','Romero','01234567','agustina.rom@gmail.com'),(31,'Maximiliano','Jiménez','12345678','1167890123'),(32,'Lorena','Rivas','23456789','lorerivas@hotmail.com'),(33,'José','Santos','34567890','1145678901'),(34,'Alicia','Mendoza','45678901','alimendoza@gmail.com'),(35,'Federico','Carrasco','56789012','federico.carr@gmail.com'),(36,'Viviana','López','67890123','vivilopez@hotmail.com'),(37,'Roberto','Gómez','78901234','roberto.gomez@gmail.com'),(38,'Estela','Herrera','89012345','estelaherr@hotmail.com'),(39,'Marcos','Ibarra','90123456','marcosibarra@gmail.com'),(40,'Dolores','Fuentes','01234567','doloresfuentes@gmail.com'),(41,'Joaquín','Moreno','12345678','jmoreno@hotmail.com'),(42,'Nombre41','Apellido41','DNI41','correo41@gmail.com'),(43,'Nombre42','Apellido42','DNI42','correo42@gmail.com'),(44,'Nombre43','Apellido43','DNI43','correo43@gmail.com'),(45,'Nombre44','Apellido44','DNI44','correo44@gmail.com'),(46,'Nombre45','Apellido45','DNI45','correo45@gmail.com'),(47,'Nombre46','Apellido46','DNI46','correo46@gmail.com'),(48,'Nombre47','Apellido47','DNI47','correo47@gmail.com'),(49,'Nombre48','Apellido48','DNI48','correo48@gmail.com'),(50,'Nombre49','Apellido49','DNI49','correo49@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante_servicio`
--

DROP TABLE IF EXISTS `comprobante_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante_servicio` (
  `numero_orden` int NOT NULL AUTO_INCREMENT,
  `idequipo` int DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  `fecha_servicio` date DEFAULT NULL,
  `detalle_falla` text,
  `datos_cliente` text,
  `datos_equipo` text,
  PRIMARY KEY (`numero_orden`),
  KEY `idequipo` (`idequipo`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `comprobante_servicio_ibfk_1` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`),
  CONSTRAINT `comprobante_servicio_ibfk_2` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante_servicio`
--

LOCK TABLES `comprobante_servicio` WRITE;
/*!40000 ALTER TABLE `comprobante_servicio` DISABLE KEYS */;
INSERT INTO `comprobante_servicio` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL,NULL),(11,11,1,NULL,NULL,NULL,NULL),(12,12,2,NULL,NULL,NULL,NULL),(13,13,3,NULL,NULL,NULL,NULL),(14,14,4,NULL,NULL,NULL,NULL),(15,15,5,NULL,NULL,NULL,NULL),(16,16,6,NULL,NULL,NULL,NULL),(17,17,7,NULL,NULL,NULL,NULL),(18,18,8,NULL,NULL,NULL,NULL),(19,19,9,NULL,NULL,NULL,NULL),(20,20,10,NULL,NULL,NULL,NULL),(21,21,11,NULL,NULL,NULL,NULL),(22,22,12,NULL,NULL,NULL,NULL),(23,23,13,NULL,NULL,NULL,NULL),(24,24,14,NULL,NULL,NULL,NULL),(25,25,15,NULL,NULL,NULL,NULL),(26,26,16,NULL,NULL,NULL,NULL),(27,27,17,NULL,NULL,NULL,NULL),(28,28,18,NULL,NULL,NULL,NULL),(29,29,19,NULL,NULL,NULL,NULL),(30,30,20,NULL,NULL,NULL,NULL),(31,31,21,NULL,NULL,NULL,NULL),(32,32,22,NULL,NULL,NULL,NULL),(33,33,23,NULL,NULL,NULL,NULL),(34,34,24,NULL,NULL,NULL,NULL),(35,35,25,NULL,NULL,NULL,NULL),(36,36,26,NULL,NULL,NULL,NULL),(37,37,27,NULL,NULL,NULL,NULL),(38,38,28,NULL,NULL,NULL,NULL),(39,39,29,NULL,NULL,NULL,NULL),(40,40,30,NULL,NULL,NULL,NULL),(41,41,31,NULL,NULL,NULL,NULL),(42,42,32,NULL,NULL,NULL,NULL),(43,43,33,NULL,NULL,NULL,NULL),(44,44,34,NULL,NULL,NULL,NULL),(45,45,35,NULL,NULL,NULL,NULL),(46,46,36,NULL,NULL,NULL,NULL),(47,47,37,NULL,NULL,NULL,NULL),(48,48,38,NULL,NULL,NULL,NULL),(49,49,39,NULL,NULL,NULL,NULL),(50,50,40,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `comprobante_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  `perfil` enum('Atención al Cliente','Técnico','Administrador') DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Juan','Pérez','12345678','juan@example.com','Técnico','Micro-soldadura'),(2,'Ana','Gómez','23456789','ana@example.com','Técnico','Soldadura'),(3,'Carlos','López','34567890','carlos@example.com','Técnico','Televisores - Electrónica General'),(4,'Maria','Rodríguez','45678901','maria@example.com','Atención al Cliente',NULL),(5,'Luis','Martínez','56789012','luis@example.com','Técnico','Computadoras'),(6,'Laura','Fernández','67890123','laura@example.com','Técnico','Celulares'),(7,'Eduardo','Sánchez','78901234','eduardo@example.com','Técnico','Consola de Videojuegos'),(8,'Silvia','Torres','89012345','silvia@example.com','Técnico','Impresoras'),(9,'Pablo','García','90123456','pablo@example.com','Técnico','Televisores'),(10,'Lucía','Díaz','01234567','lucia@example.com','Administrador',NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `idequipo` int NOT NULL AUTO_INCREMENT,
  `idcliente` int DEFAULT NULL,
  `idtipo_equipo` int DEFAULT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `posible_falla` text,
  `reparaciones_anteriores` text,
  PRIMARY KEY (`idequipo`),
  KEY `idcliente` (`idcliente`),
  KEY `idtipo_equipo` (`idtipo_equipo`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`idtipo_equipo`) REFERENCES `tipo_equipo` (`idtipo_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,1,NULL,'HP','LaserJet 1000','No imprime','Limpieza de inyectores'),(2,2,NULL,'Sony','PlayStation 4','No enciende','Reemplazo de fuente de poder'),(3,3,NULL,'Dell','Inspiron 15','Pantalla rota','Reemplazo de pantalla'),(4,4,NULL,'Apple','MacBook Air','Lento','Actualización de hardware'),(5,5,NULL,'Samsung','Galaxy S21','Pantalla quebrada','Reemplazo de pantalla'),(6,6,NULL,'Lenovo','IdeaPad 5','No carga','Reemplazo de batería'),(7,7,NULL,'LG','OLED C1','Sin sonido','Reparación de placa de sonido'),(8,8,NULL,'Brother','HL-L2395DW','Atasco de papel','Limpieza y lubricación'),(9,9,NULL,'Nintendo','Switch OLED','Botones pegajosos','Limpieza y reemplazo de botones'),(10,10,NULL,'Acer','Predator Orion 9000','No se enciende','Reemplazo de fuente de poder'),(11,1,NULL,'HP','WorkForce Pro','Papel atascado','Limpieza de rodillos'),(12,2,NULL,'Microsoft','Xbox Series X','No lee discos','Reemplazo de unidad de disco'),(13,3,NULL,'Acer','Aspire E15','Sin audio','Reparación de placa de audio'),(14,4,NULL,'Dell','Alienware Aurora R12','Pantalla parpadea','Reemplazo de tarjeta gráfica'),(15,5,NULL,'Samsung','Galaxy Tab S7','Batería descarga rápido','Reemplazo de batería'),(16,6,NULL,'Huawei','MatePad Pro','No carga','Reemplazo de puerto de carga'),(17,7,NULL,'TCL','6-Series','Sin imagen','Reparación de placa principal'),(18,8,NULL,'Epson','EcoTank ET-2720','Impresión borrosa','Limpieza de cabezales'),(19,9,NULL,'Sony','PlayStation 4 Pro','Sobrecalentamiento','Limpieza y cambio de pasta térmica'),(20,10,NULL,'ASUS','ZenPad S 8.0','No se enciende','Reemplazo de batería'),(21,11,NULL,'HP','OfficeJet Pro 9025','Atasco de papel','Reemplazo de rodillos'),(22,12,NULL,'Sony','PlayStation 5','Error de disco','Limpieza de unidad de disco'),(23,13,NULL,'Apple','iMac 27\"','Pantalla parpadea','Reemplazo de tarjeta gráfica'),(24,14,NULL,'Samsung','Galaxy A52','No carga','Reemplazo de puerto de carga'),(25,15,NULL,'Lenovo','ThinkPad X1 Carbon','Pantalla rota','Reemplazo de pantalla'),(26,16,NULL,'LG','UltraGear 27GL83A-B','Sin imagen','Reparación de placa principal'),(27,17,NULL,'Canon','PIXMA MX922','No imprime','Limpieza de cabezales'),(28,18,NULL,'Nintendo','Switch Lite','Botones pegajosos','Limpieza y reemplazo de botones'),(29,19,NULL,'Acer','Aspire 5','No se enciende','Reemplazo de batería'),(30,20,NULL,'Xiaomi','Redmi Note 10','Pantalla quebrada','Reemplazo de pantalla'),(31,31,NULL,'ASUS','ROG Strix Scar 17','Sobrecalentamiento','Limpieza y cambio de pasta térmica'),(32,32,NULL,'Epson','WorkForce Pro WF-3820','Impresión borrosa','Limpieza de cabezales'),(33,33,NULL,'Microsoft','Surface Pro 7','Sin audio','Reparación de placa de audio'),(34,34,NULL,'Google','Pixel 6','No carga','Reemplazo de puerto de carga'),(35,35,NULL,'Toshiba','Satellite Pro','Pantalla parpadea','Reemplazo de tarjeta gráfica'),(36,36,NULL,'Amazon','Kindle Paperwhite','No enciende','Reemplazo de batería'),(37,37,NULL,'Xerox','Phaser 6510','Atasco de papel','Reemplazo de rodillos'),(38,38,NULL,'OnePlus','Nord N200','Sin imagen','Reparación de placa principal'),(39,39,NULL,'Panasonic','Lumix GH5','Error en lente','Reemplazo de lente'),(40,40,NULL,'Sharp','Aquos 4K','Sin audio','Reparación de placa de sonido'),(41,1,NULL,'Samsung','Galaxy S21','Pantalla rota','Ninguna'),(42,2,NULL,'HP','LaserJet Pro MFP M148fdw','Atasco de papel','Limpieza de rodillos'),(43,3,NULL,'Apple','MacBook Air','No se enciende','Reemplazo de placa madre'),(44,4,NULL,'Lenovo','Legion 5','Problemas de rendimiento','Reemplazo de unidad de disco'),(45,5,NULL,'Sony','Bravia 4K','Sin imagen','Reparación de fuente de poder'),(46,6,NULL,'Acer','Aspire 5','Teclado no funciona','Reemplazo de teclado'),(47,7,NULL,'Microsoft','Surface Pro 7','Pantalla táctil rota','Reemplazo de pantalla táctil'),(48,8,NULL,'Epson','EcoTank ET-2720','Impresiones borrosas','Limpieza de cabezales de impresión'),(49,9,NULL,'Toshiba','Satellite L50','Sin audio','Reparación de placa de sonido'),(50,10,NULL,'Xiaomi','Mi 11','Problemas de carga','Reemplazo de conector de carga');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacion` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `idequipo` int DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `falla_equipo` text,
  PRIMARY KEY (`idfactura`),
  KEY `idequipo` (`idequipo`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`),
  CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (1,1,1,'2023-11-10',150.00,'Pantalla rota'),(2,2,2,'2023-11-11',80.00,'Atasco de papel'),(3,3,3,'2023-11-12',200.00,'No enciende'),(4,4,4,'2023-11-13',50.00,'Pantalla en blanco'),(5,5,5,'2023-11-14',120.00,'Problemas de audio'),(6,6,6,'2023-11-15',70.00,'No carga'),(7,7,7,'2023-11-16',30.00,'No enciende'),(8,8,8,'2023-11-17',25.00,'Sin señal'),(9,9,9,'2023-11-18',45.00,'Pantalla dañada'),(10,10,10,'2023-11-19',180.00,'Problemas de red'),(11,11,1,'2023-11-20',90.00,'No enciende'),(12,12,2,'2023-11-21',60.00,'Problemas de impresión'),(13,13,3,'2023-11-22',110.00,'No carga'),(14,14,4,'2023-11-23',40.00,'Problemas de audio'),(15,15,5,'2023-11-24',75.00,'Pantalla en blanco'),(16,16,6,'2023-11-25',95.00,'Pantalla dañada'),(17,17,7,'2023-11-26',130.00,'Atasco de papel'),(18,18,8,'2023-11-27',110.00,'No carga'),(19,19,9,'2023-11-28',70.00,'Sin señal'),(20,20,10,'2023-11-29',55.00,'Problemas de red'),(21,21,11,'2023-12-10',200.00,'Pantalla rota'),(22,22,12,'2023-12-11',90.00,'Problemas de impresión'),(23,23,13,'2023-12-12',65.00,'No carga'),(24,24,14,'2023-12-13',85.00,'Pantalla en blanco'),(25,25,15,'2023-12-14',70.00,'Pantalla dañada'),(26,26,16,'2023-12-15',110.00,'Atasco de papel'),(27,27,17,'2023-12-16',40.00,'No enciende'),(28,28,18,'2023-12-17',30.00,'Problemas de audio'),(29,29,19,'2023-12-18',60.00,'Sin señal'),(30,30,20,'2023-12-19',150.00,'Problemas de red'),(31,31,11,'2023-12-10',200.00,'Pantalla rota'),(32,32,12,'2023-12-11',90.00,'Problemas de impresión'),(33,33,13,'2023-12-12',65.00,'No carga'),(34,34,14,'2023-12-13',85.00,'Pantalla en blanco'),(35,35,15,'2023-12-14',70.00,'Pantalla dañada'),(36,36,16,'2023-12-15',110.00,'Atasco de papel'),(37,37,17,'2023-12-16',40.00,'No enciende'),(38,38,18,'2023-12-17',30.00,'Problemas de audio'),(39,39,19,'2023-12-18',60.00,'Sin señal'),(40,40,20,'2023-12-19',150.00,'Problemas de red'),(41,41,21,'2023-12-20',120.00,'Pantalla rota'),(42,42,22,'2023-12-21',50.00,'Pantalla en blanco'),(43,43,23,'2023-12-22',75.00,'Problemas de red'),(44,44,24,'2023-12-23',95.00,'Pantalla dañada'),(45,45,25,'2023-12-24',130.00,'No carga'),(46,46,26,'2023-12-25',110.00,'Problemas de impresión'),(47,47,27,'2023-12-26',70.00,'Sin señal'),(48,48,28,'2023-12-27',55.00,'Atasco de papel'),(49,49,29,'2023-12-28',200.00,'Problemas de audio'),(50,50,30,'2023-12-29',90.00,'No enciende');
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `tipo_producto` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `caracteristicas` text,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `en_venta` tinyint(1) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `proveedor` int DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `proveedor` (`proveedor`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`idproveedor`),
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'Computadora','HP','Pavilion 590','Intel Core i5, 8 GB RAM, 1 TB HDD',599.99,5,1,'2023-10-01',1),(2,'Consola de Videojuegos','Sony','PlayStation 5','Ray Tracing, 825 GB SSD',499.99,10,1,'2023-10-01',2),(19,'Funda','Spigen','iPhone 12 Pro','Estuche protector, Negro',14.99,50,1,'2023-10-01',1),(20,'Microsoldadura Kit','Generic','Máquina de soldadura','Equipo de microsoldadura profesional',499.99,3,1,'2023-10-01',2),(21,'Memoria RAM','Kingston','HyperX 16GB','DDR4 3200MHz, Módulo individual',79.99,10,1,'2023-10-01',3),(22,'Teclado Inalámbrico','Logitech','K380','Multiplataforma, Compacto',39.99,7,1,'2023-10-01',4),(23,'Mouse Gamer','Razer','DeathAdder Elite','Sensor óptico de 16,000 DPI',59.99,9,1,'2023-10-01',5),(24,'Monitor','ASUS','VG279Q','27\", Full HD, 144Hz',249.99,6,1,'2023-10-01',6),(25,'Funda','OtterBox','Samsung Galaxy S21','Estuche protector, Negro',19.99,30,1,'2023-10-01',1),(26,'Teclado Mecánico','Logitech','G Pro X','Interruptores intercambiables',79.99,9,1,'2023-10-01',2),(27,'Funda','Spigen','iPhone 12 Pro','Estuche protector, Negro',14.99,50,1,'2023-10-01',1),(28,'Microsoldadura Kit','Generic','Máquina de soldadura','Equipo de microsoldadura profesional',499.99,3,1,'2023-10-01',2),(29,'Memoria RAM','Kingston','HyperX 16GB','DDR4 3200MHz, Módulo individual',79.99,10,1,'2023-10-01',3),(30,'Teclado Inalámbrico','Logitech','K380','Multiplataforma, Compacto',39.99,7,1,'2023-10-01',4),(31,'Mouse Gamer','Razer','DeathAdder Elite','Sensor óptico de 16,000 DPI',59.99,9,1,'2023-10-01',5),(32,'Monitor','ASUS','VG279Q','27\", Full HD, 144Hz',249.99,6,1,'2023-10-01',6),(33,'Funda','OtterBox','Samsung Galaxy S21','Estuche protector, Negro',19.99,30,1,'2023-10-01',1),(34,'Teclado Mecánico','Logitech','G Pro X','Interruptores intercambiables',79.99,9,1,'2023-10-01',2);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(255) NOT NULL,
  `contacto_proveedor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'TechSupplies','123-456-7890'),(2,'GameWorld','555-123-4567'),(3,'PrintTech','888-555-1234'),(4,'PhoneParts','555-999-8888'),(5,'SoundTech','777-123-4567'),(6,'AudioEmpire','123-777-5555'),(7,'StorageHub','333-555-7777'),(8,'TechKeys','666-999-1234'),(9,'TechMouse','444-777-5555'),(10,'DisplayPro','555-777-9999'),(11,'GameShop','123-456-7890'),(12,'PrintSolutions','555-123-4567'),(13,'ScreenGuard','888-555-1234'),(14,'PhoneAccessories','555-999-8888'),(15,'TechRepairPro','777-123-4567'),(16,'TechUpgrades','123-777-5555');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_equipo`
--

DROP TABLE IF EXISTS `tipo_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_equipo` (
  `idtipo_equipo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_equipo`
--

LOCK TABLES `tipo_equipo` WRITE;
/*!40000 ALTER TABLE `tipo_equipo` DISABLE KEYS */;
INSERT INTO `tipo_equipo` VALUES (1,'Impresora','HP','LaserJet 1000'),(2,'Impresora','Epson','WorkForce Pro'),(3,'Impresora','Canon','Pixma MX922'),(4,'Consola de Videojuegos','Sony','PlayStation 4'),(5,'Consola de Videojuegos','Microsoft','Xbox One'),(6,'Consola de Videojuegos','Nintendo','Switch'),(7,'Computadora','Dell','Inspiron 15'),(8,'Computadora','HP','Pavilion 27'),(9,'Computadora','Acer','Aspire E15'),(10,'Notebook','Lenovo','IdeaPad 5'),(11,'Notebook','Apple','MacBook Air'),(12,'Notebook','Dell','XPS 13'),(13,'Celular','Samsung','Galaxy S21'),(14,'Celular','iPhone','12 Pro Max'),(15,'Celular','Xiaomi','Redmi Note 10'),(16,'Tablet','Apple','iPad Pro'),(17,'Tablet','Samsung','Galaxy Tab S7'),(18,'Tablet','Amazon','Fire HD 10'),(19,'Televisor','LG','OLED C1'),(20,'Televisor','Sony','Bravia X90J'),(21,'Televisor','Samsung','QLED QN90A'),(22,'Impresora','Brother','HL-L2395DW'),(23,'Impresora','Xerox','WorkCentre 3335/DNI'),(24,'Impresora','Ricoh','SP C250DN'),(25,'Consola de Videojuegos','Nintendo','Switch OLED'),(26,'Consola de Videojuegos','Sony','PlayStation 5'),(27,'Consola de Videojuegos','Microsoft','Xbox Series X'),(28,'Computadora','Acer','Predator Orion 9000'),(29,'Computadora','HP','EliteOne 800 G5'),(30,'Computadora','Dell','Alienware Aurora R12'),(31,'Notebook','Lenovo','ThinkPad X1 Carbon'),(32,'Notebook','Dell','Latitude 9520'),(33,'Notebook','HP','Spectre x360'),(34,'Celular','Google','Pixel 6 Pro'),(35,'Celular','OnePlus','9 Pro'),(36,'Celular','Motorola','Moto G Power'),(37,'Tablet','Lenovo','Tab M10 Plus'),(38,'Tablet','Huawei','MatePad Pro'),(39,'Tablet','ASUS','ZenPad S 8.0'),(40,'Televisor','Vizio','P-Series Quantum X'),(41,'Televisor','TCL','6-Series'),(42,'Televisor','Panasonic','HX800'),(43,'Impresora','Epson','EcoTank ET-2720'),(44,'Impresora','Canon','ImageCLASS MF445dw'),(45,'Impresora','Brother','MFC-L8900CDW'),(46,'Consola de Videojuegos','Nintendo','Switch Lite'),(47,'Consola de Videojuegos','Sony','PlayStation 4 Pro'),(48,'Consola de Videojuegos','Microsoft','Xbox One X');
/*!40000 ALTER TABLE `tipo_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos_agendados`
--

DROP TABLE IF EXISTS `turnos_agendados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos_agendados` (
  `idturno` int NOT NULL AUTO_INCREMENT,
  `idcliente` int DEFAULT NULL,
  `idtecnico` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `reparacion` text NOT NULL,
  `direccion` text NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idturno`),
  KEY `idcliente` (`idcliente`),
  KEY `idtecnico` (`idtecnico`),
  CONSTRAINT `turnos_agendados_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `turnos_agendados_ibfk_2` FOREIGN KEY (`idtecnico`) REFERENCES `empleado` (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos_agendados`
--

LOCK TABLES `turnos_agendados` WRITE;
/*!40000 ALTER TABLE `turnos_agendados` DISABLE KEYS */;
INSERT INTO `turnos_agendados` VALUES (1,1,1,'2023-10-10','09:30:00','Reparación de pantalla','Av. Rivadavia 123',150.00),(2,2,2,'2023-10-11','10:00:00','Reemplazo de batería','Calle San Martín 456',80.00),(3,3,3,'2023-10-12','11:30:00','Mantenimiento general','Av. Belgrano 789',200.00),(4,4,4,'2023-10-13','17:30:00','Actualización de software','Calle Maipú 321',50.00),(5,5,5,'2023-10-14','09:45:00','Reparación de teclado','Av. Sarmiento 654',70.00),(6,6,6,'2023-10-17','17:45:00','Limpieza interna','Calle Dorrego 987',90.00),(7,7,7,'2023-10-18','10:30:00','Reparación de pantalla','Av. San Juan 234',150.00),(8,8,8,'2023-10-19','18:00:00','Mantenimiento general','Av. Mayo 567',200.00),(9,9,9,'2023-10-20','09:30:00','Reparación de batería','Calle Pueyrredón 876',80.00),(10,10,10,'2023-10-21','17:30:00','Actualización de software','Av. 9 de Julio 123',50.00);
/*!40000 ALTER TABLE `turnos_agendados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06  3:07:19
