<?php
class BranchAction extends CommonAction {
	public function _filter(&$map)
	{
	}

	public function _before_index() {
	}

	// 获取配置类型
	public function _before_add() {
		$branch	=	M("Branch");
        $branch->getById($_GET['id']);
        $this->assign('id',$branch->id);
	}

    public function _before_patch() {
    }
	public function _before_edit() {
	}
    public function _before_delete() {
    }

    public function _before_foreverdelete() {
        $model = M ('DailyTask');
        $id = $_REQUEST ['id'];
        $where ['bid'] = $id;
        $info = $model->where ( $where )->select ();
        if ($info){
            $this->error('请先删除该业务下的周报');
        }
    }

    /**
     +----------------------------------------------------------
     * 默认排序操作
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     */
    public function sort()
    {
		$node = M('Branch');
        $map = array();
        $map['status'] = 1;
        $map['id']   = array('in',$_GET['sortId']);
        $sortList   =   $node->where($map)->order('sort asc')->select();
        $this->assign("sortList",$sortList);
        $this->display();
        return ;
    }
}
?>