-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2024 at 11:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_king`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `version` varchar(191) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `author` varchar(191) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `item_id` varchar(191) NOT NULL,
  `license_code` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `analytics`
--

CREATE TABLE `analytics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `analytic_sections`
--

CREATE TABLE `analytic_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `analytic_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `data` longtext NOT NULL,
  `section` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'EAN-13', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(2, 'UPC-A', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `benefits`
--

CREATE TABLE `benefits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `sort` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capture_payment_notifications`
--

CREATE TABLE `capture_payment_notifications` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `discount` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `discount_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `minimum_order` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `maximum_discount` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `limit_per_user` bigint(20) DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `is_cryptocurrency` tinyint(3) UNSIGNED NOT NULL,
  `exchange_rate` decimal(13,6) DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `is_cryptocurrency`, `exchange_rate`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Dollars', '$', 'USD', 10, 1.000000, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(191) DEFAULT NULL,
  `tax` decimal(13,6) DEFAULT 0.000000,
  `discount` decimal(13,6) DEFAULT 0.000000,
  `subtotal` decimal(13,6) NOT NULL,
  `total` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `note` text DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `default_access`
--

CREATE TABLE `default_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `default_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_options`
--

CREATE TABLE `gateway_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `option` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `activities` longtext DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_options`
--

INSERT INTO `gateway_options` (`id`, `model_id`, `model_type`, `option`, `value`, `type`, `activities`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'App\\Models\\PaymentGateway', 'paypal_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(2, 3, 'App\\Models\\PaymentGateway', 'paypal_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(3, 3, 'App\\Models\\PaymentGateway', 'paypal_client_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(4, 3, 'App\\Models\\PaymentGateway', 'paypal_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(5, 3, 'App\\Models\\PaymentGateway', 'paypal_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(6, 4, 'App\\Models\\PaymentGateway', 'stripe_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(7, 4, 'App\\Models\\PaymentGateway', 'stripe_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(8, 4, 'App\\Models\\PaymentGateway', 'stripe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(9, 4, 'App\\Models\\PaymentGateway', 'stripe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(10, 5, 'App\\Models\\PaymentGateway', 'flutterwave_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(11, 5, 'App\\Models\\PaymentGateway', 'flutterwave_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(12, 5, 'App\\Models\\PaymentGateway', 'flutterwave_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(13, 5, 'App\\Models\\PaymentGateway', 'flutterwave_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(14, 6, 'App\\Models\\PaymentGateway', 'paystack_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(15, 6, 'App\\Models\\PaymentGateway', 'paystack_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(16, 6, 'App\\Models\\PaymentGateway', 'paystack_payment_url', 'https://api.paystack.co', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(17, 6, 'App\\Models\\PaymentGateway', 'paystack_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(18, 6, 'App\\Models\\PaymentGateway', 'paystack_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(19, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_name', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(20, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(21, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(22, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(23, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(24, 8, 'App\\Models\\PaymentGateway', 'mollie_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(25, 8, 'App\\Models\\PaymentGateway', 'mollie_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(26, 8, 'App\\Models\\PaymentGateway', 'mollie_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(27, 9, 'App\\Models\\PaymentGateway', 'senangpay_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(28, 9, 'App\\Models\\PaymentGateway', 'senangpay_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(29, 9, 'App\\Models\\PaymentGateway', 'senangpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(30, 9, 'App\\Models\\PaymentGateway', 'senangpay_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(31, 10, 'App\\Models\\PaymentGateway', 'bkash_app_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(32, 10, 'App\\Models\\PaymentGateway', 'bkash_app_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(33, 10, 'App\\Models\\PaymentGateway', 'bkash_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(34, 10, 'App\\Models\\PaymentGateway', 'bkash_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(35, 10, 'App\\Models\\PaymentGateway', 'bkash_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(36, 10, 'App\\Models\\PaymentGateway', 'bkash_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(37, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(38, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(39, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_website', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(40, 11, 'App\\Models\\PaymentGateway', 'paytm_channel', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(41, 11, 'App\\Models\\PaymentGateway', 'paytm_industry_type', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(42, 11, 'App\\Models\\PaymentGateway', 'paytm_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(43, 11, 'App\\Models\\PaymentGateway', 'paytm_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(44, 12, 'App\\Models\\PaymentGateway', 'razorpay_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(45, 12, 'App\\Models\\PaymentGateway', 'razorpay_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(46, 12, 'App\\Models\\PaymentGateway', 'razorpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(47, 12, 'App\\Models\\PaymentGateway', 'razorpay_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(48, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(49, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(50, 13, 'App\\Models\\PaymentGateway', 'mercadopago_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(51, 13, 'App\\Models\\PaymentGateway', 'mercadopago_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(52, 14, 'App\\Models\\PaymentGateway', 'cashfree_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(53, 14, 'App\\Models\\PaymentGateway', 'cashfree_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(54, 14, 'App\\Models\\PaymentGateway', 'cashfree_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(55, 14, 'App\\Models\\PaymentGateway', 'cashfree_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(56, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(57, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(58, 15, 'App\\Models\\PaymentGateway', 'payfast_passphrase', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(59, 15, 'App\\Models\\PaymentGateway', 'payfast_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(60, 15, 'App\\Models\\PaymentGateway', 'payfast_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(61, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_email', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(62, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_api_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(63, 16, 'App\\Models\\PaymentGateway', 'skrill_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(64, 16, 'App\\Models\\PaymentGateway', 'skrill_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(65, 17, 'App\\Models\\PaymentGateway', 'phonepe_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(66, 17, 'App\\Models\\PaymentGateway', 'phonepe_merchant_user_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(67, 17, 'App\\Models\\PaymentGateway', 'phonepe_key_index', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(68, 17, 'App\\Models\\PaymentGateway', 'phonepe_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(69, 17, 'App\\Models\\PaymentGateway', 'phonepe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(70, 17, 'App\\Models\\PaymentGateway', 'phonepe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(71, 1, 'App\\Models\\SmsGateway', 'twilio_account_sid', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(72, 1, 'App\\Models\\SmsGateway', 'twilio_auth_token', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(73, 1, 'App\\Models\\SmsGateway', 'twilio_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(74, 1, 'App\\Models\\SmsGateway', 'twilio_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(75, 2, 'App\\Models\\SmsGateway', 'clickatell_apikey', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(76, 2, 'App\\Models\\SmsGateway', 'clickatell_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(77, 3, 'App\\Models\\SmsGateway', 'nexmo_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(78, 3, 'App\\Models\\SmsGateway', 'nexmo_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(79, 3, 'App\\Models\\SmsGateway', 'nexmo_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(80, 4, 'App\\Models\\SmsGateway', 'msg91_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(81, 4, 'App\\Models\\SmsGateway', 'msg91_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(82, 4, 'App\\Models\\SmsGateway', 'msg91_template_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(83, 4, 'App\\Models\\SmsGateway', 'msg91_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(84, 5, 'App\\Models\\SmsGateway', 'twofactor_module', 'PROMO_SMS', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(85, 5, 'App\\Models\\SmsGateway', 'twofactor_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(86, 5, 'App\\Models\\SmsGateway', 'twofactor_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(87, 5, 'App\\Models\\SmsGateway', 'twofactor_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(88, 6, 'App\\Models\\SmsGateway', 'bulksms_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(89, 6, 'App\\Models\\SmsGateway', 'bulksms_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(90, 6, 'App\\Models\\SmsGateway', 'bulksms_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(91, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(92, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(93, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(94, 8, 'App\\Models\\SmsGateway', 'telesign_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(95, 8, 'App\\Models\\SmsGateway', 'telesign_customer_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(96, 8, 'App\\Models\\SmsGateway', 'telesign_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(97, 8, 'App\\Models\\SmsGateway', 'telesign_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `display_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `display_mode`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 5, 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:32', '2024-09-18 11:24:32'),
(2, 'Bangla', 'bn', 5, 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(3, 'Arabic', 'ar', 10, 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `mime_type` varchar(191) DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `conversions_disk` varchar(191) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Language', 1, '34c2a72e-d348-4d71-a8bc-66d19b9cafec', 'language', 'english', 'english.png', 'image/png', 'public', 'public', 1149, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:34', '2024-09-18 11:24:34'),
(2, 'App\\Models\\Language', 2, 'c9c6a765-abd7-4c41-bbef-c13b72782f81', 'language', 'bangla', 'bangla.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(3, 'App\\Models\\Language', 3, '8d66beb3-9d46-4967-b2bc-0e2edfb23810', 'language', 'arabic', 'arabic.png', 'image/png', 'public', 'public', 12138, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(4, 'App\\Models\\PaymentGateway', 1, 'fed5a41a-9739-44bd-b18f-bd19258c2037', 'payment-gateway', 'cashondelivery', 'cashondelivery.png', 'image/png', 'public', 'public', 3437, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(5, 'App\\Models\\PaymentGateway', 2, '56d6e649-9232-4891-aca8-e0d0647f7166', 'payment-gateway', 'credit', 'credit.png', 'image/png', 'public', 'public', 3885, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(6, 'App\\Models\\PaymentGateway', 3, '5f22ce0a-4360-49ca-a602-072309a480d3', 'payment-gateway', 'paypal', 'paypal.png', 'image/png', 'public', 'public', 3809, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(7, 'App\\Models\\PaymentGateway', 4, '7d568a7d-a9c6-4a86-bf18-a7cb77a0bfdd', 'payment-gateway', 'stripe', 'stripe.png', 'image/png', 'public', 'public', 3635, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(8, 'App\\Models\\PaymentGateway', 5, 'f0d74bb6-2867-4645-b871-5a9cecf98021', 'payment-gateway', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 'public', 5191, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(9, 'App\\Models\\PaymentGateway', 6, 'b57c5faa-d71e-427a-b5b9-febd7b902249', 'payment-gateway', 'paystack', 'paystack.png', 'image/png', 'public', 'public', 4195, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(10, 'App\\Models\\PaymentGateway', 7, '107c51fa-78b7-4f25-b54d-332768099752', 'payment-gateway', 'sslcommerz', 'sslcommerz.png', 'image/png', 'public', 'public', 4546, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(11, 'App\\Models\\PaymentGateway', 8, 'bb1e7f2c-f9ac-44e7-91e2-d17b7ef8a71b', 'payment-gateway', 'mollie', 'mollie.png', 'image/png', 'public', 'public', 8116, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(12, 'App\\Models\\PaymentGateway', 9, 'b864373f-8b58-464e-a2e5-c0ab9084f7aa', 'payment-gateway', 'senangpay', 'senangpay.png', 'image/png', 'public', 'public', 6541, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(13, 'App\\Models\\PaymentGateway', 10, 'bf5aebd2-780c-4d9e-a22a-3d7abc9fbac5', 'payment-gateway', 'bkash', 'bkash.png', 'image/png', 'public', 'public', 5282, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(14, 'App\\Models\\PaymentGateway', 11, '5b5bfc38-88c7-4df3-a27b-5cf0ccf576bc', 'payment-gateway', 'paytm', 'paytm.png', 'image/png', 'public', 'public', 3285, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(15, 'App\\Models\\PaymentGateway', 12, '1f839ed3-8fc8-4c00-a5e9-ed34c769980c', 'payment-gateway', 'razorpay', 'razorpay.png', 'image/png', 'public', 'public', 4847, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(16, 'App\\Models\\PaymentGateway', 13, 'ed0e3d6d-4dfc-430a-bb01-1b3d07600406', 'payment-gateway', 'mercadopago', 'mercadopago.png', 'image/png', 'public', 'public', 11423, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(17, 'App\\Models\\PaymentGateway', 14, 'd8e22393-36f0-4fb1-91d4-7315b1b22ecf', 'payment-gateway', 'cashfree', 'cashfree.png', 'image/png', 'public', 'public', 4940, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(18, 'App\\Models\\PaymentGateway', 15, 'ce513e37-531c-447b-9b3d-7a7afa34807b', 'payment-gateway', 'payfast', 'payfast.png', 'image/png', 'public', 'public', 2173, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(19, 'App\\Models\\PaymentGateway', 16, '49ccbcf7-0606-4e36-b267-07d2b0f82eea', 'payment-gateway', 'skrill', 'skrill.png', 'image/png', 'public', 'public', 7074, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(20, 'App\\Models\\PaymentGateway', 17, '4b666b8c-0580-4a50-9589-ab4f7bc93120', 'payment-gateway', 'phonepe', 'phonepe.png', 'image/png', 'public', 'public', 4417, '[]', '[]', '[]', '[]', 1, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `language` varchar(191) DEFAULT NULL,
  `url` varchar(191) NOT NULL,
  `icon` varchar(191) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `language`, `url`, `icon`, `status`, `parent`, `type`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'dashboard', 'lab lab-line-dashboard', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(2, 'Product & Stock', 'product_and_stock', '#', 'lab lab-item', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(3, 'Products', 'products', 'products', 'lab lab-line-items', 1, 2, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(4, 'Purchase', 'purchase', 'purchase', 'lab lab-line-add-purchase', 1, 2, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(5, 'Damages', 'damages', 'damages', 'lab lab-line-addons', 1, 2, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(6, 'Stock', 'stock', 'stock', 'lab lab-line-stock', 1, 2, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(7, 'Pos & Orders', 'pos_and_orders', '#', 'lab lab-pos', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(8, 'POS', 'pos', 'pos', 'lab lab-line-pos', 1, 7, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(9, 'POS Orders', 'pos_orders', 'pos-orders', 'lab lab-line-push-notification', 1, 7, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(10, 'Online Orders', 'online_orders', 'online-orders', 'lab lab-line-online-orders', 1, 7, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(11, 'Return Orders', 'return_orders', 'return-orders', 'lab lab-line-order-setup', 1, 7, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(12, 'Return And Refunds', 'return_and_refunds', 'return-and-refunds', 'lab lab-line-3d-rotate', 1, 7, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(13, 'Promo', 'promo', '#', 'lab ', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(14, 'Coupons', 'coupons', 'coupons', 'lab lab-line-coupon', 1, 13, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(15, 'Promotions', 'promotions', 'promotions', 'lab lab-line-promotion', 1, 13, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(16, 'Product Sections', 'product_sections', 'product-sections', 'lab lab-line-product-section', 1, 13, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(17, 'Communications', 'communications', '#', 'lab ', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(18, 'Push Notifications', 'push_notifications', 'push-notifications', 'lab lab-line-notification-alert', 1, 17, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(19, 'Subscribers', 'subscribers', 'subscribers', 'lab lab-line-social', 1, 17, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(20, 'Users', 'users', '#', 'lab ', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(21, 'Administrators', 'administrators', 'administrators', 'lab lab-line-administrator', 1, 20, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(22, 'Customers', 'customers', 'customers', 'lab lab-line-cunstomers', 1, 20, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(23, 'Employees', 'employees', 'employees', 'lab lab-line-users', 1, 20, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(24, 'Accounts', 'accounts', '#', 'lab ', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(25, 'Transactions', 'transactions', 'transactions', 'lab lab-line-transactions', 1, 24, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(26, 'Reports', 'reports', '#', 'lab ', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(27, 'Sales Report', 'sales_report', 'sales-report', 'lab lab-line-sales-report', 1, 26, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(28, 'Products Report', 'products_report', 'products-report', 'lab lab-line-items-report', 1, 26, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(29, 'Credit Balance Report', 'credit_balance_report', 'credit-balance-report', 'lab lab-line-report', 1, 26, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(30, 'Setup', 'setup', '#', 'lab ', 1, 0, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(31, 'Settings', 'settings', 'settings', 'lab lab-line-settings', 1, 30, 1, 100, '2024-09-18 11:24:31', '2024-09-18 11:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `menu_sections`
--

CREATE TABLE `menu_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_sections`
--

INSERT INTO `menu_sections` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Support Section', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(2, 'Legal Section', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_templates`
--

CREATE TABLE `menu_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_templates`
--

INSERT INTO `menu_templates` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_08_114851_create_settings_table', 1),
(6, '2023_07_08_115031_create_addresses_table', 1),
(7, '2023_07_08_115414_create_sliders_table', 1),
(8, '2023_07_08_115831_create_product_categories_table', 1),
(9, '2023_07_08_121707_create_product_brands_table', 1),
(10, '2023_07_08_122557_create_taxes_table', 1),
(11, '2023_07_08_124837_create_barcodes_table', 1),
(12, '2023_07_08_125104_create_units_table', 1),
(13, '2023_07_08_125531_create_products_table', 1),
(14, '2023_07_09_104935_create_product_attributes_table', 1),
(15, '2023_07_09_105239_create_product_attribute_options_table', 1),
(16, '2023_07_09_105430_create_product_variations_table', 1),
(17, '2023_07_09_110255_create_suppliers_table', 1),
(18, '2023_07_09_111838_create_purchases_table', 1),
(19, '2023_07_09_115920_create_stocks_table', 1),
(20, '2023_07_09_115921_create_stock_taxes_table', 1),
(21, '2023_07_09_121919_create_wishlists_table', 1),
(22, '2023_07_09_122037_create_coupons_table', 1),
(23, '2023_07_10_063957_create_menu_sections_table', 1),
(24, '2023_07_10_064025_create_pages_table', 1),
(25, '2023_07_10_064711_create_menu_templates_table', 1),
(26, '2023_07_10_064804_create_analytics_table', 1),
(27, '2023_07_10_064814_create_analytic_sections_table', 1),
(28, '2023_07_10_071800_create_payment_gateways_table', 1),
(29, '2023_07_10_071813_create_sms_gateways_table', 1),
(30, '2023_07_10_072242_create_gateway_options_table', 1),
(31, '2023_07_10_072402_create_addons_table', 1),
(32, '2023_07_10_072821_create_menus_table', 1),
(33, '2023_07_10_073006_create_currencies_table', 1),
(34, '2023_07_10_073122_create_default_access_table', 1),
(35, '2023_07_10_073149_create_subscribers_table', 1),
(36, '2023_07_10_073241_create_languages_table', 1),
(37, '2023_07_10_073412_create_transactions_table', 1),
(38, '2023_07_10_073459_create_capture_payment_notifications_table', 1),
(39, '2023_07_10_073530_create_orders_table', 1),
(40, '2023_07_10_080909_create_order_coupons_table', 1),
(41, '2023_07_10_082118_create_media_table', 1),
(42, '2023_07_10_082135_create_permission_tables', 1),
(43, '2023_07_26_101803_create_push_notifications_table', 1),
(44, '2023_07_27_060930_create_product_videos_table', 1),
(45, '2023_08_03_052043_create_product_tags_table', 1),
(46, '2023_08_09_055601_create_product_reviews_table', 1),
(47, '2023_08_20_093956_create_product_seos_table', 1),
(48, '2023_08_23_073328_create_product_sections_table', 1),
(49, '2023_08_23_073342_create_product_section_products_table', 1),
(50, '2023_08_23_073805_create_promotions_table', 1),
(51, '2023_08_23_073814_create_promotion_products_table', 1),
(52, '2023_08_23_074032_create_benefits_table', 1),
(53, '2023_09_18_154954_create_otps_table', 1),
(54, '2023_10_02_175658_create_return_orders_table', 1),
(55, '2023_10_04_154954_create_order_areas_table', 1),
(56, '2023_10_04_154954_create_product_taxes_table', 1),
(57, '2023_10_10_124258_create_damages_table', 1),
(58, '2023_10_10_140107_create_notification_alerts_table', 1),
(59, '2023_10_10_180212_create_order_addresses_table', 1),
(60, '2023_10_17_114414_create_return_reasons_table', 1),
(61, '2023_10_17_114503_create_return_and_refunds_table', 1),
(62, '2023_10_17_114617_create_return_and_refund_products_table', 1),
(63, '2023_11_05_140118_create_outlets_table', 1),
(64, '2023_11_15_143302_create_order_outlet_addresses_table', 1),
(65, '2023_12_03_143302_create_order_purchase_payments_table', 1),
(66, '2024_03_11_000000_add_softdelete_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification_alerts`
--

CREATE TABLE `notification_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `language` varchar(191) NOT NULL,
  `mail_message` varchar(191) DEFAULT NULL,
  `sms_message` varchar(191) DEFAULT NULL,
  `push_notification_message` varchar(191) DEFAULT NULL,
  `mail` tinyint(4) DEFAULT NULL,
  `sms` tinyint(4) DEFAULT NULL,
  `push_notification` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_alerts`
--

INSERT INTO `notification_alerts` (`id`, `name`, `language`, `mail_message`, `sms_message`, `push_notification_message`, `mail`, `sms`, `push_notification`, `created_at`, `updated_at`) VALUES
(1, 'Order Pending Message', 'order_pending_message', 'Your order is successfully placed.', 'Your order is successfully placed.', 'Your order is successfully placed.', 10, 10, 10, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(2, 'Order Confirmation Message', 'order_confirmation_message', 'Your order is confirmed.', 'Your order is confirmed.', 'Your order is confirmed.', 10, 10, 10, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(3, 'Order On The Way Message', 'order_on_the_way_message', 'Your order is on the way.', 'Your order is on the way.', 'Your order is on the way.', 10, 10, 10, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(4, 'Order Delivered Message', 'order_delivered_message', 'Your order is successfully delivered.', 'Your order is successfully delivered.', 'Your order is successfully delivered.', 10, 10, 10, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(5, 'Order Canceled Message', 'order_canceled_message', 'Your order is canceled.', 'Your order is canceled.', 'Your order is canceled.', 10, 10, 10, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(6, 'Order Rejected Message', 'order_rejected_message', 'Your order is rejected.', 'Your order is rejected.', 'Your order is rejected.', 10, 10, 10, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(7, 'Admin And Manager New Order Message', 'admin_and_manager_new_order_message', 'You have a new order.', 'You have a new order.', 'You have a new order.', 10, 10, 10, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_serial_no` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(13,6) NOT NULL,
  `tax` decimal(13,6) DEFAULT 0.000000,
  `discount` decimal(13,6) DEFAULT 0.000000,
  `shipping_charge` decimal(13,6) DEFAULT 0.000000,
  `total` decimal(13,6) NOT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT 5,
  `order_datetime` timestamp NOT NULL DEFAULT '2024-09-17 23:09:27',
  `payment_method` bigint(20) NOT NULL DEFAULT 1,
  `payment_status` tinyint(4) NOT NULL DEFAULT 10,
  `status` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 10,
  `reason` text DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_areas`
--

CREATE TABLE `order_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `shipping_cost` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_coupons`
--

CREATE TABLE `order_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `discount` decimal(13,6) NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_outlet_addresses`
--

CREATE TABLE `order_outlet_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `zip_code` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `phone` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outlets`
--

CREATE TABLE `outlets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `zip_code` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `menu_section_id` bigint(20) UNSIGNED NOT NULL,
  `menu_template_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `misc` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 'cashondelivery', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(2, 'Credit', 'credit', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(3, 'Paypal', 'paypal', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(4, 'Stripe', 'stripe', '{\"input\":[\"stripe.stripeInput.blade.php\"],\"js\":[\"stripe.stripeJs.blade.php\"],\"onClick\":false,\"submit\":true}', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(5, 'Flutterwave', 'flutterwave', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(6, 'Paystack', 'paystack', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(7, 'SslCommerz', 'sslcommerz', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(8, 'Mollie', 'mollie', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(9, 'Senangpay', 'senangpay', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(10, 'Bkash', 'bkash', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(11, 'Paytm', 'paytm', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(12, 'Razorpay', 'razorpay', '{\"input\":[],\"js\":[\"razorpay.razorpayJs.blade.php\"],\"onClick\":true,\"submit\":true}', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(13, 'Mercadopago', 'mercadopago', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(14, 'Cashfree', 'cashfree', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(15, 'Payfast', 'payfast', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(16, 'Skrill', 'skrill', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(17, 'PhonePe', 'phonepe', 'null', 10, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `name`, `guard_name`, `url`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'sanctum', 'dashboard', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(2, 'Products', 'products', 'sanctum', 'products', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(3, 'Products Create', 'products_create', 'sanctum', 'products/create', 2, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(4, 'Products Edit', 'products_edit', 'sanctum', 'products/edit', 2, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(5, 'Products Delete', 'products_delete', 'sanctum', 'products/delete', 2, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(6, 'Products Show', 'products_show', 'sanctum', 'products/show', 2, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(7, 'Purchase', 'purchase', 'sanctum', 'purchase', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(8, 'Purchase Create', 'purchase_create', 'sanctum', 'purchase/create', 7, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(9, 'Purchase Edit', 'purchase_edit', 'sanctum', 'purchase/edit', 7, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(10, 'Purchase Delete', 'purchase_delete', 'sanctum', 'purchase/delete', 7, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(11, 'Purchase Show', 'purchase_show', 'sanctum', 'purchase/show', 7, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(12, 'Damages', 'damages', 'sanctum', 'damages', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(13, 'Damage Create', 'damage_create', 'sanctum', 'damages/create', 12, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(14, 'Damage Edit', 'damage_edit', 'sanctum', 'damages/edit', 12, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(15, 'Damage Delete', 'damage_delete', 'sanctum', 'damages/delete', 12, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(16, 'Damage Show', 'damage_show', 'sanctum', 'damages/show', 12, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(17, 'Stock', 'stock', 'sanctum', 'stock', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(18, 'POS', 'pos', 'sanctum', 'pos', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(19, 'POS Orders', 'pos-orders', 'sanctum', 'pos-orders', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(20, 'Online Orders', 'online-orders', 'sanctum', 'online-orders', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(21, 'Return And Refunds', 'return-and-refunds', 'sanctum', 'return-and-refunds', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(22, 'Return Orders', 'return-orders', 'sanctum', 'return-orders', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(23, 'Return Order Create', 'return_order_create', 'sanctum', 'return-orders/create', 22, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(24, 'Return Order Edit', 'return_order_edit', 'sanctum', 'return-orders/edit', 22, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(25, 'Return Order Delete', 'return_order_delete', 'sanctum', 'return-orders/delete', 22, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(26, 'Return Order Show', 'return_order_show', 'sanctum', 'return-orders/show', 22, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(27, 'Coupons', 'coupons', 'sanctum', 'coupons', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(28, 'Coupons Create', 'coupons_create', 'sanctum', 'coupons/create', 27, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(29, 'Coupons Edit', 'coupons_edit', 'sanctum', 'coupons/edit', 27, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(30, 'Coupons Delete', 'coupons_delete', 'sanctum', 'coupons/delete', 27, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(31, 'Coupons Show', 'coupons_show', 'sanctum', 'coupons/show', 27, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(32, 'Promotions', 'promotions', 'sanctum', 'promotions', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(33, 'Promotions Create', 'promotions_create', 'sanctum', 'promotions/create', 32, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(34, 'Promotions Edit', 'promotions_edit', 'sanctum', 'promotions/edit', 32, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(35, 'Promotions Delete', 'promotions_delete', 'sanctum', 'promotions/delete', 32, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(36, 'Promotions Show', 'promotions_show', 'sanctum', 'promotions/show', 32, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(37, 'Product Sections', 'product-sections', 'sanctum', 'product-sections', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(38, 'Product Sections Create', 'product-sections_create', 'sanctum', 'product-sections/create', 37, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(39, 'Product Sections Edit', 'product-sections_edit', 'sanctum', 'product-sections/edit', 37, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(40, 'Product Sections Delete', 'product-sections_delete', 'sanctum', 'product-sections/delete', 37, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(41, 'Product Sections Show', 'product-sections_show', 'sanctum', 'product-sections/show', 37, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(42, 'Push Notifications', 'push-notifications', 'sanctum', 'push-notifications', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(43, 'Push Notifications Create', 'push-notifications_create', 'sanctum', 'push-notifications/create', 42, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(44, 'Push Notifications Edit', 'push-notifications_edit', 'sanctum', 'push-notifications/edit', 42, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(45, 'Push Notifications Delete', 'push-notifications_delete', 'sanctum', 'push-notifications/delete', 42, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(46, 'Push Notifications Show', 'push-notifications_show', 'sanctum', 'push-notifications/show', 42, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(47, 'Subscribers', 'subscribers', 'sanctum', 'subscribers', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(48, 'Administrators', 'administrators', 'sanctum', 'administrators', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(49, 'Administrators Create', 'administrators_create', 'sanctum', 'administrators/create', 48, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(50, 'Administrators Edit', 'administrators_edit', 'sanctum', 'administrators/edit', 48, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(51, 'Administrators Delete', 'administrators_delete', 'sanctum', 'administrators/delete', 48, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(52, 'Administrators Show', 'administrators_show', 'sanctum', 'administrators/show', 48, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(53, 'Customers', 'customers', 'sanctum', 'customers', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(54, 'Customers Create', 'customers_create', 'sanctum', 'customers/create', 53, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(55, 'Customers Edit', 'customers_edit', 'sanctum', 'customers/edit', 53, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(56, 'Customers Delete', 'customers_delete', 'sanctum', 'customers/delete', 53, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(57, 'Customers Show', 'customers_show', 'sanctum', 'customers/show', 53, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(58, 'Employees', 'employees', 'sanctum', 'employees', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(59, 'Employees Create', 'employees_create', 'sanctum', 'employees/create', 58, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(60, 'Employees Edit', 'employees_edit', 'sanctum', 'employees/edit', 58, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(61, 'Employees Delete', 'employees_delete', 'sanctum', 'employees/delete', 58, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(62, 'Employees Show', 'employees_show', 'sanctum', 'employees/show', 58, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(63, 'Transactions', 'transactions', 'sanctum', 'transactions', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(64, 'Sales Report', 'sales-report', 'sanctum', 'sales-report', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(65, 'Products Report', 'products-report', 'sanctum', 'products-report', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(66, 'Credit Balance Report', 'credit-balance-report', 'sanctum', 'credit-balance-report', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(67, 'Settings', 'settings', 'sanctum', 'settings', 0, '2024-09-18 11:24:31', '2024-09-18 11:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `sku` varchar(191) NOT NULL,
  `product_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `barcode_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `buying_price` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `selling_price` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `variation_price` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `order` bigint(20) NOT NULL DEFAULT 1,
  `can_purchasable` tinyint(4) NOT NULL DEFAULT 5,
  `show_stock_out` tinyint(4) NOT NULL DEFAULT 5,
  `maximum_purchase_quantity` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `low_stock_quantity_warning` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `weight` varchar(191) DEFAULT NULL,
  `refundable` tinyint(4) NOT NULL DEFAULT 5,
  `description` longtext DEFAULT NULL,
  `shipping_and_return` longtext DEFAULT NULL,
  `add_to_flash_sale` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `discount` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `offer_start_date` datetime DEFAULT NULL,
  `offer_end_date` datetime DEFAULT NULL,
  `shipping_type` tinyint(4) NOT NULL DEFAULT 5,
  `shipping_cost` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `is_product_quantity_multiply` tinyint(4) NOT NULL DEFAULT 10,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_options`
--

CREATE TABLE `product_attribute_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_brands`
--

CREATE TABLE `product_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `star` tinyint(4) NOT NULL,
  `review` longtext NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sections`
--

CREATE TABLE `product_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_section_products`
--

CREATE TABLE `product_section_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_section_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_seos`
--

CREATE TABLE `product_seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `meta_keyword` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`meta_keyword`)),
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_option_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(13,6) DEFAULT 0.000000,
  `sku` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 100,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `video_provider` tinyint(4) NOT NULL,
  `link` text NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_products`
--

CREATE TABLE `promotion_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(191) DEFAULT NULL,
  `tax` decimal(13,6) DEFAULT 0.000000,
  `discount` decimal(13,6) DEFAULT 0.000000,
  `subtotal` decimal(13,6) NOT NULL,
  `total` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 15,
  `payment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `note` text DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(191) DEFAULT NULL,
  `amount` decimal(13,6) NOT NULL,
  `payment_method` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_and_refunds`
--

CREATE TABLE `return_and_refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_reason_id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_serial_no` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_and_refund_products`
--

CREATE TABLE `return_and_refund_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_and_refund_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variation_names` varchar(191) DEFAULT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT 1,
  `price` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `total` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `return_price` decimal(13,6) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_orders`
--

CREATE TABLE `return_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(191) DEFAULT NULL,
  `subtotal` decimal(13,6) NOT NULL,
  `tax` decimal(13,6) DEFAULT 0.000000,
  `discount` decimal(13,6) DEFAULT 0.000000,
  `total` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `reason` text DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_reasons`
--

CREATE TABLE `return_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'sanctum', '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(2, 'Customer', 'sanctum', '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(3, 'Manager', 'sanctum', '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(4, 'POS Operator', 'sanctum', '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(5, 'Stuff', 'sanctum', '2024-09-18 11:24:31', '2024-09-18 11:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(18, 3),
(18, 4),
(19, 1),
(19, 3),
(19, 4),
(20, 1),
(20, 3),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(66, 1),
(67, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(191) DEFAULT NULL,
  `key` varchar(191) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `settingable_type` varchar(191) DEFAULT NULL,
  `settingable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `key`, `payload`, `settingable_type`, `settingable_id`, `created_at`, `updated_at`) VALUES
(1, 'company', 'company_name', '{\"$value\":\"ShopKing - eCommerce App with Laravel Website & Admin Panel with POS | Inventory Management\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(2, 'company', 'company_email', '{\"$value\":\"info@inilabs.net\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(3, 'company', 'company_calling_code', '{\"$value\":\"+880\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(4, 'company', 'company_phone', '{\"$value\":\"13333846282\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(5, 'company', 'company_website', '{\"$value\":\"https:\\/\\/foodking.dev\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(6, 'company', 'company_city', '{\"$value\":\"Mirpur 1\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(7, 'company', 'company_state', '{\"$value\":\"Dhaka\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(8, 'company', 'company_country_code', '{\"$value\":\"BGD\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(9, 'company', 'company_zip_code', '{\"$value\":\"1216\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(10, 'company', 'company_latitude', '{\"$value\":\"23.7699072\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(11, 'company', 'company_longitude', '{\"$value\":\"90.3643136\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(12, 'company', 'company_address', '{\"$value\":\"House : 25, Road No: 2, Block A, Mirpur-1, Dhaka 1216\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:30', '2024-09-18 11:24:30'),
(13, 'theme', 'theme_logo', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(14, 'theme', 'theme_favicon_logo', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(15, 'theme', 'theme_footer_logo', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(16, 'cookies', 'cookies_details_page_id', '{\"$value\":0,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(17, 'cookies', 'cookies_summary', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(18, 'site', 'site_date_format', '{\"$value\":\"d-m-Y\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(19, 'site', 'site_time_format', '{\"$value\":\"h:i A\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(20, 'site', 'site_default_timezone', '{\"$value\":\"Asia\\/Dhaka\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(21, 'site', 'site_default_currency', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(22, 'site', 'site_default_currency_symbol', '{\"$value\":\"$\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(23, 'site', 'site_currency_position', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(24, 'site', 'site_digit_after_decimal_point', '{\"$value\":\"2\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(25, 'site', 'site_email_verification', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(26, 'site', 'site_phone_verification', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(27, 'site', 'site_default_language', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(28, 'site', 'site_android_app_link', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(29, 'site', 'site_ios_app_link', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(30, 'site', 'site_copyright', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(31, 'site', 'site_language_switch', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(32, 'site', 'site_app_debug', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(33, 'site', 'site_auto_update', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(34, 'site', 'site_online_payment_gateway', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(35, 'site', 'site_default_sms_gateway', '{\"$value\":0,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(36, 'site', 'site_cash_on_delivery', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(37, 'site', 'site_non_purchase_product_maximum_quantity', '{\"$value\":\"100\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(38, 'site', 'site_is_return_product_price_add_to_credit', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:31', '2024-09-18 11:24:31'),
(39, 'otp', 'otp_type', '{\"$value\":\"5\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(40, 'otp', 'otp_digit_limit', '{\"$value\":\"4\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(41, 'otp', 'otp_expire_time', '{\"$value\":\"10\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(42, 'social_media', 'social_media_facebook', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(43, 'social_media', 'social_media_youtube', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(44, 'social_media', 'social_media_instagram', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(45, 'social_media', 'social_media_twitter', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(46, 'shipping_setup', 'shipping_setup_method', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(47, 'shipping_setup', 'shipping_setup_flat_rate_wise_cost', '{\"$value\":\"10\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(48, 'shipping_setup', 'shipping_setup_area_wise_default_cost', '{\"$value\":\"10\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(49, 'mail', 'mail_mailer', '{\"$value\":\"smtp\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(50, 'mail', 'mail_host', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(51, 'mail', 'mail_port', '{\"$value\":0,\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(52, 'mail', 'mail_username', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(53, 'mail', 'mail_password', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(54, 'mail', 'mail_encryption', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(55, 'mail', 'mail_from_name', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(56, 'mail', 'mail_from_email', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(57, 'notification', 'notification_fcm_secret_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(58, 'notification', 'notification_fcm_public_vapid_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(59, 'notification', 'notification_fcm_api_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(60, 'notification', 'notification_fcm_auth_domain', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(61, 'notification', 'notification_fcm_project_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(62, 'notification', 'notification_fcm_storage_bucket', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(63, 'notification', 'notification_fcm_messaging_sender_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(64, 'notification', 'notification_fcm_app_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(65, 'notification', 'notification_fcm_measurement_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36'),
(66, 'license', 'license_key', '{\"$value\":\"i9u99tt4-f0w6-71w7-8394-y968t02516r11\",\"$cast\":null}', NULL, NULL, '2024-09-18 11:24:36', '2024-09-18 11:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `link` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `misc` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Twilio', 'twilio', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(2, 'Clickatell', 'clickatell', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(3, 'Nexmo', 'nexmo', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(4, 'Msg91', 'msg91', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(5, '2Factor', 'twofactor', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(6, 'Bulksms', 'bulksms', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(7, 'Bulksmsbd', 'bulksmsbd', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35'),
(8, 'Telesign', 'telesign', 'null', 5, NULL, NULL, NULL, NULL, '2024-09-18 11:24:35', '2024-09-18 11:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `item_type` varchar(191) NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `variation_names` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `price` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `quantity` bigint(20) NOT NULL DEFAULT 1,
  `discount` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `subtotal` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `tax` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `total` decimal(13,6) UNSIGNED NOT NULL DEFAULT 0.000000,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_taxes`
--

CREATE TABLE `stock_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `tax_rate` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `tax_amount` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `tax_rate` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sign` varchar(191) NOT NULL DEFAULT '+',
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_no` varchar(191) NOT NULL,
  `amount` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `payment_method` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'payment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `device_token` varchar(191) DEFAULT NULL,
  `web_token` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `country_code` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `balance` decimal(13,6) NOT NULL DEFAULT 0.000000,
  `remember_token` varchar(100) DEFAULT NULL,
  `creator_type` varchar(191) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(191) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `username`, `email_verified_at`, `password`, `device_token`, `web_token`, `status`, `country_code`, `is_guest`, `balance`, `remember_token`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ahmed Nabil', 'ahmed@gmail.com', '01016856433', 'ahmed-nabil', '2024-09-18 11:24:31', '$2y$10$lJ6p77J.ED.71YqpO6byRu217JbIOPnQtiaYvOyPR13OCOOWugOEa', NULL, NULL, 5, '+20', 10, 0.000000, NULL, NULL, NULL, NULL, NULL, '2024-09-18 11:24:32', '2024-09-18 11:24:32', NULL),
(2, 'Ahmed Customer', 'ahmed@customer.com', '01141090116', 'ahmed-customer', '2024-09-18 11:24:32', '$2y$10$iGHGepNDVZamWCFOcxhh/.MkK2WCSpfGQ5L.qA9KVaK8VFcdZScMy', NULL, NULL, 5, '+20', 10, 0.000000, NULL, NULL, NULL, NULL, NULL, '2024-09-18 11:24:32', '2024-09-18 11:24:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytic_sections_analytic_id_foreign` (`analytic_id`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_access`
--
ALTER TABLE `default_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gateway_options`
--
ALTER TABLE `gateway_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_sections`
--
ALTER TABLE `menu_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_templates`
--
ALTER TABLE `menu_templates`
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
-- Indexes for table `notification_alerts`
--
ALTER TABLE `notification_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_id_foreign` (`order_id`),
  ADD KEY `order_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_areas`
--
ALTER TABLE `order_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_coupons`
--
ALTER TABLE `order_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_coupons_order_id_foreign` (`order_id`),
  ADD KEY `order_coupons_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_outlet_addresses`
--
ALTER TABLE `order_outlet_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_outlet_addresses_order_id_foreign` (`order_id`),
  ADD KEY `order_outlet_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD KEY `otps_phone_index` (`phone`);

--
-- Indexes for table `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_menu_section_id_foreign` (`menu_section_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_product_category_id_foreign` (`product_category_id`),
  ADD KEY `products_product_brand_id_foreign` (`product_brand_id`),
  ADD KEY `products_barcode_id_foreign` (`barcode_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attribute_options`
--
ALTER TABLE `product_attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attribute_options_product_attribute_id_foreign` (`product_attribute_id`);

--
-- Indexes for table `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_slug_unique` (`slug`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sections`
--
ALTER TABLE `product_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_section_products`
--
ALTER TABLE `product_section_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_section_products_product_section_id_foreign` (`product_section_id`),
  ADD KEY `product_section_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_seos`
--
ALTER TABLE `product_seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_seos_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tags_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_taxes_product_id_foreign` (`product_id`),
  ADD KEY `product_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_product_id_foreign` (`product_id`),
  ADD KEY `product_variations_product_attribute_id_foreign` (`product_attribute_id`),
  ADD KEY `product_variations_product_attribute_option_id_foreign` (`product_attribute_option_id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_products`
--
ALTER TABLE `promotion_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_products_promotion_id_foreign` (`promotion_id`),
  ADD KEY `promotion_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_and_refunds`
--
ALTER TABLE `return_and_refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_and_refunds_return_reason_id_foreign` (`return_reason_id`);

--
-- Indexes for table `return_and_refund_products`
--
ALTER TABLE `return_and_refund_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_orders`
--
ALTER TABLE `return_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `return_reasons`
--
ALTER TABLE `return_reasons`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_settingable_type_settingable_id_index` (`settingable_type`,`settingable_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `stock_taxes`
--
ALTER TABLE `stock_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_taxes_stock_id_foreign` (`stock_id`),
  ADD KEY `stock_taxes_product_id_foreign` (`product_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `analytics`
--
ALTER TABLE `analytics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `default_access`
--
ALTER TABLE `default_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateway_options`
--
ALTER TABLE `gateway_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `menu_sections`
--
ALTER TABLE `menu_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_templates`
--
ALTER TABLE `menu_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `notification_alerts`
--
ALTER TABLE `notification_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_areas`
--
ALTER TABLE `order_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_coupons`
--
ALTER TABLE `order_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_outlet_addresses`
--
ALTER TABLE `order_outlet_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outlets`
--
ALTER TABLE `outlets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_attribute_options`
--
ALTER TABLE `product_attribute_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_brands`
--
ALTER TABLE `product_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sections`
--
ALTER TABLE `product_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_section_products`
--
ALTER TABLE `product_section_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_seos`
--
ALTER TABLE `product_seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_products`
--
ALTER TABLE `promotion_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_and_refunds`
--
ALTER TABLE `return_and_refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_and_refund_products`
--
ALTER TABLE `return_and_refund_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_orders`
--
ALTER TABLE `return_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_reasons`
--
ALTER TABLE `return_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_taxes`
--
ALTER TABLE `stock_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  ADD CONSTRAINT `analytic_sections_analytic_id_foreign` FOREIGN KEY (`analytic_id`) REFERENCES `analytics` (`id`);

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_coupons`
--
ALTER TABLE `order_coupons`
  ADD CONSTRAINT `order_coupons_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_outlet_addresses`
--
ALTER TABLE `order_outlet_addresses`
  ADD CONSTRAINT `order_outlet_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_outlet_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_menu_section_id_foreign` FOREIGN KEY (`menu_section_id`) REFERENCES `menu_sections` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_barcode_id_foreign` FOREIGN KEY (`barcode_id`) REFERENCES `barcodes` (`id`),
  ADD CONSTRAINT `products_product_brand_id_foreign` FOREIGN KEY (`product_brand_id`) REFERENCES `product_brands` (`id`),
  ADD CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `product_attribute_options`
--
ALTER TABLE `product_attribute_options`
  ADD CONSTRAINT `product_attribute_options_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_section_products`
--
ALTER TABLE `product_section_products`
  ADD CONSTRAINT `product_section_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_section_products_product_section_id_foreign` FOREIGN KEY (`product_section_id`) REFERENCES `product_sections` (`id`);

--
-- Constraints for table `product_seos`
--
ALTER TABLE `product_seos`
  ADD CONSTRAINT `product_seos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD CONSTRAINT `product_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`);

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`),
  ADD CONSTRAINT `product_variations_product_attribute_option_id_foreign` FOREIGN KEY (`product_attribute_option_id`) REFERENCES `product_attribute_options` (`id`),
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `promotion_products`
--
ALTER TABLE `promotion_products`
  ADD CONSTRAINT `promotion_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `promotion_products_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`);

--
-- Constraints for table `return_and_refunds`
--
ALTER TABLE `return_and_refunds`
  ADD CONSTRAINT `return_and_refunds_return_reason_id_foreign` FOREIGN KEY (`return_reason_id`) REFERENCES `return_reasons` (`id`);

--
-- Constraints for table `return_orders`
--
ALTER TABLE `return_orders`
  ADD CONSTRAINT `return_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `stock_taxes`
--
ALTER TABLE `stock_taxes`
  ADD CONSTRAINT `stock_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `stock_taxes_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
