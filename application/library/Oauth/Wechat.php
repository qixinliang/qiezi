<?php
namespace Oauth;

class Wechat{
	protected $_appId		= '';
	protected $_appSecret	= '';

	public function __construct($appId,$appSecret){
		$this->_appId		= $appId;
		$this->_appSecret	= $appSecret;
	}

	public function getAuthCode($scope = 'snsapi_userinfo'){
	
	}
}
