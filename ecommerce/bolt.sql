-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Mar 2026 pada 06.44
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bolt`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(15) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `units` int(5) NOT NULL,
  `total` int(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `product_code`, `product_name`, `product_desc`, `price`, `units`, `total`, `date`, `email`) VALUES
(14, 'ROUTZ 3', 'Stride Work Jacket', 'Work jaket berbahan kanvas yang tangguh, tahan lama, sekaligus nyaman untuk aktivitas harian. Potongan yang clean dengan sentuhan utilitarian agar mudah dipadukan ke berbagai style.\r\n\r\nDilengkapi:\r\n\r\n– Two side regular pockets\r\n– Rounded chest pockets den', 399000, 2, 798000, '2026-02-09 00:17:24', 'user@gmail.com'),
(15, 'ROUTZ 2', 'Loop Jacket', 'Anorak jacket dengan bahan nylon crinkle yang ringan dan praktis. Loop didesain sebagai packable jacket untuk memudahkan kamu membawanya kemana saja, dan dilengkapi dengan detail seperti:\r\n\r\n– Signature GF patch\r\n– Kangaroo pockets + two side pockets\r\n– R', 399000, 2, 798000, '2026-03-04 03:47:09', 'user@gmail.com'),
(16, 'ROUTZ 1', 'Flow Sweater', 'Sweater berbahan fleece 280gsm yang hangat, nyaman, dan fungsional. Cocok untuk kamu yang suka tampilan smart casual dengan sentuhan praktis. Dilengkapi dengan:\r\n\r\n– Two front nylon safety pockets\r\n– Two side regular pockets\r\n– Signature GF patch', 399000, 2, 798000, '2026-03-30 01:16:30', 'user@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_code` varchar(60) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` tinytext NOT NULL,
  `product_img_name` varchar(60) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_desc`, `product_img_name`, `qty`, `price`) VALUES
(1, 'ROUTZ 1', 'Flow Sweater', 'Sweater berbahan fleece 280gsm yang hangat, nyaman, dan fungsional. Cocok untuk kamu yang suka tampilan smart casual dengan sentuhan praktis. Dilengkapi dengan:\r\n\r\n– Two front nylon safety pockets\r\n– Two side regular pockets\r\n– Signature GF patch', 'flow.jpg', 25, 399000),
(2, 'ROUTZ 2', 'Loop Jacket', 'Anorak jacket dengan bahan nylon crinkle yang ringan dan praktis. Loop didesain sebagai packable jacket untuk memudahkan kamu membawanya kemana saja, dan dilengkapi dengan detail seperti:\r\n\r\n– Signature GF patch\r\n– Kangaroo pockets + two side pockets\r\n– R', 'jacket.jpg', 30, 399000),
(3, 'ROUTZ 3', 'Stride Work Jacket', 'Work jaket berbahan kanvas yang tangguh, tahan lama, sekaligus nyaman untuk aktivitas harian. Potongan yang clean dengan sentuhan utilitarian agar mudah dipadukan ke berbagai style.\r\n\r\nDilengkapi:\r\n\r\n– Two side regular pockets\r\n– Rounded chest pockets den', 'stride.jpg', 30, 399000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pin` int(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `address`, `city`, `pin`, `email`, `password`, `type`) VALUES
(1, 'admin', '2', 'cukang', 'california', 95014, 'admin@gmail.com', 'admin', 'admin'),
(3, 'lingga', '321', 'pulgeb', 'cakung', 123, 'user@gmail.com', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
