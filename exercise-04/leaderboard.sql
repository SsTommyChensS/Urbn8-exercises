/*SQL Statement: list first 10 students with highest marks of any subject*/
SELECT g.st_id, st.st_name, MAX(g.marks) as hg_marks, sub.sub_name 
FROM grade g, student st, subject sub 
WHERE g.st_id = st.st_id AND g.sub_code = sub.sub_code 
GROUP BY g.st_id 
ORDER BY hg_marks DESC 
LIMIT 10;

/*Demo example using MySQL*/

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2022 at 10:55 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leaderboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` varchar(5) NOT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `dept_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_location`) VALUES
('de_01', 'Developer', NULL),
('de_02', 'System Admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `st_id` varchar(5) NOT NULL,
  `sub_code` varchar(5) NOT NULL,
  `exam_name` varchar(50) DEFAULT NULL,
  `marks` int(2) NOT NULL,
  `gpa` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`st_id`, `sub_code`, `exam_name`, `marks`, `gpa`) VALUES
('id_01', 'su_01', NULL, 10, NULL),
('id_01', 'su_02', NULL, 10, NULL),
('id_01', 'su_05', NULL, 9, NULL),
('id_01', 'su_06', NULL, 7, NULL),
('id_02', 'su_01', NULL, 10, NULL),
('id_02', 'su_02', NULL, 6, NULL),
('id_02', 'su_03', NULL, 8, NULL),
('id_03', 'su_01', NULL, 7, NULL),
('id_03', 'su_04', NULL, 4, NULL),
('id_03', 'su_06', NULL, 5, NULL),
('id_04', 'su_01', NULL, 10, NULL),
('id_04', 'su_04', NULL, 9, NULL),
('id_04', 'su_06', NULL, 4, NULL),
('id_05', 'su_02', NULL, 9, NULL),
('id_05', 'su_03', NULL, 10, NULL),
('id_05', 'su_06', '', 10, NULL),
('id_06', 'su_01', NULL, 9, NULL),
('id_06', 'su_05', NULL, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `st_id` varchar(5) NOT NULL,
  `st_name` varchar(50) NOT NULL,
  `st_address` varchar(50) DEFAULT NULL,
  `st_email` varchar(50) DEFAULT NULL,
  `st_cellNo` int(13) DEFAULT NULL,
  `dept_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`st_id`, `st_name`, `st_address`, `st_email`, `st_cellNo`, `dept_id`) VALUES
('id_01', 'Tommy', NULL, NULL, NULL, 'de_01'),
('id_02', 'John', NULL, NULL, NULL, 'de_01'),
('id_03', 'Britney', NULL, NULL, NULL, 'de_02'),
('id_04', 'Clever', NULL, NULL, NULL, 'de_02'),
('id_05', 'Daisy', NULL, NULL, NULL, 'de_01'),
('id_06', 'Dave', NULL, NULL, NULL, 'de_02');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sub_code` varchar(5) NOT NULL,
  `sub_name` varchar(50) NOT NULL,
  `crd_hrs` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_code`, `sub_name`, `crd_hrs`) VALUES
('su_01', 'Math', NULL),
('su_02', 'English', NULL),
('su_03', 'Music', NULL),
('su_04', 'History', NULL),
('su_05', 'Geography', NULL),
('su_06', 'Chemistry', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`st_id`,`sub_code`),
  ADD KEY `fk_sub_code` (`sub_code`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`st_id`),
  ADD KEY `fk_dept_id` (`dept_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sub_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `fk_stu_id` FOREIGN KEY (`st_id`) REFERENCES `student` (`st_id`),
  ADD CONSTRAINT `fk_sub_code` FOREIGN KEY (`sub_code`) REFERENCES `subject` (`sub_code`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


