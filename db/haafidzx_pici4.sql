-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2021 at 01:59 PM
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
(2, 'user', 'Regular User');

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
(1, 1);

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
(83, '::1', 'user@gmail.com', 1, '2021-09-15 00:07:13', 1);

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
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(3) NOT NULL,
  `nama_kategori` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
('AT', 'Alat Tulis'),
('BG', 'Buku Gambar'),
('BT', 'Buku Tulis'),
('DO', 'Document Organizer'),
('K', 'Kertas'),
('LL', 'Lain-Lain'),
('PP', 'Pengikat & Perekat'),
('SM', 'Surat-Menyurat');

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
  `id` int(7) NOT NULL,
  `kode_produk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kuantitas` int(9) NOT NULL,
  `satuan` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode_produk`, `name`, `category`, `merk`, `kuantitas`, `satuan`, `sku`, `created_at`, `update_at`) VALUES
(1, 'PR000001', 'Faber Castell 2B', 'Alat Tulis', 'Faber Castell', 180, 'PAK', '4005401990079', '2021-05-07 14:58:24', '2021-09-14 16:26:31'),
(2, 'PR000002', 'Joyko 2B', 'Buku Tulis', 'Joyko', 200, 'PAK', '8993988286066', '2021-09-14 15:58:34', '2021-09-14 16:45:12');

-- --------------------------------------------------------

--
-- Table structure for table `produk_keluar`
--

CREATE TABLE `produk_keluar` (
  `id` int(11) NOT NULL,
  `kode_transaksi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_produk` varchar(10) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `jumlah_keluar` int(5) NOT NULL,
  `satuan` varchar(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produk_masuk`
--

