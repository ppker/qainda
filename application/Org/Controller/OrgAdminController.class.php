<?php
namespace Org\Controller;
use Common\Controller\AdminbaseController;

class OrgAdminController extends AdminBaseController{
	
	function index(){
		$this->display(':index');
	}
}