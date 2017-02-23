-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 23, 2017 at 06:35 PM
-- Server version: 5.7.17-log
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eplan_benefits`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_first_name` varchar(255) NOT NULL,
  `employee_last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_joined` datetime NOT NULL,
  `date_left` datetime NOT NULL,
  `employee_address` varchar(255) NOT NULL,
  `healthcare_id` int(11) NOT NULL,
  `retirement_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `employer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `healthcare_id` int(11) NOT NULL,
  `retirement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `healthcare`
--

CREATE TABLE `healthcare` (
  `employee_id` int(11) NOT NULL,
  `healthcare_id` int(11) NOT NULL,
  `network_provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invest_option`
--

CREATE TABLE `invest_option` (
  `retirement_id` int(11) NOT NULL,
  `fixed_fund` varchar(25) NOT NULL,
  `guided_fund` varchar(25) NOT NULL,
  `guidance_participants` varchar(25) NOT NULL,
  `plan_trustees` varchar(25) NOT NULL,
  `open_fund` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plan_type`
--

CREATE TABLE `plan_type` (
  `retirement_id` int(11) NOT NULL,
  `traditional_401K` varchar(25) NOT NULL,
  `safe_harbor_401k` varchar(25) NOT NULL,
  `owner_only_401K` varchar(25) NOT NULL,
  `profit_sharing_401K` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `retirement`
--

CREATE TABLE `retirement` (
  `retirement_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `plan_type` varchar(255) NOT NULL,
  `invest_option` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `employer_id` (`employer_id`),
  ADD KEY `healthcare_id` (`healthcare_id`),
  ADD KEY `retirement_id` (`retirement_id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`employer_id`),
  ADD KEY `healthcare_id` (`healthcare_id`),
  ADD KEY `retirement_id` (`retirement_id`);

--
-- Indexes for table `healthcare`
--
ALTER TABLE `healthcare`
  ADD PRIMARY KEY (`healthcare_id`);

--
-- Indexes for table `invest_option`
--
ALTER TABLE `invest_option`
  ADD PRIMARY KEY (`retirement_id`);

--
-- Indexes for table `plan_type`
--
ALTER TABLE `plan_type`
  ADD PRIMARY KEY (`retirement_id`);

--
-- Indexes for table `retirement`
--
ALTER TABLE `retirement`
  ADD PRIMARY KEY (`retirement_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `employer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`employer_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`healthcare_id`) REFERENCES `healthcare` (`healthcare_id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`retirement_id`) REFERENCES `retirement` (`retirement_id`);

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `employee` (`employer_id`),
  ADD CONSTRAINT `employer_ibfk_2` FOREIGN KEY (`healthcare_id`) REFERENCES `healthcare` (`healthcare_id`),
  ADD CONSTRAINT `employer_ibfk_3` FOREIGN KEY (`retirement_id`) REFERENCES `retirement` (`retirement_id`);

--
-- Constraints for table `invest_option`
--
ALTER TABLE `invest_option`
  ADD CONSTRAINT `invest_option_ibfk_1` FOREIGN KEY (`retirement_id`) REFERENCES `retirement` (`retirement_id`);

--
-- Constraints for table `plan_type`
--
ALTER TABLE `plan_type`
  ADD CONSTRAINT `plan_type_ibfk_1` FOREIGN KEY (`retirement_id`) REFERENCES `retirement` (`retirement_id`);

--
-- Constraints for table `retirement`
--
ALTER TABLE `retirement`
  ADD CONSTRAINT `retirement_ibfk_1` FOREIGN KEY (`retirement_id`) REFERENCES `employee` (`employee_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