CREATE TABLE `produk_masuk` (
  `kode_transaksi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_produk` varchar(10) NOT NULL,
  `jumlah_masuk` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_kategori`
--

CREATE TABLE `sub_kategori` (
  `id_kategori` varchar(3) NOT NULL,
  `id_sub` varchar(10) NOT NULL,
  `sub_nama` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_kategori`
--

INSERT INTO `sub_kategori` (`id_kategori`, `id_sub`, `sub_nama`) VALUES
('AT', 'ATPEN2B', 'Pensil 2B'),
('AT', 'ATPENHB', 'Pensil HB'),
('AT', 'ATMECH', 'Pensil Mekanik'),
('AT', 'ATPUL07', 'Pulpen Ukuran 0,7'),
('AT', 'ATPUL05', 'Pulpen Ukuran 0,5'),
('AT', 'ATSTAB', 'Stabilo'),
('AT', 'ATSPIH', 'Spidol Hitam'),
('AT', 'ATSPIW', 'Spidol Warna'),
('BT', 'BT38', 'Buku Tulis 38 Lembar'),
('BT', 'BT58', 'Buku Tulis 58 Lembar'),
('BT', 'BT100', 'Buku Tulis 100 Lembar'),
('BT', 'BTC', 'Buku Tulis Campus'),
('BT', 'BTFB', 'Buku Folio Besar'),
('BT', 'BTFK', 'Buku Folio Kecil'),
('BT', 'BTCAT', 'Buku Catatan'),
('BG', 'BGA3', 'Buku Gambar A3'),
('BG', 'BGA4', 'Buku Gambar A4'),
('DO', 'DOSMK', 'Stop Map Kertas'),
('DO', 'DOSMM', 'Stop Map Mika'),
('DO', 'DOBF', 'Box File'),
('K', 'KHVS4', 'Kertas HVS A4'),
('K', 'KHVSF', 'Kertas HVS Folio'),
('K', 'KK', 'Kertas Kado'),
('K', 'KF', 'Kertas Folio'),
('K', 'KM', 'Kertas Manila'),
('K', 'KL', 'Kertas Label'),
('LL', 'LLJ', 'Jangka'),
('LL', 'LLB', 'Busur'),
('LL', 'LLTC', 'Tipe-x Cair'),
('LL', 'LLTK', 'Tipe-x Kertas'),
('LL', 'LLPB', 'Penggaris Besi'),
('LL', 'LLPP', 'Penggaris Plastik'),
('LL', 'LLS', 'Stampad'),
('LL', 'LLSPL', 'Sampul'),
('LL', 'LLTS', 'Tinta Spidol'),
('LL', 'LLBAT3', 'Baterai A3'),
('LL', 'LLBAT2', 'Baterai A2'),
('LL', 'LLKAL', 'Kalkulator'),
('LL', 'LLSTAP', 'Stapler'),
('LL', 'LLC', 'Cutter'),
('LL', 'LLG', 'Gunting'),
('LL', 'LLCRAY', 'Crayon'),
('PP', 'LLJ', 'Lem Fox'),
('PP', 'LLJ', 'Lem Aibon'),
('SM', 'LLJ', 'Amplop Coklat'),
('SM', 'LLJ', 'Amplop Kecil'),
('AT', 'ATPEN2B', 'Pensil 2B'),
('AT', 'ATPENHB', 'Pensil HB'),
('AT', 'ATMECH', 'Pensil Mekanik'),
('AT', 'ATPUL07', 'Pulpen Ukuran 0,7'),
('AT', 'ATPUL05', 'Pulpen Ukuran 0,5'),
('AT', 'ATSTAB', 'Stabilo'),
('AT', 'ATSPIH', 'Spidol Hitam'),
('AT', 'ATSPIW', 'Spidol Warna'),
('BT', 'BT38', 'Buku Tulis 38 Lembar'),
('BT', 'BT58', 'Buku Tulis 58 Lembar'),
('BT', 'BT100', 'Buku Tulis 100 Lembar'),
('BT', 'BTC', 'Buku Tulis Campus'),
('BT', 'BTFB', 'Buku Folio Besar'),
('BT', 'BTFK', 'Buku Folio Kecil'),
('BT', 'BTCAT', 'Buku Catatan'),
('BG', 'BGA3', 'Buku Gambar A3'),
('BG', 'BGA4', 'Buku Gambar A4'),
('DO', 'DOSMK', 'Stop Map Kertas'),
('DO', 'DOSMM', 'Stop Map Mika'),
('DO', 'DOBF', 'Box File'),
('K', 'KHVS4', 'Kertas HVS A4'),
('K', 'KHVSF', 'Kertas HVS Folio'),
('K', 'KK', 'Kertas Kado'),
('K', 'KF', 'Kertas Folio'),
('K', 'KM', 'Kertas Manila'),
('K', 'KL', 'Kertas Label'),
('LL', 'LLJ', 'Jangka'),
('LL', 'LLB', 'Busur'),
('LL', 'LLTC', 'Tipe-x Cair'),
('LL', 'LLTK', 'Tipe-x Kertas'),
('LL', 'LLPB', 'Penggaris Besi'),
('LL', 'LLPP', 'Penggaris Plastik'),
('LL', 'LLS', 'Stampad'),
('LL', 'LLSPL', 'Sampul'),
('LL', 'LLTS', 'Tinta Spidol'),
('LL', 'LLBAT3', 'Baterai A3'),
('LL', 'LLBAT2', 'Baterai A2'),
('LL', 'LLKAL', 'Kalkulator'),
('LL', 'LLSTAP', 'Stapler'),
('LL', 'LLC', 'Cutter'),
('LL', 'LLG', 'Gunting'),
('LL', 'LLCRAY', 'Crayon'),
('PP', 'LLJ', 'Lem Fox'),
('PP', 'LLJ', 'Lem Aibon'),
('SM', 'LLJ', 'Amplop Coklat'),
('SM', 'LLJ', 'Amplop Kecil');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `namevendor` varchar(30) NOT NULL,
  `namesales` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `namevendor`, `namesales`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(8, 'PT FABERCASTELL', 'Johnny D Boy', '081288253426', 's@s.com', 'Jl Arjuna Utr 8 A RT 004/001, Dki Jakarta', '2021-01-02 23:27:16', '2021-07-02 03:19:27'),
(9, 'PT FUJIFILM', 'AA PATAN', '02188121212', 'admin@fujifilm.com', ' Jl KH Hasyim Ashari 125 Kompl Niaga Roxy Mas Bl B 1/23-24, Dki Jakarta', '2021-01-02 23:43:37', '2021-07-02 04:08:33'),
(12, 'PT MITSUBUSHI', 'ANTONY JAYA', '021123123123', 'antoni@toni.com', 'Kompl Permata Hijau Bl D/1 RT 004/12,Grogol Utara', '2021-07-02 03:24:38', '2021-07-02 03:29:54'),
(13, 'PT DEWAWEB', 'FELIX', '02198231415', 'cs@dewaweb.com', 'Jl H Nawi Raya 9-A, Dki Jakarta', '2021-07-02 03:27:51', '2021-07-02 03:29:43'),
(14, 'PT SUSU BERSAMA', 'IBRAHIM', '021121222', 'admin@susubersama.com', 'Jl Hayam wuruk 102 F, Dki Jakarta', '2021-07-02 03:29:26', '2021-07-02 03:29:26'),
(15, 'CV POPE SALOM', 'YEHEZKIEL', '081187664774', 'yehezkiel@pope.com', 'Jl Jend Sudirman Kav 60 Menara Sudirman, Dki Jakarta', '2021-07-02 03:31:12', '2021-07-02 03:31:12');

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
(1, 'user@gmail.com', 'starter12345', '$2y$10$ayn.RknpwzfQnP48q.XSg.LYMrSVLc9TSUh04.IolfaqHTHHGkn6O', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-01-15 23:12:25', '2021-01-15 23:12:25', NULL);

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
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_produk` (`kode_produk`);

--
-- Indexes for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD CONSTRAINT `sub_kategori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
