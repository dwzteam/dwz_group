/**
 * Created with JetBrains WebStorm.
 * User: zhanghuihua
 * Date: 13-4-15
 * Time: 下午5:49
 * To change this template use File | Settings | File Templates.
 */
Ext.define('app.controller.Main', {
	extend: 'Ext.app.Controller',

	config: {
		refs: {
			main:'main'
		},
		control: {
			main: {
				activate: 'onActivate'
			}
		},
		routes: {
			'main':'show'
		}
	},
	init:function(){
		console.log('Main init...');
	},

	_reload:function(keywords){
		var store = Ext.getStore('DailyTaskStore');
		store.getProxy().setExtraParams({user_id:UserInfo.userId});
		store.loadPage(1);

//		Ext.Ajax.request({
//			url: SystemInfo.baseUrl[SystemInfo.ENV]+'/Wap/index',
//			method: 'POST',
//			params:{user_id:UserInfo.userId, pageNum:1, keywords:keywords, ajax:1},
//			withCredentials: true,
//			useDefaultXhrHeader: false,
//			success: function(response, opts) {
//				var responseText = response.responseText,
//					json = Ext.JSON.decode(responseText) || [];
//				console.log('DailyTask', json);
//
//				var store = Ext.getStore('DailyTaskStore');
//				store.setData(json.data);
//			},
//			failure: function(response, opts) {
//				console.log('Ajax Error ' + response);
//				Ext.Msg.alert('Ajax Error', 'Server is not responding, Please check the network Settings.');
//			}
//		});
	},

	show:function(){
		console.log('Main show...');

		Ext.Viewport.setActiveItem(this.getMain());
		this._reload();
	},
	onActivate: function() {
		console.log('Main onActivate...');
	},

	searchDailyTask: function(field, newValue, oldValue, eOpts ){
		if (newValue != oldValue) {
			this._reload(newValue);
		}
	},

	//called when the Application is launched, remove if not needed
	launch: function(app) {
		console.log('Main launch...');
	}
});