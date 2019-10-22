<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');
	
/**
 * 后台Api调用类
 */
 
class Api extends M_Controller {

    public function menu() {

        $url = urldecode(dr_safe_replace($this->input->get('v')));
        $arr = parse_url($url);
        $queryParts = explode('&', $arr['query']);
        $params = array();
        foreach ($queryParts as $param) {
            $item = explode('=', $param);
            $params[$item[0]] = $item[1];
        }
        // 基础uri
        $uri = ($params['s'] ? $params['s'].'/' : '').'admin/'.($params['c'] ? $params['c'] : 'home').'/'.($params['m'] ? $params['m'] : 'index');
        // 查询名称
        $menu = $this->db->select('name')->like('uri', $uri)->get('admin_menu')->row_array();
        $name = $menu ? $menu['name'] : '未知名称';
        // 替换URL

        $admin = $this->db->where('uid', $this->uid)->get('admin')->row_array();
        if ($admin) {
            $menu = dr_string2array($admin['usermenu']);
            foreach ($menu as $t) {
                $t['url'] == $url && exit('已经存在');
            }
            $menu[] = array(
                'name' => $name,
                'url' => $url,
            );
            $this->db->where('uid', $this->uid)->update(
                'admin', array(
                    'usermenu' => dr_array2string($menu)
                )
            );
            exit();
        }
        exit('稍后再试');
        // 当前用户的自定义菜单
        /*
        if ($mymenu == TRUE && $this->admin['usermenu']) {
            foreach ($this->admin['usermenu'] as $my) {
                $id ++;
                $ico = strpos($my['name'], 'icon-') ? ' ' : '<i class="iconm icon-th-large"></i> ';
                $string.= '<li tid="'.$ii.'" id="_MP_'.$id.'" class="dr_link nav-item"><a href="javascript:_MP(\''.$id.'\', \''.$my['url'].'\');">'.$ico.' <span class="title">'.$my['name'].'</span></a></li>';
            }
            $mymenu = FALSE;
        }*/

    }

    public function color() {

        $color = dr_safe_replace($this->input->get('v'));
        $this->db->where('uid', $this->uid)->update(
            'admin', array(
                'color' => $color
            )
        );
        exit(dr_json(1,'ok'));
    }

    /**
     * ajax文件上传
     *
     * @return void
     */
	public function ajax_upload() {
		
		
	}
	
	
    /**
     * 文件上传
     *
     * @return void
     */
    public function upload() {
        $ext = 'jpg,gif,png,js,css,html';
        $this->template->assign(array(
            'ext' => str_replace(',', '|', $ext),
            'page' => 0,
            'size' => 1024 * 1024,
            'path' => $this->input->get('path'),
            'types' => '*.'.str_replace(',', ';*.', $ext),
            'fcount' => 50,
            'is_admin' => 1,
        ));
        $this->template->display('upload.html');
    }

    /**
     * 文件上传处理
     *
     * @return void
     */
    public function swfupload() {

        if (IS_POST) {
            $ext = 'jpg,gif,png,js,css,html';
            $path = dr_authcode(urldecode($this->input->post('path')));
            !is_dir($path) && exit('0,目录（'.$path.'）不存在');
            $this->load->library('upload', array(
                'max_size' => 1024 * 1024,
                'overwrite' => TRUE,
                'file_name' => '',
                'upload_path' => $path,
                'allowed_types' => str_replace(',', '|', $ext),
                'file_ext_tolower' => TRUE,
            ));
            if ($this->upload->do_upload('Filedata')) {
                $info = $this->upload->data();
                $_ext = str_replace('.', '', $info['file_ext']);
                $file = str_replace(WEBPATH, '', $info['full_path']);
                !is_file(WEBPATH.$file) && $file = THEME_PATH.'admin/images/ext/blank.gif';
                $icon = is_file(THEME_PATH.'admin/images/ext/'.$_ext.'.gif') ? THEME_PATH.'admin/images/ext/'.$_ext.'.gif' : THEME_PATH.'admin/images/ext/blank.gif';
                //唯一ID,文件全路径,图标,文件名称,文件大小,扩展名
                exit('1,'.$file.','.$icon.','.str_replace(array('|', '.'.$_ext), '', $info['client_name']).','.dr_format_file_size($info['file_size'] * 1024).','.$_ext);
            } else {
                exit('0,'.$this->upload->display_errors('', ''));
            }
        }
    }
	
