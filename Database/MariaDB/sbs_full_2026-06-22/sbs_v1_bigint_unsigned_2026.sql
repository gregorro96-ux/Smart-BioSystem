-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Cze 22, 2026 at 07:09 PM
-- Wersja serwera: 10.11.11-MariaDB
-- Wersja PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sbs`
--
CREATE DATABASE IF NOT EXISTS `sbs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `sbs`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `additives`
--

DROP TABLE IF EXISTS `additives`;
CREATE TABLE IF NOT EXISTS `additives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_claims`
--

DROP TABLE IF EXISTS `ai_claims`;
CREATE TABLE IF NOT EXISTS `ai_claims` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `claim_type` varchar(100) NOT NULL,
  `source_type` varchar(100) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `claim_text` text NOT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `verification_status` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_correlations`
--

DROP TABLE IF EXISTS `ai_correlations`;
CREATE TABLE IF NOT EXISTS `ai_correlations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_1` varchar(100) NOT NULL,
  `parameter_2` varchar(100) NOT NULL,
  `correlation_value` decimal(6,3) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ai_correlations_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_decisions`
--

DROP TABLE IF EXISTS `ai_decisions`;
CREATE TABLE IF NOT EXISTS `ai_decisions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `decision_type` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `execution_status` varchar(50) DEFAULT NULL,
  `executed_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ai_decisions_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_experience`
--

DROP TABLE IF EXISTS `ai_experience`;
CREATE TABLE IF NOT EXISTS `ai_experience` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `experience_type` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `outcome` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ai_experience_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_insights`
--

DROP TABLE IF EXISTS `ai_insights`;
CREATE TABLE IF NOT EXISTS `ai_insights` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `insight_type` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ai_insights_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_knowledge_index`
--

DROP TABLE IF EXISTS `ai_knowledge_index`;
CREATE TABLE IF NOT EXISTS `ai_knowledge_index` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `knowledge_id` bigint(20) UNSIGNED NOT NULL,
  `index_type` varchar(100) NOT NULL,
  `keywords` text DEFAULT NULL,
  `embedding_hash` varchar(255) DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_models`
--

DROP TABLE IF EXISTS `ai_models`;
CREATE TABLE IF NOT EXISTS `ai_models` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `model_version` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ai_predictions`
--

DROP TABLE IF EXISTS `ai_predictions`;
CREATE TABLE IF NOT EXISTS `ai_predictions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `prediction_type` varchar(100) NOT NULL,
  `prediction_text` text NOT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `predicted_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ai_predictions_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `alerts`
--

DROP TABLE IF EXISTS `alerts`;
CREATE TABLE IF NOT EXISTS `alerts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sensor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `alert_type` varchar(50) NOT NULL,
  `severity` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text DEFAULT NULL,
  `acknowledged` tinyint(1) NOT NULL,
  `acknowledged_at` datetime DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_id` (`sensor_id`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `animal_activity`
--

DROP TABLE IF EXISTS `animal_activity`;
CREATE TABLE IF NOT EXISTS `animal_activity` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `livestock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_time` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_animal_activity_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `automations`
--

DROP TABLE IF EXISTS `automations`;
CREATE TABLE IF NOT EXISTS `automations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `trigger_type` varchar(50) NOT NULL,
  `trigger_value` varchar(100) DEFAULT NULL,
  `action_type` varchar(50) NOT NULL,
  `action_value` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_executed` datetime DEFAULT NULL,
  `execution_count` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autonomy_levels`
--

DROP TABLE IF EXISTS `autonomy_levels`;
CREATE TABLE IF NOT EXISTS `autonomy_levels` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `level_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `automation_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `ai_control_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `safety_override_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_autonomy_levels_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `backups`
--

DROP TABLE IF EXISTS `backups`;
CREATE TABLE IF NOT EXISTS `backups` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `backup_name` varchar(255) NOT NULL,
  `backup_type` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `backup_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `behavior_patterns`
--

DROP TABLE IF EXISTS `behavior_patterns`;
CREATE TABLE IF NOT EXISTS `behavior_patterns` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pattern_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_behavior_patterns_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `breeding_log`
--

DROP TABLE IF EXISTS `breeding_log`;
CREATE TABLE IF NOT EXISTS `breeding_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `breeding_type` varchar(50) NOT NULL,
  `species_name` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `spawning_date` datetime DEFAULT NULL,
  `hatch_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `eggs_count` int(11) DEFAULT NULL,
  `hatchlings_count` int(11) DEFAULT NULL,
  `survivors_count` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `succes_rate` decimal(5,2) DEFAULT NULL,
  `parents_info` text DEFAULT NULL,
  `observation` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_breeding_log_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `camera_snapshots`
--

DROP TABLE IF EXISTS `camera_snapshots`;
CREATE TABLE IF NOT EXISTS `camera_snapshots` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `captured_at` datetime DEFAULT NULL,
  `analysis_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_camera_snapshots_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `camera_timelapse`
