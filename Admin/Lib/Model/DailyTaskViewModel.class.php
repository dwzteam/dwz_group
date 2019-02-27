<?php
class DailyTaskViewModel extends ViewModel {

	public $viewFields = array( 
		'User'=>array('nickname'=>'nickname','email'=>'email','account'=>'account', 'department'=>'department'),
		'DailyTask'=>array('id', 'user_id', 'content','task_date','create_time','day_num','bid','btmp_title',
            '_on'=>'User.id=DailyTask.user_id'),
        'Branch'=>array('id'=>'bid','username'=>'username','_on'=>'Branch.id=DailyTask.bid'),
	);
}
?>