/**
 * Created with JetBrains WebStorm.
 * User: zhanghuihua
 * Date: 13-4-15
 * Time: 下午4:57
 * To change this template use File | Settings | File Templates.
 */
Ext.define('app.view.About', {
	extend: 'Ext.Container',
	xtype: 'about',
	requires: [],
	config: {
		fullscreen: true,
		layout: 'fit',
		items:[
			{
				xtype: 'titlebar',
				docked: 'top',
				title: '功能介绍',
				items: [
					{
						xtype: 'button',
						ui: 'back',
						text:'返回',
						listeners:{
							tap: function(){window.location.hash = '#main'}
						}
					}
				]
			},
			{
				xtype: 'toolbar',
				docked: 'bottom',
				ui: 'light',
				items: [
					{ xtype: 'spacer' },
					{
						xtype: 'button',
						id: 'btn_logout',
						iconCls: 'time',
						text:'退出'
					}
				]
			}
		],
		scrollable:true,
		html:'<div style="padding:10px">\
				<h2>DWZ工作日志系统移动客户端 #buildNo#</h2>\
				<p>主要功能是可以清楚的看到一周，每人手上都有什么任务，方便合理安排和调整小组任务。</p>\
				<p>DWZ工作日志系统移动客户端主要是为了方便外出时身边没有电脑，也只可以使用智能手机写工作日志，并查看团队成员工作周报。\
				工作周报是系统自动汇总团队中每位成员每天的工作日志动态生成，无需管理人员花费核外的时间去总结整理，从而提高工作效率。</p>\
				<p>DWZ工作日志系统移动客户端是Web版的一个简化版本，Web版中组长可以修改组内其它成员的工作日志，移动客户端没有此功能。手机屏幕小主要也就写自己的工作日志和看周报。</p>\
				<p>&copy 2014 DWZ, All rights reserved. Powered by jui.org.</p>\
			</div>'
	}
});

