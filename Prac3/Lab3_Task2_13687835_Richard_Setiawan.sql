-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: richardsetiawan_db
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `addresses` (
  `address_Id` int(11) NOT NULL,
  `line_1_number_building` varchar(45) DEFAULT NULL,
  `line_2_number_street` varchar(45) DEFAULT NULL,
  `line_3_area_locality` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip_postcode` varchar(45) DEFAULT NULL,
  `state_province_country` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `other_address_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`address_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_addresses`
--

DROP TABLE IF EXISTS `patient_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient_addresses` (
  `date_address_form` datetime NOT NULL,
  `date_address_to` datetime DEFAULT NULL,
  `Patients_patients_id` int(11) NOT NULL,
  `Addresses_address_Id` int(11) NOT NULL,
  PRIMARY KEY (`date_address_form`),
  KEY `fk_Patient_Addresses_Patients1_idx` (`Patients_patients_id`),
  KEY `fk_Patient_Addresses_Addresses1_idx` (`Addresses_address_Id`),
  CONSTRAINT `fk_Patient_Addresses_Addresses1` FOREIGN KEY (`Addresses_address_Id`) REFERENCES `addresses` (`address_id`),
  CONSTRAINT `fk_Patient_Addresses_Patients1` FOREIGN KEY (`Patients_patients_id`) REFERENCES `patients` (`patients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_addresses`
--

LOCK TABLES `patient_addresses` WRITE;
/*!40000 ALTER TABLE `patient_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patients` (
  `patients_id` int(11) NOT NULL,
  `outpatient_yn` int(11) DEFAULT NULL,
  `hospital_number` int(11) DEFAULT NULL,
  `nhs_number` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `patient_first_name` varchar(45) DEFAULT NULL,
  `patient_middle_name` varchar(45) DEFAULT NULL,
  `patient_last_name` varchar(45) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `next_of_kin` varchar(45) DEFAULT NULL,
  `home_phone` varchar(45) DEFAULT NULL,
  `work_phone` varchar(45) DEFAULT NULL,
  `cell_mobile_phone` varchar(45) DEFAULT NULL,
  `other_patient_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_category_code` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `staff_job_title` varchar(45) DEFAULT NULL,
  `staff_first_name` varchar(45) DEFAULT NULL,
  `staff_middle_name` varchar(45) DEFAULT NULL,
  `staff_last_name` varchar(45) DEFAULT NULL,
  `staff_qualifications` varchar(45) DEFAULT NULL,
  `staff_birth_date` datetime DEFAULT NULL,
  `other_staff_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_addresses`
--

DROP TABLE IF EXISTS `staff_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_addresses` (
  `Staff_staff_id` int(11) NOT NULL,
  `Addresses_address_Id` int(11) NOT NULL,
  `date_address_from` datetime NOT NULL,
  `date_address_to` datetime DEFAULT NULL,
  PRIMARY KEY (`date_address_from`),
  KEY `fk_Staff_Addresses_Staff_idx` (`Staff_staff_id`),
  KEY `fk_Staff_Addresses_Addresses1_idx` (`Addresses_address_Id`),
  CONSTRAINT `fk_Staff_Addresses_Addresses1` FOREIGN KEY (`Addresses_address_Id`) REFERENCES `addresses` (`address_id`),
  CONSTRAINT `fk_Staff_Addresses_Staff` FOREIGN KEY (`Staff_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_addresses`
--

LOCK TABLES `staff_addresses` WRITE;
/*!40000 ALTER TABLE `staff_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_addresses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-02 10:33:48
