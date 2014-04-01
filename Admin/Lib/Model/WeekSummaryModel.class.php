<?php
// 用户模型
class WeekSummaryModel extends CommonModel {
    protected $tableName = 'week_summary';
    public $_validate	=	array(
		array('user_id','require','用户ID必须'),
        array('content','require','内容必须'),
		array('week_date','require','日期必须')
	);

	public $_auto		=	array(
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('update_time','time',self::MODEL_UPDATE,'function')
	);

}
?>