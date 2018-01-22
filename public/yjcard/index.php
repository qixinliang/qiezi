<?php
    header("Content-type: text/html; charset=utf-8");

    require_once('config.php');
    require_once('functions.php');

    if (!empty($_POST['WIDout_trade_no'])&& trim($_POST['WIDout_trade_no'])!=""){

        $customerid = $settings['id'];           //商户ID
        $sdcustomno = $_POST['WIDout_trade_no']; //商户流水号
		$sdcustomno = time() . createNonceStr();//商户流水号
        $ordermoney = $settings['amount'];       //订单金额 单位分
        $cardno     = "32";                      //支付方式
        $noticeurl  = $settings['notice_url'];   //后台通知地址
        $backurl    = $settings['back_url'];     //跳转地址
        $key        = $settings['secret'];       //密钥

        $signstr    = "customerid=".$customerid.
                    "&sdcustomno=".$sdcustomno.
                    "&orderAmount=".$ordermoney.
                    "&cardno=".$cardno.
                    "&noticeurl=".$noticeurl.
                    "&backurl=".$backurl.$key;
        //生成MD5签名 strtoupper
        $sign = strtoupper(md5($signstr,false));
        var_dump($_POST);

        $pData = array(
            "customerid" => $customerid, 
            "sdcustomno" => $sdcustomno,
			"orderAmount"=> $ordermoney,
			"cardno"	 => $cardno,
			"noticeurl"  => $noticeurl,
			"backurl"	 => $backurl,
			"sign"       => $sign
        );
		$pData = http_build_query($pData);

		$gateway = "http://api.yjcard.com/intf/wpay.html";
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $gateway);
        curl_setopt($curl, CURLOPT_HEADER, 1);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_POST, 1);


        curl_setopt($curl, CURLOPT_POSTFIELDS, $pData);
		$data = curl_exec($curl);
		curl_close($curl);
		var_dump($data);
    }

?>
<!DOCTYPE html>
<html>
	<head>
	<title>支付接口</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<style>
		*{
			margin: 0;
			padding: 0;
		}
		ul,ol{
			list-style:none;
		}

		body{
        	font-family: "Helvetica Neue",Helvetica,Arial,"Lucida Grande",sans-serif;
    	}

    	.hidden{
    		display: none;
    	}

    	#btn-dd{
            margin: 20px;
            text-align: center;
        }

    	.new-btn-login-sp{
        	padding: 1px;
        	display: inline-block;
        	width: 40%;
    	}

    	.new-btn-login {
        	background-color: #02aaf1;
        	color: #FFFFFF;
        	font-weight: bold;
        	border: none;
        	width: 100%;
        	height: 30px;
        	border-radius: 5px;
        	font-size: 16px;
    	}

    	#main{
        	width:100%;
        	margin:0 auto;
        	font-size:14px;
    	}

    	.content{
    		margin-top: 5px;
    	}

    	.content dt{
        	width:100px;
        	display:inline-block;
        	float: left; 
        	margin-left: 20px;
        	color: #666;
        	font-size: 13px;
        	margin-top: 8px;
    	}

    	.content dd{
        	margin-left:120px;
        	margin-bottom:5px;
    	}

    	.content dd input {
        	width: 85%;
        	height: 28px;
        	border: 0;
        	-webkit-border-radius: 0;
        	-webkit-appearance: none;
    	}
    	.note-help {
        	color: #999999;
        	font-size: 12px;
        	line-height: 130%;
        	margin-top: 5px;
        	width: 100%;
        	display: block;
    	}
        .one_line{
            display: block;
            height: 1px;
            border: 0;
            border-top: 1px solid #eeeeee;
            width: 100%;
            margin-left: 20px;
        }

        .am-header {
            display: -webkit-box;
            display: -ms-flexbox;
            display: box;
            width: 100%;
            position: relative;
            padding: 7px 0;
            -webkit-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            background: #1D222D;
            height: 50px;
            text-align: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            box-pack: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            box-align: center;
        }
        .am-header h1 {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            box-flex: 1;
            line-height: 18px;
            text-align: center;
            font-size: 18px;
            font-weight: 300;
            color: #fff;
        }

	</style>
	</head>

    <body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
    <header class="am-header">
        <h1>支付接口</h1>
    </header>
	<div id="main">
        <form name=payment action='' method=post target="_blank">
            <div id="body" style="clear:left">
                <dl class="content">
                    <dt>商户订单号：</dt>
                    <dd>
                        <input id="WIDout_trade_no" name="WIDout_trade_no" />
                    </dd>
                    <hr class="one_line">

                    <dt>账号：</dt>
                    <dd>
                        <input id="WIDaccount" name="WIDaccount" />
                    </dd>
                    <hr class="one_line">

                    <dt>密码：</dt>
                    <dd>
                        <input id="WIDpassword" name="WIDpassword" />
                    </dd>
                    <hr class="one_line">

                    <dt>角色名：</dt>
                    <dd>
                        <input id="WIDname" name="WIDname" />
                    </dd>
                    <hr class="one_line">

                    <dt></dt>
                    <dd id="btn-dd">
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="submit" style="text-align:center;">确 认</button>
                        </span>
                        <span class="note-help">如果您点击“确认”按钮，即表示您同意该次的执行操作。</span>
                    </dd>
                </dl>
            </div>
		</form>
	</div>
</body>
<script language="javascript">
	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		document.getElementById("WIDout_trade_no").value =  sNow;
		document.getElementById("WIDaccount").value = "测试账号111";
		document.getElementById("WIDpassword").value = "123456";
        document.getElementById("WIDname").value = "测试角色111";
	}
	GetDateNow();
</script>
</html>
