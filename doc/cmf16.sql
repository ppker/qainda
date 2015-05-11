/*
Navicat MySQL Data Transfer

Source Server         : yzp_web
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : cmf16

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-05-11 01:24:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sp_ad`
-- ----------------------------
DROP TABLE IF EXISTS `sp_ad`;
CREATE TABLE `sp_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL,
  `ad_content` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_asset`
-- ----------------------------
DROP TABLE IF EXISTS `sp_asset`;
CREATE TABLE `sp_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filepath` varchar(200) NOT NULL,
  `uploadtime` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `meta` text,
  `suffix` varchar(50) DEFAULT NULL,
  `download_times` int(6) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `sp_auth_access`;
CREATE TABLE `sp_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `sp_auth_rule`;
CREATE TABLE `sp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of sp_auth_rule
-- ----------------------------
INSERT INTO `sp_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('162', 'Org/Orgadmin/index', 'admin_url', 'org/orgadmin/index/org/index', null, '养老院管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('163', 'Org', 'admin_url', 'org/orgadmin/add', null, '养老院内容', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('164', 'Admin', 'admin_url', 'admin/org/default', null, '养老院管理', '1', '');
INSERT INTO `sp_auth_rule` VALUES ('165', 'Portal', 'admin_url', 'portal/adminorg/index', null, '养老院内容', '1', '');

-- ----------------------------
-- Table structure for `sp_comments`
-- ----------------------------
DROP TABLE IF EXISTS `sp_comments`;
CREATE TABLE `sp_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_comments
-- ----------------------------
INSERT INTO `sp_comments` VALUES ('1', 'posts', '7', 'index.php/article/index/id/6', '1', '0', 'admin', '2548414889@qq.com', '2015-04-22 20:39:22', '人生的意义就是把时间投入到正确的事情上去。', '1', '0', '0-1', '1');
INSERT INTO `sp_comments` VALUES ('2', 'posts', '7', 'index.php/article/index/id/6', '1', '0', 'admin', '2548414889@qq.com', '2015-04-22 20:41:20', 'html css php javascript html5 css3 node.js 呵呵呵', '1', '0', '0-2', '1');
INSERT INTO `sp_comments` VALUES ('3', 'posts', '7', 'index.php/article/index/id/6', '1', '1', 'admin', '2548414889@qq.com', '2015-04-22 20:43:49', '呵呵呵 ^_^', '1', '2', '0-2-3', '1');

-- ----------------------------
-- Table structure for `sp_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `sp_common_action_log`;
CREATE TABLE `sp_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_common_action_log
-- ----------------------------
INSERT INTO `sp_common_action_log` VALUES ('1', '0', 'posts2', 'Portal-Article-index', '1', '1429092139', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('2', '0', 'posts5', 'Portal-Article-index', '33', '1431251445', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('3', '0', 'posts4', 'Portal-Article-index', '9', '1431251426', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('4', '0', 'posts3', 'Portal-Article-index', '2', '1431149109', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('5', '0', 'posts6', 'Portal-Article-index', '3', '1430475612', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('6', '0', 'posts7', 'Portal-Article-index', '5', '1431149096', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('7', '1', 'posts7', 'Portal-Article-index', '3', '1429706662', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('8', '4', 'posts5', 'Portal-Article-index', '1', '1429723331', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('9', '4', 'posts4', 'Portal-Article-index', '1', '1429723360', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('10', '4', 'posts7', 'Portal-Article-index', '1', '1429723584', '127.0.0.1');
INSERT INTO `sp_common_action_log` VALUES ('11', '4', 'posts6', 'Portal-Article-index', '1', '1429723596', '127.0.0.1');

-- ----------------------------
-- Table structure for `sp_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `sp_guestbook`;
CREATE TABLE `sp_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_links`
-- ----------------------------
DROP TABLE IF EXISTS `sp_links`;
CREATE TABLE `sp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT '',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_links
-- ----------------------------
INSERT INTO `sp_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');
INSERT INTO `sp_links` VALUES ('2', 'http://dxinfo.cc', '乾达婆', '', '_blank', 'web技术乾达婆', '1', '0', '', '0');
INSERT INTO `sp_links` VALUES ('3', 'http://nodejs.org', 'Node官网', '', '_blank', 'node.js', '1', '0', '', '0');
INSERT INTO `sp_links` VALUES ('4', 'http://www.github.com', 'GitHub', '', '_blank', 'GitHub', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `sp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sp_menu`;
CREATE TABLE `sp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_menu
-- ----------------------------
INSERT INTO `sp_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `sp_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `sp_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `sp_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `sp_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `sp_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `sp_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `sp_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `sp_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `sp_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `sp_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `sp_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `sp_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `sp_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `sp_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `sp_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `sp_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `sp_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `sp_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `sp_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `sp_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `sp_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `sp_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `sp_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `sp_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `sp_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `sp_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `sp_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `sp_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `sp_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `sp_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `sp_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `sp_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `sp_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `sp_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `sp_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `sp_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `sp_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `sp_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `sp_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `sp_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `sp_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `sp_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `sp_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `sp_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `sp_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `sp_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `sp_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `sp_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `sp_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `sp_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `sp_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `sp_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `sp_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `sp_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('158', '0', 'Admin', 'Org', 'default', '', '1', '1', '养老院管理', 'leaf', '', '11');
INSERT INTO `sp_menu` VALUES ('159', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `sp_menu` VALUES ('160', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `sp_menu` VALUES ('161', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('162', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('164', '158', 'Portal', 'AdminOrg', 'index', '', '1', '1', '养老院内容', 'fa-th-large', '', '0');

-- ----------------------------
-- Table structure for `sp_nav`
-- ----------------------------
DROP TABLE IF EXISTS `sp_nav`;
CREATE TABLE `sp_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `href` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(6) DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_nav
-- ----------------------------
INSERT INTO `sp_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `sp_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `sp_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');
INSERT INTO `sp_nav` VALUES ('4', '2', '0', '养老院查询', '', '/index.php/list/find/id/7', '', '1', '1', '0-4');
INSERT INTO `sp_nav` VALUES ('5', '2', '0', '新闻中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}', '', '1', '2', '0-5');
INSERT INTO `sp_nav` VALUES ('6', '2', '0', '养老政策', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"9\";}}', '', '1', '3', '0-6');
INSERT INTO `sp_nav` VALUES ('7', '2', '0', '养生健身', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"10\";}}', '', '1', '4', '0-7');
INSERT INTO `sp_nav` VALUES ('9', '2', '0', '联系我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '6', '0-9');
INSERT INTO `sp_nav` VALUES ('10', '2', '0', '首页', '', 'home', '', '1', '0', '0-10');

-- ----------------------------
-- Table structure for `sp_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `sp_nav_cat`;
CREATE TABLE `sp_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `remark` text,
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_nav_cat
-- ----------------------------
INSERT INTO `sp_nav_cat` VALUES ('1', '主导航', '0', '主导航');
INSERT INTO `sp_nav_cat` VALUES ('2', '养老院', '1', '养老院网站');

-- ----------------------------
-- Table structure for `sp_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `sp_oauth_user`;
CREATE TABLE `sp_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(60) NOT NULL,
  `expires_date` int(12) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_options`
-- ----------------------------
DROP TABLE IF EXISTS `sp_options`;
CREATE TABLE `sp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_options
-- ----------------------------
INSERT INTO `sp_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `sp_options` VALUES ('2', 'site_options', '{\"site_name\":\"\\u4e7e\\u8fbe\\u5a46\\u517b\\u8001\\u7f51\",\"site_host\":\"http:\\/\\/localhost:8081\\/\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"2548414889@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u4e7e\\u8fbe\\u5a46web\\u5f00\\u53d1\",\"site_seo_keywords\":\"\\u4e7e\\u8fbe\\u5a46\",\"site_seo_description\":\"web\\u662f\\u4e00\\u95e8\\u827a\\u672f\",\"urlmode\":\"1\",\"html_suffix\":\"\",\"comment_time_interval\":60}', '1');
INSERT INTO `sp_options` VALUES ('3', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');

-- ----------------------------
-- Table structure for `sp_org`
-- ----------------------------
DROP TABLE IF EXISTS `sp_org`;
CREATE TABLE `sp_org` (
  `org_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `org_name` varchar(90) DEFAULT NULL COMMENT '机构名称',
  `canton_text` varchar(100) DEFAULT NULL COMMENT '机构区域名称',
  `canton_fdn` varchar(45) DEFAULT NULL COMMENT '机构区域串',
  `org_type` int(11) unsigned DEFAULT NULL COMMENT '机构类型',
  `org_property` int(11) DEFAULT NULL COMMENT '机构性质',
  `legal` varchar(45) DEFAULT NULL COMMENT '法人姓名',
  `org_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_id` int(11) unsigned DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `org_bed_num` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '机构床位数',
  `live_obj` int(11) unsigned DEFAULT NULL COMMENT '接收对象',
  `charge_gt` int(9) unsigned DEFAULT NULL COMMENT '收费左端',
  `charge_lt` int(9) unsigned DEFAULT NULL COMMENT '收费右端',
  `org_tel` int(16) unsigned DEFAULT NULL COMMENT '机构电话',
  `org_intro` text COMMENT '机构简介',
  `org_pic` text COMMENT '机构图片,格式为json',
  `ext` text COMMENT '扩展字段,保存相关扩展属性,格式为json',
  PRIMARY KEY (`org_id`),
  KEY `org_type` (`org_type`),
  KEY `org_property` (`org_property`),
  KEY `create_id` (`create_id`),
  KEY `org_bed_num` (`org_bed_num`),
  KEY `live_obj` (`live_obj`),
  KEY `charge_gt` (`charge_gt`),
  KEY `org_tel` (`org_tel`),
  KEY `charge_lt` (`charge_lt`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_org
-- ----------------------------
INSERT INTO `sp_org` VALUES ('1', '竹林七贤养老院', null, '310103', '1', '1', '闫志鹏', '1', '1', '2015-05-03 11:24:47', '3000', '3', '4000', '7000', '1366525100', '<p>这里是机构简介啊，这里是机构简介啊。</p>', '{\"thumb\":\"552e37098d64c.jpg\"}', '{\"org_net\":\"http://www.dxinfo.cc\"}');
INSERT INTO `sp_org` VALUES ('2', '云台山百家岩养老院', null, '310103', '1', '1', '闫志鹏', '1', '1', '2015-05-03 12:10:09', '2000', '3', '3000', '6000', '1366525100', '<p>这里是百家岩养老机构啊，欢迎，欢迎</p>', '{\"thumb\":\"552e37098d64c.jpg\"}', '{\"org_net\":\"http://www.dxinfo.cc\"}');
INSERT INTO `sp_org` VALUES ('3', '云台山小八顶养老院', null, '310103', '1', '1', '闫志鹏', '1', '1', '2015-05-03 12:11:44', '1500', '3', '3000', '5000', '1366525100', '<p>这里是云台山小八顶，欢迎入住。欢迎。</p>', '{\"thumb\":\"552e37098d64c.jpg\"}', '{\"org_net\":\"http://www.dxinfo.cc\"}');
INSERT INTO `sp_org` VALUES ('4', 'aaaa', '天津市县宁河县', '310103', '1', '2', 'aaaa', '1', '1', '2015-05-04 22:28:03', '23232', '2', '122', '344', '34343', '<p>asfsafas</p><p>asdfsafas</p><p>asdfasd</p><p>asdfas</p><p>asfd<br/></p>', null, '{\"org_create_date\":\"2015-05-06\",\"org_area\":\"232\",\"ts_service\":\"edsafsdfsdaf\",\"contact_person\":\"dsaf\",\"org_address\":\"asdfsadfasf\",\"org_zip_code\":\"12212\",\"org_net\":\"ssdafds\",\"org_email\":\"sadfsaf\",\"org_trafic\":\"assafsadfsdf\",\"org_facility\":\"sadfasfsadfasd\",\"content_service\":\"asdfsafsafasfsad\",\"org_notice\":\"asdfsafsafasfsafsa\"}');
INSERT INTO `sp_org` VALUES ('5', 'cccc', '河北省唐山市路南区', '310103', '3', '3', 'cccc', '1', '1', '2015-05-04 22:49:54', '3333', '2', '222', '333', '33333', '<p>sdffasfsadfsadfs</p><p>safsafsadf</p><p>asfsafsadfs</p><p>sadfsafsa<br/></p>', null, '{\"org_create_date\":\"2015-05-05\",\"org_area\":\"333\",\"ts_service\":\"dsfdsfdsfa\",\"contact_person\":\"sdfsdf\",\"org_address\":\"sdfsdf\",\"org_zip_code\":\"2323\",\"org_net\":\"sdafdsaf\",\"org_email\":\"sadfsdaf\",\"org_trafic\":\"sadfsadf\",\"org_facility\":\"sdfsadf\",\"content_service\":\"sdfsadfsadf\",\"org_notice\":\"sadfsadfsadfsda\"}');
INSERT INTO `sp_org` VALUES ('6', 'bbbbb', '河北省唐山市路南区', '310103', '2', '3', 'bbbb', '1', '1', '2015-05-04 22:54:54', '43434', '2', '333', '4444', '444', '<p>sadfsafsadfas</p><p>sdafsafasdf</p><p>sadfasdfasfas</p><p>sadfasdfasdfas<br/></p>', '{\"photo\":[{\"url\":\"5547887a9172a.jpg\",\"alt\":\"dfde\"},{\"url\":\"5547887acb200.jpg\",\"alt\":\"dfe3\"},{\"url\":\"5547887b0858e.png\",\"alt\":\"drtre3\"},{\"url\":\"5547887b34cc4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"5547886e1b0ec.png\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"3434\",\"ts_service\":\"fdsafsdfs\",\"contact_person\":\"sdfsdf\",\"org_address\":\"sdfsafsa\",\"org_zip_code\":\"fsfsafs\",\"org_net\":\"sdfsadf\",\"org_email\":\"sdafdasf\",\"org_trafic\":\"sadfsafsdaf\",\"org_facility\":\"sfsadfasdf\",\"content_service\":\"asfsafsa\",\"org_notice\":\"fsafsafsadf\"}');
INSERT INTO `sp_org` VALUES ('7', 'ffff', '河北省唐山市路北区', '310103', '3', '2', 'ffff', '1', '1', '2015-05-04 23:28:41', '4444', '2', '333', '444', '23323', '<p>fsdafasdfsadfsadfasdfa</p><p>sfsafsa</p><p>fasdfsadf<br/></p>', '{\"photo\":[{\"url\":\"5547906b50637.jpg\",\"alt\":\"erw\"},{\"url\":\"5547906b9f619.jpg\",\"alt\":\"fff\"},{\"url\":\"5547906bf1018.jpg\",\"alt\":\"fgfbgh\"},{\"url\":\"5547906c47a37.jpg\",\"alt\":\"fgfgh\"}],\"thumb\":\"5547905d0025c.jpg\"}', '{\"org_create_date\":\"2015-05-14\",\"org_area\":\"4444\",\"ts_service\":\"dsafsdf\",\"contact_person\":\"dsf\",\"org_address\":\"sadf\",\"org_zip_code\":\"2332\",\"org_net\":\"sdfsafs\",\"org_email\":\"sdfs\",\"org_trafic\":\"safasf\",\"org_facility\":\"sfsa\",\"content_service\":\"fsadfsadf\",\"org_notice\":\"asfsafasd\"}');
INSERT INTO `sp_org` VALUES ('8', '卡卡西', '上海市县崇明县', '310103', '2', '1', '卡卡西', '1', '1', '2015-05-07 19:52:11', '200', '2', '8000', '9000', '2147483647', '<p>呵呵呵呵，加油。呵呵呵呵</p><p>呵呵呵呵，加油。呵呵呵呵</p><p>呵呵呵呵，加油。呵呵呵呵</p><p>呵呵呵呵，加油。呵呵呵呵</p>', '{\"photo\":[{\"url\":\"554b530e4b90c.jpg\",\"alt\":\"dfde\"},{\"url\":\"554b530e8d62f.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554b530edf6c1.png\",\"alt\":\"drtre3\"}],\"thumb\":\"554b52ff5199f.jpg\"}', '{\"org_create_date\":\"2015-05-01\",\"org_area\":\"200\",\"ts_service\":\"\\u6211\\u662f\\u7279\\u6b8a\\u670d\\u52a1\",\"contact_person\":\"\\u5361\\u5361\\u897f\",\"org_address\":\"\\u9876\\u9876\\u9876\",\"org_zip_code\":\"112\",\"org_net\":\"http:\\/\\/www.baidu.com\",\"org_email\":\"2548414889@qq.com\",\"org_trafic\":\"\\u5475\\u5475\\u5475\\u5475\\uff0c\\u52a0\\u6cb9\\u3002\\u5475\\u5475\\u5475\\u5475\",\"org_facility\":\"\\u5475\\u5475\\u5475\\u5475\\uff0c\\u52a0\\u6cb9\\u3002\\u5475\\u5475\\u5475\\u5475\",\"content_service\":\"\\u5475\\u5475\\u5475\\u5475\\uff0c\\u52a0\\u6cb9\\u3002\\u5475\\u5475\\u5475\\u5475\",\"org_notice\":\"\\u5475\\u5475\\u5475\\u5475\\uff0c\\u52a0\\u6cb9\\u3002\\u5475\\u5475\\u5475\\u5475\"}');
INSERT INTO `sp_org` VALUES ('9', '小卡卡', '江苏省徐州市市辖区', '310103', '1', '1', '卡卡', '1', '1', '2015-05-07 20:09:03', '222', '1', '2000', '2500', '33333', '<p>333333<br/></p>', '{\"thumb\":\"552e37098d64c.jpg\"}', '{\"org_create_date\":\"2015-05-01\",\"org_area\":\"222\",\"ts_service\":\"333333\",\"contact_person\":\"3333\",\"org_address\":\"333\",\"org_zip_code\":\"3333\",\"org_net\":\"333\",\"org_email\":\"333\",\"org_trafic\":\"33\",\"org_facility\":\"333\",\"content_service\":\"333\",\"org_notice\":\"333\"}');
INSERT INTO `sp_org` VALUES ('10', '多大', '江苏省徐州市贾汪区', '310103', '2', '1', '多大', '1', '1', '2015-05-07 21:01:08', '333', '1', '3333', '4444', '4444', '<p>4444</p><p>4444<br/></p>', '{\"thumb\":\"552e37098d64c.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"444\",\"contact_person\":\"44\",\"org_address\":\"444\",\"org_zip_code\":\"44\",\"org_net\":\"444\",\"org_email\":\"44\",\"org_trafic\":\"44\",\"org_facility\":\"44444\",\"content_service\":\"444\",\"org_notice\":\"44\"}');
INSERT INTO `sp_org` VALUES ('11', '测试1', '上海市市辖区卢湾区', '310103', '1', '1', '达到', '1', '1', '2015-05-08 12:00:26', '333', '1', '333', '33', '333', '<p>艾丝凡阿斯顿发生法s阿斯蒂芬阿斯蒂芬</p><p>艾丝凡阿斯顿发生的</p><p>阿斯蒂芬艾丝凡阿斯顿<br/></p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('12', '测试2', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('13', '测试3', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('14', '测试4', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('15', '测试5', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('16', '测试6', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('17', '测试7', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('18', '测试8', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('19', '测试8', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('20', '测试10', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('21', '测试2', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('22', '测试20', '上海市市辖区卢湾区', '310103', '1', '1', 'dd', '1', '1', '2015-05-08 12:04:28', '33', '1', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554c3558e4908.jpg\",\"alt\":\"dfde\"},{\"url\":\"554c355923263.jpg\",\"alt\":\"dfe3\"},{\"url\":\"554c355954d78.png\",\"alt\":\"drtre3\"},{\"url\":\"554c355981fe4.jpg\",\"alt\":\"eee3\"}],\"thumb\":\"554c354cb4fea.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('23', '呵呵呵111111111', '上海市市辖区卢湾区', '310103', '3', '2', 'dd22', '1', '1', '2015-05-08 12:04:28', '33', '2', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554f8fed01536.jpg\",\"alt\":\"20141123115906958\"},{\"url\":\"554f8fed57d5c.jpg\",\"alt\":\"20141123115907667\"},{\"url\":\"554f8feda42c3.jpg\",\"alt\":\"20141123115908280\"}],\"thumb\":\"554f8fd217525.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('27', '呵呵呵2222', '上海市市辖区卢湾区', '310103', '3', '2', 'dd', '1', '1', '2015-05-08 12:04:28', '3333', '2', '3333', '3333', '333', '<p>3333</p>', '{\"photo\":[{\"url\":\"554f8fed01536.jpg\",\"alt\":\"20141123115906958\"},{\"url\":\"554f8fed57d5c.jpg\",\"alt\":\"20141123115907667\"},{\"url\":\"554f8feda42c3.jpg\",\"alt\":\"20141123115908280\"}],\"thumb\":\"554f8fd217525.jpg\"}', '{\"org_create_date\":\"2015-05-07\",\"org_area\":\"33\",\"ts_service\":\"23\\u53d1\\u5927\\u6c34\\u53d1\",\"contact_person\":\"\\u7684\\u8428\\u82ac\",\"org_address\":\"\\u7231\\u7684\\u8272\\u653e\\u8428\\u82ac\",\"org_zip_code\":\"\\u5565\\u53d1\\u9001\\u5230\",\"org_net\":\"\\u6492\\u53d1\\u8fbe\",\"org_email\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_trafic\":\"\\u6492\\u5730\\u65b9\\u6492\",\"org_facility\":\"\\u554a\\u53d1\\u9001\\u5230\\u6492\\u65e6\",\"content_service\":\"\\u963f\\u65af\\u8482\\u82ac\\u6309\\u65f6\\u53d1\\u751f\\u7684\",\"org_notice\":\"\\u6309\\u65f6\\u53d1\\u751f\\u53d1\\u751f\\u5927\\u5e45\"}');
INSERT INTO `sp_org` VALUES ('28', '凤凰岭养老院啊', '河南省郑州市金水区', '410105', '4', '1', 'ppker', '1', '1', '2015-05-11 00:59:07', '1000', '1', '3000', '6000', '2147483647', '<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, Arial, 宋体, Verdana, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三亚揶岛港湾海景度假公寓位于风景秀丽的三亚湾路海坡度假中心，距海咫尺之遥。公寓共三栋楼，共有标准间、套间、一室一厅、两室一厅共300余间，高层电梯配置，内部装修豪华设施齐全，拎包入住。A座、F座每房间均有开放式 海景阳台，足不出户便可眺望碧海，观落日夕阳晚照，涛声阵阵，让您下榻本公寓倍感方便和舒适，感受物超所值和家的温馨。 公寓在一楼配置品牌餐厅，让您在游玩的同时还能体会到美食带 来乐趣，本公寓将以优质的品质、合理的价格为每位尊贵的客人 提供吃住玩一条龙的高性价比服务。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, Arial, 宋体, Verdana, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;\"><img src=\"http://localhost:8083/data/upload/ueditor/20150511/554f8fb0930e2.jpg\" title=\"zx.jpg\" alt=\"zx.jpg\"/></span></p>', '{\"photo\":[{\"url\":\"554f8fed01536.jpg\",\"alt\":\"20141123115906958\"},{\"url\":\"554f8fed57d5c.jpg\",\"alt\":\"20141123115907667\"},{\"url\":\"554f8feda42c3.jpg\",\"alt\":\"20141123115908280\"}],\"thumb\":\"554f8fd217525.jpg\"}', '{\"org_create_date\":\"2015-05-05\",\"org_area\":\"233\",\"ts_service\":\"\\u53ef\\u63a5\\u6536\\u5f02\\u5730\\u8001\\u4eba  \\u5177\\u5907\\u533b\\u4fdd\\u5b9a\\u70b9\\u8d44\\u683c\",\"contact_person\":\"ppker\",\"org_address\":\"\\u6cb3\\u5357\\u7126\\u4f5c\\u4e91\\u53f0\\u5c71\\u51e4\\u51f0\\u5cad\",\"org_zip_code\":\"123456\",\"org_net\":\"http:\\/\\/dxinfo.cc\",\"org_email\":\"2548414889@qq.com\",\"org_trafic\":\"\\u5916\\u5730\\u9a7e\\u8f66\\u8def\\u7ebf\\uff1a312\\u56fd\\u9053(\\u9ea6\\u6eaa\\u51fa\\u53e3\\u4e0b)\\u5357\\u4e0e\\u4e39\\u5ef6\\u8def\\u4ea4\\u53c9\\u53e3\\u7ea2\\u53f6\\u9890\\u99a8\\u56ed\\r\\n\\u4e39\\u9633\\u5e02\\u533a\\u2014\\u2014A\\\\\\u4e39\\u9633-\\u5ef6\\u9675\\u4e13\\u7ebf\\uff08\\u7ea2\\u53f6\\u9890\\u99a8\\u56ed\\u7ad9\\u4e0b\\uff09B\\\\\\u4e39\\u9633-\\u4e91\\u6797\\uff08\\u7ea2\\u53f6\\u9890\\u99a8\\u56ed\\u7ad9\\u4e0b\\uff09\",\"org_facility\":\"\\u4e2d\\u5fc3\\u5f00\\u8bbe\\u5eb7\\u590d\\u5668\\u68b0\\u6d3b\\u52a8\\u533a\\uff0c\\u5f15\\u8fdb\\u5148\\u8fdb\\u5eb7\\u590d\\u5668\\u68b0\\r\\n\\u6211\\u4eec\\u4e3a\\u6709\\u9700\\u8981\\u7684\\u8001\\u4eba\\u8fd8\\u63d0\\u4f9b\\u4e13\\u4e1a\\u8db3\\u5e95\\u6309\\u6469\\u3001\\u4e2d\\u533b\\u6309\\u6469\\u3001\\u4e2d\\u533b\\u4fdd\\u5065\\u3001\\u4e2d\\u533b\\u517b\\u751f\\u7b49\\u670d\\u52a1\",\"content_service\":\"\\u672c\\u516c\\u5bd3A\\u5ea7\\u6709\\u8fd1\\u5343\\u5e73\\u7c73\\u7684\\u7a7a\\u4e2d\\u82b1\\u56ed\\uff0c\\u4f9b\\u8001\\u4eba\\u6668\\u7ec3\\u3001\\u4f11\\u606f\\u3001\\u5a31\\u4e50\\u7b49\\uff0c\\u6709\\u4e52\\u4e53\\u7403\\u6d3b\\u52a8\\u533a\\u4e13\\u4e1a\\u6559\\u7ec3\\uff0c\\u5927\\u5385\\u6bcf\\u5929\\u98ce\\u96e8\\u4e0d\\u8bef\\u4e00\\u4e2a\\u5c0f\\u65f6\\u821e\\u8e48\\uff0c\\u8df3\\u821e\\u8005\\u90fd\\u6392\\u5230\\u4e86\\u8def\\u53e3\\uff0c\\u53e6\\u6709\\u4e94\\u767e\\u5e73\\u7c73\\u9910\\u5385\\uff0c\\u83dc\\u54c1\\u7433\\u7405\\u6ee1\\u76ee\\uff0c\\u5168\\u697c\\u65e0\\u7ebfWIFI\\u5149\\u7ea430\\u5146\\u7f51\\u7edc\\u8986\\u76d6\\r\\n\\u63d0\\u4f9b\\u514d\\u8d39\\u63a5\\u673a\\uff0c\\u4ee3\\u8ba2\\u673a\\u7968\\uff0c\\u79df\\u7528\\u672c\\u516c\\u5bd3\\u8f66\\u8f86\\u3002\",\"org_notice\":\"\\u5165\\u4f4f\\u987b\\u77e5\\uff1a\\r\\n1\\u3001\\u751f\\u6d3b\\u80fd\\u591f\\u81ea\\u7406\\uff0c\\u53ef\\u4e0e\\u4eba\\u6c9f\\u901a\\uff0c\\u884c\\u52a8\\u65b9\\u4fbf\\u7684\\u8001\\u4eba\\u3002\\u51e1\\u6709\\u4f20\\u67d3\\u75c5\\u3001\\u7cbe\\u795e\\u75c5\\u3001\\u751f\\u6d3b\\u4e0d\\u80fd\\u81ea\\u7406\\u8005\\u4e0d\\u4e88\\u63a5\\u53d7\\u3002\\r\\n2\\u3001\\u5165\\u4f4f\\u8001\\u4eba\\u5e94\\u9075\\u5b88\\u516c\\u5bd3\\u7684\\u5404\\u9879\\u89c4\\u5b9a\\uff0c\\u6ce8\\u610f\\u9632\\u706b\\u9632\\u76d7\\uff0c\\u6ce8\\u610f\\u4fdd\\u62a4\\u81ea\\u8eab\\u5b89\\u5168\\u3002\\r\\n3\\u3001\\u5b9e\\u884c\\u5206\\u9910\\u5236\\uff0c\\u4e5f\\u53ef\\u81ea\\u884c\\u70b9\\u9910\\uff0c\\u9700\\u53e6\\u5916\\u6536\\u8d39\\u3002\\r\\n4\\u3001\\u6536\\u8d39\\u6807\\u51c6\\u4ee5\\u6708\\u4e3a\\u8ba1\\u7b97\\u5355\\u4f4d\\uff0c\\u4e0d\\u8db3\\u4e00\\u4e2a\\u6708\\u6309\\u6708\\u6536\\u8d39\"}');

-- ----------------------------
-- Table structure for `sp_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `sp_plugins`;
CREATE TABLE `sp_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of sp_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_posts`
-- ----------------------------
DROP TABLE IF EXISTS `sp_posts`;
CREATE TABLE `sp_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_posts
-- ----------------------------
INSERT INTO `sp_posts` VALUES ('1', '1', '联系我们', null, '2015-04-15 12:07:33', '<p>^_^ ^_^ 够胆你就来，呵呵呵，你敢来联系我么。</p>', '联系我们', '^_^ ^_^ 够胆你就来，呵呵呵，你敢来联系我么。', '1', '1', '2015-04-15 12:02:51', null, '0', '2', '', '0', '{\"thumb\":\"\",\"template\":\"contact\"}', '0', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('2', '1', '台州 农村 养老院', '搜狐网', '2015-04-15 18:02:03', '<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; font-size: 16px; line-height: 30px; text-indent: 2em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; “社会养老”三年计划实施，至2017年，全市将建成20分钟居家养老服务圈。</span></p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">“养儿防老”一向是中国农村传统的养老思维，随着经济社会的发展，“社会养老”这一概念被提出，并迅速发展。据统计，2012年至今，我市已累计建成农村养老服务照料中心1973个，居全省首位，向“社会养老”迈开了一大步。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">台州农村老年人口达85.79万</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">据市民政局相关数据统计，目前台州60周岁以上的人口达105.14万，占总人口约17%，远高于国际通行的10%老年化标准，其中农村60周岁以上老年人达85.79万。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">其实早在1991年，我市就进入了老龄化社会，是浙江省最早进入老龄化社会的城市之一。近几年老人人数更是以每年4%的速度增加，养老任务更加沉重，老年人对于健康养老的需求急需得到满足。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">从2014年开始，我市开始着手建立台州地区养老新制度。市民政局连续出台《台州城乡社区居家养老服务照料中心建设实施方案》、《关于进一步加强养老护理人员教育培训工作的实施意见》等相关文件，改善台州的养老现状。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">20分钟居家养老服务圈的建设构想</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">近年来，随着国内经济文化的发展，“养儿防老”这一传统养老思想渐渐被改变，“社会养老”这一概念脱颖而出。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">从2012年到2015年，台州共建立1973家农村居家养老服务照料中心，154家城市社区养老中心，数量居全省首位。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">目前台州正在实施养老3年计划，今年所有的城市社区都要建有居家养老中心，三分之二以上的农村社区要建有居家养老中心。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">预计2017年，我市将基本实现城乡社会居家养老服务照料中心全覆盖。这个计划也被称为打造全市农村社区20分钟居家养老服务圈计划。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">养老也实行O2O模式</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">“社会养老”的蓝图已经画下，那要通过哪些方式来具体实行？台州有哪些养老创新模式？</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">仙居县相对于台州其他发达地区，经济有些薄弱，为了建立新型的养老体制，“慈善基金养老模式”随之被提出。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">所谓的“慈善基金模式”就是通过仙居企业家献爱心的形式，建立慈善基金，将这笔基金作为本金外借，每个月收回来的利息就作为养老中心的运作资金。目前，仙居已经开设58家爱心食堂，35个村庄建立慈善基金，总额达2000万元以上。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">临海东塍镇则创立了村级“孝心基金”制度，由村民自己筹集本村的养老基金，这一制度在临海得到大范围推广，目前，临海共34个社区筹集基金1355.5万元。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">2014年8月，玉环垟青社区照料中心的老人们拿到了特殊的礼物——一部操作简单的“一键通”手机。老人如果身体出现情况，只要轻轻按下手中的“一键通”，信息就会被传递到医院、营养照料中心。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">老人们可以定制救援、营养配餐、养生顾问3个服务。这就是市政府投入270万元建立的居家养老信息服务平台，通俗点说，就是目前电子商务流行的O2O模式被植入了养老体系，线上发布信息，线下得到服务。</p><p style=\"margin: 0px; padding: 12px 0px; border: 0px; font-size: 16px; line-height: 30px; color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, Tahoma; text-indent: 2em;\">除了这些，为了扩充新型养老机制的服务范围，玉环、椒江、三门将部分照料中心与养老院进行配对。玉环天恩家院互融服务中心就和附近20余个照料中心实行配对，双方资源互享。这样的模式能扩大养老服务的范围，也能提高养老质量。</p><p><br/></p>', '台州农村现在有1973个居家养老中心!', '“社会养老”三年计划实施，至2017年，全市将建成20分钟居家养老服务圈。', '1', '1', '2015-04-15 17:54:20', null, '0', null, '', '0', '{\"thumb\":\"552e37098d64c.jpg\"}', '1', '0', '0', '1');
INSERT INTO `sp_posts` VALUES ('3', '1', '无锡军休中心 蓝天护理院', '江苏快讯网', '2015-04-15 18:57:54', '<p><span style=\"font-size: large;\">无锡市军休中心老战士艺术团的志愿者们来到无锡市蓝天护理院，举行志愿者为老服务结对签约、启动仪式。市军休中心老战士艺术团向入住老人赠送了新年慰问小礼品，并送去了一台迎接2015羊年新春的精彩文艺节目。</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size:18px\">&nbsp; &nbsp; 《军马奔驰保边疆》、《常回家看看》、《夕阳红》等一曲曲老人耳熟能详的歌曲，京剧《红灯记》选段《党的光辉照儿永向前》、舞蹈《洗衣歌》等十余个精彩节目，赢得了一阵阵热烈的掌声。老人们纷纷表示，希望这样的活动能经常举办。</span></p><p><span style=\"font-size: large;\"><br/></span><strong>&nbsp; &nbsp;&nbsp;<span style=\"font-size: large;\">&nbsp; &nbsp;</span></strong><span style=\"font-size: large;\">市\r\n军休中心老战士艺术团严峻松团长和无锡市蓝天护理院万常旗院长都是驻锡部队退休干部。在结对签约后，严峻松团长表示，老战士艺术团成立以来，首次与蓝天护\r\n理院签约结对，是因为蓝天护理院是4位退伍军人所开创，并收住了30位多老军人及军人家属在此安居养老，因此感到格外亲切，这也标志着老战士艺术团正式迈\r\n出了走向社会、服务社会的一大步。签约结对满足了军休干部不断增长的精神文化需求和对军休生活呈现出的高层次、多样化追求。万常旗院长说，市军休中心老战\r\n士艺术团与该院为老服务结对启动，标志着市军休中心军休干部与护理院老人之间架起了互帮、互助、互动桥梁，军休干部以实际行动传承“雷锋”精神，将帮助护\r\n理院对老人精神上的慰藉服务落到实处，推向深层次。他表示，护理院将选择合适时机进行回访。</span></p><p><br/></p>', '无锡军休中心牵手蓝天护理院', '无锡市军休中心老战士艺术团的志愿者们来到无锡市蓝天护理院，举行志愿者为老服务结对签约、启动仪式。市军休中心老战士艺术团向入住老人赠送了新年慰问小礼品', '1', '1', '2015-04-15 18:56:05', null, '0', null, '', '0', '{\"thumb\":\"552e442bbef72.jpg\"}', '1', '0', '0', '1');
INSERT INTO `sp_posts` VALUES ('4', '1', '中医 养生 生姜', '去哪儿养老', '2015-04-15 21:17:06', '<p><img src=\"http://localhost:8081/data/upload/ueditor/20150415/552e64832c193.jpg\" title=\"sj.jpg\" alt=\"sj.jpg\"/><br/></p><p><span style=\"text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; display: inline !important; font: 14px/25px 宋体; white-space: normal; float: none; letter-spacing: normal; color: rgb(0,0,0); word-spacing: 0px; -webkit-text-stroke-width: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;无\r\n论是蒸鱼做菜，或是调味佐料，生姜绝对是桌上一味。其辛辣滋味既可去鱼腥、辟膻味又可将自身的特殊气息渗入菜肴当中，使之鲜美可口菜汤中予以数片，可祛寒\r\n和中，味道清香。但凡烹制猪、牛、羊肉及各类野味美馔皆用之。君不见桌上美味有如姜汁热窝鸡、姜汁肘子、姜汁豇豆、姜汁鸭掌等风味菜肴小巧有如姜茸、姜\r\n片、姜葱末甜蜜有如姜醋、姜汁奶。</span></p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">&nbsp;&nbsp;&nbsp;\r\n \r\n俗话常说“饭不香，吃生姜。”吃饭不香或饭量减少时吃上几片姜或者在菜里放上一点嫩姜，能够改善食欲，增加饭量。着凉、感冒时不妨熬些姜汤，能够起到很好\r\n的预防、治疗作用。胃溃疡、虚寒性胃炎、肠炎以及风寒感冒也可服生姜以散寒发汗、温胃止吐、杀菌镇痛。生姜还是传统的治疗恶心、呕吐中药，有“呕家圣药”\r\n之誉。生姜，不独食材，实为药食同源。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　\r\n　如此种种，皆因生姜的神奇功效。生姜辛温，具有促进血行、祛散寒邪的作用。内里富含挥发油，可加速血液循环。生姜的姜辣素，具有刺激胃液分泌、兴奋肠\r\n道、促使消化的功能。人体在进行正常新陈代谢生理功能时，会产生一种有害物质――氧自由基，促使机体发生癌症和衰老。生姜中的姜辣素进入体内后，能产生一\r\n种抗氧化酶，它有很强的对付氧自由基的本领，甚至比维生素E还要强得多，因此，吃姜确能抗衰老，老年人常吃可除“老年斑”。生姜里还含有姜酚，可减少胆结\r\n石的发生。民间“上床萝卜下床姜”一说，不无虚假。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">&nbsp;&nbsp;&nbsp;\r\n \r\n中医认为，姜是助阳之品，于是自古以来中医素有“男子不可百日无姜”之语。现代临床药理学研究发现，姜具有加快人体新陈代谢、抗炎镇痛、同时兴奋人体多个\r\n系统的功能,还能调节男性前列腺的机能，治疗中老年男性前列腺疾病以及性功能障碍，因此，姜常被用于男性保健。姜含挥发性姜油酮和姜油酚，有活血、祛寒、\r\n除湿、发汗之功特别是姜具有利胆、健胃止呕、辟腥臭、消水肿的作用，与蜂蜜合用对肝病恢复有益。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　　若然男性常感胃寒、食欲不振，可以经常含服鲜姜片，刺激胃液分泌，促进消化。鲜姜滋润而不伤阴，每天切四五薄片鲜生姜，早上起来饮一杯温开水，然后将姜片放在嘴里慢慢咀嚼，让生姜的气味在口腔内散发，扩散到肠胃内和鼻孔外。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　\r\n　不仅如此，干姜入菜也能治疗肾虚阳痿。现小编推荐一款有益男性健康的药膳，简单易烹。取雄鲤鱼1尾(约500克)，干姜、枸杞子各10克。取鲤鱼肚内之\r\n鱼G(雄鱼腹中白色果冻样物质，为雄鱼精囊腺)，加入干姜、枸杞子同煎。煮开，加料酒、盐、味精适量调味即成。空腹时服食，隔日吃1次，连服5日。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　　干姜温中散寒，健胃活血，枸杞子滋补肝肾，益精明目，此药膳可以治疗由于肾阳虚衰引起的阳痿、畏寒肢冷、腰疼、腰膝酸软、倦怠等。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">古\r\n药书云“生姜辛温，行阳分而祛寒发表，宣肺气而解郁调中，畅胃口而开痰下食，治伤寒头痛、伤风鼻塞、胸壅痰隔、寒痛湿泻，清水气、行血痹。”、“炮姜辛苦\r\n大热，除胃寒而守中，温经止血，定呕消痰，去脏腑沉寒痼冷……”中医常用姜作佐药使药。产后女子坐月子餐餐以姜醋佐膳，省内各地皆然，生姜或佐以猪脚鸡蛋\r\n猪肠加乌醋盐糖煲，或切成姜茸佐鸡蛋糖醋蒸，皆取其药效，适宜于产妇体质复原，也有利于喂养婴孩者。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　\r\n　另外，煲姜水洗浴也可防风湿头痛。据广东省中医院药师佘自强说，“产妇坐月子不洗头洗澡”的说法是不科学的。广州的天气比较湿热，尤其是在夏天，如果一\r\n个月不洗头，不但不卫生，还可能造成皮肤发炎、长痱子。广州人产后喜用姜片煲水洗头洗澡，甚至洗脸洗手，是有科学根据的。因为姜片可以驱寒，用姜煲水进行\r\n洗浴，可以防风湿和偏头痛。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">生姜，多加工成丝、片、末、汁来入菜，是炒、煮、炖、蒸、拌中不可缺少的佐料。生姜的运用范围是最广泛，我们常说的老姜，泛指生姜。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　　子姜，则是生姜的嫩芽，为时令鲜蔬，季节性强，可作辅料、腌渍成泡姜或切丝生食，如子姜肉丝、子姜爆鸭、泡子姜就是用子姜或泡姜作的。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　　干姜，是姜的干燥根茎，主温中，能温中散寒、回阳通脉、温肺化饮，主治脾胃虚寒、吐泻、亡阳、寒喘咳等症状。干姜在川菜中常用来煮汤食用。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　　姜，素以药食俱佳见称，经常食用能保健强身，养生益寿。然而，万物进食需有时，古代医书中也出现这样的“警示”“一年之内，秋不食姜一日之内，夜不食姜。”秋天气候干燥、燥气伤肺再吃辛辣的生姜，容易伤害肺部，加剧人体失水、干燥。</p><p style=\"padding-bottom: 0px; text-transform: none; background-color: rgb(250,252,255); text-indent: 0px; margin: 10px auto; padding-left: 0px; padding-right: 0px; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0,0,0); overflow: hidden; word-spacing: 0px; padding-top: 0px; -webkit-text-stroke-width: 0px\">　　吃姜一次不宜过多，以免吸收姜辣素，在经肾脏排泄过程中会刺激肾脏，并产生口干、咽痛、便秘等上火症状。另外，烂姜、冻姜不要吃，因为姜变质后会产生致癌物。</p><p style=\"padding: 0px; text-transform: none; background-color: rgb(250, 252, 255); text-indent: 0px; margin: 10px auto; font: 14px/25px 宋体; word-wrap: break-word; white-space: normal; letter-spacing: normal; color: rgb(0, 0, 0); overflow: hidden; word-spacing: 0px;\">　\r\n　民谚素有“家备小姜，小病不慌”、“夏季常吃姜，益寿保安康”、“冬吃萝卜夏吃姜，不劳医生开药方”、“四季吃生姜，百病一扫光”、“早吃三片姜，胜过\r\n人参汤”。诸多民谚都反映了生姜的保健功效。姜之益处毋需赘言，烹制美食或入药调理乃食物一绝。生姜独具如此功效，或许可以成为你家中一宝。</p>', '[中医养生]生姜食疗方', '无论是蒸鱼做菜，或是调味佐料，生姜绝对是桌上一味。其辛辣滋味既可去鱼腥、辟膻味又可将自身的特殊气息渗入菜肴当中，使之鲜美可口菜汤中予以数片，可祛寒和中，味道清香。', '1', '1', '2015-04-15 21:12:06', null, '0', null, '', '0', '{\"thumb\":\"552e64c68cdcb.jpg\"}', '2', '0', '0', '1');
INSERT INTO `sp_posts` VALUES ('5', '1', '养生 小动作 保健', '去哪儿养老', '2015-04-15 21:34:50', '<p style=\"text-align: center\"></p><p style=\"text-align: center;\"><img style=\"width: 350px; height: 400px;\" src=\"http://localhost:8081/data/upload/ueditor/20150415/552e687e3b7b4.jpg\" title=\"05 (2).jpg\" alt=\"05 (2).jpg\" border=\"2\" height=\"400\" vspace=\"1\" width=\"350\"/></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">&nbsp;&nbsp;&nbsp;&nbsp;养生并不是什么麻烦的事，其实只要我们平时多注意些细节就能够起到很好的养生保健作用。那么有哪些是我们日常生活中就能做到的，同时还具有防病保健简单动作呢?接下来就有小编给大家介绍下吧。</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　<strong>几个简单疗法防病保健</strong></span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　由于我们现在的生活质量的飞速提高，不少人对于健康也是非常的重视了，对于保健养生尤为的注重。其实养生是很简单的，并不要我们可以的去做一些事情。</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　生活上一些常见的场景，常见的小动作同样可以起到养生的作用，像是：拍手、松肩、揉膝这类小的动作，也是最好的养生保健方法，在中医里面，这些与艾灸、拔罐、刮痧一起被称为自疗保健法。今天，将为大家介绍几种最简单，易操作，保健效果好的方法，让你简简单单实现养生。</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　<strong>松肩</strong></span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　练出酸胀感\r\n对久坐的办公一族来说，松肩算得上一门“必修课”。这个群体每天的运动量有限，平日肩胛周围的肌肉，都处于紧张状态。久而久之，肌肉紧缩变硬，压迫血管，\r\n阻碍血液循环流通，就会出现肩膀酸痛等症状。“松松肩，可以活血、活跃关节，同时增强肌肉活力，减少肩关节炎、肌肉痉挛、颈椎病，甚至缓解胸痛、心闷症\r\n状。”</span></span></p><p class=\"pictext\" style=\"text-align: left;\"><strong>&nbsp; </strong><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\"><strong>&nbsp; &nbsp;拍手</strong></span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　早晚各一次\r\n许多人会用拍手表示欢迎，表达喜悦，却往往不知道与拍手相关的另一个好东西——保健。“拍手保健自古就有，尤其适合老年人。”在接受《生命时报》记者采访\r\n时，北京中医药大学附属东直门医院内科姜良铎教授说。中医理论认为，所有疾病都是气血失调造成的，气的顺畅与否会影响生理机能、机体平衡、血液循环系统、\r\n呼吸系统、消化系统、免疫系统等。长期坚持拍手，可促进气血通畅，增加机体热度，从而增强体质，预防多种慢性病，对预防老年痴呆也很有效。</span></span></p><p>&nbsp;</p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　拍手一般早\r\n晚各一次，刚开始拍，别太猛烈，要循序渐进。另外，吃得太饱或刚吃完饭，以及两餐中间应避免使用这种疗法，以免影响消化功能。一般来说，正常人每天清晨拍\r\n5分钟，就可激发全天活力。孕妇不宜发出太大声响，可以将两手隆起，成拱形，用空掌心拍。老人体弱，拍手时，最好一边走路、踏步，一边拍，否则，气血会过\r\n多灌注于两手，双脚会感到无力。</span></span></p><p class=\"pictext\" style=\"text-align: left;\"><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\"><strong>&nbsp; &nbsp; 熨目</strong></span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　热手反复敷相传我国古代的长寿者彭祖经常用熨目、拭鼻来养生。其中，熨目在《诸病源候论·目暗不明候》中，有“鸡鸣，以两手相摩令热，以熨目，三行，以指抑目。左右有神光、令目明、不病痛”的叙述。</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　“把两手掌\r\n搓热，放在眼皮上。凉了再搓热，如此反复，每天都做，多多益善。”刘长信指出了熨目的要点。而姜良铎看来，熨目不仅可以敷，也可以用手掌或手指以直线或螺\r\n旋形的方式反复拭摩两眼，尤其适合如下人群：若自疗时多泪，可加用指压翳风、承泣穴;若眼部胀痛，可揉压眼球;若头部眩晕，可多指揉压两颞(头颅两侧靠近\r\n耳朵的部分，简称“颞”)，单拇指按压印堂;若近视，可重点按摩睛明、太阳、阳白、四白等穴位。</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　一般来说，刚刚吃过饭时，不要急于熨目，一般应在饭后2小时左右效果最佳。按的方向，一般应沿着静脉、淋巴流动的方向进行，但淋巴结的部位不宜做按摩。用力先轻后重，再由重到轻。</span></span></p><p class=\"pictext\" style=\"text-align: left;\"><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\"><strong>&nbsp; &nbsp; 揉膝</strong></span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　每分钟30下揉膝，这个简单的动作蕴含着很多保健常识。中医里所说的揉膝，是指采取站立、高坐、盘坐、深蹲或者仰卧的姿势，两手掌含虚，紧贴在两膝部位，做圆周揉摩。其手法属于传统按摩手法中的揉法，操作简洁，易于练习。</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　“手法上，还可以用拇指或掌跟，在膝盖两侧按压。另外，捏或捶也可以。”刘长信指出，按摩的频率最好为每分钟三四十下，力度以有酸胀感为宜，如果有发热感觉，则效果更佳。整个揉膝动作，速度要均匀缓慢、连贯圆活，幅度适中。</span></span></p><p>&nbsp;</p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　“老年人下\r\n肢循环不好，尤其适用此法。”姜良铎教授说，另外，老人的腿脚到了下午或晚上会肿一些，揉膝盖的时候可以稍微抬高一点。注意要穿较宽松的布鞋，因为绷住脚\r\n面皮肤的鞋子会导致脚部经络不畅，让老人腿脚更无力。女性可试将鞋跟垫高或穿半高跟鞋，以减少膝关节的过度活动，减轻膝关节负担，预防膝关节胀痛。</span></span></p><p class=\"pictext\" style=\"text-align: left;\"><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\"><strong>&nbsp; &nbsp; 拉筋</strong></span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　腿麻不要停“老筋太短，寿命难长!”“筋长一寸，寿延十年。”这些俗语听起来很朴素，却有深刻的医学内涵，是数千年来中国养生保健经验的口头传承。因此自疗也讲究“骨正筋柔，气血自流”。</span></span></p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　拉筋方法有很多种，其中立位拉筋法的方法如下：1.找到一个门框，双手上举扶两边门框，尽量伸展开双臂;2.一脚在前，站弓步，另一脚在后，腿尽量伸直;3.身体正好在与门框平行，头直立，双目向前平视;4.以此姿势站立三分钟，再换一条腿站弓步，站立三分钟。</span></span></p><p>&nbsp;</p><p><span style=\"font-size: 14px;\"><span style=\"font-family: 宋体;\">　　“拉筋要特别注意两点，一是不要太狠;二要做好准备活动。”姜良铎提醒。同时，也不要因为感觉被拉的部位麻、酸痛而轻易放弃。</span></span></p>', '养生不麻烦！几个简单小动作来保健', '养生并不是什么麻烦的事，其实只要我们平时多注意些细节就能够起到很好的养生保健作用。那么有哪些是我们日常生活中就能做到的，同时还具有防病保健简单动作呢?接下来就有小编给大家介绍下吧。', '1', '1', '2015-04-15 21:28:28', null, '0', null, '', '0', '{\"thumb\":\"552e68f1e7ada.jpg\"}', '2', '0', '0', '1');
INSERT INTO `sp_posts` VALUES ('6', '1', '星巴克 咖啡师 南昌 爱心养老院', '中新网', '2015-04-22 20:01:26', '<p style=\"text-align: center\"><img style=\"width: 450px; height: 330px;\" src=\"http://localhost:8081/data/upload/ueditor/20150422/55378d2464595.jpg\" title=\"xbk.jpg\" alt=\"xbk.jpg\" border=\"0\" height=\"330\" vspace=\"0\" width=\"450\"/></p><p><span style=\"font-size: large;\">&nbsp;&nbsp;&nbsp;&nbsp;年龄相差半个多世纪的老少两代人在一起，温馨快乐的场景令年轻人落泪。4月17日，一群来自星巴克的身穿绿色T恤的年轻人，出现在南昌市爱心养老院里。</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">一\r\n个上午的时间，40多位志愿者陪着老人聊天、下棋，一起唱起革命年代的歌曲;给老人整理床铺，帮老人画肖像画;双手奉上热水和糕点，喂老人一口一口吃东\r\n西。据介绍，南昌市爱心养老院里住着90多位老人，其中七成以上是70-80岁的老人家，有很多生活不能自理。尽管院方给予了无微不至的照料，但情感上的\r\n孤独却是医疗技术无法弥补的。</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">年\r\n轻的星巴克志愿者中，有大约20多位咖啡师，另外十几人则由热心的顾客和亲友组成。其中许多人都是90后，甚至还有一些顾客，是特意请假一起前来。虽然年\r\n龄相差半个多世纪，但满怀爱心的举动消解了暂时的陌生。“孩子你在哪里工作啊?”“星巴克。”“星什么?”“没什么，爷爷我陪您下棋吧!”......半\r\n小时后，年轻的志愿者主动“认输”：“爷爷真厉害!下的太好了。”老人脸上绽开孩童般的笑容。另一位咖啡师Iris给老人们画起了素描肖像，惟妙惟肖的神\r\n情跃然纸上，引起了老人们的围观。</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">“陪\r\n伴就是最长情的告白。”南昌红谷滩万达星巴克的店经理Crystal说，“老爷爷和老奶奶一看到我们，每个人都说很开心，很感谢!心中突然一酸，有点难\r\n过。听老人们和我说了很多年轻时候的故事。最后到一个老爷爷那里的时候，他还给我取了一个外号：小胖子!临走还一个劲的说：小胖子，你要好好工作，找个对\r\n象，好好注意身体哦!真的好暖。这也是我一直在星巴克工作的原因之一，因为我们真的在身体力行回报社区，践行我们能够做的。”</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">“临走时老人们一次次说，一定要再来啊。那场面，太戳泪点了。”组织活动的中山天虹星巴克咖啡师Lisa说：“其实陪伴就是对老人们最好的关怀。我们的星巴克伙伴一定还会再来这里，把社区服务用心传承下去!”</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">“下次这样的活动我还会报名。”一位顾客说，“平时只是去店里喝咖啡，没想到星巴克的员工还坚持做这样的公益活动，没有一点虚伪和装饰，踏踏实实、感恩回报的感觉很好。”</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">背景：星巴克全球服务月</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">“全球服务月”活动是星巴克社区服务项目的一部分。</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">44\r\n年来，星巴克在当地社区一直发挥着重要作用。目前，星巴克已在全球超过66个国家开设超过2万家门店，星巴克日益意识到，可以利用自身规模优势为社区带来\r\n积极的影响。2011年，为庆祝公司成立四十周年，星巴克正式在全球范围内发起“全球服务月”活动，并将每年的四月确定为星巴克服务月。</span></p><p><span style=\"font-size: large;\"><br/></span><span style=\"font-size: large;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size: large;\">自2011年全球服务月发起以来，星巴克中国也开展了各种规模的社区服务活动，并正式推出“绿色社区”的服务模式。在星巴克门店所在城市，我们的伙伴将邀请亲朋好友、顾客和外部志愿者一起，积极参与到全球服务月的活动中，包括环境改善、环保小课堂、社区探访等。</span></p>', '星巴克咖啡师携手顾客走进南昌爱心养老院', '一个上午的时间，40多位志愿者陪着老人聊天、下棋，一起唱起革命年代的歌曲;给老人整理床铺，帮老人画肖像画;双手奉上热水和糕点，喂老人一口一口吃东西。据介绍，南昌市爱心养老院里住着90多位老人，其中七成以上是70-80岁的老人家，有很多生活不能自理。尽管院方给予了无微不至的照料，但情感上的孤独却是医疗技术无法弥补的。', '1', '1', '2015-04-22 19:56:10', null, '0', null, '', '0', '{\"thumb\":\"55378d7929f8e.png\"}', '2', '0', '0', '1');
INSERT INTO `sp_posts` VALUES ('7', '1', '零陵区 老年大学 陈凤英', '光明网', '2015-04-22 20:09:59', '<p style=\"text-align: center;\"><img style=\"width: 450px; height: 345px;\" alt=\"04.jpg\" src=\"http://localhost:8081/data/upload/ueditor/20150422/55378eea2e567.jpg\" title=\"04.jpg\" border=\"0\" height=\"345\" vspace=\"0\" width=\"450\"/></p><p><span style=\"font-size: large;\">&nbsp;&nbsp;&nbsp;&nbsp;陈凤英，今年68岁，2003年她从零陵区政协主席岗位上退下来后，担任零陵区\r\n老年大学校长。她退休不退志，为零陵区老年教育事业做出了重大贡献。2007年，区老年大学被评为“全省示范性老年大学”。她本人曾获“全市三好老干\r\n部”、“全市先进老年教育工作者”等荣誉称号。2015年1月，被省委组织部、省委老干部局授予“全省离退休干部先进个人”荣誉称号。</span></p><p><span style=\"font-size: large;\"><br/></span></p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">2003\r\n年3月，陈凤英出任零陵区老年大学首任校长，面对的是一所“三无”学校：无场地、无资金、无人员，陈凤英没有气馁，下定决心要把老年大学办起来，她主动争\r\n取零陵区委、区政府领导的重视，争取相关部门的支持。上任当年就从有关单位筹集资金6万元，修好了进出学校的通道。聘请5名教师，借用区老干部局办公室作\r\n教室，把零陵区老年大学办起来了。</span></p><p>&nbsp;</p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">为\r\n了解决老年大学的教学场地问题，陈凤英拉下脸皮，不辞辛苦，向区委主要领导汇报。“苍天不负有心人”。2012年9月，区委常委会决定由区财政预算外投资\r\n400余万元，建一栋面积2780平方米的区老年大学教学楼。在建教学楼的9个月里，从规划设计到施工装修，陈凤英每天和工程人员在一起，察质量，催进\r\n度，找经费，解难题，经过9个月的紧张施工，一栋雄伟壮观的教学楼拔地而起，圆了零陵区10万老年人的学堂梦。但她自己却瘦了10多斤。</span></p><p><span style=\"font-size: large;\"><br/></span></p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">新\r\n教学大楼启用后，教学设备仍缺，在区委、区政府的高度重视下，房子有了，设施也全了，老年大学办学经费逐年增长，从初期的每年3万元，2010年增加到\r\n4.5万元、2013年增加到8万元，2014年增加到16万元。陈凤英办学的工作经验，得到了省、市相关领导的肯定和关注。2014年11月，她代表区\r\n老年大学在全省老年教育工作会议上作典型发言。</span></p><p><span style=\"font-size: large;\"><br/></span></p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">陈\r\n凤英经常找老年朋友谈心，帮助老年人增长知识、陶冶情操、发挥余热。她还经常组织师生参加社会公益活动。积极响应“创卫”、“创森”号召，组织师生开展\r\n“靓丽零陵献余热”活动，参加义务巡逻协管和卫生宣传，为四川泸县和雅安地震灾区人民募捐，到聋哑学校助残，为残障儿童演出，受到了社会的广泛赞誉。</span></p><p><span style=\"font-size: large;\"><br/></span></p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">陈\r\n凤英利用学校这块阵地，弘扬真善美，传播正能量，始终与党委、政府保持一致，维护社会和谐稳定。2013年12月，部分老干部要组织200多人到市政府上\r\n访，她知道后，立即做他们的思想工作，平息了这次上访。事后区政府领导赞扬她“退休了还关心区里的工作。”办学12年来，全校无一例上访影响稳定的事件。</span></p><p><span style=\"font-size: large;\"><br/></span></p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">在\r\n陈凤英的带领下，全校师生共同努力和辛勤工作，学校规模不断扩大，开设了绘画、书法、拳剑、音乐、中医保健、健康管理、舞蹈、器乐、戏曲、电脑、编艺、交\r\n谊舞、柔力球、健身球等14门课程。培养造就了一批批优秀人才，老年教育硕果累累。学员唐初春2013年入选“魅力中国书画五大名家”，书画作品选入《中\r\n国顶尖书画家特刊》。学员谢定程2007年入选“中国当代最具影响力书画家”，其作品选入《中国当代书法名家名作大典》、《中国当代最具影响力书画家珍品\r\n集》。</span></p><p><span style=\"font-size: large;\"><br/></span></p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">学\r\n校艺术团组织学员积极参与社会的活动，在市、区乃至全省、全国文体比赛中都取得了较好的成绩。2008年拳剑队参加全国太极拳比赛获金牌8枚，2009年\r\n参加香港太极拳杯比赛获3金2银，2010年参加全省老年太极拳比赛获第一名。2013年参加全国柔力球比赛获一等奖，2010年瑶族歌舞《赛鼓咚咚》参\r\n加永州市群众文艺调演荣获二等奖。2012年零陵渔鼓《老年大学好》参加全省老年大学文艺汇演获最佳创作奖。2014年健身球表演《中国美》参加零陵区\r\n“群舞飞扬”广场舞大赛获二等奖。</span></p><p><span style=\"font-size: large;\"><br/></span></p><p><span style=\"font-size: large;\">&nbsp; &nbsp; </span><span style=\"font-size: large;\">零陵区老年大学取得的成绩，无不饱含着陈凤英的心血和汗水，更是她辛勤耕耘的成果。面对这些荣誉，她总是淡淡一笑：“这都是我一个老干部应该做的。”</span></p>', '散尽余热写春秋——记零陵区老年大学校长陈凤英', '陈凤英，今年68岁，2003年她从零陵区政协主席岗位上退下来后，担任零陵区老年大学校长。她退休不退志，为零陵区老年教育事业做出了重大贡献。2007年，区老年大学被评为“全省示范性老年大学”。她本人曾获“全市三好老干部”、“全市先进老年教育工作者”等荣誉称号。2015年1月，被省委组织部、省委老干部局授予“全省离退休干部先进个人”荣誉称号。', '1', '1', '2015-04-22 20:03:46', null, '0', null, '', '3', '{\"thumb\":\"55378f8e97dd1.jpg\",\"photo\":[{\"url\":\"554605aae310e.jpg\",\"alt\":\"25_399720_202e610a4eb27b5\"}]}', '3', '0', '0', '1');
INSERT INTO `sp_posts` VALUES ('8', '1', '测试 图片 流', '原创', '2015-05-04 12:53:23', '<p>阿斯顿发大水阿斯顿发大水阿斯顿发大水<br/></p>', '测试图片流', '阿斯顿发大水', '1', '1', '2015-05-04 12:53:05', null, '0', null, '', '0', '{\"thumb\":\"\",\"photo\":[{\"url\":\"5546fb5a021e2.jpg\",\"alt\":\"25_399720_180f056eacb3614\"},{\"url\":\"5546fb5a3f819.jpg\",\"alt\":\"25_399720_202e610a4eb27b5\"},{\"url\":\"5546fb5a82ed0.jpg\",\"alt\":\"25_399720_0489fbb0ccf8871\"},{\"url\":\"5546fb5ac4731.jpg\",\"alt\":\"25_399720_3496ab634e15f3b\"}]}', '0', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('9', '1', 'aa', 'aa', '2015-05-04 12:56:20', '<p>aaaa<br/></p>', 'aa', 'aa', '1', '1', '2015-05-04 12:55:41', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `sp_role`
-- ----------------------------
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_role
-- ----------------------------
INSERT INTO `sp_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `sp_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_user`;
CREATE TABLE `sp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_route`
-- ----------------------------
DROP TABLE IF EXISTS `sp_route`;
CREATE TABLE `sp_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_route
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_slide`
-- ----------------------------
DROP TABLE IF EXISTS `sp_slide`;
CREATE TABLE `sp_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` bigint(20) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_pic` varchar(255) DEFAULT NULL,
  `slide_url` varchar(255) DEFAULT NULL,
  `slide_des` varchar(255) DEFAULT NULL,
  `slide_content` text,
  `slide_status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) DEFAULT '0',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `sp_slide_cat`;
CREATE TABLE `sp_slide_cat` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` text,
  `cat_status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_terms`
-- ----------------------------
DROP TABLE IF EXISTS `sp_terms`;
CREATE TABLE `sp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_terms
-- ----------------------------
INSERT INTO `sp_terms` VALUES ('1', '列表演示', '', 'article', '', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('2', '瀑布流', '', 'article', '', '0', '0', '0-2', '', '', '', 'list_masonry', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('10', '养生健身', '', 'article', '关注健身，关注健康，开心每一天。', '0', '0', '0-10', '养生健身', '养生健身', '关注健身，关注保养，关注健康。', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('8', '新闻中心', '', 'article', '各种各样的养老新闻，关心养老知识。', '0', '0', '0-8', '养老新闻', '养老新闻', '养老行业的新闻，各种新闻。', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('9', '养老政策', '', 'article', '国家的养老政策，关爱老人，关注养老。', '0', '0', '0-9', '养老政策', '养老政策', '世界各地的养老政策。', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('7', '养老院查询', '', 'article', '养老院查询，条件查询，地图查询，各种养老院查询。', '0', '0', '0-7', '养老院查询', '养老院，查询', '养老院查询，各种条件的查询，地图位置查询。', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('11', '机构加盟', '', 'article', '养老机构加盟平台', '0', '0', '0-11', '机构加盟', '机构加盟', '养老院，养老机构，养老机构加盟，养老机构平台。', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for `sp_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `sp_term_relationships`;
CREATE TABLE `sp_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_term_relationships
-- ----------------------------
INSERT INTO `sp_term_relationships` VALUES ('1', '2', '8', '6', '1');
INSERT INTO `sp_term_relationships` VALUES ('2', '3', '9', '5', '1');
INSERT INTO `sp_term_relationships` VALUES ('3', '4', '10', '4', '1');
INSERT INTO `sp_term_relationships` VALUES ('4', '5', '10', '3', '1');
INSERT INTO `sp_term_relationships` VALUES ('5', '6', '8', '2', '1');
INSERT INTO `sp_term_relationships` VALUES ('6', '7', '8', '1', '1');
INSERT INTO `sp_term_relationships` VALUES ('7', '8', '10', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('8', '9', '10', '0', '1');

-- ----------------------------
-- Table structure for `sp_users`
-- ----------------------------
DROP TABLE IF EXISTS `sp_users`;
CREATE TABLE `sp_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_users
-- ----------------------------
INSERT INTO `sp_users` VALUES ('1', 'admin', 'c535018ee946b418db5dc6a5a6672a365f08a4ab003489af', 'admin', '2548414889@qq.com', 'http://dxinfo.cc', null, '0', '2015-05-05', '海阔天空', '127.0.0.1', '2015-05-11 00:14:13', '2015-04-15 11:33:41', '', '1', '0', '1');
INSERT INTO `sp_users` VALUES ('2', 'ppker1', 'c535018ee9466a148418dea5a14fb9417c87e3fbef3889af', 'ppker1', '1366525100@qq.com', '', '5537a85edaef2.jpg', '0', null, null, '127.0.0.1', '2015-05-01 18:21:08', '2015-04-22 20:59:05', '', '1', '0', '2');
INSERT INTO `sp_users` VALUES ('3', 'ppker3', 'c535018ee9466a148418dea5a14fb9417c87e3fbef3889af', 'ppker3', '23423432@qq.com', '', null, '0', null, null, '127.0.0.1', '2015-04-22 23:14:27', '2015-04-22 23:14:27', '', '1', '0', '2');
INSERT INTO `sp_users` VALUES ('4', 'dxinfo0', 'c535018ee9466a148418dea5a14fb9417c87e3fbef3889af', 'dxinfo0', '1366525101@qq.com', '', null, '0', null, null, '127.0.0.1', '2015-04-22 23:19:40', '2015-04-22 23:19:40', '', '1', '0', '2');

-- ----------------------------
-- Table structure for `sp_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_favorites`;
CREATE TABLE `sp_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user_favorites
-- ----------------------------
