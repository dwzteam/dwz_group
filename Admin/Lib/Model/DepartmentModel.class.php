<?php
// 配置类型模型
class DepartmentModel extends CommonModel {
	protected $_validate = array(
		array('name','require','名称必须'),
		);

}
?>