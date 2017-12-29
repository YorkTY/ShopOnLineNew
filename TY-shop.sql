-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'1051353960','管理员1','12345678'),(2,'11101212','管理员2','1100000'),(3,'12011212','管理员3','1200000');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `hot` tinyint(1) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK302BCFE1FC624EC` (`aid`),
  CONSTRAINT `FK302BCFE1FC624EC` FOREIGN KEY (`aid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'食品',1,2),(2,'饮料',1,2),(3,'水果',1,2),(4,'饰品1',1,2),(5,'饰品2',1,2),(6,'饰品3',1,2),(7,'衣服',1,2),(8,'电话',1,2),(9,'电脑',1,2),(10,'电器',1,2),(11,'鞋子',1,2),(12,'书',1,2),(15,'00',1,1),(16,'888',1,1),(17,'111',1,1),(18,'aabb',1,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forder`
--

DROP TABLE IF EXISTS `forder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB45FD6A83457B578` (`uid`),
  KEY `FKB45FD6A87342AEDD` (`sid`),
  CONSTRAINT `FKB45FD6A83457B578` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `FKB45FD6A87342AEDD` FOREIGN KEY (`sid`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forder`
--

LOCK TABLES `forder` WRITE;
/*!40000 ALTER TABLE `forder` DISABLE KEYS */;
INSERT INTO `forder` VALUES (55,'风一样的少年','','',300.00,'4325232','广州从化',4,1),(56,'风一样的少年','','',NULL,'4325232','广州从化',4,1),(64,'风一样的少年','111111','111111',10475.00,'4325232','广州从化',4,1),(65,'风一样的少年','','',10.00,'4325232','广州从化',4,1),(66,'风一样的少年','','',NULL,'4325232','广州从化',4,1),(67,'风一样的少年','','',12.00,'4325232','广州从化',4,1),(68,'风一样的少年','12','',300.00,'4325232','广州从化',4,1),(69,'风一样的少年','1222','11',310.00,'4325232','广州从化',4,1),(70,'风一样的少年00','13144729906','1111111111111',300.00,'4325232','广州从化',4,1);
/*!40000 ALTER TABLE `forder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `xremark` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `commend` tinyint(1) DEFAULT NULL,
  `open` tinyint(1) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKED8DCCEF5B374C99` (`cid`),
  CONSTRAINT `FKED8DCCEF5B374C99` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'蛋蛋蛋',10.00,'dan.jpg','好喝娃哈哈','好喝娃哈哈',NULL,1,1,1),(2,'好酒',300.00,'jiu.jpg','娃哈哈好酒','好喝娃哈哈',NULL,1,1,1),(3,'茅台',1000.00,'maotai.jpg','茅台娃哈哈','好喝娃哈哈',NULL,1,1,1),(4,'白酒',14.00,'jiu1.jpg','白酒粑粑','~~',NULL,1,1,1),(5,'sd',78.00,'tp8.jpg',NULL,NULL,NULL,1,1,2),(6,'qwe',8.00,'tp9.jpg',NULL,NULL,NULL,1,1,2),(7,'qwe',8.00,'tp10.jpg',NULL,NULL,NULL,1,1,2),(8,'qwe',8.00,'tp11.jpg',NULL,NULL,NULL,1,1,2),(9,'q',120.00,'tp14.jpg',NULL,NULL,NULL,1,1,3),(10,'w',12.00,'tp13.jpg',NULL,NULL,NULL,1,1,3),(11,'w',10475.00,'tp12.jpg',NULL,NULL,NULL,1,1,3),(12,'w',452.00,'tp16.jpg',NULL,NULL,NULL,1,1,4),(13,'d',7.00,'tp18.jpg',NULL,NULL,NULL,1,1,4),(14,'dd',8.00,'tp17.jpg',NULL,NULL,NULL,1,1,4),(15,'a',8.00,'tp19.jpg',NULL,NULL,NULL,1,1,5),(16,'asd',10.00,'tp20.jpg',NULL,NULL,NULL,1,1,5),(17,'qa',1.00,'tp21.jpg',NULL,NULL,NULL,1,1,5),(18,'c',1.00,'tp22.jpg',NULL,NULL,NULL,1,1,5),(19,'z',1.00,'tp22.jpg',NULL,NULL,NULL,1,1,6),(20,'z',1.00,'tp23.jpg',NULL,NULL,NULL,1,1,6),(21,'wweq',100.00,'tp24.jpg',NULL,NULL,NULL,1,1,6),(22,'衣服',10.00,'clothes.jpg','高端大气',NULL,NULL,1,1,7),(23,'衣服2',20.00,'clothes1.jpg','秀气',NULL,NULL,1,1,7),(24,'夹克',20.00,'clothes2.jpg','帅气',NULL,NULL,1,1,7),(25,'家居',2020.00,'jiaju1.jpg',NULL,NULL,NULL,1,1,8),(26,'沙发',44.00,'jiaju.jpg',NULL,NULL,NULL,1,1,8),(27,'联想电脑',444.00,'computer.jpg','联想电脑就是帅',NULL,NULL,1,1,9),(28,'天扬电脑',7777.00,'computerTY.jpg','天扬电脑无敌旗舰版',NULL,NULL,1,1,9),(29,'飞利浦',100.00,'dianqi.jpg','飞利浦好用又实在',NULL,NULL,1,1,10),(30,'摩飞电器',200.00,'dianqi1.jpg','魔飞电器好用又实在',NULL,NULL,1,1,10),(31,'nb鞋子',100.00,'nb.jpg','鞋子好看',NULL,NULL,1,1,11),(32,'nike',200.00,'nike.jpg','无敌鞋子',NULL,NULL,1,1,11),(33,'书书',10.00,'nb.jpg','书本',NULL,NULL,1,1,12),(34,'好看的书',20.00,'nike.jpg','图画书',NULL,NULL,1,1,12);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorder`
--

DROP TABLE IF EXISTS `sorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCA8ED6BB5CD484C6` (`fid`),
  KEY `FKCA8ED6BB53809FFD` (`pid`),
  CONSTRAINT `FKCA8ED6BB53809FFD` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `FKCA8ED6BB5CD484C6` FOREIGN KEY (`fid`) REFERENCES `forder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorder`
--

LOCK TABLES `sorder` WRITE;
/*!40000 ALTER TABLE `sorder` DISABLE KEYS */;
INSERT INTO `sorder` VALUES (35,'w',10475.00,1,11,64),(36,'蛋蛋蛋',10.00,1,1,65),(37,'w',12.00,1,10,67),(38,'好酒',300.00,1,2,68),(39,'蛋蛋蛋',10.00,1,1,69),(40,'好酒',300.00,1,2,69),(41,'好酒',300.00,1,2,70);
/*!40000 ALTER TABLE `sorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'已付款'),(2,'未付款'),(3,'待发货'),(4,'已收货');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `money` decimal(8,2) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'abc309','风000','4QrcOUm6Wau+VuBX8g+IPg==','男','13144729906','105@qq.com',390.00,'aaaaaaaaaaaaaa'),(5,'abc101',NULL,'aY1RoZ2KEhzlgUmde3AWaA==',NULL,NULL,NULL,NULL,NULL),(13,'ww88',NULL,'3LZMlOG4HNHNPrSnOtJ9mQ==',NULL,NULL,NULL,NULL,NULL),(14,'wwwww546',NULL,'3Ush6e9x4SkRg6RrkTrm8g==',NULL,NULL,NULL,NULL,NULL),(15,'wwwwwqq',NULL,'jdz/OoD0GJyhydTZAsPJCQ==',NULL,NULL,NULL,NULL,NULL),(16,'abc11111',NULL,'4QrcOUm6Wau+VuBX8g+IPg==',NULL,NULL,NULL,NULL,NULL),(17,'111',NULL,'4QrcOUm6Wau+VuBX8g+IPg==',NULL,NULL,NULL,NULL,NULL),(18,'sss',NULL,'rxXV/azV/f6jAOiKjiU+gg==',NULL,NULL,NULL,NULL,NULL),(19,'aas',NULL,'14XJnSmKTp5uE/6Z5gLvQg==',NULL,NULL,NULL,NULL,NULL),(20,'aaaaaaaaa',NULL,'4QrcOUm6Wau+VuBX8g+IPg==',NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2017-12-29  1:23:24
