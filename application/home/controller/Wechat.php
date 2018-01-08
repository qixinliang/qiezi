<?php
//微信登陆及授权
namespace app\home\controller;
use think\Controller;
use \think\Request;
use \think\Config;
use \think\Db;
use app\library\Oauth\WechatLib           as WechatLib;


class Wechat extends Controller{
	public $wechatLib = NULL;
	public function __construct(){
		$appId				= Config::get('wechat.app_id');
		$appSecret			= Config::get('wechat.app_secret');
		$this->wechatLib	= new WechatLib($appId,$appSecret);
	}
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
		$redirectUrl = urlencode('http://w.jxyx.net/home/Wechat/callback');
		$scope = 'snsapi_userinfo';
		$state = 1;
		$ret = $this->wechatLib->getAuthorizationUrl($redirectUrl,$scope,$state);
		$this->redirect($ret);
		//$this->success('授权成功', $ret);
	}

	public function callback(){
		$r = Request::instance();
		$p = $r->param();
		if(!isset($p['code']) || empty($p['code'])){
			throw new \Exception("authentication error");
		}
		$code = $p['code'];
		$token = $this->wechatLib->getAccessToken($code);
		var_dump($token);
	}
}
