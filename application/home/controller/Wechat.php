<?php
//微信登陆及授权
namespace app\home\controller;
use think\Controller;
use \think\Request;
use \think\Config;
use \think\Db;
use app\library\Oauth\Wechat           as Wechat;

//判断是否微信端打开
public static function is_weixin(){
	if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
		return true;
	}
	return false;
}

public function oauth(){
	$isWx = static::is_weixin();
	if(!$isWx){
		return view('tip');
	}
	$appId = Config::get('wechat.app_id');
	$appSecret = Config::get('wechat.app_secret');
	$wechat = new Wechat($appId,$appSecret);
	$redirectUrl = urlencode('http://w.jxyx.net/home/index/index');
	$scope = 'snsapi_userinfo';
	$state = 1;
	$ret = $wechat->getAuthorizationUrl($redirectUrl,$scope,$state);
	$this->success('授权成功', $ret);
	//$this->redirect($ret);
}
