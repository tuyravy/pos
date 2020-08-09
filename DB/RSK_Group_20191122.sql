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
CREATE TABLE IF NOT EXISTS `branch` (
  `brID` int(10) NOT NULL AUTO_INCREMENT,
  `mainName` varchar(50) NOT NULL DEFAULT '0',
  `mainCode` int(10) NOT NULL DEFAULT '0',
  `brName` varchar(50) NOT NULL,
  `brNamekh` varchar(50) NOT NULL,
  `brCode` int(11) NOT NULL,
  `shortcode` varchar(50) NOT NULL,
  `gis code` varchar(50) NOT NULL,
  `CompanyCode` varchar(50) NOT NULL,
  `flag` int(11) DEFAULT '1',
  `date` date NOT NULL,
  PRIMARY KEY (`brID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.branch: ~62 rows (approximately)
DELETE FROM `branch`;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` (`brID`, `mainName`, `mainCode`, `brName`, `brNamekh`, `brCode`, `shortcode`, `gis code`, `CompanyCode`, `flag`, `date`) VALUES
	(1, '0', 0, 'Sub-HeadOffice', 'ស្នាក់ការកណ្តាល០១', 100, 'SHO\r\n', '', '100', 1, '2016-10-28'),
	(2, '0', 0, 'ChomChoa', 'ចោមចៅ\r\n', 102, 'CHC', '', '100', 1, '2016-10-28'),
	(3, '0', 0, 'ChraingChamreh', 'ច្រាំងចំរេះ\r\n', 103, 'CCR\r\n', '', '100', 1, '2016-10-28'),
	(4, '0', 0, 'PrechAghchagn', 'ព្រែកអញ្ជាញ\r\n', 105, 'PAG', '', '100', 1, '2016-10-28'),
	(5, '0', 0, 'KampongSvay', 'កំពង់ស្វាយ\r\n', 106, 'KPY', '', '100', 1, '2016-10-28'),
	(6, '0', 0, 'Angsnuol', 'អង្គស្នួល\r\n', 107, 'SASL\r\n', '', '100', 1, '2016-10-28'),
	(7, '0', 0, 'Saang', 'ស្អាង\r\n', 108, 'SAG\r\n', '', '100', 1, '2016-10-28'),
	(8, '0', 0, 'NeakLeung', 'អ្នកលឿង\r\n', 110, 'NKL\r\n', '', '100', 1, '2016-10-28'),
	(9, '0', 0, 'Bati', 'បាទី\r\n', 112, 'BAT\r\n', '', '100', 1, '2016-10-28'),
	(10, '0', 0, 'Kompongtrach', 'កំពង់ត្រាច\r\n', 114, 'KTR\r\n', '', '100', 1, '2016-10-28'),
	(11, '0', 0, 'Chamkarleu', 'ចំការលើ\r\n', 115, 'CKL\r\n', '', '100', 1, '2016-10-28'),
	(12, '0', 0, 'Vihearsour', 'វិហាសួគ៌\r\n', 116, 'VHS\r\n', '', '100', 1, '2016-10-28'),
	(13, '0', 0, 'Skun', 'ស្គន់\r\n', 117, 'SKN\r\n', '', '100', 1, '2016-10-28'),
	(14, '0', 0, 'Preynup', 'ព្រៃនប់\r\n', 118, 'PRN\r\n', '', '100', 1, '2016-10-28'),
	(15, '0', 0, 'Angkorchey', 'អង្គរជ័យ', 119, 'AKC', '', '100', 1, '2016-10-28'),
	(16, '0', 0, 'Trengtroyeng', 'ត្រែងត្រយឹង\r\n', 122, 'TTY\r\n', '', '100', 1, '2016-10-28'),
	(17, '0', 0, 'Kompot', 'កំពត\r\n', 123, 'KPT', '', '100', 1, '2016-10-28'),
	(18, '0', 0, 'Memot', 'មេមត់\r\n', 125, 'MMT\r\n', '', '100', 1, '2016-10-28'),
	(19, '0', 0, 'KampongTmor', 'កំពង់ថ្ម', 126, 'KTM\r\n', '', '100', 1, '2016-10-28'),
	(20, '0', 0, 'Banteaymeanchey', 'បន្ទាយមានជ័យ\r\n', 128, 'BMC', '', '100', 1, '2016-10-28'),
	(21, '0', 0, 'Kratie', 'ក្រចេះ', 129, 'KRT\r\n', '', '100', 1, '2016-10-28'),
	(22, '0', 0, 'Sub-Svayrieng', 'ស្វាយរៀង', 130, 'SSVR', '', '100', 1, '2016-10-28'),
	(23, '0', 0, 'Chiphou', 'ជីភូ\r\n', 131, 'CHP', '', '100', 1, '2016-10-28'),
	(24, '0', 0, 'KampongTralach', 'កំពង់ត្រឡាច', 132, 'KTL', '', '100', 1, '2016-10-28'),
	(25, '0', 0, 'KampongTrabek', 'កំពង់ត្របែក', 133, 'KTB\r\n', '', '100', 1, '2016-10-28'),
	(26, '0', 0, 'SvayAntor', 'ស្វាយអន្ទរ', 134, 'SVA', '', '100', 1, '2016-10-28'),
	(27, '0', 0, 'PreyChhor', 'ព្រៃឈរ', 135, 'PCH\r\n', '', '100', 1, '2016-10-28'),
	(28, '0', 0, 'MongRussei', 'មោងឬស្សី', 136, 'MRS', '', '100', 1, '2016-10-28'),
	(29, '0', 0, 'Soutrnikom', 'សូទ្រនិគម\r\n', 137, 'SNK', '', '100', 1, '2016-10-28'),
	(30, '0', 0, 'Puok', 'ពួក', 138, 'PUK', '', '100', 1, '2016-10-28'),
	(31, '0', 0, 'Kongpisei', 'គងពិសី', 139, 'KPS', '', '100', 1, '2016-10-28'),
	(32, '0', 0, 'Preykabas', 'ព្រៃកប្បាស', 140, 'PKB', '', '100', 1, '2016-10-28'),
	(33, '0', 0, 'Bavel', 'បវេល', 141, 'BAL', '', '100', 1, '2016-10-28'),
	(34, '0', 0, 'KampongThom', 'កំពង់ធំ', 143, 'KTH', '', '100', 1, '2016-10-28'),
	(35, '0', 0, 'Chhloung', 'ឆ្លូង', 144, 'CHL', '', '100', 1, '2016-10-28'),
	(36, '0', 0, 'PreahVihear', 'ព្រះវិហារ', 145, 'PVH', '', '100', 1, '2016-10-28'),
	(37, '0', 0, 'StuengTrang', 'ស្ទឹងត្រង់', 146, 'STR', '', '100', 1, '2016-10-28'),
	(38, '0', 0, 'Sub-Suong', 'សាខារងសួង', 147, 'SSUG', '', '100', 1, '2016-10-28'),
	(39, '0', 0, 'Sub-Angtasom', 'សាខារងអង្គតាសោម', 148, 'SATS', '', '100', 1, '2016-10-28'),
	(40, '0', 0, 'Sub-KompongSpeu', 'សាខារងកំពង់ស្ពឺ', 149, 'SKSP', '', '100', 1, '2016-10-28'),
	(41, '0', 0, 'Takhmao', 'តាខ្មៅ', 150, 'KTM\r\n', '', '100', 1, '2016-10-28'),
	(42, '0', 0, 'Sub-KeanSvay', 'សាខារងកៀនស្វាយ', 151, 'SKSV', '', '100', 1, '2016-10-28'),
	(43, '0', 0, 'Sub-Kompongchhnang', 'សាខារងកំពង់ឆ្នាំង', 152, 'SKCH', '', '100', 1, '2016-10-28'),
	(44, '0', 0, 'Sub-pursat', 'សាខារងពោធិសាត់\r\n', 153, 'SPUS\r\n', '', '100', 1, '2016-10-28'),
	(45, '0', 0, 'Sub-Battambang', 'សាខារងបាត់ដំបង', 154, 'SBTB', '', '100', 1, '2016-10-28'),
	(46, '0', 0, 'Sub-Siemreap', 'សាខារងសៀមរាប', 155, 'SSRP', '', '100', 1, '2016-10-28'),
	(47, '0', 0, 'HeadOffice', 'សា្នក់ការកណ្តាល\r\n', 500, 'HO', '', '500', 1, '2016-10-28'),
	(48, '0', 0, 'PhsarDoeumThkov', 'ផ្សារដើមថ្កូវ', 501, 'ASL', '', '500', 1, '2016-10-28'),
	(49, '0', 0, 'KeanSvay', 'កៀនស្វាយ\r\n', 502, 'KSV\r\n', '', '500', 1, '2016-10-28'),
	(50, '0', 0, 'KompongSpeu', 'កំពង់ស្ពឺ', 503, 'KSP', '', '500', 1, '2016-10-28'),
	(51, '0', 0, 'Suong', 'សួង', 504, 'SUG', '', '500', 1, '2016-10-28'),
	(52, '0', 0, 'Angtasom', 'អង្គតាសោម\r\n', 505, 'ATS\r\n', '', '500', 1, '2016-10-28'),
	(53, '0', 0, 'Kompongchhnang', 'កំពង់ឆ្នាំង', 506, 'KCH\r\n', '', '500', 1, '2016-10-28'),
	(54, '0', 0, 'Pursat', 'ពោធិ៍សាត់', 507, 'PUS', '', '500', 1, '2016-10-28'),
	(55, '0', 0, 'Battambang', 'បាត់ដំបង', 508, 'BTB', '', '500', 1, '2016-10-28'),
	(56, '0', 0, 'Siemreap', 'សៀមរាប', 509, 'SRP', '', '500', 1, '2016-10-28'),
	(57, '0', 0, 'Svayrieng', 'ស្វាយរៀង', 510, 'SVR', '', '500', 1, '2016-10-28'),
	(58, '0', 0, 'mekong micro insurance', 'មេគង្គ ម៉ាយក្រូអ៊ិនសួរេន', 700, 'MMI', '', '700', 1, '2019-07-21'),
	(59, '0', 0, 'ST Appartment', 'ST Appartment', 200, 'ST', '', '200', 1, '2019-07-21'),
	(60, '0', 0, 'MHT', 'MHT', 300, 'MHT', '', '300', 1, '2019-07-21'),
	(61, '0', 0, 'TSP', 'TSP', 301, 'TSP', '', '301', 1, '2019-07-21'),
	(62, '0', 0, 'Orienda Polyclinic', 'Orienda Polyclinic & Maternity ', 600, 'CLI\r\n', '', '600', 1, '2019-07-21'),
	(63, '0', 0, 'Nitei Niron Natary Public', 'Nitei Niron Natary Public', 800, 'NNNP', '', '800', 1, '2019-11-22');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;

-- Dumping structure for table stsk_group.company
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
  `default_ccy` varchar(50) DEFAULT NULL,
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
INSERT INTO `company` (`Company_id`, `company_name_en`, `company_name_kh`, `register_no`, `vat_no`, `phone_number`, `email`, `contact_person`, `CompanyCode`, `default_ccy`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	(1, 'SAHAKRINPHEAP MIF PLC.', NULL, NULL, NULL, NULL, NULL, NULL, '500', 'KHR', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(2, 'SAHAKRINPHEAP PAWN SHOP', NULL, NULL, NULL, NULL, NULL, NULL, '400', 'KHR', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(3, 'SAHAKRINPHEPA NGO', NULL, NULL, NULL, NULL, NULL, NULL, '100', 'KHR', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(4, 'St Apartment', NULL, NULL, NULL, NULL, NULL, NULL, '200', 'USD', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(5, 'MHT', NULL, NULL, NULL, NULL, NULL, NULL, '300', 'USD', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(6, 'TSP', NULL, NULL, NULL, NULL, NULL, NULL, '301', 'USD', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(7, 'ORIENDA Polyclinic', NULL, NULL, NULL, NULL, NULL, NULL, '600', 'USD', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(8, 'Mekongmicro Insurance', NULL, NULL, NULL, NULL, NULL, NULL, '700', 'KHR', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1),
	(9, 'Nitei Niron Natary Public', NULL, NULL, NULL, NULL, NULL, NULL, '800', 'USD', 'Tuy Ravy', '2019-10-04 15:10:25', 'Tuy Ravy', '2019-10-04 15:10:25', 1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table stsk_group.company_audit
CREATE TABLE IF NOT EXISTS `company_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `company_name_en` varchar(50) NOT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.company_audit: ~0 rows (approximately)
DELETE FROM `company_audit`;
/*!40000 ALTER TABLE `company_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_audit` ENABLE KEYS */;

-- Dumping structure for table stsk_group.fx_rate
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
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.model_has_permissions: ~127 rows (approximately)
DELETE FROM `model_has_permissions`;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
	(3, 'App\\stsk\\Models\\User', 29),
	(3, 'App\\stsk\\Models\\User', 30),
	(3, 'App\\stsk\\Models\\User', 31),
	(3, 'App\\stsk\\Models\\User', 32),
	(3, 'App\\stsk\\Models\\User', 33),
	(3, 'App\\stsk\\Models\\User', 34),
	(3, 'App\\stsk\\Models\\User', 35),
	(3, 'App\\stsk\\Models\\User', 36),
	(3, 'App\\stsk\\Models\\User', 37),
	(3, 'App\\stsk\\Models\\User', 38),
	(3, 'App\\stsk\\Models\\User', 39),
	(3, 'App\\stsk\\Models\\User', 40),
	(3, 'App\\stsk\\Models\\User', 41),
	(3, 'App\\stsk\\Models\\User', 42),
	(3, 'App\\stsk\\Models\\User', 43),
	(4, 'App\\stsk\\Models\\User', 29),
	(4, 'App\\stsk\\Models\\User', 31),
	(4, 'App\\stsk\\Models\\User', 32),
	(4, 'App\\stsk\\Models\\User', 34),
	(4, 'App\\stsk\\Models\\User', 35),
	(4, 'App\\stsk\\Models\\User', 37),
	(4, 'App\\stsk\\Models\\User', 38),
	(4, 'App\\stsk\\Models\\User', 40),
	(4, 'App\\stsk\\Models\\User', 41),
	(4, 'App\\stsk\\Models\\User', 43),
	(4, 'App\\stsk\\Models\\User', 46),
	(4, 'App\\stsk\\Models\\User', 47),
	(4, 'App\\stsk\\Models\\User', 49),
	(4, 'App\\stsk\\Models\\User', 50),
	(4, 'App\\stsk\\Models\\User', 51),
	(5, 'App\\stsk\\Models\\User', 30),
	(5, 'App\\stsk\\Models\\User', 31),
	(5, 'App\\stsk\\Models\\User', 33),
	(5, 'App\\stsk\\Models\\User', 34),
	(5, 'App\\stsk\\Models\\User', 36),
	(5, 'App\\stsk\\Models\\User', 37),
	(5, 'App\\stsk\\Models\\User', 39),
	(5, 'App\\stsk\\Models\\User', 40),
	(5, 'App\\stsk\\Models\\User', 43),
	(5, 'App\\stsk\\Models\\User', 46),
	(5, 'App\\stsk\\Models\\User', 48),
	(5, 'App\\stsk\\Models\\User', 49),
	(5, 'App\\stsk\\Models\\User', 51),
	(5, 'App\\stsk\\Models\\User', 52),
	(6, 'App\\stsk\\Models\\User', 29),
	(6, 'App\\stsk\\Models\\User', 30),
	(6, 'App\\stsk\\Models\\User', 31),
	(6, 'App\\stsk\\Models\\User', 32),
	(6, 'App\\stsk\\Models\\User', 33),
	(6, 'App\\stsk\\Models\\User', 34),
	(6, 'App\\stsk\\Models\\User', 35),
	(6, 'App\\stsk\\Models\\User', 36),
	(6, 'App\\stsk\\Models\\User', 37),
	(6, 'App\\stsk\\Models\\User', 38),
	(6, 'App\\stsk\\Models\\User', 39),
	(6, 'App\\stsk\\Models\\User', 40),
	(6, 'App\\stsk\\Models\\User', 41),
	(6, 'App\\stsk\\Models\\User', 42),
	(6, 'App\\stsk\\Models\\User', 43),
	(8, 'App\\stsk\\Models\\User', 29),
	(8, 'App\\stsk\\Models\\User', 31),
	(8, 'App\\stsk\\Models\\User', 32),
	(8, 'App\\stsk\\Models\\User', 34),
	(8, 'App\\stsk\\Models\\User', 35),
	(8, 'App\\stsk\\Models\\User', 37),
	(8, 'App\\stsk\\Models\\User', 38),
	(8, 'App\\stsk\\Models\\User', 40),
	(8, 'App\\stsk\\Models\\User', 41),
	(8, 'App\\stsk\\Models\\User', 43),
	(8, 'App\\stsk\\Models\\User', 44),
	(8, 'App\\stsk\\Models\\User', 46),
	(8, 'App\\stsk\\Models\\User', 47),
	(8, 'App\\stsk\\Models\\User', 49),
	(8, 'App\\stsk\\Models\\User', 50),
	(8, 'App\\stsk\\Models\\User', 51),
	(15, 'App\\stsk\\Models\\User', 29),
	(15, 'App\\stsk\\Models\\User', 30),
	(15, 'App\\stsk\\Models\\User', 31),
	(15, 'App\\stsk\\Models\\User', 32),
	(15, 'App\\stsk\\Models\\User', 33),
	(15, 'App\\stsk\\Models\\User', 34),
	(15, 'App\\stsk\\Models\\User', 35),
	(15, 'App\\stsk\\Models\\User', 36),
	(15, 'App\\stsk\\Models\\User', 37),
	(15, 'App\\stsk\\Models\\User', 38),
	(15, 'App\\stsk\\Models\\User', 39),
	(15, 'App\\stsk\\Models\\User', 40),
	(15, 'App\\stsk\\Models\\User', 41),
	(15, 'App\\stsk\\Models\\User', 42),
	(15, 'App\\stsk\\Models\\User', 43),
	(17, 'App\\stsk\\Models\\User', 29),
	(17, 'App\\stsk\\Models\\User', 31),
	(17, 'App\\stsk\\Models\\User', 32),
	(17, 'App\\stsk\\Models\\User', 34),
	(17, 'App\\stsk\\Models\\User', 35),
	(17, 'App\\stsk\\Models\\User', 37),
	(17, 'App\\stsk\\Models\\User', 38),
	(17, 'App\\stsk\\Models\\User', 40),
	(17, 'App\\stsk\\Models\\User', 41),
	(17, 'App\\stsk\\Models\\User', 43),
	(17, 'App\\stsk\\Models\\User', 46),
	(17, 'App\\stsk\\Models\\User', 47),
	(17, 'App\\stsk\\Models\\User', 49),
	(17, 'App\\stsk\\Models\\User', 50),
	(17, 'App\\stsk\\Models\\User', 51),
	(19, 'App\\stsk\\Models\\User', 29),
	(19, 'App\\stsk\\Models\\User', 30),
	(19, 'App\\stsk\\Models\\User', 31),
	(19, 'App\\stsk\\Models\\User', 32),
	(19, 'App\\stsk\\Models\\User', 33),
	(19, 'App\\stsk\\Models\\User', 34),
	(19, 'App\\stsk\\Models\\User', 35),
	(19, 'App\\stsk\\Models\\User', 36),
	(19, 'App\\stsk\\Models\\User', 37),
	(19, 'App\\stsk\\Models\\User', 38),
	(19, 'App\\stsk\\Models\\User', 39),
	(19, 'App\\stsk\\Models\\User', 40),
	(19, 'App\\stsk\\Models\\User', 41),
	(19, 'App\\stsk\\Models\\User', 42),
	(19, 'App\\stsk\\Models\\User', 43),
	(20, 'App\\stsk\\Models\\User', 29),
	(20, 'App\\stsk\\Models\\User', 31),
	(20, 'App\\stsk\\Models\\User', 32),
	(20, 'App\\stsk\\Models\\User', 34),
	(20, 'App\\stsk\\Models\\User', 35),
	(20, 'App\\stsk\\Models\\User', 37),
	(20, 'App\\stsk\\Models\\User', 38),
	(20, 'App\\stsk\\Models\\User', 40),
	(20, 'App\\stsk\\Models\\User', 41),
	(20, 'App\\stsk\\Models\\User', 43),
	(20, 'App\\stsk\\Models\\User', 46),
	(20, 'App\\stsk\\Models\\User', 47),
	(20, 'App\\stsk\\Models\\User', 49),
	(20, 'App\\stsk\\Models\\User', 50),
	(20, 'App\\stsk\\Models\\User', 51);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table stsk_group.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.model_has_roles: ~22 rows (approximately)
DELETE FROM `model_has_roles`;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\stsk\\Models\\User', 1),
	(2, 'App\\stsk\\Models\\User', 29),
	(2, 'App\\stsk\\Models\\User', 32),
	(2, 'App\\stsk\\Models\\User', 35),
	(2, 'App\\stsk\\Models\\User', 38),
	(2, 'App\\stsk\\Models\\User', 41),
	(2, 'App\\stsk\\Models\\User', 44),
	(2, 'App\\stsk\\Models\\User', 47),
	(2, 'App\\stsk\\Models\\User', 50),
	(4, 'App\\stsk\\Models\\User', 30),
	(4, 'App\\stsk\\Models\\User', 31),
	(4, 'App\\stsk\\Models\\User', 33),
	(4, 'App\\stsk\\Models\\User', 34),
	(4, 'App\\stsk\\Models\\User', 36),
	(4, 'App\\stsk\\Models\\User', 37),
	(4, 'App\\stsk\\Models\\User', 39),
	(4, 'App\\stsk\\Models\\User', 40),
	(4, 'App\\stsk\\Models\\User', 42),
	(4, 'App\\stsk\\Models\\User', 43),
	(4, 'App\\stsk\\Models\\User', 45),
	(4, 'App\\stsk\\Models\\User', 46),
	(4, 'App\\stsk\\Models\\User', 48),
	(4, 'App\\stsk\\Models\\User', 49),
	(4, 'App\\stsk\\Models\\User', 51),
	(4, 'App\\stsk\\Models\\User', 52);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table stsk_group.password_resets
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
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.permissions: ~19 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `flag`, `created_at`, `updated_at`) VALUES
	(1, 'view menu performent', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(2, 'view menu permission', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(3, 'view menu sale', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(4, 'view menu plan', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(5, 'view menu reports', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(6, 'view menu salelist', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(7, 'view menu administrator', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(8, 'view menu planlist', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(9, 'view menu clipboard', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(10, 'view menu excel', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(11, 'view menu zip', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(12, 'view menu pdf', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(13, 'view menu i18n', 'api', 0, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(14, 'manage user', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(15, 'manage sale', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(16, 'manage permission', 'api', 1, '2019-11-05 09:29:02', '2019-11-05 09:29:02'),
	(17, 'manage plan', 'api', 1, '2019-11-17 13:52:26', '2019-11-17 13:52:26'),
	(18, 'manage by reports', 'api', 1, '2019-11-17 13:52:38', '2019-11-17 13:52:38'),
	(19, 'manage salelist', 'api', 1, '2019-11-20 13:48:31', '2019-11-20 13:48:32'),
	(20, 'manage planlist', 'api', 1, '2019-11-20 13:48:47', '2019-11-20 13:48:47');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table stsk_group.products
CREATE TABLE IF NOT EXISTS `products` (
  `prcode` varchar(50) NOT NULL,
  `AppType` int(11) NOT NULL,
  `PrType` varchar(50) NOT NULL,
  `FullDesc` varchar(100) NOT NULL,
  `Rules` varchar(50) NOT NULL,
  `CcyType` varchar(50) NOT NULL,
  `Company_id` varchar(10) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) NOT NULL,
  `authorized_date` datetime NOT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.products: ~3 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`prcode`, `AppType`, `PrType`, `FullDesc`, `Rules`, `CcyType`, `Company_id`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	('P001', 0, 'AAA', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1),
	('P002', 0, 'BBB', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1),
	('P003', 0, 'CCC', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table stsk_group.roles
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
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.role_has_permissions: ~40 rows (approximately)
DELETE FROM `role_has_permissions`;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 1),
	(2, 3),
	(2, 5),
	(3, 1),
	(3, 3),
	(4, 1),
	(4, 3),
	(5, 1),
	(5, 2),
	(5, 3),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 2),
	(7, 3),
	(8, 1),
	(8, 3),
	(9, 1),
	(9, 3),
	(10, 1),
	(10, 3),
	(11, 1),
	(11, 3),
	(12, 1),
	(12, 3),
	(13, 1),
	(13, 3),
	(14, 1),
	(14, 2),
	(14, 4),
	(15, 1),
	(15, 3),
	(16, 1),
	(18, 2),
	(18, 4);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table stsk_group.skp_fields_from
CREATE TABLE IF NOT EXISTS `skp_fields_from` (
  `fields_code` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `placeholder` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `componet_type` varchar(50) NOT NULL,
  `companycode` varchar(50) NOT NULL,
  `order` int(11) NOT NULL,
  `servicetype` varchar(50) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.skp_fields_from: ~95 rows (approximately)
DELETE FROM `skp_fields_from`;
/*!40000 ALTER TABLE `skp_fields_from` DISABLE KEYS */;
INSERT INTO `skp_fields_from` (`fields_code`, `label`, `name`, `type`, `placeholder`, `value`, `model`, `componet_type`, `companycode`, `order`, `servicetype`, `flag`) VALUES
	('5003', 'Number of  CO', 'NumCo', 'text', 'Number of CO', '0', 'PlanModel', 'Input', '500', 1, '', 1),
	('5005', '#Active Client', 'NumClient', 'number', 'Number of Active Client', '0', 'PlanModel', 'Input', '500', 2, '', 1),
	('5006', '# of Disb Client', 'NumDisbClient', 'number', 'Number of Disbursed Client', '0', 'PlanModel', 'Input', '500', 3, '', 1),
	('5007', 'Loan Outstanding', 'ValueLoanOust', 'number', 'Value of Loan Outstanding', '0', 'PlanModel', 'Input', '500', 4, '', 1),
	('5008', 'Value Loan Disburse', 'ValueLoanDisb', 'number', 'Value of Loan Disburse', '0', 'PlanModel', 'Input', '500', 5, '', 1),
	('50010', '#Clinet PAR 1Day', 'NumClientPAR1', 'number', 'Numer of Client PAR 1day\r\n', '0', 'PlanModel', 'Input', '500', 6, '', 1),
	('50011', 'Value PAR 1Day', 'ValuePAR1', 'number', 'Value of PAR 1day', '0', 'PlanModel', 'Input', '500', 7, '', 1),
	('50012', '% PAR 1Day', 'PAR1', 'number', '% PAR 1Day', '0', 'PlanModel', 'Input', '500', 8, '', 1),
	('50013', '#Client PAR 7days', 'NumClientPAR7', 'number', 'Number of Client PAR 7days', '0', 'PlanModel', 'Input', '500', 9, '', 1),
	('50014', 'Value PAR 7days', 'ValuePAR7', 'number', 'Value of PAR 7days ', '0', 'PlanModel', 'Input', '500', 10, '', 1),
	('50015', '% PAR 7days', 'PAR7', 'number', '% PAR 7days', '0', 'PlanModel', 'Input', '500', 11, '', 1),
	('50016', '#Client PAR 30days', 'NumClientPAR30', 'number', 'Number of Client PAR 30days', '0', 'PlanModel', 'Input', '500', 12, '', 1),
	('50017', 'Value PAR 30days', 'ValuePAR30', 'number', 'Value of PAR 30days', '0', 'PlanModel', 'Input', '500', 13, '', 1),
	('50018', '% PAR 30days', 'PAR30', 'number', '% PAR 30days\r\n', '0', 'PlanModel', 'Input', '500', 14, '', 1),
	('50020', '#Client NPL', 'NumClientNPL', 'number', 'Number of Client NPL Collection\r\n', '0', 'PlanModel', 'Input', '500', 15, '', 1),
	('50021', 'Value Client NPL', 'ValueClientNPL', 'number', 'Value of Client NPL Collection\r\n', '0', 'PlanModel', 'Input', '500', 16, '', 1),
	('50023', 'Value Penalty', 'ValuePenalty', 'number', 'Value of Penalty Collection', '0', 'PlanModel', 'Input', '500', 17, '', 1),
	('50025', '#Client WO', 'NumClientWO', 'number', 'Number of Client WO Collection', '0', 'PlanModel', 'Input', '500', 18, '', 1),
	('50026', 'Value Written off', 'ValueWO', 'number', 'Value of WO Collection', '0', 'PlanModel', 'Input', '500', 19, '', 1),
	('50028', '#Client Associatioin', 'NumClientAss', 'number', 'Number of Client Association\r\n', '0', 'PlanModel', 'Input', '500', 1, '', 1),
	('50029', 'Value Association', 'ValuePreAss', 'number', 'Value of Premium Association\r\n', '0', 'PlanModel', 'Input', '500', 2, '', 1),
	('7003', '#Sale Staff', 'NumSaleStaff', 'number', 'Number of Sale Staff\r\n', '0', 'PlanModel', 'Input', '700', 1, '', 1),
	('7005', '#Client Credit List', 'NumClientCrlife', 'number', 'Number of Client Credit Life', '0', 'PlanModel', 'Input', '700', 2, '', 1),
	('7006', 'Value of Credit Life', 'ValueCrlife', 'number', 'Value of Credit Life\r\n', '0', 'PlanModel', 'Input', '700', 3, '', 1),
	('7007', '#Client  PA', 'NumClientPA', 'number', 'Numer of Client Personal Accident\r\n', '0', 'PlanModel', 'Input', '700', 4, '', 1),
	('7008', 'Value PA', 'ValuePA', 'number', 'Value of Personal Accident\r\n', '0', 'PlanModel', 'Input', '700', 5, '', 1),
	('2003', '#of Sale Staff', 'NumSaleStaff', 'number', 'Number of Sale Staff', '0', 'PlanModel', 'Input', '200', 1, '', 1),
	('2005', 'Studio Room', 'StudioRoom', 'number', 'Studio Room', '0', 'PlanModel', 'Input', '200', 3, '', 1),
	('2006', 'One Bedroom', 'OneBedroom', 'number', 'One Bedroom', '0', 'PlanModel', 'Input', '200', 4, '', 1),
	('2007', 'Two Bedroom A', 'TwoBedroomA', 'number', 'Two Bedroom A', '0', 'PlanModel', 'Input', '200', 5, '', 1),
	('2008', 'Two Bedroom B', 'TwoBedroomB', 'number', 'Two Bedroom B', '0', 'PlanModel', 'Input', '200', 6, '', 1),
	('2009', 'Three Bedroom', 'ThreeBedroom', 'number', 'Three Bedroom', '0', 'PlanModel', 'Input', '200', 7, '', 1),
	('20010', 'Penthouse A', 'PenthouseA', 'number', 'Penthouse A\r\n', '0', 'PlanModel', 'Input', '200', 8, '', 1),
	('20011', 'Penthouse B', 'PenthouseB', 'number', 'Penthouse B', '0', 'PlanModel', 'Input', '200', 9, '', 1),
	('20012', 'Office 150m2', 'Office150', 'number', 'Office 150m2', '0', 'PlanModel', 'Input', '200', 10, '', 1),
	('20013', 'Office 71m2', 'Office71', 'number', 'Office 71m2', '0', 'PlanModel', 'Input', '200', 11, '', 1),
	('6003', 'Number of Sale Staff', 'NumSaleStaff', 'number', 'Number of Sale Staff', '0', 'PlanModel', 'Input', '600', 1, 'Client', 1),
	('6005', 'Maternity (Standard)', 'Maternity', 'number', 'Maternity (Standard)', '0', 'PlanModel', 'Input', '600', 2, 'Client', 1),
	('6006', 'Maternity (VIP)', 'MaternityVIP', 'number', 'Maternity (VIP)', '0', 'PlanModel', 'Input', '600', 3, 'Client', 1),
	('6007', 'Gynaecology', 'Gynaecology', 'number', 'Gynaecology', '0', 'PlanModel', 'Input', '600', 4, 'Client', 1),
	('6008', 'IVF', 'IVF', 'number', 'IVF', '0', 'PlanModel', 'Input', '600', 5, 'Client', 1),
	('6009', 'Cardiology', 'Cardiology', 'number', 'Cardiology', '0', 'PlanModel', 'Input', '600', 6, 'Client', 1),
	('60010', 'Pediatrics', 'Pediatrics', 'number', 'Pediatrics', '0', 'PlanModel', 'Input', '600', 7, 'Client', 1),
	('60011', 'General Checkup', 'GeneralCheckup', 'number', 'General Checkup', '0', 'PlanModel', 'Input', '600', 8, 'Client', 1),
	('60012', 'Emergency 1hrs', 'Emergency1hrs', 'number', 'Emergency 1hrs', '0', 'PlanModel', 'Input', '600', 9, 'Client', 1),
	('60013', 'Medical Conderge', 'MedicalConerge', 'number', 'Medical Concierge', '0', 'PlanModel', 'Input', '600', 10, 'Client', 1),
	('60014', 'Home Care', 'Home Care', 'number', 'Home Care', '0', 'PlanModel', 'Input', '600', 11, 'Client', 1),
	('60015', 'Air Ambulance', 'AirAmbulance', 'number', 'Air Ambulance', '0', 'PlanModel', 'Input', '600', 12, 'Client', 1),
	('60016', 'Uro', 'Uro', 'number', 'Uro', '0', 'PlanModel', 'Input', '600', 13, 'Client', 1),
	('60017', 'Gastro', 'Gastro', 'number', 'Gastro', '0', 'PlanModel', 'Input', '600', 14, 'Client', 1),
	('30010', 'Gass', 'Gass', 'number', 'Gass', '0', 'PlanModel', 'Input', '300', 3, 'USD', 1),
	('30011', 'Dissel', 'Dissel', 'number', 'Dissel', '0', 'PlanModel', 'Input', '300', 4, 'USD', 1),
	('30012', 'Super Gasoline', 'SuperGasoline', 'number', 'Super Gasoline', '0', 'PlanModel', 'Input', '300', 5, 'USD', 1),
	('30013', 'Premiem Gasoline', 'PremiemGasoline', 'number', 'Premiem Gasoline ', '0', 'PlanModel', 'Input', '300', 6, 'USD', 1),
	('30014', 'Mart', 'Mart', 'number', 'Mart', '0', 'PlanModel', 'Input', '300', 7, 'USD', 1),
	('8003', 'Number of Sale staff', 'NumSaleStaff', 'number', 'Number of Sale Staff', '0', 'PlanModel', 'Input', '800', 1, '', 1),
	('8005', 'Family', 'Family', 'number', 'Family', '0', 'PlanModel', 'Input', '800', 2, '', 1),
	('8006', 'Banking & Finance', 'BankingFinance', 'number', 'Banking & Finance', '0', 'PlanModel', 'Input', '800', 3, '', 1),
	('8007', 'Cor& Investment', 'CorporateInvestment', 'number', 'Corporate & Investment', '0', 'PlanModel', 'Input', '800', 4, '', 1),
	('8008', 'Real Estate', 'Real Estate', 'number', 'Real Estate', '0', 'PlanModel', 'Input', '800', 5, '', 1),
	('8009', 'Labour', 'Labour', 'number', 'Labour', '0', 'PlanModel', 'Input', '800', 6, '', 1),
	('80010', 'Due Deligence', 'DueDeligence', 'number', 'Due Deligence', '0', 'PlanModel', 'Input', '800', 7, '', 1),
	('80011', 'Will/Testament', 'WillTestament', 'number', 'Will/Testament', '0', 'PlanModel', 'Input', '800', 8, '', 1),
	('80012', 'Notarization and Authentication', 'NotAuthentication', 'number', 'Notarization and Authentication', '0', 'PlanModel', 'Input', '800', 9, '', 1),
	('80013', 'Legal Text Translation', 'LegalText', 'number', 'Legal text translation', '0', 'PlanModel', 'Input', '800', 10, '', 1),
	('60019', 'Maternity (Standard)', 'Maternity', 'number', 'Maternity', '0', 'PlanModel', 'Input', '600', 15, 'Value', 2),
	('60021', 'Gynaecology', 'Gynaecology', 'number', 'Gynaecology', '0', 'PlanModel', 'Input', '600', 17, 'Value', 2),
	('60020', 'Maternity (VIP)', 'MaternityVIP', 'number', 'Maternity (VIP)', '0', 'PlanModel', 'Input', '600', 16, 'Value', 2),
	('60022', 'IVF', 'IVF', 'number', 'IVF', '0', 'PlanModel', 'Input', '600', 18, 'Value', 2),
	('60023', 'Cardiology', 'Cardiology', 'number', 'Cardiology', '0', 'PlanModel', 'Input', '600', 19, 'Value', 2),
	('60024', 'Pediatrics', 'Pediatrics', 'number', 'Pediatrics', '0', 'PlanModel', 'Input', '600', 20, 'Value', 2),
	('60025', 'General Checkup', 'GeneralCheckup', 'number', 'General Checkup', '0', 'PlanModel', 'Input', '600', 21, 'Value', 2),
	('60026', 'Emergency 1hrs', 'Emergency1hrs', 'number', 'Emergency 1hrs', '0', 'PlanModel', 'Input', '600', 22, 'Value', 2),
	('60027', 'Medical Conderge', 'MedicalConderge', 'number', 'Medical Conderge', '0', 'PlanModel', 'Input', '600', 23, 'Value', 2),
	('60028', 'Home Care', 'HomeCare', 'number', 'Home Care', '0', 'PlanModel', 'Input', '600', 24, 'Value', 2),
	('60029', 'Air Ambulance', 'AirAmbulance', 'number', 'Air Ambulance', '0', 'PlanModel', 'Input', '600', 25, 'Value', 2),
	('60030', 'Uro', 'Uro', 'number', 'Uro', '0', 'PlanModel', 'Input', '600', 26, 'Value', 2),
	('60031', 'Gastro', 'Gastro', 'number', 'Gastro', '0', 'PlanModel', 'Input', '600', 27, 'Value', 2),
	('30110', 'Gass', 'Gass', 'number', 'Gass', '0', 'PlanModel', 'Input', '301', 3, 'USD', 1),
	('30111', 'Dissel', 'Dissel', 'number', 'Dissel', '0', 'PlanModel', 'Input', '301', 4, 'USD', 1),
	('30112', 'Super Gasoline', 'SuperGasoline', 'number', 'Super Gasoline', '0', 'PlanModel', 'Input', '301', 5, 'USD', 1),
	('30113', 'Premiem Gasoline', 'PremiemGasoline', 'number', 'Premiem Gasoline ', '0', 'PlanModel', 'Input', '301', 6, 'USD', 1),
	('30114', 'Mart', 'Mart', 'number', 'Mart', '0', 'PlanModel', 'Input', '301', 7, 'USD', 1),
	('3012', '#of Staff Gasoline', 'NumberofSaleStaff', 'number', 'Number of Sale Staff (Gasoline)', '0', 'PlanModel', 'Input', '301', 1, 'USD', 1),
	('3013', '#of Sale Staff Mart', 'NumberofSaleStaffMart', 'number', 'Number of Sale Staff (Mart)', '0', 'PlanModel', 'Input', '301', 2, 'USD', 1),
	('3002', '#of Staff Gasoline', 'NumberofSaleStaff', 'number', 'Number of Sale Staff (Gasoline)', '0', 'PlanModel', 'Input', '300', 1, 'USD', 1),
	('3003', '#of Sale Staff Mart', 'NumberofSaleStaffMart', 'number', 'Number of Sale Staff (Mart)', '0', 'PlanModel', 'Input', '300', 2, 'USD', 1),
	('3018', 'Premiem Gasoline', 'PremiemGasoline', 'number', 'Premiem Gasoline ', '0', 'PlanModel', 'Input', '301', 11, 'LIT', 1),
	('3017', 'Super Gasoline', 'SuperGasoline', 'number', 'Super Gasoline', '0', 'PlanModel', 'Input', '301', 10, 'LIT', 1),
	('3016', 'Dissel', 'Dissel', 'number', 'Dissel', '0', 'PlanModel', 'Input', '301', 9, 'LIT', 1),
	('3015', 'Gass', 'Gass', 'number', 'Gass', '0', 'PlanModel', 'Input', '301', 8, 'LIT', 1),
	('3005', 'Gass', 'Gass', 'number', 'Gass', '0', 'PlanModel', 'Input', '300', 8, 'LIT', 1),
	('3006', 'Dissel', 'Dissel', 'number', 'Dissel', '0', 'PlanModel', 'Input', '300', 9, 'LIT', 1),
	('3007', 'Super Gasoline', 'SuperGasoline', 'number', 'Super Gasoline', '0', 'PlanModel', 'Input', '300', 10, 'LIT', 1),
	('3008', 'Premiem Gasoline', 'PremiemGasoline', 'number', 'Premiem Gasoline ', '0', 'PlanModel', 'Input', '300', 11, 'LIT', 1);
/*!40000 ALTER TABLE `skp_fields_from` ENABLE KEYS */;

-- Dumping structure for table stsk_group.skp_loan
CREATE TABLE IF NOT EXISTS `skp_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdCo` int(11) NOT NULL DEFAULT '0',
  `COName` varchar(50) NOT NULL,
  `Balance` int(11) NOT NULL,
  `Clients` int(11) NOT NULL,
  `PAR1Days` int(11) NOT NULL,
  `PAR1` int(11) NOT NULL,
  `PAR7Days` int(11) NOT NULL,
  `PAR7` int(11) NOT NULL,
  `PAR30Days` int(11) NOT NULL,
  `PAR30` int(11) NOT NULL,
  `DisbAmt` int(11) NOT NULL,
  `ClientDisb` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Reportdate` date NOT NULL,
  `BrCode` int(11) NOT NULL,
  `BrName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdCo` (`IdCo`),
  KEY `BrCode` (`BrCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this table get sum all Co group by Co and by branch';

-- Dumping data for table stsk_group.skp_loan: ~0 rows (approximately)
DELETE FROM `skp_loan`;
/*!40000 ALTER TABLE `skp_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `skp_loan` ENABLE KEYS */;

-- Dumping structure for table stsk_group.skp_loanbyrm
CREATE TABLE IF NOT EXISTS `skp_loanbyrm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NumOfActive` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Active Borrower',
  `NumOfActive_New` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Active Borrower (New Prod.)',
  `NumOfActive_Existing` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Active Borrower (Existing Prod.)',
  `Balance` int(11) NOT NULL DEFAULT '0' COMMENT 'Balance of Loan Portfolio',
  `Balance_New` int(11) NOT NULL DEFAULT '0' COMMENT 'Balance of Loan Portfolio - New Prod.',
  `Balance_Existing` int(11) NOT NULL DEFAULT '0' COMMENT 'Balance of Loan Portfolio -Existing Prod.',
  `Balance_Disbursed` int(11) NOT NULL DEFAULT '0' COMMENT 'Balance of Loan Disbursed in month',
  `Balance_Disburesd_New` int(11) NOT NULL DEFAULT '0' COMMENT 'Balance of Loan Disbursed - New Prod',
  `Balance_Disburesd_Existing` int(11) NOT NULL DEFAULT '0' COMMENT 'Balance of Loan Disbursed - Existing Prod',
  `NumberofLoanDisbursement` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Loan Disbursement In Month',
  `NumberofLoanDisbursement_New` int(11) NOT NULL DEFAULT '0',
  `NumberofLoanDisbursement_Existing` int(11) NOT NULL DEFAULT '0',
  `LoanRepaymentDaily` int(11) NOT NULL DEFAULT '0',
  `Repayment_New` int(11) NOT NULL DEFAULT '0',
  `Repayment_Existing` int(11) NOT NULL DEFAULT '0',
  `PARRatio` float NOT NULL COMMENT 'PAR Ratio',
  `PAR1DAY` int(11) NOT NULL COMMENT 'PAR1DAT',
  `ClientPAR1DAY` int(11) NOT NULL,
  `PAR1DAY_New` int(11) NOT NULL COMMENT 'PAR Value (1 day)-New Prod',
  `PAR1DAY_Existing` int(11) NOT NULL COMMENT 'PAR Value (1 day)-Existing Prod',
  `PAR7DAY` int(11) NOT NULL COMMENT 'PAR Value (7 days)',
  `ClientPAR7DAY` int(11) NOT NULL,
  `PAR30DAY` int(11) NOT NULL COMMENT 'PAR Value (30 days)',
  `ClientPAR30DAY` int(11) NOT NULL,
  `Reportdate` date NOT NULL,
  `RmID` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'status=1 already import,statu=0 not yat',
  `brcode` int(11) NOT NULL,
  `BrName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brcode` (`brcode`),
  KEY `RmID` (`RmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this table get data already summary by reportdate';

-- Dumping data for table stsk_group.skp_loanbyrm: ~0 rows (approximately)
DELETE FROM `skp_loanbyrm`;
/*!40000 ALTER TABLE `skp_loanbyrm` DISABLE KEYS */;
/*!40000 ALTER TABLE `skp_loanbyrm` ENABLE KEYS */;

-- Dumping structure for table stsk_group.skp_rules_from
CREATE TABLE IF NOT EXISTS `skp_rules_from` (
  `fields_code` varchar(50) NOT NULL,
  `required` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `trigger` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.skp_rules_from: ~1 rows (approximately)
DELETE FROM `skp_rules_from`;
/*!40000 ALTER TABLE `skp_rules_from` DISABLE KEYS */;
INSERT INTO `skp_rules_from` (`fields_code`, `required`, `message`, `trigger`) VALUES
	('01', 'true', '\'Please input Activity name\'', '\'blur\'');
/*!40000 ALTER TABLE `skp_rules_from` ENABLE KEYS */;

-- Dumping structure for table stsk_group.stsk_detail
CREATE TABLE IF NOT EXISTS `stsk_detail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PrCode` varchar(50) DEFAULT NULL,
  `TrnName` varchar(50) DEFAULT NULL,
  `PrName` varchar(50) DEFAULT NULL,
  `TrnDate` datetime DEFAULT NULL,
  `TrnAmt` decimal(10,0) DEFAULT NULL,
  `Posteddate` datetime NOT NULL,
  `TrnType` varchar(50) DEFAULT NULL,
  `TrnMode` varchar(50) DEFAULT NULL,
  `TrnNote` varchar(100) DEFAULT NULL,
  `ccy` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `CompanyId` varchar(50) DEFAULT NULL,
  `BrCode` int(11) DEFAULT NULL,
  `BrName` varchar(50) DEFAULT NULL,
  `warehouse_code` varchar(50) DEFAULT NULL,
  `warehouse_name` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `flag` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.stsk_detail: ~46 rows (approximately)
DELETE FROM `stsk_detail`;
/*!40000 ALTER TABLE `stsk_detail` DISABLE KEYS */;
INSERT INTO `stsk_detail` (`Id`, `PrCode`, `TrnName`, `PrName`, `TrnDate`, `TrnAmt`, `Posteddate`, `TrnType`, `TrnMode`, `TrnNote`, `ccy`, `CompanyName`, `CompanyId`, `BrCode`, `BrName`, `warehouse_code`, `warehouse_name`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `status`, `flag`, `created_at`, `updated_at`, `updated_by`) VALUES
	(1, '01', 'Monthly Plan', 'Group Loan Flat KHR', '2019-11-06 00:00:00', 90000, '2019-11-08 16:30:18', 'TTP001', 'TTM002', 'test', 'USD', 'SAHAKRINPHEAP MIF PLC.', '1', 500, 'HO', NULL, NULL, 'Admin', '2019-11-08 16:30:18', 'Admin', '2019-11-14 14:26:35', 0, 1, '2019-11-14 14:26:35', '2019-11-14 14:26:35', ''),
	(2, '02', 'Weekly Plan', 'Maternity (VIP)', '2019-11-07 00:00:00', 9000000, '2019-11-08 16:44:59', 'TTP001', 'TTM002', 'Test', 'KHR', 'ORIENDA Polyclinic', '7', 500, 'HO', NULL, NULL, 'Admin', '2019-11-08 16:44:59', NULL, NULL, 1, 1, '2019-11-08 16:44:59', '2019-11-07 09:24:58', ''),
	(3, '02', '23', 'Dissel', '2019-11-08 00:00:00', 230000, '2019-11-08 11:30:39', 'TTP001', 'TTM001', 'd', 'KHR', 'MHT', '5', 500, 'HO', NULL, NULL, 'Admin', '2019-11-08 11:30:39', NULL, NULL, 1, 1, '2019-11-08 11:30:39', '2019-11-08 11:30:39', ''),
	(4, '02', '9000', 'Ind Loan Flat KHR', '2019-11-08 00:00:00', 9000, '2019-11-10 08:44:48', 'TTP001', 'TTM002', 'test', 'KHR', 'SAHAKRINPHEAP MIF PLC.', '1', 500, 'HO', NULL, NULL, 'Admin', '2019-11-10 08:44:48', 'Admin', '2019-11-14 14:26:35', 0, 1, '2019-11-14 14:26:35', '2019-11-14 14:26:35', ''),
	(5, '26', 'Personl', 'Personal Loan', '2019-11-14 00:00:00', 100, '2019-11-14 13:50:52', 'TTP001', 'TTM002', 'testing', 'KHR', 'SAHAKRINPHEAP MIF PLC.', '1', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 13:50:52', 'Admin', '2019-11-14 14:26:35', 0, 1, '2019-11-14 14:26:35', '2019-11-14 14:26:35', ''),
	(6, '07', 'Home', 'Home Care', '2019-11-14 00:00:00', 500, '2019-11-14 13:52:14', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 13:52:14', NULL, NULL, 1, 1, '2019-11-14 13:52:14', '2019-11-14 13:52:14', ''),
	(7, '01', 'Home Gass', 'Gass', '2019-11-14 00:00:00', 10000, '2019-11-14 13:53:03', 'TTP001', 'TTM003', 'testing', 'KHR', 'MHT', '5', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 13:53:03', NULL, NULL, 1, 1, '2019-11-14 13:53:03', '2019-11-14 13:53:03', ''),
	(8, '02', 'weekly', 'One Bedroom', '2019-11-14 00:00:00', 220000, '2019-11-19 16:31:04', 'TTP001', 'TTM001', 'testing', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'ManagerST', '2019-11-19 16:31:04', 'TellerST', '2019-11-19 17:37:47', 0, 1, '2019-11-19 17:37:47', '2019-11-19 17:37:47', 'ManagerST'),
	(9, '08', 'Office', 'Office 150m2', '2019-11-14 00:00:00', 20000, '2019-11-14 13:55:47', 'TTP001', 'TTM001', 'testing', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'ManagerST', '2019-11-14 13:55:47', 'TellerST', '2019-11-19 17:32:27', 0, 1, '2019-11-19 17:32:27', '2019-11-19 17:32:27', 'ManagerST'),
	(10, '03', 'Sale Staff', 'Super Gasoline', '2019-11-14 00:00:00', 1000, '2019-11-14 13:59:12', 'TTP001', 'TTM001', NULL, 'USD', 'MHT', '5', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 13:59:12', NULL, NULL, 1, 1, '2019-11-14 13:59:12', '2019-11-14 13:59:12', ''),
	(11, '04', 'Sale Staff', 'Premiem Gasoline', '2019-11-14 00:00:00', 5000, '2019-11-14 14:00:07', 'TTP001', 'TTM001', 'testing', 'USD', 'MHT', '5', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:00:07', NULL, NULL, 1, 1, '2019-11-14 14:00:07', '2019-11-14 14:00:07', ''),
	(12, '05', 'Sale Staff', 'Mart', '2019-11-14 00:00:00', 4000, '2019-11-14 14:00:42', 'TTP001', 'TTM001', 'testing', 'USD', 'MHT', '5', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:00:42', NULL, NULL, 1, 1, '2019-11-14 14:00:42', '2019-11-14 14:00:42', ''),
	(13, '22', 'Disbursement', 'Ind Agriculture Loan', '2019-11-14 00:00:00', 4000000, '2019-11-14 14:01:10', 'TTP001', 'TTM002', 'Buy cars', 'KHR', 'SAHAKRINPHEAP MIF PLC.', '1', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:01:10', 'Admin', '2019-11-14 14:26:35', 0, 1, '2019-11-14 14:26:35', '2019-11-14 14:26:35', ''),
	(14, '01', 'Number of Sale Staff', 'Maternity (Standard)', '2019-11-30 00:00:00', 5000, '2019-11-14 14:02:50', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:02:50', NULL, NULL, 1, 0, '2019-11-21 14:36:05', '2019-11-21 14:36:05', ''),
	(15, '07', 'Check health', 'Home Care', '2019-11-14 00:00:00', 100, '2019-11-14 14:03:39', 'TTP001', 'TTM002', 'Check all body and buy mediczne', 'USD', 'ORIENDA Polyclinic', '7', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:03:39', NULL, NULL, 1, 0, '2019-11-21 14:36:00', '2019-11-21 14:36:00', ''),
	(16, '02', 'Number of Sale Staff', 'Maternity (VIP)', '2019-11-30 00:00:00', 100000, '2019-11-14 14:03:47', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:03:47', NULL, NULL, 1, 0, '2019-11-21 14:35:56', '2019-11-21 14:35:56', ''),
	(17, '03', 'Number of Sale Staff', 'Gynaecology', '2019-11-30 00:00:00', 20000, '2019-11-14 14:04:30', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:04:30', NULL, NULL, 1, 0, '2019-11-21 14:35:52', '2019-11-21 14:35:52', ''),
	(18, '04', 'Number of Sale Staff', 'IVF', '2019-11-30 00:00:00', 200000, '2019-11-14 14:05:06', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:05:06', 'ManagerOrienda', '2019-11-20 17:26:10', 0, 1, '2019-11-20 17:26:10', '2019-11-20 17:26:10', 'AdminOrienda'),
	(19, '03', 'Room', 'Two Bedroom A', '2019-11-14 00:00:00', 1500, '2019-11-14 14:42:58', 'TTP001', 'TTM001', '1 Room and 2 bed', 'USD', 'St Apartment', '4', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:42:58', 'ST_User02', '2019-11-16 22:20:23', 0, 1, '2019-11-16 22:20:23', '2019-11-16 22:20:23', ''),
	(20, '05', 'Book 3 Room', 'Three Bedroom', '2019-11-14 00:00:00', 2000, '2019-11-14 14:28:12', 'TTP001', 'TTM001', 'I have 10 person and has 3 car', 'USD', 'St Apartment', '4', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:28:12', 'ManagerST', '2019-11-19 17:34:45', 0, 1, '2019-11-19 17:34:45', '2019-11-19 17:34:45', 'TellerST'),
	(21, '01', 'Month', 'Group Loan Flat KHR', '2019-12-31 00:00:00', 10000000, '2019-11-14 14:12:43', 'TTP001', 'TTM002', 'testing', 'KHR', 'SAHAKRINPHEAP MIF PLC.', '1', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:12:43', 'Admin', '2019-11-14 14:26:35', 0, 0, '2019-11-14 14:26:35', '2019-11-14 14:26:35', ''),
	(22, '02', 'Month', 'Ind Loan Flat KHR', '2019-11-30 00:00:00', 2000000, '2019-11-14 14:15:21', 'TTP001', 'TTM002', 'testing', 'KHR', 'SAHAKRINPHEAP MIF PLC.', '1', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:15:21', 'Admin', '2019-11-14 14:26:35', 0, 1, '2019-11-14 14:26:35', '2019-11-14 14:26:35', ''),
	(23, '03', 'Month', 'Group Loan Decline KHR', '2019-11-30 00:00:00', 30000000, '2019-11-14 14:18:57', 'TTP001', 'TTM002', 'testing', 'KHR', 'SAHAKRINPHEAP MIF PLC.', '1', 500, 'HO', NULL, NULL, 'Admin', '2019-11-14 14:18:57', 'Admin', '2019-11-14 14:26:35', 0, 1, '2019-11-14 14:26:35', '2019-11-14 14:26:35', ''),
	(24, '02', 'Monthly Payment', 'One Bedroom', '2019-10-16 00:00:00', 9000, '2019-10-16 22:08:27', 'TTP001', 'TTM001', 'Test', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'ST_User01', '2019-11-16 22:08:27', 'Admin', '2019-11-18 09:03:06', 0, 1, '2019-11-18 15:45:35', '2019-11-18 09:03:06', ''),
	(25, '04', 'Monthly Payment for room', 'Two Bedroom B', '2019-10-16 00:00:00', 900, '2019-10-16 22:22:52', 'TTP001', 'TTM001', 'Monthly payment room', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'ST_User01', '2019-11-16 22:22:52', 'ManagerST', '2019-11-18 09:06:57', 0, 1, '2019-11-18 15:45:39', '2019-11-18 09:06:57', ''),
	(26, '01', 'Monthly Payment', 'Studio Room', '2019-11-18 00:00:00', 900, '2019-11-18 09:04:15', 'TTP001', 'TTM001', 'test', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'TellerST', '2019-11-18 09:04:15', 'Admin', '2019-11-18 09:04:34', 0, 1, '2019-11-18 09:04:34', '2019-11-18 09:04:34', ''),
	(27, '03', '2 Room', 'Two Bedroom A', '2019-11-19 00:00:00', 500, '2019-11-18 16:48:39', 'TTP001', 'TTM001', 'Rent a week', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'AdminST', '2019-11-18 16:48:39', NULL, NULL, 1, 0, '2019-11-18 16:56:16', '2019-11-18 16:56:16', ''),
	(28, '05', 'Testing', 'Three Bedroom', '2019-11-18 00:00:00', 7000, '2019-11-18 17:24:47', 'TTP001', 'TTM001', 'testing', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'AdminST', '2019-11-18 17:24:47', 'ManagerST', '2019-11-19 17:36:35', 0, 1, '2019-11-19 17:36:35', '2019-11-19 17:36:35', 'TellerST'),
	(29, '01', 'Monthly transaction', 'Studio Room', '2019-11-20 00:00:00', 10, '2019-11-20 07:26:24', 'TTP001', 'TrnMode', 'Noted', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'TellerST', '2019-11-20 07:26:24', 'ManagerST', '2019-11-20 14:13:17', 0, 1, '2019-11-20 14:13:17', '2019-11-20 14:13:17', 'TellerST'),
	(30, '01', 'Monthly transaction', 'Studio Room', '1970-01-01 00:00:00', 2000, '2019-11-20 07:26:36', 'TTP001', 'TrnMode', 'When you create an essay outline, you will probably list ideas that need to be included in your', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'TellerST', '2019-11-20 07:26:36', 'AdminST', '2019-11-20 12:01:50', 0, 1, '2019-11-20 12:01:50', '2019-11-20 12:01:50', 'ManagerST'),
	(31, '01', 'Test', 'Studio Room', '2019-11-20 00:00:00', 200, '2019-11-20 07:33:43', 'TTP001', 'TTM001', '900', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'TellerST', '2019-11-20 07:33:43', 'TellerST', '2019-11-20 11:54:27', 0, 1, '2019-11-20 11:54:27', '2019-11-20 11:54:27', 'AdminST'),
	(32, '09', 'STMonthly', 'Office 71m2', '2019-11-20 00:00:00', 500, '2019-11-20 13:41:40', 'TTP001', 'TTM001', 'testing', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'TellerST', '2019-11-20 13:41:40', NULL, NULL, 1, 1, '2019-11-20 13:41:40', '2019-11-20 13:41:40', NULL),
	(33, '03', 'Rent 2 Room', 'Two Bedroom A', '2019-11-19 00:00:00', 500, '2019-11-20 13:49:20', 'TTP001', 'TTM001', '2 car', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'AdminST', '2019-11-20 13:49:20', NULL, NULL, 1, 1, '2019-11-20 13:49:20', '2019-11-20 13:49:20', NULL),
	(34, '02', 'TYear', 'One Bedroom', '2019-11-20 00:00:00', 5000, '2019-11-20 14:40:40', 'TTP001', 'TTM001', 'testing', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'ManagerST', '2019-11-20 14:40:40', 'AdminST', '2019-11-20 14:47:26', 0, 1, '2019-11-20 14:47:26', '2019-11-20 14:47:26', 'ManagerST'),
	(35, '01', 't', 'Studio Room', '2019-11-21 00:00:00', 2423, '2019-11-20 15:12:32', 'TTP001', 'TTM001', 'gddgdfgdgd', 'USD', 'St Apartment', '4', 200, 'ST', NULL, NULL, 'ManagerST', '2019-11-20 15:12:32', NULL, NULL, 1, 1, '2019-11-20 15:12:32', '2019-11-20 15:12:32', NULL),
	(36, '06', 'SMonthly', 'Emergency 1hrs', '2019-11-21 00:00:00', 5000, '2019-11-21 14:37:34', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 600, 'ST', NULL, NULL, 'AdminOrienda', '2019-11-21 14:37:34', 'TellerOrienda', '2019-11-21 14:39:52', 0, 1, '2019-11-21 14:39:52', '2019-11-21 14:39:52', 'AdminOrienda'),
	(37, '03', '3434', 'Super Gasoline', '2019-11-22 00:00:00', 2323, '2019-11-22 05:07:46', 'TTP001', 'TTM003', '2323', 'USD', 'TSP', '6', 301, 'TSP', NULL, NULL, 'ManagerTSP', '2019-11-22 05:07:46', NULL, NULL, 1, 0, '2019-11-22 11:14:07', '2019-11-22 11:14:07', NULL),
	(38, '03', 'OMonthly', 'Gynaecology', '2019-11-22 00:00:00', 1000, '2019-11-22 08:21:33', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 600, 'ST', NULL, NULL, 'AdminOrienda', '2019-11-22 08:21:33', NULL, NULL, 1, 1, '2019-11-22 08:21:33', '2019-11-22 08:21:33', NULL),
	(39, '04', 'ODaily', 'IVF', '2019-11-22 00:00:00', 8000, '2019-11-22 08:27:43', 'TTP001', 'TTM002', 'tesing', 'USD', 'ORIENDA Polyclinic', '7', 600, 'ST', NULL, NULL, 'AdminOrienda', '2019-11-22 08:27:43', NULL, NULL, 1, 1, '2019-11-22 08:27:43', '2019-11-22 08:27:43', NULL),
	(40, '07', 'AAA', 'Home Care', '2019-11-22 00:00:00', 4000, '2019-11-22 08:36:36', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 600, 'ST', NULL, NULL, 'AdminOrienda', '2019-11-22 08:36:36', NULL, NULL, 1, 1, '2019-11-22 08:36:36', '2019-11-22 08:36:36', NULL),
	(41, '07', 'ODaily', 'Home Care', '2019-11-22 00:00:00', 7000, '2019-11-22 09:00:48', 'TTP001', 'TTM002', 'testing', 'USD', 'ORIENDA Polyclinic', '7', 600, 'ST', NULL, NULL, 'AdminOrienda', '2019-11-22 09:00:48', NULL, NULL, 1, 1, '2019-11-22 09:00:48', '2019-11-22 09:00:48', NULL),
	(42, '01', 'Monthly', 'Gass ', '2019-11-22 00:00:00', 1000, '2019-11-22 10:39:37', 'TTP001', 'TTM001', 'testig', 'USD', 'TSP', '6', 301, 'TSP', NULL, NULL, 'adminTSP', '2019-11-22 10:39:37', 'ManagerTSP', '2019-11-22 10:41:32', 0, 1, '2019-11-22 10:41:32', '2019-11-22 10:41:32', 'adminTSP'),
	(43, '03', 'TWeekly', 'Super Gasoline', '2019-11-22 00:00:00', 10000, '2019-11-22 11:01:54', 'TTP001', 'TTM001', 'testing', 'USD', 'TSP', '6', 301, 'TSP', NULL, NULL, 'TellerTSP', '2019-11-22 11:01:54', 'ManagerTSP', '2019-11-22 11:12:38', 0, 1, '2019-11-22 11:12:38', '2019-11-22 11:12:38', 'TellerTSP'),
	(44, '02', '9000', 'Banking & Finance', '2019-11-30 00:00:00', 900, '2019-11-22 11:02:23', 'TTP001', 'TTM001', 'sdsd', 'USD', 'Nitei Niron Natary Public', '9', 800, 'NNNP', NULL, NULL, 'TellerNNNP', '2019-11-22 11:02:23', NULL, NULL, 1, 1, '2019-11-22 11:02:23', '2019-11-22 11:02:23', NULL),
	(45, '03', 'MHTWeekly', 'Super Gasoline', '2019-11-22 00:00:00', 90, '2019-11-22 11:20:30', 'TTP001', 'TTM001', 'testing', 'USD', 'MHT', '5', 300, 'MHT', NULL, NULL, 'adminMHT', '2019-11-22 11:20:30', 'TellerMHT', '2019-11-22 11:21:41', 0, 1, '2019-11-22 11:21:41', '2019-11-22 11:21:41', 'adminMHT'),
	(46, '02', 'NWeekly', 'Banking & Finance', '2019-11-22 00:00:00', 500, '2019-11-22 11:35:55', 'TTP001', 'TTM001', 'testing', 'USD', 'Nitei Niron Natary Public', '9', 800, 'NNNP', NULL, NULL, 'NNNPAdmin', '2019-11-22 11:35:55', 'TellerNNNP', '2019-11-22 11:43:08', 0, 1, '2019-11-22 11:43:08', '2019-11-22 11:43:08', 'NNNPAdmin'),
	(47, '01', 'NAB', 'Family', '2019-11-22 00:00:00', 500, '2019-11-22 11:44:51', 'TTP001', 'TTM001', 'testing', 'USD', 'Nitei Niron Natary Public', '9', 800, 'NNNP', NULL, NULL, 'ManagerNNNP', '2019-11-22 11:44:51', NULL, NULL, 1, 1, '2019-11-22 11:44:51', '2019-11-22 11:44:51', NULL);
/*!40000 ALTER TABLE `stsk_detail` ENABLE KEYS */;

-- Dumping structure for table stsk_group.stsk_fields_summary
CREATE TABLE IF NOT EXISTS `stsk_fields_summary` (
  `title` text NOT NULL,
  `fields_code` varchar(50) NOT NULL,
  `CompanyCode` varchar(50) NOT NULL,
  `fields_type` int(11) NOT NULL,
  `PrCode` varchar(50) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.stsk_fields_summary: ~119 rows (approximately)
DELETE FROM `stsk_fields_summary`;
/*!40000 ALTER TABLE `stsk_fields_summary` DISABLE KEYS */;
INSERT INTO `stsk_fields_summary` (`title`, `fields_code`, `CompanyCode`, `fields_type`, `PrCode`, `flag`) VALUES
	('SAHAKRINPHEAP MICROFINANCE (MFI, PWS, and NGO)', '5001', '500', 1, '', 1),
	('I. Staff Productivities', '5002', '500', 2, '', 1),
	('Number of CO', '5003', '500', 3, '', 1),
	('II .Loan Productivities', '5004', '500', 2, '', 1),
	('Number of Active Client', '5005', '500', 3, '', 1),
	('Number of Disbursed Client', '5006', '500', 3, '', 1),
	('Value of Loan Outstanding', '5007', '500', 3, '', 1),
	('Value of Loan Disburse', '5008', '500', 3, '', 1),
	('III. Portfolio Quality', '5009', '500', 2, '', 1),
	('Numer of Client PAR 1day', '50010', '500', 3, '', 1),
	('Value of PAR 1day', '50011', '500', 3, '', 1),
	('Number of Client PAR 7days', '50012', '500', 3, '', 1),
	('% PAR 1day', '50013', '500', 3, '', 1),
	('Value of PAR 7days ', '50014', '500', 3, '', 1),
	('% PAR 7days', '50015', '500', 3, '', 1),
	('Number of Client PAR 30days\r\n', '50016', '500', 3, '', 1),
	('Value of PAR 30days\r\n', '50017', '500', 3, '', 1),
	('% PAR 30days\r\n', '50018', '500', 3, '', 1),
	('IV. NPL Collection ( >=30 Days) 											\r\n', '50019', '500', 2, '', 1),
	('Number of Client NPL Collection\r\n', '50020', '500', 3, '', 1),
	('Value of Client NPL Collection\r\n', '50021', '500', 3, '', 1),
	('V. Penalty Collection											\r\n', '50022', '500', 2, '', 1),
	('Value of Penalty Collection \r\n', '50023', '500', 3, '', 1),
	('VI. Written-Off											\r\n', '50024', '500', 2, '', 1),
	('Number of Client WO Collection\r\n', '50025', '500', 3, '', 1),
	('Value of WO Collection\r\n', '50026', '500', 3, '', 1),
	('XI. Association Insurance ', '50027', '500', 2, '', 1),
	('Number of Client Association', '50028', '500', 3, '', 1),
	('Value of Premium Association', '50029', '500', 3, '', 1),
	('ORIENDA POLYCLINIC & MATERNITY', '6001', '600', 1, '', 1),
	('I. Staff Productivities', '6002', '600', 2, '', 1),
	('Number of Sale Staff', '6003', '600', 3, '', 1),
	('II. Product & Service Package (Number of Client)', '6004', '600', 2, '', 1),
	('Maternity (Standard)', '6005', '600', 3, '', 1),
	('Maternity (VIP)', '6006', '600', 3, '', 1),
	('Gynaecology', '6007', '600', 3, '', 1),
	('IVF', '6008', '600', 3, '', 1),
	('Cardiology', '6009', '600', 3, '', 1),
	('Pediatrics', '60010', '600', 3, '', 1),
	('General Checkup', '60011', '600', 3, '', 1),
	('Emergency 1hrs', '60012', '600', 3, '', 1),
	('Medical Concierge', '60013', '600', 3, '', 1),
	('Home Care', '60014', '600', 3, '', 1),
	('Air Ambulance', '60015', '600', 3, '', 1),
	('Uro', '60016', '600', 3, '', 1),
	('Gastro', '60017', '600', 3, '', 1),
	('II. Product & Service Package (Value-USD)', '60018', '600', 2, '', 1),
	('Maternity (Standard)', '60019', '600', 3, '', 1),
	('Maternity (VIP)', '60020', '600', 3, '', 1),
	('Gynaecology', '60021', '600', 3, '', 1),
	('IVF', '60022', '600', 3, '', 1),
	('Cardiology', '60023', '600', 3, '', 1),
	('Pediatrics', '60024', '600', 3, '', 1),
	('General Checkup', '60025', '600', 3, '', 1),
	('Emergency 1hrs', '60026', '600', 3, '', 1),
	('Medical Concierge', '60027', '600', 3, '', 1),
	('Home Care', '60028', '600', 3, '', 1),
	('Air Ambulance', '60029', '600', 3, '', 1),
	('Uro', '60030', '600', 3, '', 1),
	('Gastro', '60031', '600', 3, '', 1),
	('MEKONG MICROINSURANCE', '7001', '700', 1, '', 1),
	('I.Staff Productivities', '7002', '700', 2, '', 1),
	('Number of Sale Staff', '7003', '700', 3, '', 1),
	('II.Product & Service Package', '7004', '700', 2, '', 1),
	('Number of Client Credit Life', '7005', '700', 3, '', 1),
	('Value of Credit Life', '7006', '700', 3, '', 1),
	('Numer of Client Personal Accident', '7007', '700', 3, '', 1),
	('Value of Personal Accident', '7008', '700', 3, '', 1),
	('ST APARTMENT', '2001', '200', 1, '0', 1),
	('I. Staff Productivities', '2002', '200', 2, '0', 1),
	('Number of Sale Staff', '2003', '200', 3, '0', 1),
	('II. Product & Service Package (Value-USD)', '2004', '200', 2, '0', 1),
	('Studio Room', '2005', '200', 3, '01', 1),
	('One Bedroom', '2006', '200', 3, '02', 1),
	('Two Bedroom A', '2007', '200', 3, '03', 1),
	('Two Bedroom B', '2008', '200', 3, '03', 1),
	('Three Bedroom', '2009', '200', 3, '05', 1),
	('Penthouse A', '20010', '200', 3, '06', 1),
	('Penthouse B', '20011', '200', 3, '07', 1),
	('Office 150m2', '20012', '200', 3, '08', 1),
	('Office 71m2', '20013', '200', 3, '09', 1),
	('TELA GAS STATION', '3001', '300', 1, '', 1),
	('Number of Sale Staff (Gasoline)', '3002', '300', 3, '', 1),
	('Number of Sale Staff (Mart)', '3003', '300', 3, '', 1),
	('I.Product & Service Package (Lit)', '3004', '300', 2, '', 1),
	('Gass', '3005', '300', 3, '', 1),
	('Dissel', '3006', '300', 3, '', 1),
	('Super Gasoline ', '3007', '300', 3, '', 1),
	('Premiem Gasoline', '3008', '300', 3, '', 1),
	('II.Product & Service Package (Value-USD)', '3009', '300', 2, '', 1),
	('Gass ', '30010', '300', 3, '', 1),
	('Dissel', '30011', '300', 3, '', 1),
	('Super Gasoline', '30012', '300', 3, '', 1),
	('Premiem Gasoline', '30013', '300', 3, '', 1),
	('Mart', '30014', '300', 3, '', 1),
	('NITEI NIRON NOTARY PUBLIC', '8001', '800', 1, '', 1),
	('I.Staff Productivities', '8002', '800', 2, '', 1),
	('Number of Sale Staff', '8003', '800', 3, '', 1),
	('II.Product & Service Package', '8004', '800', 2, '', 1),
	('Family', '8005', '800', 3, '', 1),
	('Banking & Finance', '8006', '800', 3, '', 1),
	('Corporate & Investment', '8007', '800', 3, '', 1),
	('Real Estate', '8008', '800', 3, '', 1),
	('Labour', '8009', '800', 3, '', 1),
	('Due Deligence', '80010', '800', 3, '', 1),
	('Will/Testament', '80011', '800', 3, '', 1),
	('Notarization and Authentication', '80012', '800', 3, '', 1),
	('Legal text translation', '80013', '800', 3, '', 1),
	('TELA GAS STATION', '3011', '301', 1, '', 1),
	('Number of Sale Staff (Gasoline)', '3012', '301', 3, '', 1),
	('Number of Sale Staff (Mart)', '3013', '301', 3, '', 1),
	('I.Product & Service Package (Lit)', '3014', '301', 2, '', 1),
	('Gass', '3015', '301', 3, '', 1),
	('Dissel', '3016', '301', 3, '', 1),
	('Super Gasoline', '3017', '301', 3, '', 1),
	('Premiem Gasoline', '3018', '301', 3, '', 1),
	('II.Product & Service Package (Value-USD)', '3019', '301', 2, '', 1),
	('Gass ', '30110', '301', 3, '', 1),
	('Dissel', '30111', '301', 3, '', 1),
	('Super Gasoline', '30112', '301', 3, '', 1),
	('Premiem Gasoline', '30113', '301', 3, '', 1),
	('Mart', '30114', '301', 3, '', 1);
/*!40000 ALTER TABLE `stsk_fields_summary` ENABLE KEYS */;

-- Dumping structure for table stsk_group.stsk_plan
CREATE TABLE IF NOT EXISTS `stsk_plan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(50) NOT NULL,
  `PlanDate` datetime NOT NULL,
  `PlanCode` varchar(50) DEFAULT NULL,
  `PlanMode` varchar(50) NOT NULL,
  `PlanTitle` varchar(400) DEFAULT NULL,
  `FieldType` varchar(50) DEFAULT NULL,
  `Values` decimal(10,0) DEFAULT NULL,
  `ccy` varchar(10) DEFAULT NULL,
  `servicepackage` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `CompanyId` int(11) DEFAULT NULL,
  `BrCode` int(11) DEFAULT NULL,
  `BrName` varchar(50) DEFAULT NULL,
  `warehouse_code` varchar(50) DEFAULT NULL,
  `warehouse_name` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- Dumping data for table stsk_group.stsk_plan: ~184 rows (approximately)
DELETE FROM `stsk_plan`;
/*!40000 ALTER TABLE `stsk_plan` DISABLE KEYS */;
INSERT INTO `stsk_plan` (`Id`, `PlanName`, `PlanDate`, `PlanCode`, `PlanMode`, `PlanTitle`, `FieldType`, `Values`, `ccy`, `servicepackage`, `CompanyName`, `CompanyId`, `BrCode`, `BrName`, `warehouse_code`, `warehouse_name`, `updated_at`, `created_by`, `created_at`, `authorized_by`, `authorized_date`, `status`, `flag`) VALUES
	(1, 'Monthly', '2019-12-01 00:00:00', '60019', 'PLA006', 'Maternity', 'number', 900, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(2, 'Monthly', '2019-12-01 00:00:00', '60020', 'PLA006', 'MaternityVIP', 'number', 90, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(3, 'Monthly', '2019-12-01 00:00:00', '60021', 'PLA006', 'Gynaecology', 'number', 2100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(4, 'Monthly', '2019-12-01 00:00:00', '60022', 'PLA006', 'IVF', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(5, 'Monthly', '2019-12-01 00:00:00', '60023', 'PLA006', 'Cardiology', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(6, 'Monthly', '2019-12-01 00:00:00', '60024', 'PLA006', 'Pediatrics', 'number', 1900, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(7, 'Monthly', '2019-12-01 00:00:00', '60025', 'PLA006', 'GeneralCheckup', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(8, 'Monthly', '2019-12-01 00:00:00', '60026', 'PLA006', 'Emergency1hrs', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(9, 'Monthly', '2019-12-01 00:00:00', '60027', 'PLA006', 'MedicalConderge', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(10, 'Monthly', '2019-12-01 00:00:00', '60028', 'PLA006', 'HomeCare', 'number', 800, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(11, 'Monthly', '2019-12-01 00:00:00', '60029', 'PLA006', 'AirAmbulance', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(12, 'Monthly', '2019-12-01 00:00:00', '60030', 'PLA006', 'Uro', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(13, 'Monthly', '2019-12-01 00:00:00', '60031', 'PLA006', 'Gastro', 'number', 200, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:06', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(14, 'Monthly', '2019-12-01 00:00:00', '6003', 'PLA006', 'NumSaleStaff', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(15, 'Monthly', '2019-12-01 00:00:00', '6005', 'PLA006', 'Maternity', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(16, 'Monthly', '2019-12-01 00:00:00', '6006', 'PLA006', 'MaternityVIP', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(17, 'Monthly', '2019-12-01 00:00:00', '6007', 'PLA006', 'Gynaecology', 'number', 9, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(18, 'Monthly', '2019-12-01 00:00:00', '6008', 'PLA006', 'IVF', 'number', 1, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(19, 'Monthly', '2019-12-01 00:00:00', '6009', 'PLA006', 'Cardiology', 'number', 3, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(20, 'Monthly', '2019-12-01 00:00:00', '60010', 'PLA006', 'Pediatrics', 'number', 2, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(21, 'Monthly', '2019-12-01 00:00:00', '60011', 'PLA006', 'GeneralCheckup', 'number', 2, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(22, 'Monthly', '2019-12-01 00:00:00', '60012', 'PLA006', 'Emergency1hrs', 'number', 9, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(23, 'Monthly', '2019-12-01 00:00:00', '60013', 'PLA006', 'MedicalConerge', 'number', 90, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(24, 'Monthly', '2019-12-01 00:00:00', '60014', 'PLA006', 'Home Care', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(25, 'Monthly', '2019-12-01 00:00:00', '60015', 'PLA006', 'AirAmbulance', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(26, 'Monthly', '2019-12-01 00:00:00', '60016', 'PLA006', 'Uro', 'number', 100, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(27, 'Monthly', '2019-12-01 00:00:00', '60017', 'PLA006', 'Gastro', 'number', 1, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 11:53:59', 'ManagerOrienda', '2019-11-21 11:53:28', 'ManagerOrienda', '2019-11-21 11:53:59', 0, 1),
	(28, 'Yearly Plan', '2021-11-30 00:00:00', '6003', 'PLA007', 'NumSaleStaff', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(29, 'Yearly Plan', '2021-11-30 00:00:00', '6005', 'PLA007', 'Maternity', 'number', 90, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(30, 'Yearly Plan', '2021-11-30 00:00:00', '6006', 'PLA007', 'MaternityVIP', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(31, 'Yearly Plan', '2021-11-30 00:00:00', '6007', 'PLA007', 'Gynaecology', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(32, 'Yearly Plan', '2021-11-30 00:00:00', '6008', 'PLA007', 'IVF', 'number', 30, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(33, 'Yearly Plan', '2021-11-30 00:00:00', '6009', 'PLA007', 'Cardiology', 'number', 40, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(34, 'Yearly Plan', '2021-11-30 00:00:00', '60010', 'PLA007', 'Pediatrics', 'number', 20, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(35, 'Yearly Plan', '2021-11-30 00:00:00', '60011', 'PLA007', 'GeneralCheckup', 'number', 50, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(36, 'Yearly Plan', '2021-11-30 00:00:00', '60012', 'PLA007', 'Emergency1hrs', 'number', 30, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(37, 'Yearly Plan', '2021-11-30 00:00:00', '60013', 'PLA007', 'MedicalConerge', 'number', 11, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(38, 'Yearly Plan', '2021-11-30 00:00:00', '60014', 'PLA007', 'Home Care', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(39, 'Yearly Plan', '2021-11-30 00:00:00', '60015', 'PLA007', 'AirAmbulance', 'number', 10, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(40, 'Yearly Plan', '2021-11-30 00:00:00', '60016', 'PLA007', 'Uro', 'number', 40, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(41, 'Yearly Plan', '2021-11-30 00:00:00', '60017', 'PLA007', 'Gastro', 'number', 20, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:13', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(42, 'Yearly Plan', '2021-11-30 00:00:00', '60019', 'PLA007', 'Maternity', 'number', 900, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(43, 'Yearly Plan', '2021-11-30 00:00:00', '60020', 'PLA007', 'MaternityVIP', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(44, 'Yearly Plan', '2021-11-30 00:00:00', '60021', 'PLA007', 'Gynaecology', 'number', 1900, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(45, 'Yearly Plan', '2021-11-30 00:00:00', '60022', 'PLA007', 'IVF', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(46, 'Yearly Plan', '2021-11-30 00:00:00', '60023', 'PLA007', 'Cardiology', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(47, 'Yearly Plan', '2021-11-30 00:00:00', '60024', 'PLA007', 'Pediatrics', 'number', 2999, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(48, 'Yearly Plan', '2021-11-30 00:00:00', '60025', 'PLA007', 'GeneralCheckup', 'number', 1899, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(49, 'Yearly Plan', '2021-11-30 00:00:00', '60026', 'PLA007', 'Emergency1hrs', 'number', 1900, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(50, 'Yearly Plan', '2021-11-30 00:00:00', '60027', 'PLA007', 'MedicalConderge', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(51, 'Yearly Plan', '2021-11-30 00:00:00', '60028', 'PLA007', 'HomeCare', 'number', 1001, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(52, 'Yearly Plan', '2021-11-30 00:00:00', '60029', 'PLA007', 'AirAmbulance', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(53, 'Yearly Plan', '2021-11-30 00:00:00', '60030', 'PLA007', 'Uro', 'number', 200, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(54, 'Yearly Plan', '2021-11-30 00:00:00', '60031', 'PLA007', 'Gastro', 'number', 100, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:25:50', 'ManagerOrienda', '2019-11-21 14:25:34', 'ManagerOrienda', '2019-11-21 14:25:50', 0, 1),
	(55, 'PDaily', '2019-11-21 00:00:00', '6003', 'PLA001', 'NumSaleStaff', 'number', 100, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(56, 'PDaily', '2019-11-21 00:00:00', '6005', 'PLA001', 'Maternity', 'number', 90, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(57, 'PDaily', '2019-11-21 00:00:00', '6006', 'PLA001', 'MaternityVIP', 'number', 80, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(58, 'PDaily', '2019-11-21 00:00:00', '6007', 'PLA001', 'Gynaecology', 'number', 70, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(59, 'PDaily', '2019-11-21 00:00:00', '6008', 'PLA001', 'IVF', 'number', 60, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(60, 'PDaily', '2019-11-21 00:00:00', '6009', 'PLA001', 'Cardiology', 'number', 50, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(61, 'PDaily', '2019-11-21 00:00:00', '60010', 'PLA001', 'Pediatrics', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(62, 'PDaily', '2019-11-21 00:00:00', '60011', 'PLA001', 'GeneralCheckup', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(63, 'PDaily', '2019-11-21 00:00:00', '60012', 'PLA001', 'Emergency1hrs', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(64, 'PDaily', '2019-11-21 00:00:00', '60013', 'PLA001', 'MedicalConerge', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(65, 'PDaily', '2019-11-21 00:00:00', '60014', 'PLA001', 'Home Care', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(66, 'PDaily', '2019-11-21 00:00:00', '60015', 'PLA001', 'AirAmbulance', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(67, 'PDaily', '2019-11-21 00:00:00', '60016', 'PLA001', 'Uro', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(68, 'PDaily', '2019-11-21 00:00:00', '60017', 'PLA001', 'Gastro', 'number', 0, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-21 14:42:38', 'AdminOrienda', '2019-11-21 14:41:37', 'AdminOrienda', '2019-11-21 14:42:38', 0, 1),
	(69, 'ODaily', '2019-11-22 00:00:00', '6003', 'PLA001', 'NumSaleStaff', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(70, 'ODaily', '2019-11-22 00:00:00', '6005', 'PLA001', 'Maternity', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(71, 'ODaily', '2019-11-22 00:00:00', '6006', 'PLA001', 'MaternityVIP', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(72, 'ODaily', '2019-11-22 00:00:00', '6007', 'PLA001', 'Gynaecology', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(73, 'ODaily', '2019-11-22 00:00:00', '6008', 'PLA001', 'IVF', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(74, 'ODaily', '2019-11-22 00:00:00', '6009', 'PLA001', 'Cardiology', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(75, 'ODaily', '2019-11-22 00:00:00', '60010', 'PLA001', 'Pediatrics', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(76, 'ODaily', '2019-11-22 00:00:00', '60011', 'PLA001', 'GeneralCheckup', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(77, 'ODaily', '2019-11-22 00:00:00', '60012', 'PLA001', 'Emergency1hrs', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(78, 'ODaily', '2019-11-22 00:00:00', '60013', 'PLA001', 'MedicalConerge', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(79, 'ODaily', '2019-11-22 00:00:00', '60014', 'PLA001', 'Home Care', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(80, 'ODaily', '2019-11-22 00:00:00', '60015', 'PLA001', 'AirAmbulance', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(81, 'ODaily', '2019-11-22 00:00:00', '60016', 'PLA001', 'Uro', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(82, 'ODaily', '2019-11-22 00:00:00', '60017', 'PLA001', 'Gastro', 'number', 20000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:23:44', 'AdminOrienda', '2019-11-22 08:23:44', NULL, NULL, 1, 1),
	(83, 'PDaily', '2019-11-22 00:00:00', '6003', 'PLA001', 'NumSaleStaff', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(84, 'PDaily', '2019-11-22 00:00:00', '6005', 'PLA001', 'Maternity', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(85, 'PDaily', '2019-11-22 00:00:00', '6006', 'PLA001', 'MaternityVIP', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(86, 'PDaily', '2019-11-22 00:00:00', '6007', 'PLA001', 'Gynaecology', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(87, 'PDaily', '2019-11-22 00:00:00', '6008', 'PLA001', 'IVF', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(88, 'PDaily', '2019-11-22 00:00:00', '6009', 'PLA001', 'Cardiology', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(89, 'PDaily', '2019-11-22 00:00:00', '60010', 'PLA001', 'Pediatrics', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(90, 'PDaily', '2019-11-22 00:00:00', '60011', 'PLA001', 'GeneralCheckup', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(91, 'PDaily', '2019-11-22 00:00:00', '60012', 'PLA001', 'Emergency1hrs', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(92, 'PDaily', '2019-11-22 00:00:00', '60013', 'PLA001', 'MedicalConerge', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(93, 'PDaily', '2019-11-22 00:00:00', '60014', 'PLA001', 'Home Care', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(94, 'PDaily', '2019-11-22 00:00:00', '60015', 'PLA001', 'AirAmbulance', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(95, 'PDaily', '2019-11-22 00:00:00', '60016', 'PLA001', 'Uro', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(96, 'PDaily', '2019-11-22 00:00:00', '60017', 'PLA001', 'Gastro', 'number', 6000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:29:07', 'AdminOrienda', '2019-11-22 08:29:07', NULL, NULL, 1, 1),
	(97, 'PPBBB', '2019-11-22 00:00:00', '6003', 'PLA006', 'NumSaleStaff', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(98, 'PPBBB', '2019-11-22 00:00:00', '6005', 'PLA006', 'Maternity', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(99, 'PPBBB', '2019-11-22 00:00:00', '6006', 'PLA006', 'MaternityVIP', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(100, 'PPBBB', '2019-11-22 00:00:00', '6007', 'PLA006', 'Gynaecology', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(101, 'PPBBB', '2019-11-22 00:00:00', '6008', 'PLA006', 'IVF', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(102, 'PPBBB', '2019-11-22 00:00:00', '6009', 'PLA006', 'Cardiology', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(103, 'PPBBB', '2019-11-22 00:00:00', '60010', 'PLA006', 'Pediatrics', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(104, 'PPBBB', '2019-11-22 00:00:00', '60011', 'PLA006', 'GeneralCheckup', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(105, 'PPBBB', '2019-11-22 00:00:00', '60012', 'PLA006', 'Emergency1hrs', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(106, 'PPBBB', '2019-11-22 00:00:00', '60013', 'PLA006', 'MedicalConerge', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(107, 'PPBBB', '2019-11-22 00:00:00', '60014', 'PLA006', 'Home Care', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(108, 'PPBBB', '2019-11-22 00:00:00', '60015', 'PLA006', 'AirAmbulance', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(109, 'PPBBB', '2019-11-22 00:00:00', '60016', 'PLA006', 'Uro', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(110, 'PPBBB', '2019-11-22 00:00:00', '60017', 'PLA006', 'Gastro', 'number', 8000, 'USD', 'Client', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 08:45:09', 'AdminOrienda', '2019-11-22 08:45:09', NULL, NULL, 1, 1),
	(111, 'PDaily', '2019-11-22 00:00:00', '60019', 'PLA001', 'Maternity', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(112, 'PDaily', '2019-11-22 00:00:00', '60020', 'PLA001', 'MaternityVIP', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(113, 'PDaily', '2019-11-22 00:00:00', '60021', 'PLA001', 'Gynaecology', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(114, 'PDaily', '2019-11-22 00:00:00', '60022', 'PLA001', 'IVF', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(115, 'PDaily', '2019-11-22 00:00:00', '60023', 'PLA001', 'Cardiology', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(116, 'PDaily', '2019-11-22 00:00:00', '60024', 'PLA001', 'Pediatrics', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(117, 'PDaily', '2019-11-22 00:00:00', '60025', 'PLA001', 'GeneralCheckup', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(118, 'PDaily', '2019-11-22 00:00:00', '60026', 'PLA001', 'Emergency1hrs', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(119, 'PDaily', '2019-11-22 00:00:00', '60027', 'PLA001', 'MedicalConderge', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(120, 'PDaily', '2019-11-22 00:00:00', '60028', 'PLA001', 'HomeCare', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(121, 'PDaily', '2019-11-22 00:00:00', '60029', 'PLA001', 'AirAmbulance', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(122, 'PDaily', '2019-11-22 00:00:00', '60030', 'PLA001', 'Uro', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(123, 'PDaily', '2019-11-22 00:00:00', '60031', 'PLA001', 'Gastro', 'number', 9000, 'USD', 'Value', 'ORIENDA Polyclinic', 7, 600, 'ST', NULL, NULL, '2019-11-22 09:01:51', 'AdminOrienda', '2019-11-22 09:01:51', NULL, NULL, 1, 1),
	(147, 'Monthly Plan', '2019-11-30 00:00:00', '3012', 'PLA006', 'NumberofSaleStaff', 'number', 10, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:17', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(148, 'Monthly Plan', '2019-11-30 00:00:00', '3013', 'PLA006', 'NumberofSaleStaffMart', 'number', 10, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:17', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(149, 'Monthly Plan', '2019-11-30 00:00:00', '30110', 'PLA006', 'Gass', 'number', 100, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:17', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(150, 'Monthly Plan', '2019-11-30 00:00:00', '30111', 'PLA006', 'Dissel', 'number', 100, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:17', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(151, 'Monthly Plan', '2019-11-30 00:00:00', '30112', 'PLA006', 'SuperGasoline', 'number', 200, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:17', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(152, 'Monthly Plan', '2019-11-30 00:00:00', '30113', 'PLA006', 'PremiemGasoline', 'number', 500, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:17', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(153, 'Monthly Plan', '2019-11-30 00:00:00', '30114', 'PLA006', 'Mart', 'number', 100, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:17', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(154, 'Monthly Plan', '2019-11-30 00:00:00', '3015', 'PLA006', 'Gass', 'number', 100, 'USD', 'LIT', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:26', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(155, 'Monthly Plan', '2019-11-30 00:00:00', '3016', 'PLA006', 'Dissel', 'number', 70, 'USD', 'LIT', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:26', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(156, 'Monthly Plan', '2019-11-30 00:00:00', '3017', 'PLA006', 'SuperGasoline', 'number', 40, 'USD', 'LIT', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:26', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(157, 'Monthly Plan', '2019-11-30 00:00:00', '3018', 'PLA006', 'PremiemGasoline', 'number', 2, 'USD', 'LIT', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:06:40', 'ManagerTSP', '2019-11-22 10:06:26', 'ManagerTSP', '2019-11-22 10:06:40', 0, 1),
	(170, 'Monthly', '2019-11-30 00:00:00', '3002', 'PLA006', 'NumberofSaleStaff', 'number', 10, 'USD', 'USD', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:37:52', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(171, 'Monthly', '2019-11-30 00:00:00', '3003', 'PLA006', 'NumberofSaleStaffMart', 'number', 10, 'USD', 'USD', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:37:52', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(172, 'Monthly', '2019-11-30 00:00:00', '30010', 'PLA006', 'Gass', 'number', 100, 'USD', 'USD', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:37:52', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(173, 'Monthly', '2019-11-30 00:00:00', '30011', 'PLA006', 'Dissel', 'number', 100, 'USD', 'USD', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:37:52', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(174, 'Monthly', '2019-11-30 00:00:00', '30012', 'PLA006', 'SuperGasoline', 'number', 1000, 'USD', 'USD', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:37:52', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(175, 'Monthly', '2019-11-30 00:00:00', '30013', 'PLA006', 'PremiemGasoline', 'number', 200, 'USD', 'USD', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:37:52', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(176, 'Monthly', '2019-11-30 00:00:00', '30014', 'PLA006', 'Mart', 'number', 200, 'USD', 'USD', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:37:52', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(177, 'Monthly', '2019-11-30 00:00:00', '3005', 'PLA006', 'Gass', 'number', 100, 'USD', 'LIT', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:38:06', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(178, 'Monthly', '2019-11-30 00:00:00', '3006', 'PLA006', 'Dissel', 'number', 200, 'USD', 'LIT', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:38:06', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(179, 'Monthly', '2019-11-30 00:00:00', '3007', 'PLA006', 'SuperGasoline', 'number', 200, 'USD', 'LIT', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:38:06', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(180, 'Monthly', '2019-11-30 00:00:00', '3008', 'PLA006', 'PremiemGasoline', 'number', 100, 'USD', 'LIT', 'MHT', 5, 300, 'MHT', NULL, NULL, '2019-11-22 10:38:31', 'ManagerMHT', '2019-11-22 10:38:06', 'ManagerMHT', '2019-11-22 10:38:31', 0, 1),
	(181, 'PMonthly', '2019-11-22 00:00:00', '3012', 'PLA006', 'NumberofSaleStaff', 'number', 5000, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:43:10', 'adminTSP', '2019-11-22 10:43:10', NULL, NULL, 1, 1),
	(182, 'PMonthly', '2019-11-22 00:00:00', '3013', 'PLA006', 'NumberofSaleStaffMart', 'number', 5000, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:43:10', 'adminTSP', '2019-11-22 10:43:10', NULL, NULL, 1, 1),
	(183, 'PMonthly', '2019-11-22 00:00:00', '30110', 'PLA006', 'Gass', 'number', 10000, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:43:10', 'adminTSP', '2019-11-22 10:43:10', NULL, NULL, 1, 1),
	(184, 'PMonthly', '2019-11-22 00:00:00', '30111', 'PLA006', 'Dissel', 'number', 5000, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:43:10', 'adminTSP', '2019-11-22 10:43:10', NULL, NULL, 1, 1),
	(185, 'PMonthly', '2019-11-22 00:00:00', '30112', 'PLA006', 'SuperGasoline', 'number', 5000, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:43:10', 'adminTSP', '2019-11-22 10:43:10', NULL, NULL, 1, 1),
	(186, 'PMonthly', '2019-11-22 00:00:00', '30113', 'PLA006', 'PremiemGasoline', 'number', 5000, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:43:10', 'adminTSP', '2019-11-22 10:43:10', NULL, NULL, 1, 1),
	(187, 'PMonthly', '2019-11-22 00:00:00', '30114', 'PLA006', 'Mart', 'number', 500000, 'USD', 'USD', 'TSP', 6, 301, 'TSP', NULL, NULL, '2019-11-22 10:43:10', 'adminTSP', '2019-11-22 10:43:10', NULL, NULL, 1, 1),
	(188, 'Monthly', '2019-11-30 00:00:00', '8003', 'PLA006', 'NumSaleStaff', 'number', 10, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(189, 'Monthly', '2019-11-30 00:00:00', '8005', 'PLA006', 'Family', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(190, 'Monthly', '2019-11-30 00:00:00', '8006', 'PLA006', 'BankingFinance', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(191, 'Monthly', '2019-11-30 00:00:00', '8007', 'PLA006', 'CorporateInvestment', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(192, 'Monthly', '2019-11-30 00:00:00', '8008', 'PLA006', 'Real Estate', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(193, 'Monthly', '2019-11-30 00:00:00', '8009', 'PLA006', 'Labour', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(194, 'Monthly', '2019-11-30 00:00:00', '80010', 'PLA006', 'DueDeligence', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(195, 'Monthly', '2019-11-30 00:00:00', '80011', 'PLA006', 'WillTestament', 'number', 1002, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(196, 'Monthly', '2019-11-30 00:00:00', '80012', 'PLA006', 'NotAuthentication', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(197, 'Monthly', '2019-11-30 00:00:00', '80013', 'PLA006', 'LegalText', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:31:50', 'ManagerNNNP', '2019-11-22 11:07:26', 'ManagerNNNP', '2019-11-22 13:31:50', 0, 1),
	(198, 'PWeekly', '2019-11-22 00:00:00', '8003', 'PLA001', 'NumSaleStaff', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(199, 'PWeekly', '2019-11-22 00:00:00', '8005', 'PLA001', 'Family', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(200, 'PWeekly', '2019-11-22 00:00:00', '8006', 'PLA001', 'BankingFinance', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(201, 'PWeekly', '2019-11-22 00:00:00', '8007', 'PLA001', 'CorporateInvestment', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(202, 'PWeekly', '2019-11-22 00:00:00', '8008', 'PLA001', 'Real Estate', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(203, 'PWeekly', '2019-11-22 00:00:00', '8009', 'PLA001', 'Labour', 'number', 10, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(204, 'PWeekly', '2019-11-22 00:00:00', '80010', 'PLA001', 'DueDeligence', 'number', 34, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(205, 'PWeekly', '2019-11-22 00:00:00', '80011', 'PLA001', 'WillTestament', 'number', 67, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(206, 'PWeekly', '2019-11-22 00:00:00', '80012', 'PLA001', 'NotAuthentication', 'number', 90, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(207, 'PWeekly', '2019-11-22 00:00:00', '80013', 'PLA001', 'LegalText', 'number', 123, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNPAdmin', '2019-11-22 11:37:22', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(208, 'PAB', '2019-11-22 00:00:00', '8003', 'PLA006', 'NumSaleStaff', 'number', 45, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(209, 'PAB', '2019-11-22 00:00:00', '8005', 'PLA006', 'Family', 'number', 60, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(210, 'PAB', '2019-11-22 00:00:00', '8006', 'PLA006', 'BankingFinance', 'number', 90, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(211, 'PAB', '2019-11-22 00:00:00', '8007', 'PLA006', 'CorporateInvestment', 'number', 80, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(212, 'PAB', '2019-11-22 00:00:00', '8008', 'PLA006', 'Real Estate', 'number', 68, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(213, 'PAB', '2019-11-22 00:00:00', '8009', 'PLA006', 'Labour', 'number', 45, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(214, 'PAB', '2019-11-22 00:00:00', '80010', 'PLA006', 'DueDeligence', 'number', 30, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(215, 'PAB', '2019-11-22 00:00:00', '80011', 'PLA006', 'WillTestament', 'number', 23, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(216, 'PAB', '2019-11-22 00:00:00', '80012', 'PLA006', 'NotAuthentication', 'number', 60, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(217, 'PAB', '2019-11-22 00:00:00', '80013', 'PLA006', 'LegalText', 'number', 67, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'ManagerNNNP', '2019-11-22 11:46:46', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(218, 'Monthly Plan', '2019-11-22 00:00:00', '8003', 'PLA007', 'NumSaleStaff', 'number', 10, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(219, 'Monthly Plan', '2019-11-22 00:00:00', '8005', 'PLA007', 'Family', 'number', 20, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(220, 'Monthly Plan', '2019-11-22 00:00:00', '8006', 'PLA007', 'BankingFinance', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(221, 'Monthly Plan', '2019-11-22 00:00:00', '8007', 'PLA007', 'CorporateInvestment', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(222, 'Monthly Plan', '2019-11-22 00:00:00', '8008', 'PLA007', 'Real Estate', 'number', 100, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(223, 'Monthly Plan', '2019-11-22 00:00:00', '8009', 'PLA007', 'Labour', 'number', 23, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(224, 'Monthly Plan', '2019-11-22 00:00:00', '80010', 'PLA007', 'DueDeligence', 'number', 20, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(225, 'Monthly Plan', '2019-11-22 00:00:00', '80011', 'PLA007', 'WillTestament', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(226, 'Monthly Plan', '2019-11-22 00:00:00', '80012', 'PLA007', 'NotAuthentication', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1),
	(227, 'Monthly Plan', '2019-11-22 00:00:00', '80013', 'PLA007', 'LegalText', 'number', 200, 'USD', '0', 'Nitei Niron Natary Public', 9, 800, 'NNNP', NULL, NULL, '2019-11-22 13:36:09', 'NNNP_Admin', '2019-11-22 13:29:51', 'ManagerNNNP', '2019-11-22 13:36:09', 0, 1);
/*!40000 ALTER TABLE `stsk_plan` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_api
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

-- Dumping data for table stsk_group.sys_lookup_code: ~44 rows (approximately)
DELETE FROM `sys_lookup_code`;
/*!40000 ALTER TABLE `sys_lookup_code` DISABLE KEYS */;
INSERT INTO `sys_lookup_code` (`look_id`, `look_code`, `short_name`, `full_name_en`, `full_name_kh`, `caption`, `display_code`, `look_group`, `look_value`, `code_order`, `lookup_type`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `company_id`, `brcode`, `brname`, `flag`) VALUES
	('TTM001', 'TrnMode', 'USD', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '2019-11-06 08:50:28', 4, 0, '', 1),
	('TTM003', 'TrnMode', 'Lit', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '2019-11-06 08:50:28', 6, 0, '', 1),
	('TTM002', 'TrnMode', 'KHR', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 07:52:58', '', '2019-11-06 07:52:59', 1, 0, '', 1),
	('TTM001', 'TrnMode', 'USD', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:03:11', '', '2019-11-06 08:03:12', 6, 0, '', 1),
	('TTM001', 'TrnMode', 'USD', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:03:48', '', '2019-11-06 08:03:49', 9, 0, '', 1),
	('TTM002', 'TrnMode', 'KHR', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:48:58', '', '2019-11-06 08:48:58', 2, 0, '', 1),
	('TTM002', 'TrnMode', 'KHR', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:49:51', '', '2019-11-06 08:49:53', 3, 0, '', 1),
	('TTM002', 'TrnMode', 'USD', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '2019-11-06 08:50:28', 7, 0, '', 1),
	('TTM001', 'TrnMode', 'USD', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:52:48', '', '2019-11-06 08:52:49', 5, 0, '', 1),
	('TTM003', 'TrnMode', 'Lit', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:53:10', '', '2019-11-06 08:53:11', 5, 0, '', 1),
	('PLA001', 'PLAMode', 'Daily', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:58:11', '', '2019-11-19 09:58:11', 4, 0, '', 1),
	('PLA002', 'PLAMode', 'Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:58:47', '', '2019-11-19 09:58:48', 4, 0, '', 1),
	('PLA003', 'PLAMode', '2 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:15', 4, 0, '', 0),
	('PLA004', 'PLAMode', '3 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:42', '', '2019-11-19 09:59:42', 4, 0, '', 0),
	('PLA005', 'PLAMode', '4 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:00:11', '', '2019-11-19 10:00:12', 4, 0, '', 0),
	('PLA006', 'PLAMode', 'Monthly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:00:32', '', '2019-11-19 10:00:33', 4, 0, '', 1),
	('PLA007', 'PLAMode', 'Yearly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:17:45', '', '2019-11-19 10:17:46', 4, 0, '', 1),
	('PLA001', 'PLAMode', 'Daily', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-20 17:15:00', '', '2019-11-20 17:15:00', 7, 0, '', 1),
	('PLA002', 'PLAMode', 'Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 7, 0, '', 0),
	('PLA003', 'PLAMode', '2 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 7, 0, '', 0),
	('PLA004', 'PLAMode', '3 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:42', '', '2019-11-19 09:59:42', 7, 0, '', 0),
	('PLA005', 'PLAMode', '4 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:00:32', '', '0000-00-00 00:00:00', 9, 0, '', 0),
	('PLA006', 'PLAMode', 'Monthly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-21 07:25:12', '', '2019-11-21 07:25:13', 7, 0, '', 1),
	('PLA007', 'PLAMode', 'Yearly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-21 07:25:35', '', '2019-11-21 07:25:36', 7, 0, '', 1),
	('PLA001', 'PLAMode', 'Daily', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 5, 0, '', 1),
	('PLA002', 'PLAMode', 'Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 5, 0, '', 0),
	('PLA003', 'PLAMode', '2 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 5, 0, '', 0),
	('PLA004', 'PLAMode', '3 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 5, 0, '', 0),
	('PLA005', 'PLAMode', '4 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:00:32', '', '0000-00-00 00:00:00', 5, 0, '', 0),
	('PLA006', 'PLAMode', 'Monthly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '0000-00-00 00:00:00', 5, 0, '', 1),
	('PLA007', 'PLAMode', 'Yearly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '2019-11-06 08:50:27', 5, 0, '', 1),
	('PLA001', 'PLAMode', 'Daily', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-22 08:12:08', '', '2019-11-22 08:12:09', 6, 0, '', 1),
	('PLA002', 'PLAMode', 'Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 6, 0, '', 0),
	('PLA003', 'PLAMode', '2 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 6, 0, '', 0),
	('PLA004', 'PLAMode', '3 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 6, 0, '', 0),
	('PLA005', 'PLAMode', '4 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:00:32', '', '0000-00-00 00:00:00', 6, 0, '', 0),
	('PLA006', 'PLAMode', 'Monthly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '0000-00-00 00:00:00', 6, 0, '', 1),
	('PLA007', 'PLAMode', 'Yearly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '2019-11-06 08:50:27', 6, 0, '', 1),
	('PLA001', 'PLAMode', 'Daily', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-22 11:03:48', '', '2019-11-22 11:03:49', 9, 0, '', 1),
	('PLA002', 'PLAMode', 'Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 9, 0, '', 0),
	('PLA003', 'PLAMode', '2 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 9, 0, '', 0),
	('PLA004', 'PLAMode', '3 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 09:59:14', '', '2019-11-19 09:59:14', 9, 0, '', 0),
	('PLA005', 'PLAMode', '4 Weekly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:00:32', '', '0000-00-00 00:00:00', 0, 0, '', 0),
	('PLA006', 'PLAMode', 'Monthly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-19 10:00:32', '', '2019-11-19 10:00:32', 9, 0, '', 1),
	('PLA007', 'PLAMode', 'Yearly', '', '', '', '', '', 0.000, 0, '1', '', '2019-11-06 08:50:27', '', '2019-11-06 08:50:27', 9, 0, '', 1);
/*!40000 ALTER TABLE `sys_lookup_code` ENABLE KEYS */;

-- Dumping structure for table stsk_group.sys_permissions
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
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SystemName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FirstName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName_Kh` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName_Kh` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOE` date DEFAULT NULL,
  `PositionID` int(11) DEFAULT NULL,
  `IdentifyType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdentifyNumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdentifyExpireDate` datetime DEFAULT NULL,
  `Allowance` int(11) DEFAULT NULL,
  `LastLogin` date DEFAULT NULL,
  `forgotten_password_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgotten_password_time` datetime DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `activation_code` int(11) DEFAULT NULL,
  `passwordHash` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BrOption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BrZone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReportCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Router` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HashKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IPAddress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CompanyCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brcode` int(11) DEFAULT NULL,
  `brname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table stsk_group.users: ~22 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `SystemName`, `name`, `email`, `FirstName`, `LastName`, `FirstName_Kh`, `LastName_Kh`, `DOE`, `PositionID`, `IdentifyType`, `IdentifyNumber`, `IdentifyExpireDate`, `Allowance`, `LastLogin`, `forgotten_password_code`, `forgotten_password_time`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `activation_code`, `passwordHash`, `note`, `email_verified_at`, `password`, `emp_group`, `last_ip_address`, `BrOption`, `BrZone`, `ReportCode`, `Router`, `emp_code`, `UserKey`, `HashKey`, `IPAddress`, `remember_token`, `CompanyCode`, `brcode`, `brname`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Admin', 'tuyravey99@gmail.com', '', '', '', '', '0000-00-00', 0, '', '', '0000-00-00 00:00:00', 0, '0000-00-00', '', '0000-00-00 00:00:00', '', '', '', 0, 0, 0, '', '', NULL, '$2y$10$PBP.2i0noN7XNHagFIUeRuCglWzNZ.d0UbBTSay3g4SZMG2Gk527K', '', '', '', '', '', '', '', '558', '', '', '', '500,300,301,200,600,700,800,400,100', 500, 'HO', '2019-09-25 15:57:20', '2019-09-25 15:57:20'),
	(29, NULL, 'AdminST', 'AdminST@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$2XQBgq7DDlm6ZdVcWXQRQ.KQl2qsoYpy6C7DkPXu5B8IobDlbw2Ly', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '200', 200, 'ST', '2019-11-17 00:00:28', '2019-11-17 00:00:28'),
	(30, NULL, 'TellerST', 'TellerST@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$MXIUqh5wtDnrIK.6lbMCIu5BmQybKmoGXECjqIMRTClf4/TGXTP8q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '200', 200, 'ST', '2019-11-17 00:01:13', '2019-11-17 00:01:13'),
	(31, NULL, 'ManagerST', 'ManagerST@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IBzxlQa4fj6RfaX2tovBo.KfpR2b08lGGY0DmWu149lHBpTtnBsty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '200', 200, 'ST', '2019-11-17 00:01:40', '2019-11-17 00:01:40'),
	(32, NULL, 'AdminOrienda', 'AdminOrienda@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$4ww7GrXn2AYnAhPcshH1WuLSI9kLTnUIlKLhGrrvQKt9Ke69toSbm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '600', 600, 'ST', '2019-11-20 17:07:11', '2019-11-20 17:07:11'),
	(33, NULL, 'TellerOrienda', 'TellerOrienda@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$/NC.OMWRzNE0ZsUzpPcSWekN6xoLrJ5wNKzjuS6Dd4GWidmhdMJ0m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '600', 600, 'ST', '2019-11-20 17:07:46', '2019-11-20 17:07:46'),
	(34, NULL, 'ManagerOrienda', 'ManagerOrienda@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$K8ohy1hZCpTiaM8Wcf2bfe58vDZYJh5uRdLyAudvMkUOnb9pckrN6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '600', 600, 'ST', '2019-11-20 17:08:14', '2019-11-20 17:08:14'),
	(35, NULL, 'adminMHT', 'adminMHT@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$6gLv9n9vWweTCR7CHrwg7uz0qf1BPzVQljVQGrNe9an4fRxIP0i8q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '300', 300, 'MHT', '2019-11-21 14:50:13', '2019-11-21 14:50:13'),
	(36, NULL, 'TellerMHT', 'TellerMHT@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$hCfzQXgJGg2HbBK/pO5a.ekCs6b71tSrrZenFs6HAHmXYtxpiBpZC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '300', 300, 'MHT', '2019-11-22 04:47:15', '2019-11-22 04:47:15'),
	(37, NULL, 'ManagerMHT', 'ManagerMHT@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$BlFgC8pPnrmzpWyTE3s1oOzOJjr2fczu0cN60JLAeb7eNUR8HctJO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '300', 300, 'MHT', '2019-11-22 04:47:58', '2019-11-22 04:47:58'),
	(38, NULL, 'adminTSP', 'adminTSP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Btg0qW0cf0WaiEflZS3e5esLEAWFSETGT707XW.R9z0fVotZIwC3O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '301', 301, 'TSP', '2019-11-22 05:02:30', '2019-11-22 05:02:30'),
	(39, NULL, 'TellerTSP', 'TellerTSP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$NcofHvGYdtryjL0TAXz.jun3Szv8MumsqjOrH9dOSPTrXcEwQ5ANC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '301', 301, 'TSP', '2019-11-22 05:03:07', '2019-11-22 05:03:07'),
	(40, NULL, 'ManagerTSP', 'ManagerTSP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$mikUU0laUe7VaLUFoBfWSO9weBzRQjEy6CLqTCe5KxYYPkKdw.zhW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '301', 301, 'TSP', '2019-11-22 05:03:44', '2019-11-22 05:03:44'),
	(41, NULL, 'NNNP_Admin', 'AdminNNNP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$lBpqYRGz.6xscCbJbLul.OLifYUPlfoO9hj5b9ynJsjSipxtI01L.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '800', 800, 'NNNP', '2019-11-22 10:41:45', '2019-11-22 13:28:08'),
	(42, NULL, 'TellerNNNP', 'TellerNNNP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$JzjR4fW5eFP9dR8uIgWdF.17YSSKiKoFa0PsWWkDSWiu8m2QTQ1uq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '800', 800, 'NNNP', '2019-11-22 10:51:37', '2019-11-22 10:51:37'),
	(43, NULL, 'ManagerNNNP', 'ManagerNNNP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$GlqYk13GrXvSl8/W6G3HGOeo/rDbnEFug7dtOpna3S9LUFg4uDRDe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '800', 800, 'NNNP', '2019-11-22 10:53:09', '2019-11-22 10:53:09'),
	(47, NULL, 'AdminMMI', 'AdminMMI@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$hHz677/IFEx0XKkmYW5cY.S6kxaIilY/XREUQFhitgR8CjKwS1.si', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '700', 700, 'MMI', '2019-11-22 13:58:55', '2019-11-22 13:58:55'),
	(48, NULL, 'TellerMMI', 'TellerMMI@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$CP7ZeKH72yIs2tE5q39fFejJ/6bardO4V1Uh7TUovgcsKxBDHBK7e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '700', 700, 'MMI', '2019-11-22 14:11:59', '2019-11-22 14:11:59'),
	(49, NULL, 'ManagerMMI', 'ManagerMMI@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$tykMtFYjjQ.x3LtpteWweuuV6pcLw8XQhH25GWBSiAeOs77E0lily', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '700', 700, 'MMI', '2019-11-22 14:12:20', '2019-11-22 14:12:20'),
	(50, NULL, 'AdminSKP', 'AdminSKP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$BSagjy7bfWDs.Nh6.emdM.iEB4Uf1WA.Zhw41cHHqYEltlB1iPema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '500', 500, 'SKP', '2019-11-22 15:56:56', '2019-11-22 15:56:56'),
	(51, NULL, 'ManagerSKP', 'ManagerSKP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IpsoXaISggZwp/AfGcWK5OI9WNdRAxhIkrmXGtP/2tpsvB5RFQbsW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '500', 500, 'SKP', '2019-11-22 15:57:34', '2019-11-22 15:57:34'),
	(52, NULL, 'TellerSKP', 'TellerSKP@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$b6OPEjRYUIDi6XlOdietOOpphezQ6KfRiWY8cEyk1ohF2GwdswbDm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '500', 500, 'SKP', '2019-11-22 15:57:58', '2019-11-22 15:57:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table stsk_group.warehouse
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

-- Dumping structure for procedure stsk_group.get_by_company
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_by_company`(
	IN `SetCompanyId` INT


)
BEGIN
	if SetCompanyId=0 then
		select distinct CompanyId as CompanyId,PlanMode,PlanName,PlanDate,CompanyName,created_by as PostedBy,case when authorized_by is null then 'non authorized' else authorized_by end as AuthorizedBy,flag,status from stsk_plan where flag=1;
	else
		select distinct CompanyId as CompanyId,PlanMode,PlanName,PlanDate,CompanyName,created_by as PostedBy,case when authorized_by is null then 'non authorized' else authorized_by end as AuthorizedBy,flag,status from stsk_plan
		where CompanyId = SetCompanyId and flag=1;
	end if;
	END//
DELIMITER ;

-- Dumping structure for procedure stsk_group.get_data_filter_reports
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_filter_reports`(
	IN `setCompanyCode` int



,
	IN `setReportDate` DATETIME








)
BEGIN
		
		SELECT 
  		b.title AS title ,
		b.fields_type AS fields_type,
		b.CompanyCode as CompanyCode,
		CASE WHEN sp.`Values` IS NULL THEN 0
				ELSE sp.`Values`
		END AS plan_values,
		CASE WHEN yp.`Values` IS NULL THEN 0
				ELSE 	yp.`Values`
		END AS plan_yearly_values,
		CASE WHEN fn_report_result_in_day(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d')) IS NULL THEN 0
				ELSE fn_report_result_in_day(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d'))
		END AS result_value,
		CASE WHEN fn_report_result_in_month(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d')) IS NULL THEN 0
				ELSE fn_report_result_in_month(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d'))
		END AS result_month,
		CASE WHEN fn_report_result_in_year(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d')) IS NULL THEN 0
				ELSE fn_report_result_in_year(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d'))
		END AS result_in_year,
			CASE WHEN fn_report_result_pre_month(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d')) IS NULL THEN 0
				ELSE fn_report_result_pre_month(b.PrCode,c.Company_id,DATE_FORMAT(setReportDate,'%Y%m%d'))
		END AS result_previous_month
	  	FROM company AS c	  	
		LEFT JOIN stsk_fields_summary b ON b.CompanyCode = c.CompanyCode
		LEFT JOIN stsk_plan sp ON sp.PlanCode=b.fields_code and sp.PlanDate=(select max(PlanDate) from stsk_plan where status=0 and flag=1 and PlanMode!='PLA007' and CompanyId=sp.CompanyId)
		left JOIN stsk_plan yp on yp.PlanCode=b.fields_code and yp.PlanDate=(select max(PlanDate) from stsk_plan where status=0 and flag=1 and PlanMode='PLA007' and CompanyId=c.Company_id)
		WHERE c.CompanyCode=setCompanyCode
		ORDER BY CAST(b.fields_code AS INT) ASC;
	END//
DELIMITER ;

-- Dumping structure for procedure stsk_group.mmi_data_fitter_reports
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `mmi_data_fitter_reports`(in Username varchar(50),in setPassword varchar(50),in statement text)
BEGIN
	IF Username='tuyravy168@gmail.com' AND setPassword='skp@#$007' THEN
		      SET @sql = CONCAT(statement);
		      PREPARE stmt FROM @sql;
		      EXECUTE stmt;
	  END if;
		
	END//
DELIMITER ;

-- Dumping structure for function stsk_group.fn_report_result_in_day
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_report_result_in_day`(
	`SetPrCode` VARCHAR(50),
	`setCompanyId` INT,
	`setReportDate` DATETIME

) RETURNS decimal(10,0)
BEGIN

	DECLARE result_value decimal;
	set result_value=(select sum(trnamt) from stsk_detail where PrCode = SetPrCode and CompanyId=setCompanyId and TrnDate=DATE_FORMAT(setReportDate,'%Y%m%d'));
	return result_value;
		
    END//
DELIMITER ;

-- Dumping structure for function stsk_group.fn_report_result_in_month
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_report_result_in_month`(
	`setPrCode` VARCHAR(50),
	`setCompanyId` INT,
	`setReportDate` DATETIME


) RETURNS decimal(10,0)
BEGIN
	
	DECLARE result_value decimal;
	DECLARE FirstReportDate datetime;
	set FirstReportDate=(DATE_SUB(LAST_DAY(setReportDate),INTERVAL DAY(LAST_DAY(setReportDate))-1 DAY));
	set result_value=(select sum(trnamt) from stsk_detail where PrCode = setPrCode and CompanyId=setCompanyId and trndate between DATE_FORMAT(FirstReportDate,'%Y%m%d') and DATE_FORMAT(LAST_DAY(setReportDate),'%Y%m%d'));
		return result_value;
    END//
DELIMITER ;

-- Dumping structure for function stsk_group.fn_report_result_in_year
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_report_result_in_year`(
	`setPrCode` VARCHAR(50)
,
	`setCompanyId` INT
,
	`setReportDate` DATETIME
) RETURNS decimal(10,3)
BEGIN
	
	DECLARE result_value decimal;
	DECLARE FirstReportDate datetime;
	set FirstReportDate=(Year(setReportDate)-01-01);
	set result_value=(select sum(trnamt) from stsk_detail where PrCode = setPrCode and CompanyId=setCompanyId and trndate between DATE_FORMAT(FirstReportDate,'%Y%m%d') and DATE_FORMAT(LAST_DAY(setReportDate),'%Y%m%d'));
		return result_value;
END//
DELIMITER ;

-- Dumping structure for function stsk_group.fn_report_result_pre_month
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_report_result_pre_month`(
	`setPrCode` VARCHAR(50),
	`setCompanyId` INT,
	`setReportDate` DATETIME



) RETURNS decimal(10,0)
BEGIN
	declare result_value decimal;
	DECLARE FirstReportDate datetime;
	set FirstReportDate=(DATE_SUB(LAST_DAY(setReportDate),INTERVAL DAY(LAST_DAY(setReportDate))-1 DAY));
	set result_value=(select sum(trnamt) from stsk_detail where PrCode = setPrCode and CompanyId=setCompanyId
			and TrnDate BETWEEN DATE_FORMAT(LAST_DAY(setReportDate - INTERVAL 1 MONTH),'%Y-%m-%01') and DATE_FORMAT(LAST_DAY(setReportDate - INTERVAL 1 MONTH),'%Y-%m-%d'));
		
	 return result_value;
    END//
DELIMITER ;

-- Dumping structure for trigger stsk_group.before_company_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `before_company_update` BEFORE UPDATE ON `company` FOR EACH ROW INSERT INTO compnay_audit
 SET action = 'update',
     Company_id = OLD.Company_id,
     company_name_en = OLD.company_name_en,
     changedat = NOW()//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger stsk_group.before_compnay_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `before_compnay_delete` BEFORE DELETE ON `company` FOR EACH ROW BEGIN
	
	CALL cannot_delete_error; -- raise an error to prevent deleting from the table

    END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
