<?php
// 后台用户模块
class UserAction extends CommonAction {
	function _filter(&$map){
		$map['id'] = array('egt',2);

		if (!empty($_POST['account'])) {
			$map['account'] = array('like',"%".$_POST['account']."%");
		}

		if (!empty($_POST['keywords'])) {
			$map['_string'] = 'phone like \'%'.$_POST['keywords'].'%\' or nickname like \''.$_POST['keywords'].'%\''
				.' or account like \''.$_POST['keywords'].'%\'';
		}
	}
	// 检查帐号
	public function checkAccount() {
        if(!preg_match('/^[a-z]\w{4,}$/i',$_POST['account'])) {
            $this->error( '用户名必须是字母，且5位以上！');
        }
		$User = M("User");
        // 检测用户名是否冲突
        $name  =  $_REQUEST['account'];
        $result  =  $User->getByAccount($name);
        if($result) {
        	$this->error('该用户名已经存在！');
        }else {
           	$this->success('该用户名可以使用！');
        }
    }
    
	// 插入数据
	public function insert() {
		// 创建数据对象
		$User	 =	 D("User");
		if(!$User->create()) {
			$this->error($User->getError());
		}else{
			// 写入帐号数据
			if($result	 =	 $User->add()) {
				$this->success('用户添加成功！');
			}else{
				$this->error('用户添加失败！');
			}
		}
	}

    //重置密码
    public function resetPwd()
    {
        //对表单提交处理进行处理或者增加非表单数据
        if(md5($_POST['verify'])	!= $_SESSION['verify']) {
            $this->error('验证码错误！');
        }

    	$id  =  $_POST['id'];
        $password = $_POST['password'];
        if(''== trim($password)) {
        	$this->error('密码不能为空！');
        }
        $User = M('User');
		$User->password	=	md5($password);
		$User->id			=	$id;
		$result	=	$User->save();
        if(false !== $result) {
            $this->success("密码修改为$password");
        }else {
        	$this->error('重置密码失败！');
        }
    }

    public function foreverdelete(){
        $name=$this->getActionName();
        $model = D ($name);
        if (! empty ( $model )) {
            $pk = $model->getPk ();
            $id = $_REQUEST [$pk];
            if (isset ( $id )) {

                D("Role")->delGroupUserByUser($id); // zhanghuihua20150519

                // check role_user
                if ($model->hasRole($id)){
                    $this->error ('删除失败,必须先删除此用户与角色的关联关系！');
                }
                // check daily_task
                if ($model->hasDailyTask($id)){
                    $this->error ('删除失败,必须先删除此用户相关的工作日志！');
                }

                $condition = array ($pk => array ('in', explode ( ',', $id ) ) );
                if (false !== $model->where ( $condition )->delete ()) {
                    //echo $model->getlastsql();
                    $this->success ('删除成功！');
                } else {
                    $this->error ('删除失败！');
                }
            } else {
                $this->error ( '非法操作' );
            }
        }
        $this->forward ();
    }


    public function role()
    {
        //读取系统的Role列表
        $role    =   D("Role");
        $roleWhere = 'status=1';
        if (!$_SESSION['administrator']) {
            $roleWhere .= ' and id<7';
        }
        $list2=$role->where($roleWhere)->field('id,name')->select();
        //echo $role->getlastsql();
        //dump(	$role);
        foreach ($list2 as $vo){
            $roleList[$vo['id']]	=	$vo['name'];
        }

        //获取当前用户组信息
        $userId =  isset($_GET['id'])?$_GET['id']:'';
        $groupRoleList = array();
        if(!empty($userId)) {
            $this->assign("selectUserId",$userId);
            //获取当前组的用户列表
            $user = D('User');
            $list	=	$user->getGroupUserList($userId);

            foreach ($list as $vo){
                $groupRoleList[$vo['id']]	=	$vo['id'];
            }

        }
        $this->assign('groupRoleList',$groupRoleList);
        $this->assign('roleList',$roleList);
        $this->display();

        return;
    }

    public function setRole()
    {
        $ids     = $_POST['groupRoleId'];
        $userId	=	$_POST['userId'];
        $user    =   D("User");
        $user->delGroupUser($userId);
        $result = $user->setGroupUsers($userId,$ids);
        if($result===false) {
            $this->error('授权失败！');
        }else {
            $this->success('授权成功！');
        }
    }
}
?>