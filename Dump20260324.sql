-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nano_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add Token',7,'add_tokenproxy'),(26,'Can change Token',7,'change_tokenproxy'),(27,'Can delete Token',7,'delete_tokenproxy'),(28,'Can view Token',7,'view_tokenproxy'),(29,'Can add custom user',8,'add_customuser'),(30,'Can change custom user',8,'change_customuser'),(31,'Can delete custom user',8,'delete_customuser'),(32,'Can view custom user',8,'view_customuser'),(33,'Can add notification',10,'add_notification'),(34,'Can change notification',10,'change_notification'),(35,'Can delete notification',10,'delete_notification'),(36,'Can view notification',10,'view_notification'),(37,'Can add dataset',9,'add_dataset'),(38,'Can change dataset',9,'change_dataset'),(39,'Can delete dataset',9,'delete_dataset'),(40,'Can view dataset',9,'view_dataset'),(41,'Can add submission',11,'add_submission'),(42,'Can change submission',11,'change_submission'),(43,'Can delete submission',11,'delete_submission'),(44,'Can view submission',11,'view_submission');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('74b65cfbc3722b25c0315c07a556304b2c379ef1','2026-02-27 07:55:47.773792',2),('f5cf8d935948946b2da0296d5e6ef1fee84feb27','2026-02-27 07:49:37.258654',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(7,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(8,'user','customuser'),(9,'user','dataset'),(10,'user','notification'),(11,'user','submission');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-27 07:48:53.374114'),(2,'contenttypes','0002_remove_content_type_name','2026-02-27 07:48:53.682356'),(3,'auth','0001_initial','2026-02-27 07:48:54.277623'),(4,'auth','0002_alter_permission_name_max_length','2026-02-27 07:48:54.398515'),(5,'auth','0003_alter_user_email_max_length','2026-02-27 07:48:54.411100'),(6,'auth','0004_alter_user_username_opts','2026-02-27 07:48:54.422760'),(7,'auth','0005_alter_user_last_login_null','2026-02-27 07:48:54.437386'),(8,'auth','0006_require_contenttypes_0002','2026-02-27 07:48:54.445988'),(9,'auth','0007_alter_validators_add_error_messages','2026-02-27 07:48:54.455653'),(10,'auth','0008_alter_user_username_max_length','2026-02-27 07:48:54.465618'),(11,'auth','0009_alter_user_last_name_max_length','2026-02-27 07:48:54.476337'),(12,'auth','0010_alter_group_name_max_length','2026-02-27 07:48:54.495938'),(13,'auth','0011_update_proxy_permissions','2026-02-27 07:48:54.507250'),(14,'auth','0012_alter_user_first_name_max_length','2026-02-27 07:48:54.515438'),(15,'user','0001_initial','2026-02-27 07:48:55.197016'),(16,'admin','0001_initial','2026-02-27 07:48:55.510182'),(17,'admin','0002_logentry_remove_auto_add','2026-02-27 07:48:55.526142'),(18,'admin','0003_logentry_add_action_flag_choices','2026-02-27 07:48:55.535876'),(19,'authtoken','0001_initial','2026-02-27 07:48:55.713465'),(20,'authtoken','0002_auto_20160226_1747','2026-02-27 07:48:55.747310'),(21,'authtoken','0003_tokenproxy','2026-02-27 07:48:55.749306'),(22,'authtoken','0004_alter_tokenproxy_options','2026-02-27 07:48:55.764887'),(23,'sessions','0001_initial','2026-02-27 07:48:55.849857'),(24,'user','0002_customuser_is_role_selected_customuser_role','2026-03-10 08:51:21.417026'),(25,'user','0003_dataset','2026-03-10 08:51:22.019969'),(26,'user','0004_alter_customuser_role','2026-03-10 08:51:22.046948'),(27,'user','0005_alter_customuser_role','2026-03-10 08:51:22.391025'),(28,'user','0006_alter_customuser_role_delete_dataset','2026-03-10 08:51:22.470043'),(29,'user','0007_notification','2026-03-10 08:51:22.795659'),(30,'user','0008_datasetsubmission','2026-03-10 08:51:23.109651'),(31,'user','0009_dataset_submission_delete_datasetsubmission','2026-03-10 08:51:24.846912'),(32,'user','0010_alter_customuser_role','2026-03-10 08:51:24.874689'),(33,'user','0011_alter_customuser_role','2026-03-10 08:51:24.902600'),(34,'user','0012_alter_dataset_description','2026-03-16 03:25:49.398377');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customuser`
--

DROP TABLE IF EXISTS `user_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `otp_created_at` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_role_selected` tinyint(1) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customuser`
--

