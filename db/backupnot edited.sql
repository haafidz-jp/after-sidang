-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2021 at 06:49 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `haafidzx_pici4`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Site Administrator'),
(2, 'karyawan', 'Karyawan');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1),
(1, 1),
(1, 2),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 1),
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '127.0.0.1', 'user@gmail.com', 1, '2021-01-15 23:12:36', 1),
(2, '127.0.0.1', 'user@gmail.com', 1, '2021-01-15 23:13:38', 1),
(3, '127.0.0.1', 'ilhamlutfi153@gmail.com', NULL, '2021-01-15 23:27:38', 0),
(4, '127.0.0.1', 'user@gmail.com', 1, '2021-01-15 23:27:46', 1),
(5, '::1', 'gabuslegon@gmail.com', NULL, '2021-04-20 08:55:19', 0),
(6, '::1', 'user@gmail.com', 1, '2021-04-20 08:55:47', 1),
(7, '::1', 'gabuslegon@gmail.com', NULL, '2021-04-23 00:41:43', 0),
(8, '::1', 'gabuslegon@gmail.com', NULL, '2021-04-23 00:41:47', 0),
(9, '::1', 'gabuslegon@gmail.com', NULL, '2021-04-23 00:41:52', 0),
(10, '::1', 'gabuslegon@gmail.com', NULL, '2021-04-23 00:41:57', 0),
(11, '::1', 'user@gmail.com', 1, '2021-04-23 00:42:28', 1),
(12, '::1', 'user@gmail.com', 1, '2021-04-23 01:02:04', 1),
(13, '::1', 'user@gmail.com', 1, '2021-04-23 01:31:10', 1),
(14, '::1', 'user@gmail.com', 1, '2021-04-23 01:33:46', 1),
(15, '::1', 'gabuslegon@gmail.com', NULL, '2021-04-26 00:24:57', 0),
(16, '::1', 'user@gmail.com', 1, '2021-04-26 00:32:45', 1),
(17, '::1', 'user@gmail.com', 1, '2021-04-26 02:21:10', 1),
(18, '::1', 'user@gmail.com', 1, '2021-04-26 02:34:16', 1),
(19, '::1', 'user@gmail.com', 1, '2021-04-26 02:49:47', 1),
(20, '::1', 'user@gmail.com', 1, '2021-04-26 03:09:44', 1),
(21, '::1', 'starter123', NULL, '2021-05-06 01:42:29', 0),
(22, '::1', 'user@gmail.com', 1, '2021-05-06 01:42:39', 1),
(23, '::1', 'user@gmail.com', 1, '2021-05-06 02:17:03', 1),
(24, '::1', 'user@gmail.com', 1, '2021-05-21 21:38:52', 1),
(25, '::1', 'user@gmail.com', 1, '2021-05-25 22:05:02', 1),
(26, '::1', 'user@gmail.com', 1, '2021-05-25 23:53:52', 1),
(27, '::1', 'user@gmail.com', 1, '2021-05-30 00:23:58', 1),
(28, '::1', 'user@gmail.com', 1, '2021-06-12 12:29:44', 1),
(29, '::1', 'user@gmail.com', 1, '2021-06-13 03:12:39', 1),
(30, '::1', 'user@gmail.com', 1, '2021-06-24 08:57:01', 1),
(31, '::1', 'star', NULL, '2021-06-24 08:59:04', 0),
(32, '::1', 'user@gmail.com', 1, '2021-06-24 09:14:20', 1),
(33, '::1', 'user@gmail.com', 1, '2021-06-24 09:31:00', 1),
(34, '::1', 'user@gmail.com', 1, '2021-06-24 09:37:49', 1),
(35, '::1', 'user@gmail.com', 1, '2021-06-24 09:43:29', 1),
(36, '::1', 'haafidz123@gmail.com', NULL, '2021-06-24 09:45:31', 0),
(37, '::1', 'user@gmail.com', 1, '2021-06-24 09:45:42', 1),
(38, '::1', 'user@gmail.com', 1, '2021-06-24 09:47:22', 1),
(39, '::1', 'user@gmail.com', 1, '2021-06-24 09:55:36', 1),
(40, '::1', 'user@gmail.com', 1, '2021-06-24 10:46:44', 1),
(41, '::1', 'user@gmail.com', 1, '2021-06-24 10:47:17', 1),
(42, '::1', 'user@gmail.com', 1, '2021-06-30 22:58:05', 1),
(43, '::1', 'user@gmail.com', 1, '2021-06-30 23:10:47', 1),
(44, '::1', 'user@gmail.com', 1, '2021-07-01 01:44:37', 1),
(45, '::1', 'user@gmail.com', 1, '2021-07-02 01:25:51', 1),
(46, '::1', 'user@gmail.com', 1, '2021-07-03 11:20:42', 1),
(47, '::1', 'user@gmail.com', 1, '2021-07-03 11:22:35', 1),
(48, '::1', 'user@gmail.com', 1, '2021-07-03 11:23:02', 1),
(49, '::1', 'user@gmail.com', 1, '2021-07-04 09:00:34', 1),
(50, '::1', 'user@gmail.com', 1, '2021-07-04 09:19:34', 1),
(51, '::1', 'user@gmail.com', 1, '2021-07-04 09:27:09', 1),
(52, '::1', 'user@gmail.com', 1, '2021-07-04 09:35:27', 1),
(53, '180.252.125.33', 'user@gmail.com', 1, '2021-07-05 05:54:28', 1),
(54, '180.252.125.33', 'user@gmail.com', 1, '2021-07-05 07:00:02', 1),
(55, '180.252.125.33', 'user@gmail.com', 1, '2021-07-05 09:02:21', 1),
(56, '180.252.125.33', 'user@gmail.com', 1, '2021-07-05 09:36:29', 1),
(57, '180.252.125.33', 'user@gmail.com', 1, '2021-07-05 10:49:52', 1),
(58, '116.206.29.4', 'Jajsjssjj@gmail.com', NULL, '2021-07-08 13:31:36', 0),
(59, '180.244.165.158', 'user@gmail.com', 1, '2021-07-11 00:34:51', 1),
(60, '180.244.162.169', 'user@gmail.com', 1, '2021-08-09 06:33:38', 1),
(61, '180.244.162.169', 'user@gmail.com', 1, '2021-08-10 23:45:30', 1),
(62, '180.244.162.169', 'user@gmail.com', 1, '2021-08-10 23:55:53', 1),
(63, '180.244.162.169', 'user@gmail.com', 1, '2021-08-10 23:57:34', 1),
(64, '180.244.162.169', 'user@gmail.com', 1, '2021-08-11 01:40:41', 1),
(65, '180.244.162.169', 'user@gmail.com', 1, '2021-08-11 01:41:23', 1),
(66, '180.244.162.169', 'user@gmail.com', 1, '2021-08-11 10:26:02', 1),
(67, '180.244.173.116', 'user@gmail.com', 1, '2021-08-23 02:49:52', 1),
(68, '180.244.173.116', 'user@gmail.com', 1, '2021-08-23 03:35:40', 1),
(69, '8.47.15.109', 'user@gmail.com', 1, '2021-08-25 23:41:22', 1),
(70, '8.47.15.109', 'user@gmail.com', 1, '2021-08-26 02:53:27', 1),
(71, '8.47.15.109', 'starter12345@gmail.com', NULL, '2021-08-26 02:54:50', 0),
(72, '8.47.15.109', 'user@gmail.com', 1, '2021-08-26 02:54:57', 1),
(73, '180.252.123.144', 'user@gmail.com', 1, '2021-08-28 22:41:15', 1),
(74, '180.252.122.228', 'user@gmail.com', 1, '2021-09-01 22:23:33', 1),
(75, '182.0.201.143', 'user@gmail.com', 1, '2021-09-09 23:14:21', 1),
(76, '::1', 'user@gmail.com', 1, '2021-09-10 02:14:02', 1),
(77, '::1', 'user@gmail.com', 1, '2021-09-11 00:08:38', 1),
(78, '::1', 'user@gmail.com', 1, '2021-09-11 04:18:23', 1),
(79, '::1', 'user@gmail.com', 1, '2021-09-12 22:59:54', 1),
(80, '::1', 'user@gmail.com', 1, '2021-09-13 01:55:01', 1),
(81, '::1', 'user@gmail.com', 1, '2021-09-14 01:28:05', 1),
(82, '::1', 'user@gmail.com', 1, '2021-09-14 03:03:01', 1),
(83, '::1', 'user@gmail.com', 1, '2021-09-15 00:07:13', 1),
(84, '::1', 'user@gmail.com', 1, '2021-09-15 20:49:28', 1),
(85, '::1', 'user@gmail.com', 1, '2021-09-15 22:04:20', 1),
(86, '::1', 'user@gmail.com', 1, '2021-09-15 23:09:19', 1),
(87, '::1', 'user@gmail.com', 1, '2021-09-17 02:49:03', 1),
(88, '::1', 'user@gmail.com', 1, '2021-09-17 07:38:12', 1),
(89, '::1', 'user@gmail.com', 1, '2021-09-17 10:58:23', 1),
(90, '::1', 'user@gmail.com', 1, '2021-09-19 21:16:13', 1),
(91, '::1', 'user@gmail.com', 1, '2021-09-21 22:37:10', 1),
(92, '::1', 'user@gmail.com', 1, '2021-09-22 06:40:34', 1),
(93, '::1', 'user@gmail.com', 1, '2021-09-22 22:13:24', 1),
(94, '::1', 'user@gmail.com', 1, '2021-09-23 00:52:12', 1),
(95, '::1', 'user@gmail.com', 1, '2021-09-24 21:53:04', 1),
(96, '::1', 'user@gmail.com', 1, '2021-09-26 00:07:03', 1),
(97, '::1', 'user@gmail.com', 1, '2021-09-26 01:44:24', 1),
(98, '::1', 'user@gmail.com', 1, '2021-09-26 06:39:21', 1),
(99, '::1', 'user@gmail.com', 1, '2021-09-26 22:03:52', 1),
(100, '::1', 'user@gmail.com', 1, '2021-09-26 22:06:05', 1),
(101, '::1', 'user@gmail.com', 1, '2021-09-26 22:07:56', 1),
(102, '::1', 'user@gmail.com', 1, '2021-09-28 07:33:44', 1),
(103, '::1', 'user@gmail.com', 1, '2021-09-28 10:34:15', 1),
(104, '::1', 'user@gmail.com', 1, '2021-09-29 04:37:54', 1),
(105, '::1', 'user@gmail.com', 1, '2021-10-01 00:49:30', 1),
(106, '::1', 'user@gmail.com', 1, '2021-10-01 07:20:30', 1),
(107, '::1', 'user@gmail.com', 1, '2021-10-01 22:24:25', 1),
(108, '::1', 'user123', NULL, '2021-10-02 00:36:16', 0),
(109, '::1', 'haafidzxyz', 3, '2021-10-02 01:01:44', 0),
(110, '::1', 'haafidz123@gmail.com', 3, '2021-10-02 01:02:05', 1),
(111, '::1', 'admin@haafidz.xyz', 1, '2021-10-02 01:24:02', 1),
(112, '::1', 'karyawan@haafidz.xyz', 3, '2021-10-02 01:24:16', 1),
(113, '::1', 'karyawan@haafidz.xyz', 3, '2021-10-02 03:18:32', 1),
(114, '::1', 'starter12345', NULL, '2021-10-02 03:21:28', 0),
(115, '::1', 'admin@haafidz.xyz', 1, '2021-10-02 03:21:35', 1),
(116, '::1', 'karyawan@haafidz.xyz', 3, '2021-10-02 06:56:10', 1),
(117, '::1', 'admin@haafidz.xyz', 1, '2021-10-02 10:49:45', 1),
(118, '::1', 'admin@haafidz.xyz', 1, '2021-10-03 06:57:13', 1),
(119, '::1', 'karyawan@haafidz.xyz', 3, '2021-10-03 09:28:52', 1),
(120, '::1', 'admin@haafidz.xyz', 1, '2021-10-03 09:48:43', 1),
(121, '::1', 'karyawan@haafidz.xyz', 3, '2021-10-03 11:54:07', 1),
(122, '::1', 'admin@haafidz.xyz', 1, '2021-10-03 12:00:48', 1),
(123, '::1', 'karyawan@haafidz.xyz', 2, '2021-10-03 12:01:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'manage-users', 'Manage All User'),
(2, 'manage-profile', 'Manage User\'s Profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(3) NOT NULL,
  `category_name` varchar(32) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Alat Tulis'),
(2, 'Buku Gambar'),
(3, 'Buku Tulis'),
(4, 'Document Organizer'),
(5, 'Kertas'),
(6, 'Lain-Lain'),
(7, 'Pengikat & Perekat'),
(8, 'Surat-Menyurat');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1610773486, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode_produk` varchar(10) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `category` int(3) NOT NULL,
  `sub_category` varchar(10) CHARACTER SET utf8 NOT NULL,
  `supplier` int(3) NOT NULL,
  `merk` varchar(15) CHARACTER SET utf8 NOT NULL,
  `kuantitas` int(9) NOT NULL,
  `satuan` varchar(5) CHARACTER SET utf8 NOT NULL,
  `sku` varchar(13) CHARACTER SET utf8 NOT NULL,
  `user_created` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode_produk`, `name`, `category`, `sub_category`, `supplier`, `merk`, `kuantitas`, `satuan`, `sku`, `user_created`, `created_at`, `update_at`) VALUES
(1, 'PR000001', 'Faber Castell 2B', 1, 'ATPEN2B', 1, 'Faber Castell', 8, 'PAK', '4005401990079', 1, '2021-05-07 14:58:24', '2021-10-04 00:31:38'),
(2, 'PR000002', 'Buku Gambar A3 SINTARO', 2, 'BGA3', 1, 'SINTARO', 2, 'PAK', '8993988286066', 1, '2021-09-14 15:58:34', '2021-10-04 00:31:43'),
(3, 'PR000003', 'TIARA CAMPUS 38 LBR', 3, 'BT38', 1, 'TIARA', 3, 'PAK', '123', 1, '2021-09-17 16:19:20', '2021-10-04 00:31:45'),
(4, 'PR000004', 'Standard AE7', 1, 'ATPUL05', 1, 'STANDARD', 4, 'PAK', '1234567891011', 1, '2021-09-17 19:56:02', '2021-10-04 00:31:47'),
(5, 'PR000005', 'jangka 24', 6, 'LLJ', 1, 'Joyko', 0, 'PCS', '12345566', 1, '2021-09-28 23:47:11', '2021-10-04 00:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `produk_keluar`
--

CREATE TABLE `produk_keluar` (
  `kode_transaksi` varchar(10) CHARACTER SET utf8 NOT NULL,
  `tanggal` date NOT NULL,
  `kode_produk` varchar(10) CHARACTER SET utf8 NOT NULL,
  `jumlah_keluar` int(5) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_keluar`
--

INSERT INTO `produk_keluar` (`kode_transaksi`, `tanggal`, `kode_produk`, `jumlah_keluar`, `created_at`, `update_at`) VALUES
('PK000001', '2021-09-28', 'PR000001', 1, '2021-09-28 19:57:13', '2021-09-28 19:57:13'),
('PK000002', '2021-09-28', 'PR000001', 10, '2021-09-28 23:47:29', '2021-09-28 23:47:29'),
('PK000003', '2021-09-28', 'PR000001', 2, '2021-09-28 23:48:12', '2021-09-28 23:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `produk_masuk`
--

CREATE TABLE `produk_masuk` (
  `kode_transaksi` varchar(10) CHARACTER SET utf8 NOT NULL,
  `tanggal` date NOT NULL,
  `kode_produk` varchar(10) CHARACTER SET utf8 NOT NULL,
  `jumlah_masuk` int(5) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_masuk`
--

INSERT INTO `produk_masuk` (`kode_transaksi`, `tanggal`, `kode_produk`, `jumlah_masuk`, `created_at`, `update_at`) VALUES
('PM000001', '2021-09-17', 'PR000001', 5, '2021-09-17 23:18:43', '2021-09-17 23:18:43'),
('PM000002', '2021-09-23', 'PR000001', 7, '2021-09-23 13:12:35', '2021-09-23 13:12:35'),
('PM000003', '2021-09-26', 'PR000001', 10, '2021-09-26 12:07:45', '2021-09-26 12:07:45'),
('PM000004', '2021-09-26', 'PR000001', 1, '2021-09-26 12:37:58', '2021-09-26 12:37:58'),
('PM000005', '2021-09-28', 'PR000001', 5, '2021-09-28 23:21:04', '2021-09-28 23:21:04'),
('PM000006', '2021-09-28', 'PR000001', 5, '2021-09-28 23:33:07', '2021-09-28 23:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `subcategory_category_id` int(3) NOT NULL,
  `subcategory_id` varchar(10) CHARACTER SET utf8 NOT NULL,
  `subcategory_name` varchar(32) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`subcategory_category_id`, `subcategory_id`, `subcategory_name`) VALUES
(1, 'ATMECH', 'Pensil Mekanik'),
(1, 'ATPEN2B', 'Pensil 2B'),
(1, 'ATPENHB', 'Pensil HB'),
(1, 'ATPUL05', 'Pulpen Ukuran 0,5'),
(1, 'ATPUL07', 'Pulpen Ukuran 0,7'),
(1, 'ATSPIH', 'Spidol Hitam'),
(1, 'ATSPIW', 'Spidol Warna'),
(1, 'ATSTAB', 'Stabilo'),
(2, 'BGA3', 'Buku Gambar A3'),
(2, 'BGA4', 'Buku Gambar A4'),
(3, 'BT100', 'Buku Tulis 100 Lembar'),
(3, 'BT38', 'Buku Tulis 38 Lembar'),
(3, 'BT58', 'Buku Tulis 58 Lembar'),
(3, 'BTC', 'Buku Tulis Campus'),
(3, 'BTCAT', 'Buku Catatan'),
(3, 'BTFB', 'Buku Folio Besar'),
(3, 'BTFK', 'Buku Folio Kecil'),
(4, 'DOBF', 'Box File'),
(4, 'DOSMK', 'Stop Map Kertas'),
(4, 'DOSMM', 'Stop Map Mika'),
(5, 'KF', 'Kertas Folio'),
(5, 'KHVS4', 'Kertas HVS A4'),
(5, 'KHVSF', 'Kertas HVS Folio'),
(5, 'KK', 'Kertas Kado'),
(5, 'KL', 'Kertas Label'),
(5, 'KM', 'Kertas Manila'),
(7, 'LLA', 'Lem Aibon'),
(8, 'LLAC', 'Amplop Coklat'),
(8, 'LLAK', 'Amplop Kecil'),
(6, 'LLB', 'Busur'),
(6, 'LLBAT2', 'Baterai A2'),
(6, 'LLBAT3', 'Baterai A3'),
(6, 'LLC', 'Cutter'),
(6, 'LLCRAY', 'Crayon'),
(7, 'LLF', 'Lem Fox'),
(6, 'LLG', 'Gunting'),
(6, 'LLJ', 'Jangka'),
(6, 'LLKAL', 'Kalkulator'),
(6, 'LLPB', 'Penggaris Besi'),
(6, 'LLPP', 'Penggaris Plastik'),
(6, 'LLS', 'Stampad'),
(6, 'LLSPL', 'Sampul'),
(6, 'LLSTAP', 'Stapler'),
(6, 'LLTC', 'Tipe-x Cair'),
(6, 'LLTK', 'Tipe-x Kertas'),
(6, 'LLTS', 'Tinta Spidol');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `namevendor` varchar(30) CHARACTER SET utf8 NOT NULL,
  `namesales` varchar(30) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `address` text CHARACTER SET utf8 NOT NULL,
  `menyediakan` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_created` int(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `namevendor`, `namesales`, `phone`, `email`, `address`, `menyediakan`, `user_created`, `created_at`, `updated_at`) VALUES
(1, 'PT. Faber - Castell', 'Adam Sultan', '089612839233', 'supplier@fabercastell.com', 'Blok 00 No.1, Jl. Irian, Jatiwangi, Kec. Cikarang Barat, Bekasi, Jawa Barat 17530', 'Alat Tulis', 1, '2021-01-02 23:27:16', '2021-10-03 11:47:53'),
(2, 'PT.Standardpen Industries', 'Anton Himalaya', '021231324749', 'supplier@standardpen.id', 'Jl. Cideng Timur No.50 Jakarta Pusat 10160', 'Alat Tulis', 1, '2021-01-02 23:43:37', '2021-10-03 11:48:33'),
(3, 'PT. Atali Makmur', 'Budi Nurman', '02155961046', 'order@atalimakmur.com', 'Jl Kayu Besar Dlm 6-7 Kompl Pergudangan RT 001/08, Tegal Alur, Kalideres, Jakarta 11820', 'Alat Tulis', 1, '2021-07-02 03:24:38', '2021-10-03 11:49:05'),
(4, 'PT. Aica Indonesia', 'Dimas Nurahman', '02138901941', 'supplier@aica.co.id', 'Jl. Tanah Abang III No.23,25,27, Jakarta Pusat, DKI Jakarta 10160 Indonesia', 'Pengikat & Perekat', 1, '2021-07-02 03:27:51', '2021-10-03 11:49:47'),
(5, 'PT. Kenko Indonesia', 'Putri Mayasari', '0215262762', 'order@kenko.co.id', 'Gedung Utanco Lt 4, Jalan Haji R. Rasuna Said Kav B29 RT.5/RW.2, Setia Budi, RT.5/RW.2, Kuningan, Setia Budi, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12910', 'Alat Tulis', 1, '2021-07-02 03:29:26', '2021-10-03 11:50:15'),
(6, 'PT. SOLO MURNI – JAKARTA TIMUR', 'Juniadi', '0214601770', 'jakarta@kiky.com', 'Jl. Raya Penggilingan No.37 RT.7 RW.8 Cakung JAKARTA TIMUR - 13940', 'Alat Tulis', 1, '2021-07-02 03:31:12', '2021-10-03 11:51:00'),
(7, 'PT. ABC Indonesia', 'Fanny', '0216190708', 'info@abc-battery.com', 'Jl. Daan Mogot KM 11, Cengkareng Jakarta 11710 Indonesia', 'Lain-Lain', 1, '2021-10-01 01:52:53', '2021-10-03 11:51:34'),
(8, 'PT. Sinar Dunia', 'Joni Astono', '0216603630', 'app_callcenter@app.co.id', 'Jl. Pluit Karang Karya II/8-10 (Blok A Selatan) Kawasan Industri/ Gudang, Jakarta Utara 14440', 'Buku Tulis', 1, '0000-00-00 00:00:00', '2021-10-03 11:52:03'),
(9, 'PT. PaperOne', 'Udin Suradin', '02131930134', 'order@paperone.co.id', 'Jl M.H.Thamrin (d/h Jl. Teluk Betung) No. 31, Kebon Melati – Tanah Abang, Jakarta Pusat 10230, Indonesia', 'Kertas', 1, '2021-10-03 09:56:32', '2021-10-03 11:52:40'),
(12, 'tes', 'tes', '123123', 'asdsad@gasd.com', 'asdasdasd', 'Alat Tulis', 1, '2021-10-03 11:53:47', '2021-10-03 11:53:47'),
(13, 'tesss', 'asdasdasd', '12312313131', 'asdasd@asdas.com', 'asbduaisgd', 'Buku Gambar', 2, '2021-10-03 11:54:48', '2021-10-03 11:54:48'),
(14, 'tesss', 'asdasd', '123123131', '231@asdas.com', 'asndoashdiio', 'Buku Tulis', 2, '2021-10-03 12:03:17', '2021-10-03 12:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin@haafidz.xyz', 'admin', '$2y$10$ayn.RknpwzfQnP48q.XSg.LYMrSVLc9TSUh04.IolfaqHTHHGkn6O', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-01-15 23:12:25', '2021-01-15 23:12:25', NULL),
(2, 'karyawan@haafidz.xyz', 'karyawan', '$2y$10$NKjrXD.RlTb4keqoTXiTs.hgikxxzxHqCHb7e4zhLWQxUgO3KdaO.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-10-02 00:55:06', '2021-10-02 00:55:06', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `sub_category` (`sub_category`),
  ADD KEY `kode_produk` (`kode_produk`),
  ADD KEY `supplier` (`supplier`),
  ADD KEY `user_created` (`user_created`);

--
-- Indexes for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_produk` (`kode_produk`);

--
-- Indexes for table `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_produk` (`kode_produk`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`subcategory_id`) USING BTREE,
  ADD KEY `subcategory_category_id` (`subcategory_category_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `sub_category` (`subcategory_category_id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`sub_category`) REFERENCES `sub_category` (`subcategory_id`),
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `produk_ibfk_4` FOREIGN KEY (`user_created`) REFERENCES `users` (`id`);

--
-- Constraints for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD CONSTRAINT `produk_keluar_ibfk_1` FOREIGN KEY (`kode_produk`) REFERENCES `produk` (`kode_produk`);

--
-- Constraints for table `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD CONSTRAINT `produk_masuk_ibfk_1` FOREIGN KEY (`kode_produk`) REFERENCES `produk` (`kode_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
