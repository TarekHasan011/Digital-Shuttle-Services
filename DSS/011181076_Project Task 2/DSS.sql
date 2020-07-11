-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2020 at 09:07 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dss`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` char(4) NOT NULL,
  `password` varchar(14) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_driver`
--

CREATE TABLE `attendance_driver` (
  `employee_id` char(7) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_regular_bus`
--

CREATE TABLE `attendance_regular_bus` (
  `username` char(9) NOT NULL,
  `date` date NOT NULL,
  `route` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_users`
--

CREATE TABLE `blocked_users` (
  `username` char(9) NOT NULL,
  `admin_id` char(4) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `complain_id` int(12) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`complain_id`, `category`) VALUES
(13, 'for sure'),
(13, 'no category'),
(21, 'it'),
(21, 'working'),
(22, 'tag'),
(22, 'tagggs'),
(22, 'tags'),
(24, 'hello'),
(24, 'world'),
(26, 'no serve'),
(26, 'serve'),
(27, 'ok'),
(27, 'okay'),
(28, 'it'),
(28, 'okay'),
(28, 'say'),
(28, 'will'),
(32, 'Driving'),
(32, 'Something'),
(32, 'Test'),
(32, 'Test 3');

-- --------------------------------------------------------

--
-- Table structure for table `checks_job_request`
--

CREATE TABLE `checks_job_request` (
  `job_request_email` varchar(50) NOT NULL,
  `admin_id` char(4) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `checks_user_requst`
--

CREATE TABLE `checks_user_requst` (
  `student_id` char(9) NOT NULL,
  `admin_id` char(4) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `check_id_activation_request`
--

CREATE TABLE `check_id_activation_request` (
  `employee_id` char(7) NOT NULL,
  `admin_id` char(4) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `complain_id` int(12) NOT NULL,
  `username` char(9) NOT NULL,
  `content` varchar(600) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complain`
--

INSERT INTO `complain` (`complain_id`, `username`, `content`, `date_time`) VALUES
(13, '011171224', 'Lots of complains', '2020-05-21 12:14:53'),
(21, '011171224', 'ohh complain', '2020-05-21 18:35:27'),
(22, '011181076', 'new complain', '2020-05-22 09:51:22'),
(24, '011181076', 'Hello', '2020-05-22 09:52:29'),
(26, '011181076', 'no no no no', '2020-05-22 14:02:32'),
(27, '011181076', 'hi there', '2020-05-22 14:04:17'),
(28, '011171224', 'checking notification box', '2020-05-22 15:06:11'),
(32, '011181076', 'Testing Complain Part 1 Part 2', '2020-05-25 18:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `employee_id` char(7) NOT NULL,
  `password` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `holiday_request`
--

CREATE TABLE `holiday_request` (
  `request_id` int(12) NOT NULL,
  `employee_id` char(7) NOT NULL,
  `content` varchar(300) NOT NULL,
  `decision` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `id_activation_request`
--

CREATE TABLE `id_activation_request` (
  `employee_id` char(7) NOT NULL,
  `copy_of_id` blob NOT NULL,
  `request_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `job_request`
--

CREATE TABLE `job_request` (
  `email` varchar(50) NOT NULL,
  `NID` varchar(13) NOT NULL,
  `license_number` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `request_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification_driver`
--

CREATE TABLE `notification_driver` (
  `notification_no` int(12) NOT NULL,
  `employee_id` char(7) NOT NULL,
  `content` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification_user`
--

CREATE TABLE `notification_user` (
  `notification_number` int(12) NOT NULL,
  `username` char(9) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification_user`
--

INSERT INTO `notification_user` (`notification_number`, `username`, `content`, `date_time`) VALUES
(1, '011181076', 'Your complaint has been recorded. We will consider the issue. Sorry for the bad experience', '2020-05-22 14:02:32'),
(3, '011181076', 'Your complaint has been recorded. We will consider the issue. Sorry for the bad experience', '2020-05-22 14:04:17'),
(4, '011171224', 'Your complaint has been recorded. We will consider the issue. Sorry for the bad experience', '2020-05-22 14:15:35'),
(5, '011181076', 'Your complaint has been recorded. We will consider the issue. Sorry for the bad experience', '2020-05-23 10:08:42'),
(6, '011181076', 'Your complaint has been recorded. We will consider the issue. Sorry for the bad experience', '2020-05-23 20:10:47'),
(7, '011181076', 'Your complaint has been recorded. We will consider the issue. Sorry for the bad experience', '2020-05-23 20:14:29'),
(8, '011181076', 'Your complaint has been recorded. We will consider the issue. Sorry for the bad experience', '2020-05-25 18:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_no` int(12) NOT NULL,
  `username` char(9) NOT NULL,
  `transaction_id` int(10) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permits_driver`
--

CREATE TABLE `permits_driver` (
  `employee_id` char(7) NOT NULL,
  `admin_id` char(4) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permits_user`
--

CREATE TABLE `permits_user` (
  `username` char(9) NOT NULL,
  `admin_id` char(4) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_number_driver`
--

CREATE TABLE `phone_number_driver` (
  `number` varchar(15) NOT NULL,
  `employee_id` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_number_job_request`
--

CREATE TABLE `phone_number_job_request` (
  `number` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_number_student`
--

CREATE TABLE `phone_number_student` (
  `phone_number` varchar(15) NOT NULL,
  `student_id` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registered_driver`
--

CREATE TABLE `registered_driver` (
  `employee_id` char(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `DOB` date NOT NULL,
  `photo` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `NID` varchar(13) NOT NULL,
  `license_number` varchar(20) NOT NULL,
  `hire_date` date NOT NULL,
  `postal_code` int(6) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registered_student`
--

CREATE TABLE `registered_student` (
  `student_id` char(9) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `DOB` date NOT NULL,
  `photo` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `batch` varchar(3) NOT NULL,
  `Department` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `regular_bus_service`
--

CREATE TABLE `regular_bus_service` (
  `username` char(9) NOT NULL,
  `registration_no` int(12) NOT NULL,
  `route` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shuttle_service`
--

CREATE TABLE `shuttle_service` (
  `username` char(9) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` char(9) NOT NULL,
  `password` varchar(14) NOT NULL,
  `current_balance` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `current_balance`) VALUES
('011171224', 'sojib', 0),
('011181076', 'tarek', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_id_request`
--

CREATE TABLE `user_id_request` (
  `student_id` char(9) NOT NULL,
  `copy_of_id` blob NOT NULL,
  `request_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attendance_driver`
--
ALTER TABLE `attendance_driver`
  ADD PRIMARY KEY (`employee_id`,`date`),
  ADD KEY `FKattendance124993` (`employee_id`);

--
-- Indexes for table `attendance_regular_bus`
--
ALTER TABLE `attendance_regular_bus`
  ADD PRIMARY KEY (`username`,`date`),
  ADD KEY `FKattendance374560` (`username`);

--
-- Indexes for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `FKblocked_us130060` (`admin_id`),
  ADD KEY `FKblocked_us105283` (`username`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`complain_id`,`category`),
  ADD KEY `FKcategory99984` (`complain_id`);

--
-- Indexes for table `checks_job_request`
--
ALTER TABLE `checks_job_request`
  ADD PRIMARY KEY (`job_request_email`),
  ADD KEY `FKchecks_job17451` (`admin_id`),
  ADD KEY `FKchecks_job724333` (`job_request_email`);

--
-- Indexes for table `checks_user_requst`
--
ALTER TABLE `checks_user_requst`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `FKchecks_use824949` (`admin_id`),
  ADD KEY `FKchecks_use232802` (`student_id`);

--
-- Indexes for table `check_id_activation_request`
--
ALTER TABLE `check_id_activation_request`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `FKcheck_id_a255922` (`employee_id`),
  ADD KEY `FKcheck_id_a17349` (`admin_id`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`complain_id`),
  ADD KEY `FKcomplain278087` (`username`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `holiday_request`
--
ALTER TABLE `holiday_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `FKholiday_re343381` (`employee_id`);

--
-- Indexes for table `id_activation_request`
--
ALTER TABLE `id_activation_request`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `FKid_activat286134` (`employee_id`);

--
-- Indexes for table `job_request`
--
ALTER TABLE `job_request`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `NID` (`NID`),
  ADD UNIQUE KEY `license_number` (`license_number`);

--
-- Indexes for table `notification_driver`
--
ALTER TABLE `notification_driver`
  ADD PRIMARY KEY (`notification_no`),
  ADD KEY `FKnotificati738669` (`employee_id`);

--
-- Indexes for table `notification_user`
--
ALTER TABLE `notification_user`
  ADD PRIMARY KEY (`notification_number`),
  ADD KEY `FKnotificati713053` (`username`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_no`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `FKpayment510245` (`username`);

--
-- Indexes for table `permits_driver`
--
ALTER TABLE `permits_driver`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `FKpermits_dr860603` (`admin_id`),
  ADD KEY `FKpermits_dr356237` (`employee_id`);

--
-- Indexes for table `permits_user`
--
ALTER TABLE `permits_user`
  ADD PRIMARY KEY (`username`),
  ADD KEY `FKpermits_us15327` (`admin_id`),
  ADD KEY `FKpermits_us720920` (`username`);

--
-- Indexes for table `phone_number_driver`
--
ALTER TABLE `phone_number_driver`
  ADD PRIMARY KEY (`number`),
  ADD KEY `FKphone_numb733156` (`employee_id`);

--
-- Indexes for table `phone_number_job_request`
--
ALTER TABLE `phone_number_job_request`
  ADD PRIMARY KEY (`number`),
  ADD KEY `FKphone_numb62491` (`email`);

--
-- Indexes for table `phone_number_student`
--
ALTER TABLE `phone_number_student`
  ADD PRIMARY KEY (`phone_number`),
  ADD KEY `FKphone_numb885897` (`student_id`);

--
-- Indexes for table `registered_driver`
--
ALTER TABLE `registered_driver`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `NID` (`NID`),
  ADD UNIQUE KEY `license_number` (`license_number`);

--
-- Indexes for table `registered_student`
--
ALTER TABLE `registered_student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `regular_bus_service`
--
ALTER TABLE `regular_bus_service`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `registration_no` (`registration_no`),
  ADD KEY `FKregular_bu328366` (`username`);

--
-- Indexes for table `shuttle_service`
--
ALTER TABLE `shuttle_service`
  ADD PRIMARY KEY (`username`),
  ADD KEY `FKshuttle_se686087` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_id_request`
--
ALTER TABLE `user_id_request`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `FKuser_id_re264365` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `complain_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `holiday_request`
--
ALTER TABLE `holiday_request`
  MODIFY `request_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_driver`
--
ALTER TABLE `notification_driver`
  MODIFY `notification_no` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_user`
--
ALTER TABLE `notification_user`
  MODIFY `notification_number` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_no` int(12) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_driver`
--
ALTER TABLE `attendance_driver`
  ADD CONSTRAINT `FKattendance124993` FOREIGN KEY (`employee_id`) REFERENCES `driver` (`employee_id`);

--
-- Constraints for table `attendance_regular_bus`
--
ALTER TABLE `attendance_regular_bus`
  ADD CONSTRAINT `FKattendance374560` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD CONSTRAINT `FKblocked_us105283` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `FKblocked_us130060` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKcategory99984` FOREIGN KEY (`complain_id`) REFERENCES `complain` (`complain_id`);

--
-- Constraints for table `checks_job_request`
--
ALTER TABLE `checks_job_request`
  ADD CONSTRAINT `FKchecks_job17451` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `FKchecks_job724333` FOREIGN KEY (`job_request_email`) REFERENCES `job_request` (`email`);

--
-- Constraints for table `checks_user_requst`
--
ALTER TABLE `checks_user_requst`
  ADD CONSTRAINT `FKchecks_use232802` FOREIGN KEY (`student_id`) REFERENCES `user_id_request` (`student_id`),
  ADD CONSTRAINT `FKchecks_use824949` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `check_id_activation_request`
--
ALTER TABLE `check_id_activation_request`
  ADD CONSTRAINT `FKcheck_id_a17349` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `FKcheck_id_a255922` FOREIGN KEY (`employee_id`) REFERENCES `id_activation_request` (`employee_id`);

--
-- Constraints for table `complain`
--
ALTER TABLE `complain`
  ADD CONSTRAINT `FKcomplain278087` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `holiday_request`
--
ALTER TABLE `holiday_request`
  ADD CONSTRAINT `FKholiday_re343381` FOREIGN KEY (`employee_id`) REFERENCES `driver` (`employee_id`);

--
-- Constraints for table `id_activation_request`
--
ALTER TABLE `id_activation_request`
  ADD CONSTRAINT `FKid_activat286134` FOREIGN KEY (`employee_id`) REFERENCES `registered_driver` (`employee_id`);

--
-- Constraints for table `notification_driver`
--
ALTER TABLE `notification_driver`
  ADD CONSTRAINT `FKnotificati738669` FOREIGN KEY (`employee_id`) REFERENCES `driver` (`employee_id`);

--
-- Constraints for table `notification_user`
--
ALTER TABLE `notification_user`
  ADD CONSTRAINT `FKnotificati713053` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FKpayment510245` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `permits_driver`
--
ALTER TABLE `permits_driver`
  ADD CONSTRAINT `FKpermits_dr356237` FOREIGN KEY (`employee_id`) REFERENCES `driver` (`employee_id`),
  ADD CONSTRAINT `FKpermits_dr860603` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `permits_user`
--
ALTER TABLE `permits_user`
  ADD CONSTRAINT `FKpermits_us15327` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `FKpermits_us720920` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `phone_number_driver`
--
ALTER TABLE `phone_number_driver`
  ADD CONSTRAINT `FKphone_numb733156` FOREIGN KEY (`employee_id`) REFERENCES `registered_driver` (`employee_id`);

--
-- Constraints for table `phone_number_job_request`
--
ALTER TABLE `phone_number_job_request`
  ADD CONSTRAINT `FKphone_numb62491` FOREIGN KEY (`email`) REFERENCES `job_request` (`email`);

--
-- Constraints for table `phone_number_student`
--
ALTER TABLE `phone_number_student`
  ADD CONSTRAINT `FKphone_numb885897` FOREIGN KEY (`student_id`) REFERENCES `registered_student` (`student_id`);

--
-- Constraints for table `regular_bus_service`
--
ALTER TABLE `regular_bus_service`
  ADD CONSTRAINT `FKregular_bu328366` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `shuttle_service`
--
ALTER TABLE `shuttle_service`
  ADD CONSTRAINT `FKshuttle_se686087` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `user_id_request`
--
ALTER TABLE `user_id_request`
  ADD CONSTRAINT `FKuser_id_re264365` FOREIGN KEY (`student_id`) REFERENCES `registered_student` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
