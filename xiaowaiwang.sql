-- MySQL dump 10.13  Distrib 5.5.61, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: xiaowaiwang
-- ------------------------------------------------------
-- Server version	5.5.61

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼ü£¬×ÔÔö',
  `pic` varchar(2024) NOT NULL COMMENT 'Í¼Æ¬',
  `content` varchar(8192) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ÐÞ¸ÄÊ±¼ä',
  `status` int(11) DEFAULT '1',
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='¸úÌû±í';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (143,'http://flz.mudan.com:8088/public/img/d5f23420-f7db-11ea-a0e7-39835cf24ef0.jpg','11','2020-09-16 05:16:55',1,10015),(154,'','879','2020-09-16 15:12:21',1,10027),(157,'http://flz.mudan.com:8088/public/img/2a6d6560-f886-11ea-872d-f13a9d510561.jpg','','2020-09-17 01:36:11',1,10015);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼ü£¬×ÔÔö',
  `author` varchar(64) NOT NULL DEFAULT '' COMMENT '×÷Õß',
  `title` varchar(256) NOT NULL COMMENT 'ÐÂÎÅ±êÌâ',
  `content` varchar(8192) NOT NULL COMMENT 'ÐÂÎÅÄÚÈÝ',
  `pic` varchar(2024) NOT NULL COMMENT 'ËõÂÔÍ¼',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ÐÞ¸ÄÊ±¼ä',
  `type` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='wap3g_news±í';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (26,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 07:59:59',1),(27,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:48',1),(28,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:50',1),(29,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:50',1),(30,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:51',1),(31,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:51',1),(32,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:52',1),(33,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:52',1),(34,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:53',1),(35,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:53',1),(36,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:22',2),(37,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:24',2),(38,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:26',2),(39,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:27',2),(40,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:31',2),(41,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:32',2),(42,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:34',2),(43,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:34',2),(44,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:35',2),(45,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:36',2),(46,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:15:45',2);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social`
--

DROP TABLE IF EXISTS `social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼ü£¬×ÔÔö',
  `userid` int(11) NOT NULL COMMENT '±»ÉêÇëÈËid',
  `friendid` int(11) NOT NULL COMMENT 'ÉêÇëÈËid',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'ÉêÇë¹ØÏµ×´Ì¬ 0:ÉêÇëÖÐ 1:Í¬Òâ 2:¾Ü¾ø 3:ÆÁ±Î',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ÐÞ¸ÄÊ±¼ä',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`friendid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='ºÃÓÑ¹ØÏµ±í';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social`
--

LOCK TABLES `social` WRITE;
/*!40000 ALTER TABLE `social` DISABLE KEYS */;
INSERT INTO `social` VALUES (32,10029,10015,1,'2020-09-22 02:57:54'),(34,10029,10026,1,'2020-09-22 06:09:12'),(35,10029,10025,2,'2020-09-22 06:09:25'),(36,10029,10023,3,'2020-09-22 06:09:43'),(37,10028,10029,1,'2020-09-22 06:39:50'),(38,10027,10029,0,'2020-09-22 07:33:06'),(39,10015,10024,2,'2020-09-22 15:10:16'),(40,10028,10015,0,'2020-09-26 11:13:01');
/*!40000 ALTER TABLE `social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialold`
--

DROP TABLE IF EXISTS `socialold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialold` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼ü£¬×ÔÔö',
  `userid` int(11) NOT NULL COMMENT 'ÓÃ»§id',
  `apply` varchar(2048) NOT NULL COMMENT 'ºÃÓÑÉêÇëÁÐ±í,ÓÃ¶ººÅ¸ô¿ªÈç 10001,10002',
  `agree` varchar(8192) NOT NULL COMMENT 'Í¬ÒâºÃÓÑÉêÇëÁÐ±í',
  `refuse` varchar(2048) NOT NULL COMMENT '¾Ü¾øºÃÓÑÉêÇëÁÐ±í',
  `block` varchar(2048) NOT NULL COMMENT 'ÆÁ±ÎºÃÓÑÉêÇëÁÐ±í',
  `blocked` varchar(2048) NOT NULL COMMENT '±»ÆÁ±ÎºÃÓÑÉêÇëÁÐ±í',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ÐÞ¸ÄÊ±¼ä',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='ºÃÓÑ¹ØÏµ±í';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialold`
--

LOCK TABLES `socialold` WRITE;
/*!40000 ALTER TABLE `socialold` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼ü£¬×ÔÔö',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'ÓÃ»§Ãû',
  `password` varchar(2024) NOT NULL COMMENT 'ÃÜÂë',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ÐÞ¸ÄÊ±¼ä',
  `avator` varchar(2024) NOT NULL COMMENT 'Í·Ïñ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10030 DEFAULT CHARSET=utf8 COMMENT='ÓÃ»§±í';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10015,'flz888','94f186bda48c0fecfa6fffcabe472776','2020-09-16 05:16:44','http://flz.mudan.com:8088/public/avator/2.jpg'),(10016,'f1','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:11:40','http://flz.mudan.com:8088/public/avator/1.jpg'),(10017,'f2','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:11:55','http://flz.mudan.com:8088/public/avator/2.jpg'),(10018,'f3','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:12:10','http://flz.mudan.com:8088/public/avator/3.jpg'),(10019,'f4','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:12:24','http://flz.mudan.com:8088/public/avator/4.jpg'),(10020,'f5','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:12:38','http://flz.mudan.com:8088/public/avator/5.jpg'),(10021,'f6','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:12:50','http://flz.mudan.com:8088/public/avator/6.jpg'),(10022,'f7','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:13:01','http://flz.mudan.com:8088/public/avator/7.jpg'),(10023,'f8','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:13:11','http://flz.mudan.com:8088/public/avator/8.jpg'),(10024,'f9','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:13:22','http://flz.mudan.com:8088/public/avator/9.jpg'),(10025,'f10','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:13:31','http://flz.mudan.com:8088/public/avator/10.jpg'),(10026,'f11','94f186bda48c0fecfa6fffcabe472776','2020-09-16 14:13:44','http://flz.mudan.com:8088/public/avator/11.jpg'),(10027,'f99','94f186bda48c0fecfa6fffcabe472776','2020-09-16 15:12:16','http://flz.mudan.com:8088/public/avator/8.jpg'),(10028,'p100','94f186bda48c0fecfa6fffcabe472776','2020-09-16 15:14:18','http://flz.mudan.com:8088/public/avator/1.jpg'),(10029,'flz123','94f186bda48c0fecfa6fffcabe472776','2020-09-17 15:11:04','http://flz.mudan.com:8088/public/avator/1.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-13 14:40:00
