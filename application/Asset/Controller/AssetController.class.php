<?php

/**
 * 附件上传
 */
namespace Asset\Controller;
use Common\Controller\AdminbaseController;
class AssetController extends AdminbaseController {


    function _initialize() {
    	$adminid=sp_get_current_admin_id();
    	$userid=sp_get_current_userid();
    	if(empty($adminid) && empty($userid)){
    		exit("非法上传！");
    	}
    }

    /**
     * swfupload 上传 
     */
    public function swfupload() {

        //dump($_GET);exit;

        if (IS_POST) {
			//dump($_POST);exit;
            //dump('ssssssssssssss');exit;
            //上传处理类
            /*$d['d']=$_POST;
            $this->assign($d);
            $this->display(':swfupload');
            exit;*/


            $config=array(
            		'rootPath' => './'.C("UPLOADPATH"),
            		'savePath' => '',
            		'maxSize' => 11048576,
            		'saveName'   =>    array('uniqid',''),
            		'exts'       =>    array('jpg', 'gif', 'png', 'jpeg',"txt",'zip'),
            		'autoSub'    =>    false,
            );
			$upload = new \Think\Upload($config);// 
			$info=$upload->upload();
            //开始上传
            if ($info) {
                //上传成功
                //写入附件数据库信息

                //dump($info);exit;
                $first=array_shift($info);
                if(!empty($first['url'])){
                	$url=$first['url'];
                }else{
                	$url=C("TMPL_PARSE_STRING.__UPLOAD__").$first['savename'];
                }
                
                //echo $info;exit;
				echo "1," . $url.",".'1,'.$first['name'];
				exit;
            } else {
                //上传失败，返回错误
                exit("0," . $upload->getError());
            }
        } else {

            //dump('aaaaaaaaaaaaa');exit;
            $this->display(':swfupload');
        }
    }

}