	/**
     * 查看资料
     */
	public function member() {

        $uid = str_replace('author_', '', $this->input->get('uid'));
        ($uid == 'guest' || !$uid) && exit('<div style="padding-top:50px;color:blue;font-size:14px;text-align:center">'.fc_lang('游客').'</div>');
        
        $data = is_numeric($uid) ? $this->db->where('uid', (int)$uid)->limit(1)->get('member')->row_array() : $this->db->where('username', $uid)->limit(1)->get('member')->row_array();

        !$data && exit('(#'.$uid.')'.fc_lang('对不起，该会员不存在！'));

        $this->load->library('dip');
        $data['address'] = $this->dip->address($data['regip']);

		$this->template->assign(array(
			'data' => $data,
		));
		$this->template->display('member.html');
	}
	
	/**
     * 测试ftp链接状态
     */
	public function testftp() {
	
		$rurl = $this->input->get('rurl');
		$host = $this->input->get('host');
		$port = $this->input->get('port');
		$pasv = $this->input->get('pasv');
		$path = $this->input->get('path');
		$mode = $this->input->get('mode');
        $username = $this->input->get('username');
        $password = $this->input->get('password');

        (!$host || !$username || !$password) && exit(fc_lang('参数不完整'));

        !$rurl && exit(fc_lang('没有设置远程访问URL'));

		$this->load->library('ftp');
		if (!$this->ftp->connect(array(
			'hostname' => $host,
			'username' => $username,
			'password' => $password,
			'port' => $port ? $port : 21,
			'passive' => $pasv ? TRUE : FALSE,
			'debug' => FALSE
		))) {
            exit(fc_lang('Ftp服务器连接失败'));
        }

        !$this->ftp->upload(WEBPATH.'index.php', $path.'/test.ftp', $mode, 0775) && exit(fc_lang('Ftp服务器无上传权限'));

        strpos(dr_catcher_data($rurl.'/test.ftp'), 'dayrui.com') === FALSE && exit(fc_lang('远程服务器连接成功，但远程访问URL貌似没有正确'));

        !$this->ftp->delete_file($path.'/test.ftp') && exit(fc_lang('Ftp服务器无删除权限'));

		$this->ftp->close();
		
		exit('ok');
	}

    // 测试阿里云存储状态
    public function aliyuntest() {

        $id = $this->input->get('id');
        $host = $this->input->get('host');
        $rurl = $this->input->get('rurl');
        $secret = $this->input->get('secret');
        $bucket = $this->input->get('bucket');

        (!$id || !$host || !$secret || !$bucket) && exit(fc_lang('参数不完整'));

        !$rurl && exit(fc_lang('没有设置远程访问URL'));

        require_once FCPATH . 'dayrui/libraries/Remote/AliyunOSS/sdk.class.php';
        $oss = new ALIOSS($id, $secret, $host);
        $response = $oss->upload_file_by_file($bucket, 'test.txt', WEBPATH.'index.php');

        if ($response->status == 200) {
            if (strpos(dr_catcher_data($rurl.'/test.txt'), 'dayrui.com') === FALSE) {
                $oss->delete_object($bucket, 'test.txt');
                exit(fc_lang('远程服务器连接成功，但远程访问URL貌似没有正确').'<br>'.$rurl.'/test.txt');
            }
            exit('ok');
        } else {
            exit($response->body);
        }

    }

