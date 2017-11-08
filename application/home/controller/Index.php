<?php
/*
 * 前台首页控制器
 */
namespace app\home\controller;
use \think\Request;
use app\home\model\Novel as NovelModel;
use app\home\model\Author as AuthorModel;

class Index{

	//获取轮播数据
	protected function getCarousel(){
		$nObj = new NovelModel();
		$rows = $nObj->where('is_carousel',1)->limit(6)->order('id','desc')->select();
		return $rows;
	}
	public function index(){
		//-获取轮播数据
		$carousels = $this->getCarousel();
		return view('index',['carousels' => $carousels,]);
	}

	public function search(){
		return view('search');	
	}

	//猜你喜欢
	public function love(){
		if(!Request::instance()->isPost()){
			return json([
				'error_code' => -1,
				'error_msg'  => '请求方式错误'
			]);
		}
		if(Request::instance()->has('limit','post')){
			$p = Request::instance()->post('limit');

			//目前暂定从novel表里随机查询6条数据返回
			$nObj = new NovelModel();
			$rows = $nObj->limit(6)->order('id','desc')->select();

			$html = '';
			if(isset($rows) && !empty($rows)){
				foreach($rows as $row){
					$tHtml = "<li><a href=\"/home/Novel/novelinfo/id/$row->id\"><img src=\"$row->surface\"><p>$row->name</p></a></li>";
					$html .= $tHtml;
				}
				return json([
					'error_code' => 0,
					'error_msg' => '请求成功',
					'data' => $html,
				]);
			}
			return json([
				'error_code' => -1,
				'error_msg'  => '数据查询失败'
			]);
		}

		return json([
			'error_code' => -1,
			'error_msg'  => '参数错误'
		]);
	}
}
