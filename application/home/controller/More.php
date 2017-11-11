<?php
/*
 * 热门
 */
namespace app\home\controller;
use \think\Request;
use app\home\model\Novel as NovelModel;
use app\home\model\Author as AuthorModel;

class More{
	//获取热门小说
	protected function getHot(){
		$nObj = new NovelModel();	
		$rows = $nObj->where('is_hot',1)->order('id','desc')->select();
		return $rows;
	}

	//新书，暂定is_new来查询，后期优化可以根据小说添加时间来查询。
	protected function getNew(){
		$nObj = new NovelModel();	
		$rows = $nObj->where('is_new',1)->order('id','desc')->select();
		return $rows;
	}

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

	public function remen(){
		$rows = $this->getHot();
		$hot  = $this->_assemble($rows);
		return view('remen',['hot' => $hot]);	
	}

	public function xinshu(){
		$rows = $this->getNew();	
		$new  = $this->_assemble($rows);
		return view('xinshu',['new' => $new]);	
	}
}
