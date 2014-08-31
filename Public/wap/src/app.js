/*
    This file is generated and updated by Sencha Cmd. You can edit this file as
    needed for your application, but these edits will have to be merged by
    Sencha Cmd when it performs code generation tasks such as generating new
    models, controllers or views and when running "sencha app upgrade".

    Ideally changes to this file would be limited and most work would be done
    in other places (such as Controllers). If Sencha Cmd cannot merge your
    changes and its generated code, it will produce a "merge conflict" that you
    will need to resolve manually.
*/

Ext.application({
    name: 'app',

	requires: [
//		'Ext.device.Camera',
//		'Ext.device.Device',
//		'Ext.Anim',
		'Ext.MessageBox',
		'Ext.Label',
		'Ext.TitleBar',
		'Ext.Toolbar',
		'Ext.Panel',
		'Ext.form.Panel',
		'Ext.form.FieldSet',
		'Ext.field.Number',
		'Ext.field.Spinner',
		'Ext.field.Password',
		'Ext.field.Email',
		'Ext.field.Url',
		'Ext.field.DatePicker',
		'Ext.field.Select',
		'Ext.field.Hidden',
		'Ext.field.Radio',
		'Ext.field.Slider',
		'Ext.field.Toggle',
		'Ext.field.Search',
		'Ext.List',
		'Ext.NavigationView',
		'Ext.XTemplate',
		'Ext.data.Model',
		'Ext.data.Store',
		'Ext.data.proxy.LocalStorage',
		'Ext.plugin.PullRefresh',
		'Ext.plugin.ListPaging'
	],

    views: [
        'Main',
		'LogonForm',
		'About',
		'DailyTask',
		'WeeklyReport'
    ],
	controllers: [
		'Main',
		'LogonForm',
		'About',
		'DailyTask',
		'WeeklyReport'
	],
	stores: [
		'DailyTaskStore'
	],

    icon: {
        '57': 'resources/icons/Icon.png',
        '72': 'resources/icons/Icon~ipad.png',
        '114': 'resources/icons/Icon@2x.png',
        '144': 'resources/icons/Icon~ipad@2x.png'
    },

    isIconPrecomposed: true,

    startupImage: {
        '320x460': 'resources/startup/320x460.jpg',
        '640x920': 'resources/startup/640x920.png',
        '768x1004': 'resources/startup/768x1004.png',
        '748x1024': 'resources/startup/748x1024.png',
        '1536x2008': 'resources/startup/1536x2008.png',
        '1496x2048': 'resources/startup/1496x2048.png'
    },

    launch: function() {
		Ext.override(Ext.plugin.PullRefresh, {
			onSnapBackEnd: function() {
				this.setState("pull");
				this.setIsSnappingBack(false);

				if (this.refreshFn) this.refreshFn.call(this);
			}
		});

		// Destroy the #appLoadingIndicator element
		Ext.fly('appLoadingIndicator').destroy();

		Ext.Ajax.on('beforerequest', function(connection,options){
			Ext.Viewport.setMasked({ xtype: 'loadmask' });
		});

		Ext.Ajax.on('requestcomplete', function(connection,options){
			Ext.Viewport.unmask();
		});

		Ext.Ajax.on('requestexception', function(connection,options){
			Ext.Viewport.unmask();
		});

        // Initialize the main view
        Ext.Viewport.add(Ext.create('app.view.Main'));
		Ext.Viewport.add(Ext.create('app.view.LogonForm'));
		Ext.Viewport.add(Ext.create('app.view.About'));
		Ext.Viewport.add(Ext.create('app.view.DailyTask'));
		Ext.Viewport.add(Ext.create('app.view.WeeklyReport'));
    },

    onUpdated: function() {
        Ext.Msg.confirm(
            "Application Update",
            "This application has just successfully been updated to the latest version. Reload now?",
            function(buttonId) {
                if (buttonId === 'yes') {
                    window.location.reload();
                }
            }
        );
    }
});


