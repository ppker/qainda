1.养老院查询的数据表设计
  根据前端要显示的数据内容来规划
  基本信息
  `org_id` --
  `org_name` 机构名称 --
  `canton_fdn` 地址，所在区域  --
  `canton_text` 地址名称
  `org_type` 机构类型  （字典表里面）--
  `org_property`机构性质 --
  `legal`负责人(法人) --
  `org_status` 状态--
  `create_id`  创建人 --
  `create_time` 创建时间 --

  `org_create_date` 成立时间 
  `org_area` 机构占地面积

  `org_bed_num` 机构床位数 --
  `live_obj` 收住对象  --
  `charge_gt` 收费左端  --
  `charge_lt` 收费右端  --
  `ts_service` 特色服务  
  `org_tel` 机构电话
  `contact_person` 联系人
  `org_address` 机构详细地址
  `org_zip_code` 机构邮编
  `org_net` 机构网址
  `org_email` 机构邮箱
  `org_trafic` 机构交通
  `org_facility` 机构设施
  `content_service` 服务内容
  `org_notice` 入住须知

  `org_intro` 机构简介-----------------
  `org_pic` 机构图片 -----------------

create table if not exists `org`(
	org_id bigint(20) unsigned not null AUTO_INCREMENT,
	org_name varchar(90) default null comment '机构名称',
	canton_fdn varchar(45) default null comment '机构区域串',
  canton_text varchar(100) default null comment '机构区域名称',
	org_type int(11) unsigned default null comment '机构类型',
	org_property int(11) default null comment '机构性质',
	legal varchar(45) default null comment '法人姓名',
	org_status tinyint(1) not null default '1' comment '状态',
	create_id int(11) unsigned default null comment '创建人',
	create_time timestamp not null default current_timestamp comment '创建时间',
	org_bed_num int(4) unsigned not null default '0' comment '机构床位数',
	live_obj int(11) unsigned default null comment '接收对象',
	charge_gt int(9) unsigned default null comment '收费左端',
	charge_lt int(9) unsigned default null comment '收费右端',
	//ts_service int(11) unsigned default null comment '特色服务',
  org_tel int(16) unsigned default null comment '机构电话',
	org_intro text default null comment '机构简介',
	org_pic text default null comment '机构图片,格式为json',
	ext text default null comment '扩展字段,保存相关扩展属性,格式为json',
	PRIMARY KEY(`org_id`),
	key(`org_type`),
	key(`org_property`),
	key(`create_id`),
	key(`org_bed_num`),
	key(`live_obj`),
	key(`charge_gt`),
  key(`org_tel`),
	key(`charge_lt`),
	key(`ts_service`)
);
++++++++++++++++++++++++++++++++++++++
Sunday's coming i wanna drive my car 
　　星期天来临了 我要开着我的汽车 
　　to your apartment with present like a star 
　　像星星般 带着礼物 来到你的公寓 
　　forecaster said the weather may be rainy hard 
　　预报员说可能下雨 
　　but i know the sun will shine for us 
　　但是我知道阳光将会照耀我们的 
　　oh lazy seagull fly me from the dark 
　　欧`海鸥从黄昏中懒洋洋地飞向我 
　　i dress my jeans and feed my monkey banana 
　　我穿着我的牛仔裤 给我的猴子喂香蕉吃 
　　then i think my age how old,skyline how far 
　　然后我感到我是如此的老了，但地平线是如此遥远 
　　or we need each other in california 
　　或者我们都想生活在加洲 
　　 
　　*you show me your body before night comes down 
　　在黑夜来临之前 你展示你的身姿 
　　i touch your face and promise to stay ever young 
　　我抚摸你的脸庞，许诺我们永远年轻 
　　on this ivory beach we kissed so long 
　　在这篇象牙色的海滩上我们长久的亲吻 
　　it seems that the passion's never gone 
　　就象激情永不消退一样 
　　 
　　*you sing me your melody and i feel so please 
　　你向我展示你悦耳的歌喉，我感觉如此的愉悦 
　　i want you to want me to keep your dream 
　　我想你应该让我经营你的梦 
　　together we'll run wild by a summer symphony 
　　我们在夏季的交响乐中疯狂的奔跑 
　　this is what we enjoyed not a fantasy 
　　这就是我们的享受，而非幻想 
　　the tin-man's surfing i wanna try my luck 
　　男人般冲浪嬉戏，只因想试下运气。 
　　to the top of tide rip like just have some drugs冲到浪尖我如此陶醉 
　　i know you have no blame for my proud moonish heart 
　　我知道你从没有责备我那骄傲和多变的心。 
　　welcome to the golden beatnik park 来到这个坠落的乐园吧 
　　 
　　oh diamond seashore drag me from the yard 
　　噢``黄金海岸让我走出自己的天地 
　　incredible sunward i watch as you're in photograph 
　　朝向阳光我难以自信的发现你仿佛溶化于画中 
　　for camera your smile's so sweet,palm trees' so lush 
　　画面中你的微笑如此甜美，棕榈树如此青翠。 
　　would you believe my honey it's califonia 
　　你相信么，亲爱的，这就是加洲 
+++++++++++++++++++++++++++++++++++++++++++++++++++++
后台部分的设计
