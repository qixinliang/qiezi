<?php
/*
 * 用户控制器
 */
namespace app\home\controller;
use app\home\model\User   as UserModel;
use app\home\model\Ticket as TicketModel;
class User{
	public function recharge(){
		return view('recharge');	
	}

	//我的个人信息
	public function userinfo(){
		//用户登陆后，能知道他的openid
		$row = UserModel::get([
			'openid' => 1,
		]);
		if(!isset($row) || empty($row)){
			return json([
				'error_code' => -1,
				'error_msg'  => '用户未找到'
			]);
		}

		$ticket = TicketModel::get([
			'id' => $row->uid
		]);

		$bookTicket = 0;
		if(isset($ticket) && !empty($ticket)) {
			$bookTicket = $ticket->book_ticket;
		}

		return view('userinfo',[
			'user' => $row,
			'book_ticket' => $bookTicket
		]);
	}

	public function help(){
		return view('help');
	}
}
