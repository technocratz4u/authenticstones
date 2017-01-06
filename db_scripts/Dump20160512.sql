CREATE DATABASE  IF NOT EXISTS `authenticstones` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `authenticstones`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
INSERT INTO `tbl_admin` VALUES (1,'admin','admin','admin@abc.com','8012985267');
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
INSERT INTO `tbl_category` VALUES (1,NULL,'Loose Stones','2016-04-13 10:39:50',NULL,'N'),(2,NULL,'Beads','2016-04-13 10:39:50',NULL,'N'),(3,NULL,'Carvings','2016-04-13 10:39:50',NULL,'N'),(4,1,'Ruby','2016-04-13 10:39:50',NULL,'N'),(5,1,'Sapphire','2016-04-13 10:39:50',NULL,'N'),(6,2,'Peridot','2016-04-13 10:39:50',NULL,'N'),(7,2,'Coral','2016-04-13 10:39:50',NULL,'N'),(8,2,'Appetite','2016-04-13 10:39:50',NULL,'N'),(9,2,'Kynite','2016-04-13 10:39:50',NULL,'N'),(10,2,'Smoky Quartz','2016-04-13 10:39:50',NULL,'N'),(11,3,'Ruby','2016-04-13 10:39:50',NULL,'N'),(12,3,'Emerald','2016-04-13 10:39:50',NULL,'N'),(13,3,'Spessartite','2016-04-13 10:39:50',NULL,'N'),(14,3,'Tsavorite','2016-04-13 10:39:50',NULL,'N'),(15,3,'Aqua Marine','2016-04-13 10:39:50',NULL,'N');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_courier`
--

LOCK TABLES `tbl_courier` WRITE;
/*!40000 ALTER TABLE `tbl_courier` DISABLE KEYS */;
INSERT INTO `tbl_courier` VALUES (1,'Fedex'),(2,'Aramex');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_err_log`
--

