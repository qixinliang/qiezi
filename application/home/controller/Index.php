<?php
/*
 * 前台首页控制器
 */
namespace app\home\controller;

class Index{
	public function index(){
		return view('index');
	}

	public function search(){
		return view('search');	
	}
}
