-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ch_pf_vilchez
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(40) DEFAULT NULL,
  `sales` int DEFAULT NULL,
  `release_year` year DEFAULT NULL,
  `album_length` time DEFAULT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'La fiesta del rey drama',3459,2016,'00:36:41'),(2,'Moodswings In To Order',6007,2022,'00:23:11'),(3,'the record',53000,2023,'00:42:18'),(4,'Jubilee',8000,2021,'00:37:03'),(5,'The land is inhospitable and so are we',4200,2023,'00:32:22'),(6,'evermore',1700000,2021,'01:09:00'),(7,'Minor',3500,2020,'00:20:12'),(8,'All My Demons Greeting Me As a Friend',100000,2016,'01:04:00'),(9,'Caribe Caribe',5000,2023,'00:52:54'),(10,'Flip That',130840,2022,'00:17:11'),(11,'INVU',308315,2022,'00:42:26'),(12,'True Romance',12000,2013,'00:47:06'),(13,'KICK ii',8940,2021,'00:34:01'),(14,'Funhouse',6000000,2008,'00:48:38'),(15,'PANG',23000,2019,'00:46:37'),(16,'Moodswings In This Order',15999,2021,'00:23:11'),(17,'Historian',501000,2018,'00:00:00');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_artist`
--

DROP TABLE IF EXISTS `album_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_artist` (
  `album_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`album_id`,`artist_id`),
  KEY `fk_aa_artist` (`artist_id`),
  CONSTRAINT `fk_aa_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `fk_aa_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_artist`
--

LOCK TABLES `album_artist` WRITE;
/*!40000 ALTER TABLE `album_artist` DISABLE KEYS */;
INSERT INTO `album_artist` VALUES (1,1),(2,2),(16,2),(3,3),(4,4),(5,5),(6,6),(7,7),(9,8),(10,9),(8,10),(11,11),(12,12),(13,13),(14,14),(15,15);
/*!40000 ALTER TABLE `album_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_audit_log`
--

DROP TABLE IF EXISTS `album_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_audit_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `table_nombre` varchar(50) DEFAULT NULL,
  `action_type` varchar(10) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `action_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_audit_log`
--

