Ext.define('app.controller.LogonForm', {
	extend: 'Ext.app.Controller',

	config: {
		refs: {
			logonform:'logonform',
			sys_info:'#sys_info',
			btn_logon:'#btn_logon',
			btn_logout:'#btn_logout'
		},
		control: {
			btn_logon:{tap:'onLogon'},
			btn_logout:{tap:'onLogout'}
		},
		routes: {
			'logonform': 'show'
		}
	},
	show:function(){
		console.log('Logon show...');

		Ext.Viewport.setActiveItem(this.getLogonform());
	},

	onLogon:function(button){
		console.log('Logon onLogon...');

		var form = this.getLogonform(),
			values = form.getValues();

		if (!values.username || !values.password) {
			Ext.Msg.alert("Validate Error", 'Username or Password is required.');
			return false;
		}

		var me = this;
		Ext.Ajax.request({
			url: SystemInfo.baseUrl[SystemInfo.ENV]+'/Wap/checkLogin',
			method: 'POST',
			params:{account: values.username, password: values.password, ajax:1},
			withCredentials: true,
			useDefaultXhrHeader: false,
			success: function(response, opts) {
				var responseText = response.responseText;
				var json = Ext.JSON.decode(responseText);
				console.log('Logon success:', responseText, json);

				if (json.status == 1) {
					UserInfo.username = values.username;
					UserInfo.password = values.password;
					UserInfo.isOnline = true;
					UserInfo.appRemember = values.appRemember;
					UserInfo.userId = json.user.id;
					UserInfo.nickname = json.user.nickname;
					UserInfo.department = json.user.department;

					try {
						localStorage.setItem('APP_USER_INFO', JSON.stringify(UserInfo));
					} catch(e){
						console.log('只有在用户自身开启non-private mode的情况下才可以正常使用Local Storage:'+JSON.stringify(UserInfo));
					}

					me.getSys_info().set('title', UserInfo.nickname);
					me.redirectTo('main');
				} else {
					Ext.Msg.alert('Logon Error', json.info);
				}
			},
			failure: function(response, opts) {
				console.log('Logon Error ' + response);
				Ext.Msg.alert('Logon Error', 'Server is not responding, Please check the network Settings.');
			}
		});
	},

	onLogout: function(button){
		console.log('Logon onLogout...');
		UserInfo.username = '';
		UserInfo.password = '';
		UserInfo.isOnline = false;
		UserInfo.isFsa = false;

		this.getSys_info().set('title', 'Work Offline');
		this.redirectTo('logonform');
	},


	launch: function(app) {
		console.log('LogonForm launch...');
		var strUserInfo = localStorage.getItem('APP_USER_INFO');
		console.log("strUserInfo: ", strUserInfo);
		if (strUserInfo) {
			var json = JSON.parse(strUserInfo);

			var $logonform = this.getLogonform();
			if (json.appRemember) {
				$logonform.down('field[name="username"]').set('value', json.username);
				$logonform.down('field[name="password"]').set('value', json.password);
				$logonform.down('field[name="appRemember"]').setChecked(true);
			}
		}

		if (!UserInfo.isOnline) {
			this.redirectTo('logonform');
		}
	}
});