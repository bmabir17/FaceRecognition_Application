-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2015 at 02:16 AM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `unisecbd_rfid`
--

-- --------------------------------------------------------

--
-- Table structure for table `Card`
--

CREATE TABLE IF NOT EXISTS `Card` (
  `C.ID` int(11) NOT NULL AUTO_INCREMENT,
  `E.ID` varchar(8) NOT NULL,
  `Secret` varchar(12) NOT NULL COMMENT 'this is the secret key from the RFID card',
  PRIMARY KEY (`C.ID`),
  UNIQUE KEY `Secret` (`Secret`),
  KEY `E.ID` (`E.ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `Card`
--

INSERT INTO `Card` (`C.ID`, `E.ID`, `Secret`) VALUES
(6, '12201022', 'assassin3210'),
(10, '12301011', 'assassin32'),
(25, '12201036', 'new1'),
(28, '14201022', 'new2'),
(37, '12201012', 'assassin1234'),
(40, '024', 'nhbghgn'),
(49, '10201022', 'newassassin1'),
(56, '12201037', 'newassassin0'),
(58, '12201011', 'newassassin2');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE IF NOT EXISTS `Department` (
  `D.ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key, increments autmatically',
  `D Name` varchar(20) NOT NULL,
  PRIMARY KEY (`D.ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`D.ID`, `D Name`) VALUES
(1, 'CSE'),
(2, 'EEE'),
(3, 'ECE'),
(4, 'BBA'),
(5, 'MNS');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE IF NOT EXISTS `Employee` (
  `E.Name` varchar(50) NOT NULL,
  `E.ID` varchar(8) NOT NULL COMMENT 'user generated , primary key',
  `Address` varchar(100) DEFAULT NULL,
  `Hours Worked` float(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'summation of hours worked from the hour attribute in the Office for a single employee',
  `Salary` float(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'calculated from the hour worked in this table',
  `C.ID` int(11) DEFAULT NULL COMMENT 'Foreign key from Card',
  `D.ID` int(11) DEFAULT NULL COMMENT 'Foreign key from Department',
  `Cell Phone` int(15) unsigned NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`E.ID`),
  KEY `C.ID` (`C.ID`),
  KEY `D.ID` (`D.ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`E.Name`, `E.ID`, `Address`, `Hours Worked`, `Salary`, `C.ID`, `D.ID`, `Cell Phone`, `Email`) VALUES
('abir bhai', '024', 'hftgyvjkl;', 0.00, 0.00, 40, 1, 4294967295, 'vkgfhbgd@ghb.com'),
('A H kafi', '10201022', '32 mirpur', 0.00, 0.00, 49, 2, 167071414, 'ahkafi@gmail.com'),
('asif', '12201011', 'chapai nababganj', 0.00, 0.00, 58, 1, 1717071413, 'kh3laghar@gmail.com'),
('Ony', '12201012', 'asads', 0.00, 0.00, 37, 1, 1717071413, 'ony@gmail.com'),
('BM Abir', '12201022', '32, Arambag', 7.00, 3500.00, 6, 1, 0, NULL),
('Tausif', '12201036', 'sawraPara', 0.00, 0.00, 25, 1, 1915601504, 'tausif.elahi@gmail.com'),
('arnob', '12201037', NULL, 0.00, 0.00, 56, 1, 1915601503, NULL),
('mitesh', '12301011', '80/1 Mohakhali', 4.00, 1.00, 10, 1, 0, NULL),
('Antara', '14201022', 'shawrapara mirpur', 0.00, 0.00, 28, 2, 1717071414, 'antara.anto@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Log`
--

CREATE TABLE IF NOT EXISTS `Log` (
  `Secret` varchar(12) NOT NULL COMMENT 'secret key from RFID',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'time stamp from system',
  `C.ID` int(11) DEFAULT NULL COMMENT 'Card no of the associated secret, it may or may not exist',
  PRIMARY KEY (`timeStamp`),
  KEY `C.ID` (`C.ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Log`
--

INSERT INTO `Log` (`Secret`, `timeStamp`, `C.ID`) VALUES
('assassin3210', '2015-03-26 06:52:56', 6),
('assassin32', '2015-03-31 05:49:32', 8),
('new1', '2015-04-08 16:15:37', 25),
('new2', '2015-04-08 17:14:56', 28),
('assassin1234', '2015-04-09 03:47:04', 37),
('assassin3210', '2015-04-13 18:00:14', 6),
('newassassin1', '2015-04-13 19:26:17', 49),
('newassassin0', '2015-04-14 06:03:30', 56);

-- --------------------------------------------------------

--
-- Table structure for table `Office`
--

CREATE TABLE IF NOT EXISTS `Office` (
  `Hour` float(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'hour calculated from the log',
  `O.ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL COMMENT 'Date of current Attendance',
  `E.ID` varchar(8) NOT NULL COMMENT 'Foreign key from Employee',
  PRIMARY KEY (`O.ID`),
  KEY `E.ID` (`E.ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `Office`
--

INSERT INTO `Office` (`Hour`, `O.ID`, `Date`, `E.ID`) VALUES
(1.00, 5, '2015-03-26', '12201022'),
(2.00, 7, '2015-03-27', '12201022'),
(2.00, 10, '2015-04-04', '12301011'),
(2.00, 12, '2015-04-07', '12201022'),
(1.00, 15, '2015-04-08', '12201022'),
(1.00, 16, '2015-04-07', '12201022');

--
-- Triggers `Office`
--
DROP TRIGGER IF EXISTS `salary and total hours worked calculation`;
DELIMITER //
CREATE TRIGGER `salary and total hours worked calculation` AFTER INSERT ON `Office`
 FOR EACH ROW UPDATE `Employee` SET `Hours Worked`=(SELECT SUM(`Office`.`Hour`) FROM `Office` where `Office`.`E.ID`=(SELECT `Office`.`E.ID` FROM `Office`
ORDER BY `O.ID` DESC
LIMIT 1)),`Salary`=(SELECT SUM(`Office`.`Hour`) FROM `Office` where `Office`.`E.ID`=(SELECT `Office`.`E.ID` FROM `Office`
ORDER BY `O.ID` DESC
LIMIT 1))*500 WHERE `Employee`.`E.ID`=(SELECT `Office`.`E.ID` FROM `Office`
ORDER BY `O.ID` DESC
LIMIT 1)
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Card`
--
ALTER TABLE `Card`
  ADD CONSTRAINT `varchar` FOREIGN KEY (`E.ID`) REFERENCES `Employee` (`E.ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `FK_Employee1` FOREIGN KEY (`D.ID`) REFERENCES `Department` (`D.ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `int` FOREIGN KEY (`C.ID`) REFERENCES `Card` (`C.ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Office`
--
ALTER TABLE `Office`
  ADD CONSTRAINT `FK_Office1` FOREIGN KEY (`E.ID`) REFERENCES `Employee` (`E.ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
