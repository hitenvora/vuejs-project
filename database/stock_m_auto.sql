-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stock_m_auto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_company_id_foreign` (`company_id`),
  CONSTRAINT `brands_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_company_id_foreign` (`company_id`),
  CONSTRAINT `categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_dark_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_light_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_layout` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sidebar',
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `mysqldump_command` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/usr/bin/mysqldump',
  `shortcut_menus` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'top_bottom',
  `currency_id` bigint(20) unsigned DEFAULT NULL,
  `lang_id` bigint(20) unsigned DEFAULT NULL,
  `website_lang_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `left_sidebar_theme` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dark',
  `primary_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#1890ff',
  `date_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DD-MM-YYYY',
  `time_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hh:mm a',
  `auto_detect_timezone` tinyint(1) NOT NULL DEFAULT 1,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `session_driver` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `app_debug` tinyint(1) NOT NULL DEFAULT 0,
  `update_app_notification` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `subscription_plan_id` bigint(20) unsigned DEFAULT NULL,
  `package_type` enum('monthly','annual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `licence_expire_on` date DEFAULT NULL,
  `payment_transcation_id` bigint(20) unsigned DEFAULT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `admin_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `total_users` int(11) NOT NULL DEFAULT 1,
  `email_verification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `white_label_completed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `companies_currency_id_foreign` (`currency_id`),
  KEY `companies_lang_id_foreign` (`lang_id`),
  KEY `companies_warehouse_id_foreign` (`warehouse_id`),
  KEY `companies_subscription_plan_id_foreign` (`subscription_plan_id`),
  KEY `companies_stripe_id_index` (`stripe_id`),
  KEY `companies_website_lang_id_foreign` (`website_lang_id`),
  KEY `companies_payment_transcation_id_foreign` (`payment_transcation_id`),
  CONSTRAINT `companies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `companies_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `companies_payment_transcation_id_foreign` FOREIGN KEY (`payment_transcation_id`) REFERENCES `payment_transcations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `companies_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `companies_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `companies_website_lang_id_foreign` FOREIGN KEY (`website_lang_id`) REFERENCES `langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'My Company','MyCon','company@example.com','+9199999999',NULL,NULL,NULL,NULL,NULL,'7 street, city, state, 762782','sidebar',0,'/usr/bin/mysqldump','top_bottom',1,1,NULL,1,'dark','#1890ff','DD-MM-YYYY','hh:mm a',1,'Asia/Kolkata','file',0,1,NULL,'2024-05-09 07:49:19',NULL,NULL,NULL,NULL,NULL,NULL,'monthly',NULL,NULL,0,1,'active',1,NULL,0,0),(2,'Stockifly SAAS','Stockifly','superadmin_company@example.com','+9199999999',NULL,NULL,NULL,NULL,NULL,'7 street, city, state, 762782','sidebar',0,'/usr/bin/mysqldump','top_bottom',NULL,1,NULL,NULL,'dark','#1890ff','DD-MM-YYYY','hh:mm a',1,'Asia/Kolkata','file',0,1,'2024-05-09 07:43:31','2024-05-09 07:43:31',NULL,NULL,NULL,NULL,NULL,NULL,'monthly',NULL,NULL,1,2,'active',1,NULL,1,0);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencies_company_id_foreign` (`company_id`),
  CONSTRAINT `currencies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,1,'INR','INR','INR','front',1,'2024-05-09 07:48:16','2024-05-09 07:48:16');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `custom_fields_company_id_foreign` (`company_id`),
  CONSTRAINT `custom_fields_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_queries`
--

DROP TABLE IF EXISTS `email_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_queries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `replied` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_queries`
--

