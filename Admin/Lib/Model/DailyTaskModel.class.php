<?php
// 用户模型
class DailyTaskModel extends CommonModel {
    protected $tableName = 'daily_task';
    public $_validate	=	array(
		array('user_id','require','用户ID必须'),
        array('content','require','内容必须'),
		array('task_date','require','日期必须')
		);

	public $_auto		=	array(
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('update_time','time',self::MODEL_UPDATE,'function'),
		);

}
?>