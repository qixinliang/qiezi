<?php
/*
 * 分类控制器
 */
namespace app\home\controller;
use app\home\model\Kind as KindModel; 

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
} 
