-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2015 at 12:23 PM
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
-- Creation: Apr 08, 2015 at 03:07 PM
--

CREATE TABLE IF NOT EXISTS `Card` (
  `C.ID` int(11) NOT NULL AUTO_INCREMENT,
  `E.ID` varchar(8) NOT NULL,
  `Secret` varchar(12) NOT NULL COMMENT 'this is the secret key from the RFID card',
  PRIMARY KEY (`C.ID`),
  KEY `E.ID` (`E.ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `Card`
--

INSERT INTO `Card` (`C.ID`, `E.ID`, `Secret`) VALUES
(6, '12201022', 'assassin3210'),
(7, '10112333', 'assassin1234'),
(8, '12201032', 'mohakhali'),
(10, '12301011', 'assassin32'),
(11, '12301011', 'assassin32'),
(12, '12201011', 'assassin32'),
(15, '12201032', 'new3'),
(25, '12201036', 'new1'),
(26, '14201022', 'new2');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--
-- Creation: Apr 08, 2015 at 12:45 PM
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
-- Creation: Apr 08, 2015 at 01:49 PM
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
('AH Kafi', '10112333', 'mirpur', 0.00, 0.00, NULL, 2, 0, NULL),
('Asif', '12201011', '79/1 Mohakhali', 6.00, 300000.00, 12, 1, 0, NULL),
('ony', '12201012', 'mirpur', 0.00, 0.00, NULL, 1, 0, NULL),
('BM Abir', '12201022', '32, Arambag', 7.00, 3500.00, 6, 1, 0, NULL),
('arnab', '12201032', 'dhaka', 0.00, 0.00, NULL, 1, 0, NULL),
('Tausif', '12201036', 'sawraPara', 0.00, 0.00, 25, 1, 1915601504, 'tausif.elahi@gmail.com'),
('mitesh', '12301011', '80/1 Mohakhali', 4.00, 1.00, 10, 1, 0, NULL),
('Antara', '14201022', 'Mirpur Shawrapara', 0.00, 0.00, 26, 1, 1717071414, 'antara.anto@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Log`
--
-- Creation: Apr 08, 2015 at 12:45 PM
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
('assassin1234', '2015-03-26 06:53:11', 7),
('assassin32', '2015-03-31 05:49:32', 8),
('new1', '2015-04-08 16:15:37', 25),
('new2', '2015-04-08 16:18:22', 26);

-- --------------------------------------------------------

--
-- Table structure for table `Office`
--
-- Creation: Apr 08, 2015 at 12:45 PM
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
(1.00, 6, '2015-03-26', '10112333'),
(2.00, 7, '2015-03-27', '12201022'),
(5.00, 8, '2015-03-27', '10112333'),
(4.00, 9, '2015-04-04', '12201032'),
(2.00, 10, '2015-04-04', '12301011'),
(1.50, 11, '2015-04-04', '12201011'),
(2.00, 12, '2015-04-07', '12201022'),
(1.00, 13, '2015-04-07', '12201011'),
(3.50, 14, '2015-04-08', '12201011'),
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
-- Constraints for table `Log`
--
ALTER TABLE `Log`
  ADD CONSTRAINT `FK_Log1` FOREIGN KEY (`C.ID`) REFERENCES `Card` (`C.ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Office`
--
ALTER TABLE `Office`
  ADD CONSTRAINT `FK_Office1` FOREIGN KEY (`E.ID`) REFERENCES `Employee` (`E.ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
