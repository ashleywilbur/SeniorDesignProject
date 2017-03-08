-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2017 at 06:28 PM
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
  `Step` int(11) NOT NULL,
  `Days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `PID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Acronym` varchar(10) NOT NULL,
  `Description` int(11) NOT NULL,
  `Zone` int(11) NOT NULL,
  `eMassID` int(11) NOT NULL,
  `AccredType` int(11) NOT NULL,
  `Classification` int(11) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packagestandardtimeline`
--

CREATE TABLE IF NOT EXISTS `packagestandardtimeline` (
  `PSTID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `STID` int(11) NOT NULL,
  `Zone` int(11) NOT NULL,
  `AccredType` int(11) NOT NULL,
  `PkgCreationDate` int(11) NOT NULL,
  `Step1Date` int(11) NOT NULL,
  `Step2Date` int(11) NOT NULL,
  `Step3Date` int(11) NOT NULL,
  `Step4Date` int(11) NOT NULL,
  `Step5Date` int(11) NOT NULL,
  `CertAcquiredDate` int(11) NOT NULL,
  `ExpirationDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packageusers`
--

CREATE TABLE IF NOT EXISTS `packageusers` (
  `PUID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `RID` int(11) NOT NULL
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

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RID`, `Role`, `Permission`) VALUES
(1, 'Admin', '1'),
(2, 'A&ALead', '2'),
(3, 'PkgLead', '3'),
(4, 'PkgValid', '4'),
(5, 'TeamMmbr', '5'),
(6, 'Customer', '6'),
(7, 'ElevUser', '7'),
(8, 'Unassigned', '8');

-- --------------------------------------------------------

--
-- Table structure for table `standardtimeline`
--

CREATE TABLE IF NOT EXISTS `standardtimeline` (
  `STID` int(11) NOT NULL,
  `Zone` int(11) NOT NULL,
  `AccredType` int(11) NOT NULL,
  `CreationDate` int(11) NOT NULL,
  `Step1Date` int(11) NOT NULL,
  `Step2Date` int(11) NOT NULL,
  `Step3Date` int(11) NOT NULL,
  `Step4Date` int(11) NOT NULL,
  `Step5Date` int(11) NOT NULL,
  `CertAcquiredDate` int(11) NOT NULL,
  `ExpirationDate` int(11) NOT NULL
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
  `Phone` varchar(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Org` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `RID`, `Name`, `Email`, `Phone`, `Location`, `Org`) VALUES
(1, 1, 'TestAdmin', 'test@test.test', '5555555555', 'test', 'test'),
(2, 2, 'TestA&A', 'test@test.test', '5555555555', 'test', 'test'),
(3, 3, 'TestPkgLead', 'test@test.test', '5555555555', 'test', 'test'),
(4, 4, 'TestPkgValid', 'test@test.test', '5555555555', 'test', 'test'),
(5, 5, 'TestTeamMember', 'test@test.test', '5555555555', 'test', 'test'),
(6, 6, 'TestCustomer', 'test@test.test', '5555555555', 'test', 'test'),
(7, 7, 'TestElevUser', 'test@test.test', '5555555555', 'test', 'test'),
(8, 8, 'TestUnassigned', 'test@test.test', '5555555555', 'test', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifacts`
--
ALTER TABLE `artifacts`
 ADD PRIMARY KEY (`AID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
 ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `packagestandardtimeline`
--
ALTER TABLE `packagestandardtimeline`
 ADD PRIMARY KEY (`PSTID`), ADD KEY `PID` (`PID`), ADD KEY `STID` (`STID`);

--
-- Indexes for table `packageusers`
--
ALTER TABLE `packageusers`
 ADD PRIMARY KEY (`PUID`), ADD KEY `PID` (`PID`), ADD KEY `UID` (`UID`), ADD KEY `RID` (`RID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `standardtimeline`
--
ALTER TABLE `standardtimeline`
 ADD PRIMARY KEY (`STID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`UID`), ADD KEY `RID` (`RID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `packagestandardtimeline`
--
ALTER TABLE `packagestandardtimeline`
ADD CONSTRAINT `packagestandardtimeline_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `package` (`PID`),
ADD CONSTRAINT `packagestandardtimeline_ibfk_2` FOREIGN KEY (`STID`) REFERENCES `standardtimeline` (`STID`);

--
-- Constraints for table `packageusers`
--
ALTER TABLE `packageusers`
ADD CONSTRAINT `packageusers_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `package` (`PID`),
ADD CONSTRAINT `packageusers_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`),
ADD CONSTRAINT `packageusers_ibfk_3` FOREIGN KEY (`RID`) REFERENCES `roles` (`RID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `roles` (`RID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
