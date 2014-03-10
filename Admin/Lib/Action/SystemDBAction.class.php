<?php
class SystemDBAction extends CommonAction {
	
	/**
	 * 备份数据库
	 */
	public function backupDB() {
		
		$host = C ( 'DB_HOST' ) . (C ( 'DB_PORT' ) ? ":" . C ( 'DB_PORT' ) : '');
		$user = C ( 'DB_USER' );
		$password = C ( 'DB_PWD' );
		$dbname = C ( 'DB_NAME' );
		
		//连接mysql数据库
		if (! mysql_connect ( $host, $user, $password )) {
			$this->error ( '数据库连接失败' );
		}
		//是否存在该数据库
		if (! mysql_select_db ( $dbname )) {
			$this->error ( '不存在数据库:' . $dbname );
		}
		mysql_query ( "set names 'utf8'" );
		$mysql = "set charset utf8;\r\n";
		$q1 = mysql_query ( "show tables" );
		while ( $t = mysql_fetch_array ( $q1 ) ) {
			$table = $t [0];
			$q2 = mysql_query ( "show create table `$table`" );
			$sql = mysql_fetch_array ( $q2 );
			$mysql .= $sql ['Create Table'] . ";\r\n";
			$q3 = mysql_query ( "select * from `$table`" );
			while ( $data = mysql_fetch_assoc ( $q3 ) ) {
				$keys = array_keys ( $data );
				$keys = array_map ( 'addslashes', $keys );
				$keys = join ( '`,`', $keys );
				$keys = "`" . $keys . "`";
				$vals = array_values ( $data );
				$vals = array_map ( 'addslashes', $vals );
				$vals = join ( "','", $vals );
				$vals = "'" . $vals . "'";
				$mysql .= "insert into `$table`($keys) values($vals);\r\n";
			}
		}
		
		$dir = "../Public/mysql_bak";
		$filename =  $dbname . date ( 'Ymd' ) . ".sql";
        $path = $dir."/".$filename;

		if (!is_dir($dir)) {
        	if(!mkdir($dir)){// 尝试创建目录
				$this->error ( '无法目录'.$dir);
			}
		}
		$fp = fopen ( $path, 'w' );
		fputs ( $fp, $mysql );
		if (fclose ( $fp )){
            $this->success ( '数据备份成功<br><span style="color:red">'.$filename.'</span>' );
        }

        $this->error ( '文件存储失败: '.$path);
	}
}
?>