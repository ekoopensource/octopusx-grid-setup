# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.31)
# Database: octopusx-db
# Generation Time: 2020-10-14 05:33:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table access_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_profiles`;

CREATE TABLE `access_profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table access_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_routes`;

CREATE TABLE `access_routes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parent` varchar(50) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `host` varchar(50) DEFAULT NULL,
  `table` varchar(50) DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  `record` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table auth_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_users`;

CREATE TABLE `auth_users` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table data_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_fields`;

CREATE TABLE `data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `title` varchar(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table data_hosts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_hosts`;

CREATE TABLE `data_hosts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `type` enum('loc','ext') DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `driver` varchar(30) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table data_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_records`;

CREATE TABLE `data_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `field_value` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table data_tables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_tables`;

CREATE TABLE `data_tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL,
  `title` varchar(11) DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table domain_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `domain_access`;

CREATE TABLE `domain_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `type` enum('granter','grantee') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table domain_hosts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `domain_hosts`;

CREATE TABLE `domain_hosts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table profile_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_data`;

CREATE TABLE `profile_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `auth_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table profile_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_fields`;

CREATE TABLE `profile_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `title` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table profile_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_records`;

CREATE TABLE `profile_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `title` varchar(11) DEFAULT NULL,
  `profile_data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table profile_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_types`;

CREATE TABLE `profile_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `title` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
