
<?php

function createNonceStr($length = 16)
  { 
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $str = "";
    for ($i = 0; $i < $length; $i++) {
        $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
    }
    return $str;
  }



//商户ID
$customerid="15014926438050849";
//商户流水号
$sdcustomno= time() . createNonceStr();
//$sdcustomno="20090220123658271235";
//商户支付的订单金额 单位分
$ordermoney=1;
//支付方式
$cardno="32";
//后台通知地址，商户系统后台接收订单结果的地址
$noticeurl="http://w.jxyx.net/yjcard/notify.php";

$backurl="http://w.jxyx.net/yjcard/return.php";
//商户自定义
$mark="20090220123658271235";
//商户密钥，请登陆商户后台查询
$key="e6b85fe4574bebbace4ba3eccd4744b9";
//组合字符串
$signstr="customerid=".$customerid."&sdcustomno=".$sdcustomno."&orderAmount=".$ordermoney."&cardno=".$cardno."&noticeurl=".$noticeurl."&backurl=".$backurl.$key;
//生成MD5签名 strtoupper
$sign=strtoupper(md5($signstr,false));
?>
<html>
<head>
<title>支付测试</title>
</head>
<body>
<form name="form1" id="form1" action="http://api.yjcard.com/intf/wapwpay.html" method="post">


<table border="1">
<tr>
<td align="right">商户号：</td><td><input name="customerid" type="text" value="<?php echo $customerid;?>"></td>
</tr>
<tr>
<td align="right">商户流水号：</td><td><input name="sdcustomno" type="text" value="<?php echo $sdcustomno; ?>"></td>
</tr>
<tr>
<td align="right">订单金额：</td><td><input name="orderAmount" type="text" value="<?php echo $ordermoney; ?>"></td>
</tr>
<tr>
<td align="right">支付方式：</td><td><input name="cardno" type="text" value="<?php echo $cardno; ?>"></td>
</tr>
<tr>
<td align="right">后台通知地址：</td><td><input name="noticeurl" type="text" value="<?php echo $noticeurl; ?>"></td>
</tr>
<tr>
<td align="right">同步通知地址：</td><td><input name="backurl" type="text" value="<?php echo $backurl; ?>"></td>
</tr>
<tr>
<td align="right">商户自定义：</td><td><input name="mark" type="text" value="<?php echo $mark; ?>"></td>
</tr>
<tr>
<td align="right">MD5签名：</td><td><input name="sign" type="text" value="<?php echo $sign; ?>"></td>
</tr>
<tr>
<td align="right"></td><td><input name="submit1" type="submit" value="提交支付"></td>
</tr>
</table>
</form>
</body>
</html>


