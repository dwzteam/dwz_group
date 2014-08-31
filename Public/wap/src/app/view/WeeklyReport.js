/**
 * Created with JetBrains WebStorm.
 * User: zhanghuihua
 * Date: 13-4-15
 * Time: 下午4:57
 * To change this template use File | Settings | File Templates.
 */
Ext.define('app.view.WeeklyReport', {
	extend: 'Ext.Container',
	xtype: 'weeklyreport',
	requires: [],
	config: {
		fullscreen: true,
		layout: 'fit',
		items:[
			{
				xtype: 'toolbar',
				docked: 'top',
				items: [
					{
						xtype: 'button',
						ui: 'back',
						text:'返回',
						listeners:{
							tap: function(){window.location.hash = '#main'}
						}
					},
					{ xtype: 'spacer' },
					{ xtype: 'title', title:'工作周报' },
					{ xtype: 'spacer' },
					{
						xtype: 'button',
						text:'写日志',
						listeners:{
							tap: function(){window.location.hash = '#dailytask'}
						}
					}
				]
			}
		],
		padding:5,
		scrollable:true,
		html:''
	}
});

