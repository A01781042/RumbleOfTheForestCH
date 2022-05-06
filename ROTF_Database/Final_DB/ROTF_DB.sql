CREATE DATABASE  IF NOT EXISTS `rumbleoftheforest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rumbleoftheforest`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rumbleoftheforest
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Temporary view structure for view `damage_compare`
--

DROP TABLE IF EXISTS `damage_compare`;
/*!50001 DROP VIEW IF EXISTS `damage_compare`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `damage_compare` AS SELECT 
 1 AS `name`,
 1 AS `damage_taken`,
 1 AS `damage_inflicted`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enemies`
--

DROP TABLE IF EXISTS `enemies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemies` (
  `id_enemies` int unsigned NOT NULL AUTO_INCREMENT,
  `points` smallint DEFAULT NULL,
  `crow` smallint DEFAULT NULL,
  `fox` smallint DEFAULT NULL,
  `worm` smallint DEFAULT NULL,
  PRIMARY KEY (`id_enemies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemies`
--

LOCK TABLES `enemies` WRITE;
/*!40000 ALTER TABLE `enemies` DISABLE KEYS */;
/*!40000 ALTER TABLE `enemies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id_level` int unsigned NOT NULL AUTO_INCREMENT,
  `id_user_level` int unsigned NOT NULL,
  PRIMARY KEY (`id_level`),
  KEY `id_user_level_idx` (`id_user_level`),
  CONSTRAINT `id_user_level` FOREIGN KEY (`id_user_level`) REFERENCES `user_level` (`id_user_level`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id_notes` int unsigned NOT NULL AUTO_INCREMENT,
  `perfect` int NOT NULL DEFAULT '20',
  `good` int NOT NULL DEFAULT '15',
  `hit` int NOT NULL DEFAULT '10',
  `missed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `notes_stats`
--

DROP TABLE IF EXISTS `notes_stats`;
/*!50001 DROP VIEW IF EXISTS `notes_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `notes_stats` AS SELECT 
 1 AS `name`,
 1 AS `total_notes`,
 1 AS `perfect_percentage`,
 1 AS `good_percentage`,
 1 AS `hit_percentage`,
 1 AS `missed_percentage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id_score` int unsigned NOT NULL AUTO_INCREMENT,
  `total_score` int NOT NULL,
  `lost_life` int NOT NULL,
  `damage_taken` int NOT NULL,
  `damage_inflicted` int NOT NULL,
  `id_score_enemies` int unsigned DEFAULT NULL,
  `id_score_notes` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_score`),
  KEY `id_score_enemies_idx` (`id_score_enemies`),
  KEY `id_score_notes` (`id_score_notes`),
  CONSTRAINT `id_score_enemies` FOREIGN KEY (`id_score_enemies`) REFERENCES `score_enemies` (`id_score_enemies`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_score_notes` FOREIGN KEY (`id_score_notes`) REFERENCES `score_notes` (`id_score_notes`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,153500,76,107,1945,NULL,NULL),(2,785670,12,571,1419,NULL,NULL),(3,611764,4,405,290,NULL,NULL),(4,789238,81,74,440,NULL,NULL),(5,41449,14,506,1995,NULL,NULL),(6,987182,98,515,1333,NULL,NULL),(7,806852,93,521,1759,NULL,NULL),(8,704317,13,389,1253,NULL,NULL),(9,506604,1,157,584,NULL,NULL),(10,165686,52,454,159,NULL,NULL),(11,475348,28,664,155,NULL,NULL),(12,331228,77,598,1749,NULL,NULL),(13,23508,16,355,159,NULL,NULL),(14,640561,82,647,1588,NULL,NULL),(15,404286,7,188,549,NULL,NULL),(16,887657,97,12,1275,NULL,NULL),(17,656492,65,537,652,NULL,NULL),(18,761117,52,290,1402,NULL,NULL),(19,407191,21,2,248,NULL,NULL),(20,621710,20,190,1713,NULL,NULL),(21,182430,16,660,1526,NULL,NULL),(22,737468,62,445,24,NULL,NULL),(23,250987,91,592,899,NULL,NULL),(24,557780,46,476,439,NULL,NULL),(25,543046,20,73,1956,NULL,NULL),(26,693132,34,325,1193,NULL,NULL),(27,938540,79,129,656,NULL,NULL),(28,457713,81,83,1662,NULL,NULL),(29,96757,2,688,429,NULL,NULL),(30,500021,93,359,786,NULL,NULL),(31,411801,95,205,57,NULL,NULL),(32,900764,9,579,1986,NULL,NULL),(33,72830,68,745,1761,NULL,NULL),(34,274043,15,689,1603,NULL,NULL),(35,339232,83,258,436,NULL,NULL),(36,816145,18,289,380,NULL,NULL),(37,599834,77,549,997,NULL,NULL),(38,53988,45,51,1159,NULL,NULL),(39,431363,29,492,10,NULL,NULL),(40,274145,43,712,1112,NULL,NULL),(41,888257,98,151,846,NULL,NULL),(42,445059,35,215,1555,NULL,NULL),(43,165274,56,394,108,NULL,NULL),(44,840071,3,739,1204,NULL,NULL),(45,552751,22,65,477,NULL,NULL),(46,553787,27,507,388,NULL,NULL),(47,574188,44,485,1547,NULL,NULL),(48,409457,96,510,1099,NULL,NULL),(49,937917,29,176,1257,NULL,NULL),(50,238594,27,656,1178,NULL,NULL),(51,123878,75,522,200,NULL,NULL),(52,137405,95,309,1918,NULL,NULL),(53,116516,66,155,390,NULL,NULL),(54,228912,49,485,817,NULL,NULL),(55,975757,6,632,400,NULL,NULL),(56,897445,29,66,744,NULL,NULL),(57,139207,13,144,951,NULL,NULL),(58,81093,2,417,1020,NULL,NULL),(59,260246,97,285,414,NULL,NULL),(60,243926,15,567,862,NULL,NULL),(61,101054,32,57,667,NULL,NULL),(62,450089,97,140,1920,NULL,NULL),(63,604945,53,230,488,NULL,NULL),(64,851865,67,582,1268,NULL,NULL),(65,176631,25,707,1717,NULL,NULL),(66,86498,5,417,217,NULL,NULL),(67,421779,55,378,1039,NULL,NULL),(68,211290,99,14,197,NULL,NULL),(69,455443,51,313,1067,NULL,NULL),(70,755533,23,423,1431,NULL,NULL),(71,545667,75,614,108,NULL,NULL),(72,183425,72,187,186,NULL,NULL),(73,913845,0,593,1161,NULL,NULL),(74,618351,35,240,166,NULL,NULL),(75,880933,19,497,884,NULL,NULL),(76,261805,90,635,599,NULL,NULL),(77,165376,58,610,502,NULL,NULL),(78,176787,9,17,433,NULL,NULL),(79,52938,50,425,1427,NULL,NULL),(80,506752,43,411,676,NULL,NULL),(81,6066,19,477,1291,NULL,NULL),(82,458859,71,128,45,NULL,NULL),(83,380491,67,563,1825,NULL,NULL),(84,531824,44,708,1036,NULL,NULL),(85,916208,75,712,901,NULL,NULL),(86,915556,95,211,370,NULL,NULL),(87,212777,95,176,1739,NULL,NULL),(88,65028,35,127,1815,NULL,NULL),(89,186546,71,141,44,NULL,NULL),(90,909921,25,1,1835,NULL,NULL),(91,642394,53,3,494,NULL,NULL),(92,362612,63,644,1848,NULL,NULL),(93,998449,96,239,258,NULL,NULL),(94,231965,72,242,58,NULL,NULL),(95,323466,55,332,1957,NULL,NULL),(96,337545,5,714,1305,NULL,NULL),(97,791237,57,547,1582,NULL,NULL),(98,472002,12,346,1713,NULL,NULL),(99,748401,23,177,1174,NULL,NULL),(100,959175,57,314,1336,NULL,NULL),(101,564983,61,78,14,NULL,NULL),(102,365314,11,244,119,NULL,NULL),(103,504858,83,729,1655,NULL,NULL),(104,14030,46,664,562,NULL,NULL),(105,103942,76,622,1271,NULL,NULL),(106,536700,83,38,751,NULL,NULL),(107,477480,63,109,1373,NULL,NULL),(108,987999,59,114,383,NULL,NULL),(109,106810,80,299,580,NULL,NULL),(110,269108,9,637,281,NULL,NULL),(111,97662,67,134,119,NULL,NULL),(112,710443,91,30,1833,NULL,NULL),(113,773960,34,189,1824,NULL,NULL),(114,829626,69,490,962,NULL,NULL),(115,905098,64,277,1376,NULL,NULL),(116,673561,14,176,1701,NULL,NULL),(117,353749,89,218,561,NULL,NULL),(118,621591,35,623,996,NULL,NULL),(119,320255,50,359,1714,NULL,NULL),(120,228874,92,728,1045,NULL,NULL);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `score_BEFORE_INSERT` BEFORE INSERT ON `score` FOR EACH ROW BEGIN
	if new.lost_life < 0 then
		set new.lost_life = 0;
	end if;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `score_BEFORE_UPDATE` BEFORE UPDATE ON `score` FOR EACH ROW BEGIN
	if new.lost_life < 0 then
		set new.lost_life = 0;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `score_enemies`
--

DROP TABLE IF EXISTS `score_enemies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_enemies` (
  `id_score_enemies` int unsigned NOT NULL AUTO_INCREMENT,
  `num_of_enemies` int NOT NULL,
  `id_enemies` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_score_enemies`),
  KEY `id_enemies` (`id_enemies`),
  CONSTRAINT `id_enemies` FOREIGN KEY (`id_enemies`) REFERENCES `enemies` (`id_enemies`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_enemies`
--

LOCK TABLES `score_enemies` WRITE;
/*!40000 ALTER TABLE `score_enemies` DISABLE KEYS */;
INSERT INTO `score_enemies` VALUES (1,748,NULL),(2,131,NULL),(3,467,NULL),(4,782,NULL),(5,679,NULL),(6,740,NULL),(7,81,NULL),(8,397,NULL),(9,880,NULL),(10,356,NULL),(11,894,NULL),(12,589,NULL),(13,598,NULL),(14,702,NULL),(15,597,NULL),(16,361,NULL),(17,92,NULL),(18,35,NULL),(19,999,NULL),(20,220,NULL),(21,25,NULL),(22,181,NULL),(23,188,NULL),(24,64,NULL),(25,105,NULL),(26,999,NULL),(27,179,NULL),(28,456,NULL),(29,925,NULL),(30,202,NULL),(31,609,NULL),(32,127,NULL),(33,371,NULL),(34,956,NULL),(35,993,NULL),(36,589,NULL),(37,237,NULL),(38,166,NULL),(39,308,NULL),(40,536,NULL),(41,338,NULL),(42,507,NULL),(43,885,NULL),(44,875,NULL),(45,164,NULL),(46,293,NULL),(47,22,NULL),(48,56,NULL),(49,599,NULL),(50,38,NULL),(51,327,NULL),(52,242,NULL),(53,819,NULL),(54,624,NULL),(55,348,NULL),(56,912,NULL),(57,863,NULL),(58,830,NULL),(59,180,NULL),(60,309,NULL),(61,696,NULL),(62,992,NULL),(63,611,NULL),(64,753,NULL),(65,562,NULL),(66,185,NULL),(67,671,NULL),(68,719,NULL),(69,144,NULL),(70,489,NULL),(71,304,NULL),(72,682,NULL),(73,88,NULL),(74,370,NULL),(75,971,NULL),(76,664,NULL),(77,185,NULL),(78,679,NULL),(79,219,NULL),(80,45,NULL),(81,614,NULL),(82,60,NULL),(83,307,NULL),(84,379,NULL),(85,319,NULL),(86,336,NULL),(87,565,NULL),(88,440,NULL),(89,123,NULL),(90,13,NULL),(91,20,NULL),(92,531,NULL),(93,664,NULL),(94,164,NULL),(95,322,NULL),(96,193,NULL),(97,363,NULL),(98,900,NULL),(99,513,NULL),(100,427,NULL),(101,729,NULL),(102,212,NULL),(103,149,NULL),(104,284,NULL),(105,875,NULL),(106,153,NULL),(107,80,NULL),(108,81,NULL),(109,264,NULL),(110,413,NULL),(111,716,NULL),(112,170,NULL),(113,64,NULL),(114,373,NULL),(115,250,NULL),(116,598,NULL),(117,110,NULL),(118,892,NULL),(119,485,NULL),(120,981,NULL);
/*!40000 ALTER TABLE `score_enemies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_notes`
--

DROP TABLE IF EXISTS `score_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_notes` (
  `id_score_notes` int unsigned NOT NULL AUTO_INCREMENT,
  `num_notes_perfect` int NOT NULL,
  `num_notes_good` int NOT NULL,
  `num_notes_hit` int NOT NULL,
  `num_notes_missed` int NOT NULL,
  `id_notes` int unsigned DEFAULT NULL,
  `num_of_notes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_score_notes`),
  KEY `id_score_notes_idx` (`id_score_notes`),
  KEY `id_notes_idx` (`id_notes`),
  CONSTRAINT `id_notes` FOREIGN KEY (`id_notes`) REFERENCES `notes` (`id_notes`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_notes`
--

LOCK TABLES `score_notes` WRITE;
/*!40000 ALTER TABLE `score_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id_statistics` int unsigned NOT NULL AUTO_INCREMENT,
  `accuracy` double NOT NULL,
  `game_time` int NOT NULL,
  `deaths` int NOT NULL,
  `best_accuracy` double DEFAULT '0',
  PRIMARY KEY (`id_statistics`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,70.79261243435306,349,130,NULL),(2,77.07157073825017,94,178,NULL),(3,8.839578212435416,38,247,NULL),(4,32.85491142371262,155,19,NULL),(5,52.03960980225697,198,245,NULL),(6,61.6396190188315,391,147,NULL),(7,81.30973052885533,189,201,NULL),(8,17.21675995279086,330,206,NULL),(9,69.06420935622089,202,176,NULL),(10,29.003257724493125,104,112,NULL),(11,5.445829577964045,345,132,NULL),(12,94.16373715932605,26,54,NULL),(13,8.359017207745211,16,131,NULL),(14,29.20914611635359,409,17,NULL),(15,58.42863722569713,184,81,NULL),(16,85.03514327659443,439,163,NULL),(17,37.206051188315634,135,119,NULL),(18,31.83782615054678,164,21,NULL),(19,75.02318031879092,158,163,NULL),(20,19.273123490778122,234,25,NULL);
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `statistics_BEFORE_UPDATE` BEFORE UPDATE ON `statistics` FOR EACH ROW BEGIN
	IF NEW.accuracy > OLD.accuracy
    THEN
		SET NEW.best_accuracy = NEW.accuracy;
	END if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `top_ages`
--

DROP TABLE IF EXISTS `top_ages`;
/*!50001 DROP VIEW IF EXISTS `top_ages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_ages` AS SELECT 
 1 AS `age`,
 1 AS `num_age`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_high_scores`
--

DROP TABLE IF EXISTS `top_high_scores`;
/*!50001 DROP VIEW IF EXISTS `top_high_scores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_high_scores` AS SELECT 
 1 AS `name`,
 1 AS `total_score`,
 1 AS `age`,
 1 AS `accuracy`,
 1 AS `game_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id_user_info` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `age` tinyint NOT NULL,
  `country` varchar(45) NOT NULL,
  `id_statistics` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_user_info`),
  KEY `id_statistics_idx` (`id_statistics`),
  CONSTRAINT `id_statistics` FOREIGN KEY (`id_statistics`) REFERENCES `statistics` (`id_statistics`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'Tucker','Tucker477@gmail.com',50,'Norfolk',NULL),(2,'Ralph','Ralph496@gmail.com',45,'Cambodia',NULL),(3,'Boston','Boston760@gmail.com',23,'Estonia',NULL),(4,'Rafael','Rafael756@gmail.com',67,'Belgium',NULL),(5,'Oswaldo','Oswaldo799@gmail.com',66,'Afghanistan',NULL),(6,'Cordell','Cordell628@gmail.com',38,'Northern',NULL),(7,'Jimmy','Jimmy300@gmail.com',48,'Liberia',NULL),(8,'Selena','Selena137@gmail.com',35,'Cayman',NULL),(9,'Ivy','Ivy876@gmail.com',57,'Angola',NULL),(10,'America','America35@gmail.com',31,'Heard',NULL),(11,'Scott','Scott814@gmail.com',29,'Northern',NULL),(12,'Ahmad','Ahmad791@gmail.com',39,'Pakistan',NULL),(13,'Urijah','Urijah858@gmail.com',42,'Mexico',NULL),(14,'Jamya','Jamya567@gmail.com',20,'Åland',NULL),(15,'Lorelei','Lorelei124@gmail.com',45,'Moldova,',NULL),(16,'Roland','Roland852@gmail.com',35,'Canada',NULL),(17,'Perla','Perla452@gmail.com',30,'French',NULL),(18,'Dominic','Dominic264@gmail.com',48,'Cuba',NULL),(19,'Freddy','Freddy31@gmail.com',45,'Dominican',NULL),(20,'Brenda','Brenda665@gmail.com',67,'Papua',NULL),(21,'Kimora','Kimora990@gmail.com',37,'Puerto',NULL),(22,'Elise','Elise186@gmail.com',47,'Norway',NULL),(23,'Julio','Julio981@gmail.com',68,'Gabon',NULL),(24,'Londyn','Londyn683@gmail.com',51,'Indonesia',NULL),(25,'Ryan','Ryan175@gmail.com',21,'Paraguay',NULL),(26,'Sonny','Sonny278@gmail.com',61,'Canada',NULL),(27,'Shaun','Shaun262@gmail.com',37,'Iran,',NULL),(28,'Taryn','Taryn415@gmail.com',54,'Bosnia',NULL),(29,'Jewel','Jewel103@gmail.com',25,'Morocco',NULL),(30,'Karissa','Karissa771@gmail.com',36,'Malaysia',NULL),(31,'Zaniyah','Zaniyah384@gmail.com',29,'Congo,',NULL),(32,'Jadiel','Jadiel54@gmail.com',59,'Marshall',NULL),(33,'Faith','Faith7@gmail.com',48,'Nicaragua',NULL),(34,'Katelynn','Katelynn414@gmail.com',23,'Costa',NULL),(35,'Jaylan','Jaylan434@gmail.com',64,'Saint',NULL),(36,'Dakota','Dakota361@gmail.com',62,'Fiji',NULL),(37,'Desmond','Desmond570@gmail.com',39,'Egypt',NULL),(38,'Ulises','Ulises738@gmail.com',26,'Bosnia',NULL),(39,'Charlie','Charlie592@gmail.com',33,'Norfolk',NULL),(40,'Cassius','Cassius518@gmail.com',47,'Palau',NULL),(41,'Duncan','Duncan950@gmail.com',34,'Madagascar',NULL),(42,'Tiffany','Tiffany545@gmail.com',49,'Eritrea',NULL),(43,'Nataly','Nataly96@gmail.com',44,'Jamaica',NULL),(44,'Jaelynn','Jaelynn853@gmail.com',23,'British',NULL),(45,'Aimee','Aimee173@gmail.com',39,'Faroe',NULL),(46,'Carl','Carl132@gmail.com',27,'Antigua',NULL),(47,'Quinton','Quinton72@gmail.com',64,'Bhutan',NULL),(48,'Harrison','Harrison580@gmail.com',54,'Reunion',NULL),(49,'Jamison','Jamison413@gmail.com',42,'Lithuania',NULL),(50,'Scarlett','Scarlett298@gmail.com',24,'Åland',NULL),(51,'Elijah','Elijah265@gmail.com',53,'Italy',NULL),(52,'Jaylynn','Jaylynn350@gmail.com',40,'Afghanistan',NULL),(53,'Marin','Marin565@gmail.com',45,'Peru',NULL),(54,'Leila','Leila837@gmail.com',69,'Martinique',NULL),(55,'Seth','Seth205@gmail.com',45,'Djibouti',NULL),(56,'Julia','Julia310@gmail.com',49,'Falkland',NULL),(57,'Karly','Karly214@gmail.com',63,'Falkland',NULL),(58,'Elianna','Elianna767@gmail.com',42,'Niger',NULL),(59,'Hassan','Hassan669@gmail.com',27,'China',NULL),(60,'Claudia','Claudia867@gmail.com',43,'Grenada',NULL),(61,'Shirley','Shirley895@gmail.com',68,'Burundi',NULL),(62,'Anika','Anika869@gmail.com',24,'New',NULL),(63,'Abram','Abram133@gmail.com',55,'Georgia',NULL),(64,'Harold','Harold273@gmail.com',44,'Malaysia',NULL),(65,'Simon','Simon185@gmail.com',50,'Kiribati',NULL),(66,'Taniya','Taniya403@gmail.com',31,'Faroe',NULL),(67,'Emma','Emma528@gmail.com',49,'Kazakhstan',NULL),(68,'Sean','Sean107@gmail.com',55,'Germany',NULL),(69,'Miley','Miley438@gmail.com',56,'Peru',NULL),(70,'Rose','Rose493@gmail.com',47,'Korea,',NULL),(71,'Guadalupe','Guadalupe671@gmail.com',60,'Macao',NULL),(72,'Jaylee','Jaylee711@gmail.com',68,'Niger',NULL),(73,'Zachariah','Zachariah692@gmail.com',48,'Antigua',NULL),(74,'Abel','Abel262@gmail.com',67,'Mexico',NULL),(75,'Orlando','Orlando483@gmail.com',59,'Cayman',NULL),(76,'Sterling','Sterling721@gmail.com',56,'Kuwait',NULL),(77,'Esther','Esther260@gmail.com',27,'Ecuador',NULL),(78,'Aaron','Aaron503@gmail.com',48,'Monaco',NULL),(79,'Salma','Salma878@gmail.com',64,'Saint',NULL),(80,'Emanuel','Emanuel640@gmail.com',66,'Eritrea',NULL),(81,'Ayden','Ayden584@gmail.com',43,'American',NULL),(82,'Cameron','Cameron243@gmail.com',50,'Kyrgyzstan',NULL),(83,'Jaxon','Jaxon790@gmail.com',55,'Saint',NULL),(84,'Chaya','Chaya247@gmail.com',35,'Afghanistan',NULL),(85,'Sofia','Sofia955@gmail.com',25,'Libyan',NULL),(86,'Lina','Lina12@gmail.com',35,'Greenland',NULL),(87,'Simone','Simone418@gmail.com',31,'El',NULL),(88,'Jaqueline','Jaqueline338@gmail.com',36,'Mali',NULL),(89,'Malik','Malik686@gmail.com',36,'Pakistan',NULL),(90,'Charity','Charity672@gmail.com',33,'Belize',NULL),(91,'Jazmyn','Jazmyn946@gmail.com',41,'Saint',NULL),(92,'Landyn','Landyn795@gmail.com',40,'Lithuania',NULL),(93,'Carina','Carina202@gmail.com',36,'Cook',NULL),(94,'Charlotte','Charlotte248@gmail.com',20,'Indonesia',NULL),(95,'Nina','Nina722@gmail.com',45,'Montserrat',NULL),(96,'Roman','Roman120@gmail.com',61,'Croatia',NULL),(97,'Marques','Marques689@gmail.com',20,'Antigua',NULL),(98,'Vivian','Vivian721@gmail.com',69,'Japan',NULL),(99,'Meghan','Meghan166@gmail.com',40,'Egypt',NULL),(100,'Lillian','Lillian533@gmail.com',40,'Belgium',NULL),(101,'Kaden','Kaden215@gmail.com',48,'Afghanistan',NULL),(102,'Jane','Jane696@gmail.com',54,'Puerto',NULL),(103,'Karli','Karli592@gmail.com',57,'Myanmar',NULL),(104,'Emely','Emely240@gmail.com',44,'Antarctica',NULL),(105,'Noel','Noel714@gmail.com',43,'Cambodia',NULL),(106,'Kristopher','Kristopher841@gmail.com',41,'Honduras',NULL),(107,'Zachariah','Zachariah539@gmail.com',43,'Australia',NULL),(108,'Dylan','Dylan330@gmail.com',56,'El',NULL),(109,'Kelvin','Kelvin657@gmail.com',59,'Isle',NULL),(110,'Alicia','Alicia770@gmail.com',51,'Mongolia',NULL),(111,'Mateo','Mateo271@gmail.com',32,'Burkina',NULL),(112,'Madeline','Madeline989@gmail.com',61,'Belarus',NULL),(113,'Garrett','Garrett538@gmail.com',26,'Mayotte',NULL),(114,'Deon','Deon208@gmail.com',29,'Indonesia',NULL),(115,'Johnathon','Johnathon411@gmail.com',66,'Guinea',NULL),(116,'Cedric','Cedric928@gmail.com',27,'Greece',NULL),(117,'Mckayla','Mckayla700@gmail.com',59,'Brunei',NULL),(118,'Nadia','Nadia537@gmail.com',25,'Dominica',NULL),(119,'Hannah','Hannah714@gmail.com',54,'Mauritania',NULL),(120,'Zackary','Zackary17@gmail.com',42,'Bermuda',NULL);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_level`
--

DROP TABLE IF EXISTS `user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_level` (
  `id_user_level` int unsigned NOT NULL AUTO_INCREMENT,
  `id_score` int unsigned DEFAULT NULL,
  `id_user_info` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_user_level`),
  KEY `id_score_idx` (`id_score`),
  KEY `id_user_info_idx` (`id_user_info`),
  CONSTRAINT `id_score` FOREIGN KEY (`id_score`) REFERENCES `score` (`id_score`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_user_info` FOREIGN KEY (`id_user_info`) REFERENCES `user_info` (`id_user_info`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rumbleoftheforest'
--

--
-- Dumping routines for database 'rumbleoftheforest'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_mail`(in user varchar(45))
begin
	select mail
    from user_info
    where user = name;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_stats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stats`(in user varchar(45))
begin
	select 	total_score,
			deaths,
            accuracy
	from user_info ui
    inner join statistics st on ui.id_user_info = st.id_statistics
    inner join score sc on ui.id_user_info = sc.id_score
    where name = user;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `damage_compare`
--

/*!50001 DROP VIEW IF EXISTS `damage_compare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `damage_compare` AS select `ui`.`name` AS `name`,`sc`.`damage_taken` AS `damage_taken`,`sc`.`damage_inflicted` AS `damage_inflicted` from (`score` `sc` join `user_info` `ui` on((`ui`.`id_user_info` = `sc`.`id_score`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `notes_stats`
--

/*!50001 DROP VIEW IF EXISTS `notes_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `notes_stats` AS select `ui`.`name` AS `name`,(((coalesce(`sn`.`num_notes_perfect`) + coalesce(`sn`.`num_notes_good`)) + coalesce(`sn`.`num_notes_hit`)) + coalesce(`sn`.`num_notes_missed`)) AS `total_notes`,((coalesce(`sn`.`num_notes_perfect`) * 100) / (((coalesce(`sn`.`num_notes_perfect`) + coalesce(`sn`.`num_notes_good`)) + coalesce(`sn`.`num_notes_hit`)) + coalesce(`sn`.`num_notes_missed`))) AS `perfect_percentage`,((coalesce(`sn`.`num_notes_good`) * 100) / (((coalesce(`sn`.`num_notes_perfect`) + coalesce(`sn`.`num_notes_good`)) + coalesce(`sn`.`num_notes_hit`)) + coalesce(`sn`.`num_notes_missed`))) AS `good_percentage`,((coalesce(`sn`.`num_notes_hit`) * 100) / (((coalesce(`sn`.`num_notes_perfect`) + coalesce(`sn`.`num_notes_good`)) + coalesce(`sn`.`num_notes_hit`)) + coalesce(`sn`.`num_notes_missed`))) AS `hit_percentage`,((coalesce(`sn`.`num_notes_missed`) * 100) / (((coalesce(`sn`.`num_notes_perfect`) + coalesce(`sn`.`num_notes_good`)) + coalesce(`sn`.`num_notes_hit`)) + coalesce(`sn`.`num_notes_missed`))) AS `missed_percentage` from (`user_info` `ui` join `score_notes` `sn` on((`ui`.`id_user_info` = `sn`.`id_score_notes`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_ages`
--

/*!50001 DROP VIEW IF EXISTS `top_ages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_ages` AS select `user_info`.`age` AS `age`,count(`user_info`.`age`) AS `num_age` from `user_info` group by `user_info`.`age` order by `num_age` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_high_scores`
--

/*!50001 DROP VIEW IF EXISTS `top_high_scores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_high_scores` AS select `ui`.`name` AS `name`,`s`.`total_score` AS `total_score`,`ui`.`age` AS `age`,`st`.`accuracy` AS `accuracy`,`st`.`game_time` AS `game_time` from ((`score` `s` join `user_info` `ui` on((`s`.`id_score` = `ui`.`id_user_info`))) join `statistics` `st` on((`st`.`id_statistics` = `s`.`id_score`))) order by `s`.`total_score` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05  7:49:46
