-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2015 at 12:56 PM
-- Server version: 5.5.40-cll
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
  KEY `E.ID` (`E.ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Card`
--

INSERT INTO `Card` (`C.ID`, `E.ID`, `Secret`) VALUES
(6, '12201022', 'assassin3210'),
(7, '10112333', 'assassin1234');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE IF NOT EXISTS `Department` (
  `D.ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key, increments autmatically',
  `D Name` varchar(20) NOT NULL,
  PRIMARY KEY (`D.ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`D.ID`, `D Name`) VALUES
(1, 'CSE'),
(2, 'EEE');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE IF NOT EXISTS `Employee` (
  `E.Name` varchar(50) NOT NULL,
  `E.ID` varchar(8) NOT NULL COMMENT 'user generated , primary key',
  `Address` varchar(50) NOT NULL,
  `Hours Worked` float(5,3) unsigned NOT NULL DEFAULT '0.000' COMMENT 'summation of hours worked from the hour attribute in the Office for a single employee',
  `Salary` double(3,3) unsigned NOT NULL DEFAULT '0.000' COMMENT 'calculated from the hour worked in this table',
  `C.ID` int(11) DEFAULT NULL COMMENT 'Foreign key from Card',
  `D.ID` int(11) DEFAULT NULL COMMENT 'Foreign key from Department',
  PRIMARY KEY (`E.ID`),
  KEY `C.ID` (`C.ID`),
  KEY `D.ID` (`D.ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`E.Name`, `E.ID`, `Address`, `Hours Worked`, `Salary`, `C.ID`, `D.ID`) VALUES
('AH Kafi', '10112333', 'mirpur', 0.000, 0.000, NULL, 2),
('BM Abir', '12201022', '32, Arambag', 0.000, 0.000, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Log`
--

CREATE TABLE IF NOT EXISTS `Log` (
  `Secret` varchar(12) NOT NULL COMMENT 'secret key from RFID',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'time stamp from system',
  `C.ID` int(11) DEFAULT NULL COMMENT 'Card no of the associated secret, it may or may not exist',
  PRIMARY KEY (`timeStamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Log`
--

INSERT INTO `Log` (`Secret`, `timeStamp`, `C.ID`) VALUES
('assassin3210', '2015-03-26 06:52:56', 6),
('assassin1234', '2015-03-26 06:53:11', 7);

-- --------------------------------------------------------

--
-- Table structure for table `Office`
--

CREATE TABLE IF NOT EXISTS `Office` (
  `Hour` float(5,3) unsigned NOT NULL DEFAULT '0.000' COMMENT 'hour calculated from the log',
  `O.ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL COMMENT 'Date of current Attendance',
  `E.ID` varchar(8) NOT NULL COMMENT 'Foreign key from Employee',
  PRIMARY KEY (`O.ID`),
  KEY `E.ID` (`E.ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Office`
--

INSERT INTO `Office` (`Hour`, `O.ID`, `Date`, `E.ID`) VALUES
(1.000, 5, '2015-03-26', '12201022'),
(1.000, 6, '2015-03-26', '10112333');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Card`
--
ALTER TABLE `Card`
  ADD CONSTRAINT `varchar` FOREIGN KEY (`E.ID`) REFERENCES `Employee` (`E.Id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
