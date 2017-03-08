-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2016 at 02:45 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rmf_traker`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifacts`
--

CREATE TABLE IF NOT EXISTS `artifacts` (
  `AID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `DateEntered` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `Step` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE IF NOT EXISTS `packages` (
  `PID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Acronym` varchar(10) NOT NULL,
  `Description` varchar(40) NOT NULL,
  `eMassID` int(11) NOT NULL,
  `Accred.Type` varchar(20) NOT NULL,
  `Zone` varchar(20) NOT NULL,
  `Classification` varchar(20) NOT NULL,
  `StartDate` int(11) NOT NULL,
  `DueDate` int(11) NOT NULL,
  `RestartDate` int(11) NOT NULL,
  `PakageLead` varchar(20) NOT NULL,
  `PackageValidator` varchar(20) NOT NULL,
  `PUID` int(11) NOT NULL,
  `Archive` int(11) NOT NULL,
  `CurrentStep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packageusers`
--

CREATE TABLE IF NOT EXISTS `packageusers` (
  `PUID` int(11) NOT NULL,
  `User1` int(11) NOT NULL,
  `User2` int(11) NOT NULL,
  `User3` int(11) NOT NULL,
  `User4` int(11) NOT NULL,
  `User5` int(11) NOT NULL,
  `User6` int(11) NOT NULL,
  `User7` int(11) NOT NULL,
  `User8` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `RID` int(11) NOT NULL,
  `Role` varchar(10) NOT NULL,
  `Permission` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifacts`
--
ALTER TABLE `artifacts`
 ADD PRIMARY KEY (`AID`), ADD KEY `PID` (`PID`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
 ADD PRIMARY KEY (`PID`), ADD KEY `PUID` (`PUID`);

--
-- Indexes for table `packageusers`
--
ALTER TABLE `packageusers`
 ADD PRIMARY KEY (`PUID`), ADD KEY `User1` (`User1`), ADD KEY `User2` (`User2`), ADD KEY `User3` (`User3`), ADD KEY `User4` (`User4`), ADD KEY `User5` (`User5`), ADD KEY `User6` (`User6`), ADD KEY `User7` (`User7`), ADD KEY `User8` (`User8`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`UID`), ADD KEY `RID` (`RID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artifacts`
--
ALTER TABLE `artifacts`
ADD CONSTRAINT `artifacts_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `packages` (`PID`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`PUID`) REFERENCES `packageusers` (`PUID`);

--
-- Constraints for table `packageusers`
--
ALTER TABLE `packageusers`
ADD CONSTRAINT `packageusers_ibfk_1` FOREIGN KEY (`User1`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_2` FOREIGN KEY (`User2`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_3` FOREIGN KEY (`User3`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_4` FOREIGN KEY (`User4`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_5` FOREIGN KEY (`User5`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_6` FOREIGN KEY (`User6`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_7` FOREIGN KEY (`User7`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_8` FOREIGN KEY (`User8`) REFERENCES `users` (`UID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `roles` (`RID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
