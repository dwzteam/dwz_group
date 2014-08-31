/**
 * Created by huihuazhang on 14-8-30.
 */
Ext.define('app.store.DailyTaskStore', {
	extend: 'Ext.data.Store',
	config: {
		fields:[
			{name:'nickname', type:'string'},
			{name:'email', type:'string'},
			{name:'account', type:'string'},
			{name:'department', type:'string'},
			{name:'id', type:'string'},
			{name:'user_id', type:'string'},
			{name:'content', type:'string'},
			{name:'task_date', type:'string'},
			{name:'create_time', type:'string'},
			{name:'day_num', type:'string'}

		],
		data:[],
		proxy: {
			type: "ajax",
			url : SystemInfo.baseUrl[SystemInfo.ENV]+'/Wap/index',
			method: "POST",
			reader: {
				type: "json",
				rootProperty: "data"
			}
		},
		autoLoad: false
	}
});