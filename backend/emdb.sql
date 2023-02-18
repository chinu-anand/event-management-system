-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2023 at 08:21 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `event_date` varchar(100) DEFAULT NULL,
  `organizer_mail` varchar(100) DEFAULT NULL,
  `organizer_phone` varchar(12) DEFAULT NULL,
  `event_description` text DEFAULT NULL,
  `event_type` varchar(100) DEFAULT NULL,
  `event_location` varchar(20) DEFAULT NULL,
  `event_status` varchar(10) DEFAULT NULL,
  `max_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_date`, `organizer_mail`, `organizer_phone`, `event_description`, `event_type`, `event_location`, `event_status`, `max_seats`) VALUES
(1001, 'Music Festival', '12-Mar-23', 'musicfest@gmail.com', '022-251678', 'A weekend to indulge in warm music with amazing artists and lip-smacking food', 'On-Premise', 'Mumbai', 'Live', 250),
(1002, 'Business Conference', '17-Apr-23', 'nyc.co@gmail.com', '044-781209', 'This conference is held to discuss new trends and opportunities pertaining to the business', 'Virtual', 'Zoom', 'Scheduled', 80),
(1003, 'Hip Hop Beginners Class', '2-Feb-23', 'danceguru@gmail.com', '011-457631', 'What you will learn Confidently step into a beginners Hip Hop class and understand the movements', 'On-Premise', 'Delhi', 'Completed', 100),
(1004, 'Art & Craft  Workshop', '20-Mar-23', 'craftsshop@gmail.com', '033-892561', 'Learn the layering technique in poster colours. It is a 3-layer painting which has a combination of brush painting and blending method', 'Virtual', 'Zoom', 'Scheduled', 50),
(1005, 'Book Reading Festival\r\n', '19-May-23\r\n', 'readingfest@gmail.com\r\n', '141-378954', 'A reading festival is a gathering that focuses on celebrating all aspects of books and reading\r\n', 'On-Premise\r\n', 'Jaipur', 'Live', 500),
(1006, 'State Chess Championship\r\n', '15-Apr-23\r\n', 'chesschamp@gmail.com\r\n', '011-190258', 'We have designed State Chess Championship to celebrate and cherish Indian love and passion for the game\r\n', 'On-Premise\r\n', 'Delhi', 'Scheduled', 40),
(1007, 'Open Mic\r\n', '25-Mar-23\r\n', 'laughstore@gmail.com\r\n', '022-674381', 'The Laugh Store is giving an opportunity to newe and emerging comedians to try out new material at our open mic\r\n', 'On-Premise\r\n', 'Mumbai', 'Live', 50),
(1008, 'Sudoku Championship\r\n', '17-Feb-23\r\n', 'sudoku_2023@gmail.com\r\n', '020-892347', 'The championship follows the same rule as Sudoku, and  will have 2 rounds Round 1 \"Qualifier\" and Round 2 \"Finals\".\r\n', 'Virtual\r\n', 'Watsapp', 'Cancelled', 50);

-- --------------------------------------------------------

--
-- Table structure for table `participents`
--

CREATE TABLE `participents` (
  `book_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `booked_date` varchar(100) DEFAULT NULL,
  `participent_name` varchar(50) DEFAULT NULL,
  `participent_email` varchar(50) DEFAULT NULL,
  `participent_phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participents`
--

INSERT INTO `participents` (`book_id`, `event_id`, `booked_date`, `participent_name`, `participent_email`, `participent_phone`) VALUES
(201, 1001, '5-Feb-23', 'Sumit Kumar', 'sumit.1291@gmail.com', '9236701267'),
(202, 1005, '20-Jan-23', 'Harshika Chaturvedi', 'harshika_chaturvedi@gmail.com', '9207417841'),
(203, 1003, '12-Jan-23', 'Shikha Sinha', 'shikha1990@gmail.com', '9812087410'),
(205, 1002, '22-Jan-23', 'Supriya Aggarhari', 'supriya_1520@gmail.com', '9340928637'),
(206, 1004, '12-Feb-23', 'Prateek Mathur', 'prateek.mathur@gmail.com', '9271648910'),
(207, 1005, '10-Feb-23', 'Himanshu Singh', 'himanshu1989@gmail.com', '9517810946'),
(208, 1006, '15-Feb-23', 'Shuchita Jain', 'shuchi_jain1991@gmail.com', '9104826121'),
(209, 1008, '31-Jan-23', 'Rajeev Saxena', 'rajeev_saxena@gmail.com', '9654126718'),
(210, 1007, '7-Feb-23', 'Navin Kumar', 'navin_kumar_19@gmail.com', '9540623913'),
(211, 1001, '2-Feb-23', 'Manish Srivastava', 'manish_sri_17@gmail.com', '9271849011'),
(212, 1003, '18-Jan-23', 'Nikhil Arora', 'nikhil.arora@gmail.com', '9983667102'),
(213, 1004, '28-Jan-23', 'Aman Gupta', 'aman_gupta8@gmail.com', '9836167321'),
(214, 1005, '17-Feb-23', 'Harsh Gujral', 'harsh.gujral@gmail.com', '9319287661'),
(215, 1007, '13-Feb-23', 'Kulpreet Singh', 'kulpreet_singh@gmail.com', '9827649174'),
(216, 1002, '17-Feb-23', 'Naseem Khan', 'nassem_khan@gmail.com', '9671535418'),
(217, 1008, '2-Feb-23', 'Nandini Kapoor', 'nandini_kapoor12@gmail.com', '9180763892'),
(218, 1003, '8-Jan-23', 'Pooja Gupta', 'pooja_g1408@gmail.com', '9401987364');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `participents`
--
ALTER TABLE `participents`
  ADD PRIMARY KEY (`book_id`) USING BTREE,
  ADD KEY `event_id` (`event_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participents`
--
ALTER TABLE `participents`
  ADD CONSTRAINT `participents_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
