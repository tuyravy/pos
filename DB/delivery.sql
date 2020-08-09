-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.35-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for rsk_group
CREATE DATABASE IF NOT EXISTS `rsk_group` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rsk_group`;

-- Dumping structure for table rsk_group.delivery
CREATE TABLE IF NOT EXISTS `delivery` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `wh_transfer_id` int(11) DEFAULT NULL COMMENT 'ware house transfer requested',
  `refference_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'can be invoce_no / transfer requested number',
  `driver_staff_id` int(11) DEFAULT NULL,
  `delivery_address` text COLLATE utf8_unicode_ci NOT NULL,
  `GPS_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_date` datetime NOT NULL,
  `delivery_cost` decimal(18,3) NOT NULL,
  `ccy` decimal(18,3) NOT NULL,
  `delivery_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recieved_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recieved_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_Date` datetime DEFAULT NULL,
  `authorized_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table rsk_group.delivery: ~16 rows (approximately)
DELETE FROM `delivery`;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` (`delivery_id`, `sale_id`, `wh_transfer_id`, `refference_no`, `driver_staff_id`, `delivery_address`, `GPS_address`, `delivery_date`, `delivery_cost`, `ccy`, `delivery_status`, `recieved_By`, `recieved_date`, `created_by`, `created_Date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	(1, 10011, 10018, '10000', 0, 'ភ្នំពេញ', NULL, '2019-06-08 00:00:00', 100.000, 1.000, 'SDLR003', 'dara', NULL, 'Branch KSV', '2019-06-08 00:00:00', NULL, NULL, 1),
	(2, 10012, 100110, '19000', 0, 'd', NULL, '2019-06-15 00:00:00', 0.000, 1.000, 'SDLR003', 'Dara', NULL, 'Branch KSV', '2019-06-15 00:00:00', NULL, NULL, 1),
	(3, 10013, 100113, '8000', 0, 'etet', NULL, '2019-06-15 00:00:00', 100.000, 1.000, 'SDLR002', 'Tuy ravy', NULL, 'Branch KSV', '2019-06-15 00:00:00', NULL, NULL, 1),
	(4, 10014, 10013, NULL, 0, 'etet', NULL, '2019-06-15 00:00:00', 100.000, 1.000, 'SDLR002', NULL, NULL, 'Branch KSV', '2019-06-15 00:00:00', NULL, NULL, 1),
	(5, 10015, 10011, '1000', 0, 'test', NULL, '2019-06-30 00:00:00', 0.000, 1.000, 'SDLR003', 'dara', NULL, 'Branch KSV', '2019-06-30 00:00:00', NULL, NULL, 1),
	(6, 10016, NULL, '9000', 0, 'phnom penh', NULL, '2019-07-27 00:00:00', 0.000, 1.000, 'SDLR001', 'Tuy Ravy', NULL, 'Branch KSV', '2019-07-27 00:00:00', NULL, NULL, 1),
	(7, 10017, NULL, NULL, 0, 'tet', NULL, '2019-08-18 00:00:00', 0.000, 1.000, 'SDLR001', NULL, NULL, 'Branch KSV', '2019-08-18 00:00:00', NULL, NULL, 1),
	(8, 10018, NULL, NULL, 0, 'tet', NULL, '2019-08-18 00:00:00', 0.000, 1.000, 'SDLR001', NULL, NULL, 'Branch KSV', '2019-08-18 00:00:00', NULL, NULL, 1),
	(9, 10019, NULL, NULL, 0, 'ededed', NULL, '1927-03-09 00:00:00', 0.000, 1.000, 'Penddin', NULL, NULL, 'Branch KSV', '2019-08-21 00:00:00', NULL, NULL, 1),
	(10, 10020, NULL, NULL, 0, 'test', NULL, '2019-08-24 00:00:00', 0.000, 1.000, 'Penddin', NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-24 00:00:00', NULL, NULL, 1),
	(11, 10011, NULL, NULL, 0, 'd', NULL, '2019-08-25 00:00:00', 1.000, 1.000, 'Penddin', NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-25 00:00:00', NULL, NULL, 1),
	(12, 10011, NULL, NULL, 0, 'test', NULL, '2019-08-25 00:00:00', 100.000, 1.000, 'Penddin', NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-25 00:00:00', NULL, NULL, 1),
	(13, 10011, NULL, NULL, 0, 'test', NULL, '2019-08-25 00:00:00', 100.000, 1.000, 'Penddin', NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-25 00:00:00', NULL, NULL, 1),
	(14, 10011, NULL, NULL, 0, 'ts', NULL, '2019-08-26 00:00:00', 100.000, 1.000, 'Penddin', NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-26 00:00:00', NULL, NULL, 1),
	(15, 10012, NULL, NULL, 0, 'tet', NULL, '2019-08-28 00:00:00', 100.000, 1.000, 'Penddin', NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-28 00:00:00', NULL, NULL, 1),
	(16, 10013, NULL, NULL, 0, 'tet', NULL, '2019-08-31 00:00:00', 100.000, 1.000, 'Penddin', NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-31 00:00:00', NULL, NULL, 1);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
