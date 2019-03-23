-- --------------------------------------------------------
-- Hostitel:                     127.0.0.1
-- Verze serveru:                10.3.13-MariaDB - mariadb.org binary distribution
-- OS serveru:                   Win64
-- HeidiSQL Verze:               9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportování struktury databáze pro
DROP DATABASE IF EXISTS `api1`;
CREATE DATABASE IF NOT EXISTS `api1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `api1`;

-- Exportování struktury pro tabulka api1.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku api1.items: ~10 rows (přibližně)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
REPLACE INTO `items` (`item_id`, `name`, `price`, `size`) VALUES
	(1, 'PC', 16000, 10),
	(2, 'PC', 22000, 12),
	(3, 'TV', 15000, 42),
	(4, 'Phone', 9900, 0),
	(5, 'Monitor', 3500, 4),
	(6, 'Keyboard', 620, 0),
	(7, 'Mouse', 749, 0),
	(8, 'Headset', 2500, 0),
	(9, 'Chair', 4199, 72),
	(10, 'PC Table', 8000, 120);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Exportování struktury pro tabulka api1.supplies
DROP TABLE IF EXISTS `supplies`;
CREATE TABLE IF NOT EXISTS `supplies` (
  `item_id` bigint(20) NOT NULL DEFAULT 0,
  `warehouse_id` bigint(20) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  KEY `item_id` (`item_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku api1.supplies: ~2 rows (přibližně)
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
REPLACE INTO `supplies` (`item_id`, `warehouse_id`, `quantity`) VALUES
	(1, 101, 8),
	(2, 101, 15),
	(3, 102, 11),
	(4, 102, 45),
	(6, 101, 105),
	(6, 103, 60),
	(10, 101, 4),
	(10, 102, 12),
	(10, 103, 1);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;

-- Exportování struktury pro tabulka api1.warehouses
DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `warehouse_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- Exportování dat pro tabulku api1.warehouses: ~0 rows (přibližně)
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
REPLACE INTO `warehouses` (`warehouse_id`, `capacity`, `last_access`) VALUES
	(101, 800, '2019-03-17 16:04:37'),
	(102, 1500, '2019-03-17 16:04:46'),
	(103, 2400, '2019-03-17 16:04:56');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
