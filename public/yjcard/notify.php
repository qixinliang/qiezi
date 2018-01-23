<?php 
	require_once('config.php');
	require_once('db.php');
	error_log("notify+++\n");
	error_log(var_export($_GET,true));
//http://localhost:8080/receive.php?state=1211&customerid=221sss&sd51no=2132&sdcustomno=sdfe122113&ordermoney=10&mark=1fe3f&sign=f3e1f651wef13sf1
	$state		= trim($_GET['state']);      //商户在网关上的订单状态，0为失败，1为成功
	$customerid = trim($_GET['customerid']); //商户在网关上的ID
	$sd51no		= trim($_GET['sd51no']);     //订单流水号
	$sdcustomno = trim($_GET['sdcustomno']); //商户提交的订单流水号
	$ordermoney = trim($_GET['ordermoney']);//商户订单金额
	$mark		= trim($_GET['mark']);		//商户自定义原样返回
	$sign		= trim($_GET['sign']);      //提交过来的MD5签名
	$resign		= trim($_GET['resign']);
	$des		= trim($_GET['des']);
	$key		= "e6b85fe4574bebbace4ba3eccd4744b9";//密钥
	$signstr	= 'customerid='.$customerid.
		'&sd51no='.$sd51no.
		'&sdcustomno='.$sdcustomno.
		'&mark='.$mark.
		'&key='.$key.'';

	$signtmp	= strtoupper(md5($signstr,false));//验证MD5签名
	$signstr2	= 'sign='.$signtmp.
		'&customerid='.$customerid.
		'&ordermoney='.$ordermoney.
		'&sd51no='.$sd51no.
		'&state='.$state.
		'&key='.$key.'';

	$signtmp2 = strtoupper(md5($signstr2,false));

	//MD5签名正确
	if ($sign==$signtmp && $resign==$signtmp2){
		//检测到状态为成功

		//db...
		$dbms	= 'mysql';
		$host	= $database['host'];
		$dbName = $database['db'];
		$user	= $database['username'];
		$pass	= $database['password'];
		$dsn	= "$dbms:host=$host;dbname=$dbName";
		$dbh = db_init($dsn,$user,$pass);
		$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);    
		$dbh->exec('set names utf8');

		if ($state==1){
			//商户业务数据成功处理
			error_log("pay success+++");

			//修改订单状态为支付成功
			$sql = "UPDATE `order` SET `status`=:status,`update_time`=:update_time WHERE `order_no`=:order_no";
			$stmt = $dbh->prepare($sql);
			$stmt->execute(array(':order_no'=>$sdcustomno, ':status'=>2,':update_time'=>time()));    
			error_log($stmt->rowCount());

			$sql = "SELECT * FROM `order` WHERE `order_no` = :order_no";    
			$stmt = $dbh->prepare($sql);    
			$stmt->execute(array(':order_no' => $sdcustomno));
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
			error_log("row = ".var_export($row,true));


			//写入授权
			$account = isset($row['account'])? $row['account'] : '';
			$password = isset($row['password'])? $row['password'] : '';
			$name = isset($row['name'])? $row['name'] : '';

			$sql = "INSERT INTO `auth` (`account`, `password`, `name`, `create_time`)VALUES (:account, :password, :name, :create_time)"; 
			$stmt = $dbh->prepare($sql);
			$stmt->execute(
				array(
					':account'		=> $account,
					':password'		=> $password,
					':name'			=> $name,
					':create_time'	=> time(),
				)
			);
			error_log("auth table last insert id = ".$dbh->lastinsertid());
		}else{
			//商户业务数据失败处理
			//修改订单状态为支付失败
			$sql = "UPDATE `order` SET `status`=:status WHERE `order_no`=:order_no";    
			$stmt = $dbh->prepare($sql);
			$stmt->execute(array(':order_no'=>$sdcustomno, ':status'=>3));    
			error_log($stmt->rowCount());
		}

		//处理完后返回接收到标识为1
		//只要商户接到通知，不管订单状态如何
		//都只需要返回接收到标识为1
		 echo "<result>1</result>";
	}else{
		echo "customerid=".$customerid."&sd51no=".$sd51no."&sdcustomno=".$sdcustomno."&mark=".$mark."&key=".$key;
	} 
?>
