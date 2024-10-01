-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ppk
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `ms_items`
--

DROP TABLE IF EXISTS `ms_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_items` (
  `ITEM_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `LEVEL` int unsigned NOT NULL,
  `CODE` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(45) NOT NULL,
  `NEXT_LEVEL` int unsigned NOT NULL,
  `FIELD_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_items`
--

LOCK TABLES `ms_items` WRITE;
/*!40000 ALTER TABLE `ms_items` DISABLE KEYS */;
INSERT INTO `ms_items` VALUES (1,0,'AC','AC power pack',1,'Power type'),(2,0,'DC','DC power pack',2,'Power type'),(3,1,'T','3 phase',3,'Phase'),(4,1,'S','1 phase',4,'Phase'),(5,2,'12','12V',5,'Voltage'),(6,2,'24','24V',6,'Voltage'),(7,3,'T4037','4 pole, 0.37 kw',8,'Power'),(8,3,'T4075','4 pole, 0.75 kw',8,'Power'),(9,3,'T4110','4 pole, 1.1kw',8,'Power'),(10,3,'T2110','2 pole, 1.1kw',8,'Power'),(11,3,'T4150','4 pole, 1.5kw',8,'Power'),(12,3,'T4220','4 pole, 2.2kw',8,'Power'),(13,4,'S4037','4 pole, 0.37kw',8,'Power'),(14,4,'S4075','4 pole, 0.75kw',8,'Power'),(15,4,'S4110','4 pole, 1.1kw',8,'Power'),(16,4,'S2110','2 pole, 1.1kw',8,'Power'),(17,4,'S4150','4 pole, 1.5kw',8,'Power'),(18,4,'S4220','4 pole, 2.2kw',8,'Power'),(19,5,'D1208','800 watt',7,'Power'),(20,6,'D2408','800 watt',7,'Power'),(21,5,'D1212','1200 watt',7,'Power'),(22,5,'D1216','1600 watt',7,'Power'),(23,6,'D2422','2200 watt',7,'Power'),(24,6,'D2430','3000 watt',7,'Power'),(25,6,'F2430','3000 watt',7,'Power'),(26,6,'L2430','3000 watt',7,'Power'),(27,7,'0','no relay',8,'Starting relay'),(28,7,'1','12V, relay',8,'Starting relay'),(29,7,'2','24V, relay',8,'Starting relay'),(30,8,'U1','U1',9,'Central Manifold Circuit'),(31,8,'U2','U2',9,'Central Manifold Circuit'),(32,8,'U3','U3',17,'Central Manifold Circuit'),(33,8,'U4','U4',17,'Central Manifold Circuit'),(34,8,'U5','U5',10,'Central Manifold Circuit'),(35,8,'U6','U6',11,'Central Manifold Circuit'),(36,9,'S','RV, 10-160 bar',13,'RV setting'),(37,9,'N','RV, 50-180 bar',13,'RV setting'),(38,9,'B','RV, 100-290 bar',13,'RV setting'),(39,10,'S','RV, 10-160 bar',12,'RV setting'),(40,10,'N','RV, 50-180 bar',12,'RV setting'),(41,10,'B','RV, 100-290 bar',12,'RV setting'),(42,11,'S','RV, 10-160 bar',13,'RV setting'),(43,11,'N','RV, 50-180 bar',13,'RV setting'),(44,11,'B','RV, 100-290 bar',13,'RV setting'),(45,12,'SC','Single poppet Normally Closed',14,'SV type'),(46,12,'SO','Single Poppet Normally Open',14,'SV type'),(47,12,'SD','Double poppet Normally closed',14,'SV type'),(48,13,'SC','Single poppet Normally Closed',15,'SV type'),(49,13,'SO','Single Poppet Normally Open',15,'SV type'),(50,13,'SD','Double poppet Normally closed',15,'SV type'),(51,14,'XXX','Without',17,'SV setting'),(52,14,'D12','DC 12 V',17,'SV setting'),(53,14,'D24','DC 24 V',17,'SV setting'),(54,14,'A11','AC 110V,50Hz/60Hz',17,'SV setting'),(55,14,'A23','AC 230V,50Hz/60Hz',17,'SV setting'),(56,14,'A24','AC 24V DC',17,'SV setting'),(57,15,'XXX','Without',16,'SV setting'),(58,15,'D12','DC 12 V',16,'SV setting'),(59,15,'D24','DC 24 V',16,'SV setting'),(60,15,'A11','AC 110V,50Hz/60Hz',16,'SV setting'),(61,15,'A23','AC 230V,50Hz/60Hz',16,'SV setting'),(62,15,'A24','AC 24V DC',16,'SV setting'),(63,16,'X','Without',17,'FC Valve setting'),(64,16,'A','Adjustable',17,'FC Valve setting'),(65,16,'B','2 LPM',17,'FC Valve setting'),(66,16,'C','3 LPM',17,'FC Valve setting'),(67,16,'D','4 LPM',17,'FC Valve setting'),(68,16,'F','6 LPM',17,'FC Valve setting'),(69,16,'H','8 LPM',17,'FC Valve setting'),(70,16,'J','10 LPM',17,'FC Valve setting'),(71,16,'L','12 LPM',17,'FC Valve setting'),(72,16,'O','15 LPM',17,'FC Valve setting'),(73,17,'13','1.3 cc/rev',18,'Gear Pump'),(74,17,'16','1.6 cc/rev',18,'Gear Pump'),(75,17,'23','2.3 cc/rev',18,'Gear Pump'),(76,17,'27','2.7 cc/rev',18,'Gear Pump'),(77,17,'32','3.2 cc/rev',18,'Gear Pump'),(78,17,'37','3.7 cc/rev',18,'Gear Pump'),(79,17,'42','4.2 cc/rev',18,'Gear Pump'),(80,17,'58','5.8 cc/rev',18,'Gear Pump'),(81,17,'70','7 cc/rev',18,'Gear Pump'),(82,17,'80','8 cc/rev',18,'Gear Pump'),(83,18,'X','No Tank',21,'Tank material'),(84,18,'P','Plastic',19,'Tank material'),(85,18,'S','Steel',20,'Tank material'),(86,19,'*03','3Lt Square',21,'Tank size'),(87,19,'*05','3Lt Square',21,'Tank size'),(88,20,'*05','5Lt Round',21,'Tank size'),(89,20,'*08','8Lt Round',21,'Tank size'),(90,20,'12','12Lt Square Horizontal',21,'Tank size'),(91,20,'12','12Lt Square Vertical',21,'Tank size'),(92,20,'15','15Lt Square Horizontal',21,'Tank size'),(93,20,'15','15Lt Square Vertical',21,'Tank size'),(94,20,'25','25Lt Square Horizontal',21,'Tank size'),(95,20,'25','25Lt Square Vertical',21,'Tank size'),(96,21,'stop','stop',0,'');
/*!40000 ALTER TABLE `ms_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:24:44

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ppk
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `ms_order`
--

DROP TABLE IF EXISTS `ms_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_order` (
  `ORDER_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PPK_CODE` varchar(100) NOT NULL,
  `ORDER_CREATION_TIME` timestamp NOT NULL,
  `USER_ID` int unsigned NOT NULL,
  `STATUS_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `fk_order_userId_idx` (`USER_ID`),
  CONSTRAINT `ms_order_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `us_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_order`
--

LOCK TABLES `ms_order` WRITE;
/*!40000 ALTER TABLE `ms_order` DISABLE KEYS */;
INSERT INTO `ms_order` VALUES (4,'DC-24-D2422-0-U2-B-SO-XXX-X-16-X','2024-06-18 08:24:44',2,'Canceled'),(5,'DC-24-D2422-0-U2-B-SO-XXX-X-16-X','2024-06-18 08:24:47',2,'Completed'),(6,'AC-S-S4075-U3-23-P-*05','2024-06-18 08:30:07',2,'Canceled'),(7,'AC-S-S4075-U3-23-P-*05','2024-06-18 08:54:58',2,'Canceled'),(8,'DC-24-D2422-1-U3-23-P-*05','2024-06-19 04:59:19',2,'Placed'),(18,'AC-S-S2110-U3-58-P-*03','2024-06-23 11:59:48',2,'Placed'),(21,'DC-24-D2422-1-U3-70-S-*05','2024-06-24 04:44:56',2,'Placed'),(22,'DC-24-D2430-1-U5-N-SO-D24-37-S-15','2024-06-24 05:07:53',2,'Placed'),(23,'AC-S-S4110-U3-42-P-*03','2024-06-24 05:48:08',2,'Placed'),(24,'DC-24-D2422-1-U4-13-S-15','2024-06-24 06:02:16',2,'Placed'),(25,'DC-24-D2430-2-U3-80-S-15','2024-06-24 10:23:14',2,'Canceled');
/*!40000 ALTER TABLE `ms_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:24:44

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ppk
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `ms_status`
--

DROP TABLE IF EXISTS `ms_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_status` (
  `STATUS_ID` varchar(50) NOT NULL,
  `STATUS_DESC` varchar(45) NOT NULL,
  PRIMARY KEY (`STATUS_ID`),
  KEY `idx_roleBusinessFunction_statusId` (`STATUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_status`
--

LOCK TABLES `ms_status` WRITE;
/*!40000 ALTER TABLE `ms_status` DISABLE KEYS */;
INSERT INTO `ms_status` VALUES ('Canceled','Canceled'),('Completed','Completed'),('Placed','Placed');
/*!40000 ALTER TABLE `ms_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:24:44

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ppk
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `us_business_function`
--

DROP TABLE IF EXISTS `us_business_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_business_function` (
  `BUSINESS_FUNCTION_ID` varchar(45) NOT NULL,
  `BUSINESS_FUNCTION_DESC` varchar(100) NOT NULL,
  PRIMARY KEY (`BUSINESS_FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_business_function`
--

LOCK TABLES `us_business_function` WRITE;
/*!40000 ALTER TABLE `us_business_function` DISABLE KEYS */;
INSERT INTO `us_business_function` VALUES ('ROLE_BF_CREATE_ORDER','Create Order'),('ROLE_BF_FLOW','Manage Configuration Order / Flow'),('ROLE_BF_MANAGE_ORDER','List / Change status of orders'),('ROLE_BF_MANAGE_USER','Create / Edit / List User'),('ROLE_BF_SHOW_HOME','Show home page');
/*!40000 ALTER TABLE `us_business_function` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:24:44

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ppk
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `us_role`
--

DROP TABLE IF EXISTS `us_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_role` (
  `ROLE_ID` varchar(25) NOT NULL,
  `ROLE_DESC` varchar(50) NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_role`
--

LOCK TABLES `us_role` WRITE;
/*!40000 ALTER TABLE `us_role` DISABLE KEYS */;
INSERT INTO `us_role` VALUES ('ROLE_ADMIN','administrator'),('ROLE_USER','sales person');
/*!40000 ALTER TABLE `us_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:24:44

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ppk
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `us_role_business_function`
--

DROP TABLE IF EXISTS `us_role_business_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_role_business_function` (
  `ROLE_ID` varchar(25) NOT NULL,
  `BUSINESS_FUNCTION_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`BUSINESS_FUNCTION_ID`),
  KEY `fk_roleBusinessFunction_roleId_idx` (`ROLE_ID`),
  KEY `fk_roleBusinessFunction_businessFunctionId_idx` (`BUSINESS_FUNCTION_ID`),
  CONSTRAINT `fk_roleBusinessFunction_businessFunctionId_idx` FOREIGN KEY (`BUSINESS_FUNCTION_ID`) REFERENCES `us_business_function` (`BUSINESS_FUNCTION_ID`),
  CONSTRAINT `fk_roleBusinessFunction_roleId_idx` FOREIGN KEY (`ROLE_ID`) REFERENCES `us_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_role_business_function`
--

LOCK TABLES `us_role_business_function` WRITE;
/*!40000 ALTER TABLE `us_role_business_function` DISABLE KEYS */;
INSERT INTO `us_role_business_function` VALUES ('ROLE_ADMIN','ROLE_BF_CREATE_ORDER'),('ROLE_ADMIN','ROLE_BF_FLOW'),('ROLE_ADMIN','ROLE_BF_MANAGE_ORDER'),('ROLE_ADMIN','ROLE_BF_MANAGE_USER'),('ROLE_ADMIN','ROLE_BF_SHOW_HOME'),('ROLE_USER','ROLE_BF_CREATE_ORDER'),('ROLE_USER','ROLE_BF_SHOW_HOME');
/*!40000 ALTER TABLE `us_role_business_function` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:24:44

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ppk
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `us_user`
--

DROP TABLE IF EXISTS `us_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_user` (
  `USER_ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the user table',
  `USERNAME` varchar(25) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PASSWORD` tinyblob,
  `ROLE_ID` varchar(25) NOT NULL,
  `ACTIVE` tinyint unsigned NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USERNAME_UNIQUE` (`USERNAME`),
  KEY `fk_user_roleId` (`ROLE_ID`),
  KEY `idx_user_username` (`USERNAME`),
  CONSTRAINT `fk_user_roleId` FOREIGN KEY (`ROLE_ID`) REFERENCES `us_role` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_user`
--

LOCK TABLES `us_user` WRITE;
/*!40000 ALTER TABLE `us_user` DISABLE KEYS */;
INSERT INTO `us_user` VALUES (2,'admin','Ashraf',_binary '$2a$10$cnxgAoY0tnrJ9g81aob.kevmvTJpr72W1tGKOTMtsmdFM5yJvIFdy','ROLE_ADMIN',1),(3,'user0','User 0',_binary '$2a$10$5st2YFP6haOqhLSym6IuLeOxLwMbxtmMZALx1OUhGJw14I.ZqV..i','ROLE_USER',1),(4,'ppp2','ppp',_binary '$2a$10$4mhIcS5q3uZ4.nvFIC4tD.0VNqFJnYz0.rELmEUgHyUf8Bv4bikye','ROLE_ADMIN',0),(7,'user2','user2',_binary '$2a$10$UZIoEx.ddmxdigRoH9tP4OQaZZJQ3jHJFIwb6NnN9uJ/KE6a/UpIu','ROLE_ADMIN',1),(8,'customer2','customer1',_binary '$2a$10$ZBlVuW6aNvwjO/WpeqeEVuspFe0UUpCxMV91wByoZQ.3x0aw/oCqm','ROLE_USER',1),(9,'user99','user99',_binary '$2a$10$KgmubG8wjzff6KQ2e2Pmt.8/JDMlY2jAqpyWSjRYzOnU7RkwVX9ly','ROLE_ADMIN',1),(14,'super','prajwal',_binary '$2a$10$L53XTX9NgQrLQ3qB59ALA.3ZmAmAoVCs2lHlP8hKb6QeBkz2XAnoK','ROLE_ADMIN',0),(15,'user223','yuser',_binary '$2a$10$XTe.AfXg.tAB.cSWa83qcukJif.dSEijrGTxZEvCmPCvImsRqxtlK','ROLE_ADMIN',0),(18,'ss','ss',_binary '$2a$10$nDb98yK7bqO3siBRKQEmdOlmo7RzZoyjBsiQHTUU2VhsePhuPtwvO','ROLE_ADMIN',1),(19,'dsf','asd',_binary '$2a$10$NxkLhdmThy/dyO1yEkMaf.NTMQvMqZxfupY8KES41nK21lIyP9pGu','ROLE_ADMIN',1),(20,'fdsgdfgdfg','sddfsdf',_binary '$2a$10$urOwMm1lMS0/Q/1VQxOcD.b/67H8w6rK4yJ4nsjU26eIJEP61vn3y','ROLE_ADMIN',1),(26,'dfsg','fg',_binary '$2a$10$jWryPCVIayCwz.8JViUA.OXZ45WLwi36o7WV/DC8.Re3TIJZqsRna','ROLE_ADMIN',1);
/*!40000 ALTER TABLE `us_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:24:44

