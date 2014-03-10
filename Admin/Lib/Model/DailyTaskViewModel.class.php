<?php
class DailyTaskViewModel extends ViewModel {

	public $viewFields = array( 
		'User'=>array('nickname'=>'nickname','email'=>'email','account'=>'account', 'department'=>'department'),
		'DailyTask'=>array('id', 'user_id', 'content','task_date','create_time','day_num',
            '_on'=>'User.id=DailyTask.user_id')
	);
}
?>