--

DROP TABLE IF EXISTS `camera_timelapse`;
CREATE TABLE IF NOT EXISTS `camera_timelapse` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_camera_timelapse_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
CREATE TABLE IF NOT EXISTS `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `message_text` text NOT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `community_comments`
--

DROP TABLE IF EXISTS `community_comments`;
CREATE TABLE IF NOT EXISTS `community_comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `community_posts`
--

DROP TABLE IF EXISTS `community_posts`;
CREATE TABLE IF NOT EXISTS `community_posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `visibility` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `detected_events`
--

DROP TABLE IF EXISTS `detected_events`;
CREATE TABLE IF NOT EXISTS `detected_events` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_time` datetime DEFAULT NULL,
  `source_type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_detected_events_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `devices`
--

DROP TABLE IF EXISTS `devices`;
CREATE TABLE IF NOT EXISTS `devices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `device_uid` varchar(50) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `devce_type` varchar(50) NOT NULL,
  `device_model` varchar(100) NOT NULL,
  `firmware_version` varchar(20) NOT NULL,
  `ip_adress` varchar(45) DEFAULT NULL,
  `mac_adress` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `capabilities` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`ecosystem_id`),
  KEY `fk_devices_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `devices_states`
--

DROP TABLE IF EXISTS `devices_states`;
CREATE TABLE IF NOT EXISTS `devices_states` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `state_key` varchar(50) NOT NULL,
  `state_value` varchar(100) DEFAULT NULL,
  `state_type` varchar(20) NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `changed_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `device_commands`
--

DROP TABLE IF EXISTS `device_commands`;
CREATE TABLE IF NOT EXISTS `device_commands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `command_name` varchar(255) NOT NULL,
  `command_payload` text DEFAULT NULL,
  `execution_status` varchar(50) DEFAULT NULL,
  `executed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `disease_log`
--

DROP TABLE IF EXISTS `disease_log`;
CREATE TABLE IF NOT EXISTS `disease_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `disease_name` varchar(255) NOT NULL,
  `symptoms` text DEFAULT NULL,
  `treatment` int(11) DEFAULT NULL,
  `medication` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime DEFAULT NULL,
  `notes` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `livestock_id` (`livestock_id`),
  KEY `fk_disease_log_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dosing_log`
--

DROP TABLE IF EXISTS `dosing_log`;
CREATE TABLE IF NOT EXISTS `dosing_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `additive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dosing_date` datetime NOT NULL,
  `dose_amount` decimal(10,2) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_dosing_log_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystems`
--

DROP TABLE IF EXISTS `ecosystems`;
CREATE TABLE IF NOT EXISTS `ecosystems` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `ecosystem_type` varchar(50) NOT NULL,
  `volume_liters` int(11) DEFAULT NULL,
  `width_cm` int(11) DEFAULT NULL,
  `depth_cm` int(11) DEFAULT NULL,
  `height_cm` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `location` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `startup_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ecosystems_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_clusters`
--

DROP TABLE IF EXISTS `ecosystem_clusters`;
CREATE TABLE IF NOT EXISTS `ecosystem_clusters` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `ecosystem_count` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_comparisons`
--

DROP TABLE IF EXISTS `ecosystem_comparisons`;
CREATE TABLE IF NOT EXISTS `ecosystem_comparisons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_1_id` bigint(20) UNSIGNED NOT NULL,
  `ecosystem_2_id` bigint(20) UNSIGNED NOT NULL,
  `comparison_type` varchar(100) DEFAULT NULL,
  `comparison_result` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_diary`
--

DROP TABLE IF EXISTS `ecosystem_diary`;
CREATE TABLE IF NOT EXISTS `ecosystem_diary` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `entry` text DEFAULT NULL,
  `mood` varchar(50) DEFAULT NULL,
  `created_ad` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ecosystem_diary_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_difficulty`
--

