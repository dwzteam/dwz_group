<?php
// 节点模型
class BranchModel extends CommonModel {
	protected $_validate	=	array(
		array('name','checkNode','节点已经存在',0,'callback'),
		);

	public function checkBranch() {
		$map['name']	 =	 $_POST['name'];
        $map['status'] = 1;
        if(!empty($_POST['id'])) {
			$map['id']	=	array('neq',$_POST['id']);
        }
		$result	=	$this->where($map)->field('id')->find();
        if($result) {
        	return false;
        }else{
			return true;
		}
	}
}
?>