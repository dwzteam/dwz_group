set charset utf8;
CREATE TABLE `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) default NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','1','1','0','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','30','2','1','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','40','2','1','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','84','2','1','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','49','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','39','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','37','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','36','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','35','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','34','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','33','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','32','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','31','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','50','3','40','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','85','3','84','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','86','3','84','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('2','87','3','84','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','1','1','0','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','30','2','1','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','40','2','1','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','88','2','1','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','49','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','39','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','37','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','36','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','35','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','34','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','33','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','32','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','31','3','30','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','50','3','40','');
insert into `access`(`role_id`,`node_id`,`level`,`pid`,`module`) values('1','89','3','88','');
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
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('3','3','DWZ组件前端JS编码','2014-03-07','5','1394165878','1394256625');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('4','2','Hibernate+Spring+Struts2 + jUI整合应用
Mybatis + SpringMVC + jUI整合应用','2014-03-06','4','1394165905','1394256777');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('6','4','休假','2014-03-07','5','1394184221','1394256528');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('7','4','DWZ界面设计
视觉设计','2014-03-03','1','1394256340','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('8','4','DWZ组件设计','2014-03-04','2','1394256383','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('9','4','DWZ组件结构定义
DWZ组件操作行为定义','2014-03-05','3','1394256459','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('10','4','DWZ组件HTML结构
DWZ组件CSS','2014-03-06','4','1394256502','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('11','3','DWZ组件前端JS编码','2014-03-03','1','1394256575','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('12','3','DWZ组件前端JS编码','2014-03-04','2','1394256587','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('13','3','DWZ组件前端JS编码','2014-03-05','3','1394256594','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('14','3','DWZ组件前端JS编码','2014-03-06','4','1394256610','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('15','2','DWZ组件前端JS编码','2014-03-03','1','1394256642','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('16','2','DWZ组件前端JS编码','2014-03-04','2','1394256665','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('17','2','DWZ组件前端JS编码','2014-03-05','3','1394256671','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('18','2','ThinkPHP + jUI整合应用
Zend Framework + jUI整合应用','2014-03-07','5','1394256819','');
insert into `daily_task`(`id`,`user_id`,`content`,`task_date`,`day_num`,`create_time`,`update_time`) values('19','2','PHP开发DWZ工作日志系统','2014-03-08','6','1394256889','');
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
insert into `group`(`id`,`name`,`title`,`create_time`,`update_time`,`status`,`sort`,`show`) values('2','App','应用中心','1222841259','0','1','0','0');
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
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('49','read','查看','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('40','Index','默认模块','1','','0','1','2','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('39','index','列表','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('37','resume','恢复','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('36','forbid','禁用','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('35','foreverdelete','删除','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('34','update','更新','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('33','edit','编辑','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('32','insert','写入','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('31','add','新增','1','','','30','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('30','Public','公共模块','1','','0','1','2','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('7','User','后台用户','1','','4','1','2','0','2');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('6','Role','角色管理','1','','3','1','2','0','2');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('2','Node','节点管理','1','','2','1','2','0','2');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('1','Admin','后台管理','1','','','0','1','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('50','main','空白首页','1','','','40','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('84','DailyTask','工作日志','1','每日工作日志','1','1','2','0','2');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('85','weeklyReport','小组周报','1','小组全部成员周报汇总','','84','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('86','monthlyReport','组员月报','1','每个组员月报','','84','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('87','weeksByYear','周列表','1','列出一年全部周','','84','3','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('88','SystemDB','数据库管理','1','','0','1','2','0','0');
insert into `node`(`id`,`name`,`title`,`status`,`remark`,`sort`,`pid`,`level`,`type`,`group_id`) values('89','backupDB','数据库备份','1','','','88','3','0','0');
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
insert into `role`(`id`,`name`,`pid`,`status`,`remark`,`ename`,`create_time`,`update_time`) values('1','组长','0','1','','','1208784792','1393987762');
insert into `role`(`id`,`name`,`pid`,`status`,`remark`,`ename`,`create_time`,`update_time`) values('2','组员','0','1','','','1208784792','1208784792');
CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned default NULL,
  `user_id` smallint(5) default NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
insert into `role_user`(`role_id`,`user_id`) values('2','2');
insert into `role_user`(`role_id`,`user_id`) values('2','3');
insert into `role_user`(`role_id`,`user_id`) values('2','4');
insert into `role_user`(`role_id`,`user_id`) values('1','4');
insert into `role_user`(`role_id`,`user_id`) values('1','3');
insert into `role_user`(`role_id`,`user_id`) values('1','2');
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
insert into `user`(`id`,`account`,`nickname`,`password`,`bind_account`,`last_login_time`,`last_login_ip`,`login_count`,`verify`,`email`,`remark`,`create_time`,`update_time`,`status`,`type_id`,`info`,`department`) values('1','admin','管理员','21232f297a57a5a743894a0e4a801fc3','','1394361752','127.0.0.1','2','8888','support@j-ui.com','备注信息','1222907803','1239977420','1','0','','');
insert into `user`(`id`,`account`,`nickname`,`password`,`bind_account`,`last_login_time`,`last_login_ip`,`login_count`,`verify`,`email`,`remark`,`create_time`,`update_time`,`status`,`type_id`,`info`,`department`) values('2','z','张慧华','e10adc3949ba59abbe56e057f20f883e','','1394256293','127.0.0.1','1','','z@j-ui.com','','1393949054','1394166285','1','0','','1');
insert into `user`(`id`,`account`,`nickname`,`password`,`bind_account`,`last_login_time`,`last_login_ip`,`login_count`,`verify`,`email`,`remark`,`create_time`,`update_time`,`status`,`type_id`,`info`,`department`) values('3','w','吴平','e10adc3949ba59abbe56e057f20f883e','','1394200646','127.0.0.1','0','','w@j-ui.com','','1393949111','1394160531','1','0','','1');
insert into `user`(`id`,`account`,`nickname`,`password`,`bind_account`,`last_login_time`,`last_login_ip`,`login_count`,`verify`,`email`,`remark`,`create_time`,`update_time`,`status`,`type_id`,`info`,`department`) values('4','d','杜权','e10adc3949ba59abbe56e057f20f883e','','1394173966','127.0.0.1','0','','d@j-ui.com','','1394173790','0','1','0','','1');
