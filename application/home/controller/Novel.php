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
		$r = Request::instance();
		$p = $r->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return json([
				'error_code' => -1,	
				'error_msg'  => '请求参数错误'
			]);
		}
		$rid = 1;
		$nid = (int)$p['novel_id'];
		$cid = (int)$p['id'];

		$row = $this->_getNovel($nid);
		if(!isset($row) || empty($row)){
			return json([
				'error_code' => -1,	
				'error_msg'  => '书籍信息获取失败'
			]);
		}
		$novel = $row[0];

		//从小说简介页进去的cid为0
		if($cid == 0){
			$record = BookrackModel::getRecord($rid,$nid);
			if(!isset($record) || empty($record)){
				//获取第一章数据开始阅读并记录
				$cObj = new ChapterModel();
				$chapter = $cObj->getFirstChapter($nid);
				if(!isset($chapter) || empty($chapter)){
					return json([
						'error_code' => -1,	
						'error_msg'  => '本章节数据为空'
					]);
				}
				$chapter = $chapter[0];

				$bcObj = new BookrackModel();
				$bcObj->rid = $rid;
				$bcObj->bid = $nid;
				$bcObj->cid = $chapter->chapter_id;
				$bcObj->create_time = time();
				$bcObj->update_time = time();
				$bcObj->save();

			}else{ //如果有说明已经阅读过,则获取最近一次的阅读记录并展示
				$latestCid = $record->cid;
				$chapter = $this->_getChapter($nid,$latestCid);
				if(!isset($chapter) || empty($chapter)){
					return json([
						'error_code' => -1,	
						'error_msg'  => '本章节数据为空'
					]);
				}
				$chapter = $chapter[0];
			}
		}else{ //上下翻页（章节），此时的章节id为外部传入的$p['id']
			$chapter = $this->_getChapter($nid,$cid);
			if(!isset($chapter) || empty($chapter)){
				return json([
					'error_code' => -1,	
					'error_msg'  => '章节数据为空'
				]);
			}

			$record = BookrackModel::getRecord($rid,$nid); 
			if(!isset($record) || empty($record)){
				$bcObj = new BookrackModel();
				$bcObj->rid = $rid;
				$bcObj->bid = $nid;
				$bcObj->cid = $cid;
				$bcObj->create_time = time();
				$bcObj->update_time = time();
				$bcObj->save();
			}else{
				$record->cid = $cid;
				$record->update_time = time();
				$record->save();
			}
		
		}
		//FIXME 收费章节的处理
		return view('show',[
			'novel' => $novel,
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