DROP TABLE IF EXISTS `ecosystem_difficulty`;
CREATE TABLE IF NOT EXISTS `ecosystem_difficulty` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_type` varchar(100) NOT NULL,
  `difficulty_score` decimal(5,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_events`
--

DROP TABLE IF EXISTS `ecosystem_events`;
CREATE TABLE IF NOT EXISTS `ecosystem_events` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ecosystem_events_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_gallery`
--

DROP TABLE IF EXISTS `ecosystem_gallery`;
CREATE TABLE IF NOT EXISTS `ecosystem_gallery` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `media_count` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ecosystem_gallery_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_health`
--

DROP TABLE IF EXISTS `ecosystem_health`;
CREATE TABLE IF NOT EXISTS `ecosystem_health` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `health_score` decimal(5,2) DEFAULT NULL,
  `stress_level` decimal(5,2) DEFAULT NULL,
  `stability_score` decimal(5,2) DEFAULT NULL,
  `biodiversity_score` decimal(5,2) DEFAULT NULL,
  `recommendations` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_inspirations`
--

DROP TABLE IF EXISTS `ecosystem_inspirations`;
CREATE TABLE IF NOT EXISTS `ecosystem_inspirations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_recommendations`
--

DROP TABLE IF EXISTS `ecosystem_recommendations`;
CREATE TABLE IF NOT EXISTS `ecosystem_recommendations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recommendation_type` varchar(100) DEFAULT NULL,
  `recommendation_text` text DEFAULT NULL,
  `priority_level` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ecosystem_recommendations_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_requirements`
--

DROP TABLE IF EXISTS `ecosystem_requirements`;
CREATE TABLE IF NOT EXISTS `ecosystem_requirements` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_type` varchar(100) NOT NULL,
  `temperature_min` decimal(5,2) DEFAULT NULL,
  `temperature_max` decimal(5,2) DEFAULT NULL,
  `ph_min` decimal(5,2) DEFAULT NULL,
  `ph_max` decimal(5,2) DEFAULT NULL,
  `hardness_min` decimal(5,2) DEFAULT NULL,
  `hardness_max` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_scores`
--

DROP TABLE IF EXISTS `ecosystem_scores`;
CREATE TABLE IF NOT EXISTS `ecosystem_scores` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `overall_score` decimal(5,2) DEFAULT NULL,
  `health_score` decimal(5,2) DEFAULT NULL,
  `biodiversity_score` decimal(5,2) DEFAULT NULL,
  `stability_score` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_templates`
--

DROP TABLE IF EXISTS `ecosystem_templates`;
CREATE TABLE IF NOT EXISTS `ecosystem_templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) NOT NULL,
  `ecosystem_type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `difficulty_level` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ecosystem_zones`
--

DROP TABLE IF EXISTS `ecosystem_zones`;
CREATE TABLE IF NOT EXISTS `ecosystem_zones` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(100) NOT NULL,
  `zone_type` varchar(50) NOT NULL,
  `volume_liters` int(11) NOT NULL,
  `width_cm` int(11) NOT NULL,
  `depth_cm` int(11) NOT NULL,
  `height_cm` int(11) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ecosystem_zones_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_type` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `severity` varchar(20) NOT NULL,
  `event_time` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failure_patterns`
--

DROP TABLE IF EXISTS `failure_patterns`;
CREATE TABLE IF NOT EXISTS `failure_patterns` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pattern_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `feeding_log`
--

DROP TABLE IF EXISTS `feeding_log`;
CREATE TABLE IF NOT EXISTS `feeding_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `food_name` varchar(255) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `fed_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecosystem_id` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fertilizers`
--

DROP TABLE IF EXISTS `fertilizers`;
CREATE TABLE IF NOT EXISTS `fertilizers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `composition` text DEFAULT NULL,
  `dosage` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filtration_systems`
--

