/**
 * Created with JetBrains WebStorm.
 * User: zhanghuihua
 * Date: 13-4-15
 * Time: 下午5:49
 * To change this template use File | Settings | File Templates.
 */
Ext.define('app.controller.About', {
	extend: 'Ext.app.Controller',

	config: {
		refs: {
			view:'about'
		},
		control: {
		},
		routes: {
			'about':'show'
		}
	},

	show:function(){

		Ext.Viewport.setActiveItem(this.getView());
	},
	onActivate: function() {
		console.log('About is active');
	},

	launch: function(){
		console.log('About launch...');
		var html = this.getView().getHtml().replace('#buildNo#', SystemInfo.buildNo);
		this.getView().setHtml(html);
	}
});