<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2007 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

//公共函数
function toDate($time, $format = 'Y-m-d H:i:s') {
	if (empty ( $time )) {
		return '';
	}
	$format = str_replace ( '#', ':', $format );
	return date ($format, $time );
}

// 缓存文件
function cmssavecache($name = '', $fields = '') {
	$Model = D ( $name );
	$list = $Model->select ();
	$data = array ();
	foreach ( $list as $key => $val ) {
		if (empty ( $fields )) {
			$data [$val [$Model->getPk ()]] = $val;
		} else {
			// 获取需要的字段
			if (is_string ( $fields )) {
				$fields = explode ( ',', $fields );
			}
			if (count ( $fields ) == 1) {
				$data [$val [$Model->getPk ()]] = $val [$fields [0]];
			} else {
				foreach ( $fields as $field ) {
					$data [$val [$Model->getPk ()]] [] = $val [$field];
				}
			}
		}
	}
	$savefile = cmsgetcache ( $name );
	// 所有参数统一为大写
	$content = "<?php\nreturn " . var_export ( array_change_key_case ( $data, CASE_UPPER ), true ) . ";\n?>";
	file_put_contents ( $savefile, $content );
}

function cmsgetcache($name = '') {
	return DATA_PATH . '~' . strtolower ( $name ) . '.php';
}
function getStatus($status, $imageShow = true) {
	switch ($status) {
		case 0 :
			$showText = '禁用';
			$showImg = '<IMG SRC="' . __PUBLIC__ . '/Images/locked.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="禁用">';
			break;
		case 2 :
			$showText = '待审';
			$showImg = '<IMG SRC="' . __PUBLIC__ . '/Images/prected.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="待审">';
			break;
		case - 1 :
			$showText = '删除';
			$showImg = '<IMG SRC="' . __PUBLIC__ . '/Images/del.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="删除">';
			break;
		case 1 :
		default :
			$showText = '正常';
			$showImg = '<IMG SRC="' . __PUBLIC__ . '/Images/ok.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="正常">';

	}
	return ($imageShow === true) ?  $showImg  : $showText;

}
function getDefaultStyle($style) {
	if (empty ( $style )) {
		return 'blue';
	} else {
		return $style;
	}

}
function IP($ip = '', $file = 'UTFWry.dat') {
	$_ip = array ();
	if (isset ( $_ip [$ip] )) {
		return $_ip [$ip];
	} else {
		import ( "ORG.Net.IpLocation" );
		$iplocation = new IpLocation ( $file );
		$location = $iplocation->getlocation ( $ip );
		$_ip [$ip] = $location ['country'] . $location ['area'];
	}
	return $_ip [$ip];
}

function getNodeName($id) {
	if (Session::is_set ( 'nodeNameList' )) {
		$name = Session::get ( 'nodeNameList' );
		return $name [$id];
	}
	$Group = D ( "Node" );
	$list = $Group->getField ( 'id,name' );
	$name = $list [$id];
	Session::set ( 'nodeNameList', $list );
	return $name;
}

function get_pawn($pawn) {
	if ($pawn == 0)
		return "<span style='color:green'>没有</span>";
	else
		return "<span style='color:red'>有</span>";
}
function get_patent($patent) {
	if ($patent == 0)
		return "<span style='color:green'>没有</span>";
	else
		return "<span style='color:red'>有</span>";
}


function getNodeGroupName($id) {
	if (empty ( $id )) {
		return '未分组';
	}
	if (isset ( $_SESSION ['nodeGroupList'] )) {
		return $_SESSION ['nodeGroupList'] [$id];
	}
	$Group = D ( "Group" );
	$list = $Group->getField ( 'id,title' );
	$_SESSION ['nodeGroupList'] = $list;
	$name = $list [$id];
	return $name;
}

function getCardStatus($status) {
	switch ($status) {
		case 0 :
			$show = '未启用';
			break;
		case 1 :
			$show = '已启用';
			break;
		case 2 :
			$show = '使用中';
			break;
		case 3 :
			$show = '已禁用';
			break;
		case 4 :
			$show = '已作废';
			break;
	}
	return $show;

}

// zhanghuihua@msn.com
function showStatus($status, $id, $callback="") {
	switch ($status) {
		case 0 :
			$info = '<a href="__URL__/resume/id/' . $id . '/navTabId/__MODULE__" target="ajaxTodo" callback="'.$callback.'">恢复</a>';
			break;
		case 2 :
			$info = '<a href="__URL__/pass/id/' . $id . '/navTabId/__MODULE__" target="ajaxTodo" callback="'.$callback.'">批准</a>';
			break;
		case 1 :
			$info = '<a href="__URL__/forbid/id/' . $id . '/navTabId/__MODULE__" target="ajaxTodo" callback="'.$callback.'">禁用</a>';
			break;
		case - 1 :
			$info = '<a href="__URL__/recycle/id/' . $id . '/navTabId/__MODULE__" target="ajaxTodo" callback="'.$callback.'">还原</a>';
			break;
	}
	return $info;
}

