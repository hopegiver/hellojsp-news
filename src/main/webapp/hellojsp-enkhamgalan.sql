-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.44-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for hellojsp-news(enkhamgalan)
DROP DATABASE IF EXISTS `hellojsp-news(enkhamgalan)`;
CREATE DATABASE IF NOT EXISTS `hellojsp-news(enkhamgalan)` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `hellojsp-news(enkhamgalan)`;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_admin
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(100) DEFAULT NULL,
  `passwd` varchar(200) DEFAULT NULL,
  `phone_num` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  `reg_date` varchar(14) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_admin: ~0 rows (approximately)
DELETE FROM `tb_admin`;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` (`id`, `login_id`, `passwd`, `phone_num`, `email`, `auth_key`, `reg_date`, `status`) VALUES
	(1, 'admin', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '99999999', 'admin@gmail.com', NULL, '20200303092031', 1);
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_banner
DROP TABLE IF EXISTS `tb_banner`;
CREATE TABLE IF NOT EXISTS `tb_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `photo_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_banner: ~2 rows (approximately)
DELETE FROM `tb_banner`;
/*!40000 ALTER TABLE `tb_banner` DISABLE KEYS */;
INSERT INTO `tb_banner` (`id`, `title`, `content`, `photo_name`, `photo_url`, `reg_date`, `status`) VALUES
	(1, 'Highcharts Demo', 'Highcharts Demo Highcharts Demo Highcharts DemoHighcharts DemoHighcharts DemoHighcharts Demo Highcharts Demo vvHighcharts Demo', 'slide-1.jpg', 'b7ac4c2bd0ab6743c30a0e595950d2f0f927e3ee.jpg', '20200304161430', 1),
	(2, 'World is greater than five #ELPolitic', 'WITH ELPOLITIC RESPONSIVE LANDING PAGE TEMPLATE, YOU CAN SHOWCASE YOUR NEXT POLITICS & POLITICIAN WEBSITES!', 'slide-2.jpg', '9ba3841481d50bcbda73418bd51d51789a1bd77e.jpg', '20200304161504', 1);
/*!40000 ALTER TABLE `tb_banner` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_blog
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE IF NOT EXISTS `tb_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `att_file_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `att_file_code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_blog: ~8 rows (approximately)
DELETE FROM `tb_blog`;
/*!40000 ALTER TABLE `tb_blog` DISABLE KEYS */;
INSERT INTO `tb_blog` (`id`, `subject`, `content`, `att_file_name`, `att_file_code`, `reg_date`, `status`) VALUES
	(1, 'Nice to meet you. 1581982730', 'Nice to meet you too.', NULL, NULL, '20200218073307', 1),
	(2, '22222', '22222', NULL, NULL, '20200218073314', 1),
	(3, '44444', '333333', NULL, NULL, '20200218073325', -1),
	(4, '33333', '332222', 'daily.png', '733f09819b0e696023c45e3d81ba9073323e3783.png', '20200218073914', 1),
	(5, '5555', '5555', '다운로드.jpg', '904f7dad1b10cbcf1a4382f2fbf1b3d9264c56eb.jpg', '20200218074123', 1),
	(6, 'Nice to meet you.', 'Nice to meet you too.', NULL, NULL, '20200218095028', 1),
	(7, 'test', 'sssereqwe', 'magnifier.png', '7d8d254a9c23069b7ae6b24558988a9dd20f18ef.png', '20200229012844', 1),
	(8, 'test', 'sssss', 'menuService.jpg', '7e4c4d286e226187067d4b169436595b7ea7ec00.jpg', '20200229013745', 1),
	(9, 'sdsss', 'dssss', '', '31740d0909364b7a41c327f89e4e6652afc77bda.', '20200229014128', -1),
	(10, '121242', 'kl;jkljjljlljjl', 'menuDao.png', '393f43320af02aef8a8e88426e1d3e6656369070.png', '20200229034821', 1),
	(11, 'test', 'blog content', 'slide-2.jpg', '09990deffb9a48f78dfd9c3098ab001679455727.jpg', '20200304153400', 1);
