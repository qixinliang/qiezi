<?php
require_once('config.php');
require_once('functions.php');

$customerid = $settings['id'];			//商户ID
$sdcustomno = time() . createNonceStr();//商户流水号
$ordermoney = $settings['amount'];		//订单金额 单位分
$cardno		= "32";						//支付方式
$noticeurl	= $settings['notice_url'];  //后台通知地址
$backurl	= $settings['back_url'];    //跳转地址
$key		= $settings['key'];			//密钥

$signstr	= "customerid=".$customerid.
			"&sdcustomno=".$sdcustomno.
			"&orderAmount=".$ordermoney.
			"&cardno=".$cardno.
			"&noticeurl=".$noticeurl.
			"&backurl=".$backurl.$key;
//生成MD5签名 strtoupper
$sign = strtoupper(md5($signstr,false));
?>
<html>
	<head><title>支付</title></head>
	<body>
	<form name="form1" id="form1" action="http://api.yjcard.com/intf/wpay.html" method="post">

	<table border="1">
	<tr>
		<td align="right">商户号：</td>
		<td>
			<input name="customerid" type="text" value="<?php echo $customerid;?>" style="display:none">
		</td>
	</tr>

	<tr>
		<td align="right">商户流水号：</td>
		<td>
			<input name="sdcustomno" type="text" value="<?php echo $sdcustomno; ?>">
		</td>
	</tr>

	<tr>
		<td align="right">订单金额：</td>
		<td>
			<input name="orderAmount" type="text" value="<?php echo $ordermoney; ?>">
		</td>
	</tr>

	<tr>
		<td align="right">支付方式：</td>
		<td>
			<input name="cardno" type="text" value="<?php echo $cardno; ?>" style="display:none">
		</td>
	</tr>

	<tr>
		<td align="right">异步通知地址：</td>
		<td>
			<input name="noticeurl" type="text" value="<?php echo $noticeurl; ?>" style="display:none">
		</td>
	</tr>

	<tr>
		<td align="right">同步通知地址：</td>
		<td>
			<input name="backurl" type="text" value="<?php echo $backurl; ?>" style="display:none">
		</td>
	</tr>

	<tr>
		<td align="right">商户自定义：</td>
		<td>
			<input name="mark" type="text" value="<?php echo $mark; ?>" style="display:none">
		</td>
	</tr>

	<tr>
		<td align="right">MD5签名：</td>
		<td>
			<input name="sign" type="text" value="<?php echo $sign; ?>" style="display:none">
		</td>
	</tr>

	<tr>
		<td align="right"></td>
		<td>
			<input name="submit1" type="submit" value="提交支付">
		</td>
	</tr>
	</table>
	</form>
	</body>
</html>
