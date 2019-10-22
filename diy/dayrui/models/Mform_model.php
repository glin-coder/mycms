<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 模块模型类
 */
	
class Mform_model extends CI_Model {

	/**
	 * 添加表单
	 */
	public function add($dir, $data) {
		return FALSE;
	}
	
	/**
	 * 删除
	 */
	public function del($id, $dir) {
		return NULL;
	}
	
	//-------------------------------------------------------//
	
	
	/**
	 * 获取表单内容
	 *
	 * @param	intval	$id
	 * @return	intavl
	 */
	public function get($id, $fid, $dir = '') {
        return NULL;
	}
}