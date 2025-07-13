-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 05:37 PM
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
-- Database: `bloodbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_samples`
--

CREATE TABLE `blood_samples` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `blood_type` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_samples`
--

INSERT INTO `blood_samples` (`id`, `user_id`, `blood_type`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 'B+', 4, '2025-07-13 04:55:19', '2025-07-13 04:55:19'),
(2, 2, 'B+', 4, '2025-07-13 04:55:35', '2025-07-13 04:55:35'),
(3, 2, 'A', 2, '2025-07-13 07:49:32', '2025-07-13 07:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_11_070535_add_role_to_users_table', 1),
(6, '2025_07_11_113648_create_bloodsamples_table', 1),
(7, '2025_07_12_201237_create_requests_table', 1),
(8, '2025_07_13_103628_add_state_and_address_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `blood_sample_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `receiver_id`, `blood_sample_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'pending', '2025-07-13 04:58:33', '2025-07-13 04:58:33'),
(2, 3, 1, 'pending', '2025-07-13 05:24:08', '2025-07-13 05:24:08'),
(3, 4, 2, 'pending', '2025-07-13 05:25:26', '2025-07-13 05:25:26'),
(4, 5, 2, 'pending', '2025-07-13 05:55:05', '2025-07-13 05:55:05'),
(5, 1, 1, 'pending', '2025-07-13 06:17:00', '2025-07-13 06:17:00'),
(6, 1, 3, 'pending', '2025-07-13 07:51:47', '2025-07-13 07:51:47'),
(7, 1, 2, 'pending', '2025-07-13 08:44:32', '2025-07-13 08:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'receiver',
  `state` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `state`, `address`) VALUES
(1, 'aditi', 'adiisharma793@gmail.com', NULL, '$2y$10$qXtfP/3OByRgwyytFyuwG.ugTkDv6xRfU9PwtM45k3JNYkDwXGArS', NULL, '2025-07-12 23:41:45', '2025-07-12 23:41:45', 'receiver', NULL, NULL),
(2, 'Test Hospital', 'hospital@example.com', NULL, '$2y$10$BoInvuOwkpls6IKf6U0Q7.8B9prHSWH8LZFVO7NUtK92nbgpG1KoC', NULL, '2025-07-13 01:37:03', '2025-07-13 01:37:03', 'hospital', NULL, NULL),
(3, 'Navjeevan', 'navjeevan@gmail.com', NULL, '$2y$10$C.FNN1RQCjW/7A8AC7ESxuQkHtdtres6BSwxbuYOx0r.DTExcq9M2', NULL, '2025-07-13 05:23:54', '2025-07-13 05:23:54', 'receiver', NULL, NULL),
(4, 'ashika', 'ashika@gmail.com', NULL, '$2y$10$4gbgNj8xV9v.kqwtbv8gYuAIPB2R9vthAtOPrKuLXAeFOpq09YXzy', NULL, '2025-07-13 05:25:16', '2025-07-13 05:25:16', 'receiver', NULL, NULL),
(5, 'Lata', 'lata@gmail.com', NULL, '$2y$10$6jn/mDd4i6eSDfp6gcuGreq6MpokQK2uA7cEhO7J7K.7Xm8SNhpnC', NULL, '2025-07-13 05:54:54', '2025-07-13 05:54:54', 'receiver', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_samples`
--
ALTER TABLE `blood_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blood_samples_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requests_receiver_id_foreign` (`receiver_id`),
  ADD KEY `requests_blood_sample_id_foreign` (`blood_sample_id`);

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
-- AUTO_INCREMENT for table `blood_samples`
--
ALTER TABLE `blood_samples`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_samples`
--
ALTER TABLE `blood_samples`
  ADD CONSTRAINT `blood_samples_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_blood_sample_id_foreign` FOREIGN KEY (`blood_sample_id`) REFERENCES `blood_samples` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requests_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
