-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 01, 2018 at 09:38 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `aid` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`aid`, `class_id`, `title`, `description`, `uploaded_by`, `uploaded_date`) VALUES
(1, 3, 'Test', 'On comming Monday', 9, '2017-03-24 05:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_tbl`
--

CREATE TABLE `assignment_tbl` (
  `assignment_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `docs` varchar(350) DEFAULT NULL,
  `uploaded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment_tbl`
--

INSERT INTO `assignment_tbl` (`assignment_id`, `class_id`, `subject_id`, `docs`, `uploaded_by`) VALUES
(1, 2, 1, 'Quiz.zip', 4),
(2, 4, 1, NULL, 3825),
(3, 3, 1, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `calender_class`
--

CREATE TABLE `calender_class` (
  `cid` int(11) NOT NULL,
  `date` date NOT NULL,
  `class_id` int(11) NOT NULL,
  `destails` varchar(250) NOT NULL,
  `uploaded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calender_school`
--

CREATE TABLE `calender_school` (
  `cid` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calender_school`
--

INSERT INTO `calender_school` (`cid`, `date`, `description`) VALUES
(1, '2016-12-29', 'nice ');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`) VALUES
(3, '9th'),
(4, 'dfedes');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `from_user` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` varchar(500) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `from_user`, `to_user`, `subject`, `body`, `date_time`) VALUES
(1, 9, 8, 'Welcome', 'Hii,', '2017-03-24 05:38:31'),
(2, 1, 8, 'hbjhjh', 'jhjllhk', '2018-04-01 07:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `student_tbl`
--

CREATE TABLE `student_tbl` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_class` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_tbl`
--

INSERT INTO `student_tbl` (`id`, `student_id`, `student_class`) VALUES
(1, 3, 2),
(2, 5, 2),
(3, 6, 3),
(4, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `class_id`, `subject_name`) VALUES
(1, 2, 'PHP'),
(3, 2, '.NET'),
(4, 3, 'd');

-- --------------------------------------------------------

--
-- Table structure for table `subject_assigned`
--

CREATE TABLE `subject_assigned` (
  `sid` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_tbl`
--

CREATE TABLE `teacher_tbl` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `teacher_class` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_tbl`
--

INSERT INTO `teacher_tbl` (`id`, `teacher_id`, `teacher_class`, `subject_id`) VALUES
(1, 4, 2, 1),
(2, 7, 3, 1),
(3, 9, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_attempt`
--

CREATE TABLE `test_attempt` (
  `tapid` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `answer` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_attempt`
--

INSERT INTO `test_attempt` (`tapid`, `test_id`, `qid`, `answer`, `status`, `user_id`) VALUES
(1, 1, 1, 'c', '0', 5),
(2, 1, 2, 'b', '0', 5),
(3, 1, 3, 'a', '0', 5),
(4, 1, 1, 'D', '0', 5),
(5, 1, 2, 'A', '0', 5),
(6, 1, 3, 'A', '0', 5),
(7, 1, 1, 'A', '0', 5),
(8, 1, 2, 'A', '0', 5),
(9, 1, 3, 'A', '0', 5),
(10, 1, 1, 'D', '0', 5),
(11, 1, 2, 'A', '0', 5),
(12, 1, 3, 'A', '0', 5),
(13, 2, 4, 'A', '0', 5),
(14, 1, 1, 'B', '0', 5),
(15, 1, 2, 'D', '0', 5),
(16, 1, 3, 'A', '0', 5),
(17, 3, 5, 'A', '0', 5),
(18, 3, 6, 'B', '0', 5),
(19, 1, 1, 'C', '0', 5),
(20, 1, 2, 'D', '0', 5),
(21, 1, 3, 'A', '0', 5),
(22, 5, 9, 'B', '0', 8),
(23, 5, 10, 'A', '0', 8),
(24, 6, 11, 'C', '0', 8),
(25, 6, 12, 'A', '0', 8),
(26, 2, 4, '0', '0', 8),
(27, 1, 1, 'B', '0', 8),
(28, 1, 2, 'A', '0', 8),
(29, 1, 3, 'C', '0', 8);

-- --------------------------------------------------------

--
-- Table structure for table `test_question`
--

CREATE TABLE `test_question` (
  `tq_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question` varchar(300) NOT NULL,
  `a` varchar(150) NOT NULL,
  `b` varchar(150) NOT NULL,
  `c` varchar(150) NOT NULL,
  `d` varchar(150) NOT NULL,
  `correct_ans` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_question`
--

INSERT INTO `test_question` (`tq_id`, `test_id`, `question`, `a`, `b`, `c`, `d`, `correct_ans`) VALUES
(1, 1, 'Shubham', '1', 'w', '3', '12', 'A'),
(2, 1, 'Shubham', '1', 'w', '3', '12', 'A'),
(3, 1, 'lolo`', '1', '1', '1', '1', 'A'),
(4, 2, 'ff', 'ff', 'd', 'd', 'd', 'd'),
(5, 3, 'd', 'd', 'f', 'd', 'a', 'a'),
(6, 3, 'd', 'f', 'k', 'kk', 'a', 'a'),
(7, 4, 'dd', 'd', 'kk', 'k', 'k', 'k'),
(8, 4, 'kmk', 'mk', 'k', 'kk', 'k', 'a'),
(9, 5, 'jj', 'j', 'j', 'j', 'j', 'a'),
(10, 5, 'kjn', 'nj', 'njn', 'jnj', 'nj', 'b'),
(11, 6, 'A?', '1', '', '', '', ''),
(12, 6, 'B?', '1', '2', '3', '4', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `test_tbl`
--

CREATE TABLE `test_tbl` (
  `test_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `quiz_name` varchar(220) NOT NULL,
  `uploaded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_tbl`
--

INSERT INTO `test_tbl` (`test_id`, `subject_id`, `quiz_name`, `uploaded_by`) VALUES
(1, 1, '1', 4),
(2, 1, 'ff', 0),
(3, 4, 'd', 3825),
(4, 1, 'cdfd', 0),
(5, 1, 'New', 7),
(6, 1, 'Test1', 9);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `user_full_name` varchar(150) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_contact` varchar(20) NOT NULL,
  `user_login_id` varchar(110) DEFAULT NULL,
  `user_password` varchar(220) NOT NULL,
  `user_role` enum('admin','teacher','student') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_full_name`, `user_email`, `user_contact`, `user_login_id`, `user_password`, `user_role`) VALUES
(1, 'Admin', 'admin@lms.com', '8556093704', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(8, 'Raja', 'ravdeeps@gmail.com', '9653406905', 'ravdeeps', 'c70903749ed556d98a4966fdfb9ccd04', 'student'),
(9, 'ravdeeps3', 'ravdees3@gmail.com', '9653406905', 'ravdeeps3', 'c70903749ed556d98a4966fdfb9ccd04', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `assignment_tbl`
--
ALTER TABLE `assignment_tbl`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `calender_class`
--
ALTER TABLE `calender_class`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `calender_school`
--
ALTER TABLE `calender_school`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `from` (`from_user`),
  ADD KEY `to` (`to_user`);

--
-- Indexes for table `student_tbl`
--
ALTER TABLE `student_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_class` (`student_class`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `subject_assigned`
--
ALTER TABLE `subject_assigned`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `teacher_tbl`
--
ALTER TABLE `teacher_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `teacher_class` (`teacher_class`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `test_attempt`
--
ALTER TABLE `test_attempt`
  ADD PRIMARY KEY (`tapid`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `test_question`
--
ALTER TABLE `test_question`
  ADD PRIMARY KEY (`tq_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `test_tbl`
--
ALTER TABLE `test_tbl`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `assignment_tbl`
--
ALTER TABLE `assignment_tbl`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `calender_class`
--
ALTER TABLE `calender_class`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calender_school`
--
ALTER TABLE `calender_school`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student_tbl`
--
ALTER TABLE `student_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subject_assigned`
--
ALTER TABLE `subject_assigned`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teacher_tbl`
--
ALTER TABLE `teacher_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `test_attempt`
--
ALTER TABLE `test_attempt`
  MODIFY `tapid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `test_question`
--
ALTER TABLE `test_question`
  MODIFY `tq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `test_tbl`
--
ALTER TABLE `test_tbl`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
