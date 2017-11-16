<?php
/*
 * 限免控制器
 */
namespace app\home\controller;
use \think\Config;
use \think\Db;
use app\home\model\Novel   as NovelModel;
use app\home\model\Kind    as KindModel;
use app\home\model\Author  as AuthorModel;
use app\home\model\Chapter as ChapterModel;
use app\home\model\Free    as FreeModel;
class Free{
	public function index(){
		//后台需要有个设置的功能将平时收费的小说设置成限时免费
		$freeEndTime = Config::get('free.end_time');

		//1. 从限免表里检索书籍信息，另外前台会传递分页请求，sql需要做分页处理
		$sql = "
			SELECT  n.id,n.name title,n.kid,n.aid,n.surface,n.intro,a.name author FROM novel n
			JOIN free  f ON n.id = f.novel_id
			JOIN author a ON n.aid = a.id
			ORDER BY n.id desc
		";
		$ret = Db::query($sql);

		//2.如果当前时间超过了限免时间戳，删除限免表里的数据
		if(time() > strtotime($freeEndTime)){
			;
		}
		return view('index',['free_end_time' => $freeEndTime,'free' => $ret]);	
	}
}