/*!40000 ALTER TABLE `tb_blog` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_cart
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE IF NOT EXISTS `tb_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT 'User ID',
  `session_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Session ID',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product ID',
  `quantity` int(11) DEFAULT NULL COMMENT 'Product Quantity',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registered Date',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_cart: ~0 rows (approximately)
DELETE FROM `tb_cart`;
/*!40000 ALTER TABLE `tb_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_category
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE IF NOT EXISTS `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent category ID',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Module Name',
  `category_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Category Name',
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Description',
  `sort` int(11) DEFAULT NULL COMMENT 'Order No',
  `module_cnt` int(11) DEFAULT NULL COMMENT 'Module Count',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_category: ~0 rows (approximately)
DELETE FROM `tb_category`;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_category_module
DROP TABLE IF EXISTS `tb_category_module`;
CREATE TABLE IF NOT EXISTS `tb_category_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(11) DEFAULT NULL COMMENT 'Category ID',
  `module_id` int(11) DEFAULT NULL COMMENT 'Module ID',
  `sort` int(11) DEFAULT NULL COMMENT 'Order No',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_module` (`category_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_category_module: ~0 rows (approximately)
DELETE FROM `tb_category_module`;
/*!40000 ALTER TABLE `tb_category_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_category_module` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_comment
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE IF NOT EXISTS `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Module name',
  `module_id` int(11) DEFAULT NULL COMMENT 'Module ID',
  `user_id` int(11) DEFAULT NULL COMMENT 'User ID',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent post ID',
  `writer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Writer',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'E-mail',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'Content',
  `score` int(11) DEFAULT NULL COMMENT 'Score',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registered Date',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_comment: ~0 rows (approximately)
DELETE FROM `tb_comment`;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_file
DROP TABLE IF EXISTS `tb_file`;
CREATE TABLE IF NOT EXISTS `tb_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Module name',
  `module_id` int(11) DEFAULT NULL COMMENT 'Module ID',
  `file_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'File name',
  `file_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'File code',
  `file_size` int(11) DEFAULT NULL COMMENT 'File size',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registered Date',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_file: ~0 rows (approximately)
DELETE FROM `tb_file`;
/*!40000 ALTER TABLE `tb_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_file` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_info
DROP TABLE IF EXISTS `tb_info`;
CREATE TABLE IF NOT EXISTS `tb_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_info: ~0 rows (approximately)
DELETE FROM `tb_info`;
/*!40000 ALTER TABLE `tb_info` DISABLE KEYS */;
INSERT INTO `tb_info` (`id`, `site_name`, `email`, `phone`, `telephone`, `address`, `reg_date`, `status`) VALUES
	(1, 'EL Politic', 'elpolitic@gmail.com', '11-022-5533', '22-558-4886', 'test Quisque eget nisl id nulla sagittis auctor quis id. Aliquam quis vehicula enim, ', '20200304194009', 1);
/*!40000 ALTER TABLE `tb_info` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_menu
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE IF NOT EXISTS `tb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Module name',
  `module_id` int(11) DEFAULT NULL COMMENT 'Module ID',
  `menu_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Menu name',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent menu ID',
  `sort` int(11) DEFAULT NULL COMMENT 'Order No',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registered Date',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_menu: ~6 rows (approximately)
DELETE FROM `tb_menu`;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` (`id`, `module`, `module_id`, `menu_name`, `parent_id`, `sort`, `reg_date`, `status`) VALUES
	(1, 'main-banner', 0, 'Home', 0, 1, '20200304103811', 1),
	(2, 'about', 1, 'About Us', 0, 2, '20200304104541', 1),
	(3, 'issues', 2, 'News', 0, 3, '20200304104811', 1),
	(4, 'gallery', 4, 'Gallery', 0, 4, '20200304104841', 1),
	(5, 'media', 5, 'Multimedia', 0, 5, '20200304104919', 1),
	(6, 'contact', 6, 'Contacts', 0, 7, '20200304104933', 1),
	(7, 'blog', 6, 'Blog', 0, 6, '20200305082608', 1),
	(8, 'test', 1, 'test', 0, 8, '20200305152922', -1);
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_news
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE IF NOT EXISTS `tb_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Type',
  `subject` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Title',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'Content',
  `photo_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Photo URL',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registered Date',
  `mod_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Updated Date',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_news: ~4 rows (approximately)
DELETE FROM `tb_news`;
/*!40000 ALTER TABLE `tb_news` DISABLE KEYS */;
INSERT INTO `tb_news` (`id`, `type`, `subject`, `content`, `photo_url`, `reg_date`, `mod_date`, `status`) VALUES
	(1, 'blog', 'test', 'test content', NULL, '20200228021011', '20200228021011', 0),
	(2, 'post', 'Test Tittle', 'test content getBarchartgetBarchartgetBarchartgetBarchart getBarchartgetBarchart', 'e74e8fa8cef6738ca5e979107448dc03b08e2d2e.png', '20200304091336', NULL, 1),
	(3, 'economic', 'Test Tittle', 'Etiam materials ut mollis tellus, vel posuere nulla. Etiam sit amet massa sodales aliquam at eget quam. Integer ultricies et magna quis.', '328f0109ec871e84cb3eb82175f0ec5649470f37.jpg', '20200304190141', NULL, 1),
	(4, 'photo', 'politic', 'politicpoliticpoliticpoliticpolitic politicpoliticpolitic politic politic politic', '5fa651d3746b005e9a9f733bfbc7e2a69d868f85.', '20200304190345', NULL, 1);