LOCK TABLES `email_queries` WRITE;
/*!40000 ALTER TABLE `email_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `expense_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `bill` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_category_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `notes` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  KEY `expenses_warehouse_id_foreign` (`warehouse_id`),
  KEY `expenses_user_id_foreign` (`user_id`),
  KEY `expenses_company_id_foreign` (`company_id`),
  CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `expenses_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `front_product_cards`
--

DROP TABLE IF EXISTS `front_product_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `front_product_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `front_product_cards_warehouse_id_foreign` (`warehouse_id`),
  KEY `front_product_cards_company_id_foreign` (`company_id`),
  CONSTRAINT `front_product_cards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `front_product_cards_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_product_cards`
--

LOCK TABLES `front_product_cards` WRITE;
/*!40000 ALTER TABLE `front_product_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `front_product_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `front_website_settings`
--

DROP TABLE IF EXISTS `front_website_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `front_website_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `featured_categories` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_categories_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Featured Categories',
  `featured_categories_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `featured_products` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_products_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Featured Products',
  `featured_products_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `features_lists` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `twitter_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `instagram_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `linkedin_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `youtube_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pages_widget` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_info_widget` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `links_widget` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_company_description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Stockify have many propular products wiht high discount and special offers.',
  `footer_copyright_text` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Copyright 2021 @ Stockify, All rights reserved.',
  `top_banners` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bottom_banners_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bottom_banners_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bottom_banners_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `front_website_settings_warehouse_id_foreign` (`warehouse_id`),
  KEY `front_website_settings_company_id_foreign` (`company_id`),
  CONSTRAINT `front_website_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `front_website_settings_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_website_settings`
--

LOCK TABLES `front_website_settings` WRITE;
/*!40000 ALTER TABLE `front_website_settings` DISABLE KEYS */;
INSERT INTO `front_website_settings` VALUES (1,1,1,'[]','Featured Categories','','[]','Featured Products','','[]','','','','','','[]','[]','[]','My Warehouse have many propular products wiht high discount and special offers.','Copyright 2024 @ My Warehouse, All rights reserved.','[]','[]','[]','[]','2024-05-09 07:47:59','2024-05-09 07:47:59'),(2,1,1,'[]','Featured Categories','','[]','Featured Products','','[]','','','','','','[]','[]','[]','Stockify have many propular products wiht high discount and special offers.','Copyright 2021 @ Stockify, All rights reserved.','[]','[]','[]','[]','2024-05-09 07:47:59','2024-05-09 07:47:59');
/*!40000 ALTER TABLE `front_website_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langs`
--

DROP TABLE IF EXISTS `langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `langs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langs`
--

LOCK TABLES `langs` WRITE;
/*!40000 ALTER TABLE `langs` DISABLE KEYS */;
INSERT INTO `langs` VALUES (1,NULL,'English','en',1,'2024-05-09 07:43:09','2024-05-09 07:43:09');
/*!40000 ALTER TABLE `langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_08_19_000000_create_failed_jobs_table',1),(2,'2021_01_02_193004_create_langs_table',1),(3,'2021_01_02_193005_create_translations_table',1),(4,'2021_02_01_040700_create_payment_modes_table',1),(5,'2021_03_01_040700_create_currencies_table',1),(6,'2021_03_02_130932_create_warehouses_table',1),(7,'2021_03_03_114417_create_companies_table',1),(8,'2021_04_04_000000_create_users_table',1),(9,'2021_04_05_190756_entrust_setup_tables',1),(10,'2021_05_06_151454_create_brands_table',1),(11,'2021_05_06_162224_create_categories_table',1),(12,'2021_05_07_033806_create_taxes_table',1),(13,'2021_05_07_033823_create_units_table',1),(14,'2021_05_08_052842_create_expense_categories_table',1),(15,'2021_05_08_052858_create_expenses_table',1),(16,'2021_05_08_144116_custom_fields_table',1),(17,'2021_05_09_153334_create_products_table',1),(18,'2021_05_13_072501_create_orders_table',1),(19,'2021_05_13_072518_create_order_items_table',1),(20,'2021_05_23_060918_create_payments_table',1),(21,'2021_05_23_060919_create_order_payments_table',1),(22,'2021_05_28_120405_create_warehouse_stocks_table',1),(23,'2021_10_10_100006_create_stock_history_table',1),(24,'2022_01_10_115820_create_stock_adjustments_table',1),(25,'2022_02_01_094402_create_settings_table',1),(26,'2022_02_24_075933_create_notifications_table',1),(27,'2022_02_24_122754_create_jobs_table',1),(28,'2022_03_07_110707_create_warehouse_history_table',1),(29,'2022_04_11_105713_add_login_image_column_in_companies_table',1),(30,'2022_04_14_141740_create_order_shipping_address_table',1),(31,'2022_04_15_141741_create_user_address_table',1),(32,'2022_04_16_054851_create_front_product_cards_table',1),(33,'2022_04_17_092949_create_front_website_settings_table',1),(34,'2022_04_30_044824_add_rtl_in_companies_warehouses_table',1),(35,'2022_05_05_044824_add_setting_records_in_settings_table',1),(36,'2022_05_22_004926_add_from_warehouse_id_column_in_orders_table',1),(37,'2022_06_24_094848_add_staff_user_id_in_payments_warehouse_history_table',1),(38,'2022_10_06_152352_create_company_id_columns_in_all_tables',1),(39,'2022_10_19_053056_superadmin_create_payment_gateway_subscription_table',1),(40,'2022_10_19_054759_superadmin_create_payment_transcations_table',1),(41,'2022_11_11_155206_superadmin_add_website_lang_in_companies_table',1),(42,'2022_11_22_130234_add_tax_number_in_users_table',1),(43,'2022_12_09_065955_add_created_by_column_in_users_table',1),(44,'2022_12_19_160559_add_white_label_complete_column_in_companies_table',1),(45,'2022_12_21_233823_add_mrp_column_in_order_items_table',1),(46,'2022_12_23_025823_superadmin_create_offline_payment_modes_table',1),(47,'2022_12_24_025123_superadmin_add_columns_in_payment_transcations_table',1),(48,'2023_02_10_084305_create_user_warehouse_table',1),(49,'2023_06_06_042524_change_date_to_datetime_in_expenses_and_payments_table',1),(50,'2023_06_16_050954_add_tax_type_coloumn_in_taxes_table',1),(51,'2023_06_23_081313_create_order_item_taxes_table',1),(52,'2023_06_23_091909_create_variations_table',1),(53,'2023_06_29_072334_supeadmin_create_email_queries_table',1),(54,'2023_09_02_075509_superadmin_add_stripe_column_in_companies_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_payment_modes`
--

DROP TABLE IF EXISTS `offline_payment_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_payment_modes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_payment_modes`
--

LOCK TABLES `offline_payment_modes` WRITE;
/*!40000 ALTER TABLE `offline_payment_modes` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_payment_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_custom_fields`
--

DROP TABLE IF EXISTS `order_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_custom_fields_order_id_foreign` (`order_id`),
  CONSTRAINT `order_custom_fields_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_custom_fields`
--

LOCK TABLES `order_custom_fields` WRITE;
/*!40000 ALTER TABLE `order_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_taxes`
--

DROP TABLE IF EXISTS `order_item_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_amount` double NOT NULL,
  `tax_rate` double(8,2) NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_item_taxes_order_id_foreign` (`order_id`),
  KEY `order_item_taxes_order_item_id_foreign` (`order_item_id`),
  KEY `order_item_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `order_item_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_taxes_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_taxes`
--

LOCK TABLES `order_item_taxes` WRITE;
/*!40000 ALTER TABLE `order_item_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `unit_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` double(8,2) NOT NULL,
  `mrp` double DEFAULT NULL,
  `unit_price` double NOT NULL,
  `single_unit_price` double NOT NULL,
  `tax_id` bigint(20) unsigned DEFAULT NULL,
  `tax_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_rate` double(8,2) DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_user_id_foreign` (`user_id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_unit_id_foreign` (`unit_id`),
  KEY `order_items_tax_id_foreign` (`tax_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payments`
--

DROP TABLE IF EXISTS `order_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `payment_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payments_payment_id_foreign` (`payment_id`),
  KEY `order_payments_order_id_foreign` (`order_id`),
  KEY `order_payments_company_id_foreign` (`company_id`),
  CONSTRAINT `order_payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_payments_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payments`
--

LOCK TABLES `order_payments` WRITE;
/*!40000 ALTER TABLE `order_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shipping_address`
--

DROP TABLE IF EXISTS `order_shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_shipping_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shipping_address_order_id_foreign` (`order_id`),
  KEY `order_shipping_address_company_id_foreign` (`company_id`),
  CONSTRAINT `order_shipping_address_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_shipping_address_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shipping_address`
--

LOCK TABLES `order_shipping_address` WRITE;
/*!40000 ALTER TABLE `order_shipping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `unique_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sales',
  `order_date` datetime NOT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `from_warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `tax_id` bigint(20) unsigned DEFAULT NULL,
  `tax_rate` double(8,2) DEFAULT NULL,
  `tax_amount` double NOT NULL DEFAULT 0,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `due_amount` double NOT NULL DEFAULT 0,
  `order_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_user_id` bigint(20) unsigned DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `total_items` double(8,2) NOT NULL DEFAULT 0.00,
  `total_quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `terms_condition` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deletable` tinyint(1) NOT NULL DEFAULT 1,
  `cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_warehouse_id_foreign` (`warehouse_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_tax_id_foreign` (`tax_id`),
  KEY `orders_staff_user_id_foreign` (`staff_user_id`),
  KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  KEY `orders_from_warehouse_id_foreign` (`from_warehouse_id`),
  KEY `orders_company_id_foreign` (`company_id`),
  CONSTRAINT `orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_from_warehouse_id_foreign` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_staff_user_id_foreign` FOREIGN KEY (`staff_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_modes`
--

DROP TABLE IF EXISTS `payment_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_modes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'bank',
  `credentials` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_modes_company_id_foreign` (`company_id`),
  CONSTRAINT `payment_modes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
INSERT INTO `payment_modes` VALUES (1,1,'Cash','cash',NULL,'2024-05-09 07:48:27','2024-05-09 07:48:27');
/*!40000 ALTER TABLE `payment_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transcations`
--

DROP TABLE IF EXISTS `payment_transcations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transcations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `subscription_plan_id` bigint(20) unsigned NOT NULL,
  `paid_on` datetime DEFAULT NULL,
  `next_payment_date` date DEFAULT NULL,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transcation_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` double(8,2) DEFAULT 0.00,
  `plan_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proof_document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_by_id` bigint(20) unsigned DEFAULT NULL,
  `offline_payment_mode_id` bigint(20) unsigned DEFAULT NULL,
  `is_offline_request` tinyint(1) NOT NULL DEFAULT 0,
  `submit_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_transcations_company_id_foreign` (`company_id`),
  KEY `payment_transcations_subscription_plan_id_foreign` (`subscription_plan_id`),
  KEY `payment_transcations_submitted_by_id_foreign` (`submitted_by_id`),
  KEY `payment_transcations_offline_payment_mode_id_foreign` (`offline_payment_mode_id`),
  CONSTRAINT `payment_transcations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_transcations_offline_payment_mode_id_foreign` FOREIGN KEY (`offline_payment_mode_id`) REFERENCES `offline_payment_modes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payment_transcations_submitted_by_id_foreign` FOREIGN KEY (`submitted_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payment_transcations_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transcations`
--

LOCK TABLES `payment_transcations` WRITE;
/*!40000 ALTER TABLE `payment_transcations` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transcations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'out',
  `payment_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `unused_amount` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_mode_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `payment_receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_warehouse_id_foreign` (`warehouse_id`),
  KEY `payments_payment_mode_id_foreign` (`payment_mode_id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_staff_user_id_foreign` (`staff_user_id`),
  KEY `payments_company_id_foreign` (`company_id`),
  CONSTRAINT `payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payments_payment_mode_id_foreign` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payments_staff_user_id_foreign` FOREIGN KEY (`staff_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payments_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'brands_view','Brand View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(2,'brands_create','Brand Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(3,'brands_edit','Brand Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(4,'brands_delete','Brand Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(5,'categories_view','Category View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(6,'categories_create','Category Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(7,'categories_edit','Category Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(8,'categories_delete','Category Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(9,'products_view','Product View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(10,'products_create','Product Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(11,'products_edit','Product Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(12,'products_delete','Product Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(13,'variations_view','Variation View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(14,'variations_create','Variation Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(15,'variations_edit','Variation Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(16,'variations_delete','Variation Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(17,'purchases_view','Purchase View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(18,'purchases_create','Purchase Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(19,'purchases_edit','Purchase Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(20,'purchases_delete','Purchase Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(21,'purchase_returns_view','Purchase Return View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(22,'purchase_returns_create','Purchase Return Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(23,'purchase_returns_edit','Purchase Return Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(24,'purchase_returns_delete','Purchase Return Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(25,'payment_out_view','Payment Out View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(26,'payment_out_create','Payment Out Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(27,'payment_out_edit','Payment Out Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(28,'payment_out_delete','Payment Out Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(29,'payment_in_view','Payment In View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(30,'payment_in_create','Payment In Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(31,'payment_in_edit','Payment In Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(32,'payment_in_delete','Payment In Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(33,'sales_view','Sales View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(34,'sales_create','Sales Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(35,'sales_edit','Sales Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(36,'sales_delete','Sales Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(37,'sales_returns_view','Sales Return View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(38,'sales_returns_create','Sales Return Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(39,'sales_returns_edit','Sales Return Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(40,'sales_returns_delete','Sales Return Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(41,'order_payments_view','Order Payments View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(42,'order_payments_create','Order Payments Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(43,'stock_adjustments_view','Stock Adjustment View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(44,'stock_adjustments_create','Stock Adjustment Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(45,'stock_adjustments_edit','Stock Adjustment Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(46,'stock_adjustments_delete','Stock Adjustment Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(47,'stock_transfers_view','Stock Transfer View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(48,'stock_transfers_create','Stock Transfer Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(49,'stock_transfers_edit','Stock Transfer Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(50,'stock_transfers_delete','Stock Transfer Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(51,'quotations_view','Quotation View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(52,'quotations_create','Quotation Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(53,'quotations_edit','Quotation Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(54,'quotations_delete','Quotation Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(55,'expense_categories_view','Expense Category View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(56,'expense_categories_create','Expense Category Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(57,'expense_categories_edit','Expense Category Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(58,'expense_categories_delete','Expense Category Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(59,'expenses_view','Expense View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(60,'expenses_create','Expense Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(61,'expenses_edit','Expense Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(62,'expenses_delete','Expense Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(63,'units_view','Unit View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(64,'units_create','Unit Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(65,'units_edit','Unit Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(66,'units_delete','Unit Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(67,'custom_fields_view','Custom Field View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(68,'custom_fields_create','Custom Field Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(69,'custom_fields_edit','Custom Field Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(70,'custom_fields_delete','Custom Field Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(71,'payment_modes_view','Payment Mode View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(72,'payment_modes_create','Payment Mode Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(73,'payment_modes_edit','Payment Mode Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(74,'payment_modes_delete','Payment Mode Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(75,'currencies_view','Currency View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(76,'currencies_create','Currency Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(77,'currencies_edit','Currency Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(78,'currencies_delete','Currency Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(79,'taxes_view','Tax View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(80,'taxes_create','Tax Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(81,'taxes_edit','Tax Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(82,'taxes_delete','Tax Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(83,'modules_view','Modules View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(84,'roles_view','Role View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(85,'roles_create','Role Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(86,'roles_edit','Role Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(87,'roles_delete','Role Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(88,'warehouses_view','Warehouse View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(89,'warehouses_create','Warehouse Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(90,'warehouses_edit','Warehouse Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(91,'warehouses_delete','Warehouse Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(92,'companies_edit','Company Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(93,'translations_view','Translation View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(94,'translations_create','Translation Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(95,'translations_edit','Translation Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(96,'translations_delete','Translation Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(97,'users_view','Staff Member View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(98,'users_create','Staff Member Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(99,'users_edit','Staff Member Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(100,'users_delete','Staff Member Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(101,'customers_view','Customer View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(102,'customers_create','Customer Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(103,'customers_edit','Customer Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(104,'customers_delete','Customer Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(105,'suppliers_view','Supplier View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(106,'suppliers_create','Supplier Create',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(107,'suppliers_edit','Supplier Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(108,'suppliers_delete','Supplier Delete',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(109,'storage_edit','Storage Settings Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(110,'email_edit','Email Settings Edit',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(111,'pos_view','POS View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(112,'update_app','Update App',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18'),(113,'cash_bank_view','Cash & Bank View',NULL,NULL,'2024-05-09 07:43:18','2024-05-09 07:43:18');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_custom_fields`
--

DROP TABLE IF EXISTS `product_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_custom_fields_product_id_foreign` (`product_id`),
  KEY `product_custom_fields_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `product_custom_fields_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_custom_fields_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_custom_fields`
--

LOCK TABLES `product_custom_fields` WRITE;
/*!40000 ALTER TABLE `product_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `current_stock` double(8,2) NOT NULL DEFAULT 0.00,
  `mrp` double DEFAULT NULL,
  `purchase_price` double NOT NULL,
  `sales_price` double NOT NULL,
  `tax_id` bigint(20) unsigned DEFAULT NULL,
  `purchase_tax_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'exclusive',
  `sales_tax_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'exclusive',
  `stock_quantitiy_alert` int(11) DEFAULT NULL,
  `opening_stock` int(11) DEFAULT NULL,
  `opening_stock_date` date DEFAULT NULL,
  `wholesale_price` double DEFAULT NULL,
  `wholesale_quantity` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_details_product_id_foreign` (`product_id`),
  KEY `product_details_warehouse_id_foreign` (`warehouse_id`),
  KEY `product_details_tax_id_foreign` (`tax_id`),
  CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_details_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_details_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `variant_id` bigint(20) unsigned DEFAULT NULL,
  `variant_value_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_product_id_foreign` (`product_id`),
  KEY `product_variants_variant_id_foreign` (`variant_id`),
  KEY `product_variants_variant_value_id_foreign` (`variant_value_id`),
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_variants_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_variants_variant_value_id_foreign` FOREIGN KEY (`variant_value_id`) REFERENCES `variations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `product_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'single',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `parent_item_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `unit_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_unit_id_foreign` (`unit_id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_company_id_foreign` (`company_id`),
  KEY `products_warehouse_id_foreign` (`warehouse_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_company_id_foreign` (`company_id`),
  CONSTRAINT `roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'admin','Admin','Admin is allowed to manage everything of the app.',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `setting_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_company_id_foreign` (`company_id`),
  CONSTRAINT `settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,0,1,'storage','Local','local','[]',NULL,1,0,NULL,NULL),(2,0,1,'storage','AWS','aws','{\"driver\":\"s3\",\"key\":\"\",\"secret\":\"\",\"region\":\"\",\"bucket\":\"\"}',NULL,0,0,NULL,NULL),(3,0,1,'email','SMTP','smtp','{\"from_name\":\"\",\"from_email\":\"\",\"host\":\"\",\"port\":\"\",\"encryption\":\"\",\"username\":\"\",\"password\":\"\"}',NULL,0,0,NULL,NULL),(4,0,1,'send_mail_settings','Send mail to warehouse','warehouse','[]',NULL,0,0,NULL,NULL),(5,0,1,'shortcut_menus','Add Menu','shortcut_menus','[\"staff_member\",\"customer\",\"supplier\",\"brand\",\"category\",\"product\",\"purchase\",\"sales\",\"expense_category\",\"expense\",\"warehouse\",\"currency\",\"unit\",\"language\",\"role\",\"tax\",\"payment_mode\"]',NULL,1,0,NULL,NULL),(6,1,2,'website_settings','Website Settings','en','{\"lang_key\":\"en\",\"app_name\":\"Stockifly SAAS\",\"header_logo\":\"website_onrfwiwasmjtqiezpe0v.png\",\"header_logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_onrfwiwasmjtqiezpe0v.png\",\"header_sidebar_logo\":\"website_r4ykpmmpmm3jw6bcyfdl.png\",\"header_sidebar_logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_r4ykpmmpmm3jw6bcyfdl.png\",\"home_text\":\"Home\",\"features_text\":\"Features\",\"pricing_text\":\"Pricing\",\"contact_text\":\"Contact\",\"register_text\":\"Register\",\"login_button_show\":\"1\",\"login_button_text\":\"Login\",\"register_button_show\":\"1\",\"register_button_text\":\"Register\",\"header_title\":\"Billing & Inventory Management with POS and Online Store\",\"header_sub_title\":\"Manage Your inventory In Easy Way\",\"header_description\":\"Best-rated  billing and inventory management application for small to large scale business. It\\u2019s built using Vue and Laravel. Stockifly have all major features related to inventory  managed to improve your business growth\",\"header_button1_show\":\"1\",\"header_button1_text\":\"Start Free Trail\",\"header_button1_url\":\"https:\\/\\/saas.stockifly.in\\/register\",\"header_button2_show\":\"1\",\"header_button2_text\":\"Explore All Features\",\"header_button2_url\":\"https:\\/\\/saas.stockifly.in\\/features\",\"header_features\":[\"No hidden fees\",\"Start with a free account\",\"Edit online, no software needed\",\"Multiple Language Support\",\"Safe and Secure\"],\"header_background_image\":\"website_nq7ee8hmgiuyvzdseeu9.png\",\"header_background_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_nq7ee8hmgiuyvzdseeu9.png\",\"header_client_show\":\"0\",\"header_client_image\":\"\",\"header_client_image_url\":\"\",\"header_client_name\":\"Denny Jones, founder of Growthio\",\"header_client_text\":\"\\u201cYou made it so simple. My new team is so much faster and easier to work with than my old site. I just choose the page, make the change.\\u201d\",\"contact_details\":\"Contact Details\",\"contact_title\":\"Get connected\",\"contact_description\":\"Lorem ipsum dolor sit amet, to the con adipiscing. Volutpat tempor to the condimentum vitae vel purus.\",\"contact_email_text\":\"Send Email\",\"contact_phone_text\":\"Call Us\",\"contact_address_text\":\"Address\",\"contact_email\":\"contact@stockifly.com\",\"contact_phone\":\"123456789\",\"contact_address\":\"1 Stree City State Country TN, 38401\",\"contact_form_title\":\"Get connected\",\"contact_form_description\":\"Contact Us\",\"contact_form_heading\":\"Send us a message to know more about us or just chit-chat.\",\"contact_form_name_text\":\"Name\",\"contact_form_email_text\":\"Email\",\"contact_form_message_text\":\"Message\",\"contact_form_send_message_text\":\"Send Message\",\"contact_form_background_image\":\"website_p5sbnqcicgxxnyj2zogs.jpeg\",\"contact_form_background_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_p5sbnqcicgxxnyj2zogs.jpeg\",\"contact_us_submit_message_text\":\"Thanks for contacting us. We will catch you soon.\",\"register_title\":\"Join Stockifly for free\",\"register_description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Malesuada tellus vestibulum, commodo pulvinar.\",\"register_background\":\"website_xk2pcyjxncee3duknp26.svg\",\"register_background_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_xk2pcyjxncee3duknp26.svg\",\"register_company_name_text\":\"Company Name\",\"register_email_text\":\"Email\",\"register_password_text\":\"Password\",\"register_confirm_password_text\":\"Confirm Passwrod\",\"register_submit_button_text\":\"SIGN UP FOR Free\",\"register_agree_text\":\"I agree to the Terms & Conditions of Stockifly\",\"register_agree_url\":\"I agree to the Terms & Conditions of Stockifly\",\"error_contact_support\":\"Some error occurred when inserting the data. Please try again or contact support\",\"register_success_text\":\"Thank you for registration. Please login to get started\",\"call_to_action_title\":\"Connect with experts\",\"call_to_action_description\":\"Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim.\",\"call_to_action_widgets\":[{\"title\":\"Successful Projects\",\"value\":\"195+\"},{\"title\":\"Experienced Experts\",\"value\":\"23 years\"},{\"title\":\"Success Rate\",\"value\":\"98.99%\"}],\"call_to_action_no_email_sell_text\":\"We don\\u2019t share or sell your email address publicly\",\"call_to_action_email_text\":\"Enter email to get started\",\"call_to_action_submit_button_text\":\"Join Now\",\"feature_title\":\"Features which will increase your business growth and increase your business profit...\",\"feature_description\":\"Great & Powerful Features\",\"home_feature_points\":[\"Accounting Management\",\"Billing Management\",\"Multiple Warehouses\",\"Product Management\",\"Stock Management\",\"POS\",\"Online Stores\",\"Expenses\",\"Users\",\"Roles\",\"Permissions\",\"Reports\",\"Multi Languages\",\"Invoices\",\"Payment In\",\"Taxes\",\"Units\",\"Currencies\",\"Payment Modes\",\"Suppliers\",\"Customers\"],\"price_title\":\"Choose a Plan\",\"price_description\":\"Manage your projects and your talent in a single system, resulting in empowered teams.\",\"price_card_title\":\"Trusted by secure payment service\",\"pricing_free_text\":\"Free\",\"pricing_no_card_text\":\"No credit card required\",\"pricing_billed_monthly_text\":\"Billed Monthly\",\"pricing_billed_yearly_text\":\"Billed Yearly\",\"pricing_monthly_text\":\"Monthly\",\"pricing_yearly_text\":\"Yearly\",\"pricing_month_text\":\"month\",\"pricing_year_text\":\"year\",\"pricing_get_started_button_text\":\"Get Started Now\",\"most_popular_image\":\"website_clesobqaxv8w3xatjdpm.png\",\"most_popular_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_clesobqaxv8w3xatjdpm.png\",\"testimonial_title\":\"Loved by Many Business Across The World\",\"testimonial_description\":\"\",\"favourite_apps_title\":\"\",\"favourite_apps_description\":\"\",\"faq_sub_title\":\"HAVE ANY QUESTIONS?\",\"faq_title\":\"Frequently Asked Questions\",\"faq_still_have_question_text\":\"Still have any questions?\",\"faq_contact_us_text\":\"Contact Us\",\"faq_background_image\":\"website_6nqk1wjfnphw5gyrc5md.svg\",\"faq_background_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_6nqk1wjfnphw5gyrc5md.svg\",\"client_title\":\"Trusted by Companies around the World\",\"client_description\":\"Vetted by leaders within the Meat Processing Industry.\",\"footer_description\":\"Don\'t hesitate, Our experts will show you how our application can streamline the way your team works.\",\"footer_copyright_text\":\"Copyright 2021 @ Stockifly, All rights reserved\",\"footer_logo\":\"website_jazw9qtjklv4ohh7q9fd.png\",\"footer_logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_jazw9qtjklv4ohh7q9fd.png\",\"footer_links_text\":\"Links\",\"footer_pages_text\":\"Pages\",\"footer_contact_us_text\":\"Contact Us\",\"facebook_url\":\"#\",\"twitter_url\":\"#\",\"linkedin_url\":\"#\",\"instagram_url\":\"#\",\"youtube_url\":\"#\"}',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(7,1,2,'website_clients','Website Clients Settings','en','[{\"id\":\"1hexby4e6ap\",\"name\":\"Client 1\",\"logo\":\"website_u4ung1evutmg2dwo1ufu.png\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_u4ung1evutmg2dwo1ufu.png\"},{\"id\":\"2hexby4e6ap\",\"name\":\"Client 2\",\"logo\":\"website_igdjafcxhacqpfmdkrwm.png\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_igdjafcxhacqpfmdkrwm.png\"},{\"id\":\"3hexby4e6ap\",\"name\":\"Client 3\",\"logo\":\"website_qtjysnlaub9pk6r2k4aw.png\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_qtjysnlaub9pk6r2k4aw.png\"},{\"id\":\"4hexby4e6ap\",\"name\":\"Client 4\",\"logo\":\"website_sxskjzwysg6mmlzjjhi5.png\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_sxskjzwysg6mmlzjjhi5.png\"},{\"id\":\"5hexby4e6ap\",\"name\":\"Client 5\",\"logo\":\"website_f6maqhagg70vfhg5bt56.png\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_f6maqhagg70vfhg5bt56.png\"}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(8,1,2,'header_features','Header Features','en','[{\"id\":\"21hexby4e6ap\",\"name\":\"Reports\",\"description\":\"All Business Reports\",\"image\":\"website_osxd8td7yropdc1zqiab.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_osxd8td7yropdc1zqiab.png\"},{\"id\":\"22hexby4e6ap\",\"name\":\"Units\",\"description\":\"Manage Multi Units\",\"image\":\"website_4d3qmboclpmif7mishbg.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_4d3qmboclpmif7mishbg.png\"},{\"id\":\"23hexby4e6ap\",\"name\":\"Taxes\",\"description\":\"Create Taxes On Demand\",\"image\":\"website_jah8jlamrepyhftea6gl.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_jah8jlamrepyhftea6gl.png\"},{\"id\":\"24hexby4e6ap\",\"name\":\"Multi Users\",\"description\":\"Staff, Customers, Suppliers\",\"image\":\"website_qgny179no4wq6hfmhmgs.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_qgny179no4wq6hfmhmgs.png\"},{\"id\":\"25hexby4e6ap\",\"name\":\"Expense Management\",\"description\":\"Manage Your Expenses\",\"image\":\"website_ezyntikwghro0phnzacj.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_ezyntikwghro0phnzacj.png\"},{\"id\":\"26hexby4e6ap\",\"name\":\"POS\",\"description\":\"Simple But Effective POS\",\"image\":\"website_pnomguirqhunrq9hn7o2.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_pnomguirqhunrq9hn7o2.png\"},{\"id\":\"27hexby4e6ap\",\"name\":\"Multi Languages\",\"description\":\"Multi Languages Support\",\"image\":\"website_ir3byphfcg6u0yq9yotm.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_ir3byphfcg6u0yq9yotm.png\"},{\"id\":\"28hexby4e6ap\",\"name\":\"Multi Warehouse\\/Store\",\"description\":\"Manage Multiple Stores\",\"image\":\"website_roviquvyjyprsjg9vhsw.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_roviquvyjyprsjg9vhsw.png\"}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(9,1,2,'features_page','Features Page','en','[{\"id\":\"pu6o43vpo9\",\"title\":\"Accounting & Billing\",\"description\":\"It is a long established fact that a reader will\",\"features\":[{\"id\":\"b5e58xp1h6m\",\"title\":\"Payments In \\/ Out\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha\",\"image\":\"website_dgzeoaztuacepf2cnz7r.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_dgzeoaztuacepf2cnz7r.png\"},{\"id\":\"omlc24r338\",\"title\":\"Expenses\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha\",\"image\":\"website_umy0jlxqfhcxjd2j6uek.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_umy0jlxqfhcxjd2j6uek.png\"},{\"id\":\"musykhbq37\",\"title\":\"Cash & Bank\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha\",\"image\":\"website_x1q094qrxffantpaqfwt.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_x1q094qrxffantpaqfwt.png\"}]},{\"id\":\"uz2fpijzmk\",\"title\":\"Inventory Management\",\"description\":\"Mange your stock and manage your inventory\",\"features\":[{\"id\":\"gki0xl9xwl\",\"title\":\"Purchase, Sales and Returns\",\"description\":\"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,\",\"image\":\"website_d7z5w6myjjfengk0dxgw.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_d7z5w6myjjfengk0dxgw.png\"},{\"id\":\"8y1suzijyb\",\"title\":\"POS\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha\",\"image\":\"website_oyjswztfteqpyfuppads.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_oyjswztfteqpyfuppads.png\"},{\"id\":\"bsfitmrezvu\",\"title\":\"Stock Transfer\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha\",\"image\":\"website_sicmupgrzuaiaehrlgqv.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_sicmupgrzuaiaehrlgqv.png\"}]},{\"id\":\"u5kx5li1zwk\",\"title\":\"Product Management\",\"description\":\"Manage your business products, brands, categories in simple and easy steps\",\"features\":[{\"id\":\"app8vxzlk3\",\"title\":\"Product Management\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha\",\"image\":\"website_ctwdrplxv2ubpyhfrno5.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_ctwdrplxv2ubpyhfrno5.png\"},{\"id\":\"gkmyw3ppqxv\",\"title\":\"Brand Management\",\"description\":\"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,\",\"image\":\"website_r7t5ahprkcgaqcudsyoo.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_r7t5ahprkcgaqcudsyoo.png\"},{\"id\":\"91hq9yjf38\",\"title\":\"Category Management\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha\",\"image\":\"website_zh3vzylsdy1bfvcmlrvf.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_zh3vzylsdy1bfvcmlrvf.png\"}]}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(10,1,2,'website_testimonials','Website Testimonials Settings','en','[{\"id\":\"jbcfuvor1ef\",\"name\":\"Mitch\",\"image\":\"website_umglm6u0pifn4djq1z0e.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_umglm6u0pifn4djq1z0e.png\",\"comment\":\"The easy of the Stockifly software allowed me to migrate out current workflow into the system along with train our employees without hardship.\",\"rating\":5},{\"id\":\"8i20kbnxkrh\",\"name\":\"Aaron\",\"image\":\"website_yclshvui5dn2wmq2lidu.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_yclshvui5dn2wmq2lidu.png\",\"comment\":\"Leveraging modern technology and passion for supporting local Ag, Stockifly is the next evolutionary stage in the procurement of software to streamline workflow for processors.\",\"rating\":5},{\"id\":\"y8h9ukt9fxm\",\"name\":\"William\",\"image\":\"website_zt0jcb4tkeqxaklrqob4.png\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_zt0jcb4tkeqxaklrqob4.png\",\"comment\":\"Having the ability to streamline my teams from processing to retail with one system has changed the way we do business.\",\"rating\":5}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(11,1,2,'website_features','Website Features Settings','en','[{\"id\":\"8jzmhcpnshn\",\"title\":\"Multiple Warehouse \\/ Shopes\",\"description\":\"Manage your multiple store or warehouse. You can directly receive your warehouse order from online url.\",\"image\":\"website_rrydgq523mum7ii2u4of.webp\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_rrydgq523mum7ii2u4of.webp\",\"features\":[\"Add Multiple Stores\",\"Powerful Dashboard According To Stores\",\"Filter Purchases, Sales, Returns, Expenses According To Stores\",\"Receive Online Order From Multiple Stores\"]},{\"id\":\"k8u7cwrwnt\",\"title\":\"Inventory \\/ Stock Management\",\"description\":\"Now manage your stock purchase, sales, sales return, and purchase returns in easy steps... Also record your payment in and out so that you can find your profit and loss...\",\"image\":\"website_4hooep1ngw7ezbvyxmyw.webp\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_4hooep1ngw7ezbvyxmyw.webp\",\"features\":[\"Purchase, Sales, Sales Return, Purchase Returns\",\"Manage Paid \\/ Due Amount For Your Customers And Suppliers\",\"Get Inventory Stock Details\",\"Sales Products Using POS\"]},{\"id\":\"vfxekis7pcd\",\"title\":\"Powerful Reports System\",\"description\":\"Stockifly comes with powerful reporting tools which will help you to control your business. You can download reports in multiple formats so that you can use them later\",\"image\":\"website_qx3ee00qpexlljrersp4.webp\",\"image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_qx3ee00qpexlljrersp4.webp\",\"features\":[\"View Reports and Download Them\",\"Payment, User, Store Wise Reports\",\"Profit & Loss reports\",\"View Warehouse Reports Using FilterAnd Search\"]}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(12,1,2,'website_faqs','Website Faq Settings','en','[{\"id\":\"ly41sgvy9hh\",\"question\":\"Why do I need your software solutions?\",\"answer\":\"We love this question because it does two things: it allows you to tell people why they can benefit from SaaS, and it allows you to sell your services specifically. Notice that we don\\u2019t ask \\u201cif\\u201d people need SaaS,\"},{\"id\":\"uxt7phaojq\",\"question\":\"How can I check compatibility?\",\"answer\":\"Here\\u2019s a common logistics and tech issue: compatibility. People want to make sure that your software solutions are compatible with the tools that they already use. Some might be investing in a new tool and want to make sure it works with their existing SaaS solutions from you.\"},{\"id\":\"1z7cdfd25vz\",\"question\":\"What is Software-as-a-Service (SaaS)?\",\"answer\":\"This is always number one. So many people don\\u2019t understand SaaS or what it means to their business. Others just aren\\u2019t sure how it differs from a typical software product or company. There\\u2019s a lot to cover here, but even addressing the question shows your audience that you are ready to do so and be transparent about what you offer.\"}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(13,1,2,'pricing_cards','Pricing Cards','en','[{\"id\":\"1nv8m1ua7w4\",\"name\":\"itune\",\"logo\":\"website_wkrtqwt6xndjyqyn1hwe.svg\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_wkrtqwt6xndjyqyn1hwe.svg\"},{\"id\":\"bhxt4mzpgsq\",\"name\":\"amex\",\"logo\":\"website_qpqj0ndkodnlkwschfhr.svg\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_qpqj0ndkodnlkwschfhr.svg\"},{\"id\":\"ugxjxtffre\",\"name\":\"Visa\",\"logo\":\"website_wte2yems7ahxl2bqnmmx.svg\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_wte2yems7ahxl2bqnmmx.svg\"},{\"id\":\"aogu39r25jr\",\"name\":\"Stripe\",\"logo\":\"website_x16mxi6xbpfbqinkv2pq.svg\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_x16mxi6xbpfbqinkv2pq.svg\"},{\"id\":\"hojcguj4k9j\",\"name\":\"MasterCard\",\"logo\":\"website_7dxcjzr4drnjti3fuxzt.svg\",\"logo_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_7dxcjzr4drnjti3fuxzt.svg\"}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(14,1,2,'footer_pages','Footers Pages','en','[]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(15,1,2,'website_seo','SEO Details','en','[{\"id\":\"1jzmhcpnshn\",\"page_key\":\"home\",\"seo_title\":\"Home\",\"seo_author\":\"stockifly\",\"seo_keywords\":\"stockifly saas\",\"seo_description\":\"stockifly saas\",\"seo_image\":\"website_cldv2lidmrtm4uxqwz42.png\",\"seo_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_r4ykpmmpmm3jw6bcyfdl.png\"},{\"id\":\"2jzmhcpnshn\",\"page_key\":\"register\",\"seo_title\":\"Register\",\"seo_author\":\"stockifly\",\"seo_keywords\":\"register, stockifly\",\"seo_description\":\"stockifly saas register\",\"seo_image\":\"website_cldv2lidmrtm4uxqwz42.png\",\"seo_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_r4ykpmmpmm3jw6bcyfdl.png\"},{\"id\":\"3jzmhcpnshn\",\"page_key\":\"features\",\"seo_title\":\"Features\",\"seo_author\":\"stockifly\",\"seo_keywords\":\"features\",\"seo_description\":\"stockifly features page\",\"seo_image\":\"website_cldv2lidmrtm4uxqwz42.png\",\"seo_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_r4ykpmmpmm3jw6bcyfdl.png\"},{\"id\":\"4jzmhcpnshn\",\"page_key\":\"contact\",\"seo_title\":\"Contact Us\",\"seo_author\":\"stockifly\",\"seo_keywords\":\"contact us\",\"seo_description\":\"stockifly contact us page\",\"seo_image\":\"website_cldv2lidmrtm4uxqwz42.png\",\"seo_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_r4ykpmmpmm3jw6bcyfdl.png\"},{\"id\":\"5jzmhcpnshn\",\"page_key\":\"pricing\",\"seo_title\":\"Pricing\",\"seo_author\":\"stockifly\",\"seo_keywords\":\"pricing\",\"seo_description\":\"stockifly pricing page\",\"seo_image\":\"website_cldv2lidmrtm4uxqwz42.png\",\"seo_image_url\":\"https:\\/\\/saas.stockifly.in\\/uploads\\/website\\/website_r4ykpmmpmm3jw6bcyfdl.png\"}]',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(16,1,2,'payment_settings','Paypal Payment Settings','paypal','{\"paypal_client_id\":\"\",\"paypal_secret\":\"\",\"paypal_mode\":\"sandbox\",\"paypal_status\":\"inactive\"}',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(17,1,2,'payment_settings','Stripe Payment Settings','stripe','{\"stripe_api_key\":\"\",\"stripe_api_secret\":\"\",\"stripe_webhook_key\":\"\",\"stripe_status\":\"inactive\"}',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(18,1,2,'payment_settings','Razorpay Payment Settings','razorpay','{\"razorpay_key\":\"\",\"razorpay_secret\":\"\",\"razorpay_webhook_secret\":\"\",\"razorpay_status\":\"inactive\"}',NULL,1,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(19,1,2,'payment_settings','Paystack Payment Settings','paystack','{\"paystack_client_id\":\"\",\"paystack_secret\":\"\",\"paystack_merchant_email\":\"\",\"paystack_status\":\"inactive\"}',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(20,1,2,'payment_settings','Mollie Payment Settings','mollie','{\"mollie_api_key\":\"\",\"mollie_status\":\"inactive\"}',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(21,1,2,'payment_settings','Authorize Payment Settings','authorize','{\"authorize_api_login_id\":\"\",\"authorize_transaction_key\":\"\",\"authorize_signature_key\":\"\",\"authorize_environment\":\"sandbox\",\"authorize_status\":\"inactive\"}',NULL,0,0,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(22,0,1,'email_templates','Stock adjustment created','stock_adjustment_create','{\"title\":\"Stock adjustment created\",\"content\":\"Stock adjustment created by ##staff_member_name## for warehouse ##warehouse_name## for product ##product_name## with ##stock_adjustment_quantity## (##stock_adjustment_type##) quantity\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(23,0,1,'email_templates','Stock adjustment updated','stock_adjustment_update','{\"title\":\"Stock adjustment updated\",\"content\":\"Stock adjustment updated by ##staff_member_name## for warehouse ##warehouse_name## for product ##product_name## with ##stock_adjustment_quantity## (##stock_adjustment_type##) quantity\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(24,0,1,'email_templates','Stock adjustment deleted','stock_adjustment_delete','{\"title\":\"Stock adjustment deleted\",\"content\":\"Stock adjustment deleted by ##staff_member_name## for warehouse ##warehouse_name## for product ##product_name## with ##stock_adjustment_quantity## (##stock_adjustment_type##) quantity\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(25,0,1,'email_templates','Staff Member created','staff_member_create','{\"title\":\"Staff Member created\",\"content\":\"A new staff Member added with ##staff_member_name## name in your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(26,0,1,'email_templates','Staff Member updated','staff_member_update','{\"title\":\"Staff Member updated\",\"content\":\"Staff Member with name ##staff_member_name## updated in your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(27,0,1,'email_templates','Staff Member deleted','staff_member_delete','{\"title\":\"Staff Member deleted\",\"content\":\"Staff member with name ##staff_member_name## deleted from your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(28,0,1,'email_templates','Purchase created','purchases_create','{\"title\":\"Purchase created\",\"content\":\"A new purhcase added by ##staff_member_name## in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(29,0,1,'email_templates','Purchase updated','purchases_update','{\"title\":\"Purchase updated\",\"content\":\"Purchase with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(30,0,1,'email_templates','Purchase deleted','purchases_delete','{\"title\":\"Purchase deleted\",\"content\":\"Purchase with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(31,0,1,'email_templates','Purchase created','purchase_returns_create','{\"title\":\"Purchase created\",\"content\":\"A new purhcase return added by ##staff_member_name## in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(32,0,1,'email_templates','Purchase updated','purchase_returns_update','{\"title\":\"Purchase updated\",\"content\":\"Purchase return with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(33,0,1,'email_templates','Purchase return deleted','purchase_returns_delete','{\"title\":\"Purchase return deleted\",\"content\":\"Purchase return with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(34,0,1,'email_templates','Sales created','sales_create','{\"title\":\"Sales created\",\"content\":\"A new sales added by ##staff_member_name## name in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(35,0,1,'email_templates','Sales updated','sales_update','{\"title\":\"Sales updated\",\"content\":\"Sales with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(36,0,1,'email_templates','Sales deleted','sales_delete','{\"title\":\"Sales deleted\",\"content\":\"Sales with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(37,0,1,'email_templates','Sales return created','sales_returns_create','{\"title\":\"Sales return created\",\"content\":\"A new sales return added by ##staff_member_name## in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(38,0,1,'email_templates','Sales return updated','sales_returns_update','{\"title\":\"Sales return updated\",\"content\":\"Sales return with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(39,0,1,'email_templates','Sales return deleted','sales_returns_delete','{\"title\":\"Sales return deleted\",\"content\":\"Sales return with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(40,0,1,'email_templates','Quotations created','quotations_create','{\"title\":\"Quotations created\",\"content\":\"A new quotations added by ##staff_member_name## name in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(41,0,1,'email_templates','Quotations updated','quotations_update','{\"title\":\"Quotations updated\",\"content\":\"Quotations with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(42,0,1,'email_templates','Quotations deleted','quotations_delete','{\"title\":\"Quotations deleted\",\"content\":\"Quotations with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(43,0,1,'email_templates','Expense created','expense_create','{\"title\":\"Expense created\",\"content\":\"A new expense added by ##staff_member_name## in your warehouse ##warehouse_name## with amount ##expense_amount##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(44,0,1,'email_templates','Expense updated','expense_update','{\"title\":\"Expense updated\",\"content\":\"Expense updated by ##staff_member_name## in your warehouse ##warehouse_name## with amount ##expense_amount##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35'),(45,0,1,'email_templates','Expense deleted','expense_delete','{\"title\":\"Expense deleted\",\"content\":\"Expense deleted by ##staff_member_name## from your warehouse ##warehouse_name## with amount ##expense_amount##.\"}',NULL,0,0,'2024-05-09 07:43:35','2024-05-09 07:43:35');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustments`
--

DROP TABLE IF EXISTS `stock_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_adjustments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `adjustment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_adjustments_warehouse_id_foreign` (`warehouse_id`),
  KEY `stock_adjustments_product_id_foreign` (`product_id`),
  KEY `stock_adjustments_created_by_foreign` (`created_by`),
  KEY `stock_adjustments_company_id_foreign` (`company_id`),
  CONSTRAINT `stock_adjustments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustments_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustments`
--

LOCK TABLES `stock_adjustments` WRITE;
/*!40000 ALTER TABLE `stock_adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_history`
--

DROP TABLE IF EXISTS `stock_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `old_quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `order_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'sales',
  `stock_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
  `action_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_history_warehouse_id_foreign` (`warehouse_id`),
  KEY `stock_history_product_id_foreign` (`product_id`),
  KEY `stock_history_created_by_foreign` (`created_by`),
  KEY `stock_history_company_id_foreign` (`company_id`),
  CONSTRAINT `stock_history_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_history_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_history_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_history_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_history`
--

LOCK TABLES `stock_history` WRITE;
/*!40000 ALTER TABLE `stock_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_product`),
  KEY `subscription_items_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_plans`
--

DROP TABLE IF EXISTS `subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_price` double NOT NULL DEFAULT 0,
  `monthly_price` double NOT NULL DEFAULT 0,
  `max_products` int(10) unsigned NOT NULL DEFAULT 0,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `billing_cycle` tinyint(4) DEFAULT NULL,
  `stripe_monthly_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_annual_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_monthly_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_annual_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_monthly_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_annual_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `duration` int(11) DEFAULT 30,
  `notify_before` int(11) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '$',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_plans`
--

LOCK TABLES `subscription_plans` WRITE;
/*!40000 ALTER TABLE `subscription_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `company_id` bigint(20) unsigned NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_company_id_foreign` (`company_id`),
  CONSTRAINT `subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'single',
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_company_id_foreign` (`company_id`),
  KEY `taxes_parent_id_foreign` (`parent_id`),
  CONSTRAINT `taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `taxes_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` bigint(20) unsigned DEFAULT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_lang_id_foreign` (`lang_id`),
  CONSTRAINT `translations_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,1,'common','enabled','Enabled','2024-05-09 07:43:10','2024-05-09 07:43:10'),(2,1,'common','disabled','Disabled','2024-05-09 07:43:10','2024-05-09 07:43:10'),(3,1,'common','id','Id','2024-05-09 07:43:10','2024-05-09 07:43:10'),(4,1,'common','action','Action','2024-05-09 07:43:10','2024-05-09 07:43:10'),(5,1,'common','placeholder_default_text','Please Enter {0}','2024-05-09 07:43:10','2024-05-09 07:43:10'),(6,1,'common','placeholder_social_text','Please Enter {0} Url','2024-05-09 07:43:10','2024-05-09 07:43:10'),(7,1,'common','placeholder_search_text','Search By {0}','2024-05-09 07:43:10','2024-05-09 07:43:10'),(8,1,'common','select_default_text','Select {0}...','2024-05-09 07:43:10','2024-05-09 07:43:10'),(9,1,'common','create','Create','2024-05-09 07:43:10','2024-05-09 07:43:10'),(10,1,'common','edit','Edit','2024-05-09 07:43:10','2024-05-09 07:43:10'),(11,1,'common','update','Update','2024-05-09 07:43:10','2024-05-09 07:43:10'),(12,1,'common','cancel','Cancel','2024-05-09 07:43:10','2024-05-09 07:43:10'),(13,1,'common','delete','Delete','2024-05-09 07:43:10','2024-05-09 07:43:10'),(14,1,'common','success','Success','2024-05-09 07:43:10','2024-05-09 07:43:10'),(15,1,'common','error','Error','2024-05-09 07:43:10','2024-05-09 07:43:10'),(16,1,'common','yes','Yes','2024-05-09 07:43:10','2024-05-09 07:43:10'),(17,1,'common','no','No','2024-05-09 07:43:10','2024-05-09 07:43:10'),(18,1,'common','fix_errors','Please Fix Below Errors.','2024-05-09 07:43:10','2024-05-09 07:43:10'),(19,1,'common','cancelled','Cancelled','2024-05-09 07:43:10','2024-05-09 07:43:10'),(20,1,'common','pending','Pending','2024-05-09 07:43:10','2024-05-09 07:43:10'),(21,1,'common','paid','Paid','2024-05-09 07:43:10','2024-05-09 07:43:10'),(22,1,'common','completed','Completed','2024-05-09 07:43:10','2024-05-09 07:43:10'),(23,1,'common','save','Save','2024-05-09 07:43:10','2024-05-09 07:43:10'),(24,1,'common','all','All','2024-05-09 07:43:10','2024-05-09 07:43:10'),(25,1,'common','name','Name','2024-05-09 07:43:10','2024-05-09 07:43:10'),(26,1,'common','back','Back','2024-05-09 07:43:10','2024-05-09 07:43:10'),(27,1,'common','max_amount','Max. Amount','2024-05-09 07:43:10','2024-05-09 07:43:10'),(28,1,'common','date_time','Date Time','2024-05-09 07:43:10','2024-05-09 07:43:10'),(29,1,'common','select_time','Select Time','2024-05-09 07:43:10','2024-05-09 07:43:10'),(30,1,'common','start_date','Start Date','2024-05-09 07:43:10','2024-05-09 07:43:10'),(31,1,'common','end_date','End Date','2024-05-09 07:43:10','2024-05-09 07:43:10'),(32,1,'common','search','Search','2024-05-09 07:43:10','2024-05-09 07:43:10'),(33,1,'common','date','Date','2024-05-09 07:43:10','2024-05-09 07:43:10'),(34,1,'common','out_of_stock','Out Of Stock','2024-05-09 07:43:10','2024-05-09 07:43:10'),(35,1,'common','pay','Pay','2024-05-09 07:43:10','2024-05-09 07:43:10'),(36,1,'common','received','Received','2024-05-09 07:43:10','2024-05-09 07:43:10'),(37,1,'common','with_tax','With Tax','2024-05-09 07:43:10','2024-05-09 07:43:10'),(38,1,'common','without_tax','Without Tax','2024-05-09 07:43:10','2024-05-09 07:43:10'),(39,1,'common','invoice_number','Invoice Number','2024-05-09 07:43:10','2024-05-09 07:43:10'),(40,1,'common','ordered','Ordered','2024-05-09 07:43:10','2024-05-09 07:43:10'),(41,1,'common','confirmed','Confirmed','2024-05-09 07:43:10','2024-05-09 07:43:10'),(42,1,'common','processing','Processing','2024-05-09 07:43:10','2024-05-09 07:43:10'),(43,1,'common','shipping','Shipping','2024-05-09 07:43:10','2024-05-09 07:43:10'),(44,1,'common','delivered','Delivered','2024-05-09 07:43:10','2024-05-09 07:43:10'),(45,1,'common','confirm','Confirm','2024-05-09 07:43:10','2024-05-09 07:43:10'),(46,1,'common','title','Title','2024-05-09 07:43:10','2024-05-09 07:43:10'),(47,1,'common','value','Value','2024-05-09 07:43:10','2024-05-09 07:43:10'),(48,1,'common','add','Add','2024-05-09 07:43:10','2024-05-09 07:43:10'),(49,1,'common','view','View','2024-05-09 07:43:10','2024-05-09 07:43:10'),(50,1,'common','download','Download','2024-05-09 07:43:10','2024-05-09 07:43:10'),(51,1,'common','change_order_status','Change Order Status','2024-05-09 07:43:10','2024-05-09 07:43:10'),(52,1,'common','total','Total','2024-05-09 07:43:10','2024-05-09 07:43:10'),(53,1,'common','print_invoice','Print Invoice','2024-05-09 07:43:10','2024-05-09 07:43:10'),(54,1,'common','email','Email','2024-05-09 07:43:10','2024-05-09 07:43:10'),(55,1,'common','phone','Phone','2024-05-09 07:43:10','2024-05-09 07:43:10'),(56,1,'common','item','Item','2024-05-09 07:43:10','2024-05-09 07:43:10'),(57,1,'common','items','Items','2024-05-09 07:43:10','2024-05-09 07:43:10'),(58,1,'common','qty','Qty','2024-05-09 07:43:10','2024-05-09 07:43:10'),(59,1,'common','rate','Rate','2024-05-09 07:43:10','2024-05-09 07:43:10'),(60,1,'common','purchase_code','Purchase Code','2024-05-09 07:43:10','2024-05-09 07:43:10'),(61,1,'common','verify_purchase','Verify Purchase','2024-05-09 07:43:10','2024-05-09 07:43:10'),(62,1,'common','buy_now','Buy Now','2024-05-09 07:43:10','2024-05-09 07:43:10'),(63,1,'common','install','Install','2024-05-09 07:43:10','2024-05-09 07:43:10'),(64,1,'common','installing','Installing','2024-05-09 07:43:10','2024-05-09 07:43:10'),(65,1,'common','updating','Updating','2024-05-09 07:43:10','2024-05-09 07:43:10'),(66,1,'common','free','Free','2024-05-09 07:43:10','2024-05-09 07:43:10'),(67,1,'common','domain','Domain','2024-05-09 07:43:10','2024-05-09 07:43:10'),(68,1,'common','verify','Verify','2024-05-09 07:43:10','2024-05-09 07:43:10'),(69,1,'common','send','Send','2024-05-09 07:43:10','2024-05-09 07:43:10'),(70,1,'common','upload','Upload','2024-05-09 07:43:10','2024-05-09 07:43:10'),(71,1,'common','view_all','View All','2024-05-09 07:43:10','2024-05-09 07:43:10'),(72,1,'common','unpaid','Unpaid','2024-05-09 07:43:10','2024-05-09 07:43:10'),(73,1,'common','loading','Loading','2024-05-09 07:43:10','2024-05-09 07:43:10'),(74,1,'common','update_app','Update App','2024-05-09 07:43:10','2024-05-09 07:43:10'),(75,1,'common','welcome_back','Welcome {0}','2024-05-09 07:43:10','2024-05-09 07:43:10'),(76,1,'common','off','Off','2024-05-09 07:43:10','2024-05-09 07:43:10'),(77,1,'common','on_create','On Create','2024-05-09 07:43:10','2024-05-09 07:43:10'),(78,1,'common','on_update','On Update','2024-05-09 07:43:10','2024-05-09 07:43:10'),(79,1,'common','on_delete','On Delete','2024-05-09 07:43:10','2024-05-09 07:43:10'),(80,1,'common','demo_account_credentials','Demo account login credentials','2024-05-09 07:43:10','2024-05-09 07:43:10'),(81,1,'common','balance','Balance','2024-05-09 07:43:10','2024-05-09 07:43:10'),(82,1,'common','party','Party','2024-05-09 07:43:10','2024-05-09 07:43:10'),(83,1,'common','created_by','Created By','2024-05-09 07:43:10','2024-05-09 07:43:10'),(84,1,'common','import','Import','2024-05-09 07:43:10','2024-05-09 07:43:10'),(85,1,'common','file','File','2024-05-09 07:43:10','2024-05-09 07:43:10'),(86,1,'common','copy_url','Copy Url','2024-05-09 07:43:10','2024-05-09 07:43:10'),(87,1,'common','print','Print','2024-05-09 07:43:10','2024-05-09 07:43:10'),(88,1,'common','pdf','Pdf','2024-05-09 07:43:10','2024-05-09 07:43:10'),(89,1,'common','particulars','Particulars','2024-05-09 07:43:10','2024-05-09 07:43:10'),(90,1,'common','amount','Amount','2024-05-09 07:43:10','2024-05-09 07:43:10'),(91,1,'common','profit','Profit','2024-05-09 07:43:10','2024-05-09 07:43:10'),(92,1,'common','profit_reports_by_orders','Profit Reports By Orders','2024-05-09 07:43:10','2024-05-09 07:43:10'),(93,1,'common','profit_reports_by_payments','Profit Reports By Payments','2024-05-09 07:43:10','2024-05-09 07:43:10'),(94,1,'common','status','Status','2024-05-09 07:43:10','2024-05-09 07:43:10'),(95,1,'common','active','Active','2024-05-09 07:43:10','2024-05-09 07:43:10'),(96,1,'common','inactive','Inactive','2024-05-09 07:43:10','2024-05-09 07:43:10'),(97,1,'common','verified','Verified','2024-05-09 07:43:10','2024-05-09 07:43:10'),(98,1,'common','configure','Configure','2024-05-09 07:43:10','2024-05-09 07:43:10'),(99,1,'common','logo','Logo','2024-05-09 07:43:10','2024-05-09 07:43:10'),(100,1,'common','comment','Comment','2024-05-09 07:43:10','2024-05-09 07:43:10'),(101,1,'common','rating','Rating','2024-05-09 07:43:10','2024-05-09 07:43:10'),(102,1,'common','page_content','Page Content','2024-05-09 07:43:10','2024-05-09 07:43:10'),(103,1,'common','slug','Slug','2024-05-09 07:43:10','2024-05-09 07:43:10'),(104,1,'common','question','Question','2024-05-09 07:43:10','2024-05-09 07:43:10'),(105,1,'common','answer','Answer','2024-05-09 07:43:10','2024-05-09 07:43:10'),(106,1,'common','description','Description','2024-05-09 07:43:10','2024-05-09 07:43:10'),(107,1,'common','image','Image','2024-05-09 07:43:10','2024-05-09 07:43:10'),(108,1,'common','address','Address','2024-05-09 07:43:10','2024-05-09 07:43:10'),(109,1,'common','not_allowed','Not Allowed','2024-05-09 07:43:10','2024-05-09 07:43:10'),(110,1,'common','details','Details','2024-05-09 07:43:10','2024-05-09 07:43:10'),(111,1,'common','excel','Excel','2024-05-09 07:43:10','2024-05-09 07:43:10'),(112,1,'common','daily_income','Daily Income','2024-05-09 07:43:10','2024-05-09 07:43:10'),(113,1,'common','average_price','Average Price','2024-05-09 07:43:10','2024-05-09 07:43:10'),(114,1,'common','module','Module','2024-05-09 07:43:10','2024-05-09 07:43:10'),(115,1,'common','save_and_new','Save & New','2024-05-09 07:43:10','2024-05-09 07:43:10'),(116,1,'common','save_and_continue','Save & Continue','2024-05-09 07:43:10','2024-05-09 07:43:10'),(117,1,'menu','dashboard','Dashboard','2024-05-09 07:43:10','2024-05-09 07:43:10'),(118,1,'menu','stock_management','Stock Manager','2024-05-09 07:43:10','2024-05-09 07:43:10'),(119,1,'menu','purchase','Purchase','2024-05-09 07:43:10','2024-05-09 07:43:10'),(120,1,'menu','purchases','Purchases','2024-05-09 07:43:10','2024-05-09 07:43:10'),(121,1,'menu','purchase_returns','Purchase Return / Dr. Note','2024-05-09 07:43:10','2024-05-09 07:43:10'),(122,1,'menu','sales','Sales','2024-05-09 07:43:10','2024-05-09 07:43:10'),(123,1,'menu','sales_returns','Sales Return / Cr. Note','2024-05-09 07:43:10','2024-05-09 07:43:10'),(124,1,'menu','product_manager','Product Manager','2024-05-09 07:43:10','2024-05-09 07:43:10'),(125,1,'menu','brands','Brands','2024-05-09 07:43:10','2024-05-09 07:43:10'),(126,1,'menu','categories','Categories','2024-05-09 07:43:10','2024-05-09 07:43:10'),(127,1,'menu','products','Products','2024-05-09 07:43:10','2024-05-09 07:43:10'),(128,1,'menu','expense_manager','Expenses','2024-05-09 07:43:10','2024-05-09 07:43:10'),(129,1,'menu','expense_categories','Expense Categories','2024-05-09 07:43:10','2024-05-09 07:43:10'),(130,1,'menu','expenses','Expenses','2024-05-09 07:43:10','2024-05-09 07:43:10'),(131,1,'menu','users','Users','2024-05-09 07:43:10','2024-05-09 07:43:10'),(132,1,'menu','parties','Parties','2024-05-09 07:43:10','2024-05-09 07:43:10'),(133,1,'menu','staff_members','Staff Members','2024-05-09 07:43:10','2024-05-09 07:43:10'),(134,1,'menu','customers','Customers','2024-05-09 07:43:10','2024-05-09 07:43:10'),(135,1,'menu','suppliers','Suppliers','2024-05-09 07:43:10','2024-05-09 07:43:10'),(136,1,'menu','settings','Settings','2024-05-09 07:43:10','2024-05-09 07:43:10'),(137,1,'menu','company','Company Settings','2024-05-09 07:43:10','2024-05-09 07:43:10'),(138,1,'menu','profile','Profile','2024-05-09 07:43:10','2024-05-09 07:43:10'),(139,1,'menu','translations','Translations','2024-05-09 07:43:10','2024-05-09 07:43:10'),(140,1,'menu','languages','Languages','2024-05-09 07:43:10','2024-05-09 07:43:10'),(141,1,'menu','warehouses','Warehouses','2024-05-09 07:43:10','2024-05-09 07:43:10'),(142,1,'menu','roles','Role & Permissions','2024-05-09 07:43:10','2024-05-09 07:43:10'),(143,1,'menu','taxes','Taxes','2024-05-09 07:43:10','2024-05-09 07:43:10'),(144,1,'menu','currencies','Currencies','2024-05-09 07:43:10','2024-05-09 07:43:10'),(145,1,'menu','payment_modes','Payment Modes','2024-05-09 07:43:10','2024-05-09 07:43:10'),(146,1,'menu','units','Units','2024-05-09 07:43:10','2024-05-09 07:43:10'),(147,1,'menu','login','Login','2024-05-09 07:43:10','2024-05-09 07:43:10'),(148,1,'menu','logout','Logout','2024-05-09 07:43:10','2024-05-09 07:43:10'),(149,1,'menu','reports','Reports','2024-05-09 07:43:10','2024-05-09 07:43:10'),(150,1,'menu','order_payments','Order Payments','2024-05-09 07:43:10','2024-05-09 07:43:10'),(151,1,'menu','payments','Payments','2024-05-09 07:43:10','2024-05-09 07:43:10'),(152,1,'menu','stock_alert','Stock Alert','2024-05-09 07:43:10','2024-05-09 07:43:10'),(153,1,'menu','users_reports','Users Reports','2024-05-09 07:43:10','2024-05-09 07:43:10'),(154,1,'menu','warehouses_reports','Warehouses Reports','2024-05-09 07:43:10','2024-05-09 07:43:10'),(155,1,'menu','pos','POS','2024-05-09 07:43:10','2024-05-09 07:43:10'),(156,1,'menu','stock_adjustment','Stock Adjustment','2024-05-09 07:43:10','2024-05-09 07:43:10'),(157,1,'menu','verify_product','Verify Product','2024-05-09 07:43:10','2024-05-09 07:43:10'),(158,1,'menu','modules','Modules','2024-05-09 07:43:10','2024-05-09 07:43:10'),(159,1,'menu','storage_settings','Storage Settings','2024-05-09 07:43:10','2024-05-09 07:43:10'),(160,1,'menu','email_settings','Email Settings','2024-05-09 07:43:10','2024-05-09 07:43:10'),(161,1,'menu','update_app','Update App','2024-05-09 07:43:10','2024-05-09 07:43:10'),(162,1,'menu','custom_fields','Custom Fields','2024-05-09 07:43:10','2024-05-09 07:43:10'),(163,1,'menu','payment_in','Payment In','2024-05-09 07:43:10','2024-05-09 07:43:10'),(164,1,'menu','payment_out','Payment Out','2024-05-09 07:43:10','2024-05-09 07:43:10'),(165,1,'menu','cash_bank','Cash & Bank','2024-05-09 07:43:10','2024-05-09 07:43:10'),(166,1,'menu','sales_summary','Sales Summary','2024-05-09 07:43:10','2024-05-09 07:43:10'),(167,1,'menu','stock_summary','Stock Summary','2024-05-09 07:43:10','2024-05-09 07:43:10'),(168,1,'menu','rate_list','Rate List','2024-05-09 07:43:10','2024-05-09 07:43:10'),(169,1,'menu','product_sales_summary','Product Sales Summary','2024-05-09 07:43:10','2024-05-09 07:43:10'),(170,1,'menu','homepage','Buy online products','2024-05-09 07:43:10','2024-05-09 07:43:10'),(171,1,'menu','online_orders','Online Orders','2024-05-09 07:43:10','2024-05-09 07:43:10'),(172,1,'menu','website_setup','Website Setup','2024-05-09 07:43:10','2024-05-09 07:43:10'),(173,1,'menu','product_cards','Product Cards','2024-05-09 07:43:10','2024-05-09 07:43:10'),(174,1,'menu','front_settings','Front Settings','2024-05-09 07:43:10','2024-05-09 07:43:10'),(175,1,'menu','orders','Orders','2024-05-09 07:43:10','2024-05-09 07:43:10'),(176,1,'menu','quotations','Quotations','2024-05-09 07:43:10','2024-05-09 07:43:10'),(177,1,'menu','quotation','Quotation','2024-05-09 07:43:10','2024-05-09 07:43:10'),(178,1,'menu','quotation_estimate','Quotation / Estimate','2024-05-09 07:43:10','2024-05-09 07:43:10'),(179,1,'menu','database_backup','Database Backup','2024-05-09 07:43:10','2024-05-09 07:43:10'),(180,1,'menu','stock_transfer','Stock Transfer','2024-05-09 07:43:10','2024-05-09 07:43:10'),(181,1,'menu','stock_transfers','Stock Transfers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(182,1,'menu','profit_loss','Profit & Loss','2024-05-09 07:43:11','2024-05-09 07:43:11'),(183,1,'menu','companies','Companies','2024-05-09 07:43:11','2024-05-09 07:43:11'),(184,1,'menu','pos_settings','POS Settings','2024-05-09 07:43:11','2024-05-09 07:43:11'),(185,1,'menu','setup_company','Setup Company','2024-05-09 07:43:11','2024-05-09 07:43:11'),(186,1,'menu','expense_reports','Expense Reports','2024-05-09 07:43:11','2024-05-09 07:43:11'),(187,1,'menu','variations','Variations','2024-05-09 07:43:11','2024-05-09 07:43:11'),(188,1,'dashboard','dashboard','Dashboard','2024-05-09 07:43:11','2024-05-09 07:43:11'),(189,1,'dashboard','recent_stock_history','Recent Stock History','2024-05-09 07:43:11','2024-05-09 07:43:11'),(190,1,'dashboard','top_selling_product','Top Selling Product','2024-05-09 07:43:11','2024-05-09 07:43:11'),(191,1,'dashboard','sales_purchases','Sales & Purchases','2024-05-09 07:43:11','2024-05-09 07:43:11'),(192,1,'dashboard','total_sales','Total Sales','2024-05-09 07:43:11','2024-05-09 07:43:11'),(193,1,'dashboard','top_customers','Top Customers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(194,1,'dashboard','total_expenses','Total Expenses','2024-05-09 07:43:11','2024-05-09 07:43:11'),(195,1,'dashboard','payment_sent','Payment Sent','2024-05-09 07:43:11','2024-05-09 07:43:11'),(196,1,'dashboard','payment_received','Payment Received','2024-05-09 07:43:11','2024-05-09 07:43:11'),(197,1,'dashboard','total_sales_items','Total Sales Items','2024-05-09 07:43:11','2024-05-09 07:43:11'),(198,1,'dashboard','total_sales_returns_items','Total Sales Returns Items','2024-05-09 07:43:11','2024-05-09 07:43:11'),(199,1,'dashboard','total_purchases_items','Total Purchase Items','2024-05-09 07:43:11','2024-05-09 07:43:11'),(200,1,'dashboard','total_purchase_returns_items','Total Purchase Returns Items','2024-05-09 07:43:11','2024-05-09 07:43:11'),(201,1,'user','email_phone','Email or Phone','2024-05-09 07:43:11','2024-05-09 07:43:11'),(202,1,'user','user','User','2024-05-09 07:43:11','2024-05-09 07:43:11'),(203,1,'user','name','Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(204,1,'user','created_at','Created At','2024-05-09 07:43:11','2024-05-09 07:43:11'),(205,1,'user','email','Email','2024-05-09 07:43:11','2024-05-09 07:43:11'),(206,1,'user','password','Password','2024-05-09 07:43:11','2024-05-09 07:43:11'),(207,1,'user','login_enabled','Login Enabled','2024-05-09 07:43:11','2024-05-09 07:43:11'),(208,1,'user','profile_image','Profile Image','2024-05-09 07:43:11','2024-05-09 07:43:11'),(209,1,'user','company_name','Company Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(210,1,'user','phone','Phone Number','2024-05-09 07:43:11','2024-05-09 07:43:11'),(211,1,'user','address','Address','2024-05-09 07:43:11','2024-05-09 07:43:11'),(212,1,'user','city','City','2024-05-09 07:43:11','2024-05-09 07:43:11'),(213,1,'user','state','State','2024-05-09 07:43:11','2024-05-09 07:43:11'),(214,1,'user','country','Country','2024-05-09 07:43:11','2024-05-09 07:43:11'),(215,1,'user','zipcode','Zipcode','2024-05-09 07:43:11','2024-05-09 07:43:11'),(216,1,'user','billing_address','Billing Address','2024-05-09 07:43:11','2024-05-09 07:43:11'),(217,1,'user','shipping_address','Shipping Address','2024-05-09 07:43:11','2024-05-09 07:43:11'),(218,1,'user','opening_balance','Opening Balance','2024-05-09 07:43:11','2024-05-09 07:43:11'),(219,1,'user','credit_period','Credit Period','2024-05-09 07:43:11','2024-05-09 07:43:11'),(220,1,'user','credit_limit','Credit Limit','2024-05-09 07:43:11','2024-05-09 07:43:11'),(221,1,'user','to_receive','To Collect','2024-05-09 07:43:11','2024-05-09 07:43:11'),(222,1,'user','to_pay','To Pay','2024-05-09 07:43:11','2024-05-09 07:43:11'),(223,1,'user','receive','Receive','2024-05-09 07:43:11','2024-05-09 07:43:11'),(224,1,'user','pay','Pay','2024-05-09 07:43:11','2024-05-09 07:43:11'),(225,1,'user','status','Status','2024-05-09 07:43:11','2024-05-09 07:43:11'),(226,1,'user','role','Role','2024-05-09 07:43:11','2024-05-09 07:43:11'),(227,1,'user','days','Day(s)','2024-05-09 07:43:11','2024-05-09 07:43:11'),(228,1,'user','profile_updated','Profile Updated Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(229,1,'user','password_blank','Leave blank if you don\'t want to update password.','2024-05-09 07:43:11','2024-05-09 07:43:11'),(230,1,'user','total_sales','Total Sales','2024-05-09 07:43:11','2024-05-09 07:43:11'),(231,1,'user','total_purchases','Total Purchases','2024-05-09 07:43:11','2024-05-09 07:43:11'),(232,1,'user','walk_in_customer','Walk In Customer','2024-05-09 07:43:11','2024-05-09 07:43:11'),(233,1,'user','staff_members_details','Staff Member Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(234,1,'user','customers_details','Customer Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(235,1,'user','suppliers_details','Supplier Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(236,1,'user','admin_account_details','Admin Account Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(237,1,'user','tax_number','Tax Number','2024-05-09 07:43:11','2024-05-09 07:43:11'),(238,1,'user','warehouse_not_changable','Warehouse Can Not Be Changed','2024-05-09 07:43:11','2024-05-09 07:43:11'),(239,1,'staff_member','add','Add New Staff Member','2024-05-09 07:43:11','2024-05-09 07:43:11'),(240,1,'staff_member','edit','Edit Staff Member','2024-05-09 07:43:11','2024-05-09 07:43:11'),(241,1,'staff_member','created','Staff Member Created Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(242,1,'staff_member','updated','Staff Member Updated Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(243,1,'staff_member','deleted','Staff Member Deleted Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(244,1,'staff_member','staff_member_details','Staff Member Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(245,1,'staff_member','staff_member','Staff Member','2024-05-09 07:43:11','2024-05-09 07:43:11'),(246,1,'staff_member','delete_message','Are you sure you want to delete this staff member?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(247,1,'staff_member','selected_delete_message','Are you sure you want to delete selected staff member?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(248,1,'staff_member','import_staff_members','Import Staff Members','2024-05-09 07:43:11','2024-05-09 07:43:11'),(249,1,'customer','add','Add New Customer','2024-05-09 07:43:11','2024-05-09 07:43:11'),(250,1,'customer','edit','Edit Customer','2024-05-09 07:43:11','2024-05-09 07:43:11'),(251,1,'customer','created','Customer Created Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(252,1,'customer','updated','Customer Updated Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(253,1,'customer','deleted','Customer Deleted Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(254,1,'customer','customer_details','Customer Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(255,1,'customer','delete_message','Are you sure you want to delete this customer?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(256,1,'customer','selected_delete_message','Are you sure you want to delete selected customer?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(257,1,'customer','import_customers','Import Customers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(258,1,'supplier','add','Add New Supplier','2024-05-09 07:43:11','2024-05-09 07:43:11'),(259,1,'supplier','edit','Edit Supplier','2024-05-09 07:43:11','2024-05-09 07:43:11'),(260,1,'supplier','created','Supplier Created Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(261,1,'supplier','updated','Supplier Updated Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(262,1,'supplier','deleted','Supplier Deleted Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(263,1,'supplier','supplier_details','Supplier Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(264,1,'supplier','delete_message','Are you sure you want to delete this supplier?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(265,1,'supplier','selected_delete_message','Are you sure you want to delete selected supplier?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(266,1,'supplier','import_suppliers','Import Suppliers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(267,1,'warehouse','add','Add New Warehouse','2024-05-09 07:43:11','2024-05-09 07:43:11'),(268,1,'warehouse','edit','Edit Warehouse','2024-05-09 07:43:11','2024-05-09 07:43:11'),(269,1,'warehouse','created','Warehouse Created Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(270,1,'warehouse','updated','Warehouse Updated Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(271,1,'warehouse','deleted','Warehouse Deleted Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(272,1,'warehouse','warehouse_details','Warehouse Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(273,1,'warehouse','warehouse','Warehouse','2024-05-09 07:43:11','2024-05-09 07:43:11'),(274,1,'warehouse','logo','Logo','2024-05-09 07:43:11','2024-05-09 07:43:11'),(275,1,'warehouse','dark_logo','Dark Logo','2024-05-09 07:43:11','2024-05-09 07:43:11'),(276,1,'warehouse','name','Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(277,1,'warehouse','slug','Slug','2024-05-09 07:43:11','2024-05-09 07:43:11'),(278,1,'warehouse','email','Email','2024-05-09 07:43:11','2024-05-09 07:43:11'),(279,1,'warehouse','phone','Phone','2024-05-09 07:43:11','2024-05-09 07:43:11'),(280,1,'warehouse','address','Billing Address','2024-05-09 07:43:11','2024-05-09 07:43:11'),(281,1,'warehouse','show_email_on_invoice','Show email on invoice','2024-05-09 07:43:11','2024-05-09 07:43:11'),(282,1,'warehouse','show_phone_on_invoice','Show phone on invoice','2024-05-09 07:43:11','2024-05-09 07:43:11'),(283,1,'warehouse','terms_condition','Terms & Conditions','2024-05-09 07:43:11','2024-05-09 07:43:11'),(284,1,'warehouse','bank_details','Bank Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(285,1,'warehouse','signature','Signature','2024-05-09 07:43:11','2024-05-09 07:43:11'),(286,1,'warehouse','delete_message','Are you sure you want to delete this warehouse?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(287,1,'warehouse','selected_delete_message','Are you sure you want to delete selected warehouse?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(288,1,'warehouse','details_will_be_shown_on_invoice','Note: Details added below will be shown on your invoices','2024-05-09 07:43:11','2024-05-09 07:43:11'),(289,1,'warehouse','online_store','Online Store','2024-05-09 07:43:11','2024-05-09 07:43:11'),(290,1,'warehouse','online_store_status_updated','Online store status updated successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(291,1,'warehouse','no_online_store_exists','No online store exists for this url. Please contact to admin for support.','2024-05-09 07:43:11','2024-05-09 07:43:11'),(292,1,'warehouse','view_online_store','View Online Store','2024-05-09 07:43:11','2024-05-09 07:43:11'),(293,1,'warehouse','default_pos_order_status','POS Default Status','2024-05-09 07:43:11','2024-05-09 07:43:11'),(294,1,'warehouse','basic_details','Basic Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(295,1,'warehouse','visibility','Visibility','2024-05-09 07:43:11','2024-05-09 07:43:11'),(296,1,'warehouse','customers_visibility','Customers Visibility','2024-05-09 07:43:11','2024-05-09 07:43:11'),(297,1,'warehouse','suppliers_visibility','Suppliers Visibility','2024-05-09 07:43:11','2024-05-09 07:43:11'),(298,1,'warehouse','products_visibility','Products Visibility','2024-05-09 07:43:11','2024-05-09 07:43:11'),(299,1,'warehouse','view_all_customers','View All Customers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(300,1,'warehouse','view_warehouse_customers','View Only Warehouse Customers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(301,1,'warehouse','view_all_suppliers','View All Suppliers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(302,1,'warehouse','view_warehouse_suppliers','View Only Warehouse Suppliers','2024-05-09 07:43:11','2024-05-09 07:43:11'),(303,1,'warehouse','view_all_products','View All Products','2024-05-09 07:43:11','2024-05-09 07:43:11'),(304,1,'warehouse','view_warehouse_products','View Only Warehouse Products','2024-05-09 07:43:11','2024-05-09 07:43:11'),(305,1,'warehouse','show_mrp_on_invoice','Show MRP On Invoice','2024-05-09 07:43:11','2024-05-09 07:43:11'),(306,1,'warehouse','show_discount_tax_on_invoice','Show discount & Tax On Invoice','2024-05-09 07:43:11','2024-05-09 07:43:11'),(307,1,'front_website','home','Home','2024-05-09 07:43:11','2024-05-09 07:43:11'),(308,1,'front_website','features','Features','2024-05-09 07:43:11','2024-05-09 07:43:11'),(309,1,'front_website','pricing','Pricing','2024-05-09 07:43:11','2024-05-09 07:43:11'),(310,1,'front_website','contact','Contact','2024-05-09 07:43:11','2024-05-09 07:43:11'),(311,1,'front_website','links','Links','2024-05-09 07:43:11','2024-05-09 07:43:11'),(312,1,'front_website','pages','Pages','2024-05-09 07:43:11','2024-05-09 07:43:11'),(313,1,'front_website','register','Register','2024-05-09 07:43:11','2024-05-09 07:43:11'),(314,1,'front_website','company_name','Company Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(315,1,'front_website','email','Email','2024-05-09 07:43:11','2024-05-09 07:43:11'),(316,1,'front_website','password','Password','2024-05-09 07:43:11','2024-05-09 07:43:11'),(317,1,'front_website','confirm_password','Confirm Password','2024-05-09 07:43:11','2024-05-09 07:43:11'),(318,1,'front_website','login','Login','2024-05-09 07:43:11','2024-05-09 07:43:11'),(319,1,'front_website','first_name','First Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(320,1,'front_website','last_name','Last Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(321,1,'front_website','address','Address','2024-05-09 07:43:11','2024-05-09 07:43:11'),(322,1,'front_website','phone','Phone','2024-05-09 07:43:11','2024-05-09 07:43:11'),(323,1,'front_website','send_message','Send Message','2024-05-09 07:43:11','2024-05-09 07:43:11'),(324,1,'front_website','register_thank_you','Thank you for registration. Please login to get started','2024-05-09 07:43:11','2024-05-09 07:43:11'),(325,1,'front_website','error_contact_support','Some error occurred when inserting the data. Please try again or contact support','2024-05-09 07:43:11','2024-05-09 07:43:11'),(326,1,'front_website','contact_us_submit_message','Thanks for contacting us. We will catch you soon.','2024-05-09 07:43:11','2024-05-09 07:43:11'),(327,1,'role','add','Add New Role','2024-05-09 07:43:11','2024-05-09 07:43:11'),(328,1,'role','edit','Edit Role','2024-05-09 07:43:11','2024-05-09 07:43:11'),(329,1,'role','created','Role Created Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(330,1,'role','updated','Role Updated Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(331,1,'role','deleted','Role Deleted Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(332,1,'role','role_details','Role Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(333,1,'role','delete_message','Are you sure you want to delete this role?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(334,1,'role','selected_delete_message','Are you sure you want to delete selected role?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(335,1,'role','display_name','Display Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(336,1,'role','role_name','Role Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(337,1,'role','description','Description','2024-05-09 07:43:11','2024-05-09 07:43:11'),(338,1,'role','user_management','User Management','2024-05-09 07:43:11','2024-05-09 07:43:11'),(339,1,'role','permissions','Permissions','2024-05-09 07:43:11','2024-05-09 07:43:11'),(340,1,'report','by_order','By Orders','2024-05-09 07:43:11','2024-05-09 07:43:11'),(341,1,'report','by_dates','By Dates','2024-05-09 07:43:11','2024-05-09 07:43:11'),(342,1,'report','select_date','Select Date','2024-05-09 07:43:11','2024-05-09 07:43:11'),(343,1,'report','select_date_message','Select a date to view the report','2024-05-09 07:43:11','2024-05-09 07:43:11'),(344,1,'company','add','Add New Company','2024-05-09 07:43:11','2024-05-09 07:43:11'),(345,1,'company','edit','Edit Company','2024-05-09 07:43:11','2024-05-09 07:43:11'),(346,1,'company','created','Company Created Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(347,1,'company','updated','Company Updated Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(348,1,'company','deleted','Company Deleted Successfully','2024-05-09 07:43:11','2024-05-09 07:43:11'),(349,1,'company','currency_details','Company Details','2024-05-09 07:43:11','2024-05-09 07:43:11'),(350,1,'company','delete_message','Are you sure you want to delete this company?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(351,1,'company','selected_delete_message','Are you sure you want to delete selected company?','2024-05-09 07:43:11','2024-05-09 07:43:11'),(352,1,'company','name','Company Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(353,1,'company','short_name','Company Short Name','2024-05-09 07:43:11','2024-05-09 07:43:11'),(354,1,'company','email','Company Email','2024-05-09 07:43:11','2024-05-09 07:43:11'),(355,1,'company','phone','Company Phone','2024-05-09 07:43:11','2024-05-09 07:43:11'),(356,1,'company','address','Company Address','2024-05-09 07:43:11','2024-05-09 07:43:11'),(357,1,'company','currency','Currency','2024-05-09 07:43:11','2024-05-09 07:43:11'),(358,1,'company','logo','Company Logo','2024-05-09 07:43:11','2024-05-09 07:43:11'),(359,1,'company','left_sidebar_theme','Left Sidebar Theme','2024-05-09 07:43:11','2024-05-09 07:43:11'),(360,1,'company','dark','Dark','2024-05-09 07:43:11','2024-05-09 07:43:11'),(361,1,'company','light','Light','2024-05-09 07:43:11','2024-05-09 07:43:11'),(362,1,'company','dark_logo','Dark Logo','2024-05-09 07:43:11','2024-05-09 07:43:11'),(363,1,'company','light_logo','Light Logo','2024-05-09 07:43:11','2024-05-09 07:43:11'),(364,1,'company','small_dark_logo','Small Dark Logo','2024-05-09 07:43:11','2024-05-09 07:43:11'),(365,1,'company','small_light_logo','Small Light Logo','2024-05-09 07:43:11','2024-05-09 07:43:11'),(366,1,'company','primary_color','Primary Color','2024-05-09 07:43:11','2024-05-09 07:43:11'),(367,1,'company','default_timezone','Default Timezone','2024-05-09 07:43:11','2024-05-09 07:43:11'),(368,1,'company','date_format','Date Format','2024-05-09 07:43:11','2024-05-09 07:43:11'),(369,1,'company','time_format','Time Format','2024-05-09 07:43:11','2024-05-09 07:43:11'),(370,1,'company','auto_detect_timezone','Auto Detect Timezone','2024-05-09 07:43:11','2024-05-09 07:43:11'),(371,1,'company','app_debug','App Debug','2024-05-09 07:43:11','2024-05-09 07:43:11'),(372,1,'company','update_app_notification','Update App Notitication','2024-05-09 07:43:11','2024-05-09 07:43:11'),(373,1,'company','login_image','Login Image','2024-05-09 07:43:11','2024-05-09 07:43:11'),(374,1,'company','layout','Layout','2024-05-09 07:43:11','2024-05-09 07:43:11'),(375,1,'company','rtl','RTL','2024-05-09 07:43:11','2024-05-09 07:43:11'),(376,1,'company','ltr','LTR','2024-05-09 07:43:11','2024-05-09 07:43:11'),(377,1,'company','language','Language','2024-05-09 07:43:12','2024-05-09 07:43:12'),(378,1,'company','shortcut_menu_Placement','Add Menu Placement','2024-05-09 07:43:12','2024-05-09 07:43:12'),(379,1,'company','top_and_bottom','Top & Bottom','2024-05-09 07:43:12','2024-05-09 07:43:12'),(380,1,'company','top_header','Top Header','2024-05-09 07:43:12','2024-05-09 07:43:12'),(381,1,'company','bottom_corner','Bottom Conrer','2024-05-09 07:43:12','2024-05-09 07:43:12'),(382,1,'company','shortcut_menu_setting','Add Menu Settings','2024-05-09 07:43:12','2024-05-09 07:43:12'),(383,1,'company','menu_setting_updated','Menu Setting Updated','2024-05-09 07:43:12','2024-05-09 07:43:12'),(384,1,'company','basic_details','Basic Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(385,1,'company','details','Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(386,1,'company','register_date','Register Date','2024-05-09 07:43:12','2024-05-09 07:43:12'),(387,1,'company','total_users','Total Users','2024-05-09 07:43:12','2024-05-09 07:43:12'),(388,1,'tax','add','Add New Tax','2024-05-09 07:43:12','2024-05-09 07:43:12'),(389,1,'tax','edit','Edit Tax','2024-05-09 07:43:12','2024-05-09 07:43:12'),(390,1,'tax','created','Tax Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(391,1,'tax','updated','Tax Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(392,1,'tax','deleted','Tax Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(393,1,'tax','tax_details','Tax Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(394,1,'tax','delete_message','Are you sure you want to delete this tax?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(395,1,'tax','selected_delete_message','Are you sure you want to delete selected tax?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(396,1,'tax','display_name','Display Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(397,1,'tax','name','Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(398,1,'tax','rate','Tax Rate','2024-05-09 07:43:12','2024-05-09 07:43:12'),(399,1,'tax','no_tax','No Tax','2024-05-09 07:43:12','2024-05-09 07:43:12'),(400,1,'tax','tax_type','Tax Type','2024-05-09 07:43:12','2024-05-09 07:43:12'),(401,1,'tax','single','Single','2024-05-09 07:43:12','2024-05-09 07:43:12'),(402,1,'tax','multiple','Multiple','2024-05-09 07:43:12','2024-05-09 07:43:12'),(403,1,'tax','multiple_tax','Multiple Tax','2024-05-09 07:43:12','2024-05-09 07:43:12'),(404,1,'variation','add','Add New Variation','2024-05-09 07:43:12','2024-05-09 07:43:12'),(405,1,'variation','edit','Edit Variation','2024-05-09 07:43:12','2024-05-09 07:43:12'),(406,1,'variation','created','Variation Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(407,1,'variation','updated','Variation Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(408,1,'variation','deleted','Variation Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(409,1,'variation','variation_details','Variation Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(410,1,'variation','delete_message','Are you sure you want to delete this variation?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(411,1,'variation','selected_delete_message','Are you sure you want to delete selected variation?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(412,1,'variation','variation_name','Variation Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(413,1,'variation','name','Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(414,1,'variation','value','Value','2024-05-09 07:43:12','2024-05-09 07:43:12'),(415,1,'variation','add_new_value','Add New Value','2024-05-09 07:43:12','2024-05-09 07:43:12'),(416,1,'variation','variation_values','Variation Values','2024-05-09 07:43:12','2024-05-09 07:43:12'),(417,1,'currency','add','Add New Currency','2024-05-09 07:43:12','2024-05-09 07:43:12'),(418,1,'currency','edit','Edit Currency','2024-05-09 07:43:12','2024-05-09 07:43:12'),(419,1,'currency','created','Currency Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(420,1,'currency','updated','Currency Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(421,1,'currency','deleted','Currency Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(422,1,'currency','currency_details','Currency Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(423,1,'currency','delete_message','Are you sure you want to delete this currency?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(424,1,'currency','selected_delete_message','Are you sure you want to delete selected currency?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(425,1,'currency','name','Currency Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(426,1,'currency','symbol','Currency Symbol','2024-05-09 07:43:12','2024-05-09 07:43:12'),(427,1,'currency','position','Currency Position','2024-05-09 07:43:12','2024-05-09 07:43:12'),(428,1,'currency','front','Front','2024-05-09 07:43:12','2024-05-09 07:43:12'),(429,1,'currency','front_position_example','Example : $100','2024-05-09 07:43:12','2024-05-09 07:43:12'),(430,1,'currency','behind','Behind','2024-05-09 07:43:12','2024-05-09 07:43:12'),(431,1,'currency','behind_position_example','Example : 100$','2024-05-09 07:43:12','2024-05-09 07:43:12'),(432,1,'currency','code','Currency Code','2024-05-09 07:43:12','2024-05-09 07:43:12'),(433,1,'payment_mode','add','Add New Payment Mode','2024-05-09 07:43:12','2024-05-09 07:43:12'),(434,1,'payment_mode','edit','Edit Payment Mode','2024-05-09 07:43:12','2024-05-09 07:43:12'),(435,1,'payment_mode','created','Payment Mode Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(436,1,'payment_mode','updated','Payment Mode Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(437,1,'payment_mode','deleted','Payment Mode Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(438,1,'payment_mode','payment_mode_details','Payment Mode Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(439,1,'payment_mode','delete_message','Are you sure you want to delete this payment mode?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(440,1,'payment_mode','selected_delete_message','Are you sure you want to delete selected payment mode?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(441,1,'payment_mode','name','Payment Mode Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(442,1,'payment_mode','mode_type','Mode Type','2024-05-09 07:43:12','2024-05-09 07:43:12'),(443,1,'payment_mode','cash','Cash','2024-05-09 07:43:12','2024-05-09 07:43:12'),(444,1,'payment_mode','bank','Bank','2024-05-09 07:43:12','2024-05-09 07:43:12'),(445,1,'unit','add','Add New Unit','2024-05-09 07:43:12','2024-05-09 07:43:12'),(446,1,'unit','edit','Edit Unit','2024-05-09 07:43:12','2024-05-09 07:43:12'),(447,1,'unit','created','Unit Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(448,1,'unit','updated','Unit Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(449,1,'unit','deleted','Unit Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(450,1,'unit','delete_message','Are you sure you want to delete this unit?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(451,1,'unit','selected_delete_message','Are you sure you want to delete selected unit?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(452,1,'unit','unit_details','Unit Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(453,1,'unit','name','Unit Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(454,1,'unit','short_name','Short Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(455,1,'unit','base_unit','Base Unit','2024-05-09 07:43:12','2024-05-09 07:43:12'),(456,1,'unit','operator','Operator','2024-05-09 07:43:12','2024-05-09 07:43:12'),(457,1,'unit','multiply','Multiply (*)','2024-05-09 07:43:12','2024-05-09 07:43:12'),(458,1,'unit','divide','Divide (/)','2024-05-09 07:43:12','2024-05-09 07:43:12'),(459,1,'unit','operator_value','Operator Value','2024-05-09 07:43:12','2024-05-09 07:43:12'),(460,1,'custom_field','add','Add New Custom Field','2024-05-09 07:43:12','2024-05-09 07:43:12'),(461,1,'custom_field','edit','Edit Custom Field','2024-05-09 07:43:12','2024-05-09 07:43:12'),(462,1,'custom_field','created','Custom Field Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(463,1,'custom_field','updated','Custom Field Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(464,1,'custom_field','deleted','Custom Field Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(465,1,'custom_field','delete_message','Are you sure you want to delete this custom field?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(466,1,'custom_field','selected_delete_message','Are you sure you want to delete selected custom field?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(467,1,'custom_field','name','Field Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(468,1,'custom_field','value','Default Value','2024-05-09 07:43:12','2024-05-09 07:43:12'),(469,1,'custom_field','type','Field Type','2024-05-09 07:43:12','2024-05-09 07:43:12'),(470,1,'module','name','Module Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(471,1,'module','verified','Verified','2024-05-09 07:43:12','2024-05-09 07:43:12'),(472,1,'module','verify_purchase_code','Verify Purchase Code','2024-05-09 07:43:12','2024-05-09 07:43:12'),(473,1,'module','current_version','Current Version','2024-05-09 07:43:12','2024-05-09 07:43:12'),(474,1,'module','latest_version','Latest Version','2024-05-09 07:43:12','2024-05-09 07:43:12'),(475,1,'module','status','Status','2024-05-09 07:43:12','2024-05-09 07:43:12'),(476,1,'module','installed_modules','Installed Modules','2024-05-09 07:43:12','2024-05-09 07:43:12'),(477,1,'module','other_modules','Other Modules','2024-05-09 07:43:12','2024-05-09 07:43:12'),(478,1,'module','module_status_updated','Modules Status Updated','2024-05-09 07:43:12','2024-05-09 07:43:12'),(479,1,'module','downloading_completed','Download Completed','2024-05-09 07:43:12','2024-05-09 07:43:12'),(480,1,'module','extract_zip_file','Extract Zip File','2024-05-09 07:43:12','2024-05-09 07:43:12'),(481,1,'module','file_extracted','Zip File Extracted','2024-05-09 07:43:12','2024-05-09 07:43:12'),(482,1,'update_app','app_details','App Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(483,1,'update_app','name','Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(484,1,'update_app','value','Value','2024-05-09 07:43:12','2024-05-09 07:43:12'),(485,1,'update_app','php_version','PHP Version','2024-05-09 07:43:12','2024-05-09 07:43:12'),(486,1,'update_app','app_version','App Version','2024-05-09 07:43:12','2024-05-09 07:43:12'),(487,1,'update_app','laravel_version','Laravel Version','2024-05-09 07:43:12','2024-05-09 07:43:12'),(488,1,'update_app','mysql_version','MySQL Version','2024-05-09 07:43:12','2024-05-09 07:43:12'),(489,1,'update_app','vue_version','Vue Version','2024-05-09 07:43:12','2024-05-09 07:43:12'),(490,1,'update_app','update_app','Update App','2024-05-09 07:43:12','2024-05-09 07:43:12'),(491,1,'update_app','update_now','Update Now','2024-05-09 07:43:12','2024-05-09 07:43:12'),(492,1,'update_app','update_available','','2024-05-09 07:43:12','2024-05-09 07:43:12'),(493,1,'update_app','verify_again','Verify Again','2024-05-09 07:43:12','2024-05-09 07:43:12'),(494,1,'update_app','verify_failed','Verification Failed','2024-05-09 07:43:12','2024-05-09 07:43:12'),(495,1,'update_app','verify_failed_message','Your application is not registerd with us. Please verify it','2024-05-09 07:43:12','2024-05-09 07:43:12'),(496,1,'update_app','verified_with_other_domain','Your purchase code is registerd with other doamin. Please verfiy your purhcase code','2024-05-09 07:43:12','2024-05-09 07:43:12'),(497,1,'expense_category','add','Add New Expense Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(498,1,'expense_category','edit','Edit Expense Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(499,1,'expense_category','created','Expense Category Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(500,1,'expense_category','updated','Expense Category Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(501,1,'expense_category','deleted','Expense Category Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(502,1,'expense_category','delete_message','Are you sure you want to delete this expense category?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(503,1,'expense_category','selected_delete_message','Are you sure you want to delete selected expense category?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(504,1,'expense_category','expense_category_details','Expense Category Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(505,1,'expense_category','name','Expense Category Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(506,1,'expense_category','description','Description','2024-05-09 07:43:12','2024-05-09 07:43:12'),(507,1,'expense','add','Add New Expense','2024-05-09 07:43:12','2024-05-09 07:43:12'),(508,1,'expense','edit','Edit Expense','2024-05-09 07:43:12','2024-05-09 07:43:12'),(509,1,'expense','created','Expense Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(510,1,'expense','updated','Expense Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(511,1,'expense','deleted','Expense Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(512,1,'expense','delete_message','Are you sure you want to delete this expense?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(513,1,'expense','selected_delete_message','Are you sure you want to delete selected expense?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(514,1,'expense','details','Expense Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(515,1,'expense','warehouse','Warehouse','2024-05-09 07:43:12','2024-05-09 07:43:12'),(516,1,'expense','expense_category','Expense Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(517,1,'expense','date','Date','2024-05-09 07:43:12','2024-05-09 07:43:12'),(518,1,'expense','amount','Amount','2024-05-09 07:43:12','2024-05-09 07:43:12'),(519,1,'expense','bill','Expense Bill','2024-05-09 07:43:12','2024-05-09 07:43:12'),(520,1,'expense','user','User','2024-05-09 07:43:12','2024-05-09 07:43:12'),(521,1,'expense','created_by_user','User','2024-05-09 07:43:12','2024-05-09 07:43:12'),(522,1,'expense','notes','Notes','2024-05-09 07:43:12','2024-05-09 07:43:12'),(523,1,'brand','add','Add New Brand','2024-05-09 07:43:12','2024-05-09 07:43:12'),(524,1,'brand','edit','Edit Brand','2024-05-09 07:43:12','2024-05-09 07:43:12'),(525,1,'brand','created','Brand Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(526,1,'brand','updated','Brand Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(527,1,'brand','deleted','Brand Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(528,1,'brand','delete_message','Are you sure you want to delete this brand?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(529,1,'brand','selected_delete_message','Are you sure you want to delete selected brand?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(530,1,'brand','details','Brand Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(531,1,'brand','name','Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(532,1,'brand','slug','Slug','2024-05-09 07:43:12','2024-05-09 07:43:12'),(533,1,'brand','logo','Brand Logo','2024-05-09 07:43:12','2024-05-09 07:43:12'),(534,1,'brand','import_brands','Import Brands','2024-05-09 07:43:12','2024-05-09 07:43:12'),(535,1,'category','add','Add New Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(536,1,'category','edit','Edit Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(537,1,'category','created','Category Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(538,1,'category','updated','Category Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(539,1,'category','deleted','Category Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(540,1,'category','delete_message','Are you sure you want to delete this category?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(541,1,'category','selected_delete_message','Are you sure you want to delete selected category?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(542,1,'category','details','Category Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(543,1,'category','category','Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(544,1,'category','name','Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(545,1,'category','slug','Slug','2024-05-09 07:43:12','2024-05-09 07:43:12'),(546,1,'category','logo','Category Logo','2024-05-09 07:43:12','2024-05-09 07:43:12'),(547,1,'category','parent_category','Parent Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(548,1,'category','no_parent_category','No Parent Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(549,1,'category','import_categories','Import Categories','2024-05-09 07:43:12','2024-05-09 07:43:12'),(550,1,'product','add','Add New Product','2024-05-09 07:43:12','2024-05-09 07:43:12'),(551,1,'product','edit','Edit Product','2024-05-09 07:43:12','2024-05-09 07:43:12'),(552,1,'product','created','Product Created Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(553,1,'product','updated','Product Updated Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(554,1,'product','deleted','Product Deleted Successfully','2024-05-09 07:43:12','2024-05-09 07:43:12'),(555,1,'product','delete_message','Are you sure you want to delete this product?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(556,1,'product','selected_delete_message','Are you sure you want to delete selected product?','2024-05-09 07:43:12','2024-05-09 07:43:12'),(557,1,'product','details','Product Details','2024-05-09 07:43:12','2024-05-09 07:43:12'),(558,1,'product','name','Name','2024-05-09 07:43:12','2024-05-09 07:43:12'),(559,1,'product','slug','Slug','2024-05-09 07:43:12','2024-05-09 07:43:12'),(560,1,'product','sku','SKU','2024-05-09 07:43:12','2024-05-09 07:43:12'),(561,1,'product','image','Image','2024-05-09 07:43:12','2024-05-09 07:43:12'),(562,1,'product','quantitiy_alert','Quantity Alert','2024-05-09 07:43:12','2024-05-09 07:43:12'),(563,1,'product','brand','Brand','2024-05-09 07:43:12','2024-05-09 07:43:12'),(564,1,'product','category','Category','2024-05-09 07:43:12','2024-05-09 07:43:12'),(565,1,'product','price','Price','2024-05-09 07:43:12','2024-05-09 07:43:12'),(566,1,'product','mrp','MRP','2024-05-09 07:43:12','2024-05-09 07:43:12'),(567,1,'product','purchase_price','Purchase Price','2024-05-09 07:43:12','2024-05-09 07:43:12'),(568,1,'product','sales_price','Sales Price','2024-05-09 07:43:12','2024-05-09 07:43:12'),(569,1,'product','tax_type','Tax Type','2024-05-09 07:43:12','2024-05-09 07:43:12'),(570,1,'product','description','Description','2024-05-09 07:43:12','2024-05-09 07:43:12'),(571,1,'product','product','Product','2024-05-09 07:43:12','2024-05-09 07:43:12'),(572,1,'product','quantity','Quantity','2024-05-09 07:43:12','2024-05-09 07:43:12'),(573,1,'product','discount','Discount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(574,1,'product','tax','Tax','2024-05-09 07:43:13','2024-05-09 07:43:13'),(575,1,'product','subtotal','SubTotal','2024-05-09 07:43:13','2024-05-09 07:43:13'),(576,1,'product','unit','Unit','2024-05-09 07:43:13','2024-05-09 07:43:13'),(577,1,'product','unit_price','Unit Price','2024-05-09 07:43:13','2024-05-09 07:43:13'),(578,1,'product','avl_qty','Avl. qty:','2024-05-09 07:43:13','2024-05-09 07:43:13'),(579,1,'product','order_items','Order Items','2024-05-09 07:43:13','2024-05-09 07:43:13'),(580,1,'product','inclusive','Inclusive','2024-05-09 07:43:13','2024-05-09 07:43:13'),(581,1,'product','exclusive','Exclusive','2024-05-09 07:43:13','2024-05-09 07:43:13'),(582,1,'product','stocks','Stocks','2024-05-09 07:43:13','2024-05-09 07:43:13'),(583,1,'product','stock_quantity','Stock Quantity','2024-05-09 07:43:13','2024-05-09 07:43:13'),(584,1,'product','product_orders','Product Orders','2024-05-09 07:43:13','2024-05-09 07:43:13'),(585,1,'product','stock_history','Stock History','2024-05-09 07:43:13','2024-05-09 07:43:13'),(586,1,'product','current_stock','Current Stock','2024-05-09 07:43:13','2024-05-09 07:43:13'),(587,1,'product','item_code','Item Code','2024-05-09 07:43:13','2024-05-09 07:43:13'),(588,1,'product','barcode_symbology','Barcode Symbology','2024-05-09 07:43:13','2024-05-09 07:43:13'),(589,1,'product','barcode','Barcode','2024-05-09 07:43:13','2024-05-09 07:43:13'),(590,1,'product','view_barcode','View Barcode','2024-05-09 07:43:13','2024-05-09 07:43:13'),(591,1,'product','generate_barcode','Generate Barcode','2024-05-09 07:43:13','2024-05-09 07:43:13'),(592,1,'product','print_barcode','Print Barcode','2024-05-09 07:43:13','2024-05-09 07:43:13'),(593,1,'product','price_tax','Price & Tax','2024-05-09 07:43:13','2024-05-09 07:43:13'),(594,1,'product','variant_details','Variants Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(595,1,'product','custom_fields','Custom Fields','2024-05-09 07:43:13','2024-05-09 07:43:13'),(596,1,'product','wholesale_rate','Wholesale Rate','2024-05-09 07:43:13','2024-05-09 07:43:13'),(597,1,'product','wholesale_price','Wholesale Price','2024-05-09 07:43:13','2024-05-09 07:43:13'),(598,1,'product','wholesale_quantity','Wholesale Quantity','2024-05-09 07:43:13','2024-05-09 07:43:13'),(599,1,'product','enter_min_quantity','Enter Minimum Quantity','2024-05-09 07:43:13','2024-05-09 07:43:13'),(600,1,'product','opening_stock','Opening Stock','2024-05-09 07:43:13','2024-05-09 07:43:13'),(601,1,'product','opening_stock_date','Opening Stock Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(602,1,'product','stock_value','Stock Value','2024-05-09 07:43:13','2024-05-09 07:43:13'),(603,1,'product','by_purchase','By Purchase','2024-05-09 07:43:13','2024-05-09 07:43:13'),(604,1,'product','by_sales','By Sales','2024-05-09 07:43:13','2024-05-09 07:43:13'),(605,1,'product','unit_sold','Unit Sold','2024-05-09 07:43:13','2024-05-09 07:43:13'),(606,1,'product','import_products','Import Products','2024-05-09 07:43:13','2024-05-09 07:43:13'),(607,1,'product','total_purchase_price','Total Purchase Price','2024-05-09 07:43:13','2024-05-09 07:43:13'),(608,1,'product','total_sales_price','Total Sales Price','2024-05-09 07:43:13','2024-05-09 07:43:13'),(609,1,'product','product_type','Product Type','2024-05-09 07:43:13','2024-05-09 07:43:13'),(610,1,'product','search_scan_product','Search Product Name / Item Code / Scan bar code','2024-05-09 07:43:13','2024-05-09 07:43:13'),(611,1,'variations','add','Add Variation','2024-05-09 07:43:13','2024-05-09 07:43:13'),(612,1,'variations','edit','Edit Variation','2024-05-09 07:43:13','2024-05-09 07:43:13'),(613,1,'variations','add_variation_message','Select Variant and Variant Type From Below Dropdown and Then Click on + Add Variation Button','2024-05-09 07:43:13','2024-05-09 07:43:13'),(614,1,'variations','single_type_product','Single Type Product','2024-05-09 07:43:13','2024-05-09 07:43:13'),(615,1,'variations','variant_type_product','Variant Type Product','2024-05-09 07:43:13','2024-05-09 07:43:13'),(616,1,'variations','variation','Variation','2024-05-09 07:43:13','2024-05-09 07:43:13'),(617,1,'variations','variant_value','Variant Value','2024-05-09 07:43:13','2024-05-09 07:43:13'),(618,1,'stock','order_type','Order Type','2024-05-09 07:43:13','2024-05-09 07:43:13'),(619,1,'stock','order_date','Order Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(620,1,'stock','warehouse','Warehouse','2024-05-09 07:43:13','2024-05-09 07:43:13'),(621,1,'stock','supplier','Supplier','2024-05-09 07:43:13','2024-05-09 07:43:13'),(622,1,'stock','customer','Customer','2024-05-09 07:43:13','2024-05-09 07:43:13'),(623,1,'stock','product','Product','2024-05-09 07:43:13','2024-05-09 07:43:13'),(624,1,'stock','invoice_number','Invoice Number','2024-05-09 07:43:13','2024-05-09 07:43:13'),(625,1,'stock','invoie_number_blank','Leave it blank to generate automatically','2024-05-09 07:43:13','2024-05-09 07:43:13'),(626,1,'stock','notes','Notes','2024-05-09 07:43:13','2024-05-09 07:43:13'),(627,1,'stock','status','Order Status','2024-05-09 07:43:13','2024-05-09 07:43:13'),(628,1,'stock','order_tax','Order Tax','2024-05-09 07:43:13','2024-05-09 07:43:13'),(629,1,'stock','discount','Discount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(630,1,'stock','shipping','Shipping','2024-05-09 07:43:13','2024-05-09 07:43:13'),(631,1,'stock','grand_total','Grand Total','2024-05-09 07:43:13','2024-05-09 07:43:13'),(632,1,'stock','remarks','Remarks','2024-05-09 07:43:13','2024-05-09 07:43:13'),(633,1,'stock','pay_now','Pay Now','2024-05-09 07:43:13','2024-05-09 07:43:13'),(634,1,'stock','reset','Reset','2024-05-09 07:43:13','2024-05-09 07:43:13'),(635,1,'stock','total_items','Total Items','2024-05-09 07:43:13','2024-05-09 07:43:13'),(636,1,'stock','paying_amount','Paying Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(637,1,'stock','payable_amount','Payable Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(638,1,'stock','change_return','Change Return','2024-05-09 07:43:13','2024-05-09 07:43:13'),(639,1,'stock','order_details','Order Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(640,1,'stock','order_canceled','Order Canceled Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(641,1,'stock','order_cancel_message','Are you sure you want to cancel this order?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(642,1,'stock','view_order','View Order','2024-05-09 07:43:13','2024-05-09 07:43:13'),(643,1,'stock','order_id','Order Id','2024-05-09 07:43:13','2024-05-09 07:43:13'),(644,1,'stock','shipping_address','Shipping Address','2024-05-09 07:43:13','2024-05-09 07:43:13'),(645,1,'stock','billing_address','Billing Address','2024-05-09 07:43:13','2024-05-09 07:43:13'),(646,1,'stock','order_taken_by','Order Taken By','2024-05-09 07:43:13','2024-05-09 07:43:13'),(647,1,'stock','no_product_found','No product found for selected resource','2024-05-09 07:43:13','2024-05-09 07:43:13'),(648,1,'stock','sold_by','Sold By','2024-05-09 07:43:13','2024-05-09 07:43:13'),(649,1,'stock','complete_order','Complete Order','2024-05-09 07:43:13','2024-05-09 07:43:13'),(650,1,'purchase','add','Add New Purchase','2024-05-09 07:43:13','2024-05-09 07:43:13'),(651,1,'purchase','edit','Edit Purchase','2024-05-09 07:43:13','2024-05-09 07:43:13'),(652,1,'purchase','details','Purchase Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(653,1,'purchase','created','Purchase Created Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(654,1,'purchase','updated','Purchase Updated Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(655,1,'purchase','deleted','Purchase Deleted Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(656,1,'purchase','delete_message','Are you sure you want to delete this purchase?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(657,1,'purchase','selected_delete_message','Are you sure you want to delete selected purchase?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(658,1,'purchase','purchase_date','Purchase Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(659,1,'purchase','purchase_status','Purchase Status','2024-05-09 07:43:13','2024-05-09 07:43:13'),(660,1,'purchase','user','Supplier','2024-05-09 07:43:13','2024-05-09 07:43:13'),(661,1,'sales','add','Add New Sales','2024-05-09 07:43:13','2024-05-09 07:43:13'),(662,1,'sales','edit','Edit Sales','2024-05-09 07:43:13','2024-05-09 07:43:13'),(663,1,'sales','details','Sales Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(664,1,'sales','created','Sales Created Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(665,1,'sales','updated','Sales Updated Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(666,1,'sales','deleted','Sales Deleted Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(667,1,'sales','delete_message','Are you sure you want to delete this sales?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(668,1,'sales','selected_delete_message','Are you sure you want to delete selected sales?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(669,1,'sales','sales_date','Sales Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(670,1,'sales','sales_status','Sales Status','2024-05-09 07:43:13','2024-05-09 07:43:13'),(671,1,'sales','user','Customer','2024-05-09 07:43:13','2024-05-09 07:43:13'),(672,1,'sales','tax_invoice','TAX INVOICE','2024-05-09 07:43:13','2024-05-09 07:43:13'),(673,1,'sales','invoice','Invoice','2024-05-09 07:43:13','2024-05-09 07:43:13'),(674,1,'purchase_returns','add','Add New Purchase Return','2024-05-09 07:43:13','2024-05-09 07:43:13'),(675,1,'purchase_returns','edit','Edit Purchase Return','2024-05-09 07:43:13','2024-05-09 07:43:13'),(676,1,'purchase_returns','details','Purchase Return Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(677,1,'purchase_returns','created','Purchase Return Created Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(678,1,'purchase_returns','updated','Purchase Return Updated Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(679,1,'purchase_returns','deleted','Purchase Return Deleted Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(680,1,'purchase_returns','delete_message','Are you sure you want to delete this purchase return?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(681,1,'purchase_returns','selected_delete_message','Are you sure you want to delete selected purchase return?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(682,1,'purchase_returns','purchase_returns_date','Return Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(683,1,'purchase_returns','purchase_returns_status','Return Status','2024-05-09 07:43:13','2024-05-09 07:43:13'),(684,1,'purchase_returns','user','Supplier','2024-05-09 07:43:13','2024-05-09 07:43:13'),(685,1,'sales_returns','add','Add New Sales Return','2024-05-09 07:43:13','2024-05-09 07:43:13'),(686,1,'sales_returns','edit','Edit Sales Return','2024-05-09 07:43:13','2024-05-09 07:43:13'),(687,1,'sales_returns','details','Sales Return Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(688,1,'sales_returns','created','Sales Return Created Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(689,1,'sales_returns','updated','Sales Return Updated Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(690,1,'sales_returns','deleted','Sales Return Deleted Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(691,1,'sales_returns','delete_message','Are you sure you want to delete this sales return?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(692,1,'sales_returns','selected_delete_message','Are you sure you want to delete selected sales return?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(693,1,'sales_returns','sales_returns_date','Return Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(694,1,'sales_returns','sales_returns_status','Return Status','2024-05-09 07:43:13','2024-05-09 07:43:13'),(695,1,'sales_returns','user','Customer','2024-05-09 07:43:13','2024-05-09 07:43:13'),(696,1,'quotation','add','Add New Quotation','2024-05-09 07:43:13','2024-05-09 07:43:13'),(697,1,'quotation','edit','Edit Quotation','2024-05-09 07:43:13','2024-05-09 07:43:13'),(698,1,'quotation','details','Quotation Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(699,1,'quotation','created','Quotation Created Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(700,1,'quotation','updated','Quotation Updated Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(701,1,'quotation','deleted','Quotation Deleted Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(702,1,'quotation','delete_message','Are you sure you want to delete this quotation/estimate?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(703,1,'quotation','selected_delete_message','Are you sure you want to delete selected quotation/estimate?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(704,1,'quotation','quotation_date','Quotation Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(705,1,'quotation','quotation_status','Quotation Status','2024-05-09 07:43:13','2024-05-09 07:43:13'),(706,1,'quotation','user','Customer','2024-05-09 07:43:13','2024-05-09 07:43:13'),(707,1,'quotation','tax_invoice','TAX INVOICE','2024-05-09 07:43:13','2024-05-09 07:43:13'),(708,1,'quotation','invoice','Invoice','2024-05-09 07:43:13','2024-05-09 07:43:13'),(709,1,'quotation','convert_to_sale','Convert to sale','2024-05-09 07:43:13','2024-05-09 07:43:13'),(710,1,'quotation','convert_message','Are you really want to convert this quotation to sales?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(711,1,'quotation','quotation_converted_to_sales','Quotation converted to sales successfully.','2024-05-09 07:43:13','2024-05-09 07:43:13'),(712,1,'payments','add','Add New Payment','2024-05-09 07:43:13','2024-05-09 07:43:13'),(713,1,'payments','edit','Edit Payment','2024-05-09 07:43:13','2024-05-09 07:43:13'),(714,1,'payments','details','Payment Details','2024-05-09 07:43:13','2024-05-09 07:43:13'),(715,1,'payments','created','Payment Created Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(716,1,'payments','updated','Payment Updated Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(717,1,'payments','deleted','Payment Deleted Successfully','2024-05-09 07:43:13','2024-05-09 07:43:13'),(718,1,'payments','delete_message','Are you sure you want to delete this payment?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(719,1,'payments','selected_delete_message','Are you sure you want to delete selected payment?','2024-05-09 07:43:13','2024-05-09 07:43:13'),(720,1,'payments','user','User','2024-05-09 07:43:13','2024-05-09 07:43:13'),(721,1,'payments','amount','Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(722,1,'payments','invoice_amount','Invoice Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(723,1,'payments','payment_number','Reference Number','2024-05-09 07:43:13','2024-05-09 07:43:13'),(724,1,'payments','payments','Payments','2024-05-09 07:43:13','2024-05-09 07:43:13'),(725,1,'payments','date','Payment Date','2024-05-09 07:43:13','2024-05-09 07:43:13'),(726,1,'payments','due_amount','Due Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(727,1,'payments','paid_amount','Paid Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(728,1,'payments','total_amount','Total Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(729,1,'payments','unused_amount','Unused Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(730,1,'payments','settled_amount','Settled Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(731,1,'payments','payment_mode','Payment Mode','2024-05-09 07:43:13','2024-05-09 07:43:13'),(732,1,'payments','paid_total_amount','Paid/Total Amount','2024-05-09 07:43:13','2024-05-09 07:43:13'),(733,1,'payments','notes','Notes','2024-05-09 07:43:13','2024-05-09 07:43:13'),(734,1,'payments','payment_status','Payment Status','2024-05-09 07:43:13','2024-05-09 07:43:13'),(735,1,'payments','unpaid','Unpaid','2024-05-09 07:43:13','2024-05-09 07:43:13'),(736,1,'payments','paid','Paid','2024-05-09 07:43:13','2024-05-09 07:43:13'),(737,1,'payments','transactions','Transactions','2024-05-09 07:43:13','2024-05-09 07:43:13'),(738,1,'payments','transaction_number','Txns No.','2024-05-09 07:43:13','2024-05-09 07:43:13'),(739,1,'payments','partially_paid','Partially Paid','2024-05-09 07:43:13','2024-05-09 07:43:13'),(740,1,'payments','order_payment','Order Payment','2024-05-09 07:43:13','2024-05-09 07:43:13'),(741,1,'payments','settle_invoice_using_payment','Settle below invoices using this payment','2024-05-09 07:43:13','2024-05-09 07:43:13'),(742,1,'payments','payment_type','Payment Type','2024-05-09 07:43:13','2024-05-09 07:43:13'),(743,1,'payments','you_will_pay','You Will Pay','2024-05-09 07:43:13','2024-05-09 07:43:13'),(744,1,'payments','you_will_receive','You Will Receive','2024-05-09 07:43:13','2024-05-09 07:43:13'),(745,1,'payments','cash','Cash','2024-05-09 07:43:13','2024-05-09 07:43:13'),(746,1,'payments','bank','Bank','2024-05-09 07:43:14','2024-05-09 07:43:14'),(747,1,'langs','add','Add New Language','2024-05-09 07:43:14','2024-05-09 07:43:14'),(748,1,'langs','edit','Edit Language','2024-05-09 07:43:14','2024-05-09 07:43:14'),(749,1,'langs','details','Language Details','2024-05-09 07:43:14','2024-05-09 07:43:14'),(750,1,'langs','created','Language Created Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(751,1,'langs','updated','Language Updated Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(752,1,'langs','deleted','Language Deleted Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(753,1,'langs','delete_message','Are you sure you want to delete this language?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(754,1,'langs','selected_delete_message','Are you sure you want to delete selected language?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(755,1,'langs','view_all_langs','View All Languages','2024-05-09 07:43:14','2024-05-09 07:43:14'),(756,1,'langs','status_updated','Langugage status updated','2024-05-09 07:43:14','2024-05-09 07:43:14'),(757,1,'langs','name','Name','2024-05-09 07:43:14','2024-05-09 07:43:14'),(758,1,'langs','key','Key','2024-05-09 07:43:14','2024-05-09 07:43:14'),(759,1,'langs','flag','Flag','2024-05-09 07:43:14','2024-05-09 07:43:14'),(760,1,'langs','enabled','Enabled','2024-05-09 07:43:14','2024-05-09 07:43:14'),(761,1,'translations','fetch_new_translations','Fetch New Translations','2024-05-09 07:43:14','2024-05-09 07:43:14'),(762,1,'translations','reload_translations','Reload Translations','2024-05-09 07:43:14','2024-05-09 07:43:14'),(763,1,'translations','reload_successfully','Translations Reload Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(764,1,'translations','fetched_successfully','Translations Fetch Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(765,1,'translations','import_translations','Import Translations','2024-05-09 07:43:14','2024-05-09 07:43:14'),(766,1,'storage_settings','updated','Storage Settings Updated','2024-05-09 07:43:14','2024-05-09 07:43:14'),(767,1,'storage_settings','storage','Storage','2024-05-09 07:43:14','2024-05-09 07:43:14'),(768,1,'storage_settings','local','Local','2024-05-09 07:43:14','2024-05-09 07:43:14'),(769,1,'storage_settings','aws','AWS S3 Storage','2024-05-09 07:43:14','2024-05-09 07:43:14'),(770,1,'storage_settings','aws_key','AWS Key','2024-05-09 07:43:14','2024-05-09 07:43:14'),(771,1,'storage_settings','aws_secret','AWS Secret','2024-05-09 07:43:14','2024-05-09 07:43:14'),(772,1,'storage_settings','aws_region','AWS Region','2024-05-09 07:43:14','2024-05-09 07:43:14'),(773,1,'storage_settings','aws_bucket','AWS Bucket','2024-05-09 07:43:14','2024-05-09 07:43:14'),(774,1,'mail_settings','updated','Mail Settings Updated','2024-05-09 07:43:14','2024-05-09 07:43:14'),(775,1,'mail_settings','mail_driver','Mail Driver','2024-05-09 07:43:14','2024-05-09 07:43:14'),(776,1,'mail_settings','none','None','2024-05-09 07:43:14','2024-05-09 07:43:14'),(777,1,'mail_settings','mail','Mail','2024-05-09 07:43:14','2024-05-09 07:43:14'),(778,1,'mail_settings','smtp','SMTP','2024-05-09 07:43:14','2024-05-09 07:43:14'),(779,1,'mail_settings','from_name','Mail From Name','2024-05-09 07:43:14','2024-05-09 07:43:14'),(780,1,'mail_settings','from_email','Mail From Email','2024-05-09 07:43:14','2024-05-09 07:43:14'),(781,1,'mail_settings','host','Host','2024-05-09 07:43:14','2024-05-09 07:43:14'),(782,1,'mail_settings','port','Port','2024-05-09 07:43:14','2024-05-09 07:43:14'),(783,1,'mail_settings','encryption','Encryption','2024-05-09 07:43:14','2024-05-09 07:43:14'),(784,1,'mail_settings','username','Username','2024-05-09 07:43:14','2024-05-09 07:43:14'),(785,1,'mail_settings','password','Password','2024-05-09 07:43:14','2024-05-09 07:43:14'),(786,1,'mail_settings','send_test_mail','Send Test Mail','2024-05-09 07:43:14','2024-05-09 07:43:14'),(787,1,'mail_settings','send_mail_setting_saved','Send mail setting saved','2024-05-09 07:43:14','2024-05-09 07:43:14'),(788,1,'mail_settings','enable_mail_queue','Enable Mail Queue','2024-05-09 07:43:14','2024-05-09 07:43:14'),(789,1,'mail_settings','send_mail_for','Send Mail For','2024-05-09 07:43:14','2024-05-09 07:43:14'),(790,1,'mail_settings','email','Email address for which you want to send test mail','2024-05-09 07:43:14','2024-05-09 07:43:14'),(791,1,'mail_settings','test_mail_sent_successfully','Test mail sent successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(792,1,'mail_settings','stock_adjustment_create','Stock Adjustment Create','2024-05-09 07:43:14','2024-05-09 07:43:14'),(793,1,'mail_settings','notificaiton_will_be_sent_to_warehouse','Notification will be sent to warehouse email','2024-05-09 07:43:14','2024-05-09 07:43:14'),(794,1,'online_orders','order_summary','Order Summary','2024-05-09 07:43:14','2024-05-09 07:43:14'),(795,1,'online_orders','cancel_order','Cancel Order','2024-05-09 07:43:14','2024-05-09 07:43:14'),(796,1,'online_orders','order_cancelled','Order cancelled successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(797,1,'online_orders','order_cancelled_message','This order has been cancelled.','2024-05-09 07:43:14','2024-05-09 07:43:14'),(798,1,'online_orders','cancel_message','Are you sure you want to cancel this online order','2024-05-09 07:43:14','2024-05-09 07:43:14'),(799,1,'online_orders','deliver_message','Are you sure you want to this order as delivered','2024-05-09 07:43:14','2024-05-09 07:43:14'),(800,1,'online_orders','order_confirmed','Order confirmed successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(801,1,'online_orders','order_status_changed','Order status changed successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(802,1,'online_orders','online_orders_date','Order Date','2024-05-09 07:43:14','2024-05-09 07:43:14'),(803,1,'online_orders','online_orders_status','Order Status','2024-05-09 07:43:14','2024-05-09 07:43:14'),(804,1,'online_orders','update_orders_status','Update Order Status','2024-05-09 07:43:14','2024-05-09 07:43:14'),(805,1,'online_orders','confirm_delivery','Confirm Delivery','2024-05-09 07:43:14','2024-05-09 07:43:14'),(806,1,'online_orders','order_delivered','Order delivered successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(807,1,'online_orders','user','Customer','2024-05-09 07:43:14','2024-05-09 07:43:14'),(808,1,'online_orders','online_store_url','Online Store Url','2024-05-09 07:43:14','2024-05-09 07:43:14'),(809,1,'product_card','add','Add New Product Card','2024-05-09 07:43:14','2024-05-09 07:43:14'),(810,1,'product_card','edit','Edit Product Card','2024-05-09 07:43:14','2024-05-09 07:43:14'),(811,1,'product_card','details','Product Card Details','2024-05-09 07:43:14','2024-05-09 07:43:14'),(812,1,'product_card','created','Product Card Created Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(813,1,'product_card','updated','Product Card Updated Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(814,1,'product_card','deleted','Product Card Deleted Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(815,1,'product_card','delete_message','Are you sure you want to delete this product card?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(816,1,'product_card','selected_delete_message','Are you sure you want to delete selected product card?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(817,1,'product_card','title','Title','2024-05-09 07:43:14','2024-05-09 07:43:14'),(818,1,'product_card','subtitle','Subtitle','2024-05-09 07:43:14','2024-05-09 07:43:14'),(819,1,'product_card','products','Products','2024-05-09 07:43:14','2024-05-09 07:43:14'),(820,1,'front_setting','products','Products','2024-05-09 07:43:14','2024-05-09 07:43:14'),(821,1,'front_setting','featured_categories','Featured Categories','2024-05-09 07:43:14','2024-05-09 07:43:14'),(822,1,'front_setting','featured_categories_title','Featured Categories Title','2024-05-09 07:43:14','2024-05-09 07:43:14'),(823,1,'front_setting','featured_categories_subtitle','Featured Categories Subtitle','2024-05-09 07:43:14','2024-05-09 07:43:14'),(824,1,'front_setting','featured_products','Featured Products','2024-05-09 07:43:14','2024-05-09 07:43:14'),(825,1,'front_setting','featured_products_title','Featured Products Title','2024-05-09 07:43:14','2024-05-09 07:43:14'),(826,1,'front_setting','featured_products_subtitle','Featured Products Subtitle','2024-05-09 07:43:14','2024-05-09 07:43:14'),(827,1,'front_setting','social_links','Social Links','2024-05-09 07:43:14','2024-05-09 07:43:14'),(828,1,'front_setting','facebook','Facebook','2024-05-09 07:43:14','2024-05-09 07:43:14'),(829,1,'front_setting','twitter','Twitter','2024-05-09 07:43:14','2024-05-09 07:43:14'),(830,1,'front_setting','instagram','Instagram','2024-05-09 07:43:14','2024-05-09 07:43:14'),(831,1,'front_setting','linkedin','Linkedin','2024-05-09 07:43:14','2024-05-09 07:43:14'),(832,1,'front_setting','youtube','Youttube','2024-05-09 07:43:14','2024-05-09 07:43:14'),(833,1,'front_setting','footer','Footer','2024-05-09 07:43:14','2024-05-09 07:43:14'),(834,1,'front_setting','banners','Banners','2024-05-09 07:43:14','2024-05-09 07:43:14'),(835,1,'front_setting','placeholder_social_text','Please Enter {0} Url','2024-05-09 07:43:14','2024-05-09 07:43:14'),(836,1,'front_setting','footers','Footers','2024-05-09 07:43:14','2024-05-09 07:43:14'),(837,1,'front_setting','copyright_text','Copyright Text','2024-05-09 07:43:14','2024-05-09 07:43:14'),(838,1,'front_setting','addLink','Add Link','2024-05-09 07:43:14','2024-05-09 07:43:14'),(839,1,'front_setting','addContactLink','Add Contact Link','2024-05-09 07:43:14','2024-05-09 07:43:14'),(840,1,'front_setting','addPageDetails','Add Pages Details','2024-05-09 07:43:14','2024-05-09 07:43:14'),(841,1,'front_setting','required_text','{0} Required','2024-05-09 07:43:14','2024-05-09 07:43:14'),(842,1,'front_setting','footer_page_widget','Footer Page Widget','2024-05-09 07:43:14','2024-05-09 07:43:14'),(843,1,'front_setting','footer_contact_widget','Footer Contact Widget','2024-05-09 07:43:14','2024-05-09 07:43:14'),(844,1,'front_setting','footer_links_widget','Footer Links Widget','2024-05-09 07:43:14','2024-05-09 07:43:14'),(845,1,'front_setting','bottom_banners','Bottom Banners','2024-05-09 07:43:14','2024-05-09 07:43:14'),(846,1,'front_setting','top_banners_1','Top Banner 1','2024-05-09 07:43:14','2024-05-09 07:43:14'),(847,1,'front_setting','top_banners_2','Top Banner 2','2024-05-09 07:43:14','2024-05-09 07:43:14'),(848,1,'front_setting','top_banners_3','Top Banner 3','2024-05-09 07:43:14','2024-05-09 07:43:14'),(849,1,'front_setting','add_to_cart','Add To Cart','2024-05-09 07:43:14','2024-05-09 07:43:14'),(850,1,'front_setting','footer_company_description','Footer Company Description','2024-05-09 07:43:14','2024-05-09 07:43:14'),(851,1,'front_setting','useful_links','Useful Links','2024-05-09 07:43:14','2024-05-09 07:43:14'),(852,1,'front_setting','pages','Pages','2024-05-09 07:43:14','2024-05-09 07:43:14'),(853,1,'front_setting','contact','Contact','2024-05-09 07:43:14','2024-05-09 07:43:14'),(854,1,'front_setting','all_categories','All Categories','2024-05-09 07:43:14','2024-05-09 07:43:14'),(855,1,'front_setting','no_results','No Results','2024-05-09 07:43:14','2024-05-09 07:43:14'),(856,1,'front_setting','seo_keywords','SEO Keywords','2024-05-09 07:43:14','2024-05-09 07:43:14'),(857,1,'front_setting','seo_description','SEO Description','2024-05-09 07:43:14','2024-05-09 07:43:14'),(858,1,'stock_adjustment','add','Add New Adjustment','2024-05-09 07:43:14','2024-05-09 07:43:14'),(859,1,'stock_adjustment','edit','Edit Adjustment','2024-05-09 07:43:14','2024-05-09 07:43:14'),(860,1,'stock_adjustment','details','Adjustment Details','2024-05-09 07:43:14','2024-05-09 07:43:14'),(861,1,'stock_adjustment','created','Adjustment Created Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(862,1,'stock_adjustment','updated','Adjustment Updated Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(863,1,'stock_adjustment','deleted','Adjustment Deleted Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(864,1,'stock_adjustment','delete_message','Are you sure you want to delete this stock adjustment?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(865,1,'stock_adjustment','selected_delete_message','Are you sure you want to delete selected stock adjustment?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(866,1,'stock_adjustment','notes','Notes','2024-05-09 07:43:14','2024-05-09 07:43:14'),(867,1,'stock_adjustment','current_stock','Current Stock','2024-05-09 07:43:14','2024-05-09 07:43:14'),(868,1,'stock_adjustment','quantity','Quantity','2024-05-09 07:43:14','2024-05-09 07:43:14'),(869,1,'stock_adjustment','adjustment_type','Adjustment Type','2024-05-09 07:43:14','2024-05-09 07:43:14'),(870,1,'stock_adjustment','adjustment_add','Add','2024-05-09 07:43:14','2024-05-09 07:43:14'),(871,1,'stock_adjustment','adjustment_subtract','Subtract','2024-05-09 07:43:14','2024-05-09 07:43:14'),(872,1,'stock_transfer','add','Add New Transfer','2024-05-09 07:43:14','2024-05-09 07:43:14'),(873,1,'stock_transfer','edit','Edit Transfer','2024-05-09 07:43:14','2024-05-09 07:43:14'),(874,1,'stock_transfer','details','Transfer Details','2024-05-09 07:43:14','2024-05-09 07:43:14'),(875,1,'stock_transfer','created','Transfer Created Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(876,1,'stock_transfer','updated','Transfer Updated Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(877,1,'stock_transfer','deleted','Transfer Deleted Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(878,1,'stock_transfer','delete_message','Are you sure you want to delete this stock adjustment?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(879,1,'stock_transfer','selected_delete_message','Are you sure you want to delete selected stock adjustment?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(880,1,'stock_transfer','stock_transfer_date','Stock Transfer Date','2024-05-09 07:43:14','2024-05-09 07:43:14'),(881,1,'stock_transfer','stock_transfer_status','Stock Transfer Status','2024-05-09 07:43:14','2024-05-09 07:43:14'),(882,1,'stock_transfer','stock_transfer_transfered','Stock Transfer Transfered','2024-05-09 07:43:14','2024-05-09 07:43:14'),(883,1,'stock_transfer','stock_transfer_received','Stock Transfer Received','2024-05-09 07:43:14','2024-05-09 07:43:14'),(884,1,'stock_transfer','from_warehouse','From Warehouse','2024-05-09 07:43:14','2024-05-09 07:43:14'),(885,1,'stock_transfer','to_warehouse','To Warehouse','2024-05-09 07:43:14','2024-05-09 07:43:14'),(886,1,'stock_transfer','warehouse','Warehouse','2024-05-09 07:43:14','2024-05-09 07:43:14'),(887,1,'stock_transfer','products','Products','2024-05-09 07:43:14','2024-05-09 07:43:14'),(888,1,'stock_transfer','notes','Notes','2024-05-09 07:43:14','2024-05-09 07:43:14'),(889,1,'stock_transfer','quantity','Quantity','2024-05-09 07:43:14','2024-05-09 07:43:14'),(890,1,'stock_transfer','created_by','Created By','2024-05-09 07:43:14','2024-05-09 07:43:14'),(891,1,'stock_transfer','received','Received','2024-05-09 07:43:14','2024-05-09 07:43:14'),(892,1,'stock_transfer','transfered','Transfered','2024-05-09 07:43:14','2024-05-09 07:43:14'),(893,1,'database_backup','file','File','2024-05-09 07:43:14','2024-05-09 07:43:14'),(894,1,'database_backup','file_size','File Size','2024-05-09 07:43:14','2024-05-09 07:43:14'),(895,1,'database_backup','generate_backup','Generate Backup','2024-05-09 07:43:14','2024-05-09 07:43:14'),(896,1,'database_backup','delete_backup','Delete Backup','2024-05-09 07:43:14','2024-05-09 07:43:14'),(897,1,'database_backup','backup_generated_successfully','Backup Generated Successfully','2024-05-09 07:43:14','2024-05-09 07:43:14'),(898,1,'database_backup','are_you_sure_generate_backup','Are you sure you want to generate database backup?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(899,1,'database_backup','are_you_sure_delete_backup','Are you sure you want to delete this database backup?','2024-05-09 07:43:14','2024-05-09 07:43:14'),(900,1,'database_backup','backup_locaion_is','All generated database file will be stored in storage/app/public/backup folder. ','2024-05-09 07:43:14','2024-05-09 07:43:14'),(901,1,'database_backup','settings','Command Settings','2024-05-09 07:43:15','2024-05-09 07:43:15'),(902,1,'database_backup','backup_command_setting','Backup Command Settings','2024-05-09 07:43:15','2024-05-09 07:43:15'),(903,1,'database_backup','mysqldump_command_path','mysqldump command path','2024-05-09 07:43:15','2024-05-09 07:43:15'),(904,1,'database_backup','command_updated','Command updated successfully','2024-05-09 07:43:15','2024-05-09 07:43:15'),(905,1,'database_backup','window_command_path','If you use XAMPP then it will be => C:\\xampp\\mysql\\bin\\mysqldump.exe','2024-05-09 07:43:15','2024-05-09 07:43:15'),(906,1,'database_backup','laragon_command_path','If you use Laragon then it will be => C:\\laragon\\bin\\mysql\\mysql-5.7.24-winx64\\bin\\mysqldump.exe','2024-05-09 07:43:15','2024-05-09 07:43:15'),(907,1,'database_backup','linux_command_path','If you are on ubuntu or mac then run following command and enter output here => which mysqldump','2024-05-09 07:43:15','2024-05-09 07:43:15'),(908,1,'database_backup','put_dump_path_command_on_env_file','Find your MySQL dump path from below and then add it to the DUMP_PATH inside .env file','2024-05-09 07:43:15','2024-05-09 07:43:15'),(909,1,'messages','product_out_of_stock','Product is out of stock. Current Stock is {0} while required stock is {1}.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(910,1,'messages','leave_blank_to_create_parent_category','Leave it blank to create parent category','2024-05-09 07:43:15','2024-05-09 07:43:15'),(911,1,'messages','somehing_went_wrong','Something went wrong. Please contact to administrator.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(912,1,'messages','verify_success','Successfully verified. Redirect to app...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(913,1,'messages','login_success','Successfully login. Redirect to app...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(914,1,'messages','login_success_dashboard','Successfully logged into app.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(915,1,'messages','click_here_to_find_purchase_code','Click here to find your purchase code','2024-05-09 07:43:15','2024-05-09 07:43:15'),(916,1,'messages','verification_successfull','Verification successfully','2024-05-09 07:43:15','2024-05-09 07:43:15'),(917,1,'messages','other_domain_linked','Other domain linked','2024-05-09 07:43:15','2024-05-09 07:43:15'),(918,1,'messages','other_domain_linked_with_purchase_code','Other domain is already linked with your purchase code. Please enter your purchase code for more details...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(919,1,'messages','first_verify_module_message','To enable please \\n verify this module','2024-05-09 07:43:15','2024-05-09 07:43:15'),(920,1,'messages','are_you_sure_install_message','Are you sure you want to install?','2024-05-09 07:43:15','2024-05-09 07:43:15'),(921,1,'messages','downloading_started_message','Downloading started. Please wait ...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(922,1,'messages','file_extracting_message','File extracteding. Please wait ...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(923,1,'messages','installation_success','Installation successfully. Click here to reload page...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(924,1,'messages','are_you_sure_update_message','Are you sure you want to update? Please take backup before update.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(925,1,'messages','stmp_success_message','Your SMTP settings are correct..','2024-05-09 07:43:15','2024-05-09 07:43:15'),(926,1,'messages','stmp_error_message','Your SMTP settings are incorrect. Please update it to send mails','2024-05-09 07:43:15','2024-05-09 07:43:15'),(927,1,'messages','uploading_failed','Uploading failed','2024-05-09 07:43:15','2024-05-09 07:43:15'),(928,1,'messages','loading_app_message','Please wait... we are preparing something amazing for you','2024-05-09 07:43:15','2024-05-09 07:43:15'),(929,1,'messages','fetching_product_details','We are fetching product details. Please wait...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(930,1,'messages','product_is_upto_date','You are on the latest version of app.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(931,1,'messages','new_app_version_avaialbe','New app version {0} is available. Please update to get latest version.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(932,1,'messages','not_able_to_edit_order','Only order status editable, other fields can not be editable becuase this order linked to some payments. Delete those payment(s) and try again.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(933,1,'messages','click_here_to_download_sample_file','Click here to download sample csv file','2024-05-09 07:43:15','2024-05-09 07:43:15'),(934,1,'messages','imported_successfully','Imported Successfully','2024-05-09 07:43:15','2024-05-09 07:43:15'),(935,1,'messages','company_admin_password_message','Admin will login using this password. (Leave blank to keep current password)','2024-05-09 07:43:15','2024-05-09 07:43:15'),(936,1,'messages','email_setting_not_configured','Email setting not configured','2024-05-09 07:43:15','2024-05-09 07:43:15'),(937,1,'messages','please_configure_email_settings','Please configure your email settings to send emails. Click Here to configure email settings.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(938,1,'popover','quantitiy_alert','After this stock quanity it will enable low stock warning.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(939,1,'popover','auto_detect_timezone','Allow auto detect timezone from browser for currently logged in user.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(940,1,'popover','click_here_to_copy_credentials','Click here to copy {0} credentials','2024-05-09 07:43:15','2024-05-09 07:43:15'),(941,1,'invoice','purchase_invoice','Purchase Invoice','2024-05-09 07:43:15','2024-05-09 07:43:15'),(942,1,'invoice','purchase_return_invoice','Purchase Return Invoice','2024-05-09 07:43:15','2024-05-09 07:43:15'),(943,1,'invoice','sales_invoice','Sales Invoice','2024-05-09 07:43:15','2024-05-09 07:43:15'),(944,1,'invoice','sales_return_invoice','Sales Return Invoice','2024-05-09 07:43:15','2024-05-09 07:43:15'),(945,1,'invoice','invoice','Invoice','2024-05-09 07:43:15','2024-05-09 07:43:15'),(946,1,'invoice','order_date','Date','2024-05-09 07:43:15','2024-05-09 07:43:15'),(947,1,'invoice','order_status','Status','2024-05-09 07:43:15','2024-05-09 07:43:15'),(948,1,'invoice','payment_status','Payment Status','2024-05-09 07:43:15','2024-05-09 07:43:15'),(949,1,'invoice','bill_to','Bill To','2024-05-09 07:43:15','2024-05-09 07:43:15'),(950,1,'invoice','product','Product','2024-05-09 07:43:15','2024-05-09 07:43:15'),(951,1,'invoice','unit_price','Unit Price','2024-05-09 07:43:15','2024-05-09 07:43:15'),(952,1,'invoice','quantity','Quantity','2024-05-09 07:43:15','2024-05-09 07:43:15'),(953,1,'invoice','total','Total','2024-05-09 07:43:15','2024-05-09 07:43:15'),(954,1,'invoice','mrp','MRP','2024-05-09 07:43:15','2024-05-09 07:43:15'),(955,1,'invoice','notes','Notes','2024-05-09 07:43:15','2024-05-09 07:43:15'),(956,1,'invoice','subtotal','Subtotal','2024-05-09 07:43:15','2024-05-09 07:43:15'),(957,1,'invoice','tax','Tax','2024-05-09 07:43:15','2024-05-09 07:43:15'),(958,1,'invoice','discount','Discount','2024-05-09 07:43:15','2024-05-09 07:43:15'),(959,1,'invoice','shipping','Shipping','2024-05-09 07:43:15','2024-05-09 07:43:15'),(960,1,'invoice','total_items','Total Items','2024-05-09 07:43:15','2024-05-09 07:43:15'),(961,1,'invoice','qty','Qty','2024-05-09 07:43:15','2024-05-09 07:43:15'),(962,1,'invoice','paid_amount','Paid Amount','2024-05-09 07:43:15','2024-05-09 07:43:15'),(963,1,'invoice','due_amount','Due Amount','2024-05-09 07:43:15','2024-05-09 07:43:15'),(964,1,'invoice','payment_mode','Payment Mode','2024-05-09 07:43:15','2024-05-09 07:43:15'),(965,1,'invoice','total_discount_on_mrp','Total Discount On MRP','2024-05-09 07:43:15','2024-05-09 07:43:15'),(966,1,'invoice','total_discount','Total Discount','2024-05-09 07:43:15','2024-05-09 07:43:15'),(967,1,'invoice','total_tax','Total Tax','2024-05-09 07:43:15','2024-05-09 07:43:15'),(968,1,'invoice','thanks_message','Thank You For Shopping With Us. Please Come Again','2024-05-09 07:43:15','2024-05-09 07:43:15'),(969,1,'invoice','quotation_invoice','Quotation Invoice','2024-05-09 07:43:15','2024-05-09 07:43:15'),(970,1,'invoice','terms_condition','Terms & Conditions','2024-05-09 07:43:15','2024-05-09 07:43:15'),(971,1,'front','home','Home','2024-05-09 07:43:15','2024-05-09 07:43:15'),(972,1,'front','profile','Profile','2024-05-09 07:43:15','2024-05-09 07:43:15'),(973,1,'front','dashboard','Dashboard','2024-05-09 07:43:15','2024-05-09 07:43:15'),(974,1,'front','my_orders','My Orders','2024-05-09 07:43:15','2024-05-09 07:43:15'),(975,1,'front','my_profile','My Profile','2024-05-09 07:43:15','2024-05-09 07:43:15'),(976,1,'front','logout','Logout','2024-05-09 07:43:15','2024-05-09 07:43:15'),(977,1,'front','total_orders','Total Orders','2024-05-09 07:43:15','2024-05-09 07:43:15'),(978,1,'front','pending_orders','Pending Orders','2024-05-09 07:43:15','2024-05-09 07:43:15'),(979,1,'front','processing_orders','Processing Orders','2024-05-09 07:43:15','2024-05-09 07:43:15'),(980,1,'front','completed_orders','Completed Orders','2024-05-09 07:43:15','2024-05-09 07:43:15'),(981,1,'front','recent_orders','Recent Orders','2024-05-09 07:43:15','2024-05-09 07:43:15'),(982,1,'front','order_history','Order History','2024-05-09 07:43:15','2024-05-09 07:43:15'),(983,1,'front','profile_settings','Profile Settings','2024-05-09 07:43:15','2024-05-09 07:43:15'),(984,1,'front','select_shipping_address','Select Shipping Address','2024-05-09 07:43:15','2024-05-09 07:43:15'),(985,1,'front','checkout_page','Checkout Page','2024-05-09 07:43:15','2024-05-09 07:43:15'),(986,1,'front','address_details','Address Details','2024-05-09 07:43:15','2024-05-09 07:43:15'),(987,1,'front','payment_details','Payment Details','2024-05-09 07:43:15','2024-05-09 07:43:15'),(988,1,'front','add_new_address','Add New Address','2024-05-09 07:43:15','2024-05-09 07:43:15'),(989,1,'front','cash_on_delivery','Cash On Delivery','2024-05-09 07:43:15','2024-05-09 07:43:15'),(990,1,'front','continue_shopping','Continue Shopping','2024-05-09 07:43:15','2024-05-09 07:43:15'),(991,1,'front','confirm_order','Confirm Order','2024-05-09 07:43:15','2024-05-09 07:43:15'),(992,1,'front','confirm_order_message','Are you sure you want to confirm this order?','2024-05-09 07:43:15','2024-05-09 07:43:15'),(993,1,'front','order_placed','Order placeded.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(994,1,'front','order_placed_message','Order placed successfully.','2024-05-09 07:43:15','2024-05-09 07:43:15'),(995,1,'front','all_orders','All Orders','2024-05-09 07:43:15','2024-05-09 07:43:15'),(996,1,'front','follow_us','Follow Us','2024-05-09 07:43:15','2024-05-09 07:43:15'),(997,1,'front','categories','Categories','2024-05-09 07:43:15','2024-05-09 07:43:15'),(998,1,'front','pages','Pages','2024-05-09 07:43:15','2024-05-09 07:43:15'),(999,1,'front','address_deleted','Address Deleted','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1000,1,'front','address_saved','Address Saved','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1001,1,'front','address_delete_message','Are you sure you want to delete this address?','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1002,1,'front','setting_updated_successfully','Setting updated successfully','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1003,1,'front','login','Login','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1004,1,'front','login_using_email_password','Login using email and password','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1005,1,'front','logged_in_successfully','Logged in successfully','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1006,1,'front','dont_have_account','Don\'t have account?','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1007,1,'front','signup','Signup','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1008,1,'front','signup_using_email_password','Signup using email & password','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1009,1,'front','already_have_account','Already have account','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1010,1,'front','register_successfully','Registered successfully','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1011,1,'front','click_here_to_login','Click here to login','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1012,1,'topbar_add_button','add_staff_member','Add Staff Member','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1013,1,'topbar_add_button','add_customer','Add Customer','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1014,1,'topbar_add_button','add_supplier','Add Supplier','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1015,1,'topbar_add_button','add_brand','Add Brand','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1016,1,'topbar_add_button','add_category','Add Category','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1017,1,'topbar_add_button','add_product','Add Product','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1018,1,'topbar_add_button','add_sales','Add Sales','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1019,1,'topbar_add_button','add_purchase','Add Purchase','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1020,1,'topbar_add_button','add_expense_cateogory','Add Expense Category','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1021,1,'topbar_add_button','add_expense','Add Expense','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1022,1,'topbar_add_button','add_currency','Add Currency','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1023,1,'topbar_add_button','add_warehouse','Add Warehouse','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1024,1,'topbar_add_button','add_unit','Add Unit','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1025,1,'topbar_add_button','add_language','Add Language','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1026,1,'topbar_add_button','add_role','Add Role','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1027,1,'topbar_add_button','add_tax','Add Tax','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1028,1,'topbar_add_button','add_payment_mode','Add Payment Mode','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1029,1,'setup_company','setup_not_completed','Setup Not Completed','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1030,1,'setup_company','setup_not_completed_description','Your company default settings not completed. Follow below setups to complete your company basic settings...','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1031,1,'setup_company','warehouse','Warehouse','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1032,1,'setup_company','add_first_warehouse','Add First Warehouse','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1033,1,'setup_company','currency','Currency','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1034,1,'setup_company','add_first_currency','Add First Currency','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1035,1,'setup_company','payment_mode','Payment Mode','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1036,1,'setup_company','add_payment_mode','Add First Payment Mode','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1037,1,'setup_company','company_settings','Company Settings','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1038,1,'setup_company','set_company_basic_settings','Setup Company Basic Settings','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1039,1,'setup_company','previous_step','Previous Step','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1040,1,'setup_company','next_step','Next Step','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1041,1,'setup_company','basic_settings','Basic Settings','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1042,1,'setup_company','theme_settings','Theme Settings','2024-05-09 07:43:15','2024-05-09 07:43:15'),(1043,1,'setup_company','logo_settings','Logo Settings','2024-05-09 07:43:16','2024-05-09 07:43:16'),(1044,1,'setup_company','save_finish_setup','Save & Finish Setup','2024-05-09 07:43:16','2024-05-09 07:43:16'),(1045,1,'setup_company','go_to_dashboard','Go To Dashboard','2024-05-09 07:43:16','2024-05-09 07:43:16'),(1046,1,'setup_company','setup_running_message','Please wait... we are setting up inital company settings.','2024-05-09 07:43:16','2024-05-09 07:43:16'),(1047,1,'setup_company','setup_complete_message','Setup completed... Click on below link to view your app...','2024-05-09 07:43:16','2024-05-09 07:43:16');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_parent_id_foreign` (`parent_id`),
  KEY `units_company_id_foreign` (`company_id`),
  CONSTRAINT `units_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `units_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_address_user_id_foreign` (`user_id`),
  KEY `user_address_company_id_foreign` (`company_id`),
  CONSTRAINT `user_address_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `opening_balance` double NOT NULL DEFAULT 0,
  `opening_balance_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'receive',
  `credit_period` int(11) NOT NULL DEFAULT 0,
  `credit_limit` double NOT NULL DEFAULT 0,
  `purchase_order_count` int(11) NOT NULL DEFAULT 0,
  `purchase_return_count` int(11) NOT NULL DEFAULT 0,
  `sales_order_count` int(11) NOT NULL DEFAULT 0,
  `sales_return_count` int(11) NOT NULL DEFAULT 0,
  `total_amount` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `due_amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_warehouse_id_foreign` (`warehouse_id`),
  KEY `user_details_user_id_foreign` (`user_id`),
  CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_details_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,1,3,0,'receive',30,0,0,0,0,0,0,0,0,'2024-05-09 07:47:59','2024-05-09 07:47:59');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_warehouse`
--

DROP TABLE IF EXISTS `user_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_warehouse` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_warehouse_user_id_foreign` (`user_id`),
  KEY `user_warehouse_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `user_warehouse_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_warehouse_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_warehouse`
--

LOCK TABLES `user_warehouse` WRITE;
/*!40000 ALTER TABLE `user_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `is_superadmin` tinyint(1) NOT NULL DEFAULT 0,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `lang_id` bigint(20) unsigned DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customers',
  `is_walkin_customer` tinyint(1) NOT NULL DEFAULT 0,
  `login_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verification_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `reset_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `date_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'd-m-Y',
  `date_picker_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dd-mm-yyyy',
  `time_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i a',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_warehouse_id_foreign` (`warehouse_id`),
  KEY `users_company_id_foreign` (`company_id`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_lang_id_foreign` (`lang_id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,0,1,1,1,'staff_members',0,1,'Admin','admin@example.com','$2y$10$sQ6FI9nejzg3wiUWi1KpPODEnvkYqPeatgcaXT7jUzVwMdki8RDvO',NULL,NULL,NULL,NULL,NULL,'enabled',NULL,'Asia/Kolkata','d-m-Y','dd-mm-yyyy','h:i a',NULL,NULL,NULL,'2024-05-09 07:49:19'),(2,2,1,NULL,NULL,1,'super_admins',0,1,'Super Admin','superadmin@example.com','$2y$10$YH/fXDgF3Ho9G80RmzJ.euQ6HUW6kr/LvFLRxjY.QHBWDaaaTiu22',NULL,NULL,NULL,NULL,NULL,'enabled',NULL,'Asia/Kolkata','d-m-Y','dd-mm-yyyy','h:i a',NULL,NULL,'2024-05-09 07:43:31','2024-05-09 07:43:31'),(3,1,0,NULL,NULL,1,'customers',1,0,'Walk In Customer','walkin@email.com',NULL,'+911111111111',NULL,'address','shipping address',NULL,'enabled',NULL,'Asia/Kolkata','d-m-Y','dd-mm-yyyy','h:i a',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variations_company_id_foreign` (`company_id`),
  KEY `variations_parent_id_foreign` (`parent_id`),
  CONSTRAINT `variations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `variations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_history`
--

DROP TABLE IF EXISTS `warehouse_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `order_item_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `payment_id` bigint(20) unsigned DEFAULT NULL,
  `expense_id` bigint(20) unsigned DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_history_warehouse_id_foreign` (`warehouse_id`),
  KEY `warehouse_history_user_id_foreign` (`user_id`),
  KEY `warehouse_history_order_id_foreign` (`order_id`),
  KEY `warehouse_history_order_item_id_foreign` (`order_item_id`),
  KEY `warehouse_history_product_id_foreign` (`product_id`),
  KEY `warehouse_history_payment_id_foreign` (`payment_id`),
  KEY `warehouse_history_expense_id_foreign` (`expense_id`),
  KEY `warehouse_history_staff_user_id_foreign` (`staff_user_id`),
  KEY `warehouse_history_company_id_foreign` (`company_id`),
  CONSTRAINT `warehouse_history_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_staff_user_id_foreign` FOREIGN KEY (`staff_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_history_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_history`
--

LOCK TABLES `warehouse_history` WRITE;
/*!40000 ALTER TABLE `warehouse_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_stocks`
--

DROP TABLE IF EXISTS `warehouse_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `stock_quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_stocks_warehouse_id_foreign` (`warehouse_id`),
  KEY `warehouse_stocks_product_id_foreign` (`product_id`),
  KEY `warehouse_stocks_company_id_foreign` (`company_id`),
  CONSTRAINT `warehouse_stocks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_stocks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_stocks`
--

LOCK TABLES `warehouse_stocks` WRITE;
/*!40000 ALTER TABLE `warehouse_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_email_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `show_phone_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_condition` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_store_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `customers_visibility` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `suppliers_visibility` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `products_visibility` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `default_pos_order_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivered',
  `show_mrp_on_invoice` tinyint(1) NOT NULL DEFAULT 1,
  `show_discount_tax_on_invoice` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouses_company_id_foreign` (`company_id`),
  CONSTRAINT `warehouses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,1,NULL,NULL,'My Warehouse','my-warehouse-j51k90rj','myw@mail.com','9990999099',0,0,NULL,'1. Goods once sold will not be taken back or exchanged\n2. All disputes are subject to [ENTER_YOUR_CITY_NAME] jurisdiction only',NULL,NULL,1,'all','all','all','delivered',1,1,'2024-05-09 07:47:59','2024-05-09 07:47:59');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 18:53:00
