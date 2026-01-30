-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2026 at 08:11 AM
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
-- Database: `my_stock_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_name`, `qty`, `total_price`, `payment_method`, `order_date`) VALUES
(1, 'N', 1, 20, NULL, '2026-01-23 11:31:50'),
(2, '888', 1, 60, NULL, '2026-01-23 11:37:49'),
(3, '12', 1, 50, NULL, '2026-01-23 11:37:51'),
(4, 'N', 1, 20, NULL, '2026-01-23 11:37:53'),
(5, 'N', 1, 20, NULL, '2026-01-23 11:42:57'),
(6, 'N', 1, 20, NULL, '2026-01-23 11:42:59'),
(7, 'N', 1, 20, NULL, '2026-01-23 11:43:00'),
(8, 'N', 1, 20, NULL, '2026-01-23 11:47:22'),
(9, 'N', 20, 400, NULL, '2026-01-23 11:48:49'),
(10, '888', 1, 60, NULL, '2026-01-23 13:01:42'),
(11, '12', 1, 50, NULL, '2026-01-24 04:53:45'),
(12, 'ไก่', 1, 20, NULL, '2026-01-24 05:04:59'),
(13, 'GH', 1, 50, NULL, '2026-01-24 05:19:44'),
(14, 'GH', 1, 50, NULL, '2026-01-24 05:32:13'),
(15, 'GH', 1, 50, NULL, '2026-01-24 05:40:33'),
(16, 'GH', 1, 50, NULL, '2026-01-24 05:40:35'),
(17, 'GH', 5, 250, NULL, '2026-01-24 05:43:42'),
(18, 'GH', 1, 50, NULL, '2026-01-24 05:45:01'),
(19, 'N', 1, 50, NULL, '2026-01-24 05:52:46'),
(20, 'N', 5, 250, NULL, '2026-01-24 06:01:05'),
(21, 'N', 1, 50, 'พร้อมเพย์', '2026-01-24 06:08:15'),
(22, 'N', 1, 50, 'โอนเงิน', '2026-01-24 06:08:25'),
(23, 'N', 1, 50, 'เงินสด', '2026-01-24 06:14:40'),
(24, 'N', 1, 50, 'พร้อมเพย์ 0640163548', '2026-01-24 06:18:21'),
(25, 'N', 1, 20, 'พร้อมเพย์ 0640163548', '2026-01-24 06:20:46'),
(26, 'N', 40, 800, 'พร้อมเพย์ 0640163548', '2026-01-28 15:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `qty`, `image`, `description`) VALUES
(94, 'กระเป๋า', 2000.00, 6, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c57a01e2c9.jpg', 'กระเป๋า Varsity Elite nike'),
(95, 'เสื้อกันหนาว', 999.00, 1000, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c56ee3c560.jpg', 'BODY GLOVE SC Essential Hoodies'),
(96, 'ถุงเท้า', 100.00, 500, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c56885f79d.webp', 'Adidas ถุงเท้า Cushioned Sportswear Ankle Socks 6 Pairs'),
(97, 'รองเท้า', 350.00, 100, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c56387ab09.webp', 'รองเท้าสีแดงวินเทจบนพื้นหลังสีขาว'),
(98, 'มาม่า', 7.00, 1000, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c5513c2ea0.jpg', 'มาม่าต้มยำกุ้ง'),
(99, 'กระเป๋าเดินทาง', 5000.00, 7, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c57ffb67d9.webp', 'กระเป๋าเดินทาง รุ่น LINEAR DUF XS'),
(100, 'กระเป๋าสะพาย', 5000.00, 1, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c58508815e.webp', 'กระเป๋าสะพายหลัง Elemental'),
(101, 'รองเท้าสตั๊ด', 5000.00, 80, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c58a283db6.jpg', 'สตั๊ด Nike Air Zoom Mercurial Vapor 15 Elite SG '),
(102, 'ลูกฟุตบอล', 5000.00, 90, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c58e5f1d68.webp', 'ลูกฟุตบอล รุ่น F5N1000'),
(103, 'ถุงมือประตู', 500.00, 9, 'https://misleading-unexpeditiously-exie.ngrok-free.dev/api/uploads/697c594cc5b6b.jpg', 'ถุงมือผู้รักษาประตู NIKE GOALKEEPER GLOVES VAPOR GRIP 3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`) VALUES
(1, 'admin', '123456', 'admin'),
(3, 'N', '1', 'admin'),
(4, 'no', '123456', 'user'),
(5, 'N', '08102548', 'user'),
(6, 'MO', '989898', 'user'),
(7, 'MO', '123456789', 'user'),
(8, 'PEEM', '30112568', 'user'),
(9, 'GG', '789456123', 'user'),
(10, 'L', '111111111', 'user'),
(11, 'BO', '147852', 'user'),
(12, 'NNNN', '123456', 'user'),
(13, 'NN', '026985', 'user'),
(14, 'NNJ', '1111111111', 'user'),
(15, '111', '22222', 'user'),
(16, 'NNN', '12346', 'user'),
(17, 'bn', '4556', 'user'),
(18, 'N', '123456789', 'user'),
(19, 'N', '789', 'user'),
(20, 'KL', '852', 'user'),
(21, 'po', '852', 'user'),
(22, 'G', '1', 'user'),
(23, 'NNN', '1', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
