-- MySQL dump 10.11
--
-- Host: localhost    Database: dwz_group
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) default NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (2,1,1,0,NULL),(2,30,2,1,NULL),(2,40,2,1,NULL),(2,84,2,1,NULL),(2,49,3,30,NULL),(2,39,3,30,NULL),(2,37,3,30,NULL),(2,36,3,30,NULL),(2,35,3,30,NULL),(2,34,3,30,NULL),(2,33,3,30,NULL),(2,32,3,30,NULL),(2,31,3,30,NULL),(2,50,3,40,NULL),(2,85,3,84,NULL),(2,86,3,84,NULL),(2,87,3,84,NULL),(1,1,1,0,NULL),(1,30,2,1,NULL),(1,40,2,1,NULL),(1,88,2,1,NULL),(1,49,3,30,NULL),(1,39,3,30,NULL),(1,37,3,30,NULL),(1,36,3,30,NULL),(1,35,3,30,NULL),(1,34,3,30,NULL),(1,33,3,30,NULL),(1,32,3,30,NULL),(1,31,3,30,NULL),(1,50,3,40,NULL),(1,89,3,88,NULL);
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_task`
--

DROP TABLE IF EXISTS `daily_task`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `daily_task` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT '工作日志表ID',
  `user_id` smallint(5) default NULL COMMENT '用户ID',
  `content` text COMMENT '日志内容',
  `task_date` date default NULL COMMENT '日期',
  `day_num` int(2) default NULL COMMENT '每周第n天1-7周一到周日',
  `create_time` int(10) unsigned default NULL,
  `update_time` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `daily_task`
--

LOCK TABLES `daily_task` WRITE;
/*!40000 ALTER TABLE `daily_task` DISABLE KEYS */;
INSERT INTO `daily_task` VALUES (3,3,'DWZ组件前端JS编码','2014-03-07',5,1394165878,1394256625),(4,2,'Hibernate+Spring+Struts2 + jUI整合应用\r\nMybatis + SpringMVC + jUI整合应用','2014-03-06',4,1394165905,1394256777),(6,4,'休假','2014-03-07',5,1394184221,1394256528),(7,4,'DWZ界面设计\r\n视觉设计','2014-03-03',1,1394256340,NULL),(8,4,'DWZ组件设计','2014-03-04',2,1394256383,NULL),(9,4,'DWZ组件结构定义\r\nDWZ组件操作行为定义','2014-03-05',3,1394256459,NULL),(10,4,'DWZ组件HTML结构\r\nDWZ组件CSS','2014-03-06',4,1394256502,NULL),(11,3,'DWZ组件前端JS编码','2014-03-03',1,1394256575,NULL),(12,3,'DWZ组件前端JS编码','2014-03-04',2,1394256587,NULL),(13,3,'DWZ组件前端JS编码','2014-03-05',3,1394256594,NULL),(14,3,'DWZ组件前端JS编码','2014-03-06',4,1394256610,NULL),(15,2,'DWZ组件前端JS编码','2014-03-03',1,1394256642,NULL),(16,2,'DWZ组件前端JS编码','2014-03-04',2,1394256665,NULL),(17,2,'DWZ组件前端JS编码','2014-03-05',3,1394256671,NULL),(18,2,'ThinkPHP + jUI整合应用\r\nZend Framework + jUI整合应用','2014-03-07',5,1394256819,NULL),(19,2,'PHP开发DWZ工作日志系统','2014-03-08',6,1394256889,NULL);
/*!40000 ALTER TABLE `daily_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `group` (
  `id` smallint(3) unsigned NOT NULL auto_increment,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `sort` smallint(3) unsigned NOT NULL default '0',
  `show` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (2,'App','应用中心',1222841259,0,1,0,0);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `node` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) default NULL,
  `status` tinyint(1) default '0',
  `remark` varchar(255) default NULL,
  `sort` smallint(6) unsigned default NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL default '0',
  `group_id` tinyint(3) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (49,'read','查看',1,'',NULL,30,3,0,0),(40,'Index','默认模块',1,'',0,1,2,0,0),(39,'index','列表',1,'',NULL,30,3,0,0),(37,'resume','恢复',1,'',NULL,30,3,0,0),(36,'forbid','禁用',1,'',NULL,30,3,0,0),(35,'foreverdelete','删除',1,'',NULL,30,3,0,0),(34,'update','更新',1,'',NULL,30,3,0,0),(33,'edit','编辑',1,'',NULL,30,3,0,0),(32,'insert','写入',1,'',NULL,30,3,0,0),(31,'add','新增',1,'',NULL,30,3,0,0),(30,'Public','公共模块',1,'',0,1,2,0,0),(7,'User','后台用户',1,'',4,1,2,0,2),(6,'Role','角色管理',1,'',3,1,2,0,2),(2,'Node','节点管理',1,'',2,1,2,0,2),(1,'Admin','后台管理',1,'',NULL,0,1,0,0),(50,'main','空白首页',1,'',NULL,40,3,0,0),(84,'DailyTask','工作日志',1,'每日工作日志',1,1,2,0,2),(85,'weeklyReport','小组周报',1,'小组全部成员周报汇总',NULL,84,3,0,0),(86,'monthlyReport','组员月报',1,'每个组员月报',NULL,84,3,0,0),(87,'weeksByYear','周列表',1,'列出一年全部周',NULL,84,3,0,0),(88,'SystemDB','数据库管理',1,'',0,1,2,0,0),(89,'backupDB','数据库备份',1,'',NULL,88,3,0,0);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `role` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) default NULL,
  `status` tinyint(1) unsigned default NULL,
  `remark` varchar(255) default NULL,
  `ename` varchar(5) default NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'组长',0,1,'','',1208784792,1393987762),(2,'组员',0,1,NULL,NULL,1208784792,1208784792);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned default NULL,
  `user_id` smallint(5) default NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (2,2),(2,3),(2,4),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `bind_account` varchar(50) NOT NULL,
  `last_login_time` int(11) unsigned default '0',
  `last_login_ip` varchar(40) default NULL,
  `login_count` mediumint(8) unsigned default '0',
  `verify` varchar(32) default NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) default '0',
  `type_id` tinyint(2) unsigned default '0',
  `info` text NOT NULL,
  `department` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','管理员','21232f297a57a5a743894a0e4a801fc3','',1394256162,'127.0.0.1',1,'8888','support@j-ui.com','备注信息',1222907803,1239977420,1,0,'',NULL),(2,'z','张慧华','e10adc3949ba59abbe56e057f20f883e','',1394256293,'127.0.0.1',1,NULL,'z@j-ui.com','',1393949054,1394166285,1,0,'','1'),(3,'w','吴平','e10adc3949ba59abbe56e057f20f883e','',1394200646,'127.0.0.1',0,NULL,'w@j-ui.com','',1393949111,1394160531,1,0,'','1'),(4,'d','杜权','e10adc3949ba59abbe56e057f20f883e','',1394173966,'127.0.0.1',0,NULL,'d@j-ui.com','',1394173790,0,1,0,'','1');
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

-- Dump completed on 2014-03-08  5:35:44
