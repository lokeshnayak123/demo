-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2022 at 10:25 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aspire`
--

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emi`
--

CREATE TABLE `emi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `monthly_emi` double NOT NULL,
  `interest_paid` double NOT NULL,
  `principal_paid` double NOT NULL,
  `balance` double NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emi`
--

INSERT INTO `emi` (`id`, `loan_id`, `payment_date`, `monthly_emi`, `interest_paid`, `principal_paid`, `balance`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(2, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(3, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(4, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(5, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(6, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(7, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(8, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(9, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(10, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(11, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(12, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(13, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(14, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(15, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(16, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(17, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(18, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(19, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(20, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(21, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(22, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(23, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(24, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(25, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(26, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(27, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(28, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(29, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(30, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(31, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(32, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(33, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(34, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(35, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(36, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(37, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(38, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(39, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(40, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(41, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(42, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(43, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(44, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(45, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(46, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(47, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(48, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(49, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(50, 15, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(51, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(52, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(53, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(54, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(55, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(56, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(57, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(58, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(59, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(60, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(61, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(62, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(63, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(64, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(65, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(66, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(67, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(68, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(69, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(70, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(71, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(72, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(73, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(74, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(75, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(76, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(77, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(78, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(79, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(80, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(81, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(82, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(83, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(84, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(85, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(86, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(87, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(88, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(89, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(90, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(91, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(92, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(93, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(94, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(95, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(96, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(97, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(98, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(99, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(100, 16, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(101, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(102, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(103, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(104, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(105, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(106, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(107, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(108, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(109, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(110, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(111, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(112, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(113, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(114, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(115, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(116, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(117, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(118, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(119, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(120, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(121, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(122, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(123, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(124, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(125, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(126, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(127, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(128, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(129, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(130, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(131, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(132, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(133, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(134, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(135, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(136, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(137, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(138, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(139, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(140, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(141, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(142, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(143, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(144, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(145, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(146, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(147, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(148, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(149, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(150, 17, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(151, 18, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(152, 18, '2022-02-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(153, 18, '2022-03-06 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(154, 18, '2022-03-13 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(155, 18, '2022-03-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(156, 18, '2022-03-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(157, 18, '2022-04-03 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(158, 18, '2022-04-10 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(159, 18, '2022-04-17 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(160, 18, '2022-04-24 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(161, 18, '2022-05-01 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(162, 18, '2022-05-08 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(163, 18, '2022-05-15 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(164, 18, '2022-05-22 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(165, 18, '2022-05-29 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(166, 18, '2022-06-05 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(167, 18, '2022-06-12 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(168, 18, '2022-06-19 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(169, 18, '2022-06-26 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(170, 18, '2022-07-03 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(171, 18, '2022-07-10 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(172, 18, '2022-07-17 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(173, 18, '2022-07-24 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(174, 18, '2022-07-31 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(175, 18, '2022-08-07 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(176, 18, '2022-08-14 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(177, 18, '2022-08-21 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(178, 18, '2022-08-28 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(179, 18, '2022-09-04 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(180, 18, '2022-09-11 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(181, 18, '2022-09-18 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(182, 18, '2022-09-25 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(183, 18, '2022-10-02 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(184, 18, '2022-10-09 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(185, 18, '2022-10-16 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(186, 18, '2022-10-23 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(187, 18, '2022-10-30 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(188, 18, '2022-11-06 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(189, 18, '2022-11-13 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(190, 18, '2022-11-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(191, 18, '2022-11-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(192, 18, '2022-12-04 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(193, 18, '2022-12-11 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(194, 18, '2022-12-18 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(195, 18, '2022-12-25 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(196, 18, '2023-01-01 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(197, 18, '2023-01-08 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(198, 18, '2023-01-15 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(199, 18, '2023-01-22 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(200, 18, '2023-01-29 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(201, 19, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(202, 19, '2022-02-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(203, 19, '2022-03-06 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(204, 19, '2022-03-13 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(205, 19, '2022-03-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(206, 19, '2022-03-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(207, 19, '2022-04-03 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(208, 19, '2022-04-10 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(209, 19, '2022-04-17 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(210, 19, '2022-04-24 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(211, 19, '2022-05-01 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(212, 19, '2022-05-08 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(213, 19, '2022-05-15 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(214, 19, '2022-05-22 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(215, 19, '2022-05-29 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(216, 19, '2022-06-05 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(217, 19, '2022-06-12 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(218, 19, '2022-06-19 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(219, 19, '2022-06-26 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(220, 19, '2022-07-03 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(221, 19, '2022-07-10 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(222, 19, '2022-07-17 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(223, 19, '2022-07-24 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(224, 19, '2022-07-31 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(225, 19, '2022-08-07 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(226, 19, '2022-08-14 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(227, 19, '2022-08-21 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(228, 19, '2022-08-28 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(229, 19, '2022-09-04 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(230, 19, '2022-09-11 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(231, 19, '2022-09-18 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(232, 19, '2022-09-25 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(233, 19, '2022-10-02 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(234, 19, '2022-10-09 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(235, 19, '2022-10-16 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(236, 19, '2022-10-23 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(237, 19, '2022-10-30 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(238, 19, '2022-11-06 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(239, 19, '2022-11-13 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(240, 19, '2022-11-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(241, 19, '2022-11-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(242, 19, '2022-12-04 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(243, 19, '2022-12-11 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(244, 19, '2022-12-18 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(245, 19, '2022-12-25 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(246, 19, '2023-01-01 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(247, 19, '2023-01-08 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(248, 19, '2023-01-15 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(249, 19, '2023-01-22 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(250, 19, '2023-01-29 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(251, 20, '2022-02-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(252, 20, '2022-02-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(253, 20, '2022-03-06 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(254, 20, '2022-03-13 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(255, 20, '2022-03-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(256, 20, '2022-03-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(257, 20, '2022-04-03 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(258, 20, '2022-04-10 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(259, 20, '2022-04-17 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(260, 20, '2022-04-24 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(261, 20, '2022-05-01 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(262, 20, '2022-05-08 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(263, 20, '2022-05-15 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(264, 20, '2022-05-22 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(265, 20, '2022-05-29 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(266, 20, '2022-06-05 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(267, 20, '2022-06-12 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(268, 20, '2022-06-19 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(269, 20, '2022-06-26 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(270, 20, '2022-07-03 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(271, 20, '2022-07-10 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(272, 20, '2022-07-17 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(273, 20, '2022-07-24 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(274, 20, '2022-07-31 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(275, 20, '2022-08-07 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(276, 20, '2022-08-14 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(277, 20, '2022-08-21 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(278, 20, '2022-08-28 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(279, 20, '2022-09-04 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(280, 20, '2022-09-11 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(281, 20, '2022-09-18 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(282, 20, '2022-09-25 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(283, 20, '2022-10-02 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(284, 20, '2022-10-09 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(285, 20, '2022-10-16 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(286, 20, '2022-10-23 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(287, 20, '2022-10-30 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(288, 20, '2022-11-06 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(289, 20, '2022-11-13 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(290, 20, '2022-11-20 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(291, 20, '2022-11-27 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(292, 20, '2022-12-04 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(293, 20, '2022-12-11 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(294, 20, '2022-12-18 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(295, 20, '2022-12-25 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(296, 20, '2023-01-01 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(297, 20, '2023-01-08 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(298, 20, '2023-01-15 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(299, 20, '2023-01-22 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(300, 20, '2023-01-29 00:00:00', 245, 83, 235, 9765, NULL, NULL, NULL),
(301, 21, '2022-02-20 00:00:00', 245, 83, 162, 9838, NULL, NULL, NULL),
(302, 21, '2022-02-27 00:00:00', 245, 82, 163, 9675, NULL, NULL, NULL),
(303, 21, '2022-03-06 00:00:00', 245, 81, 164, 9511, NULL, NULL, NULL),
(304, 21, '2022-03-13 00:00:00', 245, 79, 166, 9345, NULL, NULL, NULL),
(305, 21, '2022-03-20 00:00:00', 245, 78, 167, 9178, NULL, NULL, NULL),
(306, 21, '2022-03-27 00:00:00', 245, 76, 169, 9009, NULL, NULL, NULL),
(307, 21, '2022-04-03 00:00:00', 245, 75, 170, 8839, NULL, NULL, NULL),
(308, 21, '2022-04-10 00:00:00', 245, 74, 171, 8668, NULL, NULL, NULL),
(309, 21, '2022-04-17 00:00:00', 245, 72, 173, 8495, NULL, NULL, NULL),
(310, 21, '2022-04-24 00:00:00', 245, 71, 174, 8321, NULL, NULL, NULL),
(311, 21, '2022-05-01 00:00:00', 245, 69, 176, 8145, NULL, NULL, NULL),
(312, 21, '2022-05-08 00:00:00', 245, 68, 177, 7968, NULL, NULL, NULL),
(313, 21, '2022-05-15 00:00:00', 245, 66, 179, 7789, NULL, NULL, NULL),
(314, 21, '2022-05-22 00:00:00', 245, 65, 180, 7609, NULL, NULL, NULL),
(315, 21, '2022-05-29 00:00:00', 245, 63, 182, 7427, NULL, NULL, NULL),
(316, 21, '2022-06-05 00:00:00', 245, 62, 183, 7244, NULL, NULL, NULL),
(317, 21, '2022-06-12 00:00:00', 245, 60, 185, 7059, NULL, NULL, NULL),
(318, 21, '2022-06-19 00:00:00', 245, 59, 186, 6873, NULL, NULL, NULL),
(319, 21, '2022-06-26 00:00:00', 245, 57, 188, 6685, NULL, NULL, NULL),
(320, 21, '2022-07-03 00:00:00', 245, 56, 189, 6496, NULL, NULL, NULL),
(321, 21, '2022-07-10 00:00:00', 245, 54, 191, 6305, NULL, NULL, NULL),
(322, 21, '2022-07-17 00:00:00', 245, 53, 192, 6113, NULL, NULL, NULL),
(323, 21, '2022-07-24 00:00:00', 245, 51, 194, 5919, NULL, NULL, NULL),
(324, 21, '2022-07-31 00:00:00', 245, 49, 196, 5723, NULL, NULL, NULL),
(325, 21, '2022-08-07 00:00:00', 245, 48, 197, 5526, NULL, NULL, NULL),
(326, 21, '2022-08-14 00:00:00', 245, 46, 199, 5327, NULL, NULL, NULL),
(327, 21, '2022-08-21 00:00:00', 245, 44, 201, 5126, NULL, NULL, NULL),
(328, 21, '2022-08-28 00:00:00', 245, 43, 202, 4924, NULL, NULL, NULL),
(329, 21, '2022-09-04 00:00:00', 245, 41, 204, 4720, NULL, NULL, NULL),
(330, 21, '2022-09-11 00:00:00', 245, 39, 206, 4514, NULL, NULL, NULL),
(331, 21, '2022-09-18 00:00:00', 245, 38, 207, 4307, NULL, NULL, NULL),
(332, 21, '2022-09-25 00:00:00', 245, 36, 209, 4098, NULL, NULL, NULL),
(333, 21, '2022-10-02 00:00:00', 245, 34, 211, 3887, NULL, NULL, NULL),
(334, 21, '2022-10-09 00:00:00', 245, 32, 213, 3674, NULL, NULL, NULL),
(335, 21, '2022-10-16 00:00:00', 245, 31, 214, 3460, NULL, NULL, NULL),
(336, 21, '2022-10-23 00:00:00', 245, 29, 216, 3244, NULL, NULL, NULL),
(337, 21, '2022-10-30 00:00:00', 245, 27, 218, 3026, NULL, NULL, NULL),
(338, 21, '2022-11-06 00:00:00', 245, 25, 220, 2806, NULL, NULL, NULL),
(339, 21, '2022-11-13 00:00:00', 245, 23, 222, 2584, NULL, NULL, NULL),
(340, 21, '2022-11-20 00:00:00', 245, 22, 223, 2361, NULL, NULL, NULL),
(341, 21, '2022-11-27 00:00:00', 245, 20, 225, 2136, NULL, NULL, NULL),
(342, 21, '2022-12-04 00:00:00', 245, 18, 227, 1909, NULL, NULL, NULL),
(343, 21, '2022-12-11 00:00:00', 245, 16, 229, 1680, NULL, NULL, NULL),
(344, 21, '2022-12-18 00:00:00', 245, 14, 231, 1449, NULL, NULL, NULL),
(345, 21, '2022-12-25 00:00:00', 245, 12, 233, 1216, NULL, NULL, NULL),
(346, 21, '2023-01-01 00:00:00', 245, 10, 235, 981, NULL, NULL, NULL),
(347, 21, '2023-01-08 00:00:00', 245, 8, 237, 744, NULL, NULL, NULL),
(348, 21, '2023-01-15 00:00:00', 245, 6, 239, 505, NULL, NULL, NULL),
(349, 21, '2023-01-22 00:00:00', 245, 4, 241, 264, NULL, NULL, NULL),
(350, 21, '2023-01-29 00:00:00', 245, 2, 243, 21, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `loan_amount` double NOT NULL,
  `loan_term_in_week` double NOT NULL,
  `rate_of_interest` double NOT NULL,
  `start_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `loan_amount`, `loan_term_in_week`, `rate_of_interest`, `start_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, 1, 10000, 50, 10, '2022-02-13 00:00:00', '2022-02-13 15:32:19', '2022-02-13 15:32:19', NULL),
(16, 1, 10000, 50, 10, '2022-02-13 00:00:00', '2022-02-13 15:32:55', '2022-02-13 15:32:55', NULL),
(17, 1, 10000, 50, 10, '2022-02-13 00:00:00', '2022-02-13 15:33:41', '2022-02-13 15:33:41', NULL),
(18, 1, 10000, 50, 10, '2022-02-13 00:00:00', '2022-02-13 15:34:54', '2022-02-13 15:34:54', NULL),
(19, 1, 10000, 50, 10, '2022-02-13 00:00:00', '2022-02-13 15:35:46', '2022-02-13 15:35:46', NULL),
(20, 1, 10000, 50, 10, '2022-02-13 00:00:00', '2022-02-13 15:35:57', '2022-02-13 15:35:57', NULL),
(21, 1, 10000, 50, 10, '2022-02-13 00:00:00', '2022-02-13 15:39:04', '2022-02-13 15:39:04', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_19_055302_cerate_email_templates_table', 1),
(5, '2020_07_04_052618_create_configurations_table', 1),
(6, '2021_02_17_123523_create_permission_tables', 1),
(7, '2021_02_17_124101_alter_permission_tables', 1),
(8, '2021_02_17_124301_create_permission_groups_tables', 1),
(9, '2021_02_18_120533_create_jobs_table', 1),
(10, '2022_02_13_163915_create_loans_table', 2),
(11, '2022_02_13_163932_create_emi_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Active = 1, Inactive=0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Active = 1, Inactive=0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `guard_name`, `display_name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'customer', 'customer', 'customer', 'customer', 'customer', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noimage.jpg',
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `slug`, `username`, `name`, `email`, `email_verified_at`, `password`, `phone`, `image`, `status`, `remember_token`, `last_login_at`, `last_login_ip`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test', 'test', 'test@yopmail.com', '2022-02-13 09:56:56', '$2y$10$ZUwUfcsm5CUFAJLfLtKv7es3XtOnfw7StKZ6HR9wamWtDhhIty/2m', NULL, 'noimage.jpg', 1, 'p2xmMWouiD9LOw30ED5CJen9UjdJ7HTB7aC5jb55OVY8W1HjyfCii8OZII7X', '2022-02-13 04:35:59', '::1', '2022-02-13 04:24:21', '2022-02-13 04:35:59', NULL),
(2, 'test-1', 'test-1', 'test', 'test1@yopmail.com', NULL, '$2y$10$ICGP1j3B1HY5yoRC9BeFyudkzeroQ9ht8gahBA9QfEZMxh9Js7TLi', NULL, 'noimage.jpg', 1, NULL, NULL, NULL, '2022-02-13 13:08:55', '2022-02-13 13:08:55', NULL),
(3, 'test-2', 'test-2', 'test', 'test2@yopmail.com', NULL, '$2y$10$xzTHiLdiHjuCmFQHEOM6f.3qNk5oBsuSnmUGGgR.A01C3GPPELcPG', NULL, 'noimage.jpg', 1, NULL, NULL, NULL, '2022-02-13 13:10:21', '2022-02-13 13:10:21', NULL),
(4, 'test-3', 'test-3', 'test', 'test3@yopmail.com', NULL, '$2y$10$2LqLIgwp3YXRBJhdFFd9neVXiMgtFPEFD89LMdgtgIHnb4HNTd1Sm', NULL, 'noimage.jpg', 1, NULL, NULL, NULL, '2022-02-13 13:11:59', '2022-02-13 13:11:59', NULL),
(5, 'test-4', 'test-4', 'test', 'test4@yopmail.com', NULL, '$2y$10$hhqNGd6vfs/UUJdHfRqIW.DpbHW74h8c3EShPYASm1ebVxudvodcK', NULL, 'noimage.jpg', 1, NULL, NULL, NULL, '2022-02-13 13:13:52', '2022-02-13 13:13:52', NULL),
(6, 'test-5', 'test-5', 'test', 'test5@yopmail.com', NULL, '$2y$10$kcBCSRQtwHLupgUuJs6Hsuc9tS3G4O1XXUztUfJ9Ft2Q/krl0enm2', NULL, 'noimage.jpg', 1, NULL, NULL, NULL, '2022-02-13 13:14:48', '2022-02-13 13:14:48', NULL),
(7, 'test-6', 'test-6', 'test', 'test6@yopmail.com', NULL, '$2y$10$7XgDskClOHBo8eLm1JIr0.04AbVZjzVZUTenHhjwK/Isz5q0K8nJ2', NULL, 'noimage.jpg', 1, NULL, NULL, NULL, '2022-02-13 13:17:08', '2022-02-13 13:17:08', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`),
  ADD UNIQUE KEY `email_templates_name_unique` (`name`);

--
-- Indexes for table `emi`
--
ALTER TABLE `emi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emi_loan_id_index` (`loan_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emi`
--
ALTER TABLE `emi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
