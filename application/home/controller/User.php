<?php
/*
 * 用户控制器
 */
namespace app\home\controller;
use \think\Session;
use app\home\model\User   as UserModel;
use app\home\model\Ticket as TicketModel;

class User{
	public function recharge(){
		return view('recharge');	
	}

	public function userinfo(){
		$session = Session::get('user_info');
	    $session = json_decode($session,true);
	    $uid  = $session['uid'];
	    $row = UserModel::get([
			'uid' => $uid,
	    ]);

		if(!isset($row) || empty($row)){
			return json([
				'error_code' => -1,
				'error_msg'  => '用户未找到'
			]);
		}

		$ticket = TicketModel::get([
			'id' => $uid
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
