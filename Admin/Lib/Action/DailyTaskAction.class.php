<?php
class DailyTaskAction extends CommonAction {
	//过滤查询字段
	function _filter(&$map){
        if (!empty($_POST['content'])) {
            $map['content'] = array('like',"%".$_POST['content']."%");
        }
        if (!empty($_POST['keywords'])) {
            $map['_string'] = 'content like \'%'.$_POST['keywords'].'%\' or nickname like \''.$_POST['keywords'].'%\''
                .' or account like \''.$_POST['keywords'].'%\'';
        }

        $startDate = $_POST['startDate'];
        $endDate = $_POST['endDate'];
        if (!empty($startDate) && !empty($endDate)){
            $map['task_date'] = array(array('egt', $startDate), array('elt', $endDate));
        } else if (!empty($startDate)) {
            $map['task_date'] = array('egt', $startDate);
        } else if (!empty($endDate)) {
            $map['task_date'] = array('elt', $endDate);
        }
    }

    public function index() {
        //列表过滤器，生成查询Map对象
        $map = $this->_search ('DailyTask');
        if (method_exists ( $this, '_filter' )) {
            $this->_filter ( $map );
        }
        $model = new DailyTaskViewModel();
        $this->_list($model, $map, 'task_date', false, 'DailyTask.id');

        $this->display();
    }

    function edit() {
        $name=$this->getActionName();
        $model = M ( $name );
        $id = $_REQUEST ['id'];
        if (isset($id)) {
            $vo = $model->getById ( $id );
        } else {
            $user_id = $_REQUEST ['user_id'];
            $task_date = $_REQUEST ['task_date'];
            $map = array ('user_id' => $user_id, 'task_date' => $task_date );
            $vo = $model->where ( $map )->find ();

            if (!isset($vo)){
                $vo = $map;
            }
        }

        $this->assign ( 'vo', $vo );
        $this->display ();
    }

    function update() {
        $user_id = $_REQUEST ['user_id'];
        $task_date = $_REQUEST ['task_date'];

        if (empty($user_id)) $this->error('用户ID必须');
        if (empty($task_date)) $this->error('Task日期必须');

        if (! D('User')->isSameDepartment($user_id)) {
            $this->error('不能修改其它部门工作日志');
        }

        $name=$this->getActionName();
        $model = D ( $name );

        $map = array ('user_id' => $user_id, 'task_date' => $task_date);
        $po = $model->where ( $map )->field ( 'id' )->find ();

        $_POST['day_num'] =  $this->dayNumByWeek($task_date);
        if (!isset($po)) { //添加数据
            if (false === $model->create ()) {
                $this->error ( $model->getError () );
            }
            $list = $model->add ();
        } else { // 更新数据
            $_POST ['id'] = $po['id'];

            if (false === $model->create ()) {
                $this->error ( $model->getError () );
            }

            $list = $model->save ();
        }

        if ($list !== false) { //保存成功
            $this->success ( '' );
        } else {
            //失败提示
            $this->error ( '编写工作日志失败!' );
        }
    }

	function editWeekSummary() {
		$name=$this->getActionName();
		$model = M ('WeekSummary');
		$department = $_REQUEST ['department'];
		$week_date = $_REQUEST ['week_date'];

		if (empty($department)) $this->error('部门必须');
		if (empty($week_date)) $this->error('WeekDate日期必须');
		$map = array ('department' => $department, 'week_date' => $week_date);
		$vo = $model->where($map)->find();
		if (!isset($vo)) {
			$vo = $map;
		}

		$this->assign ( 'vo', $vo );
		$this->display ();
	}
	function updateWeekSummary() {
		$department = $_REQUEST ['department'];
		$week_date = $_REQUEST ['week_date'];

		if (empty($department)) $this->error('部门必须');
		if (empty($week_date)) $this->error('WeekDate日期必须');

		$user_id = $_SESSION [C ( 'USER_AUTH_KEY' )];
		$user = M('User')->find($user_id);
		if (!isset($user) || $user['department'] != $department) {
			$this->error('不能修改其它部门工作日志总结');
		}

		$model = D ('WeekSummary');
		$map = array ('department' => $department, 'week_date' => $week_date);
		$po = $model->where ($map)->field ( 'id' )->find ();

		if (!isset($po)) { //添加数据
			if (false === $model->create ()) {
				$this->error ( $model->getError () );
			}
			$list = $model->add ();
		} else { // 更新数据
			$_POST ['id'] = $po['id'];

			if (false === $model->create ()) {
				$this->error ( $model->getError () );
			}

			$list = $model->save ();
		}

		if ($list !== false) { //保存成功
			$this->success ( '' );
		} else {
			//失败提示
			$this->error ( '编写工作日志失败!' );
		}
	}

    function weeklyReport(){
        $year = $_REQUEST['year'];
        if (!isset($year)) {
            $year = date('Y');
        }
        $weeks = $this->_allWeeksByYear($year);

        $weekMonday = $_REQUEST['weekMonday'];
        if (!isset($weekMonday)) {
            $weekMonday = $this->_getMonday();
        }

		$mondayTime = $this->parseDate($weekMonday);
		$lastMonday = mktime(0, 0, 0, date("m", $mondayTime) , date("d", $mondayTime)-7, date("Y", $mondayTime));
		$nextMonday = mktime(0, 0, 0, date("m", $mondayTime) , date("d", $mondayTime)+7, date("Y", $mondayTime));

        /*
         * array('head'=>array(),
         *      'body'=>array('Mon'=>item, 'Tue'=>item, 'Wed'=>item, 'Thu'=>item, 'Fri'=>item, 'Sat'=>item,'Sun'=>item))
         */
        $head = array(1=>array('sn'=>'Mon', 'name'=>'周一'),
            2=>array('sn'=>'Tue', 'name'=>'周二'),
            3=>array('sn'=>'Wed', 'name'=>'周三'),
            4=>array('sn'=>'Thu', 'name'=>'周四'),
            5=>array('sn'=>'Fri', 'name'=>'周五'),
            6=>array('sn'=>'Sat', 'name'=>'周六'),
            7=>array('sn'=>'Sun', 'name'=>'周日'));
        $data = array('head'=>array(), 'body'=>array());

        $monday = $this->parseDate($weekMonday);

        // table header
        foreach($head as $key => $value){
            $day = mktime(0, 0, 0, date("m", $monday) , date("d", $monday)+$key-1, date("Y", $monday));
            array_push($data['head'], $value['name'].' '.date('Y-m-d', $day));
        }

        // table body
        $department = $_REQUEST['department'];
        if (isset($department)){
            $userList = D('User')->getUserListByDepartment($department);
            foreach($userList as $user){ // 初始化部门中全部用户
                if (!isset($data['body'][$user[nickname]])){
                    $data['body'][$user[nickname]] = array('user_id'=>$user['id'], 'qq'=>$user['qq']);
                }
            }

            $map = $this-> _getWeekTerm($weekMonday);
            $map['department'] = $department;
            $model = new DailyTaskViewModel();
            $voList = $model->where($map)->order('User.account asc')->select();

			if (isset($voList)) {
				foreach($voList as $item){
					if (!isset($data['body'][$item[nickname]])){
						$data['body'][$item[nickname]] = array('user_id'=>$item['user_id']);
					}

					$weekSn = $head[$item['day_num']]['sn'];
					$data['body'][$item[nickname]][$weekSn] = $item;
				}
			}

			// week summary
			$weekSummaryMap = $this->_getWeekTerm($weekMonday, 'week_date');
			$weekSummaryMap['department'] = $department;
			$weekSummary = M('WeekSummary')->where($weekSummaryMap)->find();

			if (!isset($weekSummary)) {
				$weekSummary = array('department'=>$department, 'week_date'=>$weekMonday);
			}
			$this->assign('weekSummary', $weekSummary);
        }

        $this->assign ( 'year', $year );
        $this->assign ( 'weeks', $weeks);
		$this->assign('weekMonday', $weekMonday);
		$this->assign('lastMonday', $lastMonday);
		$this->assign('nextMonday', $nextMonday);
        $this->assign ( 'data', $data );
        $this->display ();
    }

    function weeksByYear(){
        $weeks = $this->_allWeeksByYear($_REQUEST['year']);

        $data = array();
        foreach($weeks as $week){
            $str_date = date('Y-m-d',$week['date']);
            array_push($data, array($str_date, '第'.$week['sn'].'周 '.$str_date));
        }
        exit(json_encode($data));
    }

    private function _allWeeksByYear($year){
        $firstDay = mktime(0, 0, 0, 1 , 1, $year); // H,i,s,n,j,Y
        $dayNumByYear = date('L', $firstDay) ? 366 : 365;  //是否为闰年	如果是闰年为 1，否则为 0

        $weeks = array();
        $weekSn = 1;
        for($dayIndex=0; $dayIndex<$dayNumByYear; $dayIndex++){
            $day = mktime(0, 0, 0, 1 , date("d", $firstDay)+$dayIndex, $year);

            if (date('w', $day) == 1){ // monday
                $weekMonday = array('sn'=>$weekSn, 'date'=>$day);
                array_push($weeks, $weekMonday);
                $weekSn++;
            }
        }

        return $weeks;
    }
    private function _getMonday(){
        $today = time();
        $dayInWeekNum = date('w', $today);

        $monday = null;
        if ($dayInWeekNum == 0) { // sunday
            $monday = mktime(0, 0, 0, date("m", $today) , date("d", $today)-6, date("Y", $today));
        } else {
            $monday = mktime(0, 0, 0, date("m", $today) , date("d", $today)-($dayInWeekNum-1), date("Y", $today));
        }
        return date('Y-m-d', $monday);
    }

    private function parseDate($strDate){
        $dateArray = date_parse($strDate);
        return mktime(0, 0, 0, $dateArray['month'] , $dateArray['day'], $dateArray['year']);
    }
    private function dayNumByWeek($strDate){
        $day = $this->parseDate($strDate);
        $dayNum = date('w', $day);
        return $dayNum == 0 ? 7 : $dayNum;
    }
    private function _getWeekTerm($weekMonday, $dateField='task_date'){
        $dateArray = date_parse($weekMonday);
        $sunday = mktime(0, 0, 0, $dateArray['month'] , $dateArray['day'] + 6, $dateArray['year']);
        $weekSunday = date('Y-m-d', $sunday);

        $map = array ();
        $map[$dateField] = array(array('egt', $weekMonday), array('elt', $weekSunday));

        return $map;
    }
}
?>