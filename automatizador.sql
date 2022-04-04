/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : automatizador

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-04-04 19:24:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$320000$4Mfbob16CQrT78WBkl1dTg$z+zEmmlVJSgsGMHe3GhRlDSQesYyIHP6mJVbEU18A2U=', '2022-03-20 21:24:30.899372', '1', 'admin', '', '', 'esdrasfragoso@gmail.com', '1', '1', '2022-03-20 21:23:50.444384');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2022-03-20 21:33:46.587278', '2', 'TaskGroups object (2)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2022-03-20 21:36:07.096788', '2', 'Tasks object (2)', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2022-03-20 21:36:19.451259', '1', 'TaskGroups object (1)', '3', '', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'tarefas', 'taskgroups');
INSERT INTO `django_content_type` VALUES ('8', 'tarefas', 'tasks');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-03-19 16:31:49.701887');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-03-19 16:31:50.339323');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-03-19 16:31:50.482766');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2022-03-19 16:31:50.508419');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2022-03-19 16:31:50.518643');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2022-03-19 16:31:50.629329');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2022-03-19 16:31:50.687048');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2022-03-19 16:31:50.755898');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2022-03-19 16:31:50.769628');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2022-03-19 16:31:50.822983');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2022-03-19 16:31:50.829342');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2022-03-19 16:31:50.841194');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2022-03-19 16:31:50.905328');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2022-03-19 16:31:51.048476');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2022-03-19 16:31:51.110499');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2022-03-19 16:31:51.125070');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2022-03-19 16:31:51.191865');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2022-03-19 16:31:51.227946');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for task_groups
-- ----------------------------
DROP TABLE IF EXISTS `task_groups`;
CREATE TABLE `task_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `r` int DEFAULT '23',
  `g` int DEFAULT '162',
  `b` int DEFAULT '184',
  `creation_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of task_groups
-- ----------------------------
INSERT INTO `task_groups` VALUES ('2', 'Tarefa tipo 01', '150', '20', '34', '2022-03-20 21:33:23', '2022-03-26 15:07:30');
INSERT INTO `task_groups` VALUES ('3', 'Tarefa tipo 02', '150', '20', '34', '2022-03-20 21:33:23', '2022-03-26 15:07:30');
INSERT INTO `task_groups` VALUES ('4', 'Tarefa tipo 03', '150', '20', '34', '2022-03-20 21:33:23', '2022-03-26 15:07:30');
INSERT INTO `task_groups` VALUES ('5', 'Tarefa tipo 04', '32', '150', '23', '2022-03-20 21:33:23', '2022-03-20 21:33:43');
INSERT INTO `task_groups` VALUES ('6', 'Tarefa tipo 05', '150', '20', '34', '2022-03-20 21:33:23', '2022-03-26 15:07:30');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` enum('running','success','error','stop') DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `previous_status` varchar(10) DEFAULT NULL,
  `task_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tesk_group_id` (`task_group_id`),
  CONSTRAINT `tesk_group_id` FOREIGN KEY (`task_group_id`) REFERENCES `task_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('3', 'Tarefa Número 1', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('4', 'Tarefa Número 2', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('5', 'Tarefa Número 3', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('6', 'Tarefa Número 4', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('7', 'Tarefa Número 5', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('8', 'Tarefa Número 6', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('9', 'Tarefa Número 7', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('10', 'Tarefa Número 8', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('11', 'Tarefa Número 9', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('12', 'Tarefa Número 10', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '2');
INSERT INTO `tasks` VALUES ('13', 'Tarefa Número 1', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('14', 'Tarefa Número 2', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('15', 'Tarefa Número 3', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('16', 'Tarefa Número 4', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('17', 'Tarefa Número 5', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('18', 'Tarefa Número 6', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('19', 'Tarefa Número 7', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('20', 'Tarefa Número 8', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('21', 'Tarefa Número 9', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('22', 'Tarefa Número 10', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '3');
INSERT INTO `tasks` VALUES ('23', 'Tarefa Número 1', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('24', 'Tarefa Número 2', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('25', 'Tarefa Número 3', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('26', 'Tarefa Número 4', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('27', 'Tarefa Número 5', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('28', 'Tarefa Número 6', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('29', 'Tarefa Número 7', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('30', 'Tarefa Número 8', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('31', 'Tarefa Número 9', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('32', 'Tarefa Número 10', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '4');
INSERT INTO `tasks` VALUES ('33', 'Tarefa Número 1', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('34', 'Tarefa Número 2', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('35', 'Tarefa Número 3', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('36', 'Tarefa Número 4', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('37', 'Tarefa Número 5', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('38', 'Tarefa Número 6', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('39', 'Tarefa Número 7', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('40', 'Tarefa Número 8', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('41', 'Tarefa Número 9', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('42', 'Tarefa Número 10', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '5');
INSERT INTO `tasks` VALUES ('43', 'Tarefa Número 1', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('44', 'Tarefa Número 2', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('45', 'Tarefa Número 3', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('46', 'Tarefa Número 4', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('47', 'Tarefa Número 5', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('48', 'Tarefa Número 6', 'error', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('49', 'Tarefa Número 7', 'success', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('50', 'Tarefa Número 8', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('51', 'Tarefa Número 9', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
INSERT INTO `tasks` VALUES ('52', 'Tarefa Número 10', 'running', '2022-03-26 15:07:30', '2022-03-26 15:07:30', 'stop', '6');
