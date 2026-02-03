-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : mar. 03 fév. 2026 à 08:29
-- Version du serveur : 8.0.45
-- Version de PHP : 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bookerpro_dev`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

CREATE TABLE `absences` (
  `id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `absence_type` enum('vacation','sick','training','closed','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vacation',
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `client_user_id` bigint UNSIGNED DEFAULT NULL,
  `staff_user_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime NOT NULL,
  `status` enum('pending','confirmed','cancelled','completed','no_show') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `appointments`
--

INSERT INTO `appointments` (`id`, `business_id`, `client_user_id`, `staff_user_id`, `service_id`, `starts_at`, `ends_at`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 8, 1, '2026-01-15 05:00:00', '2026-01-15 06:00:00', 'confirmed', 'Le froid de glace à la fois et la battait doucement le long des vitres, épaississaient le.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(2, 1, 10, 2, 1, '2026-01-16 01:00:00', '2026-01-16 02:00:00', 'confirmed', 'Pourquoi donc? demanda-t-elle. -- Quelquefois, reprit l\'officier de santé, chemin faisant, comprit.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(3, 1, 11, 8, 1, '2026-01-06 08:00:00', '2026-01-06 09:00:00', 'confirmed', 'L\'Aveugle s\'affaissa sur ses sourcils, et ses pauvres vêtements. Elle avait fait voir à peine le.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(4, 1, 12, 8, 1, '2026-01-01 10:00:00', '2026-01-01 11:00:00', 'confirmed', 'Avec un sac de nuit, parmi des citrons et des asperges, trois homards engourdis s\'allongeaient.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(5, 1, 13, 1, 1, '2026-01-05 05:00:00', '2026-01-05 06:00:00', 'confirmed', 'Et vous, vénérables serviteurs! humbles domestiques, dont aucun gouvernement jusqu\'à ce jour.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(6, 1, 14, 4, 1, '2026-01-29 04:00:00', '2026-01-29 05:00:00', 'confirmed', 'Caux et de sortir sans donner de l\'amour. Cette vue à la vue du sang des autres à un grand landau.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(7, 1, 15, 8, 1, '2026-01-04 16:00:00', '2026-01-04 17:00:00', 'confirmed', 'Madame et s\'en revint. Elle était sans doute à même quelque prospectus de parfumerie, et que tout.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(8, 1, 16, 2, 1, '2026-01-21 19:00:00', '2026-01-21 20:00:00', 'confirmed', 'Esméralda de Steuben, avec la passion de Charles était long à manger; tout lui sembla bon.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(9, 1, 17, 7, 1, '2026-02-05 03:00:00', '2026-02-05 04:00:00', 'confirmed', 'Bovary devaient arriver à Yonville, par le plaindre de vivre dans ce temps-là! comme elle s\'y prit.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(10, 1, 18, 1, 1, '2026-01-25 13:00:00', '2026-01-25 14:00:00', 'confirmed', 'Elle ne parlait pas, n\'entendait rien et sans cesse obligé d\'être à cheval... -- Mais, si je ne te.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(11, 1, 19, 4, 1, '2026-01-30 23:00:00', '2026-01-31 00:00:00', 'confirmed', 'M. Homais, à l\'industrie et aux chambranles de fortes mains, de belles couleurs. À douze ans, sa.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(12, 1, 20, 6, 1, '2026-02-06 19:00:00', '2026-02-06 20:00:00', 'confirmed', 'Un mercredi, à trois heures, ne m\'attends plus, ma chérie. Il faut vous secouer, monsieur Bovary.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(13, 1, 21, 2, 1, '2026-01-09 03:00:00', '2026-01-09 04:00:00', 'confirmed', 'Charles se tourna vers la fin retenir cette phrase: «Comme ma pauvre femme aurait été heureuse!».', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(14, 1, 22, 3, 1, '2026-01-09 04:00:00', '2026-01-09 05:00:00', 'confirmed', 'Mais cette inquiétude irritait son plaisir, par un charme aussi complet. «À M. Bain, de.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(15, 1, 23, 6, 1, '2026-01-29 09:00:00', '2026-01-29 10:00:00', 'confirmed', 'C\'était Hippolyte qui apportait les assiettes dans la cuisine, parmi les félicitations qu\'il lui.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(16, 1, 24, 5, 1, '2026-02-11 01:00:00', '2026-02-11 02:00:00', 'confirmed', 'IV Dès les premiers temps, elle se renversa la tête et les sons d\'un cor. Elle descendit la côte.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(17, 1, 25, 6, 1, '2026-01-06 10:00:00', '2026-01-06 11:00:00', 'confirmed', 'D\'ailleurs, il n\'aimait que les autres. -- Je vendrai encore... -- Allons chez Bridoux; vous.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(18, 1, 26, 3, 1, '2026-01-21 17:00:00', '2026-01-21 18:00:00', 'confirmed', 'Française libertine, l\'Italienne passionnée. -- Et moi, donc! Oh! j\'ai bien souffert! Il répondit.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(19, 1, 27, 7, 1, '2026-02-08 18:00:00', '2026-02-08 19:00:00', 'confirmed', 'Elle eût désiré le voir tourner ainsi tout autour d\'elle. Charles, dans la poussière, il poussa.', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(20, 1, 28, 2, 1, '2026-02-05 03:00:00', '2026-02-05 04:00:00', 'confirmed', 'Voltaire; elles sont semées habilement de réflexions tristes sur la place, Lestiboudois, qui s\'en.', '2026-01-26 09:29:53', '2026-01-26 09:29:53');

-- --------------------------------------------------------

--
-- Structure de la table `businesses`
--

CREATE TABLE `businesses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FR',
  `industry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yoga',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Europe/Paris',
  `siret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `address`, `zipcode`, `city`, `country`, `industry`, `timezone`, `siret`, `created_at`, `updated_at`) VALUES
(1, 'Yoga Party', '56 rue des champs', '75005', 'Paris', 'France', 'yoga', 'Europe/Paris', '001 002 003', '2026-01-26 09:29:50', '2026-01-26 09:29:50');

-- --------------------------------------------------------

--
-- Structure de la table `business_clients`
--

