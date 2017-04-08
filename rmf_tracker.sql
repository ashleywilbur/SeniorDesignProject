-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2017 at 10:38 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rmf_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifacts`
--

CREATE TABLE IF NOT EXISTS `artifacts` (
  `AID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `SubmitDate` date NOT NULL,
  `Progress` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artifacts`
--

INSERT INTO `artifacts` (`AID`, `SID`, `Name`, `SubmitDate`, `Progress`) VALUES
(1, 1, 'Artifact 1', '0000-00-00', 0),
(2, 1, 'Artifact 2', '0000-00-00', 0),
(3, 1, 'Artifact 3', '0000-00-00', 0),
(4, 2, 'Artifact 4', '0000-00-00', 0),
(5, 2, 'Artifact 5', '0000-00-00', 0),
(6, 2, 'Artifact 6', '0000-00-00', 0),
(7, 2, 'Artifact 7', '0000-00-00', 0),
(8, 2, 'Artifact 8', '0000-00-00', 0),
(9, 3, 'Artifact 9', '0000-00-00', 0),
(10, 3, 'Artifact 10', '0000-00-00', 0),
(11, 3, 'Artifact 11', '0000-00-00', 0),
(12, 4, 'Artifact 12', '0000-00-00', 0),
(13, 4, 'Artifact 13', '0000-00-00', 0),
(14, 4, 'Artifact 14', '0000-00-00', 0),
(15, 4, 'Artifact 15', '0000-00-00', 0),
(16, 5, 'Artifact 16', '0000-00-00', 0),
(17, 5, 'Artifact 17', '0000-00-00', 0),
(18, 6, 'Artifact 18', '0000-00-00', 0),
(19, 6, 'Artifact 19', '0000-00-00', 0),
(20, 7, 'Artifact 20', '0000-00-00', 0),
(21, 7, 'Artifact 21', '0000-00-00', 0),
(22, 8, 'Artifact 22', '0000-00-00', 0),
(23, 8, 'Artifact 23', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kickbackreasons`
--

CREATE TABLE IF NOT EXISTS `kickbackreasons` (
  `KRID` int(11) NOT NULL,
  `PAID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Reasons` varchar(100) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `PID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Acronym` varchar(10) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `eMassID` int(11) NOT NULL,
  `Classification` varchar(15) NOT NULL,
  `CIA` varchar(10) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` date NOT NULL,
  `TrackerStep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`PID`, `Name`, `Acronym`, `Description`, `eMassID`, `Classification`, `CIA`, `Archive`, `ArchiveDate`, `TrackerStep`) VALUES
(1, 'Person of Interest', 'POI', 'Brief Description ', 385, 'Classified', 'Medium', 1, '0000-00-00', 1),
(2, 'Games of Thrones', 'GOT', 'Brief Description ', 579, 'UnClassified', 'Low', 0, '0000-00-00', 2),
(3, 'The Magicians', 'TM', 'Brief Description ', 0, 'UnClassified', 'Medium', 0, '0000-00-00', 3),
(4, 'Boardwalk Empire', 'BE', 'Brief Description ', 0, 'Classified', 'Low', 0, '0000-00-00', 4),
(5, 'SMASH', 'SMASH', 'Brief Description ', 147, 'Secret', 'High', 1, '0000-00-00', 5),
(6, 'Hulk', 'Hulk', 'Brief Description ', 467, 'UnClassified', 'Low', 0, '1981-12-01', 6);

-- --------------------------------------------------------

--
-- Table structure for table `packageartifacts`
--

