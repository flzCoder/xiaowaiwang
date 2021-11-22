-- MySQL dump 10.13  Distrib 5.5.61, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: netease_news
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
-- Table structure for table `wap3g_comment`
--

DROP TABLE IF EXISTS `wap3g_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wap3g_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼ü£¬×ÔÔö',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'ÓÃ»§Ãû',
  `pic` varchar(2024) NOT NULL COMMENT 'Í¼Æ¬',
  `program` varchar(8192) NOT NULL COMMENT 'ÄÚÈÝ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ÐÞ¸ÄÊ±¼ä',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='¸úÌû±í';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wap3g_comment`
--

LOCK TABLES `wap3g_comment` WRITE;
/*!40000 ALTER TABLE `wap3g_comment` DISABLE KEYS */;
INSERT INTO `wap3g_comment` VALUES (20,'默认小王','','今天天气不错 风和日丽的','2020-09-02 14:53:14'),(21,'默认小王','','哈哈哈啊 搞定了','2020-09-02 14:54:14'),(22,'默认小王','','不错不错的','2020-09-02 15:13:43'),(23,'默认小王','','哈哈哈','2020-09-02 15:17:54'),(24,'默认小王','','哈哈哈','2020-09-02 15:18:06'),(25,'默认小王','','哈哈哈','2020-09-02 15:19:44'),(26,'默认小王','','哈哈哈哈哈哈哈哈\n','2020-09-02 15:20:46'),(27,'默认小王','','今天天气不错 风和日丽的','2020-09-02 15:21:48'),(28,'默认小王','','飒飒','2020-09-02 15:22:14'),(29,'默认小王','','奋斗的','2020-09-02 15:23:16'),(30,'默认小王','','发的发的','2020-09-02 15:24:05'),(31,'默认小王','','放大','2020-09-02 15:24:08'),(32,'默认小王','','11','2020-09-03 01:14:20');
/*!40000 ALTER TABLE `wap3g_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wap3g_news`
--

DROP TABLE IF EXISTS `wap3g_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wap3g_news` (
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
-- Dumping data for table `wap3g_news`
--

LOCK TABLES `wap3g_news` WRITE;
/*!40000 ALTER TABLE `wap3g_news` DISABLE KEYS */;
INSERT INTO `wap3g_news` VALUES (26,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 07:59:59',1),(27,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:48',1),(28,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:50',1),(29,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:50',1),(30,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:51',1),(31,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:51',1),(32,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:52',1),(33,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:52',1),(34,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:53',1),(35,'','今天天气不错','蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg','2020-08-23 08:00:53',1),(36,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:22',2),(37,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:24',2),(38,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:26',2),(39,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:27',2),(40,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:31',2),(41,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:32',2),(42,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:34',2),(43,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:34',2),(44,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:35',2),(45,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:03:36',2),(46,'','长三角一体化发展如何推进？习近平再次强调两个关键词','紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg','2020-08-24 02:15:45',2);
/*!40000 ALTER TABLE `wap3g_news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-03 10:46:37