LOCK TABLES `tbl_err_log` WRITE;
/*!40000 ALTER TABLE `tbl_err_log` DISABLE KEYS */;
INSERT INTO `tbl_err_log` VALUES (1,'proc_user_profile','in_call_key : ADD_ADDRESS, in_user_id : 5, in_exiting_name : NULL, in_name : NULL, in_address : NULL, in_country : NULL, in_state : NULL, in_city : NULL, in_pin: NULL, in_contact_number : NULL','2016-04-23 15:56:43'),(2,'proc_basket',',in_user_id : 5,in_item_id : NULL,in_action_code : save','2016-04-26 10:56:23'),(3,'proc_execute_prep_stmt','Err_Msg : Processing aborted as an Error Occurred While Excecuting proc_execute_prep_stmt , in_query : select ti.item_id, ti.item_code, ti.item_name, ti.price_carat*ti.carat_weight item_price, ti.currency, ti.shape, t_o.origin_name, tc.category_id as category_id, tc.category_name as category_name, tsc.category_id as sub_category_id, tsc.category_name as sub_category_name from tbl_item ti, tbl_origin t_o, tbl_category tc, tbl_category tsc where ti.category_id = tsc.category_id and ti.origin_id = t_o.origin_id and tc.parent_id IS NULL and tsc.parent_id IS NOT NULL and tsc.parent_id = tc.category_id and tc.is_deleted=\'N\' and tsc.is_deleted=\'N\'  and (  (upper(tc.category_name) = \'LOOSE STONES\'  and upper(tsc.category_name) = \'RUBY\')  ) and (  upper(ti.shape) = \'OVAL/PEARS\'  ) and (  ) order by ti.price_carat*ti.carat_weight  limit 0, 15','2016-04-26 11:01:56'),(4,'proc_execute_prep_stmt','Err_Msg : Processing aborted as an Error Occurred While Excecuting proc_execute_prep_stmt , in_query : select count(*) as filtered_product_count from tbl_item ti, tbl_origin t_o, tbl_category tc, tbl_category tsc where ti.category_id = tsc.category_id and ti.origin_id = t_o.origin_id and tc.parent_id IS NULL and tsc.parent_id IS NOT NULL and tsc.parent_id = tc.category_id and tc.is_deleted=\'N\' and tsc.is_deleted=\'N\'  and (  (upper(tc.category_name) = \'LOOSE STONES\'  and upper(tsc.category_name) = \'RUBY\')  ) and (  upper(ti.shape) = \'OVAL/PEARS\'  ) and (  )','2016-04-26 11:01:56'),(5,'proc_execute_prep_stmt','Err_Msg : Processing aborted as an Error Occurred While Excecuting proc_execute_prep_stmt , in_query : select ti.item_id, ti.item_code, ti.item_name, ti.price_carat*ti.carat_weight item_price, ti.currency, ti.shape, t_o.origin_name, tc.category_id as category_id, tc.category_name as category_name, tsc.category_id as sub_category_id, tsc.category_name as sub_category_name from tbl_item ti, tbl_origin t_o, tbl_category tc, tbl_category tsc where ti.category_id = tsc.category_id and ti.origin_id = t_o.origin_id and tc.parent_id IS NULL and tsc.parent_id IS NOT NULL and tsc.parent_id = tc.category_id and tc.is_deleted=\'N\' and tsc.is_deleted=\'N\'  and (  (upper(tc.category_name) = \'LOOSE STONES\'  and upper(tsc.category_name) = \'RUBY\')  ) and (  upper(ti.shape) = \'DONUT\'  ) and (  ) order by ti.price_carat*ti.carat_weight  limit 0, 15','2016-04-26 11:02:45'),(6,'proc_execute_prep_stmt','Err_Msg : Processing aborted as an Error Occurred While Excecuting proc_execute_prep_stmt , in_query : select count(*) as filtered_product_count from tbl_item ti, tbl_origin t_o, tbl_category tc, tbl_category tsc where ti.category_id = tsc.category_id and ti.origin_id = t_o.origin_id and tc.parent_id IS NULL and tsc.parent_id IS NOT NULL and tsc.parent_id = tc.category_id and tc.is_deleted=\'N\' and tsc.is_deleted=\'N\'  and (  (upper(tc.category_name) = \'LOOSE STONES\'  and upper(tsc.category_name) = \'RUBY\')  ) and (  upper(ti.shape) = \'DONUT\'  ) and (  )','2016-04-26 11:02:45'),(7,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 11:45:53'),(8,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 11:46:19'),(9,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 11:55:29'),(10,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 11:55:38'),(11,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 12:02:26'),(12,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 12:02:57'),(13,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 12:03:02'),(14,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 12:03:21'),(15,'proc_basket',',in_user_id : 6,in_item_id : NULL,in_action_code : save','2016-04-26 12:14:03'),(16,'proc_basket',',in_user_id : 5,in_item_id : NULL,in_action_code : save','2016-04-27 15:47:25'),(17,'proc_basket',',in_user_id : 5,in_item_id : NULL,in_action_code : save','2016-05-07 13:24:37'),(18,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-07 14:35:34'),(19,'proc_basket',',in_user_id : 5,in_item_id : NULL,in_action_code : save','2016-05-07 15:15:09'),(20,'proc_basket',',in_user_id : 5,in_item_id : NULL,in_action_code : save','2016-05-09 08:53:36'),(21,'proc_basket',',in_user_id : 5,in_item_id : NULL,in_action_code : save','2016-05-11 08:19:12'),(22,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-11 09:02:19'),(23,'proc_place_order','in_user_id : 1in_payment_reference_no : 23290823V6448732Xin_order_status : CREATEDin_total_amount : 7000.000in_total_item_price : 7000.000in_vat : 0.000in_shipping_cost : 0.000in_user_address_id : 3in_paypal_response : {\"SUCCESS\":\"SUCCESS\",\"mc_gross\":\"7000.00\",\"protection_eligibility\":\"Eligible\",\"address_status\":\"confirmed\",\"item_number1\":\"3\",\"tax\":\"0.00\",\"item_number2\":\"4\",\"payer_id\":\"63EDZZN4EM472\",\"ebay_txn_id1\":\"\",\"address_street\":\"1 Main St\",\"ebay_txn_id2\":\"\",\"payment_date\":\"22:40:00 May 11, 2016 PDT\",\"payment_status\":\"Completed\",\"charset\":\"windows-1252\",\"address_zip\":\"95131\",\"mc_shipping\":\"0.00\",\"mc_handling\":\"0.00\",\"first_name\":\"FName\",\"mc_fee\":\"203.30\",\"address_country_code\":\"US\",\"address_name\":\"FName LName\",\"custom\":\"haci7p51vbdq3khma9haamf2d4~~~1~~~7000\",\"payer_status\":\"verified\",\"business\":\"technocratz4u.seller1@gmail.com\",\"address_country\":\"United States\",\"num_cart_items\":\"2\",\"mc_handling1\":\"0.00\",\"mc_handling2\":\"0.00\",\"address_city\":\"San Jose\",\"payer_email\":\"technocratz4u.buyer@gmail.com\",\"mc_shipping1\":\"0.00\",\"mc_shipping2\":\"0.00\",\"tax1\":\"0.00\",\"tax2\":\"0.00\",\"txn_id\":\"23290823V6448732X\",\"payment_type\":\"instant\",\"last_name\":\"LName\",\"address_state\":\"CA\",\"item_name1\":\"Ruby Cabochon - RCB\",\"receiver_email\":\"technocratz4u.seller1@gmail.com\",\"item_name2\":\"Sapphire Cabochon - SCB\",\"payment_fee\":\"203.30\",\"quantity1\":\"3\",\"quantity2\":\"1\",\"receiver_id\":\"494GZUV3YVRB2\",\"txn_type\":\"cart\",\"mc_gross_1\":\"3000.00\",\"mc_currency\":\"USD\",\"mc_gross_2\":\"4000.00\",\"residence_country\":\"US\",\"transaction_subject\":\"\",\"payment_gross\":\"7000.00\"}','2016-05-12 11:10:12'),(24,'proc_place_order','in_user_id : 1in_payment_reference_no : 23290823V6448732Xin_order_status : CREATEDin_total_amount : 7000.000in_total_item_price : 7000.000in_vat : 0.000in_shipping_cost : 0.000in_user_address_id : 3in_paypal_response : {\"SUCCESS\":\"SUCCESS\",\"mc_gross\":\"7000.00\",\"protection_eligibility\":\"Eligible\",\"address_status\":\"confirmed\",\"item_number1\":\"3\",\"tax\":\"0.00\",\"item_number2\":\"4\",\"payer_id\":\"63EDZZN4EM472\",\"ebay_txn_id1\":\"\",\"address_street\":\"1 Main St\",\"ebay_txn_id2\":\"\",\"payment_date\":\"22:40:00 May 11, 2016 PDT\",\"payment_status\":\"Completed\",\"charset\":\"windows-1252\",\"address_zip\":\"95131\",\"mc_shipping\":\"0.00\",\"mc_handling\":\"0.00\",\"first_name\":\"FName\",\"mc_fee\":\"203.30\",\"address_country_code\":\"US\",\"address_name\":\"FName LName\",\"custom\":\"haci7p51vbdq3khma9haamf2d4~~~1~~~7000\",\"payer_status\":\"verified\",\"business\":\"technocratz4u.seller1@gmail.com\",\"address_country\":\"United States\",\"num_cart_items\":\"2\",\"mc_handling1\":\"0.00\",\"mc_handling2\":\"0.00\",\"address_city\":\"San Jose\",\"payer_email\":\"technocratz4u.buyer@gmail.com\",\"mc_shipping1\":\"0.00\",\"mc_shipping2\":\"0.00\",\"tax1\":\"0.00\",\"tax2\":\"0.00\",\"txn_id\":\"23290823V6448732X\",\"payment_type\":\"instant\",\"last_name\":\"LName\",\"address_state\":\"CA\",\"item_name1\":\"Ruby Cabochon - RCB\",\"receiver_email\":\"technocratz4u.seller1@gmail.com\",\"item_name2\":\"Sapphire Cabochon - SCB\",\"payment_fee\":\"203.30\",\"quantity1\":\"3\",\"quantity2\":\"1\",\"receiver_id\":\"494GZUV3YVRB2\",\"txn_type\":\"cart\",\"mc_gross_1\":\"3000.00\",\"mc_currency\":\"USD\",\"mc_gross_2\":\"4000.00\",\"residence_country\":\"US\",\"transaction_subject\":\"\",\"payment_gross\":\"7000.00\"}','2016-05-12 11:14:42'),(25,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 11:14:42'),(26,'proc_place_order','in_user_id : 1in_payment_reference_no : 23290823V6448732Xin_order_status : CREATEDin_total_amount : 7000.000in_total_item_price : 7000.000in_vat : 0.000in_shipping_cost : 0.000in_user_address_id : 3in_paypal_response : {\"SUCCESS\":\"SUCCESS\"}','2016-05-12 11:23:45'),(27,'proc_place_order',NULL,'2016-05-12 11:34:02'),(28,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 11:34:02'),(29,'proc_place_order',NULL,'2016-05-12 11:34:57'),(30,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 11:34:57'),(31,'proc_place_order',NULL,'2016-05-12 11:37:13'),(32,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 11:37:13'),(33,'proc_place_order',NULL,'2016-05-12 11:37:39'),(34,'proc_place_order','in_user_id : 1in_payment_reference_no : 23290823V6448732Xin_order_status : CREATEDin_total_amount : 7000.000in_total_item_price : 7000.000in_vat : 0.000in_shipping_cost : 0.000in_user_address_id : 3in_paypal_response : {\"SUCCESS\":\"SUCCESS\"}','2016-05-12 11:38:50'),(35,'proc_place_order',NULL,'2016-05-12 11:40:34'),(36,'proc_place_order','in_user_id : 1in_payment_reference_no : 23290823V6448732Xin_order_status : CREATEDin_total_amount : 7000.000in_total_item_price : 7000.000in_vat : 0.000in_shipping_cost : 0.000in_user_address_id : 3in_paypal_response : {\"SUCCESS\":\"SUCCESS\"}','2016-05-12 11:44:54'),(37,'proc_place_order','in_user_id : 1in_payment_reference_no : 23290823V6448732Xin_order_status : CREATEDin_total_amount : 7000.000in_total_item_price : 7000.000in_vat : 0.000in_shipping_cost : 0.000in_user_address_id : 3in_paypal_response : {\"SUCCESS\":\"SUCCESS\"}','2016-05-12 11:47:07'),(38,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 12:22:39'),(39,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:15:58'),(40,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:15:59'),(41,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:16:56'),(42,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:16:57'),(43,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:17:00'),(44,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:18:04'),(45,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:18:04'),(46,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:18:05'),(47,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:39:21'),(48,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:42:38'),(49,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:42:41'),(50,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:42:43'),(51,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:42:45'),(52,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:44:46'),(53,'proc_basket',',in_user_id : 1,in_item_id : NULL,in_action_code : save','2016-05-12 13:44:53');
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
  `total_order_price` decimal(14,3) NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_invoice_order_id_idx` (`order_id`),
  CONSTRAINT `fk_invoice_order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice`
--

LOCK TABLES `tbl_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
INSERT INTO `tbl_invoice` VALUES (1,900.000,1),(2,800.000,2),(3,1000.000,3),(5,23000.000,4),(9,7000.000,16),(10,3000.000,17),(11,3000.000,18),(12,5000.000,19),(13,6000.000,20);
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
  `description` varchar(500) DEFAULT NULL,
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
INSERT INTO `tbl_item` VALUES (1,4,'RCT-1','Ruby Cut',17,'USD','Round','8 mm','Red',4.5,500.000,1,1,10.00000,'2016-04-13 11:04:18',NULL,'N','Ruby are essentially considered to be forever because of their timelessness and beauty'),(2,5,'SCT-1','Sapphire Cut',20,'USD','Square','2.5 - 3.2 mm','Green',4.4,450.000,2,1,30.00000,'2016-04-13 11:04:18',NULL,'N',NULL),(3,4,'RCB','Ruby Cabochon',8,'USD','Oval/Pears','7x5 mm','Red',4.2,200.000,3,2,5.00000,'2016-04-13 11:04:18',NULL,'N',NULL),(4,5,'SCB','Sapphire Cabochon',17,'USD','Oval','8x6 mm','Green',4.5,200.000,4,2,20.00000,'2016-04-13 11:04:18',NULL,'N',NULL),(5,6,'PER 1','Peridot Faceted',20,'USD','Donut','8 cm','Light Green',4.5,500.000,1,1,600.00000,'2016-04-13 11:14:05',NULL,'N',NULL),(6,6,'PER 2','Peridot Faceted',17,'USD','Square','8 cm','Light Green',4.4,450.000,2,1,300.00000,'2016-04-13 11:14:05',NULL,'N',NULL),(7,6,'PER 3','Peridot Faceted',20,'USD','Oval/Pears','8 cm','Light Green',4.2,300.000,3,2,500.00000,'2016-04-13 11:14:05',NULL,'N',NULL),(8,6,'PER 4','Peridot Faceted',20,'USD','Oval','8 cm','Light Green',4.5,200.000,4,2,800.00000,'2016-04-13 11:14:05',NULL,'N',NULL);
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
  `user_id` bigint(20) unsigned NOT NULL,
  `courier_id` bigint(3) unsigned DEFAULT NULL,
  `vat` decimal(14,3) NOT NULL,
  `shipping_cost` decimal(14,3) NOT NULL,
  `total_item_price` decimal(14,3) NOT NULL,
  `total_amount` decimal(14,3) NOT NULL,
  `order_time` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `awb_no` varchar(50) DEFAULT NULL,
  `payment_reference_no` varchar(50) DEFAULT NULL,
  `insertion_time` datetime DEFAULT NULL,
  `deletion_time` datetime DEFAULT NULL,
  `is_deleted` char(1) DEFAULT NULL,
  `status_modification_time` varchar(45) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pin` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user_shipment_detail_id` (`user_id`),
  KEY `fk_order_courier_id` (`courier_id`),
  CONSTRAINT `fk_order_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `tbl_courier` (`courier_id`),
  CONSTRAINT `fk_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT INTO `tbl_order` VALUES (1,5,1,5.000,0.000,0.000,900.000,'2016-04-18 15:19:40','Delivered','jbhhbhbhjbh87665','vhbhhkh778786','2016-04-18 15:19:40',NULL,NULL,'2016-04-19 15:19:40','','4th Flr 169 Bl A','','','','','5634564656'),(2,5,1,5.000,0.000,0.000,900.000,'2015-09-18 15:19:40','Shipped','jbhjhjh87665','vkh778786','2016-04-18 15:19:40',NULL,NULL,'2016-04-19 15:19:40','','4th Flr 169 Bl B','','','','','8667565666'),(3,5,1,5.000,0.000,0.000,1000.000,'2016-04-18 15:19:40','Delivered','jbhhbhbhjbh87665','vhkh778786','2016-04-18 15:19:40',NULL,NULL,'2016-04-20 15:19:40','','4th Flr 169 Bl C','','','','','768768969'),(4,6,1,0.000,0.000,0.000,23000.000,'2016-05-07 13:41:18','Created',NULL,'TXN_09987655','2016-05-07 13:41:18',NULL,'N','2016-05-07 13:41:18','MANI','','Kolkata','West Bengal','700096','India','9877655433'),(16,1,1,0.000,0.000,7000.000,7000.000,'2016-05-12 11:53:31','CREATED',NULL,'23290823V6448732X','2016-05-12 11:53:31',NULL,'N','2016-05-12 11:53:31','ManiManiMani','HIG F537, HGtyiuyue7 , Brahmapur','Kolkata','West Bengal','700096','India','98765544212'),(17,1,1,0.000,0.000,3000.000,3000.000,'2016-05-12 11:56:34','CREATED',NULL,'3DV2324692747244G','2016-05-12 11:56:34',NULL,'N','2016-05-12 11:56:34','ManiManiMani','HIG F537, HGtyiuyue7 , Brahmapur','Kolkata','West Bengal','700096','India','98765544212'),(18,1,1,0.000,0.000,3000.000,3000.000,'2016-05-12 12:21:36','CREATED',NULL,'1UJ68447X3796404G','2016-05-12 12:21:36',NULL,'N','2016-05-12 12:21:36','ManiManiMani','HIG F537, HGtyiuyue7 , Brahmapur','Kolkata','West Bengal','700096','India','98765544212'),(19,1,1,0.000,0.000,5000.000,5000.000,'2016-05-12 13:38:38','CREATED',NULL,'68A12753DX502571H','2016-05-12 13:38:38',NULL,'N','2016-05-12 13:38:38','ManiManiMani','HIG F537, HGtyiuyue7 , Brahmapur','Kolkata','West Bengal','700096','India','98765544212'),(20,1,1,0.000,0.000,6000.000,6000.000,'2016-05-12 13:44:36','CREATED',NULL,'7PU70693RD4806716','2016-05-12 13:44:36',NULL,'N','2016-05-12 13:44:36','ManiManiMani','HIG F537, HGtyiuyue7 , Brahmapur','Kolkata','West Bengal','700096','India','98765544212');
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
  `item_price` decimal(14,3) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `fk_order_detail_order_id` (`order_id`),
  KEY `fk_order_detail_item_id` (`item_id`),
  CONSTRAINT `fk_order_detail_item_id` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`item_id`),
  CONSTRAINT `fk_order_detail_order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_detail`
--

LOCK TABLES `tbl_order_detail` WRITE;
/*!40000 ALTER TABLE `tbl_order_detail` DISABLE KEYS */;
INSERT INTO `tbl_order_detail` VALUES (1,1,1,3,300.000),(2,1,2,3,300.000),(3,3,1,2,300.000),(4,2,1,2,800.000),(5,4,1,2,5000.000),(6,4,3,1,1000.000),(7,4,4,1,4000.000),(8,4,6,3,135000.000),(42,16,3,3,1000.000),(43,16,4,1,4000.000),(45,17,3,3,1000.000),(46,18,3,3,1000.000),(47,19,3,1,1000.000),(48,19,4,1,4000.000),(50,20,1,1,5000.000),(51,20,3,1,1000.000);
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
-- Table structure for table `tbl_paypal_error`
--

DROP TABLE IF EXISTS `tbl_paypal_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_paypal_error` (
  `paypal_error_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `paypal_error_response` text,
  `insertion_time` datetime DEFAULT NULL,
  PRIMARY KEY (`paypal_error_id`),
  KEY `fk_paypal_error_user_id` (`user_id`),
  CONSTRAINT `fk_paypal_error_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paypal_error`
--

LOCK TABLES `tbl_paypal_error` WRITE;
/*!40000 ALTER TABLE `tbl_paypal_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_paypal_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paypal_response`
--

DROP TABLE IF EXISTS `tbl_paypal_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_paypal_response` (
  `paypal_response_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `paypal_response` text NOT NULL,
  PRIMARY KEY (`paypal_response_id`),
  KEY `fk_paypal_response_order_id` (`order_id`),
  CONSTRAINT `fk_paypal_response_order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paypal_response`
--

LOCK TABLES `tbl_paypal_response` WRITE;
/*!40000 ALTER TABLE `tbl_paypal_response` DISABLE KEYS */;
INSERT INTO `tbl_paypal_response` VALUES (1,4,'{}'),(2,16,'{\"SUCCESS\":\"SUCCESS\"}'),(3,17,'{\"SUCCESS\":\"SUCCESS\",\"mc_gross\":\"3000.00\",\"protection_eligibility\":\"Eligible\",\"address_status\":\"confirmed\",\"item_number1\":\"3\",\"payer_id\":\"63EDZZN4EM472\",\"tax\":\"0.00\",\"address_street\":\"1 Main St\",\"payment_date\":\"23:26:20 May 11, 2016 PDT\",\"payment_status\":\"Completed\",\"charset\":\"windows-1252\",\"address_zip\":\"95131\",\"mc_shipping\":\"0.00\",\"mc_handling\":\"0.00\",\"first_name\":\"FName\",\"mc_fee\":\"87.30\",\"address_country_code\":\"US\",\"address_name\":\"FName LName\",\"custom\":\"haci7p51vbdq3khma9haamf2d4~~~1~~~3000\",\"payer_status\":\"verified\",\"business\":\"technocratz4u.seller1@gmail.com\",\"address_country\":\"United States\",\"num_cart_items\":\"1\",\"mc_handling1\":\"0.00\",\"address_city\":\"San Jose\",\"payer_email\":\"technocratz4u.buyer@gmail.com\",\"mc_shipping1\":\"0.00\",\"tax1\":\"0.00\",\"txn_id\":\"3DV2324692747244G\",\"payment_type\":\"instant\",\"last_name\":\"LName\",\"address_state\":\"CA\",\"item_name1\":\"Ruby Cabochon - RCB\",\"receiver_email\":\"technocratz4u.seller1@gmail.com\",\"payment_fee\":\"87.30\",\"quantity1\":\"3\",\"receiver_id\":\"494GZUV3YVRB2\",\"txn_type\":\"cart\",\"mc_gross_1\":\"3000.00\",\"mc_currency\":\"USD\",\"residence_country\":\"US\",\"transaction_subject\":\"\",\"payment_gross\":\"3000.00\"}'),(4,18,'{\"SUCCESS\":\"SUCCESS\",\"mc_gross\":\"3000.00\",\"protection_eligibility\":\"Eligible\",\"address_status\":\"confirmed\",\"item_number1\":\"3\",\"payer_id\":\"63EDZZN4EM472\",\"tax\":\"0.00\",\"address_street\":\"1 Main St\",\"payment_date\":\"23:51:21 May 11, 2016 PDT\",\"payment_status\":\"Completed\",\"charset\":\"windows-1252\",\"address_zip\":\"95131\",\"mc_shipping\":\"0.00\",\"mc_handling\":\"0.00\",\"first_name\":\"FName\",\"mc_fee\":\"87.30\",\"address_country_code\":\"US\",\"address_name\":\"FName LName\",\"custom\":\"haci7p51vbdq3khma9haamf2d4~~~1~~~3000\",\"payer_status\":\"verified\",\"business\":\"technocratz4u.seller1@gmail.com\",\"address_country\":\"United States\",\"num_cart_items\":\"1\",\"mc_handling1\":\"0.00\",\"address_city\":\"San Jose\",\"payer_email\":\"technocratz4u.buyer@gmail.com\",\"mc_shipping1\":\"0.00\",\"tax1\":\"0.00\",\"txn_id\":\"1UJ68447X3796404G\",\"payment_type\":\"instant\",\"last_name\":\"LName\",\"address_state\":\"CA\",\"item_name1\":\"Ruby Cabochon - RCB\",\"receiver_email\":\"technocratz4u.seller1@gmail.com\",\"payment_fee\":\"87.30\",\"quantity1\":\"3\",\"receiver_id\":\"494GZUV3YVRB2\",\"txn_type\":\"cart\",\"mc_gross_1\":\"3000.00\",\"mc_currency\":\"USD\",\"residence_country\":\"US\",\"transaction_subject\":\"\",\"payment_gross\":\"3000.00\"}'),(5,19,'{\"SUCCESS\":\"SUCCESS\",\"mc_gross\":\"5000.00\",\"protection_eligibility\":\"Eligible\",\"address_status\":\"confirmed\",\"item_number1\":\"3\",\"tax\":\"0.00\",\"item_number2\":\"4\",\"payer_id\":\"63EDZZN4EM472\",\"ebay_txn_id1\":\"\",\"address_street\":\"1 Main St\",\"ebay_txn_id2\":\"\",\"payment_date\":\"01:08:25 May 12, 2016 PDT\",\"payment_status\":\"Completed\",\"charset\":\"windows-1252\",\"address_zip\":\"95131\",\"mc_shipping\":\"0.00\",\"mc_handling\":\"0.00\",\"first_name\":\"FName\",\"mc_fee\":\"145.30\",\"address_country_code\":\"US\",\"address_name\":\"FName LName\",\"custom\":\"haci7p51vbdq3khma9haamf2d4~~~1~~~5000\",\"payer_status\":\"verified\",\"business\":\"technocratz4u.seller1@gmail.com\",\"address_country\":\"United States\",\"num_cart_items\":\"2\",\"mc_handling1\":\"0.00\",\"mc_handling2\":\"0.00\",\"address_city\":\"San Jose\",\"payer_email\":\"technocratz4u.buyer@gmail.com\",\"mc_shipping1\":\"0.00\",\"mc_shipping2\":\"0.00\",\"tax1\":\"0.00\",\"tax2\":\"0.00\",\"txn_id\":\"68A12753DX502571H\",\"payment_type\":\"instant\",\"last_name\":\"LName\",\"address_state\":\"CA\",\"item_name1\":\"Ruby Cabochon - RCB\",\"receiver_email\":\"technocratz4u.seller1@gmail.com\",\"item_name2\":\"Sapphire Cabochon - SCB\",\"payment_fee\":\"145.30\",\"quantity1\":\"1\",\"quantity2\":\"1\",\"receiver_id\":\"494GZUV3YVRB2\",\"txn_type\":\"cart\",\"mc_gross_1\":\"1000.00\",\"mc_currency\":\"USD\",\"mc_gross_2\":\"4000.00\",\"residence_country\":\"US\",\"transaction_subject\":\"\",\"payment_gross\":\"5000.00\"}'),(6,20,'{\"SUCCESS\":\"SUCCESS\",\"mc_gross\":\"6000.00\",\"protection_eligibility\":\"Eligible\",\"address_status\":\"confirmed\",\"item_number1\":\"1\",\"tax\":\"0.00\",\"item_number2\":\"3\",\"payer_id\":\"63EDZZN4EM472\",\"ebay_txn_id1\":\"\",\"address_street\":\"1 Main St\",\"ebay_txn_id2\":\"\",\"payment_date\":\"01:14:21 May 12, 2016 PDT\",\"payment_status\":\"Completed\",\"charset\":\"windows-1252\",\"address_zip\":\"95131\",\"mc_shipping\":\"0.00\",\"mc_handling\":\"0.00\",\"first_name\":\"FName\",\"mc_fee\":\"174.30\",\"address_country_code\":\"US\",\"address_name\":\"FName LName\",\"custom\":\"haci7p51vbdq3khma9haamf2d4~~~1~~~6000\",\"payer_status\":\"verified\",\"business\":\"technocratz4u.seller1@gmail.com\",\"address_country\":\"United States\",\"num_cart_items\":\"2\",\"mc_handling1\":\"0.00\",\"mc_handling2\":\"0.00\",\"address_city\":\"San Jose\",\"payer_email\":\"technocratz4u.buyer@gmail.com\",\"mc_shipping1\":\"0.00\",\"mc_shipping2\":\"0.00\",\"tax1\":\"0.00\",\"tax2\":\"0.00\",\"txn_id\":\"7PU70693RD4806716\",\"payment_type\":\"instant\",\"last_name\":\"LName\",\"address_state\":\"CA\",\"item_name1\":\"Ruby Cut - RCT-1\",\"receiver_email\":\"technocratz4u.seller1@gmail.com\",\"item_name2\":\"Ruby Cabochon - RCB\",\"payment_fee\":\"174.30\",\"quantity1\":\"1\",\"quantity2\":\"1\",\"receiver_id\":\"494GZUV3YVRB2\",\"txn_type\":\"cart\",\"mc_gross_1\":\"5000.00\",\"mc_currency\":\"USD\",\"mc_gross_2\":\"1000.00\",\"residence_country\":\"US\",\"transaction_subject\":\"\",\"payment_gross\":\"6000.00\"}');
/*!40000 ALTER TABLE `tbl_paypal_response` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Mani','password','ju.manikandan@gmail.com','2016-04-14 08:09:32',NULL,'N'),(2,'Mani','password','ju.manikandan1@gmail.com','2016-04-14 15:21:24',NULL,'N'),(3,'Mani','password','ju.manikandan2@gmail.com','2016-04-14 15:24:59',NULL,'N'),(4,'ManiManiMani','aaaa','ju.manikandan3@gmail.com','2016-04-14 17:17:31',NULL,'N'),(5,'Rahul Aggarwal','rahul','aggarwalrahul86@gmail.com','2016-04-18 12:58:46',NULL,'N'),(6,'Sonia Raychaudhuri','sonia','sonia2305@gmail.com','2016-04-24 18:34:42',NULL,'N'),(8,'sonia_1','sonia','sonia2305_1@gmail.com','2016-04-26 14:10:32',NULL,'N');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_address`
--

DROP TABLE IF EXISTS `tbl_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_address` (
  `user_address_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `alternate_number` varchar(20) DEFAULT NULL,
  `address` varchar(300) NOT NULL,
  `is_primary` char(1) DEFAULT NULL,
  `deletion_time` datetime DEFAULT NULL,
  `is_deleted` char(1) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pin` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_address_id`),
  KEY `fk_user_shipment_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_address`
--

LOCK TABLES `tbl_user_address` WRITE;
/*!40000 ALTER TABLE `tbl_user_address` DISABLE KEYS */;
INSERT INTO `tbl_user_address` VALUES (1,5,'Rahul Aggarwal','9831148354','6565678999','4th Fl bangur Kolkata','Y',NULL,NULL,'Kolkata','WestBengal','700055','India'),(2,6,'MANI','9877655433',NULL,'jakhjha sjks s skjsjks ',NULL,NULL,NULL,'Kolkata','West Bengal','700096','India'),(3,1,'ManiManiMani','98765544212',NULL,'HIG F537, HGtyiuyue7 , Brahmapur',NULL,NULL,NULL,'Kolkata','West Bengal','700096','India');
/*!40000 ALTER TABLE `tbl_user_address` ENABLE KEYS */;
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
  UNIQUE KEY `uk_user_item` (`item_id`,`user_id`),
  KEY `fk_user_cart_id` (`user_id`),
  KEY `fk_item_cart_id` (`item_id`),
  CONSTRAINT `fk_item_cart_id` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`item_id`),
  CONSTRAINT `fk_user_cart_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_cart`
--

LOCK TABLES `tbl_user_cart` WRITE;
/*!40000 ALTER TABLE `tbl_user_cart` DISABLE KEYS */;
INSERT INTO `tbl_user_cart` VALUES (293,8,1,224,'2016-04-26 14:11:36'),(294,8,3,16,'2016-04-26 14:11:36'),(295,8,4,160,'2016-04-26 14:11:36'),(296,8,6,3,'2016-04-26 14:11:36');
/*!40000 ALTER TABLE `tbl_user_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'authentic_stones_db'
--
/*!50003 DROP FUNCTION IF EXISTS `split_string` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  FUNCTION `split_string`(
	originalStr varchar(255),
	delim varchar(12),
	pos int) RETURNS varchar(255) CHARSET latin1
BEGIN

	return replace(substring(substring_index(originalStr, delim, pos), 
      length(substring_index(originalStr, delim, pos - 1)) + 1), delim, '');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_admin_authentication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_admin_authentication`(
	IN in_username VARCHAR(100),
	IN in_password VARCHAR(20)
	)
BEGIN
	DECLARE proc_status varchar(10) DEFAULT 'SUCCESS';

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_admin_authentication',
			concat('in_username : ', ifnull(in_username,'NULL'), 
			', in_password : ', ifnull(in_password,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;


	SELECT admin_id, username, email, contact_no
		FROM tbl_admin WHERE username = in_username AND password = in_password;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_basket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_basket`(
	IN in_user_id VARCHAR(20),
	IN in_item_id VARCHAR(20),
	IN in_item_array VARCHAR(600),
	IN in_item_array_count INT(5),
	IN in_action_code VARCHAR(20)
)
BEGIN
	DECLARE proc_status varchar(10);
	DECLARE _item_details_ VARCHAR(100);
	DECLARE array_delim VARCHAR(2) DEFAULT ',';
	DECLARE item_delim VARCHAR(2) DEFAULT '=';
	DECLARE counter INT DEFAULT 0;
	DECLARE _item_id_ VARCHAR(100);
	DECLARE _item_quantity_ VARCHAR(100);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_basket',
			concat(',in_user_id : ', ifnull(in_user_id,'NULL'),
					',in_item_id : ', ifnull(in_item_id,'NULL'),
					',in_action_code : ', ifnull(in_action_code,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
    END;

	START TRANSACTION;
	
	IF in_action_code = 'saveorupdate' THEN
		
		IF in_item_array_count > 0 THEN
			forEachItem: LOOP
				SET counter = counter + 1;

				SELECT split_string(in_item_array, array_delim, counter) 
					INTO _item_details_;

				SET _item_id_ = substring_index(_item_details_, item_delim, 1);
				SET _item_quantity_ = substring_index(_item_details_, item_delim, -1);

				INSERT INTO tbl_user_cart (user_id, item_id, quantity, item_addition_time)
						(SELECT in_user_id,_item_id_,_item_quantity_, now()
							FROM dual
								WHERE _item_quantity_ <> (SELECT quantity FROM tbl_user_cart
															WHERE user_id = in_user_id 
																AND item_id = _item_id_))
						ON DUPLICATE KEY UPDATE quantity = quantity + _item_quantity_;
				
				IF counter = in_item_array_count THEN
					LEAVE forEachItem;
				END IF;

			END LOOP forEachItem;
		END IF;
	
		SET proc_status = 'SUCCESS';
		SELECT proc_status;

	ELSEIF in_action_code = 'save' THEN

		delete from tbl_user_cart where
					user_id = in_user_id;

		forEachItem: LOOP
			SET counter = counter + 1;

			SELECT split_string(in_item_array, array_delim, counter) 
				INTO _item_details_;

			SET _item_id_ = substring_index(_item_details_, item_delim, 1);
			SET _item_quantity_ = substring_index(_item_details_, item_delim, -1);

			INSERT INTO tbl_user_cart (user_id, item_id, quantity, item_addition_time)
					VALUES (in_user_id,_item_id_,_item_quantity_, now())
					ON DUPLICATE KEY UPDATE quantity = quantity + _item_quantity_;

			IF counter = in_item_array_count THEN
				LEAVE forEachItem;
			END IF;

		END LOOP forEachItem;
		
		SET proc_status = 'SUCCESS';
		SELECT proc_status;

	END IF;

	COMMIT;
	
	select 
		ti.item_id,
		ct.category_name,
		ti.item_code,
		ti.item_name,
		ti.shape,
		cr.quantity,
		ti.dimensions,
		ti.color,
		ti.mean_rating,
		ti.price_carat,
		ti.carat_weight,
		ti.price_carat * ti.carat_weight item_price,
		ti.currency,
		ti.description,
		og.origin_name,
		tr.treatment_name
	from
		tbl_item ti,
		tbl_category ct,
		tbl_origin og,
		tbl_treatment tr,
		tbl_user_cart cr
	WHERE ti.category_id = ct.category_id
			and og.origin_id = ti.origin_id
			and tr.treatment_id = ti.treatment_id
			and cr.user_id = in_user_id
			and cr.item_id = ti.item_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_category_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_category_detail`(
	IN in_filter_detail_query TEXT,
	IN in_filter_count_query TEXT
)
BEGIN
	SELECT tc.category_id as category_id, tc.category_name as category_name, 
	tsc.category_id as sub_category_id, tsc.category_name as sub_category_name
	FROM tbl_category tc, tbl_category tsc
	WHERE tc.parent_id IS NULL
	AND tsc.parent_id IS NOT NULL
	AND tsc.parent_id = tc.category_id
	AND tc.is_deleted='N'
	AND tsc.is_deleted='N'
	ORDER BY tc.insertion_time;

	SELECT t_i.shape, sum(t_i.quantity) as shape_count 
	FROM tbl_item t_i
	GROUP BY t_i.shape;

	SELECT t_i.origin_id, t_o.origin_name, sum(t_i.quantity) as origin_count
	FROM tbl_item t_i, tbl_origin t_o
	WHERE t_i.origin_id = t_o.origin_id
	GROUP BY t_i.origin_id;

	select sum(t_i.quantity) as item_count from tbl_item t_i
	where t_i.carat_weight*t_i.price_carat <= 100;

	select sum(t_i.quantity) as item_count from tbl_item t_i
	where t_i.carat_weight*t_i.price_carat >= 100 and t_i.carat_weight*t_i.price_carat <= 500;

	select sum(t_i.quantity) as item_count from tbl_item t_i
	where t_i.carat_weight*t_i.price_carat >= 500 and t_i.carat_weight*t_i.price_carat <= 1000;

	select sum(t_i.quantity) as item_count from tbl_item t_i
	where t_i.carat_weight*t_i.price_carat >= 1000 and t_i.carat_weight*t_i.price_carat <= 2000;

	select sum(t_i.quantity) as item_count from tbl_item t_i
	where t_i.carat_weight*t_i.price_carat >= 2000;
	
	-- Select filter query 
	call authentic_stones_db.proc_execute_prep_stmt(in_filter_detail_query);
	call authentic_stones_db.proc_execute_prep_stmt(in_filter_count_query);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_checkout_add_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_checkout_add_address`(
	IN in_user_id BIGINT(20),
	IN in_name VARCHAR(100),
	IN in_address VARCHAR(300),
	IN in_city VARCHAR(45),
	IN in_state VARCHAR(45),
	IN in_pin VARCHAR(45),
	IN in_country VARCHAR(45),
	IN in_contact_number VARCHAR(20)

)
BEGIN
	
	DECLARE proc_status varchar(10);
	DECLARE _user_address_id_ BIGINT(20);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_checkout_add_address',
			concat('in_user_id : ', ifnull(in_user_id,'NULL'), ', in_name : ', ifnull(in_name,'NULL'), 
			', in_address : ', ifnull(in_address,'NULL'), ', in_country : ', ifnull(in_country,'NULL'),
			', in_state : ', ifnull(in_state,'NULL'), ', in_city : ', ifnull(in_city,'NULL'),
			', in_pin : ', ifnull(in_pin,'NULL'), ', in_contact_number : ', ifnull(in_contact_number,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	START TRANSACTION;

		INSERT INTO tbl_user_address
				(user_id, full_name,contact_number,address,city,state,pin,country)
		VALUES
			(in_user_id,in_name,in_contact_number,in_address,in_city,in_state,in_pin, in_country);

	COMMIT;

	SET proc_status = 'SUCCESS';
	select proc_status;

	SELECT user_address_id, user_id, full_name, contact_number, 
	address, city, state, pin, country
	FROM tbl_user_address 
	WHERE user_id = in_user_id
	AND full_name = in_name
	AND contact_number = in_contact_number
	AND address = in_address
	AND city = in_city
	AND state = in_state
	AND pin = in_pin
	AND country = in_country;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_checkout_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_checkout_details`(
IN in_user_id BIGINT(20)
)
BEGIN

select 
    usr.full_name,
    usr.email,
	addr.user_address_id,
    addr.full_name as 'addr_full_name',
    addr.address,
    addr.city,
    addr.state,
	addr.country,
    addr.pin,
    addr.contact_number,
    addr.alternate_number,
    addr.is_primary
from
    tbl_user usr,
    tbl_user_address addr
where
    usr.user_id = addr.user_id
	and usr.user_id = in_user_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_checkout_item_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_checkout_item_details`(
IN in_user_id BIGINT(20)
)
BEGIN

select t_i.item_id, t_i.item_code, t_i.item_name, t_i.price_carat, t_i.carat_weight,
t_i.price_carat * t_i.carat_weight item_price,
t_c.user_cart_id, t_c.quantity
from tbl_user_cart t_c, tbl_item t_i
where t_c.item_id = t_i.item_id
and t_c.user_id = in_user_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_delete_user_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_delete_user_address`(
	IN in_user_id VARCHAR(20),
	IN in_user_address_id VARCHAR(20)
)
BEGIN

	DECLARE proc_status varchar(10);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_delete_user_address',
			concat('in_user_id : ', ifnull(in_user_id,'NULL'),
					', in_user_address_id : ', ifnull(in_user_address_id,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	START TRANSACTION;

            delete from tbl_user_address where user_address_id = in_user_address_id and user_id=in_user_id;
	

			SET proc_status = 'SUCCESS';
			SELECT proc_status;
			
			

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_execute_prep_stmt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_execute_prep_stmt`(
	IN in_query TEXT
)
exec_prep_stmt_blk:BEGIN
	DECLARE Err_Msg TEXT;
	DECLARE err_log_str TEXT;
	DECLARE continue HANDLER FOR sqlexception 
	set Err_Msg = 'Processing aborted as an Error Occurred While Excecuting proc_execute_prep_stmt ';

	SET @sql := in_query;
	PREPARE stmt_fetch_actor FROM @sql;
	EXECUTE stmt_fetch_actor;
	DEALLOCATE PREPARE stmt_fetch_actor;
	
	-- Exception Handling
	IF Err_Msg is not null THEN
		Rollback;
		SET Err_Msg = concat(Err_Msg, SQLEXCEPTION.message);
		SET err_log_str = concat('Err_Msg : ',Err_Msg,', in_query : ',in_query);
		INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_execute_prep_stmt', err_log_str, now());
		Commit;
		LEAVE exec_prep_stmt_blk;
	End IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_item_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_get_item_details`(
	IN in_item_id VARCHAR(20)
)
BEGIN

	DECLARE proc_status varchar(10);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_get_item_details',
			concat('in_item_id : ', ifnull(in_item_id,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;
	
select 
    ti.item_id,
    ct.category_name,
    ti.item_code,
    ti.item_name,
    ti.shape,
    ti.quantity,
    ti.dimensions,
    ti.color,
    ti.mean_rating,
	ti.price_carat,
	ti.carat_weight,
    ti.price_carat * ti.carat_weight item_price,
    ti.currency,
	ti.description,
    og.origin_name,
    tr.treatment_name
from
    tbl_item ti,
    tbl_category ct,
    tbl_origin og,
    tbl_treatment tr
WHERE
    ti.item_id = in_item_id
        and ti.category_id = ct.category_id
        and og.origin_id = ti.origin_id
        and tr.treatment_id = ti.treatment_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_user_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_get_user_orders`(
	IN in_user_id VARCHAR(20),
	IN in_month_interval VARCHAR(10)
)
BEGIN

	DECLARE proc_status varchar(10);
	DECLARE date_range DATETIME DEFAULT NULL;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_get_user_orders',
			concat('in_user_id : ', ifnull(in_user_id,'NULL'),'in_month_interval : ', ifnull(in_month_interval,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	IF(in_month_interval = '3') THEN
        SET date_range := DATE_SUB(NOW(), INTERVAL 3 MONTH);
    elseif (in_month_interval = '6') THEN
		SET date_range := DATE_SUB(NOW(), INTERVAL 6 MONTH);
	elseif (in_month_interval = '30') THEN
		SET date_range := DATE_SUB(NOW(), INTERVAL 30 DAY);
	elseif (in_month_interval = 'ALL') THEN
		SET date_range := null;
	end if;

	
select 
    usr.full_name,
	ord.address,
	ord.contact_number,
	usr.email,
	ord.order_id,
	ord.status,
	ord.total_amount,
	ord.order_time,
	ord.status_modification_time,
	det.order_detail_id,
	det.item_id,
	itm.item_code,
	itm.currency,
	itm.item_name,
	det.quantity,
	det.item_price,
	inv.invoice_id
	
from
    tbl_order ord,
    tbl_user usr,
    tbl_invoice inv,
    tbl_order_detail det,
	tbl_item itm
where ord.order_id = det.order_id
        and ord.user_id = usr.user_id
        and usr.user_id = in_user_id
		and det.item_id = itm.item_id
		and inv.order_id = ord.order_id
        AND (date_range is null or ord.order_time >date_range)

order by order_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
CREATE  PROCEDURE `proc_home_page`()
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_paypal_error_response` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_paypal_error_response`(
	IN in_user_id BIGINT(20),
	IN in_paypal_response TEXT
)
BEGIN

	DECLARE proc_status varchar(10);
	
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_place_order',
			concat('in_user_id : ', ifnull(in_user_id,'NULL'), 
					'in_paypal_response : ', ifnull(in_paypal_response,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	START TRANSACTION;

		insert into tbl_paypal_error(user_id, paypal_error_response, insertion_time)
		values (in_user_id, in_paypal_response, now());

	COMMIT;

	SET proc_status = 'SUCCESS';
	select proc_status;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_place_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_place_order`(
	IN in_user_id BIGINT(20),
	IN in_payment_reference_no VARCHAR(50),
	IN in_order_status VARCHAR(10),
	IN in_total_amount DECIMAL(14, 3),
	IN in_total_item_price DECIMAL(14, 3),
	IN in_vat DECIMAL(14, 3),
	IN in_shipping_cost DECIMAL(14, 3),
	IN in_user_address_id BIGINT(20),
	IN in_paypal_response TEXT
)
BEGIN
	
	DECLARE proc_status varchar(10);
	DECLARE _order_id_ BIGINT(20);
	DECLARE _order_debug_str_ varchar(512);
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_place_order',
			concat('in_user_id : ', ifnull(in_user_id,'NULL'), 
					'in_payment_reference_no : ', ifnull(in_payment_reference_no,'NULL'), 
					'in_order_status : ', ifnull(in_order_status,'NULL'),
					'in_total_amount : ', ifnull(in_total_amount,'NULL'), 
					'in_total_item_price : ', ifnull(in_total_item_price,'NULL'), 
					'in_vat : ', ifnull(in_vat,'NULL'), 
					'in_shipping_cost : ', ifnull(in_shipping_cost,'NULL'), 
					'in_user_address_id : ', ifnull(in_user_address_id,'NULL'), 
					'in_paypal_response : ', ifnull(in_paypal_response,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
		select _order_debug_str_;
        -- select err_debug_str;
    END;

	START TRANSACTION;
		SET _order_debug_str_ = 'inserting into tbl_order';
		INSERT INTO tbl_order(user_id, courier_id, vat,shipping_cost,total_item_price,total_amount, order_time, status,
			awb_no, payment_reference_no, insertion_time, deletion_time, is_deleted, status_modification_time,
			full_name, address, city, state, pin, country, contact_number)
		select in_user_id, 1, in_vat, in_shipping_cost,in_total_item_price, in_total_amount, now(), in_order_status, 
			null, in_payment_reference_no, now(), null, 'N', now(),
			full_name, address, city, state, pin, country, contact_number
			from tbl_user_address where user_address_id = in_user_address_id; 
		
		select order_id INTO _order_id_  
		from tbl_order 
		where user_id = in_user_id
		and payment_reference_no = in_payment_reference_no;

		SET _order_debug_str_ = concat(_order_debug_str_, ', inserting into tbl_order_detail');

		insert into tbl_order_detail (order_id, item_id, quantity, item_price)
		select _order_id_, tuc.item_id, tuc.quantity , ti.price_carat*ti.carat_weight
		from tbl_user_cart tuc, tbl_item ti
		where tuc.item_id = ti.item_id
		and tuc.user_id = in_user_id;

		SET _order_debug_str_ = concat(_order_debug_str_, ', inserting into tbl_invoice');

		insert into tbl_invoice (order_id, total_order_price)
		values (_order_id_, in_total_amount);

		SET _order_debug_str_ = concat(_order_debug_str_, ', inserting into tbl_paypal_response');

		insert into tbl_paypal_response (order_id, paypal_response)
		values (_order_id_, in_paypal_response);

		SET _order_debug_str_ = concat(_order_debug_str_, ', deleting from tbl_user_cart');
		-- clear the car after placing the order for the items --
		delete from tbl_user_cart where user_id = in_user_id;

		SET _order_debug_str_ = concat(_order_debug_str_, ', updating tbl_order_detail');
		-- reduce the quantity of the item from the stock --
		update tbl_order_detail tod, tbl_item ti 
		set ti.quantity = ti.quantity - tod.quantity
		where tod.item_id = ti.item_id
		and tod.order_id = _order_id_;


	COMMIT;

	SET proc_status = 'SUCCESS';

	select proc_status;
	-- select _order_id_ as order_id;
	select ord.full_name, ord.address, ord.contact_number, ord.city, ord.state, ord.pin, ord.country,
		ord.order_id, ord.status, ord.vat, ord.shipping_cost, ord.total_item_price, ord.total_amount, 
		DATE_FORMAT(ord.order_time, '%Y-%m-%d %h:%i %p') as order_time, ord.status_modification_time, det.order_detail_id,
		det.item_id, itm.item_code, itm.currency, itm.item_name, det.quantity, det.item_price,
		inv.invoice_id
	from tbl_order ord, tbl_user usr, tbl_invoice inv, tbl_order_detail det, tbl_item itm
	where ord.order_id = det.order_id
			and ord.user_id = usr.user_id
			and ord.order_id = det.order_id
			and det.item_id = itm.item_id
			and inv.order_id = ord.order_id
			and ord.order_id = _order_id_;

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
CREATE  PROCEDURE `proc_sign_up_sign_in`(
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_user_change_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_user_change_password`(
	IN in_user_id VARCHAR(20),
	IN in_old_password VARCHAR(20),
	IN in_new_password VARCHAR(20)
)
BEGIN

	DECLARE proc_status varchar(30);
	DECLARE temp_old_password VARCHAR(20);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_user_change_password',
			concat('in_user_id : ', ifnull(in_user_id,'NULL'),
			', in_old_password : ', ifnull(in_old_password,'NULL'), 
			', in_new_password : ', ifnull(in_new_password,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	START TRANSACTION;

		SELECT password INTO temp_old_password 
		FROM tbl_user WHERE user_id = in_user_id;
		

		IF temp_old_password = in_old_password THEN
			
			update tbl_user set password = in_new_password where user_id = in_user_id;

			SET proc_status = 'SUCCESS';
			SELECT proc_status;
			
		ELSE 

			SET proc_status = 'INCORRECT PASSWORD';
			SELECT proc_status;
			
		END IF;
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_user_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE  PROCEDURE `proc_user_profile`(
	IN in_call_key VARCHAR(20),
	IN in_user_id VARCHAR(20),
	IN in_exiting_name VARCHAR(100),
	IN in_name VARCHAR(100),
	IN in_address VARCHAR(300),
	IN in_country VARCHAR(45),
	IN in_state VARCHAR(45),
	IN in_city VARCHAR(45),
	IN in_pin VARCHAR(45),
	IN in_contact_number VARCHAR(20)

)
BEGIN

	DECLARE proc_status varchar(10);
	DECLARE temp_name varchar(100);
	

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_user_profile',
			concat('in_call_key : ', ifnull(in_call_key,'NULL'),
					', in_user_id : ', ifnull(in_user_id,'NULL'),
					', in_exiting_name : ', ifnull(in_exiting_name,'NULL'),
					', in_name : ', ifnull(in_name,'NULL'),
					', in_address : ', ifnull(in_address,'NULL'),
					', in_country : ', ifnull(in_country,'NULL'),
					', in_state : ', ifnull(in_state,'NULL'),
					', in_city : ', ifnull(in_city,'NULL'),
					', in_pin: ', ifnull(in_pin,'NULL'),
					', in_contact_number : ', ifnull(in_contact_number,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	
	IF in_call_key = 'GET_PROFILE' THEN

select 
    usr.full_name,
    usr.email,
	addr.user_address_id,
    addr.full_name as 'addr_full_name',
    addr.address,
    addr.city,
    addr.state,
	addr.country,
    addr.pin,
    addr.contact_number,
    addr.alternate_number,
    addr.is_primary
from
    tbl_user usr,
    tbl_user_address addr
where
    usr.user_id = addr.user_id
        and usr.user_id = in_user_id;

	ELSEIF in_call_key = 'ADD_ADDRESS' THEN

		select full_name into temp_name from tbl_user where user_id = in_user_id;

	start transaction;
		if in_exiting_name <> temp_name then
		update tbl_user set full_name = in_exiting_name where user_id = in_user_id;
	    commit;	
		end if;
		if in_name IS NOT NULL and in_name <> '' then
	start transaction;

			INSERT INTO tbl_user_address
				(user_id, full_name,contact_number,address,city,state,pin,country)
			VALUES
				(in_user_id,in_name,in_contact_number,in_address,in_city,in_state,in_pin, in_country);

	commit;
			
	end if;

	SET proc_status = 'SUCCESS';
	SELECT proc_status;
     

select 
    usr.full_name,
    usr.email,
	addr.user_address_id,
    addr.full_name as 'addr_full_name',
    addr.address,
    addr.city,
    addr.state,
	addr.country,
    addr.pin,
    addr.contact_number,
    addr.alternate_number,
    addr.is_primary
from
    tbl_user usr,
    tbl_user_address addr
where
    usr.user_id = addr.user_id
	and usr.user_id = in_user_id;

	END IF;


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

-- Dump completed on 2016-05-12 13:47:33
