<?php
namespace app\home\controller;
use think\Controller;

class Base extends Controller
{
	public static function is_weixin(){
		if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
			return true;
		}
		return false;
	}

    public function index(){
		$isWx = static::is_weixin();
		if(!$isWx){
			return view('tip');
		}
		//1.是否微信端，不是跳转
		//2.微信端检查用户的登录状态，已登录跳转首页
		//未登录，做授权处理，session记录用户信息、登录状态

    }
}
