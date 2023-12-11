-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ssmtest
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `allege`
--

DROP TABLE IF EXISTS `allege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allege` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `allId` int NOT NULL,
  `email` varchar(80) NOT NULL,
  `allEmail` varchar(80) NOT NULL,
  `allReason` varchar(100) NOT NULL,
  `allText` varchar(400) NOT NULL,
  `allState` varchar(20) NOT NULL,
  `allTime` varchar(40) DEFAULT NULL,
  `dealText` varchar(255) DEFAULT NULL,
  `dealTime` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allege`
--

LOCK TABLES `allege` WRITE;
/*!40000 ALTER TABLE `allege` DISABLE KEYS */;
INSERT INTO `allege` VALUES (10,1,'1001@qq.com','2001@qq.com','工资未发','工资未发','已处理','2022-01-23 15:35:44','噢噢噢噢','2022-01-23 21:46'),(15,2,'1002@qq.com','2002@qq.com','工作时长太长','工作时长太长','未处理','2022-01-23 15:49','哈哈哈哈','2022-01-23 21:46'),(16,3,'1003@qq.com','2003@qq.com','时间不给协调','时间不给协调','未处理','2022-02-21 16:49','哦阔','2022-02-21 21:46'),(17,4,'1001@qq.com','2003@qq.com','态度不好','态度不好','未处理','2022-04-22 16:49','啦啦啦啦','2022-04-22 15:35:44'),(18,1,'2001@qq.com','1001@qq.com','该同学工作态度散漫','工作不认真，偷懒','未处理','2022-05-08 00:12',NULL,NULL);
/*!40000 ALTER TABLE `allege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stuEmail` varchar(100) NOT NULL,
  `comEmail` varchar(40) NOT NULL,
  `jobName` varchar(40) NOT NULL,
  `stuState` varchar(40) DEFAULT NULL,
  `applyState` varchar(40) NOT NULL COMMENT '未处理0 通过1 未通过2 删除3 完成4',
  `applyId` varchar(40) NOT NULL,
  `applyTime` varchar(100) NOT NULL,
  `stuGrade` varchar(40) DEFAULT NULL,
  `stuText` varchar(255) DEFAULT NULL,
  `comGrade` varchar(40) DEFAULT NULL,
  `comText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,'1001@qq.com','2001@qq.com','服务员','4','4','9','2022-03-31 23:21','9.0','工作认真负责，勤劳肯干',NULL,'还行'),(32,'1001@qq.com','2001@qq.com','服务员','4','4','1','2022-05-08 02:47',NULL,NULL,'5.0','该商家工作内容轻松'),(33,'1001@qq.com','2002@qq.com','促销导购','1','1','2','2022-05-08 03:43',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stuEmail` varchar(100) DEFAULT NULL,
  `comEmail` varchar(100) DEFAULT NULL,
  `resumeId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (5,'1001@qq.com',NULL,'1'),(6,'1001@qq.com',NULL,'4'),(9,'1001@qq.com',NULL,'8'),(10,'1001@qq.com',NULL,'2'),(15,'1002@qq.com',NULL,'3');
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `select_industry_hidden` varchar(100) DEFAULT NULL,
  `select_scale_hidden` varchar(100) DEFAULT NULL,
  `temptation` varchar(300) DEFAULT NULL,
  `principal` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'2001@qq.com','秦妈火锅店','www.shenzhen.com','扶绥汽车站附近','电子商务','15-50人','轻松','刘一','17878822787'),(2,'2002@qq.com','文具店','www.yunyue.com','广西资源管理学院附近','移动互联网,电子商务','少于15人','轻松','老二','17878822788'),(3,'2003@qq.com','咖啡网吧','www.baidu.com','桂工分校门口','企业服务','少于15人','轻松','张三','17878822789'),(4,'2004@qq.com','蜜雪冰城','www.daizi.com','扶绥县城','移动互联网,社交','15-50人','轻松','李四','17878822780'),(5,'2005@qq.com','烧烤吧','www.baidu.com','空港大厦','电子商务,文化艺术','50-150人','轻松','老五','17878822781'),(6,'2006@qq.com','小吃店','www.minjiang.com','扶绥109号','社交,企业服务','15-50人','轻松','老六','17878822782'),(7,'2007@qq.com','恒大有限公司','www.shanchui.com','扶绥','健康医疗,生活服务','150-500人','保安工作，150/天','老七','17878822783');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_email` varchar(50) NOT NULL,
  `to_email` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `msgDate` date NOT NULL,
  `msgStatus` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `jobType` varchar(100) NOT NULL,
  `jobName` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `number` varchar(100) DEFAULT NULL,
  `deRequest` varchar(1000) DEFAULT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `time` varchar(300) DEFAULT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (1,'2001@qq.com','热门兼职','服务员','空港大厦','10','身高170，男，勤劳肯干','2000-3000','下周五下午到晚上','轻松不累','有效'),(2,'2002@qq.com','热门兼职','促销导购','空港大厦','5','身高170，男，sssssssss','2000-3000','下周五下午到晚上','严重','有效'),(3,'2003@qq.com','跑腿办事','车票代购','空港大厦','100','身高170，男，sdsf','2000-3000','下周五下午到晚上','投影仪损坏非常严重','有效'),(4,'2004@qq.com','跑腿办事','宠物寄养','空港大厦','5','身高170，男，mmmmmm','2000-3000','下周五下午到晚上','投影仪损坏非常严重','有效'),(5,'2005@qq.com','热门兼职','打包分拣','空港大厦','90','身高170，男，sssssssss','2000-3000','下周五下午到晚上','轻松不累','有效'),(6,'2006@qq.com','简单易做','充场','空港大厦','50','身高170，男，sssssssss','2000-3000','下周五下午到晚上','投影仪损坏非常严重','下线'),(7,'2007@qq.com','演艺达人','演出','空港大厦','30','身高170，男，sssssssss','2000-3000','下周五下午到晚上','轻松不累','有效'),(8,'2008@qq.com','演艺达人','礼仪模特','空港大厦','10','身高170，男，mmmmmm','2000-3000','下周五下午到晚上','投影仪损坏非常严重','有效'),(9,'2009@qq.com','室内推荐','展会协助','空港大厦','1000','要强壮，会使用枪','120/天','下周五下午到晚上','灌灌灌灌灌过过过过过过过','有效'),(10,'2010@qq.com','简单易做','保洁','空港大厦','20','身高170，男，ssssssssss','2000-3000','下周五下午到晚上','轻松不累','有效'),(34,'2001@qq.com','演艺达人','跑腿','桂工分校','30','学习好','100/天','每周末','帮忙送饭','下线'),(35,'2001@qq.com','热门兼职','家教助教','扶绥未来城','1','本科学历，有教师资格证','80/小时','每晚18:00-20:00','帮孩子辅导作业','有效');
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuinfo`
--

