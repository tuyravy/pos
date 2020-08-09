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

-- Dumping structure for table rsk_group.repayment
CREATE TABLE IF NOT EXISTS `repayment` (
  `repayment_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `paid_amount` decimal(18,3) NOT NULL,
  `balance_amount` decimal(18,3) NOT NULL,
  `company_id` int(11) NOT NULL,
  `brcode` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`repayment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table rsk_group.repayment: ~0 rows (approximately)
DELETE FROM `repayment`;
/*!40000 ALTER TABLE `repayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `repayment` ENABLE KEYS */;

-- Dumping structure for table rsk_group.repayment_detail
CREATE TABLE IF NOT EXISTS `repayment_detail` (
  `repayment_id` int(11) NOT NULL,
  `repayment_date` datetime DEFAULT NULL,
  `repayment_amt` decimal(18,3) NOT NULL,
  `Invoce_due_amount` decimal(18,3) DEFAULT NULL,
  `ccy` varchar(50) NOT NULL,
  `collected_by` varchar(50) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `or_reff` varchar(50) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `repayment_note` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `brcode` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rsk_group.repayment_detail: ~3 rows (approximately)
DELETE FROM `repayment_detail`;
/*!40000 ALTER TABLE `repayment_detail` DISABLE KEYS */;
INSERT INTO `repayment_detail` (`repayment_id`, `repayment_date`, `repayment_amt`, `Invoce_due_amount`, `ccy`, `collected_by`, `cus_id`, `or_reff`, `invoice_no`, `repayment_note`, `company_id`, `brcode`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	(1, '1970-01-01 00:00:00', 100.000, 230.000, '1', '2', 1, '100', '1|100-1908-000001', 'test', 1, '100', 'ទុយ​ រ៉ាវី', '2019-08-26 00:16:52', NULL, NULL, 1),
	(3, '2019-09-07 00:00:00', 70.000, 160.000, '1', '2', 1, '100', '1|100-1908-000001', 'test', 1, '100', 'ទុយ​ រ៉ាវី', '2019-08-26 00:26:07', NULL, NULL, 1),
	(4, '1970-01-01 00:00:00', 160.000, 0.000, '1', '2', 1, '100d', '1|100-1908-000001', 'test', 1, '100', 'ទុយ​ រ៉ាវី', '2019-08-26 00:26:43', NULL, NULL, 1);
/*!40000 ALTER TABLE `repayment_detail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