    public function login() {

        $uid = (int)$this->session->userdata('uid');
        $admin = (int)$this->session->userdata('admin');
        if ($this->uid == FALSE
            || $uid != $this->uid
            || $admin != $uid) {
            $this->template->display('login_ajax.html');
        } else {
            $data = $this->member_model->get_admin_member($this->uid, 1);
            if ($data) {
                ob_start();
                @ob_clean();
                exit('this_finecms_test');
            } else {
                $this->template->display('login_ajax.html');
            }
        }

    }

    // 测试百度云存储状态
    public function baidutest() {

        $ak = $this->input->get('ak');
        $sk = $this->input->get('sk');
        $host = $this->input->get('host');
        $rurl = $this->input->get('rurl');
        $bucket = $this->input->get('bucket');

        (!$ak || !$host || !$sk || !$bucket) && exit(fc_lang('参数不完整'));

        !$rurl && exit(fc_lang('没有设置远程访问URL'));

        require_once FCPATH . 'dayrui/libraries/Remote/BaiduBCS/bcs.class.php';
        $bcs = new BaiduBCS($ak, $sk, $host);
        $opt = array();
        $opt['acl'] = BaiduBCS::BCS_SDK_ACL_TYPE_PUBLIC_WRITE;
        $opt['curlopts'] = array(CURLOPT_CONNECTTIMEOUT => 10, CURLOPT_TIMEOUT => 1800);
        $response = $bcs->create_object($bucket, '/test.txt', WEBPATH.'index.php', $opt);

        if ($response->status == 200) {
            if (strpos(dr_catcher_data($rurl.'/test.txt'), 'dayrui.com') === FALSE) {
                exit(fc_lang('远程服务器连接成功，但远程访问URL貌似没有正确'));
            }
            $bcs->delete_object($bucket, '/test.txt');
            exit('ok');
        } else {
            exit('error');
        }
    }

    // 测试百度云存储状态
    public function qcloudtest() {

        $id = $this->input->get('id');
        $app = $this->input->get('app');
        $key = $this->input->get('key');
        $rurl = $this->input->get('rurl');
        $bucket = $this->input->get('bucket');
        $region = $this->input->get('region');

        (!$id || !$key || !$bucket || !$app) && exit(fc_lang('参数不完整'));


        require_once FCPATH . 'dayrui/libraries/Remote/QcloudCOS/Qcloud.php';

        Conf::init($app, $id, $key);
        Cosapi::setRegion($region);

        $result = Cosapi::upload($bucket, WEBPATH.'index.php', '/test.txt', null, null, 1);
        if ($result['code'] == 0) {
            if (strpos(dr_catcher_data($rurl.'/test.txt'), 'dayrui.com') === FALSE) {
                exit(fc_lang('远程服务器连接成功，但远程访问URL（'.$rurl.'/test.txt'.'）貌似没有正确'));
            }
            Cosapi::delFile($bucket, '/test.txt');
            exit('ok');
        } else {
            exit($result['message']);
        }
        exit;
    }


    // 图片剪切保存
    public function ajax_save_image() {

    }


    // 图片剪切
    public function ajax_edit_image() {


    }

    function mbonline() {

        $this->template->assign(array(
            'url' => 'http://api.poscms.net/shop/search-template-v-2-iscms-1.html',
        ));
        $this->template->display('online.html');
    }

    function cjonline() {

        $this->template->assign(array(
            'url' => 'http://api.poscms.net/shop/search-app-v-2-iscms-1.html',
        ));
        $this->template->display('online.html');
    }

    function mkonline() {

        $this->template->assign(array(
            'url' => 'http://api.poscms.net/shop/search-function-v-2-iscms-1.html',
        ));
        $this->template->display('online.html');
    }

    function helponline() {
        $this->template->assign(array(
            'menu' => $this->get_menu_v3(array(
                '帮助手册' => array('admin/api/helponline', 'book'),
            )),
        ));
        $this->template->display('help.html');
    }
}