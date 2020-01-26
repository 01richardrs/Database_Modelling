-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `AU_ID` decimal(7,0) NOT NULL,
  `AU_FNAME` varchar(30) DEFAULT NULL,
  `AU_LNAME` varchar(30) DEFAULT NULL,
  `AU_BIRTHYEAR` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`AU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (185,'Benson','Reeves',1990),(218,'Rachel','Beatney',1983),(229,'Carmine','Salvadore',NULL),(251,'Hugo','Bruer',1972),(262,'Xia','Chiang',NULL),(273,'Reba','Durante',1969),(284,'Trina','Tankersly',1961),(383,'Neal','Walsh',1980),(394,'Robert','Lake',1982),(438,'Perry','Pearson',1986),(460,'Connie','Paulsen',1983),(559,'Rachel','McGill',NULL),(581,'Manish','Aggerwal',1984),(592,'Lawrence','Sheel',1976),(603,'Julia','Palca',1988);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `BOOK_TITLE` varchar(120) DEFAULT NULL,
  `BOOK_YEAR` decimal(4,0) DEFAULT NULL,
  `BOOK_COST` decimal(8,2) DEFAULT NULL,
  `BOOK_SUBJECT` varchar(120) DEFAULT NULL,
  `PAT_ID` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`BOOK_NUM`),
  KEY `fk_book_patron1_idx` (`PAT_ID`),
  CONSTRAINT `fk_book_patron1` FOREIGN KEY (`PAT_ID`) REFERENCES `patron` (`pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (5235,'Beginner\'s Guide to JAVA',2014,59.95,'Programming',NULL),(5236,'Database in the Cloud',2014,79.95,'Cloud',NULL),(5237,'Mastering the database environment',2015,89.95,'Database',NULL),(5238,'Conceptual Programming',2015,59.95,'Programming',1229),(5239,'J++ in Mobile Apps',2015,49.95,'Programming',NULL),(5240,'iOS Programming',2015,79.95,'Programming',1212),(5241,'JAVA First Steps',2015,49.95,'Programming',NULL),(5242,'C# in Middleware Deployment',2015,59.95,'Middleware',1228),(5243,'DATABASES in Theory',2015,129.95,'Database',NULL),(5244,'Cloud-based Mobile Applications',2015,69.95,'Cloud',NULL),(5245,'The Golden Road to Platform independence',2016,119.95,'Middleware',NULL),(5246,'Capture the Cloud',2016,69.95,'Cloud',1172),(5247,'Shining Through the Cloud: Sun Programming',2016,109.95,'Programming',NULL),(5248,'What You Always Wanted to Know About Database, But Were Afraid to Ask',2016,49.95,'Database',NULL),(5249,'Starlight Applications',2016,69.95,'Cloud',1207),(5250,'Reengineering the Middle Tier',2016,89.95,'Middleware',NULL),(5251,'Thoughts on Revitalizing Ruby',2016,59.95,'Programming',NULL),(5252,'Beyond the Database Veil',2016,69.95,'Database',1229),(5253,'Virtual Programming for Virtual Environments',2016,79.95,'Programming',NULL),(5254,'Coding Style for Maintenance',2017,49.95,'Programming',NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `checkout` (
  `CHECK_NUM` decimal(15,0) NOT NULL,
  `CHECK_OUT_DATE` date DEFAULT NULL,
  `CHECK_DUE_DATE` date DEFAULT NULL,
  `CHECK_IN_DATE` date DEFAULT NULL,
  `PAT_ID` decimal(10,0) NOT NULL,
  `BOOK_NUM` decimal(10,0) NOT NULL,
  PRIMARY KEY (`CHECK_NUM`),
  KEY `fk_checkout_patron_idx` (`PAT_ID`),
  KEY `fk_checkout_book1_idx` (`BOOK_NUM`),
  CONSTRAINT `fk_checkout_book1` FOREIGN KEY (`BOOK_NUM`) REFERENCES `book` (`book_num`),
  CONSTRAINT `fk_checkout_patron` FOREIGN KEY (`PAT_ID`) REFERENCES `patron` (`pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES (91001,'2017-03-31','2017-04-14','2017-04-09',1165,5235),(91002,'2017-03-31','2017-04-07','2017-04-05',1209,5238),(91003,'2017-03-31','2017-04-14','2017-04-09',1160,5240),(91004,'2017-03-31','2017-04-14','2017-04-03',1160,5237),(91005,'2017-03-31','2017-04-07','2017-04-08',1202,5236),(91006,'2017-04-05','2017-04-12','2017-04-13',1203,5235),(91007,'2017-04-05','2017-04-12','2017-04-08',1174,5244),(91008,'2017-04-05','2017-04-12','2017-04-06',1181,5248),(91009,'2017-04-05','2017-04-19','2017-04-09',1170,5242),(91010,'2017-04-05','2017-04-19','2017-04-05',1161,5235),(91011,'2017-04-05','2017-04-12','2017-04-11',1181,5236),(91012,'2017-04-08','2017-04-15','2017-04-12',1181,5249),(91013,'2017-04-10','2017-04-24','2017-04-19',1160,5240),(91014,'2017-04-11','2017-04-18','2017-04-19',1204,5236),(91015,'2017-04-11','2017-04-18','2017-04-13',1204,5237),(91016,'2017-04-13','2017-04-27','2017-04-14',1183,5236),(91017,'2017-04-14','2017-04-21','2017-04-22',1184,5240),(91018,'2017-04-14','2017-04-28','2017-04-14',1170,5236),(91019,'2017-04-14','2017-04-21','2017-04-17',1171,5246),(91020,'2017-04-16','2017-04-23','2017-04-23',1185,5254),(91021,'2017-04-16','2017-04-23','2017-04-21',1185,5238),(91022,'2017-04-16','2017-04-23','2017-04-19',1171,5252),(91023,'2017-04-16','2017-04-23','2017-04-19',1207,5249),(91024,'2017-04-21','2017-04-28','2017-04-29',1209,5235),(91025,'2017-04-21','2017-04-28','2017-04-27',1172,5246),(91026,'2017-04-21','2017-05-04','2017-04-26',1161,5254),(91027,'2017-04-21','2017-05-04','2017-04-26',1161,5243),(91028,'2017-04-22','2017-05-05','2017-04-30',1183,5236),(91029,'2017-04-22','2017-04-29','2017-04-26',1203,5244),(91030,'2017-04-22','2017-04-29','2017-04-30',1207,5242),(91031,'2017-04-23','2017-05-06','2017-04-30',1165,5252),(91032,'2017-04-23','2017-04-30','2017-04-26',1172,5238),(91033,'2017-04-23','2017-04-30','2017-04-23',1174,5235),(91034,'2017-04-23','2017-04-30','2017-05-01',1185,5240),(91035,'2017-04-24','2017-05-07','2017-04-25',1165,5248),(91036,'2017-04-24','2017-04-30','2017-04-28',1202,5237),(91037,'2017-04-28','2017-05-04','2017-05-01',1210,5235),(91038,'2017-04-28','2017-05-04','2017-04-30',1215,5238),(91039,'2017-04-28','2017-05-04','2017-05-06',1222,5240),(91040,'2017-04-28','2017-05-04','2017-05-05',1228,5237),(91041,'2017-04-28','2017-05-04','2017-04-30',1211,5236),(91042,'2017-04-29','2017-05-05','2017-05-05',1220,5235),(91043,'2017-04-29','2017-05-05','2017-05-07',1226,5244),(91044,'2017-04-30','2017-05-07','2017-05-08',1219,5248),(91045,'2017-04-30','2017-05-07','2017-05-04',1210,5242),(91046,'2017-04-30','2017-05-07','2017-05-03',1225,5235),(91047,'2017-04-30','2017-05-07','2017-05-07',1218,5236),(91048,'2017-05-04','2017-05-11','2017-05-06',1229,5249),(91049,'2017-05-04','2017-05-11','2017-05-04',1214,5240),(91050,'2017-05-08','2017-05-15','2017-05-13',1220,5236),(91051,'2017-05-08','2017-05-15','2017-05-15',1222,5237),(91052,'2017-05-08','2017-05-15','2017-05-08',1213,5236),(91053,'2017-05-09','2017-05-16',NULL,1212,5240),(91054,'2017-05-09','2017-05-16','2017-05-11',1221,5236),(91055,'2017-05-09','2017-05-16','2017-05-10',1221,5246),(91056,'2017-05-10','2017-05-17','2017-05-15',1224,5254),(91057,'2017-05-10','2017-05-17','2017-05-11',1224,5238),(91058,'2017-05-10','2017-05-17','2017-05-15',1171,5252),(91059,'2017-05-10','2017-05-17',NULL,1207,5249),(91060,'2017-05-15','2017-05-22','2017-05-18',1209,5235),(91061,'2017-05-15','2017-05-22',NULL,1172,5246),(91062,'2017-05-15','2017-05-22','2017-05-16',1223,5254),(91063,'2017-05-15','2017-05-22','2017-05-20',1223,5243),(91064,'2017-05-17','2017-05-31','2017-05-21',1183,5236),(91065,'2017-05-17','2017-05-24','2017-05-17',1210,5244),(91066,'2017-05-19','2017-05-26',NULL,1228,5242),(91067,'2017-05-24','2017-05-31',NULL,1229,5252),(91068,'2017-05-24','2017-05-31',NULL,1229,5238);
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patron`
--

DROP TABLE IF EXISTS `patron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patron` (
  `PAT_ID` decimal(10,0) NOT NULL,
  `PAT_FNAME` varchar(20) DEFAULT NULL,
  `PAT_LNAME` varchar(20) DEFAULT NULL,
  `PAT_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patron`
--

LOCK TABLES `patron` WRITE;
/*!40000 ALTER TABLE `patron` DISABLE KEYS */;
INSERT INTO `patron` VALUES (1160,'robert','carter','Faculty'),(1161,'Kelsey','Koch','Faculty'),(1165,'Cedric','Baldwin','Faculty'),(1166,'Vera','Alvarado','Student'),(1167,'Alan','Martin','FACULTY'),(1170,'Cory','Barry','faculty'),(1171,'Peggy','Marsh','STUDENT'),(1172,'Tony','Miles','STUDENT'),(1174,'Betsy','Malone','STUDENT'),(1180,'Nadine','Blair','STUDENT'),(1181,'Allen','Horne','Student'),(1182,'Jamal','Melendez','STUDENT'),(1183,'Helena','Hughes','Faculty'),(1184,'Jimmie','Love','StudenT'),(1185,'Sandra','Yang','student'),(1200,'Lorenzo','Torres','Student'),(1201,'Shelby','Noble','Student'),(1202,'Holly','Anthony','Student'),(1203,'Tyler','Pope','STUDENT'),(1204,'Thomas','Duran','Student'),(1205,'Claire','Gomez','student'),(1207,'Iva','Ramos','Student'),(1208,'Ollie','Cantrell','Student'),(1209,'Rena','Mathis','Student'),(1210,'Keith','Cooley','STUdent'),(1211,'Jerald','Gaines','Student'),(1212,'Iva','McClain','Student'),(1213,'Desiree','Rivas','Student'),(1214,'Marina','King','Student'),(1215,'Maureen','Downs','Student'),(1218,'Angel','Terrell','Student'),(1219,'Desiree','Harrington','Student'),(1220,'Carlton','Morton','Student'),(1221,'Gloria','Pitts','Student'),(1222,'Zach','Kelly','Student'),(1223,'Jose','Hays','Student'),(1224,'Jewel','England','Student'),(1225,'Wilfred','Fuller','Student'),(1226,'Jeff','Owens','Student'),(1227,'Alicia','Dickson','Student'),(1228,'Homer','Goodman','Student'),(1229,'Gerald','Burke','Student'),(1237,'Brandi','Larson','Student'),(1238,'Erika','Bowen','Student'),(1239,'Elton','Irwin','Student'),(1240,'Jan','Joyce','Student'),(1241,'Irene','West','Student'),(1242,'Mario','King','Student'),(1243,'Roberto','Kennedy','Student'),(1244,'Leon','Richmond','Student');
/*!40000 ALTER TABLE `patron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writes`
--

DROP TABLE IF EXISTS `writes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `writes` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `AU_ID` decimal(7,0) NOT NULL,
  PRIMARY KEY (`AU_ID`,`BOOK_NUM`),
  KEY `fk_book_has_author_author1_idx` (`AU_ID`),
  KEY `fk_book_has_author_book1_idx` (`BOOK_NUM`),
  CONSTRAINT `fk_book_has_author_author1` FOREIGN KEY (`AU_ID`) REFERENCES `author` (`au_id`),
  CONSTRAINT `fk_book_has_author_book1` FOREIGN KEY (`BOOK_NUM`) REFERENCES `book` (`book_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writes`
--

LOCK TABLES `writes` WRITE;
/*!40000 ALTER TABLE `writes` DISABLE KEYS */;
INSERT INTO `writes` VALUES (5237,185),(5253,185),(5240,218),(5239,229),(5248,229),(5243,251),(5246,251),(5244,262),(5249,262),(5252,262),(5235,273),(5244,284),(5236,383),(5250,383),(5245,394),(5247,394),(5250,438),(5239,460),(5241,460),(5251,460),(5241,559),(5254,559),(5242,581),(5239,592),(5238,603);
/*!40000 ALTER TABLE `writes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-16 10:57:18
