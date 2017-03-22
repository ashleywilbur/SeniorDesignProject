-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2017 at 02:27 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rmf_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifacts`
--

CREATE TABLE `artifacts` (
  `AID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kickbackreasons`
--

CREATE TABLE `kickbackreasons` (
  `KRID` int(11) NOT NULL,
  `PUID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Reasons` varchar(100) NOT NULL,
  `Date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `PID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Acronym` varchar(10) NOT NULL,
  `Description` int(11) NOT NULL,
  `eMassID` int(11) NOT NULL,
  `Classification` int(11) NOT NULL,
  `CIA` varchar(10) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` int(11) NOT NULL,
  `TrackerStep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packageartifacts`
--

CREATE TABLE `packageartifacts` (
  `PAID` int(11) NOT NULL,
  `PUID` int(11) NOT NULL,
  `AID` int(11) NOT NULL,
  `RWID` int(11) NOT NULL,
  `StartDate` int(11) NOT NULL,
  `SubmitDate` int(11) NOT NULL,
  `AcceptedDate` int(11) NOT NULL,
  `DeliveryDate` int(11) NOT NULL,
  `ApprovalDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packagestandardtimeline`
--

CREATE TABLE `packagestandardtimeline` (
  `PSTID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `STID` int(11) NOT NULL,
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

CREATE TABLE `packageusers` (
  `PUID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `RWID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
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

CREATE TABLE `standardtimeline` (
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
-- Table structure for table `steps`
--

CREATE TABLE `steps` (
  `SID` int(11) NOT NULL,
  `StepNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Org` varchar(20) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `Name`, `Email`, `Phone`, `Location`, `Org`, `Archive`, `ArchiveDate`) VALUES
(1, 'TestAdmin', 'test@test.test', '5555555555', '', '', 0, 'test'),
(2, 'TestA&A', 'test@test.test', '5555555555', '', '', 0, 'test'),
(3, 'TestPkgLead', 'test@test.test', '5555555555', '', '', 0, 'test'),
(4, 'TestPkgValid', 'test@test.test', '5555555555', '', '', 0, 'test'),
(5, 'TestTeamMember', 'test@test.test', '5555555555', '', '', 0, 'test'),
(6, 'TestCustomer', 'test@test.test', '5555555555', '', '', 0, 'test'),
(7, 'TestElevUser', 'test@test.test', '5555555555', '', '', 0, 'test'),
(8, 'TestUnassigned', 'test@test.test', '5555555555', '', '', 0, 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifacts`
--
ALTER TABLE `artifacts`
  ADD PRIMARY KEY (`AID`),
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `kickbackreasons`
--
ALTER TABLE `kickbackreasons`
  ADD PRIMARY KEY (`KRID`),
  ADD KEY `PUID` (`PUID`,`SID`),
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `packageartifacts`
--
ALTER TABLE `packageartifacts`
  ADD PRIMARY KEY (`PAID`),
  ADD KEY `PUID` (`PUID`),
  ADD KEY `AID` (`AID`),
  ADD KEY `RWID` (`RWID`);

--
-- Indexes for table `packagestandardtimeline`
--
ALTER TABLE `packagestandardtimeline`
  ADD PRIMARY KEY (`PSTID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `STID` (`STID`);

--
-- Indexes for table `packageusers`
--
ALTER TABLE `packageusers`
  ADD PRIMARY KEY (`PUID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `UID` (`UID`),
  ADD KEY `RID` (`RID`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`RWID`);

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
-- Indexes for table `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artifacts`
--
ALTER TABLE `artifacts`
  ADD CONSTRAINT `artifacts_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `steps` (`SID`);

--
-- Constraints for table `kickbackreasons`
--
ALTER TABLE `kickbackreasons`
  ADD CONSTRAINT `kickbackreasons_ibfk_1` FOREIGN KEY (`PUID`) REFERENCES `packageusers` (`PUID`),
  ADD CONSTRAINT `kickbackreasons_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `steps` (`SID`);

--
-- Constraints for table `packageartifacts`
--
ALTER TABLE `packageartifacts`
  ADD CONSTRAINT `packageartifacts_ibfk_1` FOREIGN KEY (`PUID`) REFERENCES `packageusers` (`PUID`),
  ADD CONSTRAINT `packageartifacts_ibfk_2` FOREIGN KEY (`AID`) REFERENCES `artifacts` (`AID`),
  ADD CONSTRAINT `packageartifacts_ibfk_3` FOREIGN KEY (`RWID`) REFERENCES `reviewer` (`RWID`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
