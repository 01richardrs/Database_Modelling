-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nfadb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coach` (
  `Coach_ID` int(11) NOT NULL,
  `Coach_FName` varchar(45) DEFAULT NULL,
  `Coach_LName` varchar(45) DEFAULT NULL,
  `Coach_Phone` varchar(45) DEFAULT NULL,
  `TEAM_Team_ID` int(11) NOT NULL,
  PRIMARY KEY (`Coach_ID`),
  KEY `fk_COACH_TEAM1_idx` (`TEAM_Team_ID`),
  CONSTRAINT `fk_COACH_TEAM1` FOREIGN KEY (`TEAM_Team_ID`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parent` (
  `Parent_ID` int(11) NOT NULL,
  `Parent_LName` varchar(45) DEFAULT NULL,
  `Parent_FName` varchar(45) DEFAULT NULL,
  `Parent_Phone` varchar(45) DEFAULT NULL,
  `Parent_Street` varchar(45) DEFAULT NULL,
  `Parent_City` varchar(45) DEFAULT NULL,
  `Parent_State` varchar(45) DEFAULT NULL,
  `Parent_Zip` int(11) DEFAULT NULL,
  PRIMARY KEY (`Parent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_has_player`
--

DROP TABLE IF EXISTS `parent_has_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parent_has_player` (
  `PARENT_Parent_ID` int(11) NOT NULL,
  `PLAYER_Player_ID` int(11) NOT NULL,
  PRIMARY KEY (`PARENT_Parent_ID`,`PLAYER_Player_ID`),
  KEY `fk_PARENT_has_PLAYER_PLAYER1_idx` (`PLAYER_Player_ID`),
  KEY `fk_PARENT_has_PLAYER_PARENT_idx` (`PARENT_Parent_ID`),
  CONSTRAINT `fk_PARENT_has_PLAYER_PARENT` FOREIGN KEY (`PARENT_Parent_ID`) REFERENCES `parent` (`parent_id`),
  CONSTRAINT `fk_PARENT_has_PLAYER_PLAYER1` FOREIGN KEY (`PLAYER_Player_ID`) REFERENCES `player` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_has_player`
--

LOCK TABLES `parent_has_player` WRITE;
/*!40000 ALTER TABLE `parent_has_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent_has_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player` (
  `Player_ID` int(11) NOT NULL,
  `Player_FName` varchar(45) DEFAULT NULL,
  `Player_LName` varchar(45) DEFAULT NULL,
  `Player_Age` int(11) DEFAULT NULL,
  `TEAM_Team_ID` int(11) NOT NULL,
  PRIMARY KEY (`Player_ID`),
  KEY `fk_PLAYER_TEAM1_idx` (`TEAM_Team_ID`),
  CONSTRAINT `fk_PLAYER_TEAM1` FOREIGN KEY (`TEAM_Team_ID`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `Team_ID` int(11) NOT NULL,
  `Team_Name` varchar(45) DEFAULT NULL,
  `Team_Colors` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-23  9:35:11
