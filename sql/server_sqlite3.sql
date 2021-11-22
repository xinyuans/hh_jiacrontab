CREATE TABLE `crontab_jobs` (
	`id` INTEGER,
	`created_at` datetime,
	`updated_at` datetime,
	`deleted_at` datetime,
	`name` text NOT NULL,
	`group_id` INTEGER,
	`command` VARCHAR ( 1000 ),
	`code` TEXT,
	`depend_jobs` TEXT,
	`last_cost_time` REAL,
	`last_exec_time` datetime,
	`next_exec_time` datetime,
	`failed` NUMERIC,
	`last_exit_status` text,
	`created_user_id` INTEGER,
	`created_username` text,
	`updated_user_id` INTEGER,
	`updated_username` text,
	`work_user` text,
	`work_ip` VARCHAR ( 1000 ),
	`work_env` VARCHAR ( 1000 ),
	`work_dir` text,
	`kill_child_process` NUMERIC,
	`timeout` INTEGER,
	`process_num` INTEGER,
	`error_mail_notify` NUMERIC,
	`error_api_notify` NUMERIC,
	`error_dingding_notify` NUMERIC,
	`retry_num` INTEGER,
	`status` INTEGER,
	`is_sync` NUMERIC,
	`mail_to` VARCHAR ( 1000 ),
	`api_to` VARCHAR ( 1000 ),
	`dingding_to` VARCHAR ( 1000 ),
	`max_concurrent` INTEGER,
	`timeout_trigger` VARCHAR ( 20 ),
`time_args` TEXT,
PRIMARY KEY ( `id` ));

CREATE INDEX `idx_crontab_jobs_name` ON `crontab_jobs`(`name`);
CREATE INDEX `idx_crontab_jobs_deleted_at` ON `crontab_jobs`(`deleted_at`);

CREATE TABLE `daemon_jobs` (
	`id` INTEGER,
	`created_at` datetime,
	`updated_at` datetime,
	`deleted_at` datetime,
	`name` text NOT NULL,
	`group_id` INTEGER,
	`command` VARCHAR ( 1000 ),
	`code` TEXT,
	`error_mail_notify` NUMERIC,
	`error_api_notify` NUMERIC,
	`error_dingding_notify` NUMERIC,
	`status` INTEGER,
	`mail_to` VARCHAR ( 1000 ),
	`api_to` VARCHAR ( 1000 ),
	`dingding_to` VARCHAR ( 1000 ),
	`fail_restart` NUMERIC,
	`retry_num` INTEGER,
	`start_at` datetime,
	`work_user` text,
	`work_ip` VARCHAR ( 1000 ),
	`work_env` VARCHAR ( 1000 ),
	`work_dir` text,
	`created_user_id` INTEGER,
	`created_username` text,
	`updated_user_id` INTEGER,
`updated_username` text,
PRIMARY KEY ( `id` ));

CREATE INDEX `idx_daemon_jobs_name` ON `daemon_jobs`(`name`);
CREATE INDEX `idx_daemon_jobs_deleted_at` ON `daemon_jobs`(`deleted_at`);