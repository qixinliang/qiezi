<?php
//微信登陆及授权
namespace app\home\controller;
use think\Controller;
use \think\Request;
use \think\Config;
use \think\Db;
use \think\Session;
use app\library\Oauth\WechatLib	as WechatLib;
use app\home\model\User			as UserModel;


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
			return json([
				'error_code' => -1,
				'error_msg'  => 'authentication error'
			]);
		}
		$code = $p['code'];
		$token = $this->wechatLib->getAccessToken($code);
		if(!isset($token) || empty($token)){
			return json([
				'error_code' => -1,
				'error_msg'  => 'get access token error'
			]);
		}

	    $userInfo = $this->wechatLib->getUserInfo($token['openid'], $token['access_token']);
		if(!isset($userInfo) || empty($userInfo)){
			return json([
				'error_code' => -1,
				'error_msg'  => 'get user information error'
			]);
	    }

		$user = UserModel::get(['openid' => $userInfo['openid']]);
		var_dump($user);
		//非首次登陆
		if(!empty($user)){
		
		}
		exit;
		//add user info
		$user = UserModel::create([
			'openid'	=> isset($userInfo['openid'])?	$userInfo['openid'] : '',
			'nickname'	=> isset($userInfo['nickname'])? $userInfo['nickname'] : '',
			'avatar'	=> isset($userInfo['headimgurl'])? $userInfo['headimgurl'] : ''
		]);

		Session::set('user_info',json_encode($userInfo));

		return $this->redirect('/home/Index/index');
	}
}