DROP TABLE IF EXISTS `stuinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuinfo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `school` varchar(40) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `freeTime` varchar(100) DEFAULT NULL,
  `exJob` varchar(40) DEFAULT NULL,
  `beginYear` int DEFAULT NULL,
  `endYear` int DEFAULT NULL,
  `exSite` varchar(40) DEFAULT NULL,
  `introduce` varchar(1000) DEFAULT NULL,
  `upTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuinfo`
--

LOCK TABLES `stuinfo` WRITE;
/*!40000 ALTER TABLE `stuinfo` DISABLE KEYS */;
INSERT INTO `stuinfo` VALUES (1,'1001@qq.com','蓝一','男','18','171cm','60kg','桂林理工大学','大专','17878822771','每周五下午','服务员',2018,2021,'扶绥本地','勤劳肯干，有相关经验','2022-05-10 03:19'),(2,'1002@qq.com','蓝二','男','19','172cm','60kg','桂林理工大学','大专','17878822772','每周五下午','话务服务',2018,2021,'扶绥县城','为人老实，能干','2022-03-31 23:20'),(3,'1003@qq.com','蓝三','男','20','173cm','60kg','桂林理工大学','本科','17878822773','周三上午10点到12点','话务服务',2018,2022,'桂工分校附近','有客服经验','2022-06-19 09:47'),(4,'1004@qq.com','蓝四','女','21','174cm','60kg','桂林理工大学','本科','17878822774','周三上午10点到12点','演出',2018,2022,'未来城附近','喜欢表演','2022-04-16 11:18'),(5,'1005@qq.com','蓝五','女','22','175cm','60kg','桂林理工大学','博士','17878822775','每周五下午','话务服务',2018,2024,'外国语学院附近','肯干，赚钱','2022-04-16 14:45'),(6,'1006@qq.com','蓝六','女','23','176cm','60kg','桂林理工大学','硕士','17878822776','周三上午10点到12点','演出',2018,2022,'空港大厦','爱表演','2022-04-18 19:29'),(16,'00001@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2846683127@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'wtrwr@ertwr.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'110012@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stuinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@qq.com','admin','admin','有效'),(2,'1001@qq.com','zxcvbn','student','有效'),(3,'1002@qq.com','zxcvbn','student','有效'),(4,'1003@qq.com','zxcvbn','student','有效'),(5,'1004@qq.com','zxcvbn','student','有效'),(6,'1005@qq.com','zxcvbn','student','审核'),(7,'1006@qq.com','zxcvbn','student','锁定'),(8,'2001@qq.com','123456','company','有效'),(9,'2002@qq.com','123456','company','有效'),(10,'2003@qq.com','123456','company','有效'),(11,'2004@qq.com','123456','company','有效'),(12,'2005@qq.com','123456','company','有效'),(13,'2006@qq.com','123456','company','有效'),(14,'2007@qq.com','123456','company','有效'),(15,'2008@qq.com','123456','company','有效'),(16,'2009@qq.com','123456','company','锁定'),(17,'2010@qq.com','123456','company','删除'),(99,'00001@qq.com','zxcvbn','student','审核'),(100,'2846683127@qq.com','123456','student','审核'),(101,'wtrwr@ertwr.com','123456','student','审核'),(102,'220012@qq.com','123456','company','审核'),(103,'110012@qq.com','zxcvbn','student','审核');
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

-- Dump completed on 2022-05-15  6:43:23
