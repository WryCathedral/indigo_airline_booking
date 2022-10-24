-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2022 at 06:38 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indigo-airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `fid` varchar(10) NOT NULL,
  `rid` int(11) NOT NULL,
  `dep_time` varchar(20) DEFAULT NULL,
  `arr_time` varchar(20) DEFAULT NULL,
  `dep_date` varchar(20) DEFAULT NULL,
  `arr_date` varchar(20) DEFAULT NULL,
  `total_seats` varchar(20) DEFAULT NULL,
  `seats_available` varchar(20) DEFAULT NULL,
  `eco_amt` varchar(10) DEFAULT NULL,
  `buss_amt` varchar(10) DEFAULT NULL,
  `first_amt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`fid`, `rid`, `dep_time`, `arr_time`, `dep_date`, `arr_date`, `total_seats`, `seats_available`, `eco_amt`, `buss_amt`, `first_amt`) VALUES
('101', 4, '15:00', '18:00', '20-10-2022', '20-10-2022', '10', '4', '3347', '4529', '5534'),
('102', 2, '13:00', '16:00', '28-10-2022', '28-10-2022', '5', '1', '2947', '3584', '4831'),
('103', 1, '12:00', '14:00', '25-01-2022', '25-01-2022', '15', '11', '1508', '2023', '3176'),
('104', 3, '8:00', '13:00', '26-10-2022', '26-10-2022', '16', '8', '2572', '4965', '7588'),
('105', 5, '9:00', '12:00', '27-10-2022', '27-10-2022', '20', '15', '2397', '5495', '6927'),
('106', 6, '10:00', '14:00', '29-11-2022', '29-11-2022', '12', '2', '2840', '4507', '7207'),
('107', 7, '13:00', '16:00', '30-10-2022', '30-10-2022', '8', '8', '2969', '5039', '7945'),
('108', 8, '18:00', '12:00', '21-10-2022', '22-10-2022', '22', '15', '1873', '5850', '6788'),
('109', 6, '12:00', '16:00', '29-10-2022', '29-10-2022', '13', '5', '2619', '5006', '6825'),
('110', 6, '16:00', '20:00', '29-10-2022', '29-10-2022', '10', '5', '2509', '4723', '6906'),
('111', 6, '16:00', '20:00', '29-10-2022', '29-10-2022', '10', '0', '1576', '5068', '7921'),
('112', 8, '13:35', '15:25', '01-02-2022', '01-02-2022', '10', '10', '1819', '4677', '6516'),
('113', 6, '12:40', '14:00', '01-03-2022', '01-03-2022', '14', '9', '2160', '4042', '7334'),
('114', 6, '12:40', '14:00', '01-04-2022', '01-04-2022', '16', '13', '2231', '3495', '6776'),
('115', 4, '12:40', '14:00', '02-04-2022', '02-04-2022', '16', '13', '1944', '4829', '7081'),
('116', 7, '11:40', '12:00', '02-05-2022', '02-05-2022', '16', '13', '2298', '5259', '7987'),
('117', 8, '8:40', '12:00', '08-08-2022', '08-08-2022', '18', '13', '2867', '4139', '7033');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `cid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`cid`, `name`, `age`, `email`, `address`, `contact_no`) VALUES
(201, 'Gourav', 20, 'gouravpragvamsa12112002@gmail.com', 'VSKP', '9347324874'),
(202, 'Pragvamsa', 25, 'pragvamsa12@gmail.com', 'HYD', '9347324874'),
(203, 'Venkat', 20, 'venkatsaigulipalli@gmail.com', 'DEL', '8125446299'),
(204, 'Sai', 23, 'sai69@gmail.com', 'HYD', '8639363471'),
(205, 'Ram', 22, 'Ram420@gmail.com', 'BLR', '987654321'),
(206, 'Praveen', 24, 'seera96@gmail.com', 'MUM', '9063260629'),
(207, 'kartikeya', 26, 'karti150@gmail.com', 'CHE', '8745632191'),
(208, 'Harshith', 25, 'harshdeep123@gmail.com', 'VSKP', '5236147896'),
(210, 'Venkat', 19, 'venkat@gmail.com', '6-535/4, xyz colony', '9999999999'),
(211, 'Anusha', 24, 'Anu1234@gmail.com', 'VSKP', '9110355164'),
(212, 'Swetha', 30, 'Swetha123@gmail.com', 'HYD', '9494575159'),
(214, 'jaswanth', 24, 'jessipaul@gmail.com', 'AND', '9849815725'),
(216, 'Gp', 27, 'gpgp@gmail.com', 'DEL', '9347324874'),
(217, 'rmesh', 23, 'ramesh374@gmail.com', '7-149/2, ravindra na', '9247891858'),
(218, 'kartikeya vns', 19, 'kartikeya123@gmail.com', 'kbfbuidg', '9876543210'),
(219, 'santosh', 19, 'hikjl', 'bbbbbj', ''),
(220, 'venkat sai', 19, 'vgulipal@gitam.in', '6-361/2, ravindra nagar', '8125446299'),
(221, 'seera praveen', 20, 'seerapraveen8@gmail.com', 'fhcggdx', '9063260629'),
(222, 'anjesh', 19, 'anjeshvarmadatla@gmail.com', 'jgjkh', '6300739969'),
(223, 'thammi reddy', 35, 'tkonala@gitam.edu', 'vskp', '9848027456'),
(224, 'Vishnu Vardhan', 20, 'spasumar@gitam.in', 'hxjdbxuybdveg', '8499895219');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `rid` int(11) NOT NULL,
  `from_city` varchar(20) DEFAULT NULL,
  `to_city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`rid`, `from_city`, `to_city`) VALUES
(1, 'visakhapatnam', 'hyderabad'),
(2, 'goa', 'visakhapatnam'),
(3, 'hyderabad', 'bengaluru'),
(4, 'visakhapatnam', 'goa'),
(5, 'hyderabad', 'delhi'),
(6, 'bengaluru', 'goa'),
(7, 'hyderabad', 'visakhapatnam'),
(8, 'bengaluru', 'hyderabad'),
(9, 'delhi', 'hyderabad'),
(10, 'goa', 'bengaluru'),
(11, 'vijayawada', 'visakhapatnam'),
(12, 'visakhapatnam', 'vijayawada');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `tid` varchar(10) NOT NULL,
  `cid` int(11) NOT NULL,
  `fid` varchar(10) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `refreshments` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`tid`, `cid`, `fid`, `class`, `payment_method`, `refreshments`) VALUES
('301', 201, '101', 'Economy', 'debit-card', 'No'),
('302', 201, '102', 'Economy', 'debit-card', 'No'),
('303', 201, '101', 'First', 'Credit-card', 'yes'),
('304', 206, '101', 'Economy', 'Credit-card', 'yes'),
('305', 207, '101', 'Business', 'Net banking', 'Yes'),
('306', 208, '102', 'Business', 'Credit-card', 'Yes'),
('307', 203, '101', 'First', 'Net banking', 'Yes'),
('308', 211, '103', 'Business', 'UPI', 'No'),
('309', 212, '103', 'First', 'Debit-card', 'No'),
('310', 214, '103', 'Business', 'Debit-card', 'No'),
('311', 216, '102', 'Business', 'Net banking', 'Yes'),
('312', 217, '109', 'Business', 'Net banking', 'Yes'),
('313', 218, '102', 'Economy', 'UPI', 'No'),
('314', 219, '101', 'First', 'Credit-card', 'Yes'),
('315', 220, '110', 'Business', 'Credit-card', 'Yes'),
('316', 221, '110', 'First', 'UPI', 'No'),
('317', 222, '109', 'First', 'UPI', 'No'),
('318', 223, '110', 'Business', 'UPI', 'No'),
('319', 224, '101', 'Business', 'UPI', 'No');

--
-- Triggers `ticket`
--
DELIMITER $$
CREATE TRIGGER `booking_seats` AFTER INSERT ON `ticket` FOR EACH ROW if new.tid!=0 then update flight f set f.seats_available=f.seats_available-1 where f.fid=new.fid;
end if
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `incrementing` BEFORE INSERT ON `ticket` FOR EACH ROW if new.tid=0 then set new.tid=(select max(tid) from ticket)+1;
end if
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `no_refreshments` BEFORE INSERT ON `ticket` FOR EACH ROW if new.payment_method='Debit-card' or new.payment_method='UPI' then set new.refreshments='No';
end if
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `refreshments` BEFORE INSERT ON `ticket` FOR EACH ROW if new.payment_method='Credit-card' or new.payment_method='Net banking' then set new.refreshments='Yes';
end if
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `fid` (`fid`),
  ADD KEY `ticket_ibfk_1` (`cid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `route` (`rid`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `passenger` (`cid`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `flight` (`fid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
