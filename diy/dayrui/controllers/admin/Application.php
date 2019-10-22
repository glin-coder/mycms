<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/* v3.1.0  */
	
class Application extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
		$this->template->assign('menu', $this->get_menu_v3(array(
		    fc_lang('应用管理') => array('admin/application/index', 'cloud'),
            fc_lang('更新缓存') => array('admin/home/cache', 'refresh'),
            
		)));
		$this->load->model('application_model');
    }
	
	/**
     * 管理
     */
    public function index() {
		$this->template->display('main.html');
    }

}