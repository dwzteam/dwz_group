Ext.define('app.view.LogonForm', {
	extend: 'Ext.form.Panel',
	xtype: 'logonform',

	config: {
		fullscreen:true,
		items: [
			{
				xtype: 'toolbar',
				docked: 'top',
				items: [
					{ xtype: 'spacer' },
					{
						xtype: 'title',
						title: 'DWZ工作日志系统'
					},
					{ xtype: 'spacer' }
				]
			},

			{
				xtype: 'fieldset',
				title: 'User Logon',
				instructions: 'Please input username and password to Logon',
				items:[
					{
						name: 'username',
						xtype: 'textfield',
						label: 'Username',
						placeHolder: 'Username',
						required: true
					},
					{
						name: 'password',
						xtype: 'passwordfield',
						label: 'Password',
						placeHolder: 'Password',
						required: true
					},
					{
						name: 'appRemember',
						xtype: 'checkboxfield',
						label: 'Remember me',
						value: true
					}
				]
			},
			{
				id:'btn_logon',
				xtype: 'button',
				text: 'Logon',
				ui: 'action'
			}

		]
	}
});