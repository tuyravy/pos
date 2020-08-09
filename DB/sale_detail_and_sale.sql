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

-- Dumping structure for table rsk_group.sale
DROP TABLE IF EXISTS `sale`;
CREATE TABLE IF NOT EXISTS `sale` (
  `sale_id` int(11) NOT NULL COMMENT 'brcode+companyid+id auto',
  `invoice_no` varchar(50) NOT NULL,
  `sale_date` datetime NOT NULL,
  `cus_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `saleman_id` int(11) NOT NULL COMMENT 'employee_id',
  `total_amount` decimal(10,0) NOT NULL,
  `total_discount` decimal(10,0) NOT NULL,
  `total_due_amount` decimal(18,3) NOT NULL,
  `vat_amount` decimal(10,0) NOT NULL,
  `sale_due_date` datetime NOT NULL,
  `total_paid_amount` decimal(10,0) NOT NULL,
  `discount_rate` decimal(10,0) NOT NULL,
  `ccy` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `delivery_note` varchar(50) NOT NULL,
  `delivery_reff_no` varchar(50) NOT NULL,
  `delivery_address` varchar(50) NOT NULL,
  `delivery_cost` decimal(10,0) NOT NULL,
  `company_id` int(11) NOT NULL,
  `brcode` varchar(50) NOT NULL,
  `sale_status` varchar(50) DEFAULT NULL COMMENT 'store as code link with system define code.,eg : completed / pending / reject',
  `payment_status` varchar(50) DEFAULT NULL COMMENT 'store as code link with system define code.;eg : fully paid / due',
  `repayment_status` varchar(50) DEFAULT NULL COMMENT 'store as code link with system define code.;update information status after cutomer pay back in each invoice.',
  `payment_terms` varchar(50) NOT NULL COMMENT 'store as code link with system define code.;Eg : -paid after delivery, paid immidiately',
  `sale_attach_1` text COMMENT 'store as link to attach file name',
  `sale_attach_2` text COMMENT 'store as link to attach file name',
  `sale_attach_3` text COMMENT 'store as link to attach file name',
  `pc_name_auth` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rsk_group.sale: ~3 rows (approximately)
DELETE FROM `sale`;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` (`sale_id`, `invoice_no`, `sale_date`, `cus_id`, `project_id`, `saleman_id`, `total_amount`, `total_discount`, `total_due_amount`, `vat_amount`, `sale_due_date`, `total_paid_amount`, `discount_rate`, `ccy`, `warehouse_id`, `delivery_id`, `delivery_note`, `delivery_reff_no`, `delivery_address`, `delivery_cost`, `company_id`, `brcode`, `sale_status`, `payment_status`, `repayment_status`, `payment_terms`, `sale_attach_1`, `sale_attach_2`, `sale_attach_3`, `pc_name_auth`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	(10011, '1|100-1908-000001', '2019-08-26 00:00:00', 1, 1, 0, 330, 0, 330.000, 30, '2019-08-31 00:00:00', 0, 0, 1, 10011, 1, 'test', '0', 'ts', 100, 1, '100', '', '', NULL, 'SRPM004', NULL, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-26 00:12:35', NULL, '2019-08-26 00:12:35', 1),
	(10012, '1|100-1908-000002', '2019-08-28 00:00:00', 1, 1, 0, 330, 0, 330.000, 30, '2019-09-02 00:00:00', 0, 0, 1, 10011, 1, 'test', '0', 'tet', 100, 1, '100', '', '', NULL, 'SRPM004', NULL, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-28 13:39:11', NULL, '2019-08-28 13:39:11', 1),
	(10013, '1|100-1908-000003', '2019-08-31 00:00:00', 1, 1, 0, 1440, 0, 1440.000, 40, '2019-09-05 00:00:00', 0, 0, 1, 10011, 1, 'tet', '0', 'tet', 100, 1, '100', '', '', NULL, 'SRPM004', NULL, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-09-21 13:38:14', NULL, '2019-09-21 13:38:14', 1);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;

-- Dumping structure for table rsk_group.sale_detail
DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE IF NOT EXISTS `sale_detail` (
  `sale_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `prodcut_code` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_cost` decimal(10,0) NOT NULL,
  `unit_price` decimal(10,0) NOT NULL,
  `Pro_loss_unit_price` decimal(10,0) NOT NULL,
  `discount_percentage` decimal(10,0) NOT NULL,
  `discount_amt` decimal(10,0) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `paid_amount` decimal(10,0) NOT NULL,
  `ccy` varchar(50) NOT NULL,
  `sale_date` datetime NOT NULL,
  `sale_due_date` datetime NOT NULL,
  `cus_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `saleman_id` int(11) NOT NULL,
  `product_expire_date` datetime DEFAULT NULL,
  `withholding_tax_on_non_resident` decimal(10,0) DEFAULT NULL,
  `withholding_tax_on_resident` decimal(10,0) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorized_by` varchar(50) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sale_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table rsk_group.sale_detail: ~8 rows (approximately)
DELETE FROM `sale_detail`;
/*!40000 ALTER TABLE `sale_detail` DISABLE KEYS */;
INSERT INTO `sale_detail` (`sale_detail_id`, `sale_id`, `product_id`, `prodcut_code`, `qty`, `unit_id`, `unit_cost`, `unit_price`, `Pro_loss_unit_price`, `discount_percentage`, `discount_amt`, `promotion_id`, `paid_amount`, `ccy`, `sale_date`, `sale_due_date`, `cus_id`, `project_id`, `saleman_id`, `product_expire_date`, `withholding_tax_on_non_resident`, `withholding_tax_on_resident`, `created_by`, `created_date`, `authorized_by`, `authorized_date`, `flag`) VALUES
	(1, 10011, 1, 'SKP0001', 1, 1, 100, 100, 100, 0, 0, 1, 0, '1', '2019-08-26 00:00:00', '2019-08-31 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-26 00:12:35', NULL, '2019-08-26 00:12:35', 1),
	(2, 10011, 2, 'SKP0002', 1, 1, 200, 200, 200, 0, 0, 1, 0, '1', '2019-08-26 00:00:00', '2019-08-31 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-26 00:12:35', NULL, '2019-08-26 00:12:35', 1),
	(3, 10012, 1, 'SKP0001', 1, 1, 100, 100, 100, 0, 0, 1, 0, '1', '2019-08-28 00:00:00', '2019-09-02 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-28 13:39:11', NULL, '2019-08-28 13:39:11', 1),
	(4, 10012, 2, 'SKP0002', 1, 1, 200, 200, 200, 0, 0, 1, 0, '1', '2019-08-28 00:00:00', '2019-09-02 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-08-28 13:39:11', NULL, '2019-08-28 13:39:11', 1),
	(5, 10013, 1, 'SKP0001', 2, 1, 100, 100, 100, 0, 0, 1, 0, '1', '2019-08-31 00:00:00', '2019-09-05 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-09-21 13:38:14', NULL, '2019-09-21 13:38:14', 1),
	(6, 10013, 2, 'SKP0002', 1, 1, 200, 200, 200, 0, 0, 1, 0, '1', '2019-08-31 00:00:00', '2019-09-05 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-09-21 13:38:14', NULL, '2019-09-21 13:38:14', 1),
	(7, 10013, 3, 'SKP0003', 1, 1, 500, 500, 500, 0, 0, 1, 0, '1', '2019-08-31 00:00:00', '2019-09-05 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-09-21 13:38:14', NULL, '2019-09-21 13:38:14', 1),
	(8, 10013, 4, 'SKP0004', 1, 1, 500, 500, 500, 0, 0, 1, 0, '1', '2019-08-31 00:00:00', '2019-09-05 00:00:00', 1, 1, 0, NULL, NULL, NULL, 'ទុយ​ រ៉ាវី', '2019-09-21 13:38:14', NULL, '2019-09-21 13:38:14', 1);
/*!40000 ALTER TABLE `sale_detail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