LOCK TABLES `album_audit_log` WRITE;
/*!40000 ALTER TABLE `album_audit_log` DISABLE KEYS */;
INSERT INTO `album_audit_log` VALUES (1,'album','INSERT','root@localhost',0,'2024-01-17 01:17:23');
/*!40000 ALTER TABLE `album_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_genre`
--

DROP TABLE IF EXISTS `album_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_genre` (
  `album_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`album_id`,`genre_id`),
  KEY `fk_ag_genre` (`genre_id`),
  CONSTRAINT `fk_ag_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `fk_ag_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_genre`
--

LOCK TABLES `album_genre` WRITE;
/*!40000 ALTER TABLE `album_genre` DISABLE KEYS */;
INSERT INTO `album_genre` VALUES (1,1),(2,1),(14,1),(1,2),(4,2),(1,3),(2,4),(16,5),(3,6),(6,6),(3,7),(9,7),(4,8),(4,9),(5,10),(5,11),(6,12),(7,13),(8,14),(12,15),(13,16),(15,17),(11,18),(10,19);
/*!40000 ALTER TABLE `album_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_producer`
--

DROP TABLE IF EXISTS `album_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_producer` (
  `album_id` int NOT NULL,
  `pd_id` int NOT NULL,
  PRIMARY KEY (`album_id`,`pd_id`),
  KEY `fk_ap_pd` (`pd_id`),
  CONSTRAINT `fk_ap_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `fk_ap_pd` FOREIGN KEY (`pd_id`) REFERENCES `producer` (`pd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_producer`
--

LOCK TABLES `album_producer` WRITE;
/*!40000 ALTER TABLE `album_producer` DISABLE KEYS */;
INSERT INTO `album_producer` VALUES (4,1),(1,2),(2,3),(16,3),(3,4),(5,8),(6,9),(7,10),(8,11),(12,12),(13,13),(9,14),(14,15),(15,16),(11,17),(10,18);
/*!40000 ALTER TABLE `album_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_song`
--

DROP TABLE IF EXISTS `album_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_song` (
  `album_id` int NOT NULL,
  `song_id` int NOT NULL,
  PRIMARY KEY (`album_id`,`song_id`),
  KEY `fk_as_song` (`song_id`),
  CONSTRAINT `fk_as_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `fk_as_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_song`
--

LOCK TABLES `album_song` WRITE;
/*!40000 ALTER TABLE `album_song` DISABLE KEYS */;
INSERT INTO `album_song` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(16,6),(3,7),(3,8),(3,9),(4,10),(4,11),(4,12),(5,13),(5,14),(5,15),(6,16),(6,17),(7,18),(8,19),(12,20),(13,21),(9,22),(14,23),(15,24),(11,25),(10,26);
/*!40000 ALTER TABLE `album_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `artistic_name` varchar(25) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Americania','Italo','Pizzolante','+584143678861'),(2,'DPR IAN','Christian','Yu','+442019234567'),(3,'boygenius','Lucy','Dacus','+19012610018'),(4,'Japanese Breakfast','Michelle','Zauner','+442903198908'),(5,'Mistki','Mitski','Miyawaki','+14327557123'),(6,'Taylor Swift','Taylor','Swift','+18006982536'),(7,'Gracie Abrams','Gracie','Abrams','+18006982536'),(8,'La Vida Boheme','Rafael','Perez','+19108765436'),(9,'LOONA','Wong','Kahei','+19108701436'),(10,'Aurora','Aurora','Aksnes','+12120557143'),(11,'Taeyeon','Taeyeon','Kim','+441989030907'),(12,'Charli XCX','Charlotte','Aitchison','+19922062011'),(13,'ARCA','Alejandra','Ghersi','+13101304997'),(14,'Pink','Alecia','Moore','+19184567893'),(15,'Caroline Polachek','Caroline','Polachek','+17252285100'),(16,'Rina Sawayama','Rina','Sawayama','+441430950680'),(17,'Nate Ruess','Nathaniel','Ruess','+13649973311'),(18,'The Nationals','Aaron','Dessner','+9113458901'),(19,'Safety Trance','Luis','Valdeon','+12021235432'),(20,'DPR Live','Dabin','Hong','+823277699100'),(21,'Lana Del Rey','Elizabeth','Grant','+12347594398'),(22,'Phoebe Bridgers','Phoebe','Bridgers','+17704321377'),(23,'Tom Odell','Thomas','Odell','+447859151875'),(24,'Pomme','Claire','Geo','+33486656897'),(25,'Tiffany Young','Stephanie','Hwang','+13207237264'),(26,'Christine and the Queens','Heloise','Letissier','+33937934358'),(27,'Sam Smith','Samuel','Smith','+447965174429'),(28,'Tiesto','Tijs','Verwest','+31387230884'),(29,'Saweetie','Diamonte','Valentin','+17343498060'),(30,'Lucy Dacus','Lucy','Dacus','+1234567890'),(31,'Chappell Roan','Kayleigh','Amstutz','+11902199802');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `artist_details`
--

DROP TABLE IF EXISTS `artist_details`;
/*!50001 DROP VIEW IF EXISTS `artist_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `artist_details` AS SELECT 
 1 AS `artistic_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `phone`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `artists_audit_log`
--

DROP TABLE IF EXISTS `artists_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_audit_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `table_nombre` varchar(50) DEFAULT NULL,
  `action_type` varchar(10) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `action_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_audit_log`
--

LOCK TABLES `artists_audit_log` WRITE;
/*!40000 ALTER TABLE `artists_audit_log` DISABLE KEYS */;
INSERT INTO `artists_audit_log` VALUES (1,'artist','INSERT','root@localhost',31,'2024-01-17 00:42:31'),(2,'artist','INSERT','root@localhost',32,'2024-01-17 00:45:49'),(3,'artist','DELETE','root@localhost',32,'2024-01-17 00:46:39'),(4,'artist','UPDATE','root@localhost',30,'2024-01-17 00:51:44'),(5,'artist','INSERT','root@localhost',33,'2024-01-25 01:12:55'),(6,'artist','INSERT','root@localhost',34,'2024-01-25 01:12:58'),(7,'artist','INSERT','root@localhost',35,'2024-01-25 01:13:01'),(8,'artist','DELETE','root@localhost',33,'2024-01-25 01:18:27'),(9,'artist','DELETE','root@localhost',34,'2024-01-25 01:18:39'),(10,'artist','DELETE','root@localhost',35,'2024-01-25 01:18:42'),(11,'artist','UPDATE','root@localhost',1,'2024-01-25 01:21:47'),(12,'artist','UPDATE','root@localhost',2,'2024-01-25 01:21:47'),(13,'artist','UPDATE','root@localhost',3,'2024-01-25 01:21:47'),(14,'artist','UPDATE','root@localhost',4,'2024-01-25 01:21:47'),(15,'artist','UPDATE','root@localhost',5,'2024-01-25 01:21:47'),(16,'artist','UPDATE','root@localhost',6,'2024-01-25 01:21:47'),(17,'artist','UPDATE','root@localhost',7,'2024-01-25 01:21:47'),(18,'artist','UPDATE','root@localhost',8,'2024-01-25 01:21:47'),(19,'artist','UPDATE','root@localhost',9,'2024-01-25 01:21:47'),(20,'artist','UPDATE','root@localhost',10,'2024-01-25 01:21:47'),(21,'artist','UPDATE','root@localhost',11,'2024-01-25 01:21:47'),(22,'artist','UPDATE','root@localhost',12,'2024-01-25 01:21:47'),(23,'artist','UPDATE','root@localhost',13,'2024-01-25 01:21:47'),(24,'artist','UPDATE','root@localhost',14,'2024-01-25 01:21:47'),(25,'artist','UPDATE','root@localhost',15,'2024-01-25 01:21:47'),(26,'artist','UPDATE','root@localhost',16,'2024-01-25 01:21:47'),(27,'artist','UPDATE','root@localhost',17,'2024-01-25 01:21:47'),(28,'artist','UPDATE','root@localhost',18,'2024-01-25 01:21:47'),(29,'artist','UPDATE','root@localhost',19,'2024-01-25 01:21:47'),(30,'artist','UPDATE','root@localhost',20,'2024-01-25 01:21:47'),(31,'artist','UPDATE','root@localhost',21,'2024-01-25 01:21:47'),(32,'artist','UPDATE','root@localhost',22,'2024-01-25 01:21:47'),(33,'artist','UPDATE','root@localhost',23,'2024-01-25 01:21:47'),(34,'artist','UPDATE','root@localhost',24,'2024-01-25 01:21:47'),(35,'artist','UPDATE','root@localhost',25,'2024-01-25 01:21:47'),(36,'artist','UPDATE','root@localhost',26,'2024-01-25 01:21:47'),(37,'artist','UPDATE','root@localhost',27,'2024-01-25 01:21:47'),(38,'artist','UPDATE','root@localhost',28,'2024-01-25 01:21:47'),(39,'artist','UPDATE','root@localhost',29,'2024-01-25 01:21:47'),(40,'artist','UPDATE','root@localhost',30,'2024-01-25 01:21:47'),(41,'artist','UPDATE','root@localhost',1,'2024-01-25 01:23:26'),(42,'artist','UPDATE','root@localhost',2,'2024-01-25 01:23:26'),(43,'artist','UPDATE','root@localhost',3,'2024-01-25 01:23:26'),(44,'artist','UPDATE','root@localhost',4,'2024-01-25 01:23:26'),(45,'artist','UPDATE','root@localhost',5,'2024-01-25 01:23:26'),(46,'artist','UPDATE','root@localhost',6,'2024-01-25 01:23:26'),(47,'artist','UPDATE','root@localhost',7,'2024-01-25 01:23:26'),(48,'artist','UPDATE','root@localhost',8,'2024-01-25 01:23:26'),(49,'artist','UPDATE','root@localhost',9,'2024-01-25 01:23:26'),(50,'artist','UPDATE','root@localhost',10,'2024-01-25 01:23:26'),(51,'artist','UPDATE','root@localhost',11,'2024-01-25 01:23:26'),(52,'artist','UPDATE','root@localhost',12,'2024-01-25 01:23:26'),(53,'artist','UPDATE','root@localhost',13,'2024-01-25 01:23:26'),(54,'artist','UPDATE','root@localhost',14,'2024-01-25 01:23:26'),(55,'artist','UPDATE','root@localhost',15,'2024-01-25 01:23:26'),(56,'artist','UPDATE','root@localhost',16,'2024-01-25 01:23:26'),(57,'artist','UPDATE','root@localhost',17,'2024-01-25 01:23:26'),(58,'artist','UPDATE','root@localhost',18,'2024-01-25 01:23:26'),(59,'artist','UPDATE','root@localhost',19,'2024-01-25 01:23:26'),(60,'artist','UPDATE','root@localhost',20,'2024-01-25 01:23:26'),(61,'artist','UPDATE','root@localhost',21,'2024-01-25 01:23:26'),(62,'artist','UPDATE','root@localhost',22,'2024-01-25 01:23:26'),(63,'artist','UPDATE','root@localhost',23,'2024-01-25 01:23:26'),(64,'artist','UPDATE','root@localhost',24,'2024-01-25 01:23:26'),(65,'artist','UPDATE','root@localhost',25,'2024-01-25 01:23:26'),(66,'artist','UPDATE','root@localhost',26,'2024-01-25 01:23:26'),(67,'artist','UPDATE','root@localhost',27,'2024-01-25 01:23:26'),(68,'artist','UPDATE','root@localhost',28,'2024-01-25 01:23:26'),(69,'artist','UPDATE','root@localhost',29,'2024-01-25 01:23:26'),(70,'artist','UPDATE','root@localhost',30,'2024-01-25 01:23:26'),(74,'artist','INSERT','root@localhost',31,'2024-01-25 02:06:37'),(76,'artist','INSERT','root@localhost',33,'2024-01-25 02:11:03'),(77,'artist','INSERT','root@localhost',32,'2024-01-25 02:11:21'),(78,'artist','DELETE','root@localhost',32,'2024-01-25 02:11:48'),(79,'artist','DELETE','root@localhost',33,'2024-01-25 02:11:48');
/*!40000 ALTER TABLE `artists_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(30) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `rl_id` int NOT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `branch_name` (`branch_name`),
  KEY `rl_id` (`rl_id`),
  CONSTRAINT `fk_rl` FOREIGN KEY (`rl_id`) REFERENCES `record_label` (`rl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Atlantic Records Group LLC','USA',6),(2,'Interscope','USA',2),(3,'Decca Group','UK',2),(4,'Chop Shop Records','USA',6),(5,'Galactic Records','UK',5),(6,'Asylum Records','USA',6),(7,'Mercury Records','US',6),(8,'Young','UK',8),(9,'X5 Music Group','Sweden',6),(10,'AshesToFlame Records','India',10),(11,'SM True','Thailand',11),(12,'FNC Entertainment','South Korea',6),(13,'Spinnin Records','Netherlands',6),(14,'Woollim Entertainment','South Korea',11),(15,'Bluebird Records','US',15);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuitor`
--

DROP TABLE IF EXISTS `distribuitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuitor` (
  `dist_id` int NOT NULL AUTO_INCREMENT,
  `dist_name` varchar(25) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`dist_id`),
  UNIQUE KEY `dist_name` (`dist_name`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `fk_dist_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuitor`
--

LOCK TABLES `distribuitor` WRITE;
/*!40000 ALTER TABLE `distribuitor` DISABLE KEYS */;
INSERT INTO `distribuitor` VALUES (1,'Independent','Venezuela',1),(2,'DPR','South Korea',2),(3,'Interscope Geffen A and M','USA',3),(4,'Secretly Distribution','USA',4),(5,'Secretly Group','USA',5),(6,'Island EMI','UK',6),(7,'Polydor','UK',7),(8,'Decca Music Group','UK',8),(9,'Warner Chappell Mexico','Mexico',9),(10,'WM Korea','South Korea',10),(11,'SM Entertainment','South Korea',11),(12,'Atlantic Records Group','UK',12),(13,'BEGGARS Group','UK',13),(14,'Legacy Recordings','USA',14),(15,'Perpetual Novice','USA',15);
/*!40000 ALTER TABLE `distribuitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featuring`
--

DROP TABLE IF EXISTS `featuring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featuring` (
  `artist_id` int NOT NULL,
  `song_id` int NOT NULL,
  `release_date` year DEFAULT NULL,
  PRIMARY KEY (`artist_id`,`song_id`),
  KEY `fk_ft_song` (`song_id`),
  CONSTRAINT `fk_ft_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  CONSTRAINT `fk_ft_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featuring`
--

LOCK TABLES `featuring` WRITE;
/*!40000 ALTER TABLE `featuring` DISABLE KEYS */;
INSERT INTO `featuring` VALUES (2,32,2021),(2,33,2023),(2,34,2021),(6,30,2023),(10,35,2023),(10,36,2022),(11,37,2010),(12,27,2023),(12,28,2022),(12,39,2023),(12,40,2022),(12,41,2021),(13,31,2022),(14,29,2012),(15,27,2023),(15,38,2020),(16,28,2022),(17,29,2012),(18,30,2023),(19,31,2022),(20,32,2021),(21,33,2023),(22,34,2021),(23,35,2023),(24,36,2022),(25,37,2010),(26,38,2020),(27,39,2023),(28,40,2022),(29,41,2021);
/*!40000 ALTER TABLE `featuring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `music_genre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'pop rock'),(2,'indie pop'),(3,'new wave'),(4,'disco'),(5,'alternative RnB'),(6,'indie folk'),(7,'indie rock'),(8,'chamber pop'),(9,'dream pop'),(10,'folk'),(11,'americana'),(12,'folk pop'),(13,'ballad pop'),(14,'folktronica'),(15,'synth pop'),(16,'experimental'),(17,'avant pop'),(18,'pop'),(19,'dance');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `pd_id` int NOT NULL AUTO_INCREMENT,
  `producer_name` varchar(25) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` enum('F','M') DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `nationality` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'C Hundreds','Craig','Hendrix','+14109559707','M','1980-12-12','American'),(2,'Hector Castillo','Hector','Castillo','+6117723478','M','1976-04-17','Venezuelan'),(3,'DPR REM','Scott','Kim','+6879112199','M','1992-02-21','Korean'),(4,'Catherine Marks','Catherine','Marks','+7891020045','F','1989-12-01','Australian'),(5,'Jay Som','Melina','Duterte','+14105467891','F','1994-03-25','American'),(6,'Tudz','Sarah','Tudzin','+5551234567','F','1997-04-13','American'),(7,'Wild Nothing','Jack','Tatum','+5559876543','M','1988-10-06','American'),(8,'Patrick Hyland','Patrick','Hyland','+5555555555','M','1990-12-23','American'),(9,'Aaron Dessner','Aaron','Dessner','+9113458901','M','1976-04-23','American'),(10,'Blake Slatkin','Blake','Slatkin','+4961312460','M','1997-06-10','American'),(11,'Magnus Skylstad','Magnus Aserud','Skylstad','+1236549870','M','1983-06-17','Norwegian'),(12,'BloodPop','Michael','Tucker','+1012343456','M','1990-08-15','American'),(13,'Cardopusher','Luis','Valdeon','+12021235432','M','1981-02-27','Venezuelan'),(14,'Rudy Pagliuca','Rodolfo','Pagliuca','+4143678861','M','1971-09-10','Venezuelan'),(15,'Max Martin','Karl','Martin','+3678861414','M','1971-02-26','Swedish'),(16,'Danny L Harle','Daniel','Eisner','+9001236745','M','1990-11-21','British'),(17,'Nova Blue','Manon','Van Dijk','+8013426785','F','2002-12-22','Dutch'),(18,'Pink Slip','Kyle','Buckley','+9019989796','M','2001-04-08','American'),(19,'George Daniel','George','Daniel','+32482886728','M','1990-03-23','Belgian'),(20,'Digital Farm Animals','Nick','Gale','+441824392053','M','1989-07-02','British'),(21,'Jeff Bhasker','Jeff','Bhasker','12818816777','M','1974-04-03','American'),(23,'Jack Antonoff','Jack','Antonoff','+14488466661','M','1984-03-31','American'),(24,'Cityfall','Laurie','Blundell','+448439327853','F','1996-10-25','British'),(25,'E Tribe','Youngdeuk','Kim','+825313581805','M','1985-05-30','Korean'),(26,'Christine and the Queens','Heloise','Letissier','+33937934358','M','1988-01-05','French'),(27,'A G Cook','Alexander','Cook','+445669406905','M','1990-08-23','British'),(28,'Tiesto','Tijs','Verwest','+31387230884','M','1969-01-17','Dutch'),(29,'Jax Jones','Timucin','Lam','+445600201689','M','1987-07-25','British');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_label`
--

DROP TABLE IF EXISTS `record_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_label` (
  `rl_id` int NOT NULL AUTO_INCREMENT,
  `rl_name` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`rl_id`),
  UNIQUE KEY `rl_name` (`rl_name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_label`
--

LOCK TABLES `record_label` WRITE;
/*!40000 ALTER TABLE `record_label` DISABLE KEYS */;
INSERT INTO `record_label` VALUES (18,'4AD'),(12,'All Of the Above Nacional Records'),(23,'Because Music'),(14,'BlockBerry Creative'),(24,'Capitol Records'),(19,'Club Romantico'),(3,'Dead Oceans'),(4,'Decca'),(16,'Dirty Hit'),(9,'Double Double Whammy'),(1,'DREAM PERFECT REGIME DPR'),(17,'Fueled by Ramen'),(7,'Independent Artist'),(20,'LOEN Entertainment'),(13,'Matador Records'),(22,'Polydor'),(15,'RCA Records'),(5,'Republic Records'),(21,'Saddest Factory Records'),(11,'SM Entertainment'),(25,'Spinnin Records'),(10,'The Orchard'),(2,'Universal Music Group'),(6,'Warner Music Group'),(8,'XL Recordings');
/*!40000 ALTER TABLE `record_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_label_artist`
--

DROP TABLE IF EXISTS `record_label_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_label_artist` (
  `artist_id` int NOT NULL,
  `rl_id` int NOT NULL,
  PRIMARY KEY (`artist_id`,`rl_id`),
  KEY `fk_rla_rl` (`rl_id`),
  CONSTRAINT `fk_rla_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  CONSTRAINT `fk_rla_rl` FOREIGN KEY (`rl_id`) REFERENCES `record_label` (`rl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_label_artist`
--

LOCK TABLES `record_label_artist` WRITE;
/*!40000 ALTER TABLE `record_label_artist` DISABLE KEYS */;
INSERT INTO `record_label_artist` VALUES (2,1),(7,2),(21,2),(25,2),(4,3),(10,4),(6,5),(12,6),(29,6),(1,7),(23,7),(13,8),(5,9),(15,10),(11,11),(8,12),(3,13),(9,14),(14,15),(16,16),(17,17),(18,18),(19,19),(20,20),(22,21),(24,22),(26,23),(27,24),(28,25);
/*!40000 ALTER TABLE `record_label_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `record_label_artist_details`
--

DROP TABLE IF EXISTS `record_label_artist_details`;
/*!50001 DROP VIEW IF EXISTS `record_label_artist_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `record_label_artist_details` AS SELECT 
 1 AS `artistic_name`,
 1 AS `Music Label`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Emilia','00:03:08'),(2,'Estoy Afuera Sal','00:03:08'),(3,'Cuidame','00:03:44'),(4,'Ballroom Extravaganza','00:03:09'),(5,'Mood','00:03:02'),(6,'Nerves','00:03:15'),(7,'True Blue','00:04:56'),(8,'Not Strong Enough','00:03:54'),(9,'Cool About It','00:03:00'),(10,'Posing for Cars','00:06:38'),(11,'Be Sweet','00:03:40'),(12,'Slide Tackle','00:03:39'),(13,'I Don\'\'t Like My Mind','00:02:25'),(14,'I\'\'m Your Man','00:03:29'),(15,'My Love Mine All Mine','00:02:17'),(16,'Tolerate It','00:04:05'),(17,'Right Where You Left Me','00:04:05'),(18,'I Miss You I\'\'m Sorry','00:02:48'),(19,'Runaway','00:04:08'),(20,'Grins','00:03:52'),(21,'Rakata','00:02:31'),(22,'Aleros Pompeii','00:04:00'),(23,'Sober','00:04:11'),(24,'Door','00:05:22'),(25,'Cold as Hell','00:02:44'),(26,'POSE','00:03:06'),(27,'Welcome to My Island Remix','00:03:22'),(28,'Beg For You','00:02:48'),(29,'Just Give Me a Reason','00:04:02'),(30,'The Alcott','00:04:27'),(31,'El Alma Que Te Trajo','00:02:24'),(32,'Boom','00:03:21'),(33,'Snow on the Beach','00:03:49'),(34,'Nothing New','00:04:18'),(35,'Butterflies','00:02:10'),(36,'Everything Matters','00:03:33'),(37,'Gee','00:03:21'),(38,'La Vita Nuova','00:04:28'),(39,'In The City','00:02:56'),(40,'Hot in It','00:02:09'),(41,'OUT OUT','00:02:42'),(42,'Femininomenon','00:03:39'),(43,'Red Wine Supernova','00:03:12'),(44,'HOT TO GO!','00:03:04'),(45,'Pink Pony Club','00:04:18');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_artist`
--

DROP TABLE IF EXISTS `song_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_artist` (
  `song_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`song_id`,`artist_id`),
  KEY `fk_sa_artist` (`artist_id`),
  CONSTRAINT `fk_sa_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  CONSTRAINT `fk_sa_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_artist`
--

LOCK TABLES `song_artist` WRITE;
/*!40000 ALTER TABLE `song_artist` DISABLE KEYS */;
INSERT INTO `song_artist` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3),(10,4),(11,4),(12,4),(13,5),(14,5),(15,5),(16,6),(17,6),(18,7),(22,8),(26,9),(19,10),(25,11),(20,12),(21,13),(23,14),(24,15),(27,15),(28,16),(29,17),(30,18),(31,19),(32,20),(33,21),(34,22),(35,23),(36,24),(37,25),(38,26),(39,27),(40,28),(41,29);
/*!40000 ALTER TABLE `song_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_genre`
--

DROP TABLE IF EXISTS `song_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_genre` (
  `song_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`song_id`,`genre_id`),
  KEY `fk_sg_genre` (`genre_id`),
  CONSTRAINT `fk_sg_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `fk_sg_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_genre`
--

LOCK TABLES `song_genre` WRITE;
/*!40000 ALTER TABLE `song_genre` DISABLE KEYS */;
INSERT INTO `song_genre` VALUES (1,1),(4,1),(23,1),(2,2),(11,2),(3,3),(5,4),(6,5),(7,6),(9,6),(17,6),(8,7),(22,7),(10,8),(12,9),(13,10),(14,10),(15,11),(16,12),(18,13),(19,14),(20,15),(21,16),(24,17),(25,18),(26,19);
/*!40000 ALTER TABLE `song_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_producer`
--

DROP TABLE IF EXISTS `song_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_producer` (
  `song_id` int NOT NULL,
  `pd_id` int NOT NULL,
  PRIMARY KEY (`song_id`,`pd_id`),
  KEY `fk_sp_pd` (`pd_id`),
  CONSTRAINT `fk_sp_pd` FOREIGN KEY (`pd_id`) REFERENCES `producer` (`pd_id`),
  CONSTRAINT `fk_sp_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_producer`
--

LOCK TABLES `song_producer` WRITE;
/*!40000 ALTER TABLE `song_producer` DISABLE KEYS */;
INSERT INTO `song_producer` VALUES (10,1),(12,1),(1,2),(2,2),(3,2),(4,3),(5,3),(6,3),(32,3),(7,4),(8,5),(9,6),(11,7),(13,8),(14,8),(15,8),(16,9),(17,9),(30,9),(34,9),(18,10),(19,11),(36,11),(20,12),(21,13),(31,13),(22,14),(23,15),(24,16),(25,17),(26,18),(27,19),(28,20),(29,21),(33,23),(35,24),(37,25),(38,26),(39,27),(40,28),(41,29);
/*!40000 ALTER TABLE `song_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `artist_details`
--

/*!50001 DROP VIEW IF EXISTS `artist_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artist_details` AS select `artist`.`artistic_name` AS `artistic_name`,`artist`.`first_name` AS `first_name`,`artist`.`last_name` AS `last_name`,`artist`.`phone` AS `phone` from `artist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `record_label_artist_details`
--

/*!50001 DROP VIEW IF EXISTS `record_label_artist_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `record_label_artist_details` AS select `a`.`artistic_name` AS `artistic_name`,`rl`.`rl_name` AS `Music Label` from ((`artist` `a` left join `record_label_artist` `rla` on((`a`.`artist_id` = `rla`.`artist_id`))) left join `record_label` `rl` on((`rla`.`rl_id` = `rl`.`rl_id`))) order by `rl`.`rl_name` */;
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

-- Dump completed on 2024-01-29 23:02:12
