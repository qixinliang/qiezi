<?php
/*
 * 书籍控制器
 */
namespace app\home\controller;
use \think\Request;
use \think\Db;
use app\home\model\Novel    as NovelModel;
use app\home\model\Kind     as KindModel;
use app\home\model\Author   as AuthorModel;
use app\home\model\Chapter  as ChapterModel;
use app\home\model\Bookrack as BookrackModel;

class Novel{
	public function novelinfo(){
		$request = Request::instance();
		$p = $request->param();
		if(!isset($p['id']) || empty($p['id'])){
			return json([
				'error_code' => -1,	
				'error_msg'  => '请求参数错误'
			]);
		}
		$id = (int)$p['id'];
		$row = NovelModel::get($id);
		if(!isset($row) || empty($row)){
			return json([
				'error_code' => -1,	
				'error_msg'  => '未获取到小说数据'
			]);
		}

		//分类
		$kid = isset($row->kid)? $row->kid : 1;
		$k = KindModel::get($kid);
		$kind = isset($k->name)? $k->name : '';

		//作者
		$aid = isset($row->aid)? $row->aid : 1;
		$a = AuthorModel::get($aid); 
		$author = isset($a->name)? $a->name : '';

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

	protected function _getChapter($nid,$cid){
		$sql = "SELECT c.* FROM chapter c WHERE chapter_id = $cid AND novel_id = $nid";
		$ret = Db::query($sql);
		return $ret;
	}

	protected function _getNovel($nid){
		//FIXME 这地方有可能有sql注入的风险,改成助手函数之类去实现
		$sql = "SELECT n.*,a.name author FROM novel n 
			JOIN author a ON n.aid = a.id
			WHERE n.id = $nid";
		$ret = Db::query($sql);
		return $ret;
	}
	public function show(){
		$request = Request::instance();
		$p = $request->param();
		if(!isset($p['novel_id']) || !isset($p['id'])){
			return json([
				'error_code' => -1,	
				'error_msg'  => '请求参数错误'
			]);
		}
		$novelId = (int)$p['novel_id'];
		$id		 = (int)$p['id'];
		$row     = $this->_getNovel($novelId);
		if(!isset($row) || empty($row)){
			return json([
				'error_code' => -1,	
				'error_msg'  => '书籍信息获取失败'
			]);
		}
		$chapter = $this->_getChapter($novelId,$id);


		//FIXME 收费章节的处理

		//获取最近一次阅读,并更新缓存
		//此处可以参考sql目录中的bookrack，也就是阅读记录表。

		//更新最近阅读记录
		//目前暂时还没有登录功能，所以读者id为1
		$rid = 1;
		//根据读者id，书籍id去查找表bookrack表的记录,如果没有则新建
		//如果有，则更新章节id
		$record = BookrackModel::getRecord($rid,$novelId); 
		if(!isset($record) || empty($record)){
			$bcObj = new BookrackModel();
			$bcObj->rid = $rid;
			$bcObj->bid = $novelId;
			$bcObj->cid = $id;
			$bcObj->create_time = time();
			$bcObj->update_time = time();
			$bcObj->save();
		}else{
			$record->cid = $id;
			$record->update_time = time();
			$record->save();
		}

		return view('show',[
			'novel' => $row,
			'chapter' => $chapter,
		]);
	}

	//根据小说id获取它所有的章节列表
	public function ajaxgetchapterlist(){
		$r = Request::instance();	
		$p = $r->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return -1;	
		}
		$nid = (int)$p['novel_id'];

		$rows = ChapterModel::all(['novel_id' => $nid]);
		return json_encode($rows);
	}

	//根据小说id，章节id获取具体的章节信息
	public function ajaxgetchapter(){
		$r = Request::instance();	
		$p = $r->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return json([
				'error_code' => -1,
				'error_msg'  => '请求参数错误'
			]);	
		}
		$nid = (int)$p['novel_id'];
		$cid = (int)$p['chapter_id'];
		
		$row = ChapterModel::get([
			'chapter_id'  => $cid,
			'novel_id' => $nid
		]);
		return json($row);
	}

	//异步获取目录
	public function ajaxGetCatalog(){
		if(!Request::instance()->isAjax()){
			return json([
				'status' => -1,	
				'info'   => 'Request method error'
			]);
		}
		$p = Request::instance()->param();
		/*
		 * 1. bid 
		 * 2. sort 1升序排列 0 降序
		 * 3. p 分页页码
		 * 4. cid当前正在阅读的章节id
		 */
		 $bid  = $p['bid'];
		 $sort = $p['sort'];
		 $page = $p['p'];
		 $cid  = $p['cid'];

		 $pageSize = 30;
		 $offset = ($page - 1) * $pageSize;
		 if($offset < 0){
			$offset = 0;
		 }

		 $chapterObj = new ChapterModel();
		 if($sort == 1){
			 $rows = $chapterObj->where('novel_id',$bid)
				->limit($offset,$pageSize)
				->order('chapter_id','asc')
				->select();
		}else{
			 $rows = $chapterObj->where('novel_id',$bid)
				->limit($offset,$pageSize)
				->order('chapter_id','desc')
				->select();
		}
		$result = [];
		$result['status'] = 1;
		$result['info'] = '获取成功';

		$html = '';
		foreach($rows as $r){
			$tempBid = $r->novel_id;
			$tempCid = $r->chapter_id;
			$href    = "/home/Novel/novelinfo/novel_id/$tempBid/id/$tempCid/";
			$title   = $r->chapter_no . ":" . $r->chapter_name;
			$free    = ($r->is_free == 1)? "免费" : "收费";
			$tHtml = "<li><a href=\"$href\" >$title<span class=\"pull-right\" style=\"color: #fdb977; font-size: 12px;\">$free<!--<i class=\"icon-down\"></i>--></span></a></li>";	
			$html .= $tHtml;
		}
		$result['data'] = [
			'html' => $html,
			'count' => count($rows),
			'to_page' => 2, //FIXME
		];

		return $result;
	}

	//目录
	public function cata(){
		$r = Request::instance();
		$p = $r->param();

		$cata = '';
		if(isset($p['novel_id']) && !empty($p['novel_id'])){
			$nid = (int)$p['novel_id'];
			$cata = (new ChapterModel())->getCatalog($nid);
		}
		return view('cata',['cata' => $cata]);
	}

	//最近阅读
	public function recent(){
		$recent = NULL;	
		return view('recent',['recent' => $recent]);
	}
}
