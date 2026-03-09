-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2026 at 10:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `work_date` date NOT NULL,
  `checkin_time` time DEFAULT NULL,
  `checkin_lat` decimal(10,7) DEFAULT NULL,
  `checkin_lng` decimal(10,7) DEFAULT NULL,
  `checkin_photo` varchar(200) DEFAULT NULL,
  `checkout_time` time DEFAULT NULL,
  `checkout_lat` decimal(10,7) DEFAULT NULL,
  `checkout_lng` decimal(10,7) DEFAULT NULL,
  `checkout_photo` varchar(200) DEFAULT NULL,
  `ot_checkin_time` time DEFAULT NULL,
  `ot_checkin_lat` decimal(10,7) DEFAULT NULL,
  `ot_checkin_lng` decimal(10,7) DEFAULT NULL,
  `ot_checkin_photo` varchar(200) DEFAULT NULL,
  `ot_checkout_time` time DEFAULT NULL,
  `ot_checkout_lat` decimal(10,7) DEFAULT NULL,
  `ot_checkout_lng` decimal(10,7) DEFAULT NULL,
  `ot_checkout_photo` varchar(200) DEFAULT NULL,
  `status` enum('present','absent','leave','holiday') NOT NULL DEFAULT 'present',
  `notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Daily attendance records with geo & photo per action';

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `work_date`, `checkin_time`, `checkin_lat`, `checkin_lng`, `checkin_photo`, `checkout_time`, `checkout_lat`, `checkout_lng`, `checkout_photo`, `ot_checkin_time`, `ot_checkin_lat`, `ot_checkin_lng`, `ot_checkin_photo`, `ot_checkout_time`, `ot_checkout_lat`, `ot_checkout_lng`, `ot_checkout_photo`, `status`, `notes`, `created_at`) VALUES
(1, 2, '2026-02-28', '08:02:14', -6.2088000, 106.8456000, NULL, '17:05:30', -6.2088000, 106.8456000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(2, 2, '2026-03-01', '07:58:44', -6.2090000, 106.8458000, NULL, '17:01:12', -6.2090000, 106.8458000, NULL, '18:00:00', -6.2090000, 106.8458000, NULL, '20:30:00', -6.2090000, 106.8458000, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(3, 2, '2026-03-02', '08:10:05', -6.2085000, 106.8452000, NULL, '17:15:22', -6.2085000, 106.8452000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(4, 2, '2026-03-03', '08:00:00', -6.2088000, 106.8456000, NULL, '17:00:00', -6.2088000, 106.8456000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(5, 2, '2026-03-04', '07:55:30', -6.2091000, 106.8460000, NULL, '17:02:45', -6.2091000, 106.8460000, NULL, '18:15:00', -6.2091000, 106.8460000, NULL, '21:00:00', -6.2091000, 106.8460000, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(6, 2, '2026-03-05', '08:05:18', -6.2088000, 106.8456000, NULL, '17:08:33', -6.2088000, 106.8456000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(7, 3, '2026-03-01', '08:15:00', -6.2100000, 106.8470000, NULL, '17:20:00', -6.2100000, 106.8470000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(8, 3, '2026-03-02', '08:08:22', -6.2100000, 106.8470000, NULL, '17:10:15', -6.2100000, 106.8470000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(9, 3, '2026-03-04', '08:01:55', -6.2100000, 106.8470000, NULL, '17:05:00', -6.2100000, 106.8470000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13'),
(10, 3, '2026-03-05', '08:00:00', -6.2100000, 106.8470000, NULL, '17:00:00', -6.2100000, 106.8470000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'present', NULL, '2026-03-06 09:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(120) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Secure password-reset tokens (expire after 1 hour)';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'bcrypt hash',
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `phone` varchar(30) DEFAULT NULL,
  `department` varchar(80) DEFAULT NULL,
  `profile_pic` varchar(200) DEFAULT NULL COMMENT 'filename in /uploads/',
  `work_start` time DEFAULT NULL COMMENT 'Shift start time e.g. 08:00:00',
  `work_end` time DEFAULT NULL COMMENT 'Shift end time e.g. 17:00:00',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Employee accounts';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `phone`, `department`, `profile_pic`, `work_start`, `work_end`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@attendtrack.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', '', 'Management', NULL, '08:30:00', '17:30:00', 1, '2026-03-06 09:06:13', '2026-03-06 16:07:37'),
(2, 'john_doe', 'john.doe@company.com', '$2y$10$TKh8H1.PfuA38Xe.aMtGtOQl8g/l4RVNRSO1Z3DBNZ9MUu4GnuUa', 'user', '+62 812-0001-0001', 'Engineering', NULL, '08:00:00', '17:00:00', 1, '2026-03-06 09:06:13', '2026-03-06 09:06:13'),
(3, 'jane_smith', 'jane.smith@company.com', '$2y$10$TKh8H1.PfuA38Xe.aMtGtOQl8g/l4RVNRSO1Z3DBNZ9MUu4GnuUa', 'user', '+62 812-0001-0002', 'Marketing', NULL, '08:00:00', '17:00:00', 1, '2026-03-06 09:06:13', '2026-03-06 09:06:13'),
(4, 'ali_rahman', 'ali.rahman@company.com', '$2y$10$TKh8H1.PfuA38Xe.aMtGtOQl8g/l4RVNRSO1Z3DBNZ9MUu4GnuUa', 'user', '+62 812-0001-0003', 'Finance', NULL, '09:00:00', '18:00:00', 1, '2026-03-06 09:06:13', '2026-03-06 09:06:13'),
(5, 'siti_nurhaliza', 'siti.nurhaliza@company.com', '$2y$10$TKh8H1.PfuA38Xe.aMtGtOQl8g/l4RVNRSO1Z3DBNZ9MUu4GnuUa', 'user', '+62 812-0001-0004', 'HR', NULL, '08:00:00', '17:00:00', 1, '2026-03-06 09:06:13', '2026-03-06 09:06:13'),
(6, 'budi_santoso', 'budi.santoso@company.com', '$2y$10$TKh8H1.PfuA38Xe.aMtGtOQl8g/l4RVNRSO1Z3DBNZ9MUu4GnuUa', 'user', '+62 812-0001-0005', 'Operations', NULL, '07:00:00', '16:00:00', 1, '2026-03-06 09:06:13', '2026-03-06 09:06:13'),
(7, 'pasmin71', 'pasmin@example.com', '$2y$10$eb0MBOXONJMfTUlmyKRIfuISPHaXzJVhZN5.wYQRLNj/56wo3aG.i', 'admin', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-06 16:09:59', '2026-03-06 16:11:11');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_monthly_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_monthly_summary` (
`user_id` int(10) unsigned
,`username` varchar(60)
,`department` varchar(80)
,`month` varchar(7)
,`days_present` bigint(21)
,`total_work_hours` decimal(47,4)
,`ot_days` bigint(21)
,`total_ot_hours` decimal(47,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_today_attendance`
-- (See below for the actual view)
--
CREATE TABLE `v_today_attendance` (
`user_id` int(10) unsigned
,`username` varchar(60)
,`email` varchar(120)
,`department` varchar(80)
,`work_date` date
,`checkin_time` time
,`checkout_time` time
,`work_duration` time
,`ot_checkin_time` time
,`ot_checkout_time` time
,`ot_duration` time
,`checkin_lat` decimal(10,7)
,`checkin_lng` decimal(10,7)
,`status` enum('present','absent','leave','holiday')
);

-- --------------------------------------------------------

--
-- Structure for view `v_monthly_summary`
--
DROP TABLE IF EXISTS `v_monthly_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_monthly_summary`  AS SELECT `u`.`id` AS `user_id`, `u`.`username` AS `username`, `u`.`department` AS `department`, date_format(`a`.`work_date`,'%Y-%m') AS `month`, count(`a`.`id`) AS `days_present`, sum(timestampdiff(MINUTE,`a`.`checkin_time`,`a`.`checkout_time`)) / 60.0 AS `total_work_hours`, count(case when `a`.`ot_checkin_time` is not null then 1 end) AS `ot_days`, sum(timestampdiff(MINUTE,`a`.`ot_checkin_time`,`a`.`ot_checkout_time`)) / 60.0 AS `total_ot_hours` FROM (`users` `u` join `attendance` `a` on(`a`.`user_id` = `u`.`id`)) WHERE `u`.`role` = 'user' GROUP BY `u`.`id`, date_format(`a`.`work_date`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Structure for view `v_today_attendance`
--
DROP TABLE IF EXISTS `v_today_attendance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_today_attendance`  AS SELECT `u`.`id` AS `user_id`, `u`.`username` AS `username`, `u`.`email` AS `email`, `u`.`department` AS `department`, `a`.`work_date` AS `work_date`, `a`.`checkin_time` AS `checkin_time`, `a`.`checkout_time` AS `checkout_time`, timediff(`a`.`checkout_time`,`a`.`checkin_time`) AS `work_duration`, `a`.`ot_checkin_time` AS `ot_checkin_time`, `a`.`ot_checkout_time` AS `ot_checkout_time`, timediff(`a`.`ot_checkout_time`,`a`.`ot_checkin_time`) AS `ot_duration`, `a`.`checkin_lat` AS `checkin_lat`, `a`.`checkin_lng` AS `checkin_lng`, `a`.`status` AS `status` FROM (`users` `u` left join `attendance` `a` on(`a`.`user_id` = `u`.`id` and `a`.`work_date` = curdate())) WHERE `u`.`role` = 'user' AND `u`.`is_active` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_user_date` (`user_id`,`work_date`),
  ADD KEY `idx_work_date` (`work_date`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_token` (`token`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_username` (`username`),
  ADD UNIQUE KEY `uq_email` (`email`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
