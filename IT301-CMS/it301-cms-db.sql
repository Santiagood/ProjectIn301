-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 09:15 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it301-cms-db`
--

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2021_11_21_101821_create_sessions_table', 1),
(10, '2021_11_21_103347_create_pages_table', 2),
(11, '2021_11_21_104347_create_trix_rich_texts_table', 3),
(12, '2021_11_23_110146_add_set_default_pages_to_pages_table', 4),
(13, '2021_11_26_101735_create_navigation_menus_table', 5),
(14, '2021_11_27_085644_add_role_to_users_table', 6),
(15, '2021_11_27_120446_create_user_permissions_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menus`
--

CREATE TABLE `navigation_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sequence` int(11) NOT NULL,
  `type` enum('SidebarNav','TopNav') COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigation_menus`
--

INSERT INTO `navigation_menus` (`id`, `sequence`, `type`, `label`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'SidebarNav', 'Home', 'home', '2021-11-26 10:41:54', '2021-11-26 10:41:54'),
(3, 2, 'SidebarNav', 'About Us', 'about-us', '2021-11-26 03:55:55', '2021-11-26 05:50:20'),
(6, 3, 'SidebarNav', 'Contact Us', 'contact-us', '2021-11-26 05:50:41', '2021-11-26 16:55:01'),
(9, 1, 'TopNav', 'Login', 'login', '2021-11-26 06:39:09', '2021-11-27 20:17:59'),
(10, 2, 'TopNav', 'Register', 'register', '2021-11-26 06:40:39', '2021-11-27 20:18:05'),
(14, 2, 'TopNav', 'Announcements', 'announcements', '2021-11-28 03:34:17', '2021-12-01 16:36:56'),
(15, 4, 'SidebarNav', 'Important Announcement', 'free-webinar-pursue-and-traps-to-avoid-in-the-great-reopening', '2021-12-01 16:37:56', '2021-12-01 16:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_default_home` tinyint(1) DEFAULT NULL,
  `is_default_not_found` tinyint(1) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `is_default_home`, `is_default_not_found`, `title`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Home', 'home', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-11-21 05:21:10', '2021-11-27 19:14:36'),
