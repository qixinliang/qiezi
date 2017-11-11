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

	//获取主编推荐数据-9条
	protected function getRecommend(){
		$nObj	= new NovelModel();
		$rows	= $nObj->where('is_recommend',1)->limit(9)->order('id','desc')->select();
		return $rows;
	}

	//获取热门小说，首页显示三部
	protected function getHot(){
		$nObj = new NovelModel();	
		$rows = $nObj->where('is_hot',1)->limit(3)->order('id','desc')->select();
		return $rows;
	}

	//新书,5条数据，3个横排，2个竖排
	protected function getNew(){
		$nObj = new NovelModel();
		$rows = $nObj->where('is_new',1)->limit(5)->order('id','desc')->select();
		return $rows;
	}

	//畅销书籍
	protected function getPopular(){
		$nObj = new NovelModel();
		$rows = $nObj->where('is_popular',1)->limit(6)->order('id','desc')->select();
		return $rows;
	}

	//重组数据
	private function _assemble($rows){
		$output = [];
		foreach($rows as $r){
			$id			= isset($r->id)? $r->id : 1;
			$surface	= isset($r->surface)? $r->surface : '';
			$title		= isset($r->name)? $r->name : '';

			$aid		= isset($r->aid)? $r->aid : 1;
			$a			= AuthorModel::get($aid);
			$author		= isset($a->name)? $a->name : '';
			$intro		= isset($r->intro)? $r->intro : '';
			$tmp		= [
				'id'		=> $id,
				'surface'	=> $surface,
				'title'		=> $title,
				'author'	=> $author,
				'intro'		=> $intro
			];
			$output[] = $tmp;
		}
		return $output;
	}

	public function index(){
		//-轮播数据
		$carousels = $this->getCarousel();

		//-主编推荐数据
		$rows = $this->getRecommend();
		$first	= [];
		$second = [];
		$third	= [];
		foreach($rows as $k => $v){
			if($k % 3 == 0)	{
				$first[] = $v;
			}else if ($k % 3 == 1){
				$second[] = $v;
			}else{
				$third[] = $v;
			}
		}

		//热门小说
		$rows = $this->getHot();
		$hot  = $this->_assemble($rows);

		//新书推荐
		$rows = $this->getNew();
		$new  = $this->_assemble($rows);

		//畅销书单
		$rows	 = $this->getPopular();
		$popular = $this->_assemble($rows);

		return view('index',[
			'carousels' => $carousels,
			'first'		=> $first,
			'second'	=> $second,
			'third'		=> $third,
			'hot'       => $hot,
			'new'		=> $new,
			'popular'   => $popular,
		]);
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
