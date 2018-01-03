<?php
/*
 * 前台首页控制器
 */
namespace app\home\controller;
use think\Controller;
use \think\Request;
use \think\Config;
use \think\Db;
use app\home\model\Novel   as NovelModel;
use app\home\model\Kind    as KindModel;
use app\home\model\Author  as AuthorModel;
use app\home\model\Chapter as ChapterModel;
use app\home\model\Free    as FreeModel;
use app\library\Oauth\Wechat           as Wechat;

class Index extends Controller{

	//获取轮播数据
	protected function _getCarousel(){
		$nObj = new NovelModel();
		$rows = $nObj->where('is_carousel',1)->limit(6)->order('id','desc')->select();
		return $rows;
	}

	//获取主编推荐数据-9条
	protected function _getRecommend(){
		$nObj	= new NovelModel();
		$rows	= $nObj->where('is_recommend',1)->limit(9)->order('id','desc')->select();
		return $rows;
	}

	//获取热门小说，首页显示三部
	protected function _getHot(){
		$nObj = new NovelModel();	
		$rows = $nObj->where('is_hot',1)->limit(3)->order('id','desc')->select();
		return $rows;
	}

	//新书,5条数据，3个横排，2个竖排
	protected function _getNew(){
		$nObj = new NovelModel();
		$rows = $nObj->where('is_new',1)->limit(5)->order('id','desc')->select();
		return $rows;
	}

	//畅销书籍
	protected function _getPopular(){
		$nObj = new NovelModel();
		$rows = $nObj->where('is_popular',1)->limit(6)->order('id','desc')->select();
		return $rows;
	}
	
	//限免书籍
	protected function _getFree(){
		$sql = "
			SELECT  n.id,n.name title,n.kid,n.aid,n.surface,n.intro,a.name author FROM novel n
			JOIN free  f ON n.id = f.novel_id
			JOIN author a ON n.aid = a.id
			ORDER BY n.id desc
		";
		$ret = Db::query($sql);
		return $ret;
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

	//判断是否微信端打开
	public static function is_weixin(){
		if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
			return true;
		}
		return false;
	}

	public function index(){
		/*
		$isWx = static::is_weixin();
		if(!$isWx){
			return view('tip');
		}*/

		$appId = Config::get('wechat.app_id');
		$appSecret = Config::get('wechat.app_secret');
		$wechat = new Wechat($appId,$appSecret);
		$redirectUrl = 'http://w.jxyx.net/home/index/index';
		$scope = 'snsapi_userinfo';
		$state = 1;
		$result = $wechat->getAuthorizationUrl($redirectUrl,$scope,$state);
		$this->success('新增成功', $result);
		$this->redirect($result);
		var_dump($result);
		exit;












		//-轮播数据
		$carousels = $this->_getCarousel();

		//-主编推荐数据
		$rows = $this->_getRecommend();
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
		$rows = $this->_getHot();
		$hot  = $this->_assemble($rows);

		//新书推荐
		$rows = $this->_getNew();
		$new  = $this->_assemble($rows);

		//畅销书单
		$rows	 = $this->_getPopular();
		$popular = $this->_assemble($rows);

		//限时免费
		$freeEndTime = Config::get('free.end_time');
		$free = $this->_getFree();

		return view('index',[
			'carousels' => $carousels,
			'first'		=> $first,
			'second'	=> $second,
			'third'		=> $third,
			'hot'       => $hot,
			'new'		=> $new,
			'popular'   => $popular,
			'f_e_time'  => $freeEndTime,
			'free'      => $free,
		]);
	}

	public function ajaxsearch(){
		$r = Request::instance();	
		$p = $r->param();
		
		//搜索的关键字
		$q = (isset($p['q']) && !empty($p['q']))? $p['q'] : '';

		$sql = "
			SELECT n.id,n.name title,n.kid,n.aid,n.surface,n.intro,n.state,a.name author FROM novel n
			JOIN author a ON n.aid = a.id
			WHERE n.name LIKE '%$q%'
		";
		$rows = Db::query($sql);
		$ret  = [];
		if(isset($rows) && !empty($rows)){
			$count = count($rows);	
			$ret['status'] = 1;
			$ret['info']   = '数据获取成功';
			$header = "<div class=\"hot-box\">";
			$sum    = "<div class=\"title\">搜索“<i class=\"green\">$q</i>”结果，共<i class=\"green\">$count</i>条</div>";
			$body = '';
			foreach($rows as $r){
				$href = "/home/Novel/novelinfo/id/" . $r['id'];
				$surface = $r['surface'];
				$title = $r['title'];
				$left = '';
				$right = '';
				if(preg_match("/(.*)$q(.*)/",$title,$matches)){
					if(isset($matches[1]) && !empty($matches[1])){
						$left = $matches[1];
					}
					if(isset($matches[2]) && !empty($matches[2])){
						$right = $matches[2];
					}
				}

				$body .= "<div class=\"entry\">
				<div class=\"item\">
				<a href=\"$href\">
			<img src=\"$surface\" class=\"avatar\">
			<div class=\"body\">
				<span class=\"t\">$left<span class=\"orange\">$q</span>$right</span>
				<!--<span class=\"author\"></span>-->
				<span class=\"author\">完结</span>
				<span class=\"btn\">立即阅读</span>
				<p>$title</p>
			</div>
			</a>
		</div>
	</div>";
			}

			$footer = "</div>";
			$html  = $header . $sum . $body . $footer;
			$ret['data'] = $html;
			return json($ret);
		}else{
			$header = "<div class=\"title\">没有找到“<i class=\"green\">$q</i>”相关结果，看看下面这些是不是您要找的：</div>
			<div class=\"hot-box\">
			<div class=\"entry\">";
			;
			$rows = $this->getRandom();
			$body = '';
			foreach($rows as $r){
			    $href = "/home/Novel/novelinfo/id/" . $r['id'];
			    $surface = $r['surface'];
			    $title = $r['title'];
				$author = $r['author'];
				$intro = $r['intro'];
				$body .= "<div class=\"item\"><a href=\"$href\"><img src=\"$surface\" class=\"avatar\" /><div class=\"body\"><span class=\"t\">$title</span><!--<span class=\"author\">总经理秘书</span>--><span class=\"author\">完结</span><span class=\"btn\">立即阅读</span><p>$intro</p></div></a></div>";
			}
			$footer = "</div></div>";
			$html  = $header.$body.$footer;
			$ret = [
				'status' => 1,
				'info'	=> '获取成功',
				'data'	=> $html
			];
			return json($ret);
		}
	}

	//随机推荐
	protected function getRandom(){
		//由于目前书库书籍比较少，暂定$random为0
		$random = rand(0,9999);
		$random = 0;
		$sql = "
			SELECT n.id,n.name title,n.kid,n.aid,n.surface,n.intro,n.state,a.name author FROM novel n
			JOIN author a ON n.aid = a.id
			LIMIT $random,6
		";
		$rows = Db::query($sql);
		return $rows;
	}
	//暂定根据书名模糊搜索
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
