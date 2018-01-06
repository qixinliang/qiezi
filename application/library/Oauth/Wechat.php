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

    /*
     * 获取 网页援权 access_token
     */
    public function getAccessToken($code){
        $_uri = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code';
        $uri = sprintf($_uri, $this->_appId, $this->_appSecret, $code);
        $r = static::request($uri);
        if($r['errno']){
            $this->_error = $r;
            return [];
        }
        $data = json_decode($r['data'], true);
        if(isset($data['errcode'])){
            $this->_error = $data;
            return [];
        }
        return $data;
    }

    /*
     * 获取用户信息
     */
    public function getUserInfo($openid, $access_token){
        $_uri = 'https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN';
        $uri = sprintf($_uri, $access_token, $openid);
        $r = static::request($uri);
        if($r['errno']){
            $this->_error = $r;
            return [];
        }
        $data = json_decode($r['data'], true);
        if(isset($data['errcode'])){
            $this->_error = $data;
            return [];
        }
        return $data;
    }

    /*
     * 检查用户openid是否正确
     */
    public function authOpenid($openid, $access_token){
        $_uri = 'https://api.weixin.qq.com/sns/auth?openid=%s&access_token=%s';
        $uri = sprintf($_uri, $openid, $access_token);
        $r = static::request($uri);
        if($r['errno']){
            $this->_error = $r;
            return false;
        }
        $data = json_decode($r['data'], true);

        if($data['errcode'] > 0){
            $this->_error = $data;
            return false;
        }
        return true;
    }

    public function getLastError(){
        return $this->_error;
    }


    protected static function request($uri, $data = null, $headers = [], $timeout = 1){
        $data = [
            'errno' => 0,
            'error' => '',
            'data'  => null
        ];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false); // 从证书中检查SSL加密算法是否存在
        curl_setopt($ch, CURLOPT_URL, $uri);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        if($data){
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout * 1000);
        $response = curl_exec($ch);
        $data['errno'] = $errno = curl_errno($ch);
        if($errno){
            //记录日志
            $data['error'] = curl_error($ch);
        }
        curl_close($ch);
        $data['data'] = $response;
        return $data;
    }

    protected static function get($uri){
        static $retry = 0;
        do{
            $r = static::request($uri);
            $retry += 1;
        } while($r['errno'] && $retry < 3);
        if($r['errno']){
            return [];
        }
        return json_decode($r['data'], true);
    }

    protected static function post($uri, $data = null, $headers = [], $timeout = 1){
        static $retry = 0;
        do{
            $r = static::request($uri, $data, $headers, $timeout);
            $retry += 1;
        } while($r['errno'] && $retry < 3);
        if($r['errno']){
            return [];
        }
        return json_decode($r['data'], true);
    }
}
