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

-- Dumping structure for table rsk_group.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `cus_id` varchar(50) DEFAULT NULL COMMENT 'store company_id_brcode_and_auto',
  `cus_code` varchar(50) DEFAULT NULL,
  `first_name_eng` varchar(50) DEFAULT NULL,
  `family_name_eng` varchar(50) DEFAULT NULL,
  `first_name_kh` varchar(50) DEFAULT NULL,
  `family_name_kh` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `marital_status` varchar(10) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `identify_type_1` varchar(50) DEFAULT NULL,
  `identity_number_1` varchar(50) DEFAULT NULL,
  `identify_expire_date_1` datetime DEFAULT NULL,
  `identify_type_2` varchar(50) DEFAULT NULL,
  `identity_number_2` varchar(50) DEFAULT NULL,
  `identify_expire_date_2` datetime DEFAULT NULL,
  `identify_type_3` varchar(50) DEFAULT NULL,
  `identity_number_3` varchar(50) DEFAULT NULL,
  `identify_expire_date_3` datetime DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `group_no` varchar(50) DEFAULT NULL,
  `street_no` varchar(50) DEFAULT NULL,
  `locationcode` varchar(8) DEFAULT NULL,
  `address_detail` text,
  `gis_code` varchar(50) DEFAULT NULL,
  `social_type` varchar(50) DEFAULT NULL,
  `social_contact` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` text,
  `company_name` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `credit_limit` decimal(10,0) DEFAULT NULL,
  `days_limit` int(11) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT '0',
  `ccy` varchar(50) DEFAULT NULL,
  `bank_account` varchar(500) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `cus_level` int(11) DEFAULT '0',
  `cus_risk_level` varchar(50) DEFAULT NULL,
  `work_phone` varchar(50) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_vat_no` varchar(50) DEFAULT NULL,
  `company_contact_detail` text,
  `cus_anniversary_date` datetime DEFAULT NULL,
  `cus_attach_file1` text,
  `cus_other_note` text,
  `joint_date` datetime DEFAULT NULL,
  `length_service` int(11) DEFAULT '0',
  `monthly_income` decimal(10,0) DEFAULT '0',
  `profit` decimal(10,0) DEFAULT '0',
  `economic_sector` varchar(50) DEFAULT NULL,
  `deposit_balance` decimal(10,0) DEFAULT '0',
  `cus_text1` varchar(50) DEFAULT NULL,
  `cus_text2` varchar(50) DEFAULT NULL,
  `cus_text3` varchar(50) DEFAULT NULL,
  `cus_dropdown1` varchar(50) DEFAULT NULL,
  `cus_dropdown2` varchar(50) DEFAULT NULL,
  `cus_dropdown3` varchar(50) DEFAULT NULL,
  `cus_date1` datetime DEFAULT NULL,
  `cus_date2` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `brcode` int(11) DEFAULT NULL,
  `staff_care_id` varchar(50) DEFAULT NULL,
  `cus_joint_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rsk_group.customer: ~2 rows (approximately)
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`cus_id`, `cus_code`, `first_name_eng`, `family_name_eng`, `first_name_kh`, `family_name_kh`, `gender`, `marital_status`, `position`, `birth_date`, `identify_type_1`, `identity_number_1`, `identify_expire_date_1`, `identify_type_2`, `identity_number_2`, `identify_expire_date_2`, `identify_type_3`, `identity_number_3`, `identify_expire_date_3`, `house_no`, `group_no`, `street_no`, `locationcode`, `address_detail`, `gis_code`, `social_type`, `social_contact`, `email`, `phone`, `company_name`, `photo`, `credit_limit`, `days_limit`, `balance`, `ccy`, `bank_account`, `score`, `cus_level`, `cus_risk_level`, `work_phone`, `company_email`, `company_vat_no`, `company_contact_detail`, `cus_anniversary_date`, `cus_attach_file1`, `cus_other_note`, `joint_date`, `length_service`, `monthly_income`, `profit`, `economic_sector`, `deposit_balance`, `cus_text1`, `cus_text2`, `cus_text3`, `cus_dropdown1`, `cus_dropdown2`, `cus_dropdown3`, `cus_date1`, `cus_date2`, `company_id`, `brcode`, `staff_care_id`, `cus_joint_date`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	('1', 'C0001', 'Tuy', 'Ravy', 'ទុយ ', 'រ៉ាវី', 'ប្រុស', 'M', 'IT', '2019-06-08 15:52:33', NULL, NULL, '2019-06-08 15:52:35', NULL, NULL, '2019-06-08 15:52:36', NULL, NULL, '2019-06-08 15:52:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2019-06-08 15:52:40', NULL, NULL, '2019-06-08 15:52:40', 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-08 15:52:40', '2019-06-08 15:52:40', 1, 100, NULL, '2019-06-08 15:52:41', NULL, '2019-06-08 15:52:41', NULL, '2019-06-08 15:52:41', 1),
	('2', 'C0002', 'dd', 'd', '3', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100, NULL, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
