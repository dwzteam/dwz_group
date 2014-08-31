Ext.define('app.view.DailyTask', {
	extend: 'Ext.form.Panel',
	xtype: 'dailytask',
	config: {
		items: [
			{
				xtype: 'toolbar',
				docked: 'top',
				defaults :{
					xtype:'button'
				},
				items:[
					{
						text: '返回',
						ui: 'back',
						listeners:{
							tap: function(){window.location.hash = '#main'}
						}
					},
					{ xtype: 'spacer' },
					{
						id:'title_dailytask',
						xtype: 'title',
						title: '我的工作日志'
					},
					{ xtype: 'spacer' },
					{
						id:'btn_dailytask_submit',
						xtype: 'button',
						text: '保存'
					}
				]
			},
			{
				xtype: 'fieldset',
				title: '编写工作日志',
				instructions: '注意：手动修改日期会覆盖相同日期的工作日志！',
				items:[
					{
						xtype: 'hiddenfield',
						name: 'user_id'
					},

					{
						name: 'task_date',
						xtype: 'datepickerfield',
						label: '日期',
						required: true,
						dateFormat: 'Y-m-d',
						picker: {
							yearFrom: new Date().getFullYear() - 1,
							yearTo: new Date().getFullYear()
						}
					},
					{
						name: 'content',
						xtype: 'textareafield',
						label: '内容',
						inputCls: 'smallText',
						height: 100,
						placeHolder: '内容：纯文本，一行写一个工作任务'
					}
				]
			}

		]
	}
});
