/**
 * Created with JetBrains WebStorm.
 * User: zhanghuihua
 * Date: 13-4-15
 * Time: 下午5:49
 * To change this template use File | Settings | File Templates.
 */
Ext.define('app.controller.WeeklyReport', {
	extend: 'Ext.app.Controller',

	config: {
		refs: {
			view:'weeklyreport'
		},
		control: {
		},
		routes: {
			'weeklyreport/:weekMonday/:department':'show',
			'weeklyreport/:weekMonday':'show',
			'weeklyreport':'show'
		}
	},

	show:function(weekMonday, department){
		var me = this,
			params = {department: department||UserInfo.department};
		if (weekMonday) params.weekMonday = weekMonday;

		Ext.Ajax.request({
			url: SystemInfo.baseUrl[SystemInfo.ENV]+'/Wap/weeklyReport',
			method: 'POST',
			params:params,
			withCredentials: true,
			useDefaultXhrHeader: false,
			success: function(response, opts) {
				var html = response.responseText;
				console.log('Request Done:', html);

				me.getView().setHtml(html);
			},
			failure: function(response, opts) {
				console.log('Ajax Error ' + response);
				Ext.Msg.alert('Ajax Error', 'Server is not responding, Please check the network Settings.');
			}
		});

		Ext.Viewport.setActiveItem(this.getView());
	},
	onActivate: function() {
		console.log('WeeklyReport is active');
	},

	launch: function(){
	}
});