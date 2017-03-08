-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2017 at 06:07 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rmf_test_devin`
--

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

CREATE TABLE IF NOT EXISTS `steps` (
  `PID` int(11) NOT NULL,
  `Step1` tinyint(1) NOT NULL,
  `Step2` tinyint(1) NOT NULL,
  `Step3` tinyint(1) NOT NULL,
  `Step4` tinyint(1) NOT NULL,
  `Step5` tinyint(1) NOT NULL,
  `Completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`PID`, `Step1`, `Step2`, `Step3`, `Step4`, `Step5`, `Completed`) VALUES
(1, 1, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0),
(3, 0, 0, 1, 0, 0, 0),
(4, 0, 0, 0, 1, 0, 0),
(5, 0, 0, 0, 0, 1, 0),
(6, 0, 0, 0, 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `steps`
--
ALTER TABLE `steps`
 ADD PRIMARY KEY (`PID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