/**
 +----------------------------------------------------------
 * 获取登录验证码 默认为4位数字
 +----------------------------------------------------------
 * @param string $fmode 文件名
 +----------------------------------------------------------
 * @return string
 +----------------------------------------------------------
 */
function build_verify($length = 4, $mode = 1) {
	return rand_string ( $length, $mode );
}


function getGroupName($id) {
	if ($id == 0) {
		return '无上级组';
	}
	if ($list = F ( 'groupName' )) {
		return $list [$id];
	}
	$dao = D ( "Role" );
	$list = $dao->select ( array ('field' => 'id,name' ) );
	foreach ( $list as $vo ) {
		$nameList [$vo ['id']] = $vo ['name'];
	}
	$name = $nameList [$id];
	F ( 'groupName', $nameList );
	return $name;
}
function sort_by($array, $keyname = null, $sortby = 'asc') {
	$myarray = $inarray = array ();
	# First store the keyvalues in a seperate array
	foreach ( $array as $i => $befree ) {
		$myarray [$i] = $array [$i] [$keyname];
	}
	# Sort the new array by
	switch ($sortby) {
		case 'asc' :
			# Sort an array and maintain index association...
			asort ( $myarray );
			break;
		case 'desc' :
		case 'arsort' :
			# Sort an array in reverse order and maintain index association
			arsort ( $myarray );
			break;
		case 'natcasesor' :
			# Sort an array using a case insensitive "natural order" algorithm
			natcasesort ( $myarray );
			break;
	}
	# Rebuild the old array
	foreach ( $myarray as $key => $befree ) {
		$inarray [] = $array [$key];
	}
	return $inarray;
}

/**
	 +----------------------------------------------------------
 * 产生随机字串，可用来自动生成密码
 * 默认长度6位 字母和数字混合 支持中文
	 +----------------------------------------------------------
 * @param string $len 长度
 * @param string $type 字串类型
 * 0 字母 1 数字 其它 混合
 * @param string $addChars 额外字符
	 +----------------------------------------------------------
 * @return string
	 +----------------------------------------------------------
 */
function rand_string($len = 6, $type = '', $addChars = '') {
	$str = '';
	switch ($type) {
		case 0 :
			$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' . $addChars;
			break;
		case 1 :
			$chars = str_repeat ( '0123456789', 3 );
			break;
		case 2 :
			$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . $addChars;
			break;
		case 3 :
			$chars = 'abcdefghijklmnopqrstuvwxyz' . $addChars;
			break;
		default :
			// 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数
			$chars = 'ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789' . $addChars;
			break;
	}
	if ($len > 10) { //位数过长重复字符串一定次数
		$chars = $type == 1 ? str_repeat ( $chars, $len ) : str_repeat ( $chars, 5 );
	}
	if ($type != 4) {
		$chars = str_shuffle ( $chars );
		$str = substr ( $chars, 0, $len );
	} else {
		// 中文随机字
		for($i = 0; $i < $len; $i ++) {
			$str .= msubstr ( $chars, floor ( mt_rand ( 0, mb_strlen ( $chars, 'utf-8' ) - 1 ) ), 1 );
		}
	}
	return $str;
}
function pwdHash($password, $type = 'md5') {
	return hash ( $type, $password );
}

/* zhanghuihua */
function percent_format($number, $decimals=0) {
	return number_format($number*100, $decimals).'%';
}
/**
 * 动态获取数据库信息
 * @param $tname 表名
 * @param $where 搜索条件
 * @param $order 排序条件 如："id desc";
 * @param $count 取前几条数据 
 */
function findList($tname,$where="", $order, $count){
	$m = M($tname);
	if(!empty($where)){
		$m->where($where);
	}
	if(!empty($order)){
		$m->order($order);
	}
	if($count>0){
		$m->limit($count);
	}
	return $m->select();
}
function findById($name,$id){
	$m = M($name);
	return $m->find($id);
}
function attrById($name, $attr, $id){
	$m = M($name);
	$a = $m->where('id='.$id)->getField($attr);
	return $a;
}
function moduleAccess($moduleName) {
    if ($_SESSION ['administrator']) return true;
    $Model = new Model();
    $list = $Model->query("select m.id,m.name,m.group_id,m.title from node a, node m where a.id = m.pid and a.status=1 and m.status=1 and a.name='".APP_NAME."' and m.name='".$moduleName."'");

    $accessList = $_SESSION ['_ACCESS_LIST'];
    foreach ( $list as $key => $module ) {
        if (isset ( $accessList [strtoupper ( APP_NAME )] [strtoupper ( $module ['name'] )] )) {
            return true;
        }
    }

    return false;
}
?>