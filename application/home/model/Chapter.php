<?php
namespace app\home\model;
use think\Model;

class Chapter extends Model{

	//获取所有目录
	public function getCatalog($nid){
		$ret = $this->where('novel_id', $nid)
			// ->limit(10)
		    ->order('chapter_id', 'asc')
			->select();
		return $ret;
	}

	public function getFirstChapter($nid){
		$ret = $this->where('novel_id',$nid)
			->limit(1)
			->order('chapter_id','asc')
			->select();
		return $ret;
	}
}
