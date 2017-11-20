<?php
namespace app\home\model;
use think\Model;

class Bookrack extends Model{

	public static function getRecord($rid,$bid){
		return self::get([
			'rid' => (int)$rid,
			'bid' => (int)$bid
		]);
	}
}
