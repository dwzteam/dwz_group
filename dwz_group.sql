# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.14)
# Database: dwz_group
# Generation Time: 2014-10-13 02:05:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access`;

CREATE TABLE `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;

INSERT INTO `access` (`role_id`, `node_id`, `level`, `pid`, `module`)
VALUES
	(2,1,1,0,NULL),
	(2,30,2,1,NULL),
	(2,40,2,1,NULL),
	(2,84,2,1,NULL),
	(2,49,3,30,NULL),
	(2,39,3,30,NULL),
	(2,37,3,30,NULL),
	(2,36,3,30,NULL),
	(2,35,3,30,NULL),
	(2,34,3,30,NULL),
	(2,33,3,30,NULL),
	(2,32,3,30,NULL),
	(2,31,3,30,NULL),
	(2,50,3,40,NULL),
	(2,85,3,84,NULL),
	(2,86,3,84,NULL),
	(2,87,3,84,NULL),
	(1,1,1,0,NULL),
	(1,84,2,1,NULL),
	(1,40,2,1,NULL),
	(1,30,2,1,NULL),
	(1,49,3,30,NULL),
	(1,39,3,30,NULL),
	(1,37,3,30,NULL),
	(1,36,3,30,NULL),
	(1,35,3,30,NULL),
	(1,34,3,30,NULL),
	(1,33,3,30,NULL),
	(1,32,3,30,NULL),
	(1,31,3,30,NULL),
	(1,50,3,40,NULL),
	(1,89,3,88,NULL),
	(1,88,2,1,NULL),
	(1,85,3,84,NULL),
	(1,86,3,84,NULL),
	(1,87,3,84,NULL),
	(1,90,3,84,NULL),
	(1,91,3,84,NULL);

/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table daily_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `daily_task`;

CREATE TABLE `daily_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作日志表ID',
  `user_id` smallint(5) DEFAULT NULL COMMENT '用户ID',
  `content` text COMMENT '日志内容',
  `task_date` date DEFAULT NULL COMMENT '日期',
  `day_num` int(2) DEFAULT NULL COMMENT '每周第n天1-7周一到周日',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `daily_task` WRITE;
/*!40000 ALTER TABLE `daily_task` DISABLE KEYS */;

INSERT INTO `daily_task` (`id`, `user_id`, `content`, `task_date`, `day_num`, `create_time`, `update_time`)
VALUES
	(3,3,'DWZ组件前端JS编码\r\n...','2014-03-07',5,1394165878,1395973374),
	(4,2,'1）Hibernate + Spring + Struts2 + jUI整合应用\r\n2）Mybatis + SpringMVC + Sitemesh + jUI整合应用','2014-03-06',4,1394165905,1395973145),
	(6,4,'休假','2014-03-07',5,1394184221,1394256528),
	(7,4,'1）DWZ界面设计\r\n2）视觉设计\r\n3）DWZ组件HTML结构定义','2014-03-03',1,1394256340,1395973276),
	(8,4,'DWZ组件设计\r\n...','2014-03-04',2,1394256383,1395973248),
	(9,4,'1）DWZ组件结构定义\r\n2）DWZ组件操作行为定义\r\n...','2014-03-05',3,1394256459,1395973329),
	(10,4,'1）DWZ组件HTML结构\r\n2）DWZ组件CSS\r\n...','2014-03-06',4,1394256502,1395973343),
	(11,3,'1）DWZ组件前端JS编码\r\n2）grid组件\r\n3）tree组件\r\n4）dialog组件\r\n5）DWZ 拖动事件\r\n6）combox组件','2014-03-03',1,1394256575,1395973286),
	(12,3,'DWZ组件前端JS编码\r\n...','2014-03-04',2,1394256587,1395973311),
	(13,3,'DWZ组件前端JS编码\r\n...','2014-03-05',3,1394256594,1395973357),
	(14,3,'DWZ组件前端JS编码\r\n...','2014-03-06',4,1394256610,1395973365),
	(15,2,'1）DWZ组件前端JS编码\r\n2）dwz.core.js\r\n3）Ajax表单提交、交互相关\r\n4）Ajax分页组件、局部刷新\r\n5）DWZ日历控件\r\n6）navTab组件\r\n7）alertMsg组件\r\n8）contextmenu右键菜单','2014-03-03',1,1394256642,1395973298),
	(16,2,'DWZ组件前端JS编码\r\n...','2014-03-04',2,1394256665,1395973404),
	(17,2,'DWZ组件前端JS编码\r\n...','2014-03-05',3,1394256671,1395973388),
	(18,2,'1）ThinkPHP + jUI整合应用\r\n2）Zend Framework + jUI整合应用','2014-03-07',5,1394256819,1395973170),
	(19,2,'PHP开发DWZ工作日志系统','2014-03-08',6,1394256889,1395138872),
	(20,2,'1）research C++ TinyXML parse an XML form string\r\n2）调整iQ-Energy App离线计算接口，把参数传递xmlPath改成xmlContent\r\n3）协助iQ-Energy App离线计算C++接口定义\r\n4）起草技术培训计划\r\n5）起草计算引擎技术支持计划','2014-05-31',6,1401509890,1401509897),
	(21,2,'#DWZ工作日志系统手机版\n1）服务端\n2）客户端','2014-08-31',7,1409454130,1409525926);

