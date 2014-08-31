/**
 * Created with JetBrains WebStorm.
 * User: zhanghuihua
 * Date: 13-4-15
 * Time: 下午5:49
 * To change this template use File | Settings | File Templates.
 */
Ext.define('app.controller.DailyTask', {
	extend: 'Ext.app.Controller',

	config: {
		refs: {
			view:'dailytask',
			btn_submit:'#btn_dailytask_submit',
			title_dailytask:'#title_dailytask',
			field_userId: 'dailytask field[name="user_id"]',
			field_taskDate: 'dailytask field[name="task_date"]',
			field_content: 'dailytask field[name="content"]'
		},
		control: {
			btn_submit:{tap:'onFormSubmit'}
		},
		routes: {
			'dailytask/:dailyTaskId':'show',
			'dailytask':'showByUser'
		}
	},

	_ajax:function(params){
		var me = this;
		Ext.Ajax.request({
			url: SystemInfo.baseUrl[SystemInfo.ENV]+'/Wap/edit',
			method: 'POST',
			params:params,
			withCredentials: true,
			useDefaultXhrHeader: false,
			success: function(response, opts) {
				var responseText = response.responseText,
					json = Ext.JSON.decode(responseText) || [];
				var taskDate = json.task_date && Ext.Date.parse(json.task_date, 'Y-m-d');

				console.log('DailyTask', json);

				me.getTitle_dailytask().setHtml(UserInfo.nickname);
				me.getField_userId().setValue(json.user_id);
				me.getField_taskDate().setValue(taskDate || new Date());
				me.getField_content().setValue(json.content);

			},
			failure: function(response, opts) {
				console.log('Ajax Error ' + response);
				Ext.Msg.alert('Ajax Error', 'Server is not responding, Please check the network Settings.');
			}
		});
	},
	show:function(dailyTaskId){
		console.log(' DailyTask show: ', dailyTaskId);

		this._ajax({id:dailyTaskId});
		Ext.Viewport.setActiveItem(this.getView());
	},
	showByUser:function(){
		console.log(' DailyTask showByUser: ');

		this._ajax({user_id:UserInfo.userId, task_date:Ext.Date.format(new Date(), 'Y-m-d')});
		Ext.Viewport.setActiveItem(this.getView());
	},
	onActivate: function() {
		console.log('DailyTask is active');
	},

	onFormSubmit:function(button){
		console.log('DailyTask onFormSubmit...');

		var form = this.getView();

		//get the form values
		var values = form.getValues();

		if (!values.task_date) {
			Ext.Msg.alert('Error','请选择日期');
			return false;
		}

		var me = this;
		Ext.Ajax.request({
			url: SystemInfo.baseUrl[SystemInfo.ENV]+'/Wap/update',
			method: 'POST',
			params:{user_id: values.user_id, task_date: Ext.Date.format(values.task_date, 'Y-m-d'), content: values.content, ajax:1},
			withCredentials: true,
			useDefaultXhrHeader: false,
			success: function(response, opts) {
				var responseText = response.responseText;
				var json = Ext.JSON.decode(responseText);
				console.log('Submit Done:', responseText, json);

				if (json.status == 1) {
					me.redirectTo('main');
				} else {
					Ext.Msg.alert('Submit Error', json.info);
				}
			},
			failure: function(response, opts) {
				console.log('Ajax Error ' + response);
				Ext.Msg.alert('Ajax Error', 'Server is not responding, Please check the network Settings.');
			}
		});

	},

	launch: function(){
		console.log('DailyTask launch...');
	}
});