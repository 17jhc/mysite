-- MySQL dump 10.13  Distrib 5.7.24, for Win32 (AMD64)
--
-- Host: localhost    Database: mysite_db
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog',7,'add_blog'),(26,'Can change blog',7,'change_blog'),(27,'Can delete blog',7,'delete_blog'),(28,'Can view blog',7,'view_blog'),(29,'Can add blog type',8,'add_blogtype'),(30,'Can change blog type',8,'change_blogtype'),(31,'Can delete blog type',8,'delete_blogtype'),(32,'Can view blog type',8,'view_blogtype'),(33,'Can add read num',9,'add_readnum'),(34,'Can change read num',9,'change_readnum'),(35,'Can delete read num',9,'delete_readnum'),(36,'Can view read num',9,'view_readnum'),(37,'Can add read num',10,'add_readnum'),(38,'Can change read num',10,'change_readnum'),(39,'Can delete read num',10,'delete_readnum'),(40,'Can view read num',10,'view_readnum'),(41,'Can add read detail',11,'add_readdetail'),(42,'Can change read detail',11,'change_readdetail'),(43,'Can delete read detail',11,'delete_readdetail'),(44,'Can view read detail',11,'view_readdetail'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add like record',13,'add_likerecord'),(50,'Can change like record',13,'change_likerecord'),(51,'Can delete like record',13,'delete_likerecord'),(52,'Can view like record',13,'view_likerecord'),(53,'Can add like count',14,'add_likecount'),(54,'Can change like count',14,'change_likecount'),(55,'Can delete like count',14,'delete_likecount'),(56,'Can view like count',14,'view_likecount'),(57,'Can add profile',15,'add_profile'),(58,'Can change profile',15,'change_profile'),(59,'Can delete profile',15,'delete_profile'),(60,'Can view profile',15,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$RfQZRWoq4tEP$kCQCCjbVa0lzZcS/esqCbuV7A8AQp8Q4pxYvGPah+cQ=','2018-10-24 06:54:06.237052',1,'jhc','','','a@a.com',1,1,'2018-10-12 03:07:00.000000'),(2,'pbkdf2_sha256$120000$wZeeRWGCzSjh$lrw7bl1R7haCyT4ikRBCML90/llJ0Kl4BgWrSOlrvqk=','2018-10-17 08:27:00.000000',0,'jsw','','','b@b.com',1,1,'2018-10-17 08:27:00.000000'),(3,'pbkdf2_sha256$120000$Yl3HaX5qUL2O$gVxx9VnbEw46E0tZoBrpZDew0mnWuHbEgz+Dazk9PNg=','2018-10-23 08:20:34.215000',1,'fjk','','','391207849@qq.com',1,1,'2018-10-23 03:54:00.000000'),(4,'pbkdf2_sha256$120000$YrdWsJfTtbov$jklk4t+GQAkiaEI7a3LTITknt84a8CvysHKF4wE60d0=','2018-10-24 06:55:22.324939',0,'aaa','','','jhc_ustc@163.com',1,1,'2018-10-23 08:19:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,33),(34,2,34),(35,2,35),(36,2,36),(37,2,37),(38,2,38),(39,2,39),(40,2,40),(41,2,41),(42,2,42),(43,2,43),(44,2,44),(45,2,45),(46,2,46),(47,2,47),(48,2,48);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'the first blog','this is my first blog.','2018-10-12 03:18:14.870000','2018-10-12 03:18:14.870000',1,2),(2,'the second blog','This is the second blog and is too lang to display the content in the list.So we cut the firs thirty words and display them in the list view.Just see the result.','2018-10-12 03:50:28.848000','2018-10-12 03:50:28.848000',1,4),(3,'随笔测试','111111111111111111111111111111','2018-10-12 06:06:34.510000','2018-10-12 06:06:34.510000',1,4),(4,'long blog','This is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!\r\nvThis is a very long blog!\r\nThis is a very long blog!This is a very long blog!This is a very long blog!This is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!\r\nThis is a very long blog!This is a very long blog!v\r\nvThis is a very long blog!This is a very long blog!This is a very long blog!\r\nThis is a very long blog!This is a very long blog!This is a very long blog!','2018-10-12 09:05:47.625000','2018-10-12 09:05:47.625000',1,4),(5,'The 1 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.250000','2018-10-15 02:55:03.251000',1,1),(6,'The 2 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.312000','2018-10-15 02:55:03.312000',1,1),(7,'The 3 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.359000','2018-10-15 02:55:03.359000',1,1),(8,'The 4 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.399000','2018-10-15 02:55:03.399000',1,1),(9,'The 5 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.438000','2018-10-15 02:55:03.438000',1,1),(10,'The 6 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.478000','2018-10-15 02:55:03.478000',1,1),(11,'The 7 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.517000','2018-10-15 02:55:03.517000',1,1),(12,'The 8 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.557000','2018-10-15 02:55:03.557000',1,1),(13,'The 9 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.595000','2018-10-15 02:55:03.595000',1,1),(14,'The 10 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.635000','2018-10-15 02:55:03.635000',1,1),(15,'The 11 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.674000','2018-10-15 02:55:03.674000',1,1),(16,'The 12 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.714000','2018-10-15 02:55:03.714000',1,1),(17,'The 13 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.753000','2018-10-15 02:55:03.753000',1,1),(18,'The 14 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.792000','2018-10-15 02:55:03.793000',1,1),(19,'The 15 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.831000','2018-10-15 02:55:03.831000',1,1),(20,'The 16 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.871000','2018-10-16 01:50:59.167000',1,1),(21,'The 17 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.910000','2018-10-16 01:50:50.850000',1,1),(22,'The 18 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.950000','2018-10-15 02:55:03.950000',1,1),(23,'The 19 blog created by shell','This is test content,just for testing','2018-10-15 02:55:03.988000','2018-10-16 00:52:31.538000',1,1),(24,'The 20 blog created by shell','<p>This is test content,just for testingsadasdsad</p>\r\n\r\n<p><span style=\"color:#d35400\">This is test content,just for testingsadasdsad<img alt=\"\" src=\"/media/upload/2018/10/15/pic1.png\" style=\"height:203px; width:120px\" /></span></p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p><span style=\"color:#000000\">This is test content,just for testingsadasdsad</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This is test content,just for testingsadasdsad</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This is test content,just for testingsadasdsadThis is test content,just for testingsadasdsadThis is test content,just for testingsadasdsadThis is test content,just for testingsadasdsad</p>\r\n\r\n<p>This is test content,just for testingsadasdsad</p>','2018-10-15 02:55:04.028000','2018-10-16 01:32:53.986000',1,1);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'django'),(2,'学习'),(3,'感悟'),(4,'随笔');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `text` longtext NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_content_type_id_fbfb9793_fk_django_co` (`content_type_id`),
  KEY `comment_comment_parent_id_b612524c_fk_comment_comment_id` (`parent_id`),
  KEY `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` (`reply_to_id`),
  KEY `comment_comment_root_id_28721811_fk_comment_comment_id` (`root_id`),
  KEY `comment_comment_user_id_6078e57b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_comment_parent_id_b612524c_fk_comment_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` FOREIGN KEY (`reply_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `comment_comment_root_id_28721811_fk_comment_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (1,21,'123132','2018-10-17 06:27:47.843000',7,1,NULL,NULL,NULL),(2,23,'1231','2018-10-17 06:35:11.423000',7,1,NULL,NULL,NULL),(3,23,'1231','2018-10-17 09:09:46.539000',7,1,NULL,NULL,NULL),(4,23,'21312','2018-10-17 09:37:15.356000',7,1,NULL,NULL,NULL),(5,23,'<p>12321</p>','2018-10-17 09:55:19.543000',7,1,NULL,NULL,NULL),(6,23,'<p>12312</p>','2018-10-18 01:58:49.678000',7,1,NULL,NULL,NULL),(7,23,'<p>23423</p>','2018-10-18 02:01:41.905000',7,1,NULL,NULL,NULL),(8,23,'<p>23423</p>','2018-10-18 02:08:54.142000',7,1,NULL,NULL,NULL),(9,23,'<p>2134</p>','2018-10-18 02:09:04.938000',7,1,NULL,NULL,NULL),(10,23,'<p>4444</p>','2018-10-18 02:09:35.505000',7,1,NULL,NULL,NULL),(11,23,'<p>23423423</p>','2018-10-18 02:11:46.631000',7,1,NULL,NULL,NULL),(12,23,'<p>12313</p>','2018-10-18 02:23:37.745000',7,1,NULL,NULL,NULL),(13,23,'<p>324234</p>','2018-10-18 02:26:56.813000',7,1,NULL,NULL,NULL),(14,23,'<p>324234</p>','2018-10-18 02:27:11.645000',7,1,NULL,NULL,NULL),(15,23,'<p>324234</p>','2018-10-18 02:27:42.471000',7,1,NULL,NULL,NULL),(16,23,'<p>32342</p>','2018-10-18 02:28:07.897000',7,1,NULL,NULL,NULL),(17,23,'<p>43444</p>','2018-10-18 02:28:15.723000',7,1,NULL,NULL,NULL),(18,23,'<p>dfsf</p>','2018-10-18 02:29:40.953000',7,1,NULL,NULL,NULL),(19,23,'<p>12321</p>','2018-10-18 02:41:34.596000',7,1,NULL,NULL,NULL),(20,23,'<p>213123</p>','2018-10-18 02:41:58.903000',7,1,NULL,NULL,NULL),(21,23,'<p>211231</p>','2018-10-18 02:46:19.881000',7,1,NULL,NULL,NULL),(22,23,'<p>12312312</p>','2018-10-18 02:51:50.445000',7,1,NULL,NULL,NULL),(27,23,'<p>bbbbb</p>','2018-10-18 06:17:37.980000',7,1,21,1,21),(29,23,'<p>adadas</p>','2018-10-18 06:49:34.123000',7,1,19,1,19),(30,23,'<p>ccccc</p>','2018-10-18 06:49:42.959000',7,1,29,1,19),(32,23,'<p>asdfg</p>','2018-10-18 08:28:57.523000',7,1,NULL,NULL,NULL),(33,23,'<p>fdasdda</p>','2018-10-18 08:29:05.350000',7,1,32,1,32),(34,23,'<p>1111111</p>','2018-10-18 08:56:44.642000',7,1,NULL,NULL,NULL),(35,23,'<p>21312312</p>','2018-10-18 08:56:49.990000',7,1,34,1,34),(36,23,'<p>222222</p>','2018-10-19 07:09:10.543000',7,1,NULL,NULL,NULL),(37,23,'<p>1212</p>','2018-10-19 07:46:52.303000',7,1,36,1,36),(38,23,'<p>123123</p>','2018-10-19 07:47:53.702000',7,1,NULL,NULL,NULL),(39,23,'<p>12312312</p>','2018-10-19 07:47:58.967000',7,1,38,1,38),(40,21,'<p>213123</p>','2018-10-22 06:00:22.950000',7,1,1,1,1),(41,22,'<p>1241241</p>','2018-10-22 06:00:58.032000',7,1,NULL,NULL,NULL),(42,22,'<p>1241414</p>','2018-10-22 06:01:02.957000',7,1,41,1,41),(43,22,'<p>123123123</p>','2018-10-22 06:11:16.460000',7,1,42,1,41),(44,22,'<p>12312312312</p>','2018-10-22 06:11:30.557000',7,1,NULL,NULL,NULL),(45,22,'<p>1231231</p>','2018-10-22 06:11:40.525000',7,1,44,1,44),(46,22,'<p>21312<strong>213123123</strong></p>','2018-10-22 06:12:21.688000',7,1,NULL,NULL,NULL),(47,22,'<p><strong>1231231</strong></p>\r\n\r\n<p><strong>1231231231</strong></p>\r\n\r\n<p><strong><u>3512414</u></strong></p>','2018-10-22 06:12:40.768000',7,1,46,1,46),(48,22,'<p>231231</p>','2018-10-22 06:13:41.536000',7,1,NULL,NULL,NULL),(49,24,'<p>213123</p>','2018-10-22 08:43:39.936000',7,1,NULL,NULL,NULL),(50,24,'<p>21312</p>','2018-10-22 08:43:43.996000',7,1,49,1,49),(51,24,'<p>1231231</p>','2018-10-23 03:15:11.063000',7,1,49,1,49);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-12 03:14:47.401000','1','BlogType object (1)',1,'[{\"added\": {}}]',8,1),(2,'2018-10-12 03:14:52.106000','2','BlogType object (2)',1,'[{\"added\": {}}]',8,1),(3,'2018-10-12 03:15:01.330000','3','BlogType object (3)',1,'[{\"added\": {}}]',8,1),(4,'2018-10-12 03:18:14.872000','1','<Blog: the first blog>',1,'[{\"added\": {}}]',7,1),(5,'2018-10-12 03:18:39.421000','4','随笔',1,'[{\"added\": {}}]',8,1),(6,'2018-10-12 03:50:28.850000','2','<Blog: the second blog>',1,'[{\"added\": {}}]',7,1),(7,'2018-10-12 06:06:34.512000','3','<Blog: 随笔测试>',1,'[{\"added\": {}}]',7,1),(8,'2018-10-12 09:05:47.666000','4','<Blog: long blog>',1,'[{\"added\": {}}]',7,1),(9,'2018-10-15 09:43:42.573000','24','<Blog: The 20 blog created by shell>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',7,1),(10,'2018-10-15 09:43:56.399000','24','<Blog: The 20 blog created by shell>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',7,1),(11,'2018-10-15 09:49:42.136000','24','<Blog: The 20 blog created by shell>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',7,1),(12,'2018-10-15 10:04:12.785000','24','<Blog: The 20 blog created by shell>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',7,1),(13,'2018-10-16 02:02:38.743000','1','ReadNum object (1)',1,'[{\"added\": {}}]',9,1),(14,'2018-10-16 02:56:26.218000','1','ReadNum object (1)',1,'[{\"added\": {}}]',10,1),(15,'2018-10-16 03:46:18.074000','1','ReadNum object (1)',2,'[{\"changed\": {\"fields\": [\"read_num\"]}}]',10,1),(16,'2018-10-16 07:44:46.850000','1','ReadDetail object (1)',1,'[{\"added\": {}}]',11,1),(17,'2018-10-16 09:28:37.166000','5','ReadDetail object (5)',1,'[{\"added\": {}}]',11,1),(18,'2018-10-17 08:33:49.299000','2','jsw',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"user_permissions\", \"last_login\"]}}]',4,1),(19,'2018-10-18 03:04:44.584000','23','Comment object (23)',1,'[{\"added\": {}}]',12,1),(20,'2018-10-18 03:05:06.587000','23','Comment object (23)',2,'[{\"changed\": {\"fields\": [\"content_type\"]}}]',12,1),(21,'2018-10-18 03:07:58.828000','23','Comment object (23)',2,'[{\"changed\": {\"fields\": [\"parent\"]}}]',12,1),(22,'2018-10-18 03:21:48.490000','23','aaaaaaa',2,'[{\"changed\": {\"fields\": [\"text\", \"reply_to\", \"root\"]}}]',12,1),(23,'2018-10-18 06:15:31.835000','26','<p>cccc</p>',3,'',12,1),(24,'2018-10-18 06:15:31.923000','25','<p>nnnnnnn</p>',3,'',12,1),(25,'2018-10-18 06:15:32.028000','24','<p>nnnnnnn</p>',3,'',12,1),(26,'2018-10-18 09:08:08.658000','23','aaaaaaa',3,'',12,1),(27,'2018-10-19 02:52:25.379000','2','LikeRecord object (2)',3,'',13,1),(28,'2018-10-19 02:52:25.637000','1','LikeRecord object (1)',3,'',13,1),(29,'2018-10-23 01:31:50.192000','1','jhc',2,'[{\"changed\": {\"fields\": [\"last_login\"]}}, {\"added\": {\"name\": \"profile\", \"object\": \"<Profile:\\u5c0f\\u7b80 for jhc\"}}]',4,1),(30,'2018-10-23 03:54:46.135000','3','fjk',1,'[{\"added\": {}}, {\"added\": {\"name\": \"profile\", \"object\": \"<Profile:\\u5c0f\\u5764\\u5764 for fjk\"}}]',4,1),(31,'2018-10-23 06:31:59.546000','3','fjk',2,'[{\"changed\": {\"fields\": [\"email\", \"last_login\"]}}]',4,1),(32,'2018-10-23 06:49:20.101000','3','fjk',2,'[{\"changed\": {\"fields\": [\"email\", \"is_staff\", \"last_login\"]}}]',4,1),(33,'2018-10-23 06:57:12.522000','3','fjk',2,'[{\"changed\": {\"fields\": [\"email\", \"is_superuser\", \"last_login\"]}}]',4,1),(34,'2018-10-23 08:42:33.459000','4','aaa',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"last_login\"]}}]',4,1),(35,'2018-10-24 06:54:52.068979','4','aaa',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','blog'),(8,'blog','blogtype'),(9,'blog','readnum'),(12,'comment','comment'),(5,'contenttypes','contenttype'),(14,'likes','likecount'),(13,'likes','likerecord'),(11,'read_account','readdetail'),(10,'read_account','readnum'),(6,'sessions','session'),(15,'user','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-24 06:41:17.734685'),(2,'auth','0001_initial','2018-10-24 06:41:21.260886'),(3,'admin','0001_initial','2018-10-24 06:41:22.007929'),(4,'admin','0002_logentry_remove_auto_add','2018-10-24 06:41:22.035931'),(5,'admin','0003_logentry_add_action_flag_choices','2018-10-24 06:41:22.057932'),(6,'contenttypes','0002_remove_content_type_name','2018-10-24 06:41:22.446954'),(7,'auth','0002_alter_permission_name_max_length','2018-10-24 06:41:22.749972'),(8,'auth','0003_alter_user_email_max_length','2018-10-24 06:41:22.824976'),(9,'auth','0004_alter_user_username_opts','2018-10-24 06:41:22.850977'),(10,'auth','0005_alter_user_last_login_null','2018-10-24 06:41:23.061989'),(11,'auth','0006_require_contenttypes_0002','2018-10-24 06:41:23.080990'),(12,'auth','0007_alter_validators_add_error_messages','2018-10-24 06:41:23.101992'),(13,'auth','0008_alter_user_username_max_length','2018-10-24 06:41:23.495014'),(14,'auth','0009_alter_user_last_name_max_length','2018-10-24 06:41:23.787031'),(15,'blog','0001_initial','2018-10-24 06:41:24.815090'),(16,'blog','0002_auto_20181015_1106','2018-10-24 06:41:24.836091'),(17,'blog','0003_auto_20181015_1739','2018-10-24 06:41:24.856092'),(18,'blog','0004_auto_20181015_1802','2018-10-24 06:41:24.876093'),(19,'blog','0005_blog_readed_num','2018-10-24 06:41:25.101106'),(20,'blog','0006_auto_20181016_0959','2018-10-24 06:41:28.895323'),(21,'blog','0007_auto_20181016_1052','2018-10-24 06:41:29.368350'),(22,'blog','0008_auto_20181018_1706','2018-10-24 06:41:30.012387'),(23,'comment','0001_initial','2018-10-24 06:41:30.718427'),(24,'comment','0002_auto_20181018_1103','2018-10-24 06:41:30.954441'),(25,'comment','0003_auto_20181018_1107','2018-10-24 06:41:31.777488'),(26,'comment','0004_auto_20181018_1112','2018-10-24 06:41:32.646538'),(27,'comment','0005_auto_20181018_1113','2018-10-24 06:41:33.024559'),(28,'comment','0006_auto_20181018_1115','2018-10-24 06:41:33.913610'),(29,'comment','0007_auto_20181018_1706','2018-10-24 06:41:35.640709'),(30,'likes','0001_initial','2018-10-24 06:41:36.611764'),(31,'read_account','0001_initial','2018-10-24 06:41:37.098792'),(32,'read_account','0002_auto_20181016_1542','2018-10-24 06:41:37.869836'),(33,'read_account','0003_auto_20181018_1706','2018-10-24 06:41:38.443869'),(34,'sessions','0001_initial','2018-10-24 06:41:38.640880'),(35,'user','0001_initial','2018-10-24 06:41:39.034903'),(36,'user','0002_auto_20181023_1117','2018-10-24 06:41:39.057904');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('l48mn0ftr6j3yb2gbvaryc3tm3m8lmog','Y2RlYmJiN2Y0YTM2YjY3ZTcwZTFhOGEwNWM4ZWVlMjZlNWUxNWFmNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlODRiMzVhMGRkOWYwZDlhYWRjMjZiNjg5NjRlMmZmMmYxZDM4N2QyIn0=','2018-11-05 07:13:37.685000'),('o5zlstgcdojo1jir57cylt8kd3ob83f8','YTNiZDEwMWFmMTIxYWZkOGJkYzYxOTFjMzJjMjdmZjc3MDRiNmE4Zjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZGMwYzlmOTFjMTE3MzIzMzIxMDk5MWMwMzc2YWU0YTFlZjYxNjVlIn0=','2018-11-07 06:55:22.350941'),('z5w2yabgf3iesoq38f8mu2ivcpzloloi','Y2RlYmJiN2Y0YTM2YjY3ZTcwZTFhOGEwNWM4ZWVlMjZlNWUxNWFmNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlODRiMzVhMGRkOWYwZDlhYWRjMjZiNjg5NjRlMmZmMmYxZDM4N2QyIn0=','2018-11-05 06:49:29.659000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_likecount`
--

DROP TABLE IF EXISTS `likes_likecount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes_likecount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `like_num` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likecount_content_type_id_a33eb91e_fk_django_co` (`content_type_id`),
  CONSTRAINT `likes_likecount_content_type_id_a33eb91e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_likecount`
--

LOCK TABLES `likes_likecount` WRITE;
/*!40000 ALTER TABLE `likes_likecount` DISABLE KEYS */;
INSERT INTO `likes_likecount` VALUES (1,24,0,7),(2,23,1,7),(3,22,0,7),(4,21,0,7),(5,20,0,7),(6,19,0,7),(7,18,0,7),(8,17,0,7),(9,16,0,7),(10,15,0,7),(11,34,0,12),(12,35,0,12),(13,32,0,12),(14,33,0,12),(15,22,0,12),(16,21,0,12),(17,27,0,12),(18,20,0,12),(19,19,0,12),(20,29,0,12),(21,30,0,12),(22,18,0,12),(23,17,0,12),(24,16,0,12),(25,15,0,12),(26,14,0,12),(27,13,0,12),(28,12,0,12),(29,11,0,12),(30,10,0,12),(31,9,0,12),(32,8,0,12),(33,7,0,12),(34,6,0,12),(35,5,0,12),(36,4,0,12),(37,3,0,12),(38,2,0,12),(39,36,0,12),(40,37,0,12),(41,38,0,12),(42,39,0,12),(43,1,1,12),(44,40,0,12),(45,41,1,12),(46,42,0,12),(47,43,1,12),(48,44,0,12),(49,45,0,12),(50,48,0,12),(51,46,0,12),(52,47,0,12),(53,49,1,12),(54,50,1,12),(55,51,0,12);
/*!40000 ALTER TABLE `likes_likecount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_likerecord`
--

DROP TABLE IF EXISTS `likes_likerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes_likerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `liked_time` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likerecord_content_type_id_4e35de35_fk_django_co` (`content_type_id`),
  KEY `likes_likerecord_user_id_c85b88bd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `likes_likerecord_content_type_id_4e35de35_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `likes_likerecord_user_id_c85b88bd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_likerecord`
--

LOCK TABLES `likes_likerecord` WRITE;
/*!40000 ALTER TABLE `likes_likerecord` DISABLE KEYS */;
INSERT INTO `likes_likerecord` VALUES (4,23,'2018-10-19 03:08:46.011000',7,1),(20,1,'2018-10-22 06:00:18.738000',12,1),(21,41,'2018-10-22 06:00:59.896000',12,1),(23,43,'2018-10-22 06:11:19.510000',12,1),(25,49,'2018-10-22 08:43:41.628000',12,1),(26,50,'2018-10-22 08:43:45.269000',12,1);
/*!40000 ALTER TABLE `likes_likerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_cache_table`
--

DROP TABLE IF EXISTS `my_cache_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_cache_table` (
  `cache_key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `expires` datetime(6) NOT NULL,
  PRIMARY KEY (`cache_key`),
  KEY `my_cache_table_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_cache_table`
--

LOCK TABLES `my_cache_table` WRITE;
/*!40000 ALTER TABLE `my_cache_table` DISABLE KEYS */;
INSERT INTO `my_cache_table` VALUES (':1:hot_blogs_for_seven_days','gASVKQoAAAAAAACMFmRqYW5nby5kYi5tb2RlbHMucXVlcnmUjAhRdWVyeVNldJSTlCmBlH2UKIwFbW9kZWyUjAtibG9nLm1vZGVsc5SMBEJsb2eUk5SMA19kYpROjAZfaGludHOUfZSMBXF1ZXJ5lIwaZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnmUjAVRdWVyeZSTlCmBlH2UKGgFaAiMDmFsaWFzX3JlZmNvdW50lH2UKIwJYmxvZ19ibG9nlEsDjBdyZWFkX2FjY291bnRfcmVhZGRldGFpbJRLAnWMCWFsaWFzX21hcJSMC2NvbGxlY3Rpb25zlIwLT3JkZXJlZERpY3SUk5QpUpQoaBSMI2RqYW5nby5kYi5tb2RlbHMuc3FsLmRhdGFzdHJ1Y3R1cmVzlIwJQmFzZVRhYmxllJOUKYGUfZQojAp0YWJsZV9uYW1llGgUjAt0YWJsZV9hbGlhc5RoFHViaBVoG4wESm9pbpSTlCmBlH2UKGggaBWMDHBhcmVudF9hbGlhc5RoFGghaBWMCWpvaW5fdHlwZZSMCklOTkVSIEpPSU6UjAlqb2luX2NvbHOUjAJpZJSMCW9iamVjdF9pZJSGlIWUjApqb2luX2ZpZWxklIwiZGphbmdvLmNvbnRyaWIuY29udGVudHR5cGVzLmZpZWxkc5SMCkdlbmVyaWNSZWyUk5QpgZR9lCiMBWZpZWxklIwXZGphbmdvLmRiLm1vZGVscy5maWVsZHOUjAtfbG9hZF9maWVsZJSTlIwEYmxvZ5RoB4wMcmVhZF9kZXRhaWxzlIeUUpRoBYwTcmVhZF9hY2NvdW50Lm1vZGVsc5SMClJlYWREZXRhaWyUk5SMDHJlbGF0ZWRfbmFtZZSMASuUjBJyZWxhdGVkX3F1ZXJ5X25hbWWUTowQbGltaXRfY2hvaWNlc190b5R9lIwLcGFyZW50X2xpbmuUiYwJb25fZGVsZXRllIwZZGphbmdvLmRiLm1vZGVscy5kZWxldGlvbpSMCkRPX05PVEhJTkeUk5SMC3N5bW1ldHJpY2FslImMCG11bHRpcGxllIh1YowIbnVsbGFibGWUiIwRZmlsdGVyZWRfcmVsYXRpb26UTnVidYwQZXh0ZXJuYWxfYWxpYXNlc5SPlIwJdGFibGVfbWFwlH2UKGgUXZRoFGFoFV2UaBVhdYwMZGVmYXVsdF9jb2xzlImMEGRlZmF1bHRfb3JkZXJpbmeUiIwRc3RhbmRhcmRfb3JkZXJpbmeUiIwMdXNlZF9hbGlhc2VzlI+UjBBmaWx0ZXJfaXNfc3RpY2t5lImMCHN1YnF1ZXJ5lImMBnNlbGVjdJSMHGRqYW5nby5kYi5tb2RlbHMuZXhwcmVzc2lvbnOUjANDb2yUk5QpgZR9lCiMEV9jb25zdHJ1Y3Rvcl9hcmdzlGgUaDdoOGgHaCqHlFKUhpR9lIaUjAxvdXRwdXRfZmllbGSUaGKMBWFsaWFzlGgUjAZ0YXJnZXSUaGJ1YmhdKYGUfZQoaGBoFGg3aDhoB4wFdGl0bGWUh5RSlIaUfZSGlGhmaG1oZ2gUaGhobXVihpSMBXdoZXJllIwaZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmWUjAlXaGVyZU5vZGWUk5QpgZR9lCiMCGNoaWxkcmVulF2UjBhkamFuZ28uZGIubW9kZWxzLmxvb2t1cHOUjBJHcmVhdGVyVGhhbk9yRXF1YWyUk5QpgZR9lCiMA2xoc5RoXSmBlH2UKGhgaBVoN4wMcmVhZF9hY2NvdW50lGg9jARkYXRllIeUUpSGlH2UhpRoZmiFaGdoFWhoaIWMEmNvbnRhaW5zX2FnZ3JlZ2F0ZZSJdWKMA3Joc5SMCGRhdGV0aW1llIwEZGF0ZZSTlEMEB+IKEZSFlFKUjBRiaWxhdGVyYWxfdHJhbnNmb3Jtc5RdlGiJiXViYYwJY29ubmVjdG9ylIwDQU5ElIwHbmVnYXRlZJSJaImJdWKMC3doZXJlX2NsYXNzlGh1jAhncm91cF9ieZRoXmhphpSMCG9yZGVyX2J5lIwNLXJlYWRfbnVtX3N1bZSFlIwIbG93X21hcmuUSwCMCWhpZ2hfbWFya5RLB4wIZGlzdGluY3SUiYwPZGlzdGluY3RfZmllbGRzlCmMEXNlbGVjdF9mb3JfdXBkYXRllImMGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdJSJjB1zZWxlY3RfZm9yX3VwZGF0ZV9za2lwX2xvY2tlZJSJjBRzZWxlY3RfZm9yX3VwZGF0ZV9vZpQpjA5zZWxlY3RfcmVsYXRlZJSJjAltYXhfZGVwdGiUSwWMDXZhbHVlc19zZWxlY3SUaCpoa4aUjAxfYW5ub3RhdGlvbnOUaBkpUpSMDHJlYWRfbnVtX3N1bZSMG2RqYW5nby5kYi5tb2RlbHMuYWdncmVnYXRlc5SMA1N1bZSTlCmBlH2UKGhgjBZyZWFkX2RldGFpbHNfX3JlYWRfbnVtlIWUfZSGlIwGZmlsdGVylE6MEnNvdXJjZV9leHByZXNzaW9uc5RdlGhdKYGUfZQoaGBoFWg3aIJoPYwIcmVhZF9udW2Uh5RSlIaUfZSGlGhmaLtoZ2gVaGhou4wVX291dHB1dF9maWVsZF9vcl9ub25llGi7aImJdWJhjAVleHRyYZR9lIwKaXNfc3VtbWFyeZSJaGZou3Vic4wWYW5ub3RhdGlvbl9zZWxlY3RfbWFza5SPlChoqpCMGF9hbm5vdGF0aW9uX3NlbGVjdF9jYWNoZZRoGSlSlGiqaK5zjApjb21iaW5hdG9ylE6MDmNvbWJpbmF0b3JfYWxslImMEGNvbWJpbmVkX3F1ZXJpZXOUKYwGX2V4dHJhlE6MEWV4dHJhX3NlbGVjdF9tYXNrlI+UjBNfZXh0cmFfc2VsZWN0X2NhY2hllE6MDGV4dHJhX3RhYmxlc5QpjA5leHRyYV9vcmRlcl9ieZQpjBBkZWZlcnJlZF9sb2FkaW5nlCiRlIiGlIwTX2ZpbHRlcmVkX3JlbGF0aW9uc5R9lIwNZXhwbGFpbl9xdWVyeZSJjA5leHBsYWluX2Zvcm1hdJROjA9leHBsYWluX29wdGlvbnOUfZSMDV9sb29rdXBfam9pbnOUXZQoaBRoFWWMCmJhc2VfdGFibGWUaBR1YowNX3Jlc3VsdF9jYWNoZZRdlIwOX3N0aWNreV9maWx0ZXKUiYwKX2Zvcl93cml0ZZSJjBlfcHJlZmV0Y2hfcmVsYXRlZF9sb29rdXBzlCmMDl9wcmVmZXRjaF9kb25llImMFl9rbm93bl9yZWxhdGVkX29iamVjdHOUfZSMD19pdGVyYWJsZV9jbGFzc5RoAIwOVmFsdWVzSXRlcmFibGWUk5SMB19maWVsZHOUaCpoa4aUjA9fZGphbmdvX3ZlcnNpb26UjAUyLjEuMZR1Yi4=','2018-10-24 07:42:44.000000');
/*!40000 ALTER TABLE `my_cache_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_account_readdetail`
--

DROP TABLE IF EXISTS `read_account_readdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `read_account_readdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `read_num` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_account_readdet_content_type_id_5c698a08_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_account_readdet_content_type_id_5c698a08_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_account_readdetail`
--

LOCK TABLES `read_account_readdetail` WRITE;
/*!40000 ALTER TABLE `read_account_readdetail` DISABLE KEYS */;
INSERT INTO `read_account_readdetail` VALUES (1,'2018-10-15',4,23,7),(2,'2018-10-16',1,21,7),(3,'2018-10-16',1,20,7),(4,'2018-10-16',1,19,7),(5,'2018-10-11',3,15,7),(6,'2018-10-17',1,24,7),(7,'2018-10-17',1,23,7),(8,'2018-10-17',1,21,7),(9,'2018-10-18',1,23,7),(10,'2018-10-18',1,24,7),(11,'2018-10-19',1,23,7),(12,'2018-10-19',1,24,7),(13,'2018-10-19',1,19,7),(14,'2018-10-22',1,24,7),(15,'2018-10-22',1,21,7),(16,'2018-10-22',1,23,7),(17,'2018-10-22',1,22,7),(18,'2018-10-23',1,24,7),(19,'2018-10-23',1,23,7),(20,'2018-10-24',1,24,7);
/*!40000 ALTER TABLE `read_account_readdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_account_readnum`
--

DROP TABLE IF EXISTS `read_account_readnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `read_account_readnum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read_num` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_account_readnum_content_type_id_c10fc9b1_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_account_readnum_content_type_id_c10fc9b1_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_account_readnum`
--

LOCK TABLES `read_account_readnum` WRITE;
/*!40000 ALTER TABLE `read_account_readnum` DISABLE KEYS */;
INSERT INTO `read_account_readnum` VALUES (1,12,24,7),(2,1,3,7),(3,1,15,7),(4,6,23,7),(5,2,22,7),(6,3,21,7),(7,1,20,7),(8,2,19,7);
/*!40000 ALTER TABLE `read_account_readnum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_profile_user_id_8fdce8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'小简',1),(2,'小坤坤',3),(3,'小a',4);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-24 17:10:38
