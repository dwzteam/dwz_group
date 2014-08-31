/**
 * Created by huihuazhang on 14-8-31.
 */

var SystemInfo = {
	buildNo:'v1.0',
	ENV:'DEV',
	baseUrl:{DEV:'/dwz_group/Admin/index.php', LIVE:'/Admin'},
	isWebApp:function(){ // Not Hybird App
		return !Ext.device || 'anonymous' == Ext.device.Device.uuid.toLowerCase();
	}
};

window.UserInfo = {
	username: '',
	password: '',
	isOnline: false,
	appRemember: false,

	userId:'',
	department:'',
	nickname:''
};
