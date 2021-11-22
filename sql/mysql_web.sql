/*
 Navicat Premium Data Transfer

 Source Server         : mysql-localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 127.0.0.1:3306
 Source Schema         : hh_jiacrontab

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 22/11/2021 11:47:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_german2_ci,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `event_desc` longtext COLLATE utf8mb4_german2_ci,
  `target_name` longtext COLLATE utf8mb4_german2_ci,
  `source_username` longtext COLLATE utf8mb4_german2_ci,
  `source_name` varchar(500) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_german2_ci,
  PRIMARY KEY (`id`),
  KEY `idx_events_deleted_at` (`deleted_at`),
  KEY `idx_events_group_id` (`group_id`),
  KEY `idx_events_user_id` (`user_id`),
  KEY `idx_events_source_name` (`source_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_german2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_groups_name` (`name`),
  KEY `idx_groups_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for job_histories
-- ----------------------------
DROP TABLE IF EXISTS `job_histories`;
CREATE TABLE `job_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `job_type` tinyint(3) unsigned DEFAULT NULL,
  `job_id` bigint(20) unsigned DEFAULT NULL,
  `job_name` longtext COLLATE utf8mb4_german2_ci,
  `addr` varchar(191) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `exit_msg` longtext COLLATE utf8mb4_german2_ci,
  `start_time` datetime(3) DEFAULT NULL,
  `end_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job_histories_deleted_at` (`deleted_at`),
  KEY `idx_job_histories_addr` (`addr`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for nodes
-- ----------------------------
DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_german2_ci NOT NULL,
  `daemon_task_num` bigint(20) unsigned DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `crontab_task_num` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `crontab_job_audit_num` bigint(20) unsigned DEFAULT NULL,
  `daemon_job_audit_num` bigint(20) unsigned DEFAULT NULL,
  `crontab_job_fail_num` bigint(20) unsigned DEFAULT NULL,
  `addr` varchar(100) COLLATE utf8mb4_german2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_group_addr` (`group_id`,`addr`),
  KEY `idx_nodes_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for sys_settings
-- ----------------------------
DROP TABLE IF EXISTS `sys_settings`;
CREATE TABLE `sys_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `class` bigint(20) DEFAULT NULL,
  `content` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_settings_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `username` varchar(500) COLLATE utf8mb4_german2_ci NOT NULL,
  `passwd` longtext COLLATE utf8mb4_german2_ci,
  `salt` longtext COLLATE utf8mb4_german2_ci,
  `avatar` longtext COLLATE utf8mb4_german2_ci,
  `version` bigint(20) DEFAULT NULL,
  `gender` longtext COLLATE utf8mb4_german2_ci,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `root` tinyint(1) DEFAULT NULL,
  `mail` longtext COLLATE utf8mb4_german2_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_username` (`username`),
  KEY `idx_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

SET FOREIGN_KEY_CHECKS = 1;
