DWZ框架 + ThinkPHP 实现小组工作日志系统

主要功能是可以清楚的看到一周，每人手上都有什么任务，方便合理安排和调整小组任务

Quick Start：

	1）安装部署：

		a）下载代码，Apahce PHP环境创建虚拟主机

		b）导入Mysql数据 mysql -u root -p dwz_group < dwz_group.sql

		c）打开dwz_group/Admin/Conf/config.php 配制数据库用户名和密码

		d）打开dwz_group/Admin/constants.inc.php 配制部门

	2）admin用户登入系统(默认密码admin)，创建用户，分配角色（系统默认有组员和组长2个角色，已经设置好权限，一般情况无需再创建新角色）

	3）用户登入，开始使用工作日志系统

jUI富客户端框架在线demo： http://j-ui.com/