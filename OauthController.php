<?php
/**
 * Created by PhpStorm.
 * User: wangpeng
 * Date: 2017/6/27
 * Time: 13:59
 */

namespace API\Controller;

use Oauth\Oauth;

class OauthController extends AbstractActionController{
    protected $oauth = null;

    public function onConstruct(){
        $params = $this->request->getJsonRawBody(true);
        $paramsData = isset($params['data']) ? $params['data'] : "";
        $platform = isset($paramsData['platform']) ? $paramsData['platform'] : 'wechat';
        $this->oauth = Oauth::initWithPlatform($platform);
    }

    public function authorizationAction(){
        $state = $this->request->getQuery('state');
        $this->response->setStatusCode(302);
        $wx_url = $this->oauth->getAuthorizationUrl($state);
        $this->response->setHeader('Location', $wx_url);
        return $this->response;
    }

    /**
     * 第三方登录 回调地址
     *
     *
     */
    public function callbackAction(){
        $code = $this->request->getQuery('code');
        $token = $this->oauth->getAccessToken($code);
        if(empty($token)){
            $this->response->setJsonContent($this->oauth->getLastError());
            return $this->response;
        }

        $unionid = '';
        $userinfo = $this->oauth->getUserinfo($token['openid'], $token['access_token']);
        if(empty($userinfo)){
            $this->response->setJsonContent($this->oauth->getLastError());
            return $this->response;
        }
        if('Oauth\Wechat' == get_class($this->oauth)){
            $unionid = $userinfo['unionid'];
        }
		$this->response->setHeader('Access-Control-Allow-Origin', '*');//允许跨域调用
        $this->response->setJsonContent([
            'errno' => 0,
            'error' => '',
            'data'  => [
                'openid'    => $token['openid'],
                'access_token'  => $token['access_token'],
                'unionid'       => $unionid,
                'userinfo'      => $userinfo,
            ]
        ]);
        return $this->response;
    }

    /**
     * 第三方登录 回调地址
     *
     *
     */
    public function smallcallbackAction(){
        $params = $this->request->getJsonRawBody(true);
        $paramsData = isset($params['data']) ? $params['data'] : "";
        $code = isset($paramsData['code']) ? $paramsData['code'] : '';
        $token = $this->oauth->getSessionKey($code);
        if(empty($token)){
            //$this->response->setJsonContent($this->oauth->getLastError());
            $error = $this->oauth->getLastError();
            $this->response->setJsonContent([
                'errno' => $error->errcode,
                'error' => $error->errmsg
            ]);
        }
        
		$this->response->setHeader('Access-Control-Allow-Origin', '*');//允许跨域调用
        $this->response->setJsonContent([
            'errno' => 0,
            'error' => '',
            'data'  => $token
        ]);
        return $this->response;
    }
}