/*!40000 ALTER TABLE `daily_task` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;

INSERT INTO `group` (`id`, `name`, `title`, `create_time`, `update_time`, `status`, `sort`, `show`)
VALUES
	(2,'App','应用中心',1222841259,0,1,0,0);

/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;

INSERT INTO `node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`, `type`, `group_id`)
VALUES
	(49,'read','查看',1,'',NULL,30,3,0,0),
	(40,'Index','默认模块',1,'',0,1,2,0,0),
	(39,'index','列表',1,'',NULL,30,3,0,0),
	(37,'resume','恢复',1,'',NULL,30,3,0,0),
	(36,'forbid','禁用',1,'',NULL,30,3,0,0),
	(35,'foreverdelete','删除',1,'',NULL,30,3,0,0),
	(34,'update','更新',1,'',NULL,30,3,0,0),
	(33,'edit','编辑',1,'',NULL,30,3,0,0),
	(32,'insert','写入',1,'',NULL,30,3,0,0),
	(31,'add','新增',1,'',NULL,30,3,0,0),
	(30,'Public','公共模块',1,'',0,1,2,0,0),
	(7,'User','后台用户',1,'',4,1,2,0,2),
	(6,'Role','角色管理',1,'',3,1,2,0,2),
	(2,'Node','节点管理',1,'',2,1,2,0,2),
	(1,'Admin','后台管理',1,'',NULL,0,1,0,0),
	(50,'main','空白首页',1,'',NULL,40,3,0,0),
	(84,'DailyTask','工作日志',1,'每日工作日志',1,1,2,0,2),
	(85,'weeklyReport','小组周报',1,'小组全部成员周报汇总',NULL,84,3,0,0),
	(86,'monthlyReport','组员月报',1,'每个组员月报',NULL,84,3,0,0),
	(87,'weeksByYear','周列表',1,'列出一年全部周',NULL,84,3,0,0),
	(88,'SystemDB','数据库管理',1,'',0,1,2,0,0),
	(89,'backupDB','数据库备份',1,'',NULL,88,3,0,0),
	(90,'editWeekSummary','周总结编辑页面',1,'',NULL,84,3,0,0),
	(91,'updateWeekSummary','编辑周总结',1,'',NULL,84,3,0,0);

/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ename` varchar(5) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `name`, `pid`, `status`, `remark`, `ename`, `create_time`, `update_time`)
VALUES
	(1,'组长',0,1,'','',1208784792,1393987762),
	(2,'组员',0,1,NULL,NULL,1208784792,1208784792);

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` smallint(5) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;

INSERT INTO `role_user` (`role_id`, `user_id`)
VALUES
	(2,2),
	(2,3),
	(2,4),
	(1,2),
	(1,3),
	(1,4);

/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `bind_account` varchar(50) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT '',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `account`, `nickname`, `password`, `bind_account`, `last_login_time`, `last_login_ip`, `login_count`, `verify`, `email`, `qq`, `phone`, `create_time`, `update_time`, `status`, `type_id`, `info`, `department`)
VALUES
	(1,'admin','管理员','21232f297a57a5a743894a0e4a801fc3','',1409295634,'127.0.0.1',16,'8888','support@j-ui.com',NULL,'备注信息',1222907803,1239977420,1,0,'',NULL),
	(2,'z','张慧华','e10adc3949ba59abbe56e057f20f883e','',1409787273,'127.0.0.1',22,NULL,'z@j-ui.com','350863780','13621397091',1393949054,1413165671,1,0,'','1'),
	(3,'w','吴平','e10adc3949ba59abbe56e057f20f883e','',1394200646,'127.0.0.1',0,NULL,'w@j-ui.com','465046815','',1393949111,1394160531,1,0,'','1'),
	(4,'d','杜权','e10adc3949ba59abbe56e057f20f883e','',1394173966,'127.0.0.1',0,NULL,'d@j-ui.com','8560685','',1394173790,0,1,0,'','1');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table week_summary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `week_summary`;

CREATE TABLE `week_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '周总结ID',
  `department` varchar(50) DEFAULT NULL COMMENT '部门',
  `content` text COMMENT '日志内容',
  `week_date` date DEFAULT NULL COMMENT '每周一日期',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `week_summary` WRITE;
/*!40000 ALTER TABLE `week_summary` DISABLE KEYS */;

INSERT INTO `week_summary` (`id`, `department`, `content`, `week_date`, `create_time`, `update_time`)
VALUES
	(1,'1','1) test1\r\n2) test2\r\n3) test3','2014-03-31',1396319989,1396320020),
	(2,'1','DWZ jUI\r\nDWZ+Java\r\nDWZ+PHP','2014-03-03',1396320373,NULL);

/*!40000 ALTER TABLE `week_summary` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
