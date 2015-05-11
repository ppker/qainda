<?php
namespace Org\Controller;
use Common\Controller\HomeBaseController;
class IndexController extends HomeBaseController{
	function index(){
		$this->display(":index");
	}
}