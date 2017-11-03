<?php
/*
 * 用户控制器
 */
namespace app\home\controller;
class User{
	public function recharge(){
		return view('recharge');	
	}

	//我的个人信息
	public function userinfo(){
		return view('userinfo');	
	}

	public function help(){
		return view('help');	
	}
}
