-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2020 at 10:07 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larapl`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_data` (IN `p_name` VARCHAR(200), IN `p_skills` VARCHAR(200), IN `p_address` VARCHAR(200))  NO SQL
BEGIN
/*
**************************************************
Created By	: Rashed
Date		: 25-Feb-2020
Purpose		: Data insert 
**************************************************
*/
INSERT INTO employees (name, skills, address) VALUES (p_name,p_skills,p_address);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_data` (IN `p_id` INT(10))  NO SQL
BEGIN
/*
**************************************************
Created By	: Rashed
Date		: 25-Feb-2020
Purpose		: Data Delete 
**************************************************
*/
DELETE FROM employees WHERE id=p_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_data` (IN `p_id` INT(200))  NO SQL
BEGIN
/*
**************************************************
Created By	: Rashed
Date		: 25-Feb-2020
Purpose		: Data Edit
**************************************************
*/

SELECT * FROM employees WHERE id=p_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_data` (IN `p_id` INT(10), IN `p_name` VARCHAR(234), IN `p_skills` VARCHAR(234), IN `p_address` VARCHAR(234))  NO SQL
BEGIN
/*
**************************************************
Created By	: Rashed
Phone   	: 01818401065
Date		: 25-Feb-2020
Purpose		: Data Update
**************************************************
*/
SET @up_date = NOW()+6;
UPDATE employees SET 
name = p_name,
skills = p_skills,
address = p_address,
updated_at = @up_date

where id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `view_all_data` ()  NO SQL
BEGIN
 SELECT * FROM employees;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `view_data` (IN `p_id` INT(10))  NO SQL
BEGIN
/*
**************************************************
Created By	: Rashed
Date		: 25-Feb-2020
Purpose		: Data View
**************************************************
*/
  SELECT *
   FROM employees WHERE id = p_id;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skills` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `skills`, `address`, `created_at`, `updated_at`) VALUES
(1, 'rasel karim', 'php css', 'savar', NULL, '2020-03-10 11:51:21'),
(2, 'sorna karim', 'house wife', 'Dhaka', NULL, '0000-00-00 00:00:00'),
(3, 'sorna', 'php', 'dhaka', NULL, NULL),
(4, 'rasek', 'php', 'savar', NULL, NULL),
(6, 'sorna', 'php', 'dhaka', NULL, NULL),
(7, 'sorna', 'php', 'dhaka', NULL, NULL),
(9, 'sorna', 'php', 'dhaka', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2020_03_02_072519_create_employees_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
