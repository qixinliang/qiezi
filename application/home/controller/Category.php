<?php
/*
 * 分类控制器
 */
namespace app\home\controller;
use \think\Request;
use app\home\model\Novel as NovelModel;
use app\home\model\Kind as KindModel;
use app\home\model\Author as AuthorModel;
use app\home\model\Chapter as ChapterModel;

class Category{
	public function index(){

		//获取所有的分类列表数据
		$rows = KindModel::all();

		$kind = [];
		foreach($rows as $r){
			$temp = [
				'id'  => $r->id,
				'name' => $r->name
			];
			$kind[] = $temp;
		}
		return view('index',['kind' => $kind]);
	}

	public function ajaxGetNovelList(){
		$r = Request::instance();
		$p = $r->param();

		//传递过来的请求参数如下：
		//tid . 分类标识
		//vip . 免费／付费／vip
		//end . 连载／结束
		//p   . 页码，每页10条数据
		//sex . 男频，女频

		$where = array();
		if(isset($p['tid']) && !empty($p['tid'])){
			$where['kid'] = intval($p['tid']);
		}
		//vip此处暂时不做处理，后期再加
		//sex暂时不做处理
		if(isset($p['end']) && !empty($p['end'])){
			$where['state'] = intval($p['end']);
		}

		$limit = 10;
		if(isset($p['p']) && !empty($p['p'])){
			$offset = ($p['p'] - 1) * $limit;
			if($offset < 0){
				$offset = 0;	
			}

			//FIXME 这地方需要加一个对数据最大长度的判断，如果超过了最大长度，页面上下拉刷新会一直闪 
		}

		$novelObj = new NovelModel();

		// 查询数据集
		$rows = $novelObj->where($where)->limit($offset,$limit)->order('id', 'desc')->select();
		$ret = [];
		$ret['status'] = 1;
		$ret['info']   = '获取成功';


		$html = '';
		foreach($rows as $r){
			if(!isset($r->id)) continue;
			$href 		= "/home/Novel/novelinfo/id/$r->id";
	
			$surface    = isset($r->surface)? $r->surface : '';
            $title      = isset($r->name)? $r->name : '';

            $aid        = isset($r->aid)? $r->aid : 1;
            $a          = AuthorModel::get($aid);
            $author     = isset($a->name)? $a->name : '';
            $intro      = isset($r->intro)? $r->intro : '';
			$tHtml      = "<div class=\"item\"><a href=\"$href\"><img src=\"$surface\" class=\"avatar\"><div class=\"body\"><span class=\"t\">$title</span><span class=\"author\">$author</span><span class=\"btn\">立即阅读</span><p>$intro</p></div></a></div>";
			$html       .= $tHtml;
		}
		$ret['data'] = $html;
 		return json($ret);
	}
}
