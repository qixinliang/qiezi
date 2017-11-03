<?php
/*
 * 小说控制器
 */
namespace app\home\controller;
use \think\Request;
use app\home\model\Novel as NovelModel;
use app\home\model\Kind as KindModel;
use app\home\model\Author as AuthorModel;
use app\home\model\Chapter as ChapterModel;

class Novel{
	public function novelinfo(){
		$request = Request::instance();
		$p = $request->param();
		if(!isset($p['id']) || empty($p['id'])){
			//FIXME 返回特定响应／错误界面／抛异常？
			return -1;
		}
		$id = (int)$p['id'];
		$row = NovelModel::get($id);
		if(!isset($row) || empty($row)){
			return -1;	
		}

		//分类
		$kid = isset($row->kid)? $row->kid : 1;
		$k = KindModel::get($kid);
		$kind = isset($k->name)? $k->name : '都市';

		//作者
		$aid = isset($row->aid)? $row->aid : 1;
		$a = AuthorModel::get($aid); 
		$author = isset($a->name)? $a->name : '笔者';

		//状态,默认0-已完结，1-连载中
		$state = '已完结';
		if($row->state == 1){
			$state = '连载中';
		}

		$data = [
			'id'		=> isset($row->id)? $row->id : 1,				//小说id
			'name'		=> isset($row->name)? $row->name : '',			//小说名
			'intro'		=> isset($row->intro)? $row->intro : '',		//小说简介
			'surface'	=> isset($row->surface)? $row->surface : '',	//小说封面图
			'click'		=> isset($row->click)? $row->click : '',		//小说点击量
			'kind'		=> $kind,										//分类
			'author'	=> $author,										//作者
			'state'		=> $state,										//状态
		];
		return view('novelinfo',['data' => $data]);
	}

	public function show(){
		/*
		 * 请求参数 novel_id
		 */
		$request = Request::instance();
		$p = $request->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return -1;
		}
		$novelId = (int)$p['novel_id'];
		$id = isset($p['id'])? (int)$p['id'] : 1;
		$row = NovelModel::get($novelId);
		if(!isset($row) || empty($row)){
			return -1;
		}

		//书籍部分
		$novel = (isset($row) && !empty($row))? $row : NULL;

		//获取最近一次阅读,并更新缓存
		//此处可以参考sql目录中的bookrack，也就是阅读记录表。

		$lastRead = NULL;
		$data = [
			'last_read' => $lastRead,	
			'novel'     => $novel,
			'id'		=> $id //章节id
		];
		return view('show',['data' => $data]);
	}

	//根据小说id获取它所有的章节列表
	public function ajaxgetchapterlist(){
		$r = Request::instance();	
		$p = $r->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return -1;	
		}
		$nid = (int)$p['novel_id'];

		$rows = ChapterModel::all(['nid' => $nid]);
		return json_encode($rows);
	}

	//根据小说id，章节id获取具体的章节信息
	public function ajaxgetchapter(){
		$r = Request::instance();	
		$p = $r->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return -1;	
		}
		$nid = (int)$p['novel_id'];
		$cid = (int)$p['chapter_id'];
		
		$row = ChapterModel::get([
			'id'  => $cid,
			'nid' => $nid
		]);
		return json_encode($row);
	}
}
