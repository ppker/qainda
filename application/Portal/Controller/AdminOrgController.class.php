<?php
namespace Portal\Controller;
use Common\Controller\AdminbaseController;
class AdminOrgController extends AdminbaseController{
	protected $org_type=array(1=>'敬老院',2=>'福利院',3=>'疗养院',4=>'老年公寓',5=>'其他');
	protected $org_property=array(1=>'国营',2=>'私营',3=>'合资');
	protected $live_obj=array(1=>'自理',2=>'半自理',3=>'全护理','4'=>'特护');

	function _initialize(){
		parent::_initialize();
	}
	function index(){
		//获取列表
		if($_REQUEST['org_name']){
			$where['org_name']=array('like',$_REQUEST['org_name'].'%');
			$this->assign('keywords',$_REQUEST['org_name']);
		}
		$this->_lists($where);
		$this->display();
	}

	function add(){
		//待封装成数组模式
		$this->_org_type('org_type');
		$this->_org_type('org_property');
		$this->_org_type('live_obj');
		//dump(I('session.'));exit;
		$this->display('AdminOrg:add');
	}

	/*
		新增养老机构信息
	*/
	function add_org(){
		$data_org=$_REQUEST['post'];
		$data_org['ext']=json_encode($_REQUEST['poster']);

		if(!empty($_POST['photos_alt']) && !empty($_POST['photos_url'])){
				foreach ($_POST['photos_url'] as $key=>$url){
					$photourl=sp_asset_relative_url($url);
					$data_org['org_pic']['photo'][]=array("url"=>$photourl,"alt"=>$_POST['photos_alt'][$key]);
				}
			}
		$data_org['org_pic']['thumb'] = sp_asset_relative_url($_REQUEST['org_pic']['thumb']);
		$data_org['org_pic']=json_encode($data_org['org_pic']);
		if(M('org')->create($data_org)){
			if($data_org['org_id']){
				//dump('ssssss');exit;
				$result=M('org')->save();
			}else{
				$result=M('org')->add();
			}
			if($result) $this->success('恭喜你，操作成功!');
			else $this->error("抱歉，写入失败！");
		}else $this->error(M('org')->getError());

	}
	private function _lists($where=null){
		$Org=M('Org');
		$count=$Org->alias("a")->join(C("DB_PREFIX")."users b ON a.create_id =b.id")->where($where)->count();
		$page = $this->page($count, 20);
		$orgs=$Org->alias("a")->field("a.*,b.user_login")->join(C('DB_PREFIX')."users b ON a.create_id=b.id")->limit($page->firstRow.','.$page->listRows)
		->order(array("a.org_id"=>"desc"))->where($where)->select();
		//dump($orgs);exit;
		$this->assign("Page", $page->show());
		$this->assign("current_page",$page->GetCurrentPage());
		$this->assign("orgs",$orgs);
	}
	private function _org_type($e){
		$data=$this->$e;
		$lists=array();
		foreach ($data as $k => $val) {
			$lists[]="<option value='{$k}'>$val</option>";
		}
		$data= implode('',$lists);
		//dump($data);exit;
		if($data) $this->assign($e,$data);
		//empty($data)?$this->assign('org_type',null):$this->assign('org_type',$data);
	}
	/*
	养老机构删除
	*/
	public function delete(){
		//指定删除
		if($_GET['org_id']){
			$org_id=I("get.org_id");
			$re=M('org')->where("org_id=".$org_id)->delete();
			//echo M('org')->getLastSql();exit;
			if($re) $this->success("删除成功！");
			else $this->error("删除失败！");
		}
		//批量删除
		if($_POST['ids']){
			$org_id=join(',',$_POST['ids']);
			$re=M('org')->where("org_id in ($org_id)")->delete();
			if($re) $this->success("全部删除成功！");
			else $this->error("删除失败！");
		}	
	}
	/*
	养老院编辑
	*/
	public function edit(){
		$org_id=intval($_GET['org_id']);
		$orgInfo=M('org')->field('*')->where('org_id='.$org_id)->find();
		if($orgInfo){
			$this->assign('orgInfo',$orgInfo);
			$this->assign('org_pic',json_decode($orgInfo['org_pic'],true));
			$this->assign('ext',json_decode($orgInfo['ext'],true));
		} 
		//待封装成数组模式
		$this->_org_type('org_type');
		$this->_org_type('org_property');
		$this->_org_type('live_obj');
		$this->assign('org_id',$org_id);
		//---------
		$this->display('AdminOrg:edit');
	}
}