DROP TABLE IF EXISTS `filtration_systems`;
CREATE TABLE IF NOT EXISTS `filtration_systems` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `filter_type` varchar(100) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `flow_rate` decimal(10,2) DEFAULT NULL,
  `media_volume` decimal(10,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `firmware_updates`
--

DROP TABLE IF EXISTS `firmware_updates`;
CREATE TABLE IF NOT EXISTS `firmware_updates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `firmware_version` varchar(100) NOT NULL,
  `update_status` varchar(50) DEFAULT NULL,
  `installed_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `growth_log`
--

DROP TABLE IF EXISTS `growth_log`;
CREATE TABLE IF NOT EXISTS `growth_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `measurement_date` datetime NOT NULL,
  `size_value` decimal(8,2) DEFAULT NULL,
  `weight_value` decimal(8,2) DEFAULT NULL,
  `growth_stage` varchar(100) DEFAULT NULL,
  `observations` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image_analysis`
--

DROP TABLE IF EXISTS `image_analysis`;
CREATE TABLE IF NOT EXISTS `image_analysis` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `photo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `analysis_type` varchar(100) DEFAULT NULL,
  `result_text` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_image_analysis_photo` (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `knowledge_categories`
--

DROP TABLE IF EXISTS `knowledge_categories`;
CREATE TABLE IF NOT EXISTS `knowledge_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `parent_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_knowledge_categories_parent` (`parent_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `knowledge_claims`
--

DROP TABLE IF EXISTS `knowledge_claims`;
CREATE TABLE IF NOT EXISTS `knowledge_claims` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `knowledge_id` bigint(20) UNSIGNED DEFAULT NULL,
  `claim_text` text NOT NULL,
  `claim_type` varchar(100) DEFAULT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `verification_status` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_knowledge_claims_knowledge` (`knowledge_id`),
  KEY `fk_knowledge_claims_source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `knowledge_conflicts`
--

DROP TABLE IF EXISTS `knowledge_conflicts`;
CREATE TABLE IF NOT EXISTS `knowledge_conflicts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `claim_1_id` bigint(20) UNSIGNED NOT NULL,
  `claim_2_id` bigint(20) UNSIGNED NOT NULL,
  `conflict_type` varchar(100) DEFAULT NULL,
  `resolution_status` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `knowledge_library`
--

DROP TABLE IF EXISTS `knowledge_library`;
CREATE TABLE IF NOT EXISTS `knowledge_library` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `scientific_name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_knowledge_library_category` (`category_id`),
  KEY `fk_knowledge_library_source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `knowledge_notes`
--

DROP TABLE IF EXISTS `knowledge_notes`;
CREATE TABLE IF NOT EXISTS `knowledge_notes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `note_text` text NOT NULL,
  `importance_level` varchar(50) DEFAULT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_knowledge_notes_source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `knowledge_sources`
--

DROP TABLE IF EXISTS `knowledge_sources`;
CREATE TABLE IF NOT EXISTS `knowledge_sources` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_type` varchar(100) NOT NULL,
  `source_name` varchar(255) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `knowledge_statistics`
--

DROP TABLE IF EXISTS `knowledge_statistics`;
CREATE TABLE IF NOT EXISTS `knowledge_statistics` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_entries` int(11) DEFAULT NULL,
  `verified_entries` int(11) DEFAULT NULL,
  `conflicting_entries` int(11) DEFAULT NULL,
  `average_confidence` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_knowledge_statistics_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `livestock`
--

DROP TABLE IF EXISTS `livestock`;
CREATE TABLE IF NOT EXISTS `livestock` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `species_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `sex` enum('male','female','unknown') DEFAULT 'unknown',
  `birth_date` date DEFAULT NULL,
  `acquisition_date` date DEFAULT NULL,
  `status` enum('active','quarantine','deceased') DEFAULT 'active',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_livestock_species` (`species_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `livestock_events`
--

DROP TABLE IF EXISTS `livestock_events`;
CREATE TABLE IF NOT EXISTS `livestock_events` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_livestock_events_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sensor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `log_level` varchar(20) NOT NULL,
  `source` varchar(50) NOT NULL,
  `messege` text NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `sensor_id` (`sensor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `uploaded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `media_type` enum('photo','video','audio','document','other') NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(500) NOT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `capture_date` datetime DEFAULT NULL,
  `visibility` enum('private','shared','public') DEFAULT 'private',
  `status` enum('active','archived','deleted') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `media_relations`
--

DROP TABLE IF EXISTS `media_relations`;
CREATE TABLE IF NOT EXISTS `media_relations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_media_id` bigint(20) UNSIGNED NOT NULL,
  `target_media_id` bigint(20) UNSIGNED NOT NULL,
  `relation_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_media_relations_source` (`source_media_id`),
  KEY `fk_media_relations_target` (`target_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `media_tags`
--

DROP TABLE IF EXISTS `media_tags`;
CREATE TABLE IF NOT EXISTS `media_tags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_type` varchar(50) NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_media_tags_photo` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) UNSIGNED DEFAULT NULL,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sensor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `recipient` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `retries` int(11) NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `sensor_id` (`sensor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `photos`
--

DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `taken_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_photos_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `species_id` bigint(20) UNSIGNED DEFAULT NULL,
  `common_name` varchar(100) DEFAULT NULL,
  `scientific_name` varchar(150) DEFAULT NULL,
  `planted_date` date DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plants_ecosystem` (`ecosystem_id`),
  KEY `fk_plants_species` (`species_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plant_events`
--

DROP TABLE IF EXISTS `plant_events`;
CREATE TABLE IF NOT EXISTS `plant_events` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `plant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_plant_events_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plant_growth_analysis`
--

DROP TABLE IF EXISTS `plant_growth_analysis`;
CREATE TABLE IF NOT EXISTS `plant_growth_analysis` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `growth_stage` varchar(100) DEFAULT NULL,
  `analysis_result` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `power_events`
--

DROP TABLE IF EXISTS `power_events`;
CREATE TABLE IF NOT EXISTS `power_events` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_type` varchar(50) NOT NULL,
  `event_time` datetime NOT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `quarantine_log`
--

DROP TABLE IF EXISTS `quarantine_log`;
CREATE TABLE IF NOT EXISTS `quarantine_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `quarantine_type` varchar(50) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `symptoms` text DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `medications` text DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `livestock_id` (`livestock_id`),
  KEY `fk_quarantine_log_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `restore_history`
--

DROP TABLE IF EXISTS `restore_history`;
CREATE TABLE IF NOT EXISTS `restore_history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `backup_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restore_date` datetime DEFAULT NULL,
  `restore_status` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `schedules`
--

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `schedule_type` varchar(50) NOT NULL,
  `cron_expression` varchar(100) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  `next_run` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sensors`
--

DROP TABLE IF EXISTS `sensors`;
CREATE TABLE IF NOT EXISTS `sensors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sensor_uid` varchar(64) NOT NULL,
  `sensor_name` varchar(100) NOT NULL,
  `sensor_type` varchar(50) NOT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `installed_at` datetime NOT NULL,
  `last_calibration` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sensor_readings`
--

DROP TABLE IF EXISTS `sensor_readings`;
CREATE TABLE IF NOT EXISTS `sensor_readings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sensor_id` bigint(20) UNSIGNED NOT NULL,
  `value` decimal(10,3) NOT NULL,
  `raw_value` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `measured_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  KEY `sensor_id` (`sensor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `settings_history`
--

DROP TABLE IF EXISTS `settings_history`;
CREATE TABLE IF NOT EXISTS `settings_history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `changed_by` varchar(255) DEFAULT NULL,
  `change_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_settings_history_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shared_experiences`
--

DROP TABLE IF EXISTS `shared_experiences`;
CREATE TABLE IF NOT EXISTS `shared_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `experience_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `similar_ecosystems`
--

DROP TABLE IF EXISTS `similar_ecosystems`;
CREATE TABLE IF NOT EXISTS `similar_ecosystems` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `similar_ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `similarity_score` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `simulations`
--

DROP TABLE IF EXISTS `simulations`;
CREATE TABLE IF NOT EXISTS `simulations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `simulation_type` varchar(100) NOT NULL,
  `parameters` text DEFAULT NULL,
  `result_summary` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_simulations_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `species`
--

DROP TABLE IF EXISTS `species`;
CREATE TABLE IF NOT EXISTS `species` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_type` enum('aquarium','terrarium','paludarium','vivarium','garden','pond','other') NOT NULL,
  `kingdom` enum('animal','plant','fungi','bacteria','protist','other') NOT NULL,
  `species_type` enum('fish','shrimp','snail','coral','plant','reptile','amphibian','insect','bird','mammal','other') DEFAULT 'other',
  `common_name` varchar(150) DEFAULT NULL,
  `scientific_name` varchar(200) NOT NULL,
  `family_name` varchar(150) DEFAULT NULL,
  `genus_name` varchar(150) DEFAULT NULL,
  `origin_region` varchar(255) DEFAULT NULL,
  `min_temperature` decimal(5,2) DEFAULT NULL,
  `max_temperature` decimal(5,2) DEFAULT NULL,
  `min_ph` decimal(4,2) DEFAULT NULL,
  `max_ph` decimal(4,2) DEFAULT NULL,
  `min_gh` decimal(5,2) DEFAULT NULL,
  `max_gh` decimal(5,2) DEFAULT NULL,
  `min_kh` decimal(5,2) DEFAULT NULL,
  `max_kh` decimal(5,2) DEFAULT NULL,
  `min_salinity` decimal(6,3) DEFAULT NULL,
  `max_salinity` decimal(6,3) DEFAULT NULL,
  `diet` varchar(255) DEFAULT NULL,
  `max_size_cm` decimal(6,2) DEFAULT NULL,
  `lifespan_years` int(11) DEFAULT NULL,
  `difficulty` enum('easy','medium','hard','expert') DEFAULT 'medium',
  `description` text DEFAULT NULL,
  `status` enum('active','archived') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_species_scientific_name` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `species_behaviors`
--

DROP TABLE IF EXISTS `species_behaviors`;
CREATE TABLE IF NOT EXISTS `species_behaviors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `species_id` bigint(20) UNSIGNED NOT NULL,
  `behavior_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_species_behaviors_species` (`species_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `species_compatibility`
--

DROP TABLE IF EXISTS `species_compatibility`;
CREATE TABLE IF NOT EXISTS `species_compatibility` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `species_id` bigint(20) UNSIGNED NOT NULL,
  `compatible_species_id` bigint(20) UNSIGNED NOT NULL,
  `compatibility_level` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_species_compatibility_species` (`species_id`),
  KEY `fk_species_compatibility_compatible` (`compatible_species_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `species_database`
--

DROP TABLE IF EXISTS `species_database`;
CREATE TABLE IF NOT EXISTS `species_database` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) NOT NULL,
  `common_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `care_requirements` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `species_relationships`
--

DROP TABLE IF EXISTS `species_relationships`;
CREATE TABLE IF NOT EXISTS `species_relationships` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `species_id` bigint(20) UNSIGNED NOT NULL,
  `related_species_id` bigint(20) UNSIGNED NOT NULL,
  `relationship_type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_species_relationships_species` (`species_id`),
  KEY `fk_species_relationships_related` (`related_species_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `substrates`
--

DROP TABLE IF EXISTS `substrates`;
CREATE TABLE IF NOT EXISTS `substrates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `success_patterns`
--

DROP TABLE IF EXISTS `success_patterns`;
CREATE TABLE IF NOT EXISTS `success_patterns` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pattern_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`username`),
  UNIQUE KEY `UNIQUE_2` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_achievements`
--

DROP TABLE IF EXISTS `user_achievements`;
CREATE TABLE IF NOT EXISTS `user_achievements` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `achievement_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `achievement_points` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `unlocked_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_badges`
--

DROP TABLE IF EXISTS `user_badges`;
CREATE TABLE IF NOT EXISTS `user_badges` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `badge_name` varchar(255) NOT NULL,
  `badge_level` varchar(50) DEFAULT NULL,
  `awarded_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE IF NOT EXISTS `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `avatar_url` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `profile_visibility` varchar(50) DEFAULT NULL,
  `first_ecosystem_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_skill_history`
--

DROP TABLE IF EXISTS `user_skill_history`;
CREATE TABLE IF NOT EXISTS `user_skill_history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `skill_level` varchar(50) NOT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `assigned_by` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_statistics`
--

DROP TABLE IF EXISTS `user_statistics`;
CREATE TABLE IF NOT EXISTS `user_statistics` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ecosystems_count` int(11) DEFAULT NULL,
  `livestock_count` int(11) DEFAULT NULL,
  `plants_count` int(11) DEFAULT NULL,
  `successful_breedings` int(11) DEFAULT NULL,
  `years_of_experience` decimal(5,2) DEFAULT NULL,
  `experience_points` bigint(20) UNSIGNED DEFAULT NULL,
  `reputation_score` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` text DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `recorded_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `video_analysis`
--

DROP TABLE IF EXISTS `video_analysis`;
CREATE TABLE IF NOT EXISTS `video_analysis` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_id` bigint(20) UNSIGNED DEFAULT NULL,
  `analysis_type` varchar(100) DEFAULT NULL,
  `result_text` text DEFAULT NULL,
  `confidence` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `water_changes`
--

DROP TABLE IF EXISTS `water_changes`;
CREATE TABLE IF NOT EXISTS `water_changes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ecosystem_id` bigint(20) UNSIGNED NOT NULL,
  `volume_changed` decimal(6,2) NOT NULL,
  `percentage_changed` decimal(5,2) DEFAULT NULL,
  `water_type` varchar(100) DEFAULT NULL,
  `temperature` decimal(4,1) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `changed_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_water_changes_ecosystem` (`ecosystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
