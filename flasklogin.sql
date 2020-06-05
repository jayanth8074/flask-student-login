-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2020 at 05:22 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flasklogin`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser` (IN `name` VARCHAR(100), IN `email` VARCHAR(100), IN `pass` TEXT)  MODIFIES SQL DATA
BEGIN
	INSERT INTO users (name,email,password)
VALUES (name,email,pass); 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `rollno` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `standard` int(3) NOT NULL,
  `percent` tinyint(4) NOT NULL,
  `remark` varchar(10) NOT NULL,
  `grade` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`rollno`, `email`, `standard`, `percent`, `remark`, `grade`) VALUES
(4, 'xyz@qwe.com', 1, 78, 'PASS', 'A'),
(4, 'xyz@qwe.com', 2, 78, 'PASS', 'A'),
(4, 'xyz@qwe.com', 3, 78, 'PASS', 'A'),
(15, 'rahul@gmail.com', 1, 87, 'PASS', 'A'),
(15, 'rahul@gmail.com', 2, 91, 'PASS', 'A'),
(15, 'rahul@gmail.com', 3, 75, 'PASS', 'B'),
(15, 'rahul@gmail.com', 4, 65, 'PASS', 'C'),
(5, 'hayden@hay.com', 1, 78, 'PASS', 'B'),
(5, 'hayden@hay.com', 2, 89, 'PASS', 'A'),
(5, 'hayden@hay.com', 3, 45, 'PASS', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `rollno` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `standard` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`rollno`, `name`, `email`, `password`, `standard`) VALUES
(5, 'Hayden Cordeiro', 'hayden@hay.com', 'hayden', 3),
(15, 'Rahul Mistry', 'rahul@gmail.com', 'rahul', 4),
(4, 'XYZ', 'xyz@qwe.com', 'xyz', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
