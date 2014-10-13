Ext.define('app.view.Main', {
    extend: 'Ext.Container',
    xtype: 'main',
    requires: [
    ],
    config: {
		fullscreen: true,
		layout: 'fit',
		items:[
			{
				xtype: 'toolbar',
				docked: 'top',
				items: [
					{
						xtype: 'button',
						text: '周报',
						listeners:{
							tap: function(){window.location.hash = '#weeklyreport'}
						}
					},
					{ xtype: 'spacer' },
					{
						xtype: 'title',
						title: '我的日志'
					},
					{ xtype: 'spacer' },
					{
						xtype: 'button',
						text:'写日志',
						listeners:{
							tap: function(){window.location.hash = '#dailytask'}
						}
					}
				]
			},
			/*{
				xtype: 'toolbar',
				docked: 'top',
				ui: 'gray',
				items:[
					{
						xtype: 'searchfield',
						flex:1,
						id: 'searchKeywords',
						placeHolder:"搜索我的工作日志"
					}
				]
			},*/
			{
				xtype: 'toolbar',
				docked: 'bottom',
				ui: 'light',
				items: [
					{
						xtype: 'button',
						id: 'btn_about',
						iconCls: 'info',
						listeners:{
							tap: function(){window.location.hash = '#about'}
						}
					},
					{ xtype: 'spacer' },
					{
						xtype: 'title',
						id: 'sys_info',
						title: 'Work Offline'
					},
					{ xtype: 'spacer' },
					{
						xtype: 'button',
						id: 'btn_logout',
						iconCls: 'time',
						text:'Logout'
					}
				]
			},

			{
				xtype: 'list',
				id:'reportListBox',
				cls: 'reportListItem',
				itemTpl:
					'<h2>{task_date:date("Y-m-d")}</h2>' +
						'<pre>{content}</pre>',
				store : 'DailyTaskStore',
				emptyText : 'Currently there are no Item, please ADD!',
				scrollable: {
					direction: 'vertical'
				},
				onItemDisclosure:function(record,element,index,event){
					var item = record.getData();
					window.location.hash = '#dailytask/'+escape(item.id);
				},
				listeners:{
					itemtap: function(){return false;}
				},

				plugins: [
					{
						xclass: 'Ext.plugin.PullRefresh',
						pullRefreshText: 'Pull down for more new Items!',
						refreshFn: function () {
							Ext.getStore('DailyTaskStore').currentPage = 1;
						}
					},
					{
						xclass: 'Ext.plugin.ListPaging',
						loadMoreText: 'More...',
						noMoreRecordsText: 'No More Items',
						autoPaging: true,
						loadNextPage: function(){
							var store = Ext.getStore('DailyTaskStore');
							store.nextPage();
						}

					}
				]
			}
		]
    }
});
