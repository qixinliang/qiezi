<?php
namespace app\library\Oauth;

class Wechat{
	protected $_appId		= '';
	protected $_appSecret	= '';

	public function __construct($appId,$appSecret){
		$this->_appId		= $appId;
		$this->_appSecret	= $appSecret;
	}

	public function getAuthCode($scope = 'snsapi_userinfo'){
	
	}

	/*
     * 获取用户授权
     */
    public function getAuthorizationUrl($redirectUri, $scope = 'snsapi_userinfo', $state = ''){
        $uri  = 'https://open.weixin.qq.com/connect/oauth2/authorize?';
        $uri .= 'appid=%s&redirect_uri=%s&response_type=code&scope=%s&state=%s#wechat_redirect';
        return sprintf($uri, $this->_appId, $redirectUri, $scope, $state);
    }
}