LOCK TABLES `user_customuser` WRITE;
/*!40000 ALTER TABLE `user_customuser` DISABLE KEYS */;
INSERT INTO `user_customuser` VALUES (1,'pbkdf2_sha256$720000$Hv7L7MgTgRTwpn4qUckqk3$N/zAk7lWoRBiCUFDjQ0bH+Yhc0iE5nY/9izwA/dgi4A=',NULL,0,'Baladb','baladhulipalla9@gmail.com',NULL,NULL,1,0,'2026-02-27 07:49:26.468000',0,'admin'),(2,'pbkdf2_sha256$1200000$BMKiHzljwXT6a3PIgEiX5o$lYpIU2obF8Rd5SWLKFGAHExh/s0ctiK9k7AygG4YNmE=','2026-03-18 04:16:35.401722',0,'Himaja','himajayenikapati@gmail.com',NULL,NULL,1,0,'2026-02-27 07:54:38.909811',1,'admin'),(3,'pbkdf2_sha256$1200000$4joTU7CGR73QwTDoGp0wX9$G3LPze+iCTXnt3sONh0VNR3a7n59giW97ANyD9Hjxw4=','2026-03-24 04:14:37.826717',1,'Bala Dhulipalla','dhulipallabala@gmail.com',NULL,NULL,1,1,'2026-03-10 08:54:37.140611',1,'super_admin'),(4,'pbkdf2_sha256$720000$1JZwcfiufnwE9COi6LMtjW$IB9WHkAoFtk9lQBOOy6JB+abJkraJuXszZQcBvDaHEI=',NULL,0,'Balalucky','balalucky@gmail.com',NULL,NULL,1,0,'2026-03-11 04:32:50.384949',0,'researcher'),(5,'pbkdf2_sha256$720000$rJse7ixlgzEIBHWaFpdJXa$mX2IqsuCTJQGhoPJma0AHp+zyIjRUkTA6Z3orOqYJMg=','2026-03-16 02:42:34.217662',1,'Super Admin','admin@simats.com',NULL,NULL,1,1,'2026-03-16 02:42:10.691016',0,'super_admin'),(6,'pbkdf2_sha256$720000$4JH3CY4x6E2WY8ClFMAcHx$EXrERb/ijsS7oapFenuB2X92EHrdlSNcLOiF8iVYgtw=',NULL,0,'Test Researcher','researcher@simats.com',NULL,NULL,1,0,'2026-03-16 02:42:11.120238',0,'researcher'),(7,'pbkdf2_sha256$720000$5F5udsfcJWIOmE3Micntdq$gNgZjO9pwjYH8mjulnhrvGYlIVTNPIMGkaqoiF7tgPs=','2026-03-16 09:42:21.326015',0,'Abiram','abiram123@gmail.com',NULL,NULL,1,0,'2026-03-16 03:13:55.398702',1,'researcher'),(8,'pbkdf2_sha256$720000$BCbRp6BIazH9JuvBLDzze4$Z0GgW21AwLuUzLhZTMmHiLdddoN5lifGKeJ6nsyklNo=','2026-03-16 07:21:57.257108',0,'Bala','debug@test.com',NULL,NULL,1,0,'2026-03-16 07:15:51.083720',0,'researcher'),(10,'pbkdf2_sha256$720000$INcZGRgSbribvbDGFWq0Zf$xGG7RjLWJ3AtuZVMh9JcOuTZ4ZyB5fOXYkK6QQAal0Q=',NULL,0,'Dr.Kasthuri Natarajan','kasthurinm02@gmail.com',NULL,NULL,1,0,'2026-03-17 05:17:24.943142',0,'admin'),(11,'pbkdf2_sha256$720000$Y0713fNjDs8wHcJKKgciRI$kkeJXYCKKjy9shr/C/I9cUKysDCYbSrLNoF4ltHetzc=','2026-03-18 09:04:23.081138',0,'Venky D','venkyd@gmail.com',NULL,NULL,1,0,'2026-03-18 09:04:04.170454',0,'researcher'),(12,'pbkdf2_sha256$720000$ZCXWve9SB91NkftIltxCbB$B0aNdKTUf37IogO10nGFPy16yFKOd866LM/O7CwrkjE=',NULL,0,'Srilakshmi','srilakshmidb1862.sse@saveetha.com',NULL,NULL,1,0,'2026-03-19 02:55:49.673154',0,'researcher'),(13,'pbkdf2_sha256$720000$nwgOBsTAUAIFabw7L8Vwrf$hG9W2PujtGmadoLvEZcn4Lkl6lB7Q+YFJBgVmbhZdu0=',NULL,0,'Venky D','venkydhulipalla0712@gmail.com',NULL,NULL,1,0,'2026-03-19 03:05:29.780900',0,'researcher'),(14,'pbkdf2_sha256$1200000$cpHTcV1dmuFFiDrw2IxjF1$nIkVdFbftdFBJ3Q3ztX7y6o39vVyMdW16Mw/FlEmmz0=','2026-03-19 06:56:53.756792',0,'1','1@qmail.com',NULL,NULL,1,0,'2026-03-19 06:54:34.986649',1,'researcher'),(15,'pbkdf2_sha256$1200000$1flAxJN2y7NCQl0FtaWtY8$M+4OFvt3ElViVjmpak9xXxlob5dDNd6pTen1sFUXfH8=',NULL,0,'Meghana','meghana123@gmail.com',NULL,NULL,1,0,'2026-03-20 04:26:34.303689',0,'user');
/*!40000 ALTER TABLE `user_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customuser_groups`
--

DROP TABLE IF EXISTS `user_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_customuser_groups_customuser_id_group_id_e0a2f621_uniq` (`customuser_id`,`group_id`),
  KEY `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_customuser_grou_customuser_id_192632a7_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customuser_groups`
--

LOCK TABLES `user_customuser_groups` WRITE;
/*!40000 ALTER TABLE `user_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customuser_user_permissions`
--

DROP TABLE IF EXISTS `user_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_customuser_user_per_customuser_id_permission_a5da865d_uniq` (`customuser_id`,`permission_id`),
  KEY `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_customuser_user_customuser_id_4552d9cc_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customuser_user_permissions`
--

LOCK TABLES `user_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dataset`
--

DROP TABLE IF EXISTS `user_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dataset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_dataset_created_by_id_56d5475a_fk_user_customuser_id` (`created_by_id`),
  CONSTRAINT `user_dataset_created_by_id_56d5475a_fk_user_customuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `user_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dataset`
--

LOCK TABLES `user_dataset` WRITE;
/*!40000 ALTER TABLE `user_dataset` DISABLE KEYS */;
INSERT INTO `user_dataset` VALUES (1,'Silver Nanoparticle','','2026-03-16 04:19:13.063231',7),(2,'Silver Nanoparticle','','2026-03-16 04:19:18.251215',7),(3,'Silver Nanoparticle','','2026-03-16 04:19:19.002116',7),(4,'Silver Nanoparticle','','2026-03-16 04:19:19.651664',7),(5,'Silver Nanoparticle','','2026-03-16 04:19:20.230375',7),(6,'Silver Nanoparticle','','2026-03-16 04:31:54.640316',7),(7,'Silver Nanoparticle','','2026-03-16 04:33:24.909421',7),(8,'Silver Nanoparticle','','2026-03-16 04:51:27.052261',7),(9,'Silver Nanoparticle','','2026-03-16 05:17:38.264789',7),(10,'S','','2026-03-16 05:19:25.493595',7),(11,'silver','','2026-03-16 06:37:37.546446',7),(12,'Test Dataset','','2026-03-16 07:30:57.959365',8),(13,'Silver Nanoparticle','','2026-03-17 05:18:50.741903',3),(14,'Density of aluminium','','2026-03-19 05:22:27.023789',3),(15,'1','','2026-03-19 07:01:33.009469',14),(16,'1','','2026-03-19 07:02:44.002876',14),(17,'12525','','2026-03-19 07:03:08.503608',14),(18,'silver','','2026-03-24 03:20:17.387472',3),(19,'silver','','2026-03-24 03:20:26.415979',3),(20,'silver','','2026-03-24 03:20:29.909868',3),(21,'silver','','2026-03-24 03:20:36.525917',3),(22,'silver','','2026-03-24 03:20:37.280453',3),(23,'silver','','2026-03-24 03:20:38.115922',3),(24,'Silver','','2026-03-24 03:31:53.497498',3),(25,'Density','','2026-03-24 03:32:24.085644',3),(26,'Ag','','2026-03-24 03:32:53.581345',3),(27,'Good','','2026-03-24 03:50:37.063919',3);
/*!40000 ALTER TABLE `user_dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notification_user_id_66a31b4a_fk_user_customuser_id` (`user_id`),
  CONSTRAINT `user_notification_user_id_66a31b4a_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification`
--

LOCK TABLES `user_notification` WRITE;
/*!40000 ALTER TABLE `user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_submission`
--

DROP TABLE IF EXISTS `user_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_submission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `notes` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `approved_by_id` bigint DEFAULT NULL,
  `dataset_id` bigint NOT NULL,
  `reviewed_by_id` bigint DEFAULT NULL,
  `screened_by_id` bigint DEFAULT NULL,
  `submitted_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_submission_approved_by_id_8dd7b52b_fk_user_customuser_id` (`approved_by_id`),
  KEY `user_submission_dataset_id_ae361fc0_fk_user_dataset_id` (`dataset_id`),
  KEY `user_submission_reviewed_by_id_c92f898a_fk_user_customuser_id` (`reviewed_by_id`),
  KEY `user_submission_screened_by_id_e3016963_fk_user_customuser_id` (`screened_by_id`),
  KEY `user_submission_submitted_by_id_c21b3073_fk_user_customuser_id` (`submitted_by_id`),
  CONSTRAINT `user_submission_approved_by_id_8dd7b52b_fk_user_customuser_id` FOREIGN KEY (`approved_by_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `user_submission_dataset_id_ae361fc0_fk_user_dataset_id` FOREIGN KEY (`dataset_id`) REFERENCES `user_dataset` (`id`),
  CONSTRAINT `user_submission_reviewed_by_id_c92f898a_fk_user_customuser_id` FOREIGN KEY (`reviewed_by_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `user_submission_screened_by_id_e3016963_fk_user_customuser_id` FOREIGN KEY (`screened_by_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `user_submission_submitted_by_id_c21b3073_fk_user_customuser_id` FOREIGN KEY (`submitted_by_id`) REFERENCES `user_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_submission`
--

LOCK TABLES `user_submission` WRITE;
/*!40000 ALTER TABLE `user_submission` DISABLE KEYS */;
INSERT INTO `user_submission` VALUES (1,'submissions/document1000037972','','pending','2026-03-16 04:31:54.717172',NULL,6,NULL,NULL,7),(2,'submissions/document1000037972_FCkz6e2','','pending','2026-03-16 04:33:24.969202',NULL,7,NULL,NULL,7),(3,'submissions/document1000037972_mTC7dtU','','pending','2026-03-16 04:51:27.122481',NULL,8,NULL,NULL,7),(4,'submissions/document1000037972_ulq81dy','','pending','2026-03-16 05:17:38.359078',NULL,9,NULL,NULL,7),(5,'submissions/document1000037972_bo7EFli','','pending','2026-03-16 05:19:25.570372',NULL,10,NULL,NULL,7),(6,'submissions/document1000037972_1MzQisl','','pending','2026-03-16 06:37:37.848312',NULL,11,NULL,NULL,7),(7,'submissions/document1000037972_46Ny4e4','','pending','2026-03-17 05:18:51.132886',NULL,13,NULL,NULL,3),(8,'submissions/document1000039646','','pending','2026-03-19 05:22:27.130386',NULL,14,NULL,NULL,3),(9,'submissions/image1000039655','','pending','2026-03-19 07:01:33.164623',NULL,15,NULL,NULL,14),(10,'submissions/image1000039655_QAp08BQ','','pending','2026-03-19 07:02:44.286641',NULL,16,NULL,NULL,14),(11,'submissions/document1000039646_PVPLSaR','','pending','2026-03-19 07:03:08.642273',NULL,17,NULL,NULL,14),(12,'submissions/document1000039646_KzoNy7f','','pending','2026-03-24 03:31:53.583425',NULL,24,NULL,NULL,3),(13,'submissions/document1000041422','','pending','2026-03-24 03:32:24.155492',NULL,25,NULL,NULL,3),(14,'submissions/document1000037972_v6cOZwY','','pending','2026-03-24 03:32:53.650757',NULL,26,NULL,NULL,3),(15,'submissions/image1000041469','','pending','2026-03-24 03:50:37.150362',NULL,27,NULL,NULL,3);
/*!40000 ALTER TABLE `user_submission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 13:17:45
