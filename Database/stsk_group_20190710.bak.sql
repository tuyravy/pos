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


-- Dumping database structure for stsk_group
CREATE DATABASE IF NOT EXISTS `stsk_group` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stsk_group`;

-- Dumping structure for table stsk_group.branch
DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `BrLetterMain` varchar(50) NOT NULL,
  `BrLetter` varchar(50) NOT NULL,
  `BrCode` int(11) NOT NULL,
  `BrName` varchar(50) NOT NULL,
  `BrNameKh` varchar(50) NOT NULL,
  `BranchType` int(11) NOT NULL,
  `RegionalCode` varchar(50) NOT NULL,
  `BrLocationCode` varchar(50) NOT NULL,
  `BranchAdresss` varchar(50) NOT NULL,
  `BrPhone` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.branch: ~0 rows (approximately)
DELETE FROM `branch`;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;

-- Dumping structure for table stsk_group.company
DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `Company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name_en` varchar(50) DEFAULT NULL,
  `company_name_kh` varchar(50) DEFAULT NULL,
  `register_no` varchar(50) DEFAULT NULL,
  `vat_no` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `CompanyCode` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`Company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.company: ~9 rows (approximately)
DELETE FROM `company`;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`Company_id`, `company_name_en`, `company_name_kh`, `register_no`, `vat_no`, `phone_number`, `email`, `contact_person`, `CompanyCode`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	(1, 'SAHAKRINPHEAP MIF PLC.', NULL, NULL, NULL, NULL, NULL, NULL, '500', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(2, 'SAHAKRINPHEAP PAWN SHOP', NULL, NULL, NULL, NULL, NULL, NULL, '400', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(3, 'SAHAKRINPHEPA NGO', NULL, NULL, NULL, NULL, NULL, NULL, '100', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(4, 'St Apartment', NULL, NULL, NULL, NULL, NULL, NULL, '200', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(5, 'MHT', NULL, NULL, NULL, NULL, NULL, NULL, '300', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(6, 'TSP', NULL, NULL, NULL, NULL, NULL, NULL, '301', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(7, 'ORIENDA Polyclinic', NULL, NULL, NULL, NULL, NULL, NULL, '600', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(8, 'Mekongmicro Insurance', NULL, NULL, NULL, NULL, NULL, NULL, '700', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(9, 'Nitei Niron Natary Public', NULL, NULL, NULL, NULL, NULL, NULL, '800', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table stsk_group.fx_rate
DROP TABLE IF EXISTS `fx_rate`;
CREATE TABLE IF NOT EXISTS `fx_rate` (
  `fx_date` datetime NOT NULL,
  `orig_ccy` varchar(50) NOT NULL,
  `convert_ccy` varchar(50) NOT NULL,
  `fx_rate` decimal(10,0) NOT NULL,
  `brcode` int(11) NOT NULL,
  `brname` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.fx_rate: ~0 rows (approximately)
DELETE FROM `fx_rate`;
/*!40000 ALTER TABLE `fx_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `fx_rate` ENABLE KEYS */;

-- Dumping structure for table stsk_group.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `location_code` varchar(8) DEFAULT NULL,
  `c_code` varchar(6) DEFAULT NULL,
  `d_code` varchar(4) DEFAULT NULL,
  `p_code` varchar(4) DEFAULT NULL,
  `p_name_en` varchar(50) DEFAULT NULL,
  `d_name_en` varchar(50) DEFAULT NULL,
  `c_name_en` varchar(50) DEFAULT NULL,
  `v_name_en` varchar(50) DEFAULT NULL,
  `p_name_kh` varchar(50) DEFAULT NULL,
  `d_name_kh` varchar(50) DEFAULT NULL,
  `c_name_kh` varchar(50) DEFAULT NULL,
  `v_name_kh` varchar(50) DEFAULT NULL,
  `reff_no` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.location: ~0 rows (approximately)
DELETE FROM `location`;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dumping structure for table stsk_group.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.migrations: ~5 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_03_16_102314_add_simple_role_to_user_table', 1),
	(4, '2019_04_20_125200_create_permission_tables', 1),
	(5, '2019_04_20_130706_setup_role_permissions', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table stsk_group.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.model_has_permissions: ~8 rows (approximately)
DELETE FROM `model_has_permissions`;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\stsk\\Models\\User', 3),
	(2, 'App\\stsk\\Models\\User', 1),
	(2, 'App\\stsk\\Models\\User', 3),
	(3, 'App\\stsk\\Models\\User', 3),
	(4, 'App\\stsk\\Models\\User', 3),
	(17, 'App\\stsk\\Models\\User', 2),
	(18, 'App\\stsk\\Models\\User', 2),
	(19, 'App\\stsk\\Models\\User', 2);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table stsk_group.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.model_has_roles: ~2 rows (approximately)
DELETE FROM `model_has_roles`;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\stsk\\Models\\User', 1),
	(2, 'App\\stsk\\Models\\User', 2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table stsk_group.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table stsk_group.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.permissions: ~23 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'view menu element ui', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(2, 'view menu permission', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(3, 'view menu components', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(4, 'view menu charts', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(5, 'view menu nested routes', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(6, 'view menu table', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(7, 'view menu administrator', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(8, 'view menu theme', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(9, 'view menu clipboard', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(10, 'view menu excel', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(11, 'view menu zip', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(12, 'view menu pdf', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(13, 'view menu i18n', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(14, 'manage user', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(15, 'manage article', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(16, 'manage permission', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(17, 'view menu performent', 'api', '2019-10-02 17:33:01', '2019-10-02 17:33:02'),
	(18, 'manage sale', 'api', '2019-10-05 07:42:12', '2019-10-05 07:42:12'),
	(19, 'manage plan', 'api', '2019-10-05 07:42:49', '2019-10-05 07:42:49'),
	(20, 'manage by company', 'api', '2019-10-05 07:44:59', '2019-10-05 07:44:59'),
	(21, 'manage by product', 'api', '2019-10-05 07:45:17', '2019-10-05 07:45:17'),
	(22, 'manage by staff', 'api', '2019-10-05 07:45:39', '2019-10-05 07:45:39'),
	(23, 'manage by reports', 'api', '2019-10-05 07:46:04', '2019-10-05 07:46:04');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table stsk_group.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.roles: ~5 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(2, 'manager', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(3, 'editor', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(4, 'user', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11'),
	(5, 'visitor', 'api', '2019-09-25 15:56:11', '2019-09-25 15:56:11');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table stsk_group.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.role_has_permissions: ~59 rows (approximately)
DELETE FROM `role_has_permissions`;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 1),
	(2, 2),
	(2, 3),
	(3, 1),
	(3, 2),
	(3, 3),
	(3, 4),
	(4, 1),
	(4, 2),
	(4, 3),
	(4, 4),
	(5, 1),
	(5, 2),
	(5, 3),
	(5, 4),
	(6, 1),
	(6, 2),
	(6, 3),
	(6, 4),
	(7, 1),
	(7, 2),
	(7, 3),
	(8, 1),
	(8, 2),
	(8, 3),
	(8, 4),
	(9, 1),
	(9, 2),
	(9, 3),
	(9, 4),
	(10, 1),
	(10, 2),
	(10, 3),
	(10, 4),
	(11, 1),
	(11, 2),
	(11, 3),
	(11, 4),
	(12, 1),
	(12, 2),
	(12, 3),
	(12, 4),
	(13, 1),
	(13, 2),
	(13, 3),
	(13, 4),
	(14, 1),
	(14, 2),
	(14, 3),
	(15, 1),
	(15, 2),
	(15, 3),
	(16, 1),
	(17, 3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table stsk_group.stsk_detail
DROP TABLE IF EXISTS `stsk_detail`;
CREATE TABLE IF NOT EXISTS `stsk_detail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PrCode` varchar(50) NOT NULL,
  `PrName` varchar(50) NOT NULL,
  `TrnDate` datetime NOT NULL,
  `TrnAmt` decimal(10,0) NOT NULL,
  `Posteddate` datetime NOT NULL,
  `TrnType` int(11) NOT NULL,
  `TrnMode` varchar(50) NOT NULL,
  `ccy` varchar(50) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `CompanyId` varchar(50) NOT NULL,
  `BrCode` int(11) NOT NULL,
  `BrName` varchar(50) NOT NULL,
  `warehouse_code` varchar(50) NOT NULL,
  `warehouse_name` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.stsk_detail: ~0 rows (approximately)
DELETE FROM `stsk_detail`;
/*!40000 ALTER TABLE `stsk_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stsk_detail` ENABLE KEYS */;

-- Dumping structure for table stsk_group.stsk_plan
DROP TABLE IF EXISTS `stsk_plan`;
CREATE TABLE IF NOT EXISTS `stsk_plan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PrCode` varchar(50) NOT NULL DEFAULT '0',
  `PrName` varchar(50) NOT NULL DEFAULT '0',
  `Value1` decimal(10,0) NOT NULL DEFAULT '0',
  `Value2` decimal(10,0) NOT NULL DEFAULT '0',
  `Value3` decimal(10,0) NOT NULL DEFAULT '0',
  `Value4` decimal(10,0) NOT NULL DEFAULT '0',
  `Value5` decimal(10,0) NOT NULL DEFAULT '0',
  `Number1` decimal(10,0) NOT NULL DEFAULT '0',
  `Number2` decimal(10,0) NOT NULL DEFAULT '0',
  `Number3` decimal(10,0) NOT NULL DEFAULT '0',
  `Number4` decimal(10,0) NOT NULL DEFAULT '0',
  `Number5` decimal(10,0) NOT NULL DEFAULT '0',
  `percentage1` decimal(10,0) NOT NULL DEFAULT '0',
  `percentage2` decimal(10,0) NOT NULL DEFAULT '0',
  `percentage3` decimal(10,0) NOT NULL DEFAULT '0',
  `percentage4` decimal(10,0) NOT NULL DEFAULT '0',
  `percentage5` decimal(10,0) NOT NULL DEFAULT '0',
  `ccy` varchar(10) NOT NULL DEFAULT '0',
  `CompanyName` varchar(10) NOT NULL DEFAULT '0',
  `CompanyId` varchar(10) NOT NULL DEFAULT '0',
  `BrCode` int(11) NOT NULL DEFAULT '0',
  `BrName` varchar(50) NOT NULL DEFAULT '0',
  `warehouse_code` varchar(50) NOT NULL DEFAULT '0',
  `warehouse_name` varchar(50) NOT NULL DEFAULT '0',
  `created_by` varchar(50) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL DEFAULT '0',
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.stsk_plan: ~0 rows (approximately)
DELETE FROM `stsk_plan`;
/*!40000 ALTER TABLE `stsk_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `stsk_plan` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_api
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE IF NOT EXISTS `sys_api` (
  `UserKey` varchar(50) NOT NULL,
  `HashKey` varchar(50) NOT NULL,
  `Router` varchar(50) NOT NULL,
  `RouteHash` varchar(100) NOT NULL,
  `RouteMothed` varchar(100) NOT NULL,
  `last_ip_address` varchar(100) NOT NULL,
  `whitelist` int(11) NOT NULL,
  `tokentype` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `company_id` int(11) NOT NULL,
  `brcode` int(11) NOT NULL,
  `brname` varchar(50) NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_api: ~0 rows (approximately)
DELETE FROM `sys_api`;
/*!40000 ALTER TABLE `sys_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_api` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_email
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE IF NOT EXISTS `sys_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(50) NOT NULL,
  `title_email` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `smtp_host` varchar(50) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_user` varchar(50) NOT NULL,
  `smtp_pass` varchar(50) NOT NULL,
  `mailtype` varchar(50) NOT NULL,
  `charset` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_email: ~0 rows (approximately)
DELETE FROM `sys_email`;
/*!40000 ALTER TABLE `sys_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_function
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE IF NOT EXISTS `sys_function` (
  `functionCode` varchar(50) NOT NULL,
  `router` varchar(50) NOT NULL,
  `func_desc` varchar(50) NOT NULL,
  `func_desc_kh` varchar(50) NOT NULL,
  `controlerName` varchar(100) NOT NULL,
  `modelName` varchar(100) NOT NULL,
  `funAction` int(11) NOT NULL,
  `Icon` varchar(50) NOT NULL,
  `order` int(11) NOT NULL,
  `parentId` varchar(50) NOT NULL,
  `msg_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_function: ~0 rows (approximately)
DELETE FROM `sys_function`;
/*!40000 ALTER TABLE `sys_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_function` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_lookup_code
DROP TABLE IF EXISTS `sys_lookup_code`;
CREATE TABLE IF NOT EXISTS `sys_lookup_code` (
  `look_id` varchar(10) NOT NULL,
  `look_code` varchar(50) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `full_name_en` varchar(100) NOT NULL,
  `full_name_kh` varchar(100) NOT NULL,
  `caption` text NOT NULL,
  `display_code` varchar(50) NOT NULL,
  `look_group` varchar(50) NOT NULL,
  `look_value` decimal(10,3) NOT NULL,
  `code_order` int(11) NOT NULL,
  `lookup_type` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `company_id` int(11) NOT NULL,
  `brcode` int(11) NOT NULL,
  `brname` varchar(50) NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_lookup_code: ~0 rows (approximately)
DELETE FROM `sys_lookup_code`;
/*!40000 ALTER TABLE `sys_lookup_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_lookup_code` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_permissions
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE IF NOT EXISTS `sys_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionCode` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_kh` varchar(50) NOT NULL,
  `display_values` varchar(50) NOT NULL,
  `routes` varchar(50) NOT NULL,
  `routesname` varchar(50) NOT NULL,
  `order` varchar(50) NOT NULL,
  `class_color` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `guard_name` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_permissions: ~0 rows (approximately)
DELETE FROM `sys_permissions`;
/*!40000 ALTER TABLE `sys_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permissions` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_permissions_role
DROP TABLE IF EXISTS `sys_permissions_role`;
CREATE TABLE IF NOT EXISTS `sys_permissions_role` (
  `UserKey` varchar(50) NOT NULL,
  `group_permission_code` varchar(50) NOT NULL,
  `functionCode` varchar(50) NOT NULL,
  `permission_type` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_permissions_role: ~0 rows (approximately)
DELETE FROM `sys_permissions_role`;
/*!40000 ALTER TABLE `sys_permissions_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permissions_role` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_permission_group
DROP TABLE IF EXISTS `sys_permission_group`;
CREATE TABLE IF NOT EXISTS `sys_permission_group` (
  `group_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_permission_name` varchar(50) NOT NULL,
  `group_permission_code` varchar(50) NOT NULL,
  `functionCode` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`group_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_permission_group: ~0 rows (approximately)
DELETE FROM `sys_permission_group`;
/*!40000 ALTER TABLE `sys_permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permission_group` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_product
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE IF NOT EXISTS `sys_product` (
  `prcode` varchar(50) NOT NULL,
  `AppType` int(11) NOT NULL,
  `PrType` varchar(50) NOT NULL,
  `FullDesc` varchar(100) NOT NULL,
  `Rules` varchar(50) NOT NULL,
  `CcyType` varchar(50) NOT NULL,
  `Company_id` int(11) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL,
  KEY `Company_id` (`Company_id`),
  CONSTRAINT `FK_product_company` FOREIGN KEY (`Company_id`) REFERENCES `company` (`Company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_product: ~53 rows (approximately)
DELETE FROM `sys_product`;
/*!40000 ALTER TABLE `sys_product` DISABLE KEYS */;
INSERT INTO `sys_product` (`prcode`, `AppType`, `PrType`, `FullDesc`, `Rules`, `CcyType`, `Company_id`, `hash`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	('01', 4, '01', 'Group Loan Flat KHR', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('02', 4, '02', 'Ind Loan Flat KHR', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('03', 4, '03', 'Group Loan Decline KHR', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('05', 4, '04', 'Ind Loan Decline KHR', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('10', 4, '05', 'Ind Loan Balloon KHR', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('21', 4, '06', 'Group Agriculture Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('22', 4, '07', 'Ind Agriculture Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('23', 4, '08', 'Group Micro Entre Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('24', 4, '09', 'Ind Micro-Entre Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('25', 4, '10', 'Small Entrepreneur Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('26', 4, '11', 'Personal Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('27', 4, '12', 'Home Renovation Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('28', 4, '28', 'Express Loan', '', 'KHR', 1, '', 'tuy ravy', '2019-10-04 15:04:27', 'tuy ravy', '2019-10-04 15:04:27', 1),
	('01', 5, '01', 'Credit Life', '', 'KHR', 8, '', 'Tuy Ravy', '2019-10-04 15:13:54', 'Tuy Ravy', '2019-10-04 15:13:59', 1),
	('02', 5, '02', 'Personal Accident', '', 'KHR', 8, '', 'Tuy Ravy', '2019-10-04 15:13:54', 'Tuy Ravy', '2019-10-04 15:13:59', 1),
	('01', 6, '01', 'Premium Association Insurance', '', 'KHR', 3, '', 'Tuy Ravy', '2019-10-04 15:13:54', 'Tuy Ravy', '2019-10-04 15:13:54', 1),
	('01', 7, '01', 'Maternity (Standard)', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:13:54', 'Tuy Ravy', '2019-10-04 15:13:54', 1),
	('02', 7, '02', 'Maternity (VIP)', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:35:53', 'Tuy Ravy', '2019-10-04 15:35:56', 1),
	('03', 7, '03', 'Gynaecology', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:36:24', 'Tuy Ravy', '2019-10-04 15:36:28', 1),
	('04', 7, '04', 'IVF', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:36:28', 'Tuy Ravy', '2019-10-04 15:36:28', 1),
	('05', 7, '05', 'Cardiology', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:36:28', 'Tuy Ravy', '2019-10-04 15:36:28', 1),
	('06', 7, '06', 'Emergency 1hrs', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:38:02', 'Tuy Ravy', '2019-10-04 15:38:06', 1),
	('07', 7, '07', 'Home Care', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:38:33', 'Tuy Ravy', '2019-10-04 15:38:36', 1),
	('08', 7, '08', 'Air Ambulance', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:39:00', 'Tuy Ravy', '2019-10-04 15:39:02', 1),
	('09', 7, '09', 'Gastro', '', 'KHR', 7, '', 'Tuy Ravy', '2019-10-04 15:39:28', 'Tuy Ravy', '2019-10-04 15:39:32', 1),
	('01', 8, '01', 'Studio Room', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:41:43', 'Tuy Ravy', '2019-10-04 15:41:45', 1),
	('02', 8, '02', 'One Bedroom', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:41:45', 'Tuy Ravy', '2019-10-04 15:41:45', 1),
	('03', 8, '03', 'Two Bedroom A', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:42:48', 'Tuy Ravy', '2019-10-04 15:42:51', 1),
	('04', 8, '04', 'Two Bedroom B', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:42:51', 'Tuy Ravy', '2019-10-04 15:42:51', 1),
	('05', 8, '05', 'Three Bedroom', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:42:51', 'Tuy Ravy', '2019-10-04 15:42:51', 1),
	('06', 8, '06', 'Penthouse A', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:44:16', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('07', 8, '07', 'Penthouse B', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:44:16', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('08', 8, '08', 'Office 150m2', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:44:18', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('09', 8, '09', 'Office 71m2', '', 'USD', 4, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:57', 1),
	('01', 9, '01', 'Gass', '', 'USD', 5, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('02', 9, '02', 'Dissel', '', 'USD', 5, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('03', 9, '03', 'Super Gasoline', '', 'USD', 5, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('04', 9, '04', 'Premiem Gasoline', '', 'USD', 5, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('05', 9, '05', 'Mart', '', 'USD', 5, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:44:18', 1),
	('01', 9, '01', 'Gass ', '', 'USD', 6, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('02', 9, '02', 'Dissel', '', 'USD', 6, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('03', 9, '03', 'Super Gasoline', '', 'USD', 6, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('04', 9, '04', 'Premiem Gasoline', '', 'USD', 6, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('05', 9, '05', 'Mart', '', 'USD', 6, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('01', 10, '01', 'Family', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('02', 10, '02', 'Banking & Finance', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('03', 10, '03', 'Corporate & Investment', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('04', 10, '04', 'Real Estate', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('05', 10, '05', 'Labour', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('06', 10, '06', 'Due Deligence', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('07', 10, '07', 'Will/Testament', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('08', 10, '08', 'Notarization and Authentication', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1),
	('09', 10, '09', 'Legal text translation', '', 'KHR', 9, '', 'Tuy Ravy', '2019-10-04 15:45:55', 'Tuy Ravy', '2019-10-04 15:45:55', 1);
/*!40000 ALTER TABLE `sys_product` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_setting
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE IF NOT EXISTS `sys_setting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(50) NOT NULL,
  `look_code` varchar(50) NOT NULL,
  `setting_value_1` varchar(50) NOT NULL,
  `setting_value_2` varchar(50) NOT NULL,
  `setting_value_3` varchar(50) NOT NULL,
  `caption` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `BrCode` int(11) NOT NULL,
  `BrName` varchar(50) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_setting: ~0 rows (approximately)
DELETE FROM `sys_setting`;
/*!40000 ALTER TABLE `sys_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_setting` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_userlog
DROP TABLE IF EXISTS `sys_userlog`;
CREATE TABLE IF NOT EXISTS `sys_userlog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `loginId` varchar(50) NOT NULL,
  `userKey` varchar(50) NOT NULL,
  `functionCode` varchar(50) NOT NULL,
  `MachineName` varchar(50) NOT NULL,
  `LoginTF` int(11) NOT NULL,
  `CurrRunDate` datetime NOT NULL,
  `dateaccess` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.sys_userlog: ~0 rows (approximately)
DELETE FROM `sys_userlog`;
/*!40000 ALTER TABLE `sys_userlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_userlog` ENABLE KEYS */;

-- Dumping structure for table stsk_group.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SystemName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FirstName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FirstName_Kh` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName_Kh` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOE` date NOT NULL,
  `PositionID` int(11) NOT NULL,
  `IdentifyType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdentifyNumber` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdentifyExpireDate` datetime NOT NULL,
  `Allowance` int(11) NOT NULL,
  `LastLogin` date NOT NULL,
  `forgotten_password_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forgotten_password_time` datetime NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `activation_code` int(11) NOT NULL,
  `passwordHash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BrOption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BrZone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReportCode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Router` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserKey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HashKey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IPAddress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `brcode` int(11) NOT NULL,
  `brname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `FK_users_company` (`company_id`),
  CONSTRAINT `FK_users_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`Company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.users: ~5 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `SystemName`, `name`, `email`, `FirstName`, `LastName`, `FirstName_Kh`, `LastName_Kh`, `DOE`, `PositionID`, `IdentifyType`, `IdentifyNumber`, `IdentifyExpireDate`, `Allowance`, `LastLogin`, `forgotten_password_code`, `forgotten_password_time`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `activation_code`, `passwordHash`, `note`, `email_verified_at`, `password`, `emp_group`, `last_ip_address`, `BrOption`, `BrZone`, `ReportCode`, `Router`, `emp_code`, `UserKey`, `HashKey`, `IPAddress`, `remember_token`, `company_id`, `brcode`, `brname`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Admin', 'tuyravey99@gmail.com', '', '', '', '', '0000-00-00', 0, '', '', '0000-00-00 00:00:00', 0, '0000-00-00', '', '0000-00-00 00:00:00', '', '', '', 0, 0, 0, '', '', NULL, '$2y$10$PBP.2i0noN7XNHagFIUeRuCglWzNZ.d0UbBTSay3g4SZMG2Gk527K', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, '', '2019-09-25 15:57:20', '2019-09-25 15:57:20'),
	(2, NULL, 'Manager', 'manager@gmail.com', '', '', '', '', '0000-00-00', 0, '', '', '0000-00-00 00:00:00', 0, '0000-00-00', '', '0000-00-00 00:00:00', '', '', '', 0, 0, 0, '', '', NULL, '$2y$10$ilMfHgamsSpeDrK5vUXBRO3DyGbN8ZYZrAu1pL1kRVImqKODQGERO', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, '', '2019-09-25 15:57:20', '2019-09-25 15:57:20'),
	(3, NULL, 'Editor', 'editor@gmail.com', '', '', '', '', '0000-00-00', 0, '', '', '0000-00-00 00:00:00', 0, '0000-00-00', '', '0000-00-00 00:00:00', '', '', '', 0, 0, 0, '', '', NULL, '$2y$10$.MjzPJ8OHGGKxkE/sAbaquwsY9oA6f.tbYL9Jj6DzGOtZuUl6msiO', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, '', '2019-09-25 15:57:20', '2019-09-25 15:57:20'),
	(4, NULL, 'User', 'user@gmail.com', '', '', '', '', '0000-00-00', 0, '', '', '0000-00-00 00:00:00', 0, '0000-00-00', '', '0000-00-00 00:00:00', '', '', '', 0, 0, 0, '', '', NULL, '$2y$10$spFp.xXo6xWf/PuLbMffJOBSJM3AJ0dUEF85gqnm.1lZ9xRdXlu5O', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, '', '2019-09-25 15:57:20', '2019-09-25 15:57:20'),
	(5, NULL, 'Visitor', 'visitor@gmail.com', '', '', '', '', '0000-00-00', 0, '', '', '0000-00-00 00:00:00', 0, '0000-00-00', '', '0000-00-00 00:00:00', '', '', '', 0, 0, 0, '', '', NULL, '$2y$10$pu/9XntiMdDGAqMFngIowO3SPvS7YOT6E37jQ9adDveQEnL62vsOy', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, '', '2019-09-25 15:57:20', '2019-09-25 15:57:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table stsk_group.warehouse
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `warehouse_id` varchar(50) NOT NULL,
  `warehouse_code` varchar(50) NOT NULL,
  `warehouse_name` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.warehouse: ~0 rows (approximately)
DELETE FROM `warehouse`;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
