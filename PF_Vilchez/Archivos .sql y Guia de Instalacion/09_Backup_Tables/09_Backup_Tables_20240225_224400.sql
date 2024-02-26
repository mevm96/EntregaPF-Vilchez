CREATE DATABASE  IF NOT EXISTS `pf_vilchez` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pf_vilchez`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: pf_vilchez
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
-- Temporary view structure for view `album_genre_association`
--

DROP TABLE IF EXISTS `album_genre_association`;
/*!50001 DROP VIEW IF EXISTS `album_genre_association`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `album_genre_association` AS SELECT 
 1 AS `album_id`,
 1 AS `title`,
 1 AS `genre_ids`,
 1 AS `music_genres`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `artist_details`
--

DROP TABLE IF EXISTS `artist_details`;
/*!50001 DROP VIEW IF EXISTS `artist_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `artist_details` AS SELECT 
 1 AS `artist_id`,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Temporary view structure for view `charlixcx_carolinepolachek_collabs`
--

DROP TABLE IF EXISTS `charlixcx_carolinepolachek_collabs`;
/*!50001 DROP VIEW IF EXISTS `charlixcx_carolinepolachek_collabs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `charlixcx_carolinepolachek_collabs` AS SELECT 
 1 AS `artist_id`,
 1 AS `artistic_name`,
 1 AS `song_titles`,
 1 AS `collaboration_count`*/;
SET character_set_client = @saved_cs_client;

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
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `pd_id` int NOT NULL AUTO_INCREMENT,
  `pd_name` varchar(25) DEFAULT NULL,
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
-- Temporary view structure for view `record_label_artist_details`
--

DROP TABLE IF EXISTS `record_label_artist_details`;
/*!50001 DROP VIEW IF EXISTS `record_label_artist_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `record_label_artist_details` AS SELECT 
 1 AS `artistic_name`,
 1 AS `rl_name`*/;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Temporary view structure for view `top_producers`
--

DROP TABLE IF EXISTS `top_producers`;
/*!50001 DROP VIEW IF EXISTS `top_producers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_producers` AS SELECT 
 1 AS `pd_name`,
 1 AS `total_songs_produced`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `album_genre_association`
--

/*!50001 DROP VIEW IF EXISTS `album_genre_association`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `album_genre_association` AS select `a`.`album_id` AS `album_id`,max(`a`.`title`) AS `title`,group_concat(`ag`.`genre_id` separator ',') AS `genre_ids`,group_concat(`g`.`music_genre` separator ',') AS `music_genres` from ((`album_genre` `ag` join `album` `a` on((`ag`.`album_id` = `a`.`album_id`))) join `genre` `g` on((`ag`.`genre_id` = `g`.`genre_id`))) group by `a`.`album_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `artist_details` AS select `artist`.`artist_id` AS `artist_id`,`artist`.`artistic_name` AS `artistic_name`,`artist`.`first_name` AS `first_name`,`artist`.`last_name` AS `last_name`,`artist`.`phone` AS `phone` from `artist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `charlixcx_carolinepolachek_collabs`
--

/*!50001 DROP VIEW IF EXISTS `charlixcx_carolinepolachek_collabs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `charlixcx_carolinepolachek_collabs` AS select `a`.`artist_id` AS `artist_id`,`a`.`artistic_name` AS `artistic_name`,group_concat(`s`.`title` separator ',') AS `song_titles`,count(`f`.`song_id`) AS `collaboration_count` from ((`artist` `a` join `featuring` `f` on((`a`.`artist_id` = `f`.`artist_id`))) join `song` `s` on((`f`.`song_id` = `s`.`song_id`))) where ((`f`.`release_date` is not null) and (`a`.`artist_id` in (12,15,16,26,27,28,29))) group by `a`.`artist_id` */;
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
/*!50001 VIEW `record_label_artist_details` AS select `a`.`artistic_name` AS `artistic_name`,`rl`.`rl_name` AS `rl_name` from ((`artist` `a` left join `record_label_artist` `rla` on((`a`.`artist_id` = `rla`.`artist_id`))) left join `record_label` `rl` on((`rla`.`rl_id` = `rl`.`rl_id`))) order by `rl`.`rl_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_producers`
--

/*!50001 DROP VIEW IF EXISTS `top_producers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_producers` AS select `p`.`pd_name` AS `pd_name`,count(`sp`.`song_id`) AS `total_songs_produced` from (`producer` `p` left join `song_producer` `sp` on((`p`.`pd_id` = `sp`.`pd_id`))) group by `p`.`pd_name` */;
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

-- Dump completed on 2024-02-25 22:46:33
