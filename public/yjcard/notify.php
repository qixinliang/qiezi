
<?php 
	echo "notify............\n";
//商户在网关上的订单状态，0为失败，1为成功
//http://localhost:8080/receive.php?state=1211&customerid=221sss&sd51no=2132&sdcustomno=sdfe122113&ordermoney=10&mark=1fe3f&sign=f3e1f651wef13sf1
$state=trim($_GET['state']);
//商户在网关上的ID
$customerid=trim($_GET['customerid']);

//订单流水号
$sd51no=trim($_GET['sd51no']);

//商户提交的订单流水号
$sdcustomno=trim($_GET['sdcustomno']);

//商户订单金额
$ordermoney=trim($_GET['ordermoney']);

//商户自定义原样返回
$mark=trim($_GET['mark']);

//提交过来的MD5签名
$sign=trim($_GET['sign']);

$resign=trim($_GET['resign']);

$des=trim($_GET['des']);

//商户在网关上的交易密钥，登录商户后台可自行查询修改
$key="******************************";

$signstr='customerid='.$customerid.'&sd51no='.$sd51no.'&sdcustomno='.$sdcustomno.'&mark='.$mark.'&key='.$key.'';
//验证MD5签名
$signtmp=strtoupper(md5($signstr,false));

$signstr2='sign='.$signtmp.'&customerid='.$customerid.'&ordermoney='.$ordermoney.'&sd51no='.$sd51no.'&state='.$state.'&key='.$key.'';

$signtmp2=strtoupper(md5($signstr2,false));

//MD5签名正确
if ($sign==$signtmp && $resign==$signtmp)
{

//检测到状态为成功
  if ($state==1)
  {

//商户业务数据成功处理
  }
    else
  {

//商户业务数据失败处理
  } 

//处理完后返回接收到标识为1
//只要商户接到通知，不管订单状态如何
//都只需要返回接收到标识为1
  echo "<result>1</result>";
}
  else
{

echo "customerid=".$customerid."&sd51no=".$sd51no."&sdcustomno=".$sdcustomno."&mark=".$mark."&key=".$key;
 
} 

?>
