-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2021 at 05:53 PM
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
(1, '::1', 'admin@haafidz.xyz', 1, '2021-10-03 12:00:48', 1),
(124, '::1', 'admin@haafidz.xyz', 1, '2021-10-04 00:43:15', 1),
(125, '::1', 'karyawan@haafidz.xyz', 2, '2021-10-05 02:18:43', 1),
(126, '::1', 'admin@haafidz.xyz', 1, '2021-10-05 02:41:10', 1),
(127, '::1', 'karyawan@haafidz.xyz', 2, '2021-10-05 02:51:33', 1),
(128, '::1', 'admin@haafidz.xyz', 1, '2021-10-05 03:06:33', 1),
(129, '::1', 'admin@haafidz.xyz', 1, '2021-10-05 07:53:10', 1),
(130, '::1', 'admin@haafidz.xyz', 1, '2021-10-09 08:10:30', 1),
(131, '::1', 'admin', NULL, '2021-10-09 10:52:48', 0),
(132, '::1', 'admin@haafidz.xyz', 1, '2021-10-09 10:52:54', 1),
(133, '::1', 'admin@haafidz.xyz', 1, '2021-10-09 23:28:04', 1),
(134, '::1', 'admin@haafidz.xyz', 1, '2021-10-11 02:31:23', 1),
(135, '::1', 'admin@haafidz.xyz', 1, '2021-10-11 04:59:42', 1),
(136, '::1', 'admin@haafidz.xyz', 1, '2021-10-13 06:34:03', 1),
(137, '::1', 'admin@haafidz.xyz', 1, '2021-10-13 09:29:48', 1);

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
(1, 'PR000001', 'FaberCastell 2B', 1, 'ATPEN2B', 1, 'Faber Castell', 5, 'PAK', '4005401990079', 1, '2021-05-07 14:58:24', '2021-10-04 13:57:13'),
(2, 'PR000002', 'Kenko Easy Gel 0.5mm', 1, 'ATPUL05', 5, 'Kenko', 55, 'PAK', '8998838290286', 1, '2021-09-14 15:58:34', '2021-10-04 14:21:52'),
(3, 'PR000003', 'Joyko JK-100NT Gel 0.5mm', 1, 'ATPUL05', 3, 'Joyko', 0, 'PAK', '8993988282051', 1, '2021-09-17 16:19:20', '2021-10-04 13:50:01'),
(4, 'PR000004', 'Joyko GP-265 Qgel 0.5mm', 1, 'ATPUL05', 3, 'Joyko', 0, 'PAK', '8993988283300', 1, '2021-09-17 19:56:02', '2021-10-04 13:50:04'),
(5, 'PR000005', 'Standard AE7', 1, 'ATPUL05', 2, 'Standard', 120, 'PAK', '1100120010473', 1, '2021-09-28 23:47:11', '2021-10-04 14:03:22'),
(7, 'PR000006', 'Joyko Pencil P-88', 1, 'ATPEN2B', 3, 'Joyko', 0, 'PAK', '8993988286059', 1, '2021-10-04 12:52:54', '2021-10-04 13:10:05'),
(8, 'PR000007', 'Joyko Pencil P-91 2B', 1, 'ATPEN2B', 3, 'Joyko', 89, 'PAK', '8993988286103', 1, '2021-10-04 13:09:37', '2021-10-04 14:03:33'),
(9, 'PR000008', 'Lem Fox Putih', 7, 'LLF', 4, 'Fox', 90, 'PCS', '8994397000021', 1, '2021-10-04 13:12:54', '2021-10-13 19:16:01'),
(10, 'PR000009', 'Kenko Correction Pen KE-01', 6, 'LLTK', 5, 'Kenko', 0, 'PCS', '8998838050002', 1, '2021-10-04 13:13:23', '2021-10-04 13:13:23'),
(11, 'PR000010', 'Paperline Amplop Putih 104PPS 100lbr 80gsm', 8, 'LLAK', 8, 'Paperline', 0, 'PAK', '8991389247037', 1, '2021-10-04 13:14:24', '2021-10-04 13:50:58'),
(12, 'PR000011', 'Merpati 104 70gr SLC', 8, 'LLAK', 8, 'Merpati', 0, 'PAK', '8995757827050', 1, '2021-10-04 13:14:46', '2021-10-04 13:14:46'),
(13, 'PR000012', 'Merpati Visit 80gr', 8, 'LLAK', 8, 'Merpati', 0, 'PAK', '8995757412003', 1, '2021-10-04 13:15:21', '2021-10-04 13:15:21'),
(14, 'PR000013', 'Snowman White Board INK Refill', 6, 'LLTS', 15, 'Snowman', 0, 'PCS', '4970129732525', 1, '2021-10-04 13:20:13', '2021-10-04 13:20:13'),
(15, 'PR000014', 'Snowman Permanent Marking INK', 6, 'LLTS', 15, 'Snowman', 0, 'PCS', '4970129731535', 1, '2021-10-04 13:20:50', '2021-10-04 13:20:50'),
(16, 'PR000015', 'Snowman Permanent Marker', 1, 'ATSPIH', 15, 'Snowman', 0, 'PCS', '4970129726517', 1, '2021-10-04 13:21:14', '2021-10-04 13:21:14'),
(17, 'PR000016', 'Snowman Whiteboard Marker', 1, 'ATSPIH', 15, 'Snowman', 70, 'PCS', '4970129727514', 1, '2021-10-04 13:21:40', '2021-10-04 14:00:58'),
(18, 'PR000017', 'Battery ABC R14C 1.5V', 6, 'LLBAT2', 7, 'ABC', 0, 'PCS', '8886022820251', 1, '2021-10-04 13:22:15', '2021-10-04 13:22:15'),
(19, 'PR000018', 'Battery ABC R205 1.5V', 6, 'LLBAT2', 7, 'ABC', 0, 'PCS', '8886022810269', 1, '2021-10-04 13:22:42', '2021-10-04 13:22:42'),
(20, 'PR000019', 'Battery ABC Alkaline AA LR6 1.5V', 6, 'LLBAT2', 7, 'ABC', 0, 'PCS', '8886022971298', 1, '2021-10-04 13:23:07', '2021-10-04 13:23:07'),
(21, 'PR000020', 'Battery ABC Alkaline AAA LR03 1.5V', 6, 'LLBAT3', 7, 'ABC', 0, 'PCS', '8886022941512', 1, '2021-10-04 13:23:25', '2021-10-04 13:23:25'),
(22, 'PR000021', 'Joyko CT-552', 6, 'LLTK', 3, 'Joyko', 0, 'PCS', '8993988055174', 1, '2021-10-04 13:23:54', '2021-10-04 13:23:54'),
(23, 'PR000022', 'Joyko CT-533', 6, 'LLTK', 3, 'Joyko', 0, 'PCS', '8993988055280', 1, '2021-10-04 13:24:18', '2021-10-04 13:24:18'),
(24, 'PR000023', 'Aica Aibon', 7, 'LLA', 4, 'Aibon', 60, 'PCS', '8997012700023', 1, '2021-10-04 13:24:57', '2021-10-04 14:21:19'),
(25, 'PR000024', 'Kenko Glue Stick 8g', 7, 'LLSTICK', 5, 'Kenko', 82, 'PCS', '8998838110010', 1, '2021-10-04 13:27:45', '2021-10-04 14:01:18'),
(26, 'PR000025', 'Kenko Glue Stick 15g', 7, 'LLSTICK', 5, 'Kenko', 77, 'PCS', '8998838110027', 1, '2021-10-04 13:28:03', '2021-10-04 14:04:24'),
(27, 'PR000026', 'SiDu 38lbr 21x16', 3, 'BT38', 8, 'SiDu', 90, 'PAK', '8991389300107', 1, '2021-10-04 13:28:43', '2021-10-04 14:22:19'),
(28, 'PR000027', 'SiDu 58lbr 21x16', 3, 'BT58', 8, 'SiDu', 90, 'PAK', '8991389300657', 1, '2021-10-04 13:29:08', '2021-10-04 14:21:05'),
(29, 'PR000028', 'BigBoss Campus 50lbr 25x18', 3, 'BT58', 8, 'SiDu', 0, 'PAK', '8991389304297', 1, '2021-10-04 13:29:38', '2021-10-04 13:29:38'),
(30, 'PR000029', 'PaperOne F4 70gsm', 5, 'KHVSF', 9, 'PaperOne', 0, 'RIM', '8993242597808', 1, '2021-10-04 13:30:40', '2021-10-04 13:30:40'),
(31, 'PR000030', 'ZAP A4 75gsm', 5, 'KHVS4', 9, 'Zap', 0, 'RIM', '8993242600812', 1, '2021-10-04 13:31:17', '2021-10-04 13:31:17'),
(32, 'PR000031', 'CopyPaper A4 75gsm', 5, 'KHVS4', 9, 'CopyPaper', 0, 'RIM', '8993053187519', 1, '2021-10-04 13:31:43', '2021-10-04 13:31:43'),
(33, 'PR000032', 'PaperOne F4 80gsm', 5, 'KHVSF', 9, 'PaperOne', 0, 'RIM', '8993242597587', 1, '2021-10-04 13:32:04', '2021-10-04 13:32:04'),
(34, 'PR000033', 'PaperOne A4 80gsm', 5, 'KHVS4', 9, 'PaperOne', 0, 'RIM', '8993242596993', 1, '2021-10-04 13:32:24', '2021-10-04 13:32:24'),
(35, 'PR000034', 'CopyPaper A4 70gsm', 5, 'KHVS4', 9, 'CopyPaper', 0, 'RIM', '8991389139004', 1, '2021-10-04 13:39:01', '2021-10-04 13:39:01'),
(36, 'PR000035', 'April PPLITE A4 75gsm', 5, 'KHVS4', 9, 'April', 0, 'RIM', '8993242598294', 1, '2021-10-04 13:39:21', '2021-10-04 13:39:21'),
(37, 'PR000036', 'April PPLITE F4 75gsm', 5, 'KHVSF', 9, 'April', 0, 'RIM', '8993242600997', 1, '2021-10-04 13:39:39', '2021-10-04 13:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `produk_keluar`
--

CREATE TABLE `produk_keluar` (
  `kode_transaksi` varchar(10) CHARACTER SET utf8 NOT NULL,
  `tanggal` date NOT NULL,
  `kode_produk` varchar(10) CHARACTER SET utf8 NOT NULL,
  `jumlah_keluar` int(5) NOT NULL,
  `user_created` int(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_keluar`
--

INSERT INTO `produk_keluar` (`kode_transaksi`, `tanggal`, `kode_produk`, `jumlah_keluar`, `user_created`, `created_at`, `update_at`) VALUES
('PK000001', '2021-10-04', 'PR000001', 45, 1, '2021-10-04 13:57:13', '2021-10-04 13:57:13'),
('PK000002', '2021-10-04', 'PR000027', 10, 1, '2021-10-04 14:21:05', '2021-10-04 14:21:05'),
('PK000003', '2021-10-04', 'PR000023', 10, 1, '2021-10-04 14:21:19', '2021-10-04 14:21:19'),
('PK000004', '2021-10-04', 'PR000002', 5, 1, '2021-10-04 14:21:52', '2021-10-04 14:21:52'),
('PK000005', '2021-10-04', 'PR000026', 10, 1, '2021-10-04 14:22:19', '2021-10-04 14:22:19'),
('PK000006', '2021-10-13', 'PR000008', 9, 0, '2021-10-13 19:16:01', '2021-10-13 19:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `produk_masuk`
--

CREATE TABLE `produk_masuk` (
  `kode_transaksi` varchar(10) CHARACTER SET utf8 NOT NULL,
  `tanggal` date NOT NULL,
  `kode_produk` varchar(10) CHARACTER SET utf8 NOT NULL,
  `jumlah_masuk` int(5) NOT NULL,
  `user_created` int(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_masuk`
--

INSERT INTO `produk_masuk` (`kode_transaksi`, `tanggal`, `kode_produk`, `jumlah_masuk`, `user_created`, `created_at`, `update_at`) VALUES
('PM000001', '2021-10-04', 'PR000001', 50, 1, '2021-10-04 13:51:30', '2021-10-04 13:51:30'),
('PM000002', '2021-10-04', 'PR000002', 60, 1, '2021-10-04 14:00:15', '2021-10-04 14:00:15'),
('PM000003', '2021-10-04', 'PR000016', 70, 1, '2021-10-04 14:00:58', '2021-10-04 14:00:58'),
('PM000004', '2021-10-04', 'PR000024', 82, 1, '2021-10-04 14:01:18', '2021-10-04 14:01:18'),
('PM000005', '2021-10-04', 'PR000026', 100, 1, '2021-10-04 14:02:24', '2021-10-04 14:02:24'),
('PM000006', '2021-10-04', 'PR000027', 100, 1, '2021-10-04 14:02:43', '2021-10-04 14:02:43'),
('PM000007', '2021-10-04', 'PR000005', 120, 1, '2021-10-04 14:03:22', '2021-10-04 14:03:22'),
('PM000008', '2021-10-04', 'PR000007', 89, 1, '2021-10-04 14:03:33', '2021-10-04 14:03:33'),
('PM000009', '2021-10-04', 'PR000023', 70, 1, '2021-10-04 14:04:04', '2021-10-04 14:04:04'),
('PM000010', '2021-10-04', 'PR000025', 77, 1, '2021-10-04 14:04:24', '2021-10-04 14:04:24'),
('PM000011', '2021-10-04', 'PR000008', 89, 1, '2021-10-04 14:05:03', '2021-10-04 14:05:03'),
('PM000012', '2021-10-13', 'PR000008', 10, 1, '2021-10-13 18:59:34', '2021-10-13 18:59:34');

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
(7, 'LLSTICK', 'Lem Stick'),
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
(2, 'PT. Standardpen Industries', 'Anton Himalaya', '021231324749', 'supplier@standardpen.id', 'Jl. Cideng Timur No.50 Jakarta Pusat 10160', 'Alat Tulis', 1, '2021-01-02 23:43:37', '2021-10-03 11:48:33'),
(3, 'PT. Atali Makmur', 'Budi Nurman', '02155961046', 'order@atalimakmur.com', 'Jl Kayu Besar Dlm 6-7 Kompl Pergudangan RT 001/08, Tegal Alur, Kalideres, Jakarta 11820', 'Alat Tulis', 1, '2021-07-02 03:24:38', '2021-10-03 11:49:05'),
(4, 'PT. Aica Indonesia', 'Dimas Nurahman', '02138901941', 'supplier@aica.co.id', 'Jl. Tanah Abang III No.23,25,27, Jakarta Pusat, DKI Jakarta 10160 Indonesia', 'Pengikat & Perekat', 1, '2021-07-02 03:27:51', '2021-10-03 11:49:47'),
(5, 'PT. Kenko Indonesia', 'Putri Mayasari', '0215262762', 'order@kenko.co.id', 'Gedung Utanco Lt 4, Jalan Haji R. Rasuna Said Kav B29 RT.5/RW.2, Setia Budi, RT.5/RW.2, Kuningan, Setia Budi, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12910', 'Alat Tulis', 1, '2021-07-02 03:29:26', '2021-10-03 11:50:15'),
(6, 'PT. SOLO MURNI ??? JAKARTA TIMUR', 'Juniadi', '0214601770', 'jakarta@kiky.com', 'Jl. Raya Penggilingan No.37 RT.7 RW.8 Cakung JAKARTA TIMUR - 13940', 'Alat Tulis', 1, '2021-07-02 03:31:12', '2021-10-03 11:51:00'),
(7, 'PT. ABC Indonesia', 'Fanny', '0216190708', 'info@abc-battery.com', 'Jl. Daan Mogot KM 11, Cengkareng Jakarta 11710 Indonesia', 'Lain-Lain', 1, '2021-10-01 01:52:53', '2021-10-03 11:51:34'),
(8, 'PT. Sinar Dunia', 'Joni Astono', '0216603630', 'app_callcenter@app.co.id', 'Jl. Pluit Karang Karya II/8-10 (Blok A Selatan) Kawasan Industri/ Gudang, Jakarta Utara 14440', 'Buku Tulis', 1, '0000-00-00 00:00:00', '2021-10-03 11:52:03'),
(9, 'PT. PaperOne', 'Udin Suradin', '02131930134', 'order@paperone.co.id', 'Jl M.H.Thamrin (d/h Jl. Teluk Betung) No. 31, Kebon Melati ??? Tanah Abang, Jakarta Pusat 10230, Indonesia', 'Kertas', 1, '2021-10-03 09:56:32', '2021-10-03 11:52:40'),
(15, 'PT. Snowman Indonesia', 'Adijaya Mukti', '02188234223', 'sales@snowmanindonesia.com', 'Sedayu Square Blok M No.20, Jl. Outer Ringroad Lkr. Luar, Cengkareng Barat, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta - 11730', 'Lain-Lain', 1, '2021-10-04 01:19:37', '2021-10-04 01:19:37');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `users` (`id`);

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