CREATE TABLE IF NOT EXISTS `packageartifacts` (
  `PAID` int(11) NOT NULL,
  `PUID` int(11) NOT NULL,
  `AID` int(11) NOT NULL,
  `RWID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `SubmitDate` date NOT NULL,
  `AcceptedDate` date NOT NULL,
  `DeliveryDate` date NOT NULL,
  `ApprovalDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packagestandardtimeline`
--

CREATE TABLE IF NOT EXISTS `packagestandardtimeline` (
  `PSTID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `STID` int(11) NOT NULL,
  `PkgCreationDate` date NOT NULL,
  `Step1Date` date NOT NULL,
  `Step2Date` date NOT NULL,
  `Step3Date` date NOT NULL,
  `Step4Date` date NOT NULL,
  `Step5Date` date NOT NULL,
  `CertAcquiredDate` date NOT NULL,
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
  `RID` int(11) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE IF NOT EXISTS `reviewer` (
  `RWID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`RWID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Archive`, `ArchiveDate`) VALUES
(1, 'Sam', 'Sung', 'Sam.Sung@ech2.mil', '3334512587', 0, '02012016'),
(2, 'Jackie', 'Chan', 'Jackie.Chan@ech2.mil', '3334512588', 0, '01202017'),
(3, 'Aaron', 'Slater', 'Aaron.Slater@ech2.mil', '3334512589', 1, '02142017'),
(4, 'Mass ', 'Tucker', 'Mass.Tucker@ech2.mil', '334512590', 0, '01152017');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `RID` int(11) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Permission` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RID`, `Role`, `Permission`) VALUES
(1, 'Admin', 'Read, Write'),
(2, 'A&ALead', 'Read, Write'),
(3, 'Elevated User', 'Read (Limited)'),
(4, 'Package Lead', 'Read, Write (Limited)'),
(5, 'Package Validator ', 'Read'),
(6, 'Package Team Member', 'Read'),
(7, 'Customer', 'Read (Limited)'),
(8, 'New User', 'Read (Restricted)');

-- --------------------------------------------------------

--
-- Table structure for table `standardtimeline`
--

CREATE TABLE IF NOT EXISTS `standardtimeline` (
  `STID` int(11) NOT NULL,
  `Zone` varchar(20) NOT NULL,
  `AccredType` varchar(20) NOT NULL,
  `CreationDate` date NOT NULL,
  `Step1Complete` date NOT NULL,
  `Step2Complete` date NOT NULL,
  `Step3Complete` date NOT NULL,
  `Step4Complete` date NOT NULL,
  `Step5Complete` date NOT NULL,
  `CertAcquiredDate` date NOT NULL,
  `ExpirationDateMonth` int(11) NOT NULL,
  `OverallProcessMonths` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standardtimeline`
--

INSERT INTO `standardtimeline` (`STID`, `Zone`, `AccredType`, `CreationDate`, `Step1Complete`, `Step2Complete`, `Step3Complete`, `Step4Complete`, `Step5Complete`, `CertAcquiredDate`, `ExpirationDateMonth`, `OverallProcessMonths`) VALUES
(1, 'A', 'ATO', '2031-12-01', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(2, 'A', 'IATT', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(3, 'A', 'ISCM- ReCred', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5),
(4, 'B', 'ATO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(5, 'B', 'IATT', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(6, 'B', 'ISCM- ReCred', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5),
(7, 'C', 'ATO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(8, 'C', 'IATT', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(9, 'C', 'ISCM- ReCred', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5),
(10, 'D- Development ', 'ATO', '2032-02-01', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(11, 'D- Development ', 'IATT', '2032-12-01', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(12, 'D- Development ', 'ISCM- ReCred', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5),
(13, 'D- Non Development ', 'ATO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(14, 'D- Non Development ', 'IATT', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(15, 'D- Non Development ', 'ISCM- ReCred', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5),
(16, 'PIT- Alfoat', 'ATO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(17, 'PIT- Alfoat', 'IATT', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(18, 'PIT- Alfoat', 'ISCM- ReCred', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5),
(19, 'PIT- Non Alfoat', 'ATO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(20, 'PIT- Non Alfoat', 'IATT', '2033-02-01', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(21, 'PIT- Non Alfoat', 'ISCM- ReCred', '2033-12-01', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5),
(22, 'Software', 'ATO', '2040-12-01', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 48, 14.5),
(23, 'Software', 'IATT', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 3, 7.5),
(24, 'Software', 'ISCM- ReCred', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 12, 7.5);

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

CREATE TABLE IF NOT EXISTS `steps` (
  `SID` int(11) NOT NULL,
  `StepNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`SID`, `StepNum`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Org` varchar(20) NOT NULL,
  `Archive` tinyint(1) NOT NULL,
  `ArchiveDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `FirstName`, `LastName`, `Email`, `Phone`, `Location`, `Org`, `Archive`, `ArchiveDate`) VALUES
(1, 'Jane', 'Does', 'Jane.Doe@navy.mil', '4019991234', 'NUWC', '25', 0, '0000-00-00'),
(2, 'John ', 'Smith', 'John.Smith@navy.mil', '4019991235', 'NUWC', '25', 1, '0000-00-00'),
(3, 'Wesley', 'Snipe', 'Wes.Snipe@Westport.air', '8086761111', 'GMT', 'West Port', 0, '0000-00-00'),
(4, 'Huckle', 'Fynn', 'Huckle.Fynn@navy.mil', '4019991237', 'NUWC', '25', 1, '0000-00-00'),
(5, 'John', 'Snow', 'John.Snow@navy.mil', '4019991238', 'NUWC', '25', 0, '0000-00-00'),
(6, 'Carrie ', 'Bradshaw', 'Carrie.Bradshaw@navy.mil', '4019991239', 'NUWC', '25', 0, '0000-00-00'),
(7, 'Steve', 'Jobs', 'Steve.Jobs@Monoply.org', '5035551254', 'PST', 'Monopoly', 0, '0000-00-00'),
(8, 'Walt ', 'Disney', 'Walt.Disney@navy.mil', '4019991241', 'NUWC', '85', 0, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifacts`
--
ALTER TABLE `artifacts`
 ADD PRIMARY KEY (`AID`), ADD KEY `SID` (`SID`);

--
-- Indexes for table `kickbackreasons`
--
ALTER TABLE `kickbackreasons`
 ADD PRIMARY KEY (`KRID`), ADD KEY `PUID` (`PAID`,`SID`), ADD KEY `SID` (`SID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
 ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `packageartifacts`
--
ALTER TABLE `packageartifacts`
 ADD PRIMARY KEY (`PAID`), ADD KEY `PUID` (`PUID`), ADD KEY `AID` (`AID`), ADD KEY `RWID` (`RWID`);

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
ADD CONSTRAINT `kickbackreasons_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `steps` (`SID`),
ADD CONSTRAINT `kickbackreasons_ibfk_3` FOREIGN KEY (`PAID`) REFERENCES `packageartifacts` (`PAID`);

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