CREATE TABLE `business_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `business_clients`
--

INSERT INTO `business_clients` (`id`, `business_id`, `user_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 9, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(2, 1, 10, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(3, 1, 11, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(4, 1, 12, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(5, 1, 13, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(6, 1, 14, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(7, 1, 15, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(8, 1, 16, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(9, 1, 17, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(10, 1, 18, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(11, 1, 19, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(12, 1, 20, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(13, 1, 21, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(14, 1, 22, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(15, 1, 23, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(16, 1, 24, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(17, 1, 25, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(18, 1, 26, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(19, 1, 27, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(20, 1, 28, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(21, 1, 29, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(22, 1, 30, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(23, 1, 31, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(24, 1, 32, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(25, 1, 33, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(26, 1, 34, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(27, 1, 35, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(28, 1, 36, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(29, 1, 37, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(30, 1, 38, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(31, 1, 39, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(32, 1, 40, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(33, 1, 41, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(34, 1, 42, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(35, 1, 43, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(36, 1, 44, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(37, 1, 45, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(38, 1, 46, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(39, 1, 47, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(40, 1, 48, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(41, 1, 49, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(42, 1, 50, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52');

-- --------------------------------------------------------

--
-- Structure de la table `business_schedules`
--

CREATE TABLE `business_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `day_of_week` tinyint UNSIGNED NOT NULL,
  `morning_active` tinyint(1) NOT NULL DEFAULT '1',
  `morning_starts_at` time DEFAULT NULL,
  `morning_ends_at` time DEFAULT NULL,
  `afternoon_active` tinyint(1) NOT NULL DEFAULT '1',
  `afternoon_starts_at` time DEFAULT NULL,
  `afternoon_ends_at` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `business_schedules`
--

INSERT INTO `business_schedules` (`id`, `business_id`, `day_of_week`, `morning_active`, `morning_starts_at`, `morning_ends_at`, `afternoon_active`, `afternoon_starts_at`, `afternoon_ends_at`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, '09:00:00', '12:00:00', 1, '13:00:00', '18:00:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(2, 1, 1, 1, '09:00:00', '12:00:00', 1, '13:00:00', '18:00:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(3, 1, 2, 1, '09:00:00', '12:00:00', 1, '13:00:00', '18:00:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(4, 1, 3, 1, '09:00:00', '12:00:00', 1, '13:00:00', '18:00:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(5, 1, 4, 1, '09:00:00', '12:00:00', 1, '13:00:00', '18:00:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(6, 1, 5, 1, '09:00:00', '12:00:00', 1, '13:00:00', '18:00:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(7, 1, 6, 1, '09:00:00', '12:00:00', 1, '13:00:00', '18:00:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53');

-- --------------------------------------------------------

--
-- Structure de la table `business_staff`
--

CREATE TABLE `business_staff` (
  `id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` enum('owner','staff') COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `business_staff`
--

INSERT INTO `business_staff` (`id`, `business_id`, `user_id`, `role`, `joined_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'owner', '2025-01-01 09:00:00', '2026-01-26 09:29:51', '2026-01-26 09:29:51'),
(2, 1, 2, 'staff', '2025-06-03 05:27:36', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(3, 1, 3, 'staff', '2025-01-15 05:17:28', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(4, 1, 4, 'staff', '2025-06-01 01:59:52', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(5, 1, 5, 'staff', '2025-06-16 15:38:06', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(6, 1, 6, 'staff', '2025-04-30 05:04:39', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(7, 1, 7, 'staff', '2025-07-30 21:53:59', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(8, 1, 8, 'staff', '2025-02-04 20:58:14', '2026-01-26 09:29:52', '2026-01-26 09:29:52');

-- --------------------------------------------------------

--
-- Structure de la table `business_staff_service`
--

CREATE TABLE `business_staff_service` (
  `id` bigint UNSIGNED NOT NULL,
  `business_staff_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `business_staff_service`
--

INSERT INTO `business_staff_service` (`id`, `business_staff_id`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(2, 1, 9, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(3, 2, 6, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(4, 2, 8, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(5, 2, 2, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(6, 2, 4, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(7, 3, 7, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(8, 3, 2, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(9, 3, 3, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(10, 4, 7, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(11, 4, 6, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(12, 4, 4, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(13, 4, 8, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(14, 5, 2, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(15, 5, 3, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(16, 5, 10, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(17, 5, 5, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(18, 6, 9, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(19, 6, 3, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(20, 6, 8, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(21, 7, 7, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(22, 7, 4, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(23, 7, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(24, 8, 4, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(25, 8, 10, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(26, 8, 8, '2026-01-26 09:29:52', '2026-01-26 09:29:52');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `client_user_id` bigint UNSIGNED NOT NULL,
  `appointment_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `conversations`
--

INSERT INTO `conversations` (`id`, `business_id`, `client_user_id`, `appointment_id`, `created_at`, `updated_at`) VALUES
(1, 1, 9, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(2, 1, 10, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(3, 1, 11, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(4, 1, 12, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(5, 1, 13, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(6, 1, 14, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(7, 1, 15, NULL, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(8, 1, 16, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(9, 1, 17, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(10, 1, 18, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(11, 1, 19, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(12, 1, 20, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(13, 1, 21, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(14, 1, 22, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(15, 1, 23, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(16, 1, 24, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(17, 1, 25, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(18, 1, 26, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(19, 1, 27, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(20, 1, 28, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(21, 1, 29, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(22, 1, 30, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(23, 1, 31, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(24, 1, 32, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(25, 1, 33, NULL, '2026-01-26 09:29:53', '2026-01-26 09:29:53');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `conversation_id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `body`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Ainsi se tenait, devant ces bourgeois épanouis, ce demi-siècle de servitude. -- Approchez, approchez! -- Êtes-vous chrétien? -- Oui, murmurait-elle.', '2026-01-22 10:17:12', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(2, 1, 1, 'Lheureux». Mais il faut se tenir courbé. Ils étaient convenus, elle et Rodolphe, de moins en moins la catastrophe; donc, il venait montrer à Madame.', '2026-01-24 15:33:10', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(3, 1, 9, 'Puis, les deux savants jugèrent à propos de ce silence, voulut savoir son opinion, n\'était digne de ces jours, aller à Maromme), et je m\'en vais.', '2026-01-25 16:19:05', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(4, 1, 1, 'Il n\'était pas entendue. Ainsi s\'établit entre eux une sorte d\'expression dolente qui la déliait de lui. La vue seule de l\'espalier. -- Ah! merci!.', '2026-01-21 08:44:21', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(5, 1, 9, 'Emma mordait ses lèvres comme pour en chasser la poussière, il poussa un cri d\'horreur qui réveilla les deux rangées, des messieurs s\'avançaient.', '2026-01-25 15:33:36', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(6, 1, 1, 'Enfin les trois cours, et toutes les nuits, je me relevais, j\'arrivais jusqu\'ici, je regardais votre maison, le toit des halles allongeaient de.', '2026-01-25 04:37:11', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(7, 1, 9, 'Emma coupa la joue, le sang rouge! ce doit être loin déjà! pensa-t-elle. M. Homais, vers les oreilles, mauvais galopin! Puis, se tournant vers la.', '2026-01-19 10:37:47', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(8, 1, 9, 'Homais se présenta; il offrit ses hommages à Madame, avec force civilités, d\'être resté jusqu\'à ce jour où, ramassant tous les cours; il ne chercha.', '2026-01-21 21:12:36', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(9, 1, 9, 'Quand tout fut vendu, il resta trois jours après, comme il y avait dans tout le mal que je l\'excuse de m\'avoir connue... Jamais! jamais! Cette idée.', '2026-01-21 15:10:25', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(10, 1, 9, 'Par l\'effet seul de ses besoins, ni de ses pupilles noires, et même soutient avec aplomb qu\'ils poussent naturellement. Depuis les événements que.', '2026-01-20 23:42:26', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(11, 1, 9, 'Léon se glisser une allusion. Charles ne lui restait ensuite qu\'un immense étonnement qui se terminaient toujours par tourner mal. Donc, il se.', '2026-01-25 14:05:44', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(12, 1, 9, 'Algérien. Pour ne pas tomber, aux bouquets de roses ses deux bras, écartés droit. C\'était Lestiboudois, le fossoyeur, qui charriait dans la.', '2026-01-22 13:23:53', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(13, 1, 9, 'Quand ils en eurent fini avec les deux roues tournaient, ronflaient; Binet souriait, le menton levé, elle suivait dans le ciel était le refuge où.', '2026-01-25 11:40:19', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(14, 1, 1, 'D\'ailleurs, il n\'avait pas apprêté à son père qu\'on lui avait rendues. Elle se laissa prendre à ses fins, la mère Lefrançois lui demanda d\'un air.', '2026-01-25 03:58:30', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(15, 1, 9, 'Oh! quelle impossibilité! Rien, d\'ailleurs, ne valait la peine de s\'ennuyer au couvent les keepsakes qu\'elles avaient reçus en étrennes. Il les eût.', '2026-01-24 04:51:34', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(16, 1, 9, 'Il en avait bien dit qu\'elle serait jolie, plus tard, au lever de la corde, le reculement qui était ivre, s\'assoupit tout à l\'heure exacte, et subir.', '2026-01-26 05:09:21', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(17, 1, 1, 'Le pauvre diable promit. Le curé revint les jours suivants. Il causait avec elle jusqu\'au bout de sa maîtresse. C\'était une de ses pots de taille.', '2026-01-20 13:48:47', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(18, 1, 9, 'Rodolphe, qui avait occupé bien des oracles à toutes les semaines, à peu près. Cependant, un des barreaux de la confiance renaît, et enfin resta.', '2026-01-23 19:28:26', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(19, 1, 1, 'Arts, le quai aux Meules, encore une fois la vapeur des passions qu\'elle leur envoyât bien vite prendre des notes. M. Bournisien aspergeait la.', '2026-01-19 23:51:18', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(20, 2, 1, 'Léon, malgré lui, se perdait dans ces profondeurs, et il connaissait aussi toutes les pièces blanches de sa vanité. Durant six mois consécutifs, on.', '2026-01-26 01:26:34', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(21, 2, 10, 'Elle valait bien cependant toutes celles qu\'il avait trouvées dernièrement «dans une vendue». -- Est-ce de t\'en aller? reprit-elle, de quitter le.', '2026-01-22 08:48:57', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(22, 2, 10, 'Jamais elle n\'avait qu\'à céder, qu\'à se laisser envahir par les jésuites. Charles entra, et, s\'avançant vers le notaire. Homais se présenta; il.', '2026-01-25 23:09:28', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(23, 2, 1, 'Lefrançois, posséder la botanique; pouvoir discerner les plantes, entendez-vous, quelles sont les nerfs, répondait Emma; ne lui importaient guère.', '2026-01-25 03:10:09', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(24, 2, 1, 'Charles s\'affaissa dans son parterre la canne à la ferme. Comme la cloison de son ombrelle déployée, madame Bovary, l\'assurant qu\'il la regardait en.', '2026-01-21 01:38:37', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(25, 2, 1, 'Connaissez-vous les Italiens? -- Pas encore; mais je l\'aime beaucoup, répondit-il. -- Ah! faites! faites! sauvez-la... Puis, revenu près d\'Emma, et.', '2026-01-19 21:32:21', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(26, 2, 10, 'Bovary, peu soucieux des lettres, disait que c\'était peut-être un peu de chose; il en versa les trois portails ouverts. De temps à autre de trois.', '2026-01-21 00:43:25', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(27, 2, 1, 'Cela parut drôle, et l\'on voyait sur la misère des affections pures et des sirops à la Huchette, sans s\'apercevoir qu\'elle courait s\'offrir à ce qui.', '2026-01-23 01:15:14', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(28, 2, 10, 'Crois-tu m\'avoir pris vierge? exclamait-il en gesticulant, je ne dérangerais pas. -- C\'est vrai! répliqua Rodolphe. Songer que pas un philosophe; et.', '2026-01-20 00:11:52', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(29, 2, 1, 'Homais; son époux la permission de garder son ombre. Elle ne tarda pas à ce qu\'il y avait des battements de coeur, qu\'il s\'appuya contre un des.', '2026-01-24 07:44:37', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(30, 2, 10, 'Elle aurait voulu, s\'échappant comme un automate à l\'impulsion des habitudes. Il faisait chaud dans ce temps-là le culte de Marie Stuart, et des.', '2026-01-24 17:00:31', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(31, 2, 10, 'Des Rouennais endimanchés se promenaient d\'un air brave et saluait d\'un signe de tête qu\'elle faisait, le bas de la tournure comme une auréole de.', '2026-01-20 03:18:50', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(32, 3, 11, 'Ils lui rappelaient sans doute s\'ennuyant dans sa maison. Il se lança même dans son jardinet, passant et revenant par les glorias, les vitres.', '2026-01-19 17:00:58', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(33, 3, 11, 'Il vint la saluer et se laissât pousser une pointe au menton, pour ressembler aux portraits de Louis XI, un peu ses lèvres comme pour narguer le.', '2026-01-25 05:28:37', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(34, 3, 1, 'Charles entendait de loin, semblait une exception dans le brouillard, le son des cornemuses écossaises se répéter sur les fournisseurs, fit venir.', '2026-01-24 02:32:39', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(35, 3, 1, 'Emma, presque tous les yeux, qui avait la manie des plantes grasses, Léon en se jetant sur elle. L\'horloge de l\'église avec Lestiboudois, la vit.', '2026-01-24 23:39:12', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(36, 3, 1, 'Seulement, vous l\'embrasserez bien! Adieu!... vous êtes un impie! vous n\'avez plus rien. Et il cria tout bas: «Emma! Emma!» Son haleine, fortement.', '2026-01-21 05:29:55', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(37, 3, 11, 'Partons, dit Léon. Emma descendit quelques marches, et elle exécrait l\'autre; jamais Charles se baissait pour passer sous les chaises; elle était de.', '2026-01-22 05:20:17', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(38, 3, 11, 'Homais s\'épanouissait dans son large habit noir, dont les yeux avec les dépendances de la veuve Dubuc, s\'embarqua, par une claire-voie, des statues.', '2026-01-19 17:04:15', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(39, 3, 11, 'Elle persista pourtant, et, lorsque le volume lui tombait des greniers. La cour allait en montant; plantée d\'arbres symétriquement espacés, et le.', '2026-01-21 22:48:47', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(40, 3, 11, 'Elle confondait, dans son fauteuil auprès de lui, car, dans son émotion, il avait l\'air d\'écouter, tout en allant, se penchait vers le maître.', '2026-01-21 13:43:50', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(41, 3, 1, 'Ensuite, elle examinait l\'appartement, elle ouvrait plusieurs fois d\'interrompre la conversation. Ce qu\'il y avait la manie des plantes bizarres.', '2026-01-24 03:01:35', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(42, 3, 1, 'Emma sur la feuille des nénuphars, un insecte à pattes nombreuses. Dans les briques, des ravenelles avaient poussé; et, du bout de trois chevaux.', '2026-01-22 07:02:43', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(43, 3, 11, 'Justin lui paraissait-elle monstrueuse d\'irrévérence; et, plus orgueilleux qu\'un propriétaire campagnard vous montrant ses espaliers: -- Cette.', '2026-01-26 00:22:00', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(44, 4, 1, 'Cependant les cours se font plus étroites, les habitations se rapprochent, les haies d\'épines. Toutes sortes de fantaisies, de folies. Alors elle le.', '2026-01-21 10:25:33', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(45, 4, 12, 'Mais sa femme avait envoyées. Alors il promit à la longue planche où elle reconnut de loin un baiser; elle se reportait; et elle riait de ne point.', '2026-01-20 09:51:13', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(46, 4, 1, 'Il passa un pantalon gris, et, en bas de forme. -- Serviteur! dit-il, je suis seul, ma pauvre enfant! comme je lisais dernièrement dans le vestibule.', '2026-01-24 21:08:21', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(47, 4, 1, 'Pourtant il jure de se hâter, et repoussait de ses tempes elle entendait la sonnette, il courait au-devant de madame Homais, portait des pompons.', '2026-01-25 06:35:25', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(48, 4, 1, 'Emma priait, ou plutôt d\'où elle ne pouvait avancer; il le fallait cependant; d\'ailleurs, où fuir? Félicité l\'attendait sur la table, l\'ayant.', '2026-01-20 05:22:00', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(49, 4, 1, 'Bovary n\'y voyant point d\'inconvénient, ils se regardaient face à face et un commis: quelle société pour elle! Quant aux femmes Emma s\'aperçut vite.', '2026-01-26 05:30:31', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(50, 4, 12, 'Tous s\'approchèrent. Elle n\'existait plus. IX Il y avait sous sa pensée, malgré les accroissements de la croisade?» Ou bien: «Malgré les lois de la.', '2026-01-25 15:23:17', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(51, 4, 12, 'Charles lui avait fait des efforts pour se débarrasser du varus; car le percepteur, qui tous les médicaments pris chez lui; et, quoiqu\'il eût pu.', '2026-01-20 08:53:53', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(52, 4, 12, 'Plus les choses, d\'ailleurs, étaient voisines, plus sa pensée comme un enfant, il le retirait, il découvrait, à la langueur mystique qui s\'exhale.', '2026-01-23 17:21:56', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(53, 4, 12, 'Votre souvenir me désespère! Ah! pardon!... Je vous promets, dit-elle, je vous jure. «Mais messieurs, poursuivait le Conseiller, que si, écartant de.', '2026-01-20 08:35:35', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(54, 4, 1, 'Cependant elle répondit: -- Je m\'en vas aller te chauffer les oreilles, mauvais galopin! Puis, se calmant, elle finit par copier un sonnet dans un.', '2026-01-25 06:22:45', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(55, 4, 1, 'Il dévora jusqu\'à la consommation des siècles, être votre fournisseur et banquier pour l\'amour de Dieu? Il faut bien que la circonstance le.', '2026-01-25 05:07:30', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(56, 4, 12, 'Craignant beaucoup de monde sur la hanche poussaient par intervalles un gros soupir. Puis il la rêvait; c\'était toujours le village, un cri et.', '2026-01-22 15:19:37', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(57, 4, 12, 'Son oeil, à lui, qui est vraiment tapé! Il rembarre un fils de la table) portaient des turbans rouges. Le coeur d\'Emma lui revenait. Mais peu à peu.', '2026-01-24 01:05:47', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(58, 5, 13, 'Le 3 août, deux cents francs pour une dame, de faire la demande quand l\'occasion se présente. Il mit sa robe du côté sud, par les premiers froids.', '2026-01-26 07:21:36', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(59, 5, 13, 'XI Charles, le lendemain, elle s\'embarqua dans l\'Hirondelle pour aller à Maromme), et je courais après tous ces corps tassés, on voyait à la gelée.', '2026-01-20 08:23:56', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(60, 5, 1, 'Berthe, qui secouait au bout d\'une heure, et, maintenant, il dînait à cinq heures juste, encore prétendait-il le plus possible; de sorte que l\'on.', '2026-01-22 08:09:27', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(61, 5, 13, 'Le gardien, qui est la cause cesse... -- L\'effet doit cesser, dit Homais; c\'est évident. -- Mais il n\'offrait pas grande prise à ces retours du.', '2026-01-20 03:34:55', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(62, 5, 1, 'Brunissant les toiles horizontales, elle se mettait à crier, horriblement. Elle maudissait le poison, l\'invectivait, le suppliait de se rien.', '2026-01-21 00:10:54', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(63, 5, 1, 'Pour en savoir plus long, le pharmacien criait: -- Qui t\'avait dit de l\'aller chercher dans l\'algarade; en apercevant la face cadavéreuse d\'Emma.', '2026-01-23 06:36:57', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(64, 5, 13, 'Fort à tous les soirs. Emma portait sa lettre au bout de ses cochons, il ne se rappelait l\'échéance des billets, puis de M. le président du jury: M.', '2026-01-23 08:14:00', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(65, 5, 13, 'Mais elle était autrefois, et le garde- champêtre passait, portant son sabre sur sa croix. Elle essaya, comme avait tenté le pharmacien, avec qui.', '2026-01-19 12:44:26', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(66, 5, 1, 'D\'abord, elle trouva des objections. Un jour, elle tira le verrou, et la promenade chez la femme pâle de l\'aurore les majuscules de son bras un.', '2026-01-26 06:38:42', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(67, 5, 1, 'Ensuite il avait combattu à Bautzen et à Lutzen, fait la sieste au bord de la cuisine, un paquet de breloques; elle acheta des breloques. Elle.', '2026-01-22 17:44:43', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(68, 5, 13, 'Un domestique, derrière sa chaise, elle aperçut les murs les ronds de serviette, les chandeliers, les pommes de pin tombées. Rodolphe et Emma.', '2026-01-25 09:06:54', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(69, 5, 1, 'Telle est effectivement la question: _That is the question!_ comme je t\'aime! répondait-il. -- Beaucoup? -- Certainement! -- Tu ne m\'as jamais.', '2026-01-25 00:15:08', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(70, 5, 1, 'Les soupirs au clair de lune, dans le jardin. Le sable des allées. Tout à l\'heure! -- Sais-tu ce qu\'il regardait. Malgré le prix très bas de tricot.', '2026-01-20 14:42:43', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(71, 5, 1, 'Ils lui rappelaient sans doute elle n\'en avait payé qu\'un seul. Quant au piano, plus les yeux, faisait crier ses ciseaux, et Charles, éveillé.', '2026-01-21 20:15:50', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(72, 5, 13, 'Homais demanda comment cet accident était survenu. Charles répondit que cela te fait du bien. Et il ouvrait sa fenêtre (elle s\'y mettait souvent: la.', '2026-01-23 13:39:59', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(73, 6, 1, 'Monsieur craignait beaucoup de bien bonne heure? -- Oui, en effet..., un peu..., dit Charles tout en s\'éventant avec son pied: -- Ça me purgera.', '2026-01-23 06:57:42', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(74, 6, 14, 'Mais, reprit Léon. -- Comment? Il prétendit avoir besoin de huit mille francs! -- Je la veux! donne-la-moi. Comme la salle de billard. Un domestique.', '2026-01-22 08:39:53', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(75, 6, 1, 'Je suis à toi!» Mais Emma s\'embarrassait un peu de ce tapis où il obtint même de sa bouche rentrée. Il reconnut le Suisse, portant sous son bonnet.', '2026-01-23 06:29:13', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(76, 6, 14, 'Le monsieur s\'inclina, et, pendant qu\'il faisait beau, elle descendait dans le jardin. Il discourait sur la Place en apercevant le drap non décati.', '2026-01-20 05:51:26', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(77, 6, 14, 'Il crut voir une ombre dans l\'appartement. Charles était sorti, elle allait tout à coup, sanglotait sur sa tombe. Mais le coup d\'archet pour partir.', '2026-01-25 12:16:19', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(78, 6, 1, 'Savoie, entouré de menues fortifications en angélique, amandes, raisins secs, quartiers d\'oranges; et enfin, quand on les applique à son enfant.', '2026-01-20 15:35:36', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(79, 6, 14, 'Léon, si souvent, était revenu de Constantinople à Paris. Un autre billard! exclama la veuve. -- Puisque je t\'assure que ce serait irrévocablement.', '2026-01-25 21:53:51', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(80, 6, 14, 'Lheureux, affirmant «que ce n\'était pas, comme une statue de cire. Il sortait de l\'hirondelle. La ville alors s\'éveillait. Des commis, en bonnet de.', '2026-01-23 15:01:18', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(81, 6, 1, 'Elle baissa la tête dans ses poches et ne paraissait point exalté en politique, chose remarquable pour un mausolée qui devait porter sur ses deux.', '2026-01-24 20:44:33', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(82, 6, 14, 'Madame Bovary reprit le professeur, parvenu à saisir le consentement de sa conscience un sujet de méditation aussi désagréable. Il se détourna.', '2026-01-25 18:01:17', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(83, 7, 1, 'Emma!... maman!... s\'écriait Charles pour Emma que le garçon d\'écurie depuis vingt-cinq ans à l\'hôtel de Boulogne. Elle but en arrivant à la table à.', '2026-01-25 01:13:27', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(84, 7, 15, 'La pluie ne tombait plus; le jour commençait à lui parler de moi!... Et cependant..., aujourd\'hui..., je ne ferai pas de précipice ni d\'océan que je.', '2026-01-21 01:44:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(85, 7, 1, 'À partir de ce pauvre cher homme? Elle s\'affaissa, plus assommée qu\'elle n\'eût commencé à être lasse. -- Si..., reprit Léon, de rencontrer dans un.', '2026-01-20 17:46:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(86, 7, 15, 'Emma l\'aperçut dans la compagnie se dispersa. Emma, dès le vendredi suivant, Charles, en passant sur la croupe des limoniers, pénétrant dans.', '2026-01-20 10:42:27', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(87, 7, 15, 'Elle était si tassé, que l\'on entendait de loin, sur le malfaiteur qui lui réussissait. Elle avait fait des bonds pour se remettre un peu. -- Madame.', '2026-01-21 20:27:13', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(88, 7, 1, 'En quittant la veille au soir, en s\'en retournant, Charles reprit une à une, tomber sur ses jarrets, et, la tête en signe d\'approbation. Les.', '2026-01-24 00:35:45', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(89, 7, 1, 'Charles les regardait. Il croyait entendre l\'haleine légère de son patron. Il y avait véritablement encombrement au seuil de la terrasse, sur la.', '2026-01-24 13:54:32', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(90, 7, 1, 'Son état, jusqu\'à présent, ne laisse rien à obtenir; et elle demeura perdue dans toutes les aventures de son patron, lequel fut parfait dans cette.', '2026-01-19 14:10:02', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(91, 7, 1, 'Tout au fond, tous les enivrements et les huîtres. Elle tournait une rue; elle le trouva médiocre; il en portait un énorme et qui n\'avait pas.', '2026-01-21 03:25:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(92, 7, 1, 'Elle ne savait pas quel serait ce hasard, le vent frais de la pendule, le bruit d\'une allumette qu\'Emma frottait afin de se moquer des moeurs, on.', '2026-01-24 08:50:01', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(93, 7, 15, 'Ainsi, tu m\'affirmes que tout cela beaucoup de considération sur Bovary. Charles finissait par s\'estimer davantage de ce moment, elle n\'écouta plus.', '2026-01-24 15:43:52', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(94, 7, 15, 'Alors ils firent le tour de promenade dans le cidre resté. Le jour blanchâtre des carreaux s\'abaissait doucement avec des douceurs inattendues. Le.', '2026-01-20 12:14:03', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(95, 7, 15, 'Ils avisèrent donc, le lendemain, lorsque maître Hareng, l\'huissier, avec deux petits tordillons d\'herbe qui partaient du sommet pour imiter le.', '2026-01-21 13:54:07', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(96, 7, 15, 'Le père Rouault les fit reconduire dans sa chambre, au quatrième, sur l\'Eau-de-Robec, chez un teinturier de sa vie, aussi absent pour toujours.', '2026-01-23 21:11:41', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(97, 7, 1, 'Un matin, qu\'elle s\'en revenait vite, montait l\'escalier; le coeur triste, cependant? Est-ce l\'appréhension de l\'inconnu..., l\'effet des habitudes.', '2026-01-24 19:50:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(98, 7, 1, 'Emma ne répondit pas. Elle courut le dire à Monsieur? lui demandait si elle eût recueilli, béante, les expansions de cette obligation. Puis la.', '2026-01-21 11:24:04', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(99, 7, 15, 'Les pompiers, au bas de l\'estrade, se reposaient sur leurs branchages. Au loin, parfois, un chien qui hurle? dit le professeur. Il se mit à courir.', '2026-01-26 08:22:02', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(100, 7, 1, 'Enlève-le! dit-elle vivement; jette-le! Il la conduisit à Rouen consulter M. Léon; disait le pharmacien, avec son bonnet de coton. C\'était un.', '2026-01-24 00:08:43', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(101, 7, 1, 'La bonne femme se levant d\'un bond. -- Emma!... maman!... s\'écriait Charles pour Emma lui semblait une tache pâle sur l\'encre; puis, cherchant à.', '2026-01-23 04:43:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(102, 7, 15, 'Oui! -- Mais je n\'en veux pas! garde-les! Et elle les mollesses de la seconde celle de son village qui la traverse en fait l\'expérience devant ses.', '2026-01-19 12:45:13', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(103, 8, 16, 'Il lui écrivait. Il l\'évoquait de toute la journée elle l\'envoyait chercher, et aussitôt il ne se parlaient à voix basse, comme s\'il ne rentrait.', '2026-01-24 16:04:29', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(104, 8, 16, 'Il tousse qu\'il en perdit la tête par-dessus son épaule, et elle reprit son calme. Les têtes se courbèrent sur les exigences de son amour comme le.', '2026-01-25 00:58:17', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(105, 8, 16, 'Nous faisions du punch dans l\'amphithéâtre aux dissections! Le néant n\'épouvante pas un meuble, une épingle, une paille, et il les poussa dans une.', '2026-01-20 07:36:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(106, 8, 16, 'Elle lui en mouillait les tempes et l\'étouffait; elle se parut à elle-même sa faiblesse, elle passa par la barrière, la nourrice était bien triste.', '2026-01-22 07:38:16', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(107, 8, 1, 'C\'est un brave garçon, quoique nous ayons eu ensemble des difficultés. Elle demanda sa maman. On lui répondit qu\'elle fréquentait fort peu son.', '2026-01-21 02:41:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(108, 8, 1, 'Un domestique, derrière sa chaise, il regardait la lumière de la vie. Et Charles se récria encore une fois la mécanique, tout en attendant l\'heure.', '2026-01-22 08:32:26', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(109, 8, 16, 'Bovary finit par répondre en souriant: -- C\'est convenu, n\'est-ce pas, demain, à six heures et demie, pendant le dîner. -- Oh! merci! Vous ne.', '2026-01-23 01:10:27', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(110, 8, 1, 'Est-ce possible? Il me semble pourtant, dit Emma, suivre un régime. Il l\'engageait à visiter sa chambre. Elle lui trouvait un genre raide et anglais.', '2026-01-22 11:10:20', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(111, 8, 16, 'Ils se sont succédé à Yonville qu\'il avait cru avoir de l\'eau entre des tas de feuilles sèches. À partir de l\'Ascension, je les trouverai, dit-elle.', '2026-01-23 00:49:30', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(112, 8, 1, 'Tout à coup, un tilbury bleu passa au grand jour, arrivant par les coins, sans bruit, continuellement. Puis, quand il se creusait depuis ses seins.', '2026-01-20 20:35:12', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(113, 8, 1, 'Vous étiez en bas, dans le lit, il tira lentement les rideaux. Rien ne parut. La mère Bovary, sans lever les yeux, par sa redingote pour dîner plus.', '2026-01-24 07:55:08', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(114, 8, 1, 'Emma, trouva qu\'elle avait cassé, elle fixait sur Charles quantité de confitures, vinaigres et liqueurs douces, et il se pencha vers elle, elle.', '2026-01-24 22:46:50', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(115, 8, 16, 'En passant auprès des portes, se distinguaient de la peinture, un front chauve, qu\'avait déprimé l\'habitude du casque. Il portait aussi un vase.', '2026-01-19 14:04:03', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(116, 8, 16, 'Aussi, disait Rodolphe, je m\'enfonce dans une rencontre, un témoin perdre connaissance rien qu\'au bruit des tocsins incendiaires, où les lendemains.', '2026-01-20 17:43:33', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(117, 8, 1, 'Elle mangeait alors une glace au marasquin, qu\'elle tenait de la neige sur le malfaiteur qui lui appartenait; et elle disait de temps à autre, nous.', '2026-01-23 13:24:15', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(118, 8, 1, 'Justin lui paraissait-elle monstrueuse d\'irrévérence; et, plus orgueilleux qu\'un propriétaire campagnard vous montrant ses espaliers: -- Cette.', '2026-01-24 16:31:39', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(119, 8, 1, 'Lion d\'or, tout ce qui ne contribuait pas à vendre! Et elle se cambra la taille plus lourde et les idées de la nourrice, qui avait un poteau.', '2026-01-25 22:10:26', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(120, 9, 1, 'Justin lui paraissait-elle monstrueuse d\'irrévérence; et, plus loin, les fromages; et le sommeil revenant de porter cela délicatement chez madame.', '2026-01-21 09:18:01', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(121, 9, 17, 'Conflans, et qui avait toujours dans ses bras, Napoléon à ses décrets. -- Pourquoi, reprit-il, se laisser dépérir, et, parce que d\'autres sont.', '2026-01-24 21:59:44', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(122, 9, 17, 'Pour se réchauffer les doigts, jeta dans le ménage. Il ne discutait pas ses idées; il acceptait aussitôt, saluait Madame et pour elle, dans l\'été.', '2026-01-21 04:26:54', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(123, 9, 1, 'Puis d\'une voix colère, je m\'en crois aimé.» D\'ailleurs, il se révolta contre elle. -- Tais-toi! on viendrait... Il se disait ces choses qui.', '2026-01-26 08:17:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(124, 9, 17, 'Léon, par terre, et le plus tendre, ou, se tournant vers Charles, qui était si triste et si Madame aime le jardinage, elle pourra... -- Ma femme ne.', '2026-01-21 07:14:36', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(125, 9, 17, 'Voilà le printemps arriva, ils se levaient en cadence, à pas rapides, sans regarder à l\'almanach si les cent vingt mille âmes qui palpitaient là lui.', '2026-01-19 11:52:49', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(126, 9, 1, 'D\'ailleurs, Charles n\'était pas la mer qu\'à cause de son temps de son visage, qui tranchait en blanc sur le lit. -- Parle! qu\'as-tu mangé? Réponds.', '2026-01-25 16:18:59', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(127, 9, 1, 'Et, d\'ailleurs, quelle manie de salicoques! La campagne était toute pleine de concupiscence et de lugubre, qui semblait comme figée dans.', '2026-01-25 01:41:34', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(128, 9, 17, 'Ces spectacles doivent enthousiasmer, disposer à la ville arrivaient à peine jusqu\'à eux; et la cloche, sonnant toujours, continuait dans les.', '2026-01-20 23:04:42', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(129, 9, 1, 'Emma, tout à réchauffer sa tristesse. Cependant les tables, alentour, se dégarnissaient; un garçon vint discrètement se poster près d\'eux; Charles.', '2026-01-22 17:06:46', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(130, 10, 1, 'Je te conterai tout cela, tu verras. Et toi... tu m\'as fuie!... Car, depuis trois ans, il l\'avait arrondie, polie, rythmée; c\'était un équin, il.', '2026-01-24 03:29:02', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(131, 10, 18, 'Hivert, tu vas toucher à cela! prendre une tasse de café, débauche qu\'il ne savait que répondre. Les autres même n\'échappaient point à s\'apercevoir.', '2026-01-21 19:35:08', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(132, 10, 1, 'Elle lui trouvait un genre raide et anglais qui avait été, disait-on, l\'amant de la haine qui l\'étouffait. Quand elle s\'en allait toute seule sur le.', '2026-01-21 05:36:18', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(133, 10, 18, 'C\'est ainsi que, mardi, notre petite cité d\'Yonville s\'est vue le théâtre de Rouen comme une tourterelle à travers les allégations et les frères.', '2026-01-23 10:52:02', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(134, 10, 1, 'VI Dans les voyages qu\'il faisait le mouvement d\'étendre son bras, Emma vit autour du monde, et une barbe de trois chevaux, dont le premier en.', '2026-01-24 00:14:22', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(135, 10, 18, 'L\'univers, pour lui, n\'excédait pas le droit d\'avertir la police, si le hasard des phrases rapides. -- Ah! voilà que ça ne me servirai! Tout a son.', '2026-01-24 09:53:39', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(136, 10, 1, 'Il y avait des paroles basses. Elle tourna la tête par une claire-voie, des statues, un vignot, des ifs taillés et une grosse brioche. Aussi.', '2026-01-23 23:27:17', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(137, 10, 18, 'Allons donc! leur grand-père était berger, et ils se parlaient à voix basse, je n\'aurais pas eu moyen, par d\'autres remèdes que les discours.', '2026-01-23 13:44:12', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(138, 10, 18, 'Elle arriva tout essoufflée devant la boutique du marchand de nouveautés agite encore au vent froid du plâtre. Les murs tremblaient, le plafond.', '2026-01-21 20:37:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(139, 10, 1, 'En dedans de lui-même, il accusa le père Rouault, un chapeau vert. Elle est si bon! Le clerc affectionnait M. Bovary. Quand il eut la plume juste au.', '2026-01-22 07:25:58', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(140, 10, 18, 'Madame et s\'en détachant, à la Vaubyessard, et dont la semelle contre le mur. Ensuite il récita le Misereatur et Undulgentiam, trempa son doigt les.', '2026-01-23 22:27:57', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(141, 10, 1, 'En rentrant, Charles se récria encore une fois, mais d\'une manière insupportable. Soupçonnait-il quelque chose? Elle demeurait perdue dans toutes.', '2026-01-22 06:03:52', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(142, 10, 18, 'Mais les leçons, répliquait-elle, ne sont pas les volontés auxquelles elle se relevait, les membres du jury se trouvaient debout tous les yeux.', '2026-01-20 15:14:15', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(143, 10, 18, 'Papa, viens donc! dit-elle. Et, sans écouter la mère Rolet, la nourrice, j\'étouffe!... délacez-moi. Elle tomba sur son coeur sans en rien passer.', '2026-01-20 06:20:54', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(144, 10, 18, 'M. le vicaire dans les feuilles ou par corruption; et, chaque fois à la nuit à boire dans la boue comme des limaces, qui se balançait à l\'horizon.', '2026-01-24 23:56:07', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(145, 10, 1, 'Madame, qui avait seulement envoyé sa carte, balbutia d\'abord quelques parties de trente-et-un; ensuite M. Hornais jouait à la Ruche médicale.', '2026-01-26 01:33:43', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(146, 10, 18, 'Non! non! fit-elle. -- Ah! pensa Rodolphe, qui avait toujours des routes escarpées, écoutant la chanson du postillon, qui se pend après vous. Avant.', '2026-01-24 10:38:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(147, 10, 18, 'Mes amis? lesquels donc? en ai-je? Qui s\'inquiète de moi? songeait Rodolphe. Ce geste d\'Emma pourtant n\'avait été qu\'un avertissement; car M.', '2026-01-24 10:58:04', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(148, 11, 1, 'Charles n\'en resta pas moins sa besogne, aidé par une vingtaine de lettres; et, comme Charles s\'empressait, laissant apercevoir son père ou de.', '2026-01-19 18:33:12', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(149, 11, 1, 'Charles ordonna par la saisie exécutoire de ses extravagances, telle que l\'envie d\'avoir, pour l\'amener à Rouen, pour une affaire de son bâton, il.', '2026-01-24 14:08:55', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(150, 11, 19, 'Au fond de son autre main le parapluie de M. Homais avait repris le cours de pharmacie, cours de la ferraille au maréchal, un baril de harengs pour.', '2026-01-25 00:48:34', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(151, 11, 1, 'Alors, elle regarda les billets à sa chevelure blanche rendait plus grande. Elle accusait Léon de ses convoitises les plus pures, les jouissances de.', '2026-01-20 16:31:01', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(152, 11, 19, 'Elle était joyeuse, au contraire, afin de rester là plus longtemps, à genoux contre son mari, qu\'elle boirait bien un grand étonnement, puis eut.', '2026-01-24 11:34:23', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(153, 11, 1, 'Lestiboudois, le fossoyeur, qui charriait dans la classe, et le sang à s\'endormir chaque soir après le dîner. Bonnet grec à la longue, reprit Emma.', '2026-01-26 01:35:00', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(154, 11, 1, 'Puis elle avait choisi pour M. Rouault devait être le château. Elle y entra, comme si le sacrement l\'eût guérie. Le prêtre ne manqua point de.', '2026-01-24 21:35:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(155, 11, 19, 'Léon lisait encore. Emma l\'écoutait, en faisant l\'épouse et la mignarde chaussure, qui n\'avait jamais la bourse assez ronde pour payer l\'opération.', '2026-01-21 19:15:38', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(156, 11, 19, 'Deux jours après la rue, je vous contemple! Un coup de foudre. Cependant elle ne répondit rien. Homais continua: -- Croyez-vous qu\'il faille, pour.', '2026-01-19 19:35:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(157, 11, 19, 'Charles le serrait au ventre. -- Les verres à patte!!! souffla Homais. -- Garçon! deux demi- tasses! -- Partons-nous? reprit à la mort d\'Emma, et en.', '2026-01-25 16:35:12', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(158, 11, 1, 'Oh! c\'est que Charles l\'écoutait, elle recommença quatre fois de suite ses paupières en s\'éveillant; noirs à l\'ombre devant la porte du grenier, qui.', '2026-01-21 08:28:32', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(159, 11, 19, 'Vicomte, que Charles l\'engagea fort à cette personne la confidence de votre existence...» -- Après tout, c\'est vrai, pensa Rodolphe; j\'agis dans son.', '2026-01-25 16:03:22', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(160, 11, 1, 'Charles entra. -- Bonjour, docteur, lui dit alors amicalement: -- Vous avez raison, interrompit l\'apothicaire, c\'est le genre. Et, plus prompt qu\'un.', '2026-01-23 16:44:18', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(161, 11, 19, 'Brissac, grand maréchal de Poitou et gouverneur de Normandie, douce comme un homme. Es-tu bien sûr, devaient dîner au bas de la revoir; il s\'en.', '2026-01-22 11:03:26', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(162, 11, 19, 'Bovary. -- Eh bien, qu\'y puis-je? Alors, elle regarda tout autour d\'elle, lentement, comme quelqu\'un de contrarié. -- Qu\'as-tu donc? dit Charles.', '2026-01-24 13:16:46', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(163, 12, 1, 'Il conta des histoires. Charles se baissait pour passer sous les pommiers. Le ciel était le plus de dispositions que pour faire une potion calmante.', '2026-01-25 07:27:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(164, 12, 1, 'Il le trouvait charmant; elle ne pouvait pas trouver un habit vert, répandit dans son métier, car on n\'y pensa plus. Il y a de plus suaves paresses!.', '2026-01-20 00:25:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(165, 12, 20, 'Place accosté par l\'Aveugle, qui, s\'étant traîné jusqu\'à Yonville dans l\'espoir d\'une vie future où il s\'enfermait; elle était si fort qu\'elle la.', '2026-01-25 19:23:36', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(166, 12, 1, 'Emma se retenait pour ne pas faire circuler ses billets; il en convenait. -- Mais ce lambin d\'Hivert qui n\'arrive pas! -- Et nous convenons.', '2026-01-23 17:31:39', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(167, 12, 1, 'Quand on était au mois de leçons, bien qu\'Emma interrompît Charles de temps à autre: -- Vous êtes bonne! vous comprenez que je compte sur vous, par.', '2026-01-21 22:44:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(168, 12, 20, 'Emma; Léon, derrière elle, s\'appuyant de l\'épaule contre la vitre. Il sortit. -- La bonne! Il ne faut jamais laisser en friche les facultés de la.', '2026-01-25 20:45:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(169, 12, 20, 'Charles, les mains de mes mains, j\'aurais mendié sur les lieux, pour s\'aboucher avec Langlois. Une fois il soupira: -- J\'aurais voulu le revoir.', '2026-01-24 03:37:41', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(170, 12, 20, 'Emma s\'abandonnait à cette procuration? IV Léon, bientôt, prit devant ses camarades un air chaud, mélange du parfum de la soutenir. Puis.', '2026-01-23 20:53:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(171, 12, 20, 'Bray, tandis que, du côté de la mare. Une jeune personne blonde se tenait à faire des questions; mais, la vanité s\'amuse, le maniement des chevaux.', '2026-01-24 19:54:02', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(172, 12, 20, 'Mais Charles, qui était restée là, et dont la bonne avait manqué, mais que Charles, en avant, se cambrait la taille. Un flot de liquides noirs.', '2026-01-23 14:13:44', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(173, 12, 1, 'J\'aurais dû m\'épargner cette dernière honte. Tu ne les as pas!... J\'aurais dû m\'épargner cette dernière honte. Tu ne seras jamais bon qu\'à être un.', '2026-01-19 21:44:25', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(174, 12, 20, 'Pourquoi, hein?... Je vous faisais donc bien peur? C\'est moi, ton Charles qui t\'aime! Me reconnais-tu? Tiens, voilà ta petite fille: embrasse-la.', '2026-01-25 13:37:59', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(175, 12, 20, 'Elle resta perdue de ses blessures, des crampes terribles à la fois d\'une main sur sa cheminée deux grands vases de verre bleu, cachetée avec de.', '2026-01-25 18:01:01', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(176, 12, 20, 'Saint-Pierre. Elle réussit d\'abord à éconduire Lheureux; enfin il perdit patience; on le relâcha. Il recommença, et Homais retira son bonnet de.', '2026-01-19 21:27:33', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(177, 12, 20, 'Il répondit médiocrement aux pointes, calembours, mots à double entente, compliments et gaillardises que l\'on n\'y devinait rien. Il la traita sans.', '2026-01-19 14:14:22', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(178, 12, 1, 'Elle viendrait habiter Yonville, elle caracola sur les pavés, le bruit du feu, sur un piédestal, à une démarche d\'où sa réputation et sa lumière.', '2026-01-23 10:00:59', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(179, 12, 1, 'C\'était une attention fine, son portrait en habit noir et se remettait à écrire, trempant sa plume pour rêver quelque temps. «Quant à moi, tel que.', '2026-01-24 01:47:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(180, 12, 1, 'Il la vit manger sa première tendresse, et tremblait un peu de plaques roses toutes ces choses qui réapparaissaient lui semblaient élargir son.', '2026-01-25 06:30:07', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(181, 12, 1, 'Rois, chez un marchand d\'estampes, une gravure italienne qui représente une Muse. Elle est bien plus jolie qu\'elle, plus fraîche surtout. Virginie.', '2026-01-24 03:38:04', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(182, 13, 21, 'C\'était un autre paysage. La folie la saisit: il la reverrait. Il imaginait qu\'elle était partie en fut exaspérée. Il s\'indigna plus fort de ces.', '2026-01-20 19:52:04', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(183, 13, 21, 'Et, d\'ailleurs, les embarras, la dépense... Ah! non, ici, pensa-t-elle, je serai guéri?... Ah! sauvez-moi!... Que je suis parti en voyage, ou il.', '2026-01-24 21:19:15', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(184, 13, 1, 'Rodolphe promit d\'en chercher une. Pendant tout l\'hiver, trois ou quatre fois de suite le même morceau, et toujours recommençait! Jamais il ne.', '2026-01-23 06:13:48', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(185, 13, 21, 'Emma la connaissait pas et l\'on revint de même, une fois sur cette étendue sans limites, dont la bretelle dure lui fatiguait l\'épaule; et, tantôt.', '2026-01-20 06:32:22', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(186, 13, 21, 'N\'aurait-on pas le sang, je pousserai tout grand l\'auvent de la côte. Elle restait debout, s\'appuyant de l\'épaule contre la cloison de son argent.', '2026-01-20 21:18:03', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(187, 13, 1, 'Allons, mon pauvre enfant, et quelqu\'un qui se nourrissent mieux que les deux coudes sur ses genoux, et, ainsi levant la figure vivante et la baisa.', '2026-01-21 01:33:08', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(188, 13, 21, 'Les quadrilles étaient commencés. Il arrivait parfois des péripéties à l\'infini, et le même mouvement, il sentit sa poitrine son petit clapotement.', '2026-01-25 05:00:55', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(189, 13, 1, 'Elle conclut les arrangements pour sa fête une belle marée, emportant avec lui que le bout d\'un mois, qu\'elle avait abandonné la musique et ne.', '2026-01-22 04:03:55', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(190, 13, 1, 'Charles ordonna par la place; ils parlaient à voix basse Bovary. -- Ni moi! reprit vivement M. Homais, à cette poussière des granges, la potasse des.', '2026-01-24 03:21:46', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(191, 13, 1, 'Mais elle reprit vivement, à voix basse et le valet d\'écurie prendrait les devants. Charles partirait trois heures plus tard, reprit-il en lui.', '2026-01-20 23:42:52', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(192, 13, 1, 'Du reste, c\'était aussi un vase plein de pensionnats, d\'églises et de ses extravagances, telle que l\'envie d\'avoir, pour l\'amener à Rouen, Charles.', '2026-01-23 14:13:24', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(193, 13, 1, 'Ainsi, moi, j\'ai dernièrement écrit un fort beau rapport, composé par une sorte d\'indélicatesse et de Lauzun. Il avait mené une vie bruyante de.', '2026-01-24 22:05:25', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(194, 13, 21, 'Mais sa femme en cire, dont les trois chantres qui psalmodiaient. Le serpent soufflait à pleine bouche, ou c\'étaient de petits baisers à pleine.', '2026-01-23 10:40:40', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(195, 13, 21, 'V La façade de briques se rapprochaient, la pénétraient; tout disparut. Elle reconnut les lumières des maisons, et l\'on sortit de l\'auberge. L\'hiver.', '2026-01-22 08:36:48', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(196, 13, 1, 'Ier septembre prochain, la somme immédiatement, et, quand elle fut prise d\'un crachement de sang, et, comme Charles eut beau dire qu\'il devait, un.', '2026-01-23 04:48:16', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(197, 13, 1, 'Homais disait, en tirant les cordons de son fils Napoléon entre ses doigts, roulant les yeux, faisait crier ses ciseaux, et Charles, avec ses deux.', '2026-01-25 23:15:10', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(198, 13, 21, 'Rodolphe réfléchit beaucoup à chercher un fiacre! L\'enfant partit comme une partie de plaisir, composaient maintenant la maison, il était brave.', '2026-01-23 09:24:55', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(199, 13, 1, 'Contre le mur, les yeux fixes. Quelle mésaventure! pensait-il, quel désappointement! Il avait vécu dans le feu. Il s\'enflamma plus vite afin.', '2026-01-20 00:50:22', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(200, 14, 22, 'Champagne débordait du verre léger sur les draps, avec ce balancement de la société, avec les grandes lignes du soleil, qui se répandait sur son.', '2026-01-23 15:01:32', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(201, 14, 22, 'La vue de sa femme fut le maître; il devait devant le feu, les deux chevaux de race et la polit avec un bruit de ses cheveux: ils s\'enroulaient en.', '2026-01-24 12:09:55', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(202, 14, 1, 'Et vous voilà sortie de bien à la tombée du jour, engourdie, à peine vêtue, et, de temps à autre, relevant la tête, en laissant retomber sur celle.', '2026-01-23 17:53:44', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(203, 14, 1, 'Et il manqua la visite, le lendemain jour de l\'an ou de la lettre avec des figures furieuses. Il y a toujours les sentiments. Mais à la crosse de.', '2026-01-25 05:25:50', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(204, 14, 22, 'Ah! c\'est peut-être à la mare. De temps à autre, au fond, à gauche. Quand elle s\'en allait au lion d\'or, déteint par les flambeaux qui brûlaient sur.', '2026-01-22 04:15:59', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(205, 14, 1, 'Mais sa robe du côté droit d\'une rue, il partit d\'un étage inférieur une sorte de sensualité qui lui maniaient la tête, regardant autour d\'elle.', '2026-01-22 00:16:40', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(206, 14, 22, 'Rouen, près M le procureur du roi, en son honneur; jamais il était désolé, et dans la poche de la pharmacie, les grosses boules de coton dans un.', '2026-01-25 16:09:40', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(207, 14, 22, 'Le jour tombait. Les petits Homais aussi venaient la voir; Justin les accompagnait, et il semblait désespéré: il avait pour lui plus enflammée, plus.', '2026-01-25 05:15:03', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(208, 14, 1, 'La chose difficile était le capitaine. Celui-ci rentrait à sa robe, hermine à l\'épaule et toque en tête. C\'était le lendemain même qu\'il y avait.', '2026-01-21 06:28:27', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(209, 14, 22, 'Le père Rouault repassa sa blouse avait des paroles tendres et des cathédrales de marbre blanc, dont les tables noires sont poissées par les.', '2026-01-22 10:20:48', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(210, 14, 22, 'Et moi, donc! Oh! j\'ai bien peur de rien! une gargote semblable! Et, avec des figures furieuses. Il y avait pour dîner plus à se remplir, on tirait.', '2026-01-23 14:31:38', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(211, 14, 22, 'Où courait cette foule comme les flots d\'une mer en furie, sous les branches. Les chiens au chenil aboyèrent tous, et l\'éclat de leurs désirs. À la.', '2026-01-19 20:21:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(212, 14, 22, 'La fatalité s\'en était toujours consenti, bien qu\'elle y absorbât son âme avec une figure convenable. Son zèle parut réussir; car bientôt le.', '2026-01-21 16:54:10', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(213, 14, 1, 'Le père Rouault les fit reconduire dans sa vie? Il se tut par convenance, à cause de sa jeunesse, en se penchant sur son assiette, entre les fleurs.', '2026-01-25 10:29:56', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(214, 14, 22, 'Qu\'il attende... oui, la semaine d\'après, la lui demanderait en mariage, il rumina d\'avance toute l\'affaire. Il le considérait pour son.', '2026-01-23 17:41:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(215, 14, 22, 'Elle lut: «Jean-Antoine d\'Andervilliers d\'Yverbonville, comte de Maulevrier, baron de la tonnelle et au soutien des États, fruit du respect des lois.', '2026-01-21 09:22:10', '2026-01-26 09:29:53', '2026-01-26 09:29:53');
INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `body`, `read_at`, `created_at`, `updated_at`) VALUES
(216, 14, 22, 'Elle lut: «Jean-Antoine d\'Andervilliers d\'Yverbonville, comte de Maulevrier, baron de Mauny, chambellan du roi, en son cabinet de Bovary sur les.', '2026-01-19 10:13:42', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(217, 14, 22, 'Appelle Polyte pour qu\'il prît au moins la chance d\'un événement. Une aventure amenait parfois des petits boutons, et elles frémissaient avec un.', '2026-01-19 20:15:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(218, 15, 23, 'M. de Maistre, et des bains de mer lui seraient utiles; elle se sentait au coeur que de ne pas avoir la charge d\'une enfant. Il se voyait déshonoré.', '2026-01-23 08:25:48', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(219, 15, 1, 'Le grand jour, arrivant par les vitraux tout unis, éclaire obliquement les bancs rangés en travers des torrents, des cabanes suspendues sur des bas.', '2026-01-23 09:43:21', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(220, 15, 23, 'Bovary; il cria: -- Pas encore; mais je les verrai l\'année prochaine, quand j\'irai vous voir. Ça m\'est tellement difficile de comprendre ce qu\'elle.', '2026-01-21 09:30:33', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(221, 15, 1, 'Le cidre doux en bouteilles au lieu de sacrer comme il vit la main haute et le jeune garçon qui s\'amusait à secouer le tourniquet dans son métier et.', '2026-01-25 05:46:29', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(222, 15, 23, 'Et l\'on aurait dû résulter de cet appartement était une manière de ces hommes d\'ardeurs taciturnes qui travaillent la nuit au bois Guillaume.', '2026-01-22 13:29:53', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(223, 15, 23, 'Nastasie descendit les marches en grelottant, et alla les porter dans un hébétement attentif, tinter un à un cabinet de Lheureux, sous la portière.', '2026-01-21 01:14:01', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(224, 15, 1, 'Allons chez Bridoux! c\'est à présent, c\'est l\'heure d\'y réfléchir. Ne désespère pas cependant; j\'ai connu là de pauvres mères de famille, quelles.', '2026-01-19 16:29:16', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(225, 15, 23, 'Il y courut. Le jour tombait. Les petits Homais, marmots toujours barbouillés, fort mal élevés et quelque peu les jours de sa figure. Lheureux.', '2026-01-23 04:14:41', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(226, 15, 23, 'Charles l\'écoutait, elle recommença quatre fois la semaine d\'après, la lui donnerai moi-même, se dit-elle; il viendra. Léon, le lendemain, fenêtre.', '2026-01-20 10:17:18', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(227, 15, 1, 'Eh bien!... je suis chrétien. -- Qu\'est-ce qu\'un chrétien? -- Pardonnez! dit Homais. Et, tout en écarquillant les yeux; M. Derozerays, de temps à.', '2026-01-21 06:44:52', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(228, 15, 23, 'C\'est le fils de la grande croix d\'argent se dressait l\'eau de Seltz... Homais leur donna des conseils; il embrassa sa fille une dernière pudeur, et.', '2026-01-22 23:24:27', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(229, 15, 23, 'Une demi-once d\'arcanson et de raffinements, un coeur de ces jours du mois de leçons, bien qu\'Emma n\'en eût jamais donné. Ensuite il avait une.', '2026-01-24 04:02:04', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(230, 15, 23, 'Ou bien empoisonner un malade! continuait l\'apothicaire. Tu voulais donc que Charles était plate comme un arc, souriait aussi, bégayait, cherchait.', '2026-01-23 10:51:56', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(231, 15, 23, 'On ignorait ce qu\'il appelait sa mission, il retourna chez Bovary. Il se rassit et elle se mit à rire ordinairement. -- Qu\'est-ce que cela l\'avait.', '2026-01-23 16:57:31', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(232, 15, 1, 'Une fois il soupira: -- Vous laisserez tout chez vous. Quant au souvenir de ce qui ne doit pas non plus; et, à chaque minute entendre arriver le.', '2026-01-21 13:05:56', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(233, 15, 1, 'La fracture était simple, sans complication d\'aucune espèce. Charles n\'eût osé en souhaiter de plus en plus les délicatesses. Ils se regardèrent; et.', '2026-01-22 01:04:54', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(234, 15, 23, 'Charles descendit dans la fente de la médecine; si bien qu\'on ne lui tenait compagnie, la regardait silencieusement. Comme il n\'y avait là des.', '2026-01-23 18:11:24', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(235, 15, 23, 'Un matin, qu\'elle s\'en revenait de chez la femme du médecin des cerises superbes. Or, les cerisiers poussaient mal à ses efforts. Sa mère en fut.', '2026-01-19 20:27:40', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(236, 15, 1, 'Ah! je te plains! dit Emma. -- Eh bien; nous nous aimerons! Tiens, je ris, je suis là; mais le bonheur imaginable. «Il me fait de ce bal. Toutes les.', '2026-01-25 23:09:58', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(237, 15, 23, 'Justin s\'était enfui à Rouen, dit le pharmacien, et s\'était cru en plein son visage des jeunes. Dans leurs regards indifférents flottait la quiétude.', '2026-01-23 08:00:50', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(238, 16, 24, 'Que vous seriez bon, monsieur, dit la vieille femme. Et l\'occasion était perdue, car elle se rappelait point la rancune qu\'elle lui avait paru si.', '2026-01-26 04:38:09', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(239, 16, 1, 'Quincampoix. À peine assise dans son appartement. Elle portait une lui-même; et, le soir, elle pressa Bovary d\'écrire à sa mère, lui conta tout.', '2026-01-20 19:51:14', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(240, 16, 24, 'C\'est ainsi, l\'un près de mourir, elle avait déteint sur sa prière, avait consenti à le voir. Il s\'enquérait de sa fille, qui ne se tint pas pour.', '2026-01-22 21:20:35', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(241, 16, 24, 'Le père Rouault n\'eût pas remarqué cette manoeuvre ou qu\'il n\'eut osé s\'y soumettre, la prière était finie que le souvenir des ombres plus.', '2026-01-24 12:31:09', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(242, 16, 1, 'Marjolaine, elle s\'éveillait, et écoutant le bruit de sabots dans la petite Berthe sur ses deux cuisses, en écartant avec soin la fourche du.', '2026-01-19 12:08:53', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(243, 16, 1, 'M. Léon, partis voir, à une demi-lieue d\'Yonville, dans la chapelle de la cour, où se détachent en écorchures blanches, sur un pivot. En passant.', '2026-01-22 19:31:27', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(244, 16, 24, 'Ensuite il lui semblait qu\'une abondance subite se serait porté sur sa prière, avait consenti à le laisser croire! Elle avait aux fenêtres des.', '2026-01-19 14:57:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(245, 16, 1, 'Quelquefois, dans un fauteuil de bureau. Les tomes du Dictionnaire des sciences médicales, non coupés, mais dont la bretelle dure lui fatiguait.', '2026-01-24 18:36:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(246, 16, 24, 'Eh! non, car vous n\'êtes guère à lui parler de son costume, dit à sa bouche rentrée. Il reconnut le maire lui en fallait, qu\'elle le considérait.', '2026-01-22 02:32:36', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(247, 16, 24, 'C\'était son mot. Homais sapait; il devenait sa maîtresse qui l\'attendait au bas de son mariage; et elle se permit des observations, et l\'on.', '2026-01-21 15:36:50', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(248, 16, 1, 'On lisait sur l\'un: «Au Commerce»; sur l\'autre: «À l\'Agriculture»; sur le comptoir. Ensuite vous avez du bien. Et il allait d\'un groupe à l\'autre.', '2026-01-24 06:39:57', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(249, 17, 25, 'Pompadour? Elle était si bon, si délicat, si généreux! Et, d\'ailleurs, quelle manie de bavarder au coin des rues, devant les carrés blancs qui.', '2026-01-21 16:26:13', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(250, 17, 25, 'Oh! je les tiens recta tous les projets de mensonges imaginables, et ayant bien peur que prochainement il ne l\'avait consultée ni sur la grande.', '2026-01-21 08:55:43', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(251, 17, 25, 'Clarence dans son jardin un gazon figurant l\'étoile de l\'honneur, avec deux ailes avançant et trois pains à cacheter; puis il se promenait seul dans.', '2026-01-21 03:17:11', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(252, 17, 25, 'Il racontait des histoires de catalepsie, les miracles du magnétisme; et il se levait et commandait qu\'on mît le couvert. M Homais arrivait pendant.', '2026-01-22 02:14:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(253, 17, 1, 'Y a-t-il longtemps, mon ami, répondit-elle. Je suis trop vieille... vous êtes libre. Elle hésita: -- Riche. -- Ne sommes-nous pas heureux? reprenait.', '2026-01-21 02:20:09', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(254, 17, 1, 'Cependant les quatre banquettes se garnissaient, la voiture s\'élancer, ce sera plus commode pour un autre; il ne l\'avait pas quittée, il était.', '2026-01-24 08:57:34', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(255, 17, 1, 'Cependant les quatre colonnes de la vie, s\'envoler dans une assiette, et même été porté pour la première fois qu\'elle couchait dans un torrent qui.', '2026-01-20 12:19:42', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(256, 17, 1, 'On se taisait autour de lui faire un tour de la Saint-Michel, Charles était plate comme un prince. Sa mère le nourrissait de confitures; son père.', '2026-01-25 18:07:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(257, 17, 25, 'Madame Bovary remarqua que plusieurs dames n\'avaient pas échangé quatre paroles, à part manoeuvrer leurs hommes. On voyait des gens qu\'elle ne.', '2026-01-24 11:22:04', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(258, 17, 25, 'Rouault arriva juste à temps égaux. Cela venait du fond, et s\'arrêta court devant la maison pour fêter son succès. Il partit à Neufchâtel, et Justin.', '2026-01-21 10:08:16', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(259, 17, 25, 'Charles baissa la tête en signe d\'alliance éternelle. Souvent elle le voyait continuellement sur la couleur grise de la main en l\'appelant son.', '2026-01-25 15:31:44', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(260, 17, 1, 'Charles n\'était point grave, et qu\'il ne finirait pas. Une femme qui s\'était chargé de la ferme, il y comptait, car il lui semblait entendre, à.', '2026-01-22 12:49:38', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(261, 17, 25, 'Emma; les auvents étaient fermés. Par les fentes du bois, le sucre et la femme du maire, qui causait sur le sable emportaient en s\'écoulant les.', '2026-01-22 03:27:12', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(262, 17, 1, 'Laissez-moi la note, dit Emma. -- Oh! c\'est bien son père, le cabinet et débiter toute leur longueur; et elles abaissèrent le long de l\'étroit.', '2026-01-23 06:41:49', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(263, 17, 25, 'Alors, elle se cassa les ongles noirs figuraient les clous d\'un fer, le stréphopode, dans des pavillons solitaires, postillons qu\'on tue à tous les.', '2026-01-22 22:26:30', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(264, 17, 25, 'Emma l\'interrompit pour se rattacher par derrière en un siècle ou une minute, elle s\'assit sur ses yeux, et relut encore. -- Comment!... Au secours!.', '2026-01-22 13:05:19', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(265, 17, 1, 'La vue seule de sa dévotion, Emma se mit à le baptiser avec un scalpel, comme si vingt fois déjà elle n\'avait songé à rien et même été porté pour la.', '2026-01-25 16:47:12', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(266, 17, 1, 'Mademoiselle Rouault s\'occupa de son pied. Cependant, elle sentait le suif, le cuir des selles craquait. Au moment où le vulgaire, d\'habitude, croit.', '2026-01-22 18:03:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(267, 18, 26, 'Il n\'est point possible, n\'est-ce pas, que tu sois homme toi-même et que Théodore, le domestique du notaire, portait un grand cercle de fer.', '2026-01-25 09:36:27', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(268, 18, 1, 'Lheureux même pouvait mourir. Elle s\'occupa, les premiers médecins d\'Yvetot ou même de la journée, Félicité ne bougeait pas de sa chaise, lui.', '2026-01-22 14:00:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(269, 18, 1, 'Il faisait chaud, l\'enfant s\'endormait; et le valet d\'écurie prendrait les devants. Charles partirait trois heures plus tard, au lever de la porte.', '2026-01-25 22:58:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(270, 18, 26, 'Elle se recueillit une minute, et, retrempant son courage au sentiment de la neige sur les rues, tête haute, sans peur, disait- elle, de se voir.', '2026-01-24 10:36:39', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(271, 18, 26, 'Lheureux savait tout, c\'était sûr! En effet, il prononça ces mots, singulièrement: -- Nous n\'avons pas même cette distraction, nous autres pauvres.', '2026-01-26 03:27:29', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(272, 18, 26, 'C\'est pourquoi, dit-il, j\'aime surtout les poètes. Je trouve les vers plus tendres que la voiture roulait, les pommiers à la bataille de Montlhéry.', '2026-01-24 00:42:16', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(273, 18, 1, 'Charles était sorti dès avant l\'aube, elle fut invitée à la compagnie pour aller prendre des notes. M. Bournisien dans le Fanal de Rouen, et elle.', '2026-01-19 22:34:20', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(274, 18, 1, 'J\'en étais sûre! Elle se rapprocha; son sein haletait; ils ne parlaient plus. -- Est-ce que c\'est vous qui palpitez sous leurs costumes. -- C\'est.', '2026-01-24 23:39:24', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(275, 18, 26, 'Si l\'on ne jurerait pas qu\'elle va se lever tout à plat ventre sur le bras sous une forme d\'ange, lyre aux cordes d\'airain, sonnant vers le ventre.', '2026-01-22 12:37:14', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(276, 18, 26, 'Ils se firent entendre à la fois votre charme et votre tourment, vous a perdue. Apprenez mon nom à votre disposition; serviteur très humble! Et il.', '2026-01-24 05:15:57', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(277, 18, 26, 'Madame Bovary prit le bras de son ami, il indiqua une méchante masure sise à Barneville, près d\'Aumale, qui ne foulait pas d\'un pied nerveux sous.', '2026-01-26 01:54:23', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(278, 18, 1, 'Mais, lorsqu\'elle lui demanda mille écus, s\'était écoulée en deux ans. Il n\'avait plus, comme autrefois, être encore confondue dans la dégustation.', '2026-01-23 07:56:34', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(279, 18, 26, 'Justin les accompagnait. Il montait avec eux dans la nouvelle femme de chambre. -- Modérez-vous! -- Oui, j\'y vais, répliqua l\'apothicaire étonné; ne.', '2026-01-19 14:46:41', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(280, 18, 1, 'La nuit, quand les quadrilles tourbillonnaient dans le cerveau, dans les herbages; elle avait dû passer, se disait-il, je me retrempe un peu, se.', '2026-01-22 12:13:07', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(281, 18, 1, 'Ah! vous trouvez? fit Rodolphe. Elle soupira. -- O Rodolphe! si tu savais! reprit-elle. Et elle reprenait: -- Sans moi, savez-vous bien, et n\'y.', '2026-01-21 23:53:56', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(282, 18, 26, 'C\'était la même, celle-là! Il fut longtemps avant de s\'en décharger sur quelqu\'un, sur vous, qu\'il vous encourage, qu\'il vous encourage, qu\'il vous.', '2026-01-21 16:17:43', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(283, 19, 27, 'Non, mais je n\'ai pu vous voir, ah! du moins ils écoutassent davantage les conseils du pharmacien, à tel point que l\'on marchait sur le dossier de.', '2026-01-21 22:36:50', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(284, 19, 1, 'Il y avait de plus, et Théodore, le domestique de M. un tel.» Plus loin, à l\'entrée de la pharmacie! Voilà, du reste, alla bien; la guérison.', '2026-01-23 14:28:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(285, 19, 27, 'Elle avait six ans de plus, six bâtons de sucre lorsque le pharmacien jugea convenable de faire les Rois, chez un voisin. Sa femme était morte.', '2026-01-24 10:16:40', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(286, 19, 27, 'Yonville) était venue se réfugier chez son fils, qui venait d\'entendre ces derniers mots, j\'ai moi-même à sa bouche. --Ah! mon Dieu! dit-elle; que.', '2026-01-24 01:11:46', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(287, 19, 1, 'Emma rougit quand il s\'aperçut pourtant de son bas blanc, qui se détachait en poudre au moyen d\'ingénieux appareils, en sort sous le siège épiscopal.', '2026-01-26 04:33:08', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(288, 19, 1, 'Homais, immobile, poussait de gros drap, qui accompagnaient ordinairement quelque casquette cerclée de cuivre en arabesque. C\'étaient des pantoufles.', '2026-01-21 12:18:44', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(289, 19, 1, 'O bel ange, ma Lucie! Alors Léon, pour faire de très lourd. À huit heures, ils s\'emballèrent dans l\'hirondelle. L\'apothicaire, que rien n\'arrête.', '2026-01-22 09:48:02', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(290, 19, 27, 'Domingo, le chien Fidèle, mais surtout l\'amitié douce de quelque chose: Cependant, comme Charles, à minuit, rentra, elle eut peur, et pour elle, n\'y.', '2026-01-24 10:03:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(291, 19, 27, 'Il passa un pantalon blanc, des chaussettes fines, un habit noir, puisque c\'est notre sort à tous, on ne saurait les diriger trop tôt dans la.', '2026-01-21 16:03:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(292, 19, 27, 'Il fut calme, sérieux, mélancolique. Emma l\'écoutait la tête dans les fermes, et la serviette nouée dans le cabinet noir où l\'on pénétrait du.', '2026-01-24 18:17:07', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(293, 19, 1, 'Ses pommettes étaient roses. Elle portait, comme un démon. Son regard, plus tranchant que ses parents trop occupés de leur maison, dans la chambre.', '2026-01-20 19:12:32', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(294, 19, 27, 'Non! non! fit-elle. -- Avançons! avançons! reprit-il. Il claqua de la vie, de pouvoir amortir ses anciennes camarades du couvent. Que.', '2026-01-21 22:25:30', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(295, 20, 28, 'Au moins, si je n\'ai pas eu l\'esprit, étant jeunes, de faire des excuses. Charles retourna donc vers la Saint-Pierre. Elle réussit d\'abord à.', '2026-01-21 18:14:51', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(296, 20, 28, 'Elle s\'esquiva brusquement, se débarrassa de son doigt, sur la couleur pâle de Barcelone, mais elle se traîna dans les pays tropicaux, engendrer des.', '2026-01-24 05:46:40', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(297, 20, 28, 'Pourtant, interrompit Charles qui t\'aime! Me reconnais-tu? Tiens, voilà ta petite fille: embrasse-la donc! L\'enfant avançait les bras croisés, en.', '2026-01-24 10:35:09', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(298, 20, 1, 'À la fin retenir cette phrase: «Comme ma pauvre femme aurait été heureuse!» Un jour qu\'errant sans but d\'abord, vagabondait au hasard, elle.', '2026-01-21 06:11:31', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(299, 20, 1, 'Elle souriait là- dessous à la clarté des bougies, la foule sans pouvoir néanmoins le nettement imaginer, tant il se résolut à déménager vers le.', '2026-01-21 05:47:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(300, 20, 1, 'Mais c\'était le moment de l\'examen, et les beaux- arts.» -- Je la donnerai au curé de plâtre lisait son bréviaire. Emma monta dans les églises sous.', '2026-01-26 09:17:38', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(301, 20, 1, 'Elle le regarda. Charles s\'en aperçut, et alors nous aurions ensemble de longues échéances et renouvelés continuellement, jusqu\'au jour où, tout.', '2026-01-26 00:58:46', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(302, 20, 1, 'Continuons donc! Et elle lui passait le licou, pendant que Charles fréquentait les Bertaux, madame Bovary ne descendit, pas dans la poche de son.', '2026-01-20 20:19:16', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(303, 20, 28, 'Charles ignorait tout, sa belle-mère la détestait, le père Rouault les fit reconduire dans sa maison, avec la vibration des derniers accords.', '2026-01-24 10:38:43', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(304, 20, 28, 'Il portait ce jour-là la première fois l\'inexprimable délicatesse des élégances féminines. Jamais il n\'avait guère d\'élégance dans les restaurants.', '2026-01-25 23:00:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(305, 20, 28, 'Il faut remettre le panier à elle-même, lui qui faisait à la religion d\'Emma, trouvait-il, pût, à force de s\'appliquer, il se recommandait par un.', '2026-01-24 03:59:03', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(306, 20, 28, 'Les petits carreaux de ses espoirs déçus, comme s\'il y avait des plaques de porcelaine arrondissait au plafond une clarté tremblante, et les idées.', '2026-01-22 19:39:38', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(307, 20, 28, 'Des massifs d\'ombre, çà et là, mais plus doucement, il la considérait avec étonnement la chambre semblait petite, tout exprès pour resserrer.', '2026-01-24 02:38:15', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(308, 20, 1, 'Une fois le verbe _ridiculus sum_. Puis, d\'une voix défaillante. Il bondit au sac d\'avoine, versa dans la rue. Il venait à l\'étreindre, elle tombait.', '2026-01-25 09:21:25', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(309, 20, 1, 'Elle déclarait adorer les enfants; c\'était sa consolation, sa joie, sa folie, et elle continuait à lui rendre ce service, elle saurait bien l\'y.', '2026-01-22 12:57:17', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(310, 20, 28, 'Eh bien? répondit-elle. Et il referma la porte de l\'auberge, il fallut d\'abord en faire l\'analyse. Car il allait à la Huchette. Rodolphe arrivait.', '2026-01-26 04:04:33', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(311, 20, 28, 'Il vous importune, vous persécute et prélève un véritable kaléidoscope, un vrai décor d\'Opéra, et un enterrement; ou bien qu\'il ne vînt pas; puis.', '2026-01-24 02:33:31', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(312, 20, 1, 'Homais, n\'en portait pas de pareils. -- Ah bah! dit-il, on y viendra. Nous avons du foin dans nos campagnes. C\'est ainsi qu\'il déboursa trois cents.', '2026-01-22 20:37:21', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(313, 21, 1, 'Elle haletait à se faire des excuses. Félicité portait maintenant les robes de Madame; non pas d\'accepter toutes les questions difficiles. Vivant.', '2026-01-20 14:49:55', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(314, 21, 29, 'Car elle redoutait qu\'on ne voudrait jamais croire! on allait se mettre en pension, cela coûterait beaucoup; comment faire? Alors il découvrait de.', '2026-01-26 03:25:18', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(315, 21, 1, 'Vassonville. Là, il embrassa sa fille une dernière fois qu\'elle s\'offrit, la peur de se retrouver chez soi! On entendait Nastasie qui pleurait. Il.', '2026-01-26 02:07:36', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(316, 21, 1, 'À jeudi!... à jeudi! Tout à l\'heure! je sors. Nous irons au spectacle, ne serait-ce que pour flibuster votre bourse ou vous entraîner en des.', '2026-01-25 22:43:11', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(317, 21, 29, 'Canivet s\'arrêta court, et Homais jetait un peu sur son corps, devant le monde encore serait endormi. Cette idée de spectacle germa vite dans la.', '2026-01-20 04:37:56', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(318, 21, 29, 'Ah! madame Bovary, l\'assurant qu\'il la fallait amputer, il s\'en revint tout droit chez lui. Il maigrit, sa taille dure était engainée dans des pays.', '2026-01-20 13:21:37', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(319, 21, 29, 'Voilà votre paletot, mon bon ami, qu\'en engageant Madame à étudier, vous économisez pour plus tard à la religion d\'Emma, trouvait-il, pût, à force.', '2026-01-26 01:31:39', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(320, 21, 29, 'Emma; aussi j\'étais toujours abonnée à un rang de boutons d\'une coupe militaire, il débitait des galanteries d\'estaminet à une mendiante. Charles.', '2026-01-20 00:26:09', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(321, 21, 1, 'Bovary ronflait plus fort, l\'ecclésiastique précipitait ses oraisons; elles se considérèrent silencieusement. Elles n\'avaient, la servante Artémise.', '2026-01-22 03:03:32', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(322, 21, 1, 'Et peu à peu se fixaient, et, assise sur le célibat des prêtres. -- Car, disait le Conseiller. Elle ne savait pas quel serait ce hasard, le vent de.', '2026-01-20 22:46:57', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(323, 21, 1, 'Souvent je sortais, je m\'en vais retourner chez Lheureux: à quoi bon? d\'écrire à son voisin. C\'était M. Homais par le feuillage éclairait la mousse.', '2026-01-19 12:05:56', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(324, 21, 1, 'Bovary. Il lut: -- «Malgré les préjugés qui recouvrent encore une fois, -- quand vous voudrez; nous ne sommes pas si bête. Mais trois jours après.', '2026-01-19 18:13:10', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(325, 21, 29, 'Elle était là, tout tranquillement, et sans souci de rien au monde! tu es beau! tu es pâle! comme tu me chiffonnes. On entendit sur les mains de.', '2026-01-21 23:07:50', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(326, 22, 1, 'Mais il ne put, un jour, descendre de l\'Hirondelle, la taille penchée, l\'oeil indécis, elle riait de ne plus rien d\'exorbitant. Ses expansions.', '2026-01-20 11:47:48', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(327, 22, 1, 'Charles avait les pieds humides: -- Approchez-vous donc du poêle... plus haut..., contre la boiserie. -- Monsieur vous attend, Madame; la soupe est.', '2026-01-24 20:03:17', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(328, 22, 1, 'Des vapeurs s\'allongeaient à l\'horizon, au premier venu? Quel entêtement tu as donc tous les parents des deux mains par le sentier le long du chemin.', '2026-01-22 09:38:13', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(329, 22, 1, 'Êtes-vous chrétien? -- Pardonnez! dit Homais. J\'admire le christianisme. Il a fait beaucoup de monde sur la misère des affections terrestres et.', '2026-01-20 12:33:14', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(330, 22, 30, 'Quand il devait venir, elle emplissait de roses flétries. D\'abord il s\'attendrit, puis il se trouvait ensuite aussi calme dans ce petit médecin, il.', '2026-01-21 17:57:30', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(331, 22, 30, 'Hivert appelait, -- criait, sacrait, puis il ferma la porte et dit: -- C\'est que je vous place l\'échéance du dernier rang. Elle eut dans ce tas de.', '2026-01-24 18:50:33', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(332, 22, 1, 'Pourquoi donc? demanda-t-elle. -- Si je t\'aime! Puis, s\'apercevant qu\'elle avait dit et à Lutzen, fait la sieste au bord de la Vierge, il étendit.', '2026-01-20 07:43:56', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(333, 22, 1, 'Lieuvain, et l\'on sortit de l\'auberge. L\'hiver fut froid. Les carreaux, chaque matin, étaient chargés de givre, et la pudeur et de la table, et.', '2026-01-25 03:50:49', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(334, 22, 30, 'Un rayon d\'avril chatoyait sur les dalles lavées de la nature, cela vous réveillerait un mort. -- Parle-nous! disait Charles, comment va-t-il vivre.', '2026-01-25 04:45:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(335, 22, 1, 'Homais, de préparer quelques paroles basses du pharmacien donnant des conseils pour la première fois cette chevelure entière qui descendait.', '2026-01-22 15:59:02', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(336, 22, 30, 'C\'était peut-être un peu la tête, il lui donnait à croire, tant il se trouvait ensuite aussi calme dans ce temps-là! comme elle ne vit plus si elle.', '2026-01-20 07:22:49', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(337, 22, 1, 'Elle l\'arrêta. -- Oh! personne! Et monsieur pleure. Il vous aurait fallu subir les intolérables consolations du pharmacien. Il n\'y pense même plus!.', '2026-01-25 06:08:08', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(338, 22, 1, 'Ils descendaient au bas de son établissement. Aussi, le soir, plus tôt que de n\'y pas continuellement réfléchir. L\'hiver fut rude. La convalescence.', '2026-01-24 17:48:44', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(339, 22, 30, 'Ah! ne m\'en mêle plus! Elle pleurait, elle l\'appela même «son bon monsieur Lheureux». Mais il faut bien, dit Emma, suivre un peu maintenant.', '2026-01-24 14:15:38', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(340, 22, 30, 'Celle-ci replaça dans la nuit, cinq ou six hommes, toujours les mêmes formes et le lendemain, des tasses de thé à la glace. -- Approche le vase!.', '2026-01-20 18:21:30', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(341, 22, 1, 'Est-ce l\'appréhension de l\'inconnu..., l\'effet des habitudes quittées..., ou plutôt...? Non, c\'est l\'excès du bonheur! Que je suis à toi!» Mais Emma.', '2026-01-21 13:16:49', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(342, 22, 30, 'C\'était l\'heure du catéchisme. Il préférait rester dehors, à prendre une bassine qui est restée sous la portière pour saisir au passage une dot de.', '2026-01-25 21:00:59', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(343, 22, 30, 'Les fenêtres du village, par le bas, s\'éraflait au pantalon; leurs jambes entraient l\'une dans l\'autre; il tendit la main, elle hésita. -- À gauche!.', '2026-01-21 11:02:47', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(344, 22, 30, 'Ce n\'est pas la peine, elle va descendre. Chauffez-vous au poêle en fonte, elle... Léon fuyait; car il n\'avait, lui, rien à vendre. Alors il.', '2026-01-24 09:09:36', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(345, 22, 1, 'Léon. -- Comment? -- Oh! je les revoyais comme autrefois, de ces lamentations mélodieuses qui se permettait d\'admirer seul la dépense, sa mère.', '2026-01-20 10:53:14', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(346, 23, 31, 'On entendait, dans la brume. Les arbres des boulevards, sans feuilles, des oiseaux se tenaient immobiles entre les branches du jasmin sans feuilles.', '2026-01-21 16:00:09', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(347, 23, 1, 'Tostes une fois, retourna chez Bovary. Il se rappelait les parties fines chez le marquis d\'Andervilliers. Secrétaire d\'État sous la poitrine comme à.', '2026-01-26 08:53:17', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(348, 23, 31, 'Charles fut surpris de ce moment, la voix claire des gamins arrivaient encore à proscrire un délassement intellectuel qui est vraiment tapé! Il.', '2026-01-22 22:50:18', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(349, 23, 31, 'Mais, quand la planche aux vaches, le sentier, l\'allée, les halles, il s\'arrêta, et, comme ils n\'avaient, en présence du mari, rien de vert n\'y.', '2026-01-22 07:05:01', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(350, 23, 1, 'Charles l\'avait voulu cependant, s\'il s\'en fût douté, si son regard, et alors on entendit un choc; les cordes grinçassent mieux, et puis il la.', '2026-01-23 23:52:10', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(351, 23, 1, 'Et quand on en reste aux mains. _Fabricando fil faber, age quod agis._ Il citait du latin, tant il est admirable tout à coup, on entendit un.', '2026-01-19 23:14:24', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(352, 23, 31, 'Le coude sur la cheminée faisait trembler les pages du livre et les troncs pareils des arbres plantés en ligne droite, tendu comme par des.', '2026-01-24 13:45:18', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(353, 23, 1, 'Souvent on entendait, tout à coup au bruit des pas; et, du moment qu\'on n\'est pas mal à la douceur de son ami, il indiqua une méchante masure sise à.', '2026-01-25 00:10:50', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(354, 23, 31, 'Protégée par l\'archevêché comme appartenant à cette séduction. Le pharmacien répondit: -- Chez madame Bovary, qui ne se moquait pas, quand un coup.', '2026-01-20 04:54:22', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(355, 23, 31, 'Elle restait seule dans la précipitation de ses doigts. -- Comme je resterais ce soir, demain, les autres collines, un cri et tomba roide par terre.', '2026-01-21 15:27:12', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(356, 23, 1, 'Ils repartirent; et, d\'un mouvement brusque: -- Oui, c\'est vrai, disait-elle, le suis folle; embrasse-moi! Elle était amoureuse de Léon, elle.', '2026-01-20 17:19:17', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(357, 23, 1, 'La fumée du bouilli, il montait du fond en cahotant. Quelques bourgeois d\'Yonville arrivèrent sur la serrure, tant elle se tourna sur ses doigts.', '2026-01-19 20:11:14', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(358, 23, 1, 'Elle en témoigna davantage à se demander pourquoi il venait montrer à Madame, sitôt qu\'il arriverait à la bataille de Coutras, le 20 octobre 1587.».', '2026-01-24 16:48:41', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(359, 23, 31, 'Rodolphe, de moins en moins la chaîne, et déjà madame Bovary guettait sa mort, et le pharmacien arriva. La servante parut; Emma comprit, et demanda.', '2026-01-25 18:02:45', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(360, 23, 31, 'Irma découpait des rondelles de papier blanc. Elle essaya de manger. Les morceaux l\'étouffaient. Alors elle laissa tomber ces deux mots. Ah! très.', '2026-01-23 00:47:39', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(361, 23, 31, 'Ça ne nuit jamais, répliqua-t-il. Elle fut lâche, elle le regarda comme on fait à Paris! Et cette parole, comme un homme, passé entre deux flambeaux.', '2026-01-24 01:49:49', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(362, 24, 32, 'Rodolphe, une fort belle cravache qui se délasse dans une atmosphère vermeille. La vie nombreuse qui s\'agitait en ce tumulte y était pâle; on se.', '2026-01-20 03:37:06', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(363, 24, 1, 'Mais lui, il n\'aperçut rien sur la grande croix d\'argent se dressait l\'eau de Seltz, dans les massifs, se tenaient, sur deux lignes parallèles, les.', '2026-01-21 10:02:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(364, 24, 1, 'Homais se présenta; il offrit ses hommages à Madame, sitôt qu\'il arriverait à la ferme, on causait de ce spectacle vous déchire! Charles une fois.', '2026-01-24 04:48:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(365, 24, 1, 'Seltz et de draps humides, qui s\'échappait de son âme, qu\'elle fit en s\'inclinant, sa robe (c\'était une robe de chambre à coucher, où l\'on montait.', '2026-01-22 21:31:57', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(366, 24, 1, 'C\'étaient des airs que l\'on fut obligé de vendre vingt-deux acres de son coeur, comme au retour d\'un voyage, et enfin, la surprise passée, il.', '2026-01-24 20:57:20', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(367, 24, 32, 'C\'était l\'heure du banquet. Le festin fut long, bruyant, mal servi; l\'on était si tassé, que l\'on a sur ce banc: tu seras comme les anciens. Mon.', '2026-01-22 12:49:55', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(368, 24, 32, 'Rouen des entrefilets ainsi conçus: «Toutes les personnes du sexe, qui sont contre la muraille un large coup d\'oeil sur les confins du pays de Caux.', '2026-01-22 08:14:57', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(369, 24, 32, 'Bertaux tout à coup la pluie tomber. Comme elle se montra froide et la pudeur aussi. Elle songeait quelquefois que c\'étaient là pourtant les plus.', '2026-01-23 09:14:29', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(370, 24, 1, 'Marie, pleine de grands coups au hasard, ce qui pouvait l\'aviver davantage; et les deux bouts; il leur restait, outre Barneville, six cents livres.', '2026-01-25 01:48:17', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(371, 24, 1, 'En effet, Bovary pouvait réussir; rien n\'affirmait à Emma continuellement, l\'oubliait; et il se jeta sur son assiette en débitant toutes sortes.', '2026-01-23 07:16:46', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(372, 24, 1, 'Rodolphe s\'arrêta; et, quand Léon eut remonté sa garde-robe, fait rembourrer ses trois demoiselles, qui sont plus délicates que les autres. Ce qu\'il.', '2026-01-26 04:57:15', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(373, 24, 32, 'La robe d\'Emma, trop longue, traînait un moment suspendue. Emma pensait qu\'il y a des profondeurs d\'expression comme le duc de Normandie. Ce sont là.', '2026-01-22 16:57:09', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(374, 24, 32, 'Pourquoi? -- Parce que je vous voie, que je vous chasse. Il y a sur ce qui est vraiment tapé! Il rembarre un fils de Boudet le charpentier; ses.', '2026-01-20 21:08:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(375, 24, 1, 'Et même il en fit part à sa femme, une attention fine, son portrait en habit bleu causait Italie avec une légende au bas, écrit en lettres d\'or. On.', '2026-01-25 02:09:30', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(376, 24, 32, 'Emma quitta sa chambre un tapis de la salle, tête hâlée, à favoris noirs, et qui pousse mal tout autre homme. C\'est lui plutôt que d\'abandonner ses.', '2026-01-23 03:15:52', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(377, 24, 1, 'Souvent les pensionnaires s\'échappaient de grands chapeaux de paille! On les regardait. Il croyait entendre l\'haleine légère de son bouquet de.', '2026-01-21 23:33:52', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(378, 24, 32, 'M. et madame Bovary levait les siens vers lui; une torpeur la prenait, elle poussait un cri. Il ne se souciait pas non plus du meilleur goût; et.', '2026-01-24 03:11:25', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(379, 24, 1, 'Ce fut un dimanche de février, le père Rouault qui s\'essayait à marcher devant lui les bras nus. Les chevelures, bien collées sur les bords, coulait.', '2026-01-21 20:16:36', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(380, 25, 1, 'Barcelone, mais elle demanda son miroir, et elle s\'endormit l\'âme remplie d\'un enchantement nouveau. Le lendemain, en revanche, il semblait.', '2026-01-25 15:56:22', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(381, 25, 1, 'Comment, monsieur Boulanger, vous nous abandonnez? Rodolphe protesta qu\'il allait tomber d\'un coup de marteau d\'Emma, Charles, qui sanglotait dans.', '2026-01-20 17:09:10', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(382, 25, 1, 'Aussi, lorsque j\'étudiais à Rouen voir son amant. Mais, en s\'apercevant dans la rue, bouclait ses éperons sur la dot. Or, comme il achevait ces.', '2026-01-25 15:12:18', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(383, 25, 1, 'Elle décousait la doublure de son ménage, retourner à la façon des culs de bouteilles. Sur le grand air la calmait: et peu à peu ce sentiment.', '2026-01-25 08:05:11', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(384, 25, 1, 'J\'y vais, balbutiait-il. Et c\'était le moment. Charles se déshabilla, et le coq qui se brûlait à la nuit tombante, comme on dit, une belle tête.', '2026-01-24 08:43:46', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(385, 25, 33, 'Il pouvait changer maintenant les robes de Madame; non pas nous, s\'écria l\'autre impatienté, qui recommandent la Bible! -- N\'importe! dit Homais, je.', '2026-01-24 02:18:30', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(386, 25, 33, 'En effet, des deux côtés sur le bras de sa bonne chevelure blonde, qu\'une délectation infinie l\'envahissait, plaisir tout mêlé d\'amertume comme ces.', '2026-01-23 06:33:51', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(387, 25, 33, 'Quincampoix! Un souci meilleur vint le distraire, Homais jugea convenable de pousser un gémissement, et le curé voulut partir; les dames couraient.', '2026-01-19 12:00:38', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(388, 25, 33, 'Hippolyte Tautain, garçon d\'écurie depuis vingt-cinq ans à l\'hôtel de Boulogne au bras de M. Léon. Elle eût alors tout donné pour un diplomate; il.', '2026-01-25 15:34:37', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(389, 25, 33, 'Quand ils furent obligés de s\'écarter l\'un de l\'autre, comme deux régions de physionomie douce. Elle lui fit la promesse de trouver son étui, son.', '2026-01-23 20:42:28', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(390, 25, 1, 'À droite était la cause de la famille du pharmacien, dont les cordes en grinçant remontèrent. Alors Bournisien prit la sienne, sans doute attribué.', '2026-01-21 22:45:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(391, 25, 1, 'Elles sont encloses de haies, au milieu de chacun d\'eux, la figure des plus aisés. Il s\'était fait construire, au bout de leurs doigts; Charles.', '2026-01-25 09:19:32', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(392, 25, 33, 'Il répondit d\'un signe de tête affirmatif quand la voiture s\'arrêta dans une fente de la grâce une large pelletée; et le salut de son bonnet. Il n\'a.', '2026-01-21 10:42:05', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(393, 25, 33, 'Il fallut l\'ouvrir. -- Ah! merci, dit Charles, qui avait pris ses mains une longue révérence. On chantait, on s\'agenouillait, on se levait par.', '2026-01-26 07:49:04', '2026-01-26 09:29:53', '2026-01-26 09:29:53'),
(394, 25, 33, 'Et qui donc? -- La bonne! Il ne répondit rien. Elle respirait d\'une façon monstrueuse, le voler en quelque sorte, et presque pleurant de soif, de.', '2026-01-22 16:57:51', '2026-01-26 09:29:53', '2026-01-26 09:29:53');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_businesses_table', 1),
(2, '0001_01_01_000001_create_users_table', 1),
(3, '0001_01_01_000002_create_cache_table', 1),
(4, '0001_01_01_000003_create_jobs_table', 1),
(5, '2026_01_12_093757_create_business_staff_table', 1),
(6, '2026_01_12_095931_create_services_table', 1),
(7, '2026_01_12_102216_create_business_clients_table', 1),
(8, '2026_01_12_102310_create_appointments_table', 1),
(9, '2026_01_12_102446_create_conversations_table', 1),
(10, '2026_01_12_102451_create_messages_table', 1),
(11, '2026_01_14_133118_create_absences_table', 1),
(12, '2026_01_21_130807_create_business_staff_service', 1),
(13, '2026_01_23_104436_create_business_schedules_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `business_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration_minutes` int UNSIGNED NOT NULL,
  `price_cents` int UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `business_id`, `name`, `description`, `duration_minutes`, `price_cents`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pédologue', 'Nulla dicta assumenda sed rerum aut. Tempora voluptatem odio nihil.', 60, 5564, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(2, 1, 'Scannériste', 'Ut quam doloremque iusto iure et. Eum atque et atque. Accusamus in rerum ipsum. Ut pariatur et et.', 60, 3208, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(3, 1, 'Cameraman', 'Expedita illo dolorum id dolorem ut. Est dolor ea omnis ipsa enim. Dolores eos aut sit qui id.', 60, 3471, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(4, 1, 'Magicien', 'Quia eos ullam minima eaque fugit. Ea atque est nisi itaque amet.', 60, 4820, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(5, 1, 'Choréologue', 'Voluptate sed error optio aut labore. Iure mollitia et sed illo itaque quam suscipit fuga.', 60, 2836, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(6, 1, 'Pédicure pour bovin', 'Consequatur qui voluptate quia est et aperiam. Animi maxime ipsa aut quibusdam.', 60, 4273, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(7, 1, 'Etancheur', 'Sapiente est dolore et vero. Maiores ut laboriosam aut iste iure. Rerum libero quos vel cumque.', 60, 3120, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(8, 1, 'Monteur en siège', 'Ea sunt ut doloremque. Est nihil est totam omnis ex.', 60, 4220, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(9, 1, 'Galeriste', 'Voluptate itaque ut beatae asperiores. Odit quo fuga odio. Voluptas et ut omnis et qui.', 60, 4077, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(10, 1, 'Pontonnier', 'Quia facere et at quia ut ratione corrupti nam. Et ut in voluptate corporis porro.', 60, 5760, 1, '2026-01-26 09:29:52', '2026-01-26 09:29:52');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('g8ccmdZgdkWQ58EZTa2G8HnKgTxbbq2MNbSncMp3', 1, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 OPR/125.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVmNaU2h2cGNidW1odDlQalNrTXdjRXd6NHc1a2FKbHlQMFpUT3V2MiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvY2xpZW50cyI7czo1OiJyb3V0ZSI7czoxMzoiY2xpZW50cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1769443163),
('HbrOUzLgzFipDFZreG9GFWdo1ojxbAtLqu4gltXx', 1, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 OPR/125.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUDV3SlhvQms3TEVOczdvMGtDVHEwbVhVbnA1MElUejNwSTBzWFQwMCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvY2xpZW50cyI7czo1OiJyb3V0ZSI7czoxMzoiY2xpZW50cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1769520500);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_e164` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type` enum('professional','personal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'personal',
  `current_business_id` bigint UNSIGNED DEFAULT NULL,
  `invited_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `last_name`, `first_name`, `email`, `phone_e164`, `account_type`, `current_business_id`, `invited_at`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Doe', 'John', 'john.doe@mail.com', NULL, 'professional', 1, NULL, '2026-01-26 09:29:51', '$2y$12$j.9QLm8hSrttsJgYMmJxiep0AKVtgcP4fN8XGcgAD4iEr4diyLRny', 'oS1KlQz08x4Z0GN0ZnRKCRdCtjWGGPtrx78ap2ZVaglH4jiGGp6lQDki4AUA', '2026-01-26 09:29:51', '2026-01-26 09:29:51'),
(2, 'Valentin', 'David', 'david.valentin@guillet.org', '+33214505503', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'Hs94KhfUhh', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(3, 'Menard', 'Laetitia', 'laetitia.menard@rodriguez.fr', '+33461496953', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'HK57WpYieI', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(4, 'Muller', 'Marine', 'marine.muller@pinto.net', '+33087449567', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'QhHuzfnEWa', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(5, 'Bodin', 'François', 'francois.bodin@pichon.fr', '+33499502258', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'c8oKYOxIMu', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(6, 'Normand', 'Véronique', 'veronique.normand@blanchet.com', '+33053702035', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'G3wzrKLyIf', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(7, 'Paul', 'Isabelle', 'isabelle.paul@courtois.com', '+33431868868', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'bOUEEEXxwY', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(8, 'Lacroix', 'Anouk', 'anouk.lacroix@alexandre.com', '+33959711433', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'Bmx2aQsOtu', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(9, 'Bailly', 'Zacharie', 'zacharie.bailly@gaudin.com', '+33646991847', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'wpByNclYFF', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(10, 'Bernier', 'Stéphane', 'stephane.bernier@rousset.net', '+33965882912', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'PGbkjV32u3', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(11, 'Gauthier', 'Adrienne', 'adrienne.gauthier@brun.fr', '+33515671067', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '2u5dEWkDlD', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(12, 'Marques', 'Laure', 'laure.marques@guyot.fr', '+33459216481', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'WmiiSN71Qj', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(13, 'Jourdan', 'Colette', 'colette.jourdan@blanc.net', '+33258494177', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '1KQpP7tleO', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(14, 'Coulon', 'Hélène', 'helene.coulon@lecomte.net', '+33329005319', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'vI90xHp0na', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(15, 'Mendes', 'Simone', 'simone.mendes@wagner.net', '+33952314881', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '44SS9X7IIY', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(16, 'Diaz', 'Eugène', 'eugene.diaz@collet.org', '+33082622627', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '6zeDx29hHC', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(17, 'Becker', 'Michelle', 'michelle.becker@vidal.org', '+33627071287', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'SbLdcdXHcH', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(18, 'Noel', 'Patrick', 'patrick.noel@giraud.org', '+33907791180', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'E3PJeaEWkR', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(19, 'Dumas', 'Daniel', 'daniel.dumas@lagarde.fr', '+33973000522', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'fLAYMzMZ9g', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(20, 'Marchand', 'Arthur', 'arthur.marchand@lamy.net', '+33409542658', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'XY6dKwiPpX', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(21, 'Joseph', 'Michelle', 'michelle.joseph@martel.net', '+33122872350', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'BAHDBKqdaL', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(22, 'Jacob', 'Théophile', 'theophile.jacob@poulain.net', '+33130998983', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'rei4Xz5znI', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(23, 'Ribeiro', 'Daniel', 'daniel.ribeiro@alves.fr', '+33549999771', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'hAZ8OSdWSR', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(24, 'Levy', 'Margot', 'margot.levy@henry.fr', '+33594264202', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'w4Sz92YZJq', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(25, 'Cohen', 'Émilie', 'emilie.cohen@mahe.fr', '+33237951782', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '2PKH5TM0Ri', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(26, 'Launay', 'Diane', 'diane.launay@marty.org', '+33660525409', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'pR5cF6wkYj', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(27, 'Tanguy', 'Yves', 'yves.tanguy@alexandre.fr', '+33031679416', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'k3tAF9LalS', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(28, 'Dupuy', 'Luce', 'luce.dupuy@thomas.fr', '+33763135188', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '1AxqdXBu62', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(29, 'Vallee', 'Émile', 'emile.vallee@vasseur.com', '+33191946235', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '6sa2Lj8CDl', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(30, 'Laporte', 'Alphonse', 'alphonse.laporte@evrard.fr', '+33746326150', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'hssZS47bWr', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(31, 'Marie', 'Aimé', 'aime.marie@marechal.fr', '+33689978873', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'iHlMkH1Iwy', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(32, 'Perrot', 'Jeannine', 'jeannine.perrot@morvan.com', '+33522958864', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'xH2RDARm8x', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(33, 'David', 'Patrick', 'patrick.david@dumas.com', '+33643385991', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '24lIhKMXVZ', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(34, 'Maurice', 'Stéphane', 'stephane.maurice@dumas.fr', '+33860089388', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'AjrdJZ5W7G', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(35, 'Baudry', 'Timothée', 'timothee.baudry@duhamel.org', '+33304743544', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'Dibznu1A0N', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(36, 'Carlier', 'Michelle', 'michelle.carlier@legall.com', '+33072818044', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'Ufcvk4WFI2', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(37, 'Samson', 'Margot', 'margot.samson@lacombe.fr', '+33757606947', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'bLfnOkiKR3', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(38, 'Jourdan', 'Maryse', 'maryse.jourdan@guyot.fr', '+33481404754', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'H8bINwS8Sf', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(39, 'Robin', 'Eugène', 'eugene.robin@costa.net', '+33214278058', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'qrxSPDsfF6', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(40, 'Traore', 'Jules', 'jules.traore@munoz.com', '+33314376380', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '5J0imgXPVp', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(41, 'Becker', 'Eugène', 'eugene.becker@guillou.com', '+33204999886', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', '0dmiidvPnr', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(42, 'Prevost', 'Théophile', 'theophile.prevost@renault.org', '+33781459056', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'VNjLGgsq5b', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(43, 'Roy', 'Sylvie', 'sylvie.roy@joly.fr', '+33342593266', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'HUArbh4a98', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(44, 'Delannoy', 'Emmanuelle', 'emmanuelle.delannoy@jean.com', '+33803823555', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'TCvgxDPH7D', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(45, 'Devaux', 'Margaux', 'margaux.devaux@gaudin.fr', '+33457788503', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'lHCgoQGG7p', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(46, 'Lefort', 'Édouard', 'edouard.lefort@diaz.fr', '+33956130191', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'fugbNVYRpe', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(47, 'Andre', 'Charles', 'charles.andre@dias.fr', '+33551342224', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'igdnLGN8Ej', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(48, 'Vasseur', 'Frédéric', 'frederic.vasseur@jacquot.net', '+33219100411', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'qzBuMW8lXD', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(49, 'Delannoy', 'Michelle', 'michelle.delannoy@coste.fr', '+33942384946', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'tNTPdRvGRk', '2026-01-26 09:29:52', '2026-01-26 09:29:52'),
(50, 'Goncalves', 'Anne', 'anne.goncalves@david.com', '+33380299659', 'personal', NULL, NULL, '2026-01-26 09:29:52', '$2y$12$oavfhLXBB3.F1mrsUtCQT.qq5g4ImRfMKrqWfTg1k6HxvL4q/dAA.', 'PRhrb0nanK', '2026-01-26 09:29:52', '2026-01-26 09:29:52');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absences_business_id_start_at_end_at_index` (`business_id`,`start_at`,`end_at`),
  ADD KEY `absences_user_id_start_at_end_at_index` (`user_id`,`start_at`,`end_at`);

--
-- Index pour la table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_client_user_id_foreign` (`client_user_id`),
  ADD KEY `appointments_staff_user_id_foreign` (`staff_user_id`),
  ADD KEY `appointments_service_id_foreign` (`service_id`),
  ADD KEY `appointments_business_id_starts_at_index` (`business_id`,`starts_at`);

--
-- Index pour la table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `business_clients`
--
ALTER TABLE `business_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `business_clients_business_id_user_id_unique` (`business_id`,`user_id`),
  ADD KEY `business_clients_user_id_foreign` (`user_id`);

--
-- Index pour la table `business_schedules`
--
ALTER TABLE `business_schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `business_schedules_business_id_day_of_week_unique` (`business_id`,`day_of_week`);

--
-- Index pour la table `business_staff`
--
ALTER TABLE `business_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `business_staff_business_id_user_id_unique` (`business_id`,`user_id`),
  ADD KEY `business_staff_user_id_foreign` (`user_id`);

--
-- Index pour la table `business_staff_service`
--
ALTER TABLE `business_staff_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `business_staff_service_business_staff_id_service_id_unique` (`business_staff_id`,`service_id`),
  ADD KEY `business_staff_service_service_id_foreign` (`service_id`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conversations_business_id_client_user_id_unique` (`business_id`,`client_user_id`),
  ADD KEY `conversations_client_user_id_foreign` (`client_user_id`),
  ADD KEY `conversations_appointment_id_foreign` (`appointment_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_conversation_id_foreign` (`conversation_id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_business_id_foreign` (`business_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_current_business_id_foreign` (`current_business_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `business_clients`
--
ALTER TABLE `business_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `business_schedules`
--
ALTER TABLE `business_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `business_staff`
--
ALTER TABLE `business_staff`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `business_staff_service`
--
ALTER TABLE `business_staff_service`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_client_user_id_foreign` FOREIGN KEY (`client_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `appointments_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `appointments_staff_user_id_foreign` FOREIGN KEY (`staff_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `business_clients`
--
ALTER TABLE `business_clients`
  ADD CONSTRAINT `business_clients_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `business_schedules`
--
ALTER TABLE `business_schedules`
  ADD CONSTRAINT `business_schedules_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `business_staff`
--
ALTER TABLE `business_staff`
  ADD CONSTRAINT `business_staff_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `business_staff_service`
--
ALTER TABLE `business_staff_service`
  ADD CONSTRAINT `business_staff_service_business_staff_id_foreign` FOREIGN KEY (`business_staff_id`) REFERENCES `business_staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_staff_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `conversations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_client_user_id_foreign` FOREIGN KEY (`client_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_current_business_id_foreign` FOREIGN KEY (`current_business_id`) REFERENCES `businesses` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
