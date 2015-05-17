-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2015 at 04:30 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `transportation`
--

-- --------------------------------------------------------

--
-- Table structure for table `pass`
--

CREATE TABLE IF NOT EXISTS `pass` (
  `station_id` int(11) NOT NULL,
  `transportation_id` int(11) NOT NULL,
  `pass_status` enum('start','end','normal','') NOT NULL,
  PRIMARY KEY (`station_id`,`transportation_id`),
  KEY `transportation_id` (`transportation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_name` varchar(50) NOT NULL,
  `st_long` float NOT NULL,
  `st_latt` float NOT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`st_id`, `st_name`, `st_long`, `st_latt`) VALUES
(1, 'Ramses', 12.2, 1223),
(3, 'ewfff', 1112, 1132);

-- --------------------------------------------------------

--
-- Table structure for table `take`
--

CREATE TABLE IF NOT EXISTS `take` (
  `take_id` int(11) NOT NULL AUTO_INCREMENT,
  `take_from` varchar(50) NOT NULL,
  `take_to` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transportation_id` int(11) NOT NULL,
  `take_actual` float NOT NULL,
  `take_rate` int(10) NOT NULL,
  `take_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `take_favourite` enum('yes','no','','') NOT NULL,
  PRIMARY KEY (`take_id`),
  KEY `user_id` (`user_id`),
  KEY `transportation_id` (`transportation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transportationmean`
--

CREATE TABLE IF NOT EXISTS `transportationmean` (
  `tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_number/name` varchar(50) NOT NULL,
  `tr_type` varchar(40) NOT NULL,
  PRIMARY KEY (`tr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `transportationmean`
--

INSERT INTO `transportationmean` (`tr_id`, `tr_number/name`, `tr_type`) VALUES
(7, '11', 'Metro'),
(9, '1112', 'Bus'),
(11, '2', 'Metro'),
(15, '2020', 'Metro');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(40) DEFAULT NULL,
  `u_phone` varchar(13) DEFAULT NULL,
  `u_password` char(32) DEFAULT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_name`, `u_phone`, `u_password`, `u_email`, `u_image`) VALUES
(1, 'Dalia', '01098570401', '202cb962ac59075b964b07152d234b70', 'dalia@hotmail.com', NULL),
(2, 'Dalia', '01098570405', '21232f297a57a5a743894a0e4a801fc3', 'admin@yahoo.com', NULL),
(3, NULL, '12345', 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pass`
--
ALTER TABLE `pass`
  ADD CONSTRAINT `pass_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`st_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pass_ibfk_2` FOREIGN KEY (`transportation_id`) REFERENCES `transportationmean` (`tr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `take`
--
ALTER TABLE `take`
  ADD CONSTRAINT `take_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`),
  ADD CONSTRAINT `take_ibfk_2` FOREIGN KEY (`transportation_id`) REFERENCES `transportationmean` (`tr_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
