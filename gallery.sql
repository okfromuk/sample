/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.7.15-log : Database - gallery
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gallery` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gallery`;

/*Table structure for table `artist` */

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist` (
  `A_id` varchar(15) NOT NULL,
  `A_name` varchar(30) DEFAULT NULL,
  `Experience` varchar(15) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Gender` varchar(15) DEFAULT NULL,
  `No_of_works` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`A_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `artist` */

insert  into `artist`(`A_id`,`A_name`,`Experience`,`Phone`,`Gender`,`No_of_works`) values 
('1','omkar','10yrs','12345','male','3'),
('100','','','','','');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `C_id` varchar(15) NOT NULL,
  `C_name` varchar(15) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`C_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

/*Table structure for table `exhibition` */

DROP TABLE IF EXISTS `exhibition`;

CREATE TABLE `exhibition` (
  `G_id` varchar(15) NOT NULL,
  `A_id` varchar(15) NOT NULL,
  `date` varchar(15) DEFAULT NULL,
  `place` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`G_id`,`A_id`),
  KEY `A_id` (`A_id`),
  CONSTRAINT `exhibition_ibfk_3` FOREIGN KEY (`A_id`) REFERENCES `artist` (`A_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exhibition_ibfk_4` FOREIGN KEY (`G_id`) REFERENCES `gallery1` (`G_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exhibition` */

/*Table structure for table `gallery1` */

DROP TABLE IF EXISTS `gallery1`;

CREATE TABLE `gallery1` (
  `G_id` varchar(15) NOT NULL,
  `G_name` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`G_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gallery1` */

/*Table structure for table `painting` */

DROP TABLE IF EXISTS `painting`;

CREATE TABLE `painting` (
  `P_id` varchar(15) NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Price` varchar(20) NOT NULL,
  `Date` varchar(20) NOT NULL,
  `A_id` varchar(15) DEFAULT NULL,
  `Title` varchar(15) NOT NULL,
  PRIMARY KEY (`P_id`),
  KEY `A_id` (`A_id`),
  CONSTRAINT `A_id` FOREIGN KEY (`A_id`) REFERENCES `artist` (`A_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `painting` */

/*Table structure for table `participation` */

DROP TABLE IF EXISTS `participation`;

CREATE TABLE `participation` (
  `A_id` varchar(15) NOT NULL,
  `G_id` varchar(15) NOT NULL,
  `date` varchar(15) NOT NULL,
  PRIMARY KEY (`A_id`,`G_id`),
  KEY `gid` (`G_id`),
  CONSTRAINT `aid` FOREIGN KEY (`A_id`) REFERENCES `artist` (`A_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gid` FOREIGN KEY (`G_id`) REFERENCES `gallery1` (`G_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `participation` */

/*Table structure for table `sold_details` */

DROP TABLE IF EXISTS `sold_details`;

CREATE TABLE `sold_details` (
  `c_id` varchar(15) NOT NULL,
  `P_id` varchar(15) NOT NULL,
  `price` varchar(15) NOT NULL,
  PRIMARY KEY (`c_id`,`P_id`),
  KEY `P_id` (`P_id`),
  CONSTRAINT `sold_details_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`C_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sold_details_ibfk_3` FOREIGN KEY (`P_id`) REFERENCES `artist` (`A_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sold_details` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
