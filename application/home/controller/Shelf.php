<?php
/*
 * 书架
 */
namespace app\home\controller;
use \think\Request;
use app\home\model\Novel as NovelModel;
use app\home\model\Kind as KindModel;
use app\home\model\Author as AuthorModel;
use app\home\model\Chapter as ChapterModel;


class Shelf{
	public function index(){
		$shelf = NULL;	
		return view('index',['shelf' => $shelf]);
	}
}
