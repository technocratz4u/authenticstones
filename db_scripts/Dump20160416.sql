CREATE DATABASE  IF NOT EXISTS `authentic_stones_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `authentic_stones_db`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: authentic_stones_db
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_admin` (
  `admin_id` bigint(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `category_id` bigint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(5) unsigned DEFAULT NULL,
  `category_name` varchar(100) NOT NULL,
  `insertion_time` datetime DEFAULT NULL,
  `deletion_time` datetime DEFAULT NULL,
  `is_deleted` char(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_category_parent_id` (`parent_id`),
  CONSTRAINT `fk_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,NULL,'Loose Stones','2016-04-13 10:39:50',NULL,'N'),(2,NULL,'Beads','2016-04-13 10:39:50',NULL,'N'),(3,NULL,'Carvings','2016-04-13 10:39:50',NULL,'N'),(4,1,'Ruby','2016-04-13 10:39:50',NULL,'N'),(5,1,'Sapphire','2016-04-13 10:39:50',NULL,'N'),(6,2,'Peridot','2016-04-13 10:39:50',NULL,'N'),(7,2,'Coral','2016-04-13 10:39:50',NULL,'N'),(8,2,'Appetite','2016-04-13 10:39:50',NULL,'N'),(9,2,'Kynite','2016-04-13 10:39:50',NULL,'N'),(10,2,'Smoky Quartz','2016-04-13 10:39:50',NULL,'N'),(11,3,'Ruby','2016-04-13 10:39:50',NULL,'N'),(12,3,'Emrald','2016-04-13 10:39:50',NULL,'N'),(13,3,'Spessartite','2016-04-13 10:39:50',NULL,'N'),(14,3,'Tsavorite','2016-04-13 10:39:50',NULL,'N'),(15,3,'Aqua Marine','2016-04-13 10:39:50',NULL,'N');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_courier`
--

DROP TABLE IF EXISTS `tbl_courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_courier` (
  `courier_id` bigint(3) unsigned NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(100) NOT NULL,
  PRIMARY KEY (`courier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_courier`
--

LOCK TABLES `tbl_courier` WRITE;
/*!40000 ALTER TABLE `tbl_courier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_discount`
--

DROP TABLE IF EXISTS `tbl_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_discount` (
  `discount_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_value` decimal(10,3) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  KEY `fk_discount_item_id` (`item_id`),
  CONSTRAINT `fk_discount_item_id` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_discount`
--

LOCK TABLES `tbl_discount` WRITE;
/*!40000 ALTER TABLE `tbl_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_discount_history`
--

DROP TABLE IF EXISTS `tbl_discount_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_discount_history` (
  `discount_history_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_value` decimal(10,3) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`discount_history_id`),
  KEY `fk_discount_history_item_id` (`item_id`),
  CONSTRAINT `fk_discount_history_item_id` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_discount_history`
--

LOCK TABLES `tbl_discount_history` WRITE;
/*!40000 ALTER TABLE `tbl_discount_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_discount_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_err_log`
--

DROP TABLE IF EXISTS `tbl_err_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_err_log` (
  `err_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `proc_name` varchar(100) NOT NULL,
  `params` text,
  `creation_time` datetime NOT NULL,
  PRIMARY KEY (`err_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_err_log`
--

LOCK TABLES `tbl_err_log` WRITE;
/*!40000 ALTER TABLE `tbl_err_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_err_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_invoice`
--

DROP TABLE IF EXISTS `tbl_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_invoice` (
  `invoice_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `total_order_price` decimal(10,3) NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice`
--

LOCK TABLES `tbl_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_item` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(5) unsigned DEFAULT NULL,
  `item_code` varchar(100) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `quantity` bigint(5) NOT NULL,
  `currency` varchar(20) NOT NULL,
  `shape` varchar(50) NOT NULL,
  `dimensions` varchar(20) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `mean_rating` decimal(2,1) DEFAULT NULL,
  `price_carat` decimal(6,3) NOT NULL,
  `origin_id` bigint(5) unsigned DEFAULT NULL,
  `treatment_id` bigint(5) unsigned DEFAULT NULL,
  `carat_weight` decimal(8,5) DEFAULT NULL,
  `insertion_time` datetime DEFAULT NULL,
  `deletion_time` datetime DEFAULT NULL,
  `is_deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_item_category_id` (`category_id`),
  KEY `fk_item_origin_id` (`origin_id`),
  KEY `fk_item_treatment_id` (`treatment_id`),
  CONSTRAINT `fk_item_category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`category_id`),
  CONSTRAINT `fk_item_origin_id` FOREIGN KEY (`origin_id`) REFERENCES `tbl_origin` (`origin_id`),
  CONSTRAINT `fk_item_treatment_id` FOREIGN KEY (`treatment_id`) REFERENCES `tbl_treatment` (`treatment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_item`
--

LOCK TABLES `tbl_item` WRITE;
/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
INSERT INTO `tbl_item` VALUES (1,4,'RCT-1','Ruby Cut',20,'USD','Round','8 mm','Red',4.5,500.000,1,1,10.00000,'2016-04-13 11:04:18',NULL,'N'),(2,5,'SCT-1','Sapphire Cut',20,'USD','Square','2.5 - 3.2 mm','Green',4.4,450.000,2,1,30.00000,'2016-04-13 11:04:18',NULL,'N'),(3,4,'RCB','Ruby Cabochon',20,'USD','Oval/Pears','7x5 mm','Red',4.2,200.000,3,2,5.00000,'2016-04-13 11:04:18',NULL,'N'),(4,5,'SCB','Sapphire Cabochon',20,'USD','Oval','8x6 mm','Green',4.5,200.000,4,2,20.00000,'2016-04-13 11:04:18',NULL,'N'),(5,6,'PER 1','Peridot Faceted',20,'USD','Donut','8 cm','Light Green',4.5,500.000,1,1,600.00000,'2016-04-13 11:14:05',NULL,'N'),(6,6,'PER 2','Peridot Faceted',20,'USD','Square','8 cm','Light Green',4.4,450.000,2,1,300.00000,'2016-04-13 11:14:05',NULL,'N'),(7,6,'PER 3','Peridot Faceted',20,'USD','Oval/Pears','8 cm','Light Green',4.2,300.000,3,2,500.00000,'2016-04-13 11:14:05',NULL,'N'),(8,6,'PER 4','Peridot Faceted',20,'USD','Oval','8 cm','Light Green',4.5,200.000,4,2,800.00000,'2016-04-13 11:14:05',NULL,'N');
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_shipment_detail_id` bigint(20) unsigned NOT NULL,
  `invoice_id` bigint(20) unsigned DEFAULT NULL,
  `courier_id` bigint(3) unsigned DEFAULT NULL,
  `vat` decimal(10,3) NOT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  `order_time` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `awb_no` varchar(50) DEFAULT NULL,
  `payment_reference_no` varchar(50) DEFAULT NULL,
  `insertion_time` datetime DEFAULT NULL,
  `deletion_time` datetime DEFAULT NULL,
  `is_deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user_shipment_detail_id` (`user_shipment_detail_id`),
  KEY `fk_order_invoice_id` (`invoice_id`),
  KEY `fk_order_courier_id` (`courier_id`),
  CONSTRAINT `fk_order_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `tbl_courier` (`courier_id`),
  CONSTRAINT `fk_order_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `tbl_invoice` (`invoice_id`),
  CONSTRAINT `fk_order_user_shipment_detail_id` FOREIGN KEY (`user_shipment_detail_id`) REFERENCES `tbl_user_shipment_detail` (`user_shipment_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order_detail`
--

DROP TABLE IF EXISTS `tbl_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_order_detail` (
  `order_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `quantity` bigint(5) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `fk_order_detail_order_id` (`order_id`),
  KEY `fk_order_detail_item_id` (`item_id`),
  CONSTRAINT `fk_order_detail_item_id` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`item_id`),
  CONSTRAINT `fk_order_detail_order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_detail`
--

LOCK TABLES `tbl_order_detail` WRITE;
/*!40000 ALTER TABLE `tbl_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_origin`
--

DROP TABLE IF EXISTS `tbl_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_origin` (
  `origin_id` bigint(5) unsigned NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(100) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_origin`
--

LOCK TABLES `tbl_origin` WRITE;
/*!40000 ALTER TABLE `tbl_origin` DISABLE KEYS */;
INSERT INTO `tbl_origin` VALUES (1,'Mouzambique','2016-04-13 10:41:59'),(2,'Africa','2016-04-13 10:41:59'),(3,'Burma','2016-04-13 10:41:59'),(4,'Kanchanaburi','2016-04-13 10:41:59');
/*!40000 ALTER TABLE `tbl_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_treatment`
--

DROP TABLE IF EXISTS `tbl_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_treatment` (
  `treatment_id` bigint(5) unsigned NOT NULL AUTO_INCREMENT,
  `treatment_name` varchar(100) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`treatment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_treatment`
--

LOCK TABLES `tbl_treatment` WRITE;
/*!40000 ALTER TABLE `tbl_treatment` DISABLE KEYS */;
INSERT INTO `tbl_treatment` VALUES (1,'Heated','2016-04-13 10:49:38'),(2,'No Heat','2016-04-13 10:49:38');
/*!40000 ALTER TABLE `tbl_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `creation_time` datetime NOT NULL,
  `deletion_time` datetime DEFAULT NULL,
  `is_deleted` char(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Mani','password','ju.manikandan@gmail.com','2016-04-14 08:09:32',NULL,'N'),(2,'Mani','password','ju.manikandan1@gmail.com','2016-04-14 15:21:24',NULL,'N'),(3,'Mani','password','ju.manikandan2@gmail.com','2016-04-14 15:24:59',NULL,'N'),(4,'ManiManiMani','aaaa','ju.manikandan3@gmail.com','2016-04-14 17:17:31',NULL,'N');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_cart`
--

DROP TABLE IF EXISTS `tbl_user_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_cart` (
  `user_cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `quantity` bigint(5) NOT NULL,
  `item_addition_time` datetime NOT NULL,
  PRIMARY KEY (`user_cart_id`),
  KEY `fk_user_cart_id` (`user_id`),
  KEY `fk_item_cart_id` (`item_id`),
  CONSTRAINT `fk_item_cart_id` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`item_id`),
  CONSTRAINT `fk_user_cart_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_cart`
--

LOCK TABLES `tbl_user_cart` WRITE;
/*!40000 ALTER TABLE `tbl_user_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_shipment_detail`
--

DROP TABLE IF EXISTS `tbl_user_shipment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_shipment_detail` (
  `user_shipment_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `alternate_number` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `is_primary` char(1) DEFAULT NULL,
  `deletion_time` datetime DEFAULT NULL,
  `is_deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`user_shipment_detail_id`),
  KEY `fk_user_shipment_id` (`user_id`),
  CONSTRAINT `fk_user_shipment_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_shipment_detail`
--

LOCK TABLES `tbl_user_shipment_detail` WRITE;
/*!40000 ALTER TABLE `tbl_user_shipment_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_shipment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'authentic_stones_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_home_page` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_home_page`()
BEGIN

select ti.item_id, ti.item_code, ti.item_name, ti.price_carat*ti.carat_weight item_price, ti.currency
from tbl_item ti
WHERE ti.item_id IN (1, 2, 3, 4, 5, 6, 7, 8);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_sign_up_sign_in` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_sign_up_sign_in`(
	IN in_call_key VARCHAR(20),
	IN in_email VARCHAR(100),
	IN in_password VARCHAR(20),
	IN in_full_name VARCHAR(100)
)
BEGIN

	DECLARE proc_status varchar(10);
	DECLARE _email_id_count_ INT(1);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_sign_up_sign_in',
			concat('in_call_key : ', ifnull(in_call_key,'NULL'), ', in_email : ', ifnull(in_email,'NULL'), 
			', in_password : ', ifnull(in_password,'NULL'), ', in_full_name : ', ifnull(in_full_name,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	START TRANSACTION;
	
	IF in_call_key = 'REGISTER' THEN

		SELECT count(*) INTO _email_id_count_ 
		FROM tbl_user WHERE email = in_email;
		

		IF _email_id_count_ = 0 THEN
			
			INSERT INTO tbl_user
				(full_name, password, email, creation_time, is_deleted)
			VALUES
				(in_full_name, in_password, in_email, now(), 'N');

			SET proc_status = 'SUCCESS';
			SELECT proc_status;

			SELECT user_id, email, full_name
			FROM tbl_user WHERE email = in_email AND password = in_password;
			
			
		ELSE 

			SET proc_status = 'DUPLICATE';
			SELECT proc_status;
			
		END IF;

			
			
	ELSEIF in_call_key = 'LOGIN' THEN

		SELECT user_id, email, full_name
		FROM tbl_user WHERE email = in_email AND password = in_password;

	ELSEIF in_call_key = 'FORGOT_PASSWORD' THEN

		SELECT email  
		FROM tbl_user WHERE email = in_email AND password = in_password;

	END IF;
	
		

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-16 11:36:42
