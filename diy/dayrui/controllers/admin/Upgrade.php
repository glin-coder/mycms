<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Upgrade extends M_Controller {

    private $rid;
    private $version;

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->version = DR_VERSION;
    }

    /**
     * 程序管理
     */
    public function index() {

        $this->template->assign(array(
            'menu' => $this->get_menu_v3(array(
                fc_lang('程序管理') => array('admin/upgrade/index', 'plug'),
            )),
        ));
        $this->template->display('upgrande.html');
    }

    // 版本列表
    public function vlist() {

        $data = dr_catcher_data('http://www.poscms.net/version.php?cms=poscms');

        if (!$data) {
            exit('<p style="color:red;"> 暂时无法获取到服务器端版本信息 </p>');
        }

        if (strlen($data) > 20) {
            exit('<p style="color:red;"> 返回数据不规范，请联系官方！ </p>');
        }

        $fwq = (string)(date('Y.m.d', strtotime($data)));
        $azb = (string)(DR_UPDATE);
        if ($fwq != $azb) {
            $data.= '，'.'<span style="color:red">有新版本可更新</span>';

        }


        echo('<p> 本网站程序更新时间为： '.DR_UPDATE.'</a></p>');
        exit('<p> <a href="https://gitee.com/dayrui/poscms/" style="color:green;" target="_blank">服务器程序更新时间为： '.$data.'</a></p>');

    }


}