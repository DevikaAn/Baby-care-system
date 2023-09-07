-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 12, 2021 at 10:49 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbbabycare`
--

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE IF NOT EXISTS `disease` (
  `disease_id` int(100) NOT NULL AUTO_INCREMENT,
  `wrkr_id` int(100) DEFAULT NULL,
  `doc_id` int(100) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`disease_id`, `wrkr_id`, `doc_id`, `details`, `posted_date`) VALUES
(1, 2, 1, 'Expert in baby care', '2019-12-12'),
(2, 3, 4, 'sfdgtrfg', '2020-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `doctor_id` int(100) NOT NULL AUTO_INCREMENT,
  `district` varchar(50) DEFAULT NULL,
  `panchayath` varchar(50) DEFAULT NULL,
  `dname` varchar(50) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `optime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `district`, `panchayath`, `dname`, `qualification`, `address`, `phone_no`, `optime`) VALUES
(1, 'Ernakulam', 'Karumalloor', 'Dr Manu', 'MBBS', 'Aluva', '9947394641', '15:25'),
(2, 'Ernakulam', 'Alangad', 'Dr Dilsha', 'MBBS MD', 'oolampara', '9947394641', '11:47'),
(3, 'Ernakulam', 'Karumalloor', 'Anu', 'MBBS', 'Aluva', '7845847454', '03:03'),
(4, 'Ernakulam', 'Kunnumpuram', 'Ramachandran', 'kadjn', 'ksdfj', '8891212022', '10:00');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE IF NOT EXISTS `food` (
  `food_id` int(100) NOT NULL AUTO_INCREMENT,
  `wrkr_id` int(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`food_id`, `wrkr_id`, `title`, `details`, `posted_date`, `status`) VALUES
(1, 2, 'Nutrition Food', 'mango\r\nwatermelon', '2019-12-12', '1');

-- --------------------------------------------------------

--
-- Table structure for table `health_tips`
--

CREATE TABLE IF NOT EXISTS `health_tips` (
  `tipid` int(100) NOT NULL AUTO_INCREMENT,
  `wrkr_id` int(100) DEFAULT NULL,
  `age_grp` varchar(50) DEFAULT NULL,
  `tips` varchar(100) DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tipid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `health_tips`
--

INSERT INTO `health_tips` (`tipid`, `wrkr_id`, `age_grp`, `tips`, `posted_date`, `status`) VALUES
(1, 2, 'upto 3 months babys', 'nutristion food', '2019-12-12', '1'),
(2, 2, '6 months', 'qwerty', '2019-12-12', '1');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `logid` int(100) NOT NULL AUTO_INCREMENT,
  `userid` int(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`logid`, `userid`, `username`, `password`, `status`, `usertype`) VALUES
(1, 0, 'admin', 'admin', '1', 'admin'),
(2, 2, '9947394641', 'worker5462', '1', 'worker'),
(3, 2, '9947394641', 'doctor6958', '1', 'doctor'),
(5, 3, '7845847454', 'doctor8640', '1', 'doctor'),
(6, 2, '9585478545', 'mother6176', '1', 'mother'),
(7, 3, '9541023678', 'worker6962', '1', 'worker'),
(8, 4, '8891212022', 'doctor3116', '1', 'doctor'),
(9, 3, '9562301478', 'mother3038', '1', 'mother'),
(10, 3, '9874102563', 'panch6696', '1', 'panchayath'),
(11, 3, '9188220903', 'panch3292', '1', 'panchayath');

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `meetingid` int(11) NOT NULL AUTO_INCREMENT,
  `panchayath` varchar(50) NOT NULL,
  `meeting` varchar(100) NOT NULL,
  `mdate` date NOT NULL,
  `mtime` varchar(50) NOT NULL,
  PRIMARY KEY (`meetingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`meetingid`, `panchayath`, `meeting`, `mdate`, `mtime`) VALUES
(1, 'Aluva', 'Meeting for new project', '2021-04-14', '10:00');

-- --------------------------------------------------------

--
-- Table structure for table `mother_reg`
--

CREATE TABLE IF NOT EXISTS `mother_reg` (
  `mother_id` int(100) NOT NULL AUTO_INCREMENT,
  `wrker_id` int(100) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `panchayath` varchar(50) DEFAULT NULL,
  `ward_no` varchar(50) DEFAULT NULL,
  `pstatus` varchar(20) DEFAULT NULL,
  `month_count` varchar(10) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`mother_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mother_reg`
--

INSERT INTO `mother_reg` (`mother_id`, `wrker_id`, `mother_name`, `age`, `address`, `district`, `panchayath`, `ward_no`, `pstatus`, `month_count`, `delivery_date`, `phone_number`) VALUES
(2, 2, 'Ghy', '23', 'ty', 'Ernakulam', 'Karumalloor', '10', 'carrying', '8', '2019-12-29', '9585478545'),
(3, 3, 'Baby', '25', 'adjfhbk', 'Ernakulam', 'Kunnumpuram', '2', 'carrying', '8', '2020-03-27', '9562301478');

-- --------------------------------------------------------

--
-- Table structure for table `panchayath_reg`
--

CREATE TABLE IF NOT EXISTS `panchayath_reg` (
  `panchayath_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `district` varchar(25) DEFAULT NULL,
  `ward_count` varchar(20) DEFAULT NULL,
  `house_count` varchar(20) DEFAULT NULL,
  `president_name` varchar(25) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`panchayath_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `panchayath_reg`
--

INSERT INTO `panchayath_reg` (`panchayath_id`, `name`, `district`, `ward_count`, `house_count`, `president_name`, `address`, `email`, `phone_number`) VALUES
(1, 'Alangad', 'Ernakulam', '231', '203', 'Megha', 'Alanagad po aluva', 'alangad@gmail.com', '9565478545'),
(2, 'Karumalloor', 'Ernakulam', '100', '3000', 'amritha', 'hgjkhkhk\r\noippppu', 'ammu1@gmail.com', '4534565'),
(3, 'Aluva', 'Ernakulam', '25', '4500', 'Sherin', 'Aluva', 'aluva@gmail.com', '9652301478'),
(4, 'Kunnumpuram', 'Ernakulam', '152', '4500', 'Arya', 'KLJNsda', 'kunnumpuram@gmail.com', '9623015478'),
(5, 'Keezhmad', 'Ernakulam', '120', '4500', 'Reshma', 'njbhn', 'keezhmadpanch@gmail.com', '9874102563'),
(6, 'mookkanoor', 'Ernakulam', '12', '345', 'shaiby', 'mookkanoor road', 'mookkanoor@gmail.com', '9188220903');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(100) NOT NULL AUTO_INCREMENT,
  `district` varchar(50) DEFAULT NULL,
  `panchayath` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  `valid_upto` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `district`, `panchayath`, `title`, `details`, `posted_date`, `valid_upto`, `status`) VALUES
(2, 'Ernakulam', 'Karumalloor', 'Meetings On Comming Monday', 'dont miss out', '2019-12-10', '2019-12-11', '1'),
(3, 'Ernakulam', 'Kunnumpuram', 'Baby Protect', 'arg', '2020-02-28', '2020-03-02', '1');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE IF NOT EXISTS `vaccination` (
  `vac_id` int(100) NOT NULL AUTO_INCREMENT,
  `wrkr_id` int(100) DEFAULT NULL,
  `vac_name` varchar(50) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `posted_date` date DEFAULT NULL,
  `vaccination_date` date DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vac_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vaccination`
--

INSERT INTO `vaccination` (`vac_id`, `wrkr_id`, `vac_name`, `details`, `time`, `posted_date`, `vaccination_date`, `location`, `status`) VALUES
(1, 2, 'Polio', 'its for the babys who are in 3 months', '23:02', '2019-12-11', '2019-12-20', 'panchayath office', '1');

-- --------------------------------------------------------

--
-- Table structure for table `worker_reg`
--

CREATE TABLE IF NOT EXISTS `worker_reg` (
  `wrkr_id` int(100) NOT NULL AUTO_INCREMENT,
  `district` varchar(50) DEFAULT NULL,
  `panchayath` varchar(50) DEFAULT NULL,
  `worker_name` varchar(50) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `ward_no` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`wrkr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `worker_reg`
--

INSERT INTO `worker_reg` (`wrkr_id`, `district`, `panchayath`, `worker_name`, `phone_no`, `ward_no`, `address`, `email`, `qualification`) VALUES
(1, 'Ernakulam', 'Alangad', 'Megha', '9654854754', '12', 'aluva', 'megha@gmail.com', 'MCA'),
(2, 'Ernakulam', 'Karumalloor', 'meenu', '9947394641', '10', 'hgjkhkhk\r\noippppu', 'meenu@gmail.com', 'Bcom'),
(3, 'Ernakulam', 'Kunnumpuram', 'Anjana', '9541023678', '2', 'dertgh', 'anjana@gmail.com', 'BSc');
