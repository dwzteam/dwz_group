/**
 * Created by huihuazhang on 14-8-31.
 */

var SystemInfo = {
	buildNo:'v1.0',
	ENV:'LIVE',
	baseUrl:{DEV:'../../../Admin/index.php', LIVE:'../../../Admin/index.php'},
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