/*!40000 ALTER TABLE `tb_news` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_order
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE IF NOT EXISTS `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `billing_country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_price` decimal(10,2) DEFAULT NULL,
  `pay_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_order: ~0 rows (approximately)
DELETE FROM `tb_order`;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_order_product
DROP TABLE IF EXISTS `tb_order_product`;
CREATE TABLE IF NOT EXISTS `tb_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT 'Order ID',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product ID',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Product price',
  `quantity` int(11) DEFAULT NULL COMMENT 'Product quantity',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_order_product: ~0 rows (approximately)
DELETE FROM `tb_order_product`;
/*!40000 ALTER TABLE `tb_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_product` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_post
DROP TABLE IF EXISTS `tb_post`;
CREATE TABLE IF NOT EXISTS `tb_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT 'User ID',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Type',
  `subject` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Title',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'Content',
  `photo_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Photo URL',
  `comment_cnt` int(11) DEFAULT NULL COMMENT 'Comment count',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registered Date',
  `mod_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Updated Date',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_post: ~2 rows (approximately)
DELETE FROM `tb_post`;
/*!40000 ALTER TABLE `tb_post` DISABLE KEYS */;
INSERT INTO `tb_post` (`id`, `user_id`, `type`, `subject`, `content`, `photo_url`, `comment_cnt`, `reg_date`, `mod_date`, `status`) VALUES
	(1, 1, 'blog', 'test', 'test content', NULL, 1, '20200228021011', '20200228021011', 0),
	(2, 3, 'post', 'Test Tittle', 'test content getBarchartgetBarchartgetBarchartgetBarchart getBarchartgetBarchart', 'e74e8fa8cef6738ca5e979107448dc03b08e2d2e.png', 5, '20200304091336', NULL, 1);
/*!40000 ALTER TABLE `tb_post` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_product
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE IF NOT EXISTS `tb_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Product name',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Product price',
  `summary` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Summary',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Description',
  `comment_cnt` int(11) DEFAULT NULL COMMENT 'Comment count',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registered Date',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_product: ~0 rows (approximately)
DELETE FROM `tb_product`;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_product_info
DROP TABLE IF EXISTS `tb_product_info`;
CREATE TABLE IF NOT EXISTS `tb_product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product ID',
  `info_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Information name',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Description',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_product_info: ~0 rows (approximately)
DELETE FROM `tb_product_info`;
/*!40000 ALTER TABLE `tb_product_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_info` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_tag
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE IF NOT EXISTS `tb_tag` (
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tag',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Module name',
  `module_id` int(11) NOT NULL COMMENT 'Module ID',
  PRIMARY KEY (`tag`,`module`,`module_id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_tag: ~0 rows (approximately)
DELETE FROM `tb_tag`;
/*!40000 ALTER TABLE `tb_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tag` ENABLE KEYS */;

-- Dumping structure for table hellojsp-news(enkhamgalan).tb_user
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Login ID',
  `passwd` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Password',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nicname',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'E-mail',
  `photo_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Photo URL',
  `auth_key` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Authentication Key',
  `reg_date` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Registerd Date',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hellojsp-news(enkhamgalan).tb_user: ~3 rows (approximately)
DELETE FROM `tb_user`;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`id`, `login_id`, `passwd`, `nickname`, `email`, `photo_url`, `auth_key`, `reg_date`, `status`) VALUES
	(1, 'adminUser', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'adminUser', 'adminUser@yahoo.com', '60c7af562b28a10b724040a2b3b36800d58d01c0.', NULL, '20200229051333', 1),
	(2, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', 'test1', 'test@gmail.com', 'c9f78d6d5712af3aef17416205d964ef4a92c4f9.', NULL, '20200304082348', 1),
	(3, 'abcd', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'tessst', 'admin@yahoo.com', 'ca80392a79b641bf8096150847aa81dfe3636986.png', NULL, '20200304082816', 1),
	(4, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', 'tessst', 'test2@gmail.com', '18bc931a26bf2d0f5dfe722367535c26da939a79.', NULL, '20200305080846', 1);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