(2, 0, NULL, 'About Us', 'about-us', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus purus in massa tempor nec. Amet nisl purus in mollis nunc sed id semper. Vitae tempus quam pellentesque nec nam aliquam sem et tortor. Cursus sit amet dictum sit. Mi sit amet mauris commodo quis. Cras ornare arcu dui vivamus arcu. Eu scelerisque felis imperdiet proin fermentum leo vel. Sodales ut eu sem integer. Ac orci phasellus egestas tellus rutrum tellus.', '2021-11-21 05:34:55', '2021-11-27 19:14:36'),
(27, NULL, 1, 'Error 404', 'error-404', '<div>Sorry we couldn\'t find this page.<br>But dont worry, you can find plenty of other things on our homepage.&nbsp;</div>', '2021-11-23 07:59:19', '2021-11-27 19:15:23'),
(28, NULL, NULL, 'Contact Us', 'contact-us', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet commodo nulla facilisi nullam vehicula.</div>', '2021-11-24 03:23:47', '2021-12-01 07:49:43'),
(34, NULL, 0, 'Announcements', 'announcements', '<div>List of announcement</div>', '2021-11-26 17:13:30', '2021-11-27 19:15:23'),
(52, NULL, NULL, 'Free Webinar - An official introduction to the core concepts of cloud and AWS', 'free-webinar-an-official-introduction-to-the-core-concepts-of-cloud-and-aws', '<div>The AWS Discovery Day is a complimentary Instructor-led Virtual Master Class that is designed to provide an official introduction of AWS cloud computing concepts to business leaders and IT professionals. Business decision makers can learn how to use AWS services to improve business processes and optimize cost savings. IT professionals can leverage the foundational knowledge to embark into further role-based specialized learning paths. Participants get access to NetCom 365 - our comprehensive digital learning platform featuring reporting capabilities and a rich repository of additional resources. Being an Official AWS Partner Network (APN) training partner, we are also providing all learners complimentary VIP access to 150+ Official e-Learning courses from AWS.<br>&nbsp; <br><a href=\"https://www.netcomlearning.com/webinars/9862/aws-concepts-cloud.html?WebinarID=901\">https://www.netcomlearning.com/webinars/9862/aws-concepts-cloud.html?WebinarID=901</a></div>', '2021-11-30 18:31:47', '2021-12-01 01:23:56'),
(53, NULL, NULL, 'Free Webinar - Learn to utilize Cisco Unified Communications for better collaboration', 'free-webinar-learn-to-utilize-cisco-unified-communications-for-better-collaboration', '<div>Disruption in communication is a common problem for businesses and organizations that affect overall productivity, collaboration, and revenue. Establish your communications infrastructure and enable your teams to connect easily with the Cisco Unified Communications Manager. It features IP telephony, integrated messaging, high-definition video, instant message, and presence.<br><br>In this FREE live webinar, you will learn about the Cisco Unified Communication- its methodological troubleshooting tools, techniques, procedures, and more. <br><br><a href=\"https://www.netcomlearning.com/webinars/9917/cisco-better-collaboration.html?WebinarID=952\">https://www.netcomlearning.com/webinars/9917/cisco-better-collaboration.html?WebinarID=952</a></div>', '2021-11-30 22:54:01', '2021-12-01 01:23:24'),
(54, NULL, NULL, 'Free Webinar - Accelerate your AI/ML journey with Red Hat.', 'free-webinar-accelerate-your-aiml-journey-with-red-hat', '<div>Want to fasten your organization’s production process? Register now for our FREE webinar, where you will learn how to bring more flexibility, agility, scalability, and portability across hybrid cloud operations for easy development and deployment of Machine Learning models and AI-powered intelligent applications using Red Hat. <br><br>This webinar gives you a clear picture of how Red Hat can be used to scale up your business’s profit margin through successful artificial intelligence and machine learning (AI/ML) applications. <br><br><a href=\"https://www.netcomlearning.com/webinars/1121/journey-red-hat.html?WebinarID=933\">https://www.netcomlearning.com/webinars/1121/journey-red-hat.html?WebinarID=933</a></div>', '2021-12-01 00:49:45', '2021-12-01 01:22:43'),
(56, NULL, NULL, 'Free Webinar - Pursue and Traps To Avoid in the Great Reopening', 'free-webinar-pursue-and-traps-to-avoid-in-the-great-reopening', '<div>Lockdown was imposed upon us, but how we reopen is our decision. How should you lead when everyone’s pandemic was different? What should you do and not do to lead in a hybrid environment? How can we get out of soul-crushing meeting creep and collaborate more effectively, no matter where we are? This complimentary webinar offers a practical approach to guide leaders of all stripes as they reopen, providing guidance on what works and what doesn’t when reopening.</div>', '2021-12-01 16:27:13', '2021-12-01 16:29:53');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5OvAAUrlq3Ubuo2kip8xPRcrIfO1zuj0lhZ6iSz7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid25ya0RId1dDdkdxaVhPRXZmbXJCTHhKRFFEemdLdVRMVnZ5c0ZLTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447321),
('6M7dCmu5fkhCS9fx0wf9S9vWwCaubK7TLANkoilm', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicjdsbWJLcW1mYzhlTktHVUpXTXRwNzBwS1ZYeG9uMUNEMGJmMWhtSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91c2VyLXBlcm1pc3Npb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFFZMXFsanpsb25nbXZKYi9tY0paeC5sVnl6TzRoakx6VXMwL1BDekprN3hwT0gwNDNwclIuIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRRWTFxbGp6bG9uZ212SmIvbWNKWngubFZ5ek80aGpMelVzMC9QQ3pKazd4cE9IMDQzcHJSLiI7fQ==', 1638449451),
('8ao7SuoXr3HvE6eop9foMuFVi6vULZ2HBwHCZiNy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNFZXZ0lUUEdGejFkY0NaOUlFRjRCSEg3cmcwekxCOE5obWw3dG5PQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447374),
('8tq1zKARUjaBqSIqycJwXiMlmdsUPC1B1CJYTh5z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienpRZjNWRWY1RzAxbGVTZTB0V1QwU1ZKMEZYZm5hb01ZTTF0bXBhQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hYm91dC11cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447268),
('BhYn5j5zW6UZzwYFW620LBgnOWmxvKyfqD6cczIt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWHNFT2hrQmtacUtQSmpOSlYxZWtUWTZiU0tqdW5jMkcycDBrcHhpdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447374),
('BWIie4HtTgr4BAVwO7I0XD2Ro2yEdRdGFIbd4Hno', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVXk4ZkJJU0lFNmNaaHVWS09VSkZLRGhOb2RzYXhhTXFxWjE5bkhjSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447319),
('CKzMzIKAi58GaLMOlLlsAg5VqSUA2ZxAaUX2y8vV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjU0RDJ5enMyeUZrQjJhdkhhQkM0VDVyNHFHNUk0UGd3ZHZVSmJFVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447292),
('eREWUXaeKlHTlW6iAwXE1oAb5E1wcTZ8OPqKFbTA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHQycEVtdjdwaXdXUUlDUENjQ3ExcU1wSHpyTGFKd2ExT0pTOVdyaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447437),
('eVGARxbOeHBnJJ0rZWpIngJc9tq9wl8Adow0VRf5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSUVYODZJRWpJUzBhdFdaODJ2SVlGaDV0VTBpVTJnU2ZuaEVNS1duRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447449),
('iLrx7haREbjTPDWnWzSRn6dmsKeQaj4DglUfNP3C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzJwQ1FUZmtPZW5NQ2p5VmdKSUN4RUtSMnBzRzhUTXVhMm5GMlA5MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/X1JTU0lEXz0zMjkzMjQ5OC0wYTQzLTQ3ZTEtOWQwZC1iMjNhNzFmZGQ4N2MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447168),
('iMnzb0yd0dLqkqpsHyj5rHtM1vlPzyMgpBMMneio', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnZVZG84ZW9KUkJpb0l4WEFlR0ZoR0diWFBUR2xuQ3ZsZW5WWHNXTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz0zMjkzMjQ5OC0wYTQzLTQ3ZTEtOWQwZC1iMjNhNzFmZGQ4N2MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447173),
('KNhIbDyDBEUOv0Rb9aq6k5MZIp6bGwMtc8Yxk2o5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieW5PR1VGa0lHTzUwejBzVTZFTWtybm1PUXVGcFpTYllqd3dvS2JNUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz02M2QxNjI0My00ZjdmLTQ5ZGQtOTNiYy0yMDc1NWEwYjc1YmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447174),
('KVJWWk04Huu6ljXykBpBIfzTl9eTAr2blwtPo0W9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT1FUZnNoekRtWkZ0YmRSSEM3T2pDOXNOZW5yQ1BaeFpkTXk5RnJuViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447557),
('KxpE1VGGo2jEnFbkrl4ACNySKSx6Di7xndGm8sef', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUI1eTFIdXJiV2k4ZmtnQTBUU0JacnJHWUFZTnAySENjUE5xT0pYUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447344),
('NHsmwrwiqNFgewLDIwLTEHisIn0mn88bB4EcV1iT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjBTV000bk9xMGVoVHFER2tSMHVKNDRGTE5FOWFtTmRCSHpET2VuTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447344),
('nlKTq8xvAP5LAmPgikkHmNRVQVdpAEDOmU4Y0jDN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWpNTXUySVhqcFpaTG9WWk5jVzZaeERHNWFvS0pSR2QzUTB3c1JRdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/X1JTU0lEXz02M2QxNjI0My00ZjdmLTQ5ZGQtOTNiYy0yMDc1NWEwYjc1YmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447169),
('nMDEJTZLDQ9tdbHUwuv3o5q4ip4ZMpyy38QGIEpJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic250VVl1ajFWY1N0WmE2dXY0aHlMS21NWldsWlpOclhjOERGOEVJaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447291),
('Np5sHbqUO9SyGsOioYJ9iZI8EtwsbQznNlbxLazv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFBhSk5mdHJmeXo0RkVIcFNjam02M2pFeEpjNnhmZ2VzQ01wS05nZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447440),
('O7H8sqDRXwwXCFUUXVcaAvluK27x5g6OndRz4Rll', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlZ6bUE5alJWUXdtVzVNdnRjTXZCcGlTcjB6eGJ5M1RkV3NIWndFNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447263),
('o7RvjjUT6y9Fk56vLoO6dEpgemH4jKGl54gMl3G3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU21idkxsaDdrU0ExbU4zY2RxTGdpakwxWk1SeURhcU55aEFTZ3hqTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447320),
('OIbmPZlI9cJzA2duztUzpqrTm5xWfimBO30hd0Wt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieGxYRkw5WTlDUkhIUXY1VDVoV0h4cFBJamQxNlowcDRPMmVYVVdHcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447449),
('QBQCgL2eRJmQ9qbQBmGpdUAuTshW9hmgPaJpLZPU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWG15ZDBhWmRuaVNVOXg2Y0JGTXRBaGdrVGxtY285R1A0b1YzajcwYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz0yM2RhMGNkOS0zMDUxLTQ1ZWMtYTU0ZC0zNjBiYmMwMWI3NDkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447327),
('QBRY4i6XDcw3322IGd28OXUPZeB94WWvCxKdZFx8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWtQZnVFNmYxbDNZanFSWDZiYVRvdFNZeFV1N205WWZGekpBZTVRcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz0zMjkzMjQ5OC0wYTQzLTQ3ZTEtOWQwZC1iMjNhNzFmZGQ4N2MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447327),
('qfpgEL2GOFzMvXXYQdabVvRkeoIQTORzyhC8IpG2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialIzVXhOR1ZaT1JVVzVrVnRYdjhOTGlNU2FWNnRxa1R0c1pqWm91NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447439),
('QH8wqDaDhciPvjjKIfc5WLN0z23qlpIE93vhbo71', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3BRdG5Jc3BDb2ltQ080eHNFUUkxeUp0NWU3RFZ5Y0ozNmJyS2FDZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz02M2QxNjI0My00ZjdmLTQ5ZGQtOTNiYy0yMDc1NWEwYjc1YmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447337),
('qvB5OizNFH7sPpfB31ENra8ina3ee4xHvbKTqwUS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXc3dVU4SzFsWDBienYzNXM1TXNpTXd5WGNRbTNCSE9QOTRNVHRHQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz02M2QxNjI0My00ZjdmLTQ5ZGQtOTNiYy0yMDc1NWEwYjc1YmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447433),
('SEbmikqB6BShmsJMqmpLzflC1v5e77MzXN50DAAz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkpmTnpnWjlreVpVZTlaWUFzQ1BQdjBqSUhZN2tHYk9EYUw4QXgzdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hYm91dC11cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638447268),
('uhnZkDMUjNTlNco3S9f0uMFGvXqT7EsMShGbNTHh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFFtSTRlNUJmRmgwZ1dwU0NnWDY4SVVqODE2SjhKbG45clVtWFZ1QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz0zMjkzMjQ5OC0wYTQzLTQ3ZTEtOWQwZC1iMjNhNzFmZGQ4N2MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447432),
('wZovKUKBL7fHrSFxUhepJNWEhdFLDQOXRm8tc6o4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmpZRWRuWHI3SmlLUERsamRjWWdYT1VQR1JRRjhGUFlNTW1HWENsZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447437),
('xJ0TYHPDnlyYeA9LJfVKz42u7yHfYs2JHXx8pzip', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFgzYk1YMUxNWnd5NWhHRmM3RkRhcjd2MGFvYkVYMkk4bFd6bUdQNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/X1JTU0lEXz0yM2RhMGNkOS0zMDUxLTQ1ZWMtYTU0ZC0zNjBiYmMwMWI3NDkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1638447231),
('xkMWGC6siAl01dN9NXs3cZtgl9yXq307qrexHoF2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3hac1hZWVRrUUxNMjhxUDVlQUV0MTNEc1Y1SDdJTlB6WHdSNjg5MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1638447264);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rainier\'s Team', 1, '2021-11-21 02:27:45', '2021-11-21 02:27:45'),
(4, 4, 'user\'s Team', 1, '2021-11-27 01:04:24', '2021-11-27 02:41:01'),
(5, 5, 'officer\'s Team', 1, '2021-11-27 01:58:31', '2021-11-27 01:58:31'),
(6, 6, 'admin\'s Team', 1, '2021-11-28 01:39:02', '2021-11-28 01:39:02'),
(7, 7, 'David\'s Team', 1, '2021-12-01 16:20:34', '2021-12-01 16:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trix_attachments`
--

CREATE TABLE `trix_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_id` int(10) UNSIGNED DEFAULT NULL,
  `attachable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_pending` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trix_rich_texts`
--

CREATE TABLE `trix_rich_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Rainier', 'rainrainsantiago@gmail.com', NULL, '$2y$10$KlcbRSnd5faPxUkzHRCxAeCpWgvRJAm60ibTpv3tjGL4QhkfkeNre', NULL, NULL, NULL, 1, NULL, '2021-11-21 02:27:45', '2021-11-21 02:27:46'),
(4, 'user', 'user', 'user@bits.org', NULL, '$2y$10$WAyWcLSJyECTZxdwc/MIQuOPKhxxOaQoBOyLZ29WdLr35B3yWPcbW', NULL, NULL, 'dAvUvyU95TH3A2SneBPh6rYn6kqv3S9AW9m13v2ODgSDZznHvmFRF90mneIQ', 4, NULL, '2021-11-27 01:04:24', '2021-11-27 21:39:11'),
(5, 'officer', 'officer', 'officer@bits.org', NULL, '$2y$10$1IeGm3C0vp3NLk0AgEwAYukaxUxzjuOlcNZsEBsQreU9Z4dD89ClS', NULL, NULL, 'qHqqgDo7y25TeW3Uvh7FWyOr3AQQOtBwnZ6ITnNhfiRRnO7Uva2J2KY6lBFI', 5, NULL, '2021-11-27 01:58:31', '2021-11-27 02:41:51'),
(6, 'admin', 'admin', 'admin@bits.org', NULL, '$2y$10$QY1qljzlongmvJb/mcJZx.lVyzO4hjLzUs0/PCzJk7xpOH043prR.', NULL, NULL, NULL, 6, NULL, '2021-11-28 01:39:02', '2021-12-01 17:32:19'),
(7, 'user', 'David Gurion', 'DavidGurion@gmail.com', NULL, '$2y$10$QrArCyUSaeOiVkFyZfdhe.5OUnVk147dfzeljsAslhz9vEpKs3YQi', NULL, NULL, NULL, 7, NULL, '2021-12-01 16:20:34', '2021-12-01 16:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `role`, `route_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'dashboard', '2021-11-27 22:12:31', '2021-11-27 22:12:31'),
(2, 'admin', 'pages', '2021-11-27 22:12:38', '2021-11-27 22:12:38'),
(3, 'admin', 'navigation-menus', '2021-11-27 22:13:03', '2021-11-27 22:13:03'),
(4, 'admin', 'users', '2021-11-27 22:13:15', '2021-11-27 22:13:15'),
(5, 'admin', 'user-permissions', '2021-11-27 22:13:21', '2021-11-27 22:13:21'),
(6, 'officer', 'dashboard', '2021-11-27 22:13:32', '2021-11-27 22:13:32'),
(7, 'officer', 'pages', '2021-11-27 22:13:40', '2021-11-27 22:13:40'),
(11, 'user', 'dashboard', '2021-11-30 06:54:55', '2021-11-30 06:54:55'),
(14, 'officer', 'user-permissions', '2021-12-01 16:32:34', '2021-12-01 16:32:34');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `trix_attachments`
--
ALTER TABLE `trix_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trix_rich_texts`
--
ALTER TABLE `trix_rich_texts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trix_rich_texts_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trix_attachments`
--
ALTER TABLE `trix_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trix_rich_texts`
--
ALTER TABLE `trix_rich_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
