/*
Navicat MySQL Data Transfer

Source Server         : center
Source Server Version : 50703
Source Host           : 116.18.228.114:3306
Source Database       : basep

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-04-05 08:33:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_activity_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_info`;
CREATE TABLE `tb_activity_info` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `HOMEPAGEP` varchar(100) DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `IS_PUSH_HOMEPAGE` varchar(2) DEFAULT NULL,
  `ACTIVIY_DESC` text,
  `ASTATUS` varchar(2) DEFAULT NULL,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  `MODIFIEDID` varchar(36) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `DELETEDFLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_activity_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_activity_pics
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_pics`;
CREATE TABLE `tb_activity_pics` (
  `ID` varchar(36) NOT NULL,
  `ACT_ID` varchar(36) DEFAULT NULL,
  `PSESC` varchar(100) DEFAULT NULL,
  `PURL` varchar(100) DEFAULT NULL,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  `MODIFIEDID` varchar(36) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `DELETEDFLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_activity_pics
-- ----------------------------

-- ----------------------------
-- Table structure for tb_act_member_ref
-- ----------------------------
DROP TABLE IF EXISTS `tb_act_member_ref`;
CREATE TABLE `tb_act_member_ref` (
  `ID` varchar(36) NOT NULL,
  `ACT_ID` varchar(36) DEFAULT NULL,
  `MEMBER_ID` varchar(36) DEFAULT NULL,
  `NO` int(11) DEFAULT NULL,
  `VOTENUM` int(11) DEFAULT NULL,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_act_member_ref
-- ----------------------------

-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config` (
  `CONFIG_KEY` varchar(50) NOT NULL COMMENT '配置项',
  `CONFIG_VALUE` varchar(300) DEFAULT NULL COMMENT '配置值',
  `DESCRIPTION` varchar(300) DEFAULT NULL COMMENT '配置项功能描述',
  `READ_ONLY` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '运行时是否只读，0非只读；1只读',
  PRIMARY KEY (`CONFIG_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of tb_config
-- ----------------------------
INSERT INTO `tb_config` VALUES ('SIEES_COMPANY_NAME', '涵曦有限公司', '公司名称', '0');
INSERT INTO `tb_config` VALUES ('SITES_ADDRESS', null, '地址', '0');
INSERT INTO `tb_config` VALUES ('SITES_EMAIL', null, '邮箱', '0');
INSERT INTO `tb_config` VALUES ('SITES_NAME', '涵曦有限公司', '公司名称', '0');
INSERT INTO `tb_config` VALUES ('SITES_NAME2', '涵曦有限公司2', '公司名称2', '0');
INSERT INTO `tb_config` VALUES ('SITES_PHONE', null, '手机号码', '0');
INSERT INTO `tb_config` VALUES ('SITES_POSTCODE', null, '邮编', '0');
INSERT INTO `tb_config` VALUES ('SITES_PRINCIPAL', null, '负责人', '0');
INSERT INTO `tb_config` VALUES ('SITES_TEL', null, '固定电话', '0');
INSERT INTO `tb_config` VALUES ('SITES_URL', 'hxds.wsdict.com', '网站网址', '0');

-- ----------------------------
-- Table structure for tb_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionary`;
CREATE TABLE `tb_dictionary` (
  `ID` varchar(36) NOT NULL COMMENT '主键',
  `DICT_TYPE` varchar(80) DEFAULT NULL COMMENT '字典类型',
  `DICT_TYPE_DESC` varchar(80) DEFAULT NULL COMMENT '字典类型描述',
  `ITEM_CODE` varchar(80) DEFAULT NULL COMMENT '字典分类码',
  `ITEM_CODE_DESC` varchar(80) DEFAULT NULL COMMENT '字典分类描述',
  `PARENT_ID` varchar(36) DEFAULT NULL COMMENT '父节点ID',
  `LEVEL` int(3) DEFAULT NULL COMMENT '级别，0为根',
  `IS_DEL` int(3) DEFAULT '0' COMMENT '1删除 0未删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='常用字典表';

-- ----------------------------
-- Records of tb_dictionary
-- ----------------------------
INSERT INTO `tb_dictionary` VALUES ('0e3cc5d2-3bf6-4759-8329-55b5232884b4', 'personSex', '性别', '0', '男', 'd9749a85-fc14-4dae-bd5c-79ce0518749c', '1', '0', '2017-04-03 17:30:15');
INSERT INTO `tb_dictionary` VALUES ('104ae252-d979-11e6-b82a-00163e002c89', 'menuType', '菜单类型', '1', '目录', '73f9e8f2-07f3-11e7-b025-8cd8976a4d45', '1', '0', '2016-03-15 16:43:17');
INSERT INTO `tb_dictionary` VALUES ('104d916c-d979-11e6-b82a-00163e002c89', 'menuType', '菜单类型', '2', '链接', '73f9e8f2-07f3-11e7-b025-8cd8976a4d45', '1', '0', '2016-03-17 11:12:56');
INSERT INTO `tb_dictionary` VALUES ('10d73389-d621-4e3a-9413-fe680f23705b', 'area', '区域', null, null, null, '0', '0', '2017-04-03 17:35:01');
INSERT INTO `tb_dictionary` VALUES ('2aac56e4-3072-4f4a-9269-80e355206e2a', 'personSex', '性别', '1', '女', 'd9749a85-fc14-4dae-bd5c-79ce0518749c', '1', '0', '2017-04-03 17:30:32');
INSERT INTO `tb_dictionary` VALUES ('33d32d98-b1f5-4c20-84ac-d707208b2c26', 'area', '区域', '1', '深圳', '10d73389-d621-4e3a-9413-fe680f23705b', '1', '0', '2017-04-03 17:35:16');
INSERT INTO `tb_dictionary` VALUES ('36001520-4cdb-442f-a48f-e2be93d82411', '1', '否', null, null, null, '0', '1', '2017-04-03 17:31:17');
INSERT INTO `tb_dictionary` VALUES ('7293009b-6069-467a-bd2e-8039735029db', 'YesOrNo', '是否', '0', '是', 'e5e51c66-22e3-4349-ab5e-b87a28e5c77c', '1', '0', '2017-04-03 17:31:05');
INSERT INTO `tb_dictionary` VALUES ('73f9e8f2-07f3-11e7-b025-8cd8976a4d45', 'menuType', '菜单类型', null, null, null, '0', '0', '2017-03-13 21:46:26');
INSERT INTO `tb_dictionary` VALUES ('d2d3ad12-fa35-467d-937b-8135de4bfdd1', 'YesOrNo', '是否', '1', '否', 'e5e51c66-22e3-4349-ab5e-b87a28e5c77c', '1', '0', '2017-04-03 17:31:29');
INSERT INTO `tb_dictionary` VALUES ('d9749a85-fc14-4dae-bd5c-79ce0518749c', 'personSex', '性别', null, null, null, '0', '0', '2017-04-03 17:30:00');
INSERT INTO `tb_dictionary` VALUES ('e5e51c66-22e3-4349-ab5e-b87a28e5c77c', 'YesOrNo', '是否', null, null, null, '0', '0', '2017-04-03 17:30:55');
INSERT INTO `tb_dictionary` VALUES ('ee7369ed-6d95-47bd-beab-0ac4fc15f6c7', '1', '女', null, null, null, '0', '1', '2017-04-03 17:30:21');
INSERT INTO `tb_dictionary` VALUES ('eef95f6a-635b-4c8f-9306-bbb51e2d2b2a', 'area', '区域', '0', '广州', '10d73389-d621-4e3a-9413-fe680f23705b', '1', '0', '2017-04-03 17:35:09');

-- ----------------------------
-- Table structure for tb_faq_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_faq_info`;
CREATE TABLE `tb_faq_info` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `FAQ_DESC` text,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  `MODIFIEDID` varchar(36) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `DELETEDFLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_faq_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_membervoterec
-- ----------------------------
DROP TABLE IF EXISTS `tb_membervoterec`;
CREATE TABLE `tb_membervoterec` (
  `ID` varchar(36) DEFAULT NULL,
  `OPENID` varchar(200) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ACT_ID` varchar(36) DEFAULT NULL,
  `MENBER` varchar(36) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_membervoterec
-- ----------------------------

-- ----------------------------
-- Table structure for tb_member_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_info`;
CREATE TABLE `tb_member_info` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `GENDER` varchar(2) DEFAULT NULL,
  `WORK` varchar(100) DEFAULT NULL,
  `CONCAT_PHONE` varchar(30) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `AREA` varchar(100) DEFAULT NULL,
  `SPECIALTY` varchar(200) DEFAULT NULL,
  `SELFDESC` varchar(300) DEFAULT NULL,
  `AVATAR` varchar(100) DEFAULT NULL,
  `PROFILE` text,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  `MODIFIEDID` varchar(36) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `DELETEDFLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_member_info
-- ----------------------------
INSERT INTO `tb_member_info` VALUES ('4b9ab219-8060-4f5b-878b-580825ddabb7', '123123', '1', '18613002847', '18613002847', '2017-04-04 00:00:00', '', '', '', '/upload/member/201704/6e0be816-a383-438b-a12e-786be172df04.jpg', '<p>ni tm jiushi ge sb<br/></p>', null, null, null, null, null);
INSERT INTO `tb_member_info` VALUES ('7a379b93-2a58-4f25-a1e0-68a5160ce2a3', 'oy', '0', 'aa', '18613002847', '2017-04-10 00:00:00', '', '', '', '/upload/member/201704/01ba29c7-ebe7-437c-adec-6aad078355a9.jpg', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_msg_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_msg_info`;
CREATE TABLE `tb_msg_info` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `MSGDESC` varchar(500) DEFAULT NULL,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_msg_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_notice_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice_info`;
CREATE TABLE `tb_notice_info` (
  `ID` varchar(36) NOT NULL,
  `PURL` varchar(100) DEFAULT NULL,
  `NDESC` text,
  `ATTACHMENT` varchar(100) DEFAULT NULL,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  `MODIFIEDID` varchar(36) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `DELETEDFLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notice_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log` (
  `ID` varchar(36) NOT NULL,
  `AUTHOR_ID` varchar(36) NOT NULL COMMENT '操作用户ID',
  `AUTHOR` varchar(50) NOT NULL COMMENT '操作用户名称',
  `IP` varchar(50) NOT NULL COMMENT 'IP地址',
  `MODEL` varchar(512) NOT NULL COMMENT '操作',
  `OPERATION` varchar(512) NOT NULL COMMENT '操作',
  `DESCRIPTION` varchar(1000) NOT NULL COMMENT '详细说明',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `STATUS` tinyint(1) NOT NULL COMMENT '类型，0失败；1成功',
  PRIMARY KEY (`ID`),
  KEY `CREATE_TIME` (`CREATE_TIME`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统运行日志';

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------
INSERT INTO `tb_operation_log` VALUES ('0021f817-2433-41c9-8ffb-66483b5439d3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 19:09:35', '1');
INSERT INTO `tb_operation_log` VALUES ('005b3a11-ebb4-4dab-bacf-d1d5ebefb094', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:16:47', '1');
INSERT INTO `tb_operation_log` VALUES ('006ae8dd-eebe-4dbe-ad43-0d4424001c78', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 06:38:39', '1');
INSERT INTO `tb_operation_log` VALUES ('00a4efee-57ab-455a-9fba-f609101cd88a', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:46:55', '1');
INSERT INTO `tb_operation_log` VALUES ('00d1c854-6e41-4657-91b3-78ddcdc248bd', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:49', '1');
INSERT INTO `tb_operation_log` VALUES ('00d9ae5b-f5e3-4fbb-b607-4f4746f3f3fc', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:01:15', '1');
INSERT INTO `tb_operation_log` VALUES ('014e15de-a7a2-4d58-bfaf-9d8887ef567a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:30:01', '1');
INSERT INTO `tb_operation_log` VALUES ('019c822a-56be-41b5-8da6-9384ac156097', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 17:08:58', '1');
INSERT INTO `tb_operation_log` VALUES ('01ab2c54-2afb-4ba9-bbf8-d109ca361c6b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 05:50:32', '1');
INSERT INTO `tb_operation_log` VALUES ('01acc283-e40d-4f37-8b1a-774195ce6012', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:14', '1');
INSERT INTO `tb_operation_log` VALUES ('01bdb3f9-514b-4316-ae33-d427eed77f46', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 16:21:28', '1');
INSERT INTO `tb_operation_log` VALUES ('01e70c77-9e33-4728-a78f-9356e36debc6', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '禁用／启用用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.updateUserStatus()', '2017-03-14 17:42:09', '1');
INSERT INTO `tb_operation_log` VALUES ('02583019-a9a6-4acb-896e-5f8efb4629e4', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 13:46:39', '1');
INSERT INTO `tb_operation_log` VALUES ('02623c5a-ab6e-4303-9895-6ff51c92445d', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '编辑扩展配置', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.update()', '2017-03-16 23:24:51', '1');
INSERT INTO `tb_operation_log` VALUES ('028436b3-d442-4ffd-b117-006ab15edf79', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:45:06', '1');
INSERT INTO `tb_operation_log` VALUES ('02db3119-f273-4ab7-a8e3-34e6acab2610', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:40:38', '1');
INSERT INTO `tb_operation_log` VALUES ('02f14bbd-58e1-449e-b27a-7389dc8bcab0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:55:25', '1');
INSERT INTO `tb_operation_log` VALUES ('0317775f-b3d1-4309-8a68-ceb361156f78', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '新增用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.addUser()', '2017-03-13 20:38:13', '1');
INSERT INTO `tb_operation_log` VALUES ('032a7851-113b-4b7e-90dd-f6f93d9d38ba', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:00:32', '1');
INSERT INTO `tb_operation_log` VALUES ('032e4fe8-ae23-4819-ae5d-1fcd934803da', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 19:05:34', '1');
INSERT INTO `tb_operation_log` VALUES ('03702825-8553-425a-8970-72cbcff8d39e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:20:08', '1');
INSERT INTO `tb_operation_log` VALUES ('0373e99d-a670-4f01-941e-dc007680a3e6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:59:47', '1');
INSERT INTO `tb_operation_log` VALUES ('039c1a6a-87a7-49d2-abb4-1ebe70d211a6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:01:38', '1');
INSERT INTO `tb_operation_log` VALUES ('03d208b9-51c5-4674-bde7-e211f72c0dfd', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:11:18', '1');
INSERT INTO `tb_operation_log` VALUES ('03ea13a7-b0df-4071-ab4b-56e5623020e0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:44', '1');
INSERT INTO `tb_operation_log` VALUES ('0420863e-5b28-4347-a269-6cd7b6641524', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:15:36', '1');
INSERT INTO `tb_operation_log` VALUES ('0424ae4e-05cd-46d7-b8cb-26d9b7f8852c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:16:17', '1');
INSERT INTO `tb_operation_log` VALUES ('0428444e-04f9-4a1d-8ba8-93e3b7cb4156', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:37:14', '1');
INSERT INTO `tb_operation_log` VALUES ('045b8d9f-f7bc-44ce-b22d-44736be43079', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:30:29', '1');
INSERT INTO `tb_operation_log` VALUES ('04b30afc-82da-4923-a4fc-904ddf1b63df', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:14:56', '1');
INSERT INTO `tb_operation_log` VALUES ('04d24fd8-dce9-42ea-93fc-3a2fd5d6af9e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 19:09:29', '1');
INSERT INTO `tb_operation_log` VALUES ('051d5598-98ac-4555-acfe-3ac42cb42920', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:31:46', '1');
INSERT INTO `tb_operation_log` VALUES ('052530d3-35d2-4584-ba6a-971dd908081a', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 18:47:23', '1');
INSERT INTO `tb_operation_log` VALUES ('05520c31-ff82-4aa2-854d-91a2271e8a37', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:36:49', '1');
INSERT INTO `tb_operation_log` VALUES ('057d4006-36a1-4933-a75b-00b6de546544', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 13:56:00', '1');
INSERT INTO `tb_operation_log` VALUES ('058c0fa0-2600-431b-90f2-be26f5da4ab0', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:36:58', '1');
INSERT INTO `tb_operation_log` VALUES ('059282af-61a4-404d-bbfa-ecd09684838a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:04:28', '1');
INSERT INTO `tb_operation_log` VALUES ('0599aa16-6ab8-4d20-a48c-1ac532efcc5d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:21:40', '1');
INSERT INTO `tb_operation_log` VALUES ('05c1cf70-7e54-4dc7-bb5b-2d358cee4063', '001', 'admin', '116.18.228.114', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 21:26:40', '1');
INSERT INTO `tb_operation_log` VALUES ('05f1f4ef-da7a-4c5b-b250-e01f8a6e0486', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:03:04', '1');
INSERT INTO `tb_operation_log` VALUES ('05f8db95-cee8-404b-a788-9bcf1079e24b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:05', '1');
INSERT INTO `tb_operation_log` VALUES ('06078853-acd7-4267-be43-a5a07c75740a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 15:24:08', '1');
INSERT INTO `tb_operation_log` VALUES ('06143a0b-980f-4a85-995e-2c052138a355', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:50:39', '1');
INSERT INTO `tb_operation_log` VALUES ('064ef666-e267-43fa-9dc8-f510561ff9e5', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:11:26', '1');
INSERT INTO `tb_operation_log` VALUES ('065d8861-fecb-4432-a0e9-b989e37ca3a1', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:26:48', '1');
INSERT INTO `tb_operation_log` VALUES ('065e572d-f356-4d04-bfd4-86a6fc665e34', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:22:11', '1');
INSERT INTO `tb_operation_log` VALUES ('0665e039-f5e2-4698-8341-316a8240199a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-13 22:16:55', '1');
INSERT INTO `tb_operation_log` VALUES ('06735baa-7329-4bd0-94ce-e6185e08099e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:52', '1');
INSERT INTO `tb_operation_log` VALUES ('06957c0f-759a-4c68-87b1-29955c3b2215', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:19:35', '1');
INSERT INTO `tb_operation_log` VALUES ('06959278-0f2b-43c4-b561-5e69cc19af3e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 16:23:48', '1');
INSERT INTO `tb_operation_log` VALUES ('06d3f54a-fc21-448c-9070-85f731d827e7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:08:38', '1');
INSERT INTO `tb_operation_log` VALUES ('07469f53-efeb-485e-a99c-6c62dd1d0db7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 05:52:44', '1');
INSERT INTO `tb_operation_log` VALUES ('074b19c8-7acd-4db0-8276-fc1c429e960e', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:40:44', '1');
INSERT INTO `tb_operation_log` VALUES ('07976c34-2af0-434a-b59f-aa14768f5fad', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:46', '1');
INSERT INTO `tb_operation_log` VALUES ('07b89b5b-b79d-4e34-9cdc-f2d8b4a9ee94', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:30:43', '1');
INSERT INTO `tb_operation_log` VALUES ('0808ced9-78f6-4117-9350-2dfc20a86ec5', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:17', '1');
INSERT INTO `tb_operation_log` VALUES ('08173f4e-774c-498e-a765-d9971353309b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '禁用／启用用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.updateUserStatus()', '2017-03-13 20:38:06', '1');
INSERT INTO `tb_operation_log` VALUES ('084162d0-b169-4ff1-b511-55abf2e53111', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:54:55', '1');
INSERT INTO `tb_operation_log` VALUES ('08591023-8fb9-4855-8c7f-ccd1b79074a2', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:29:12', '1');
INSERT INTO `tb_operation_log` VALUES ('087ca28d-442a-476b-a6ed-35b5fb7e3987', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:12:29', '1');
INSERT INTO `tb_operation_log` VALUES ('089f75fd-3269-416b-a588-587521ec4c0f', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:29:51', '1');
INSERT INTO `tb_operation_log` VALUES ('0979e7bb-da3b-45c0-b1ce-5b39dc49cc49', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:17:36', '1');
INSERT INTO `tb_operation_log` VALUES ('09ad944f-803a-4f83-9c62-8b1048c43b89', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '编辑扩展配置', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.update()', '2017-03-16 23:23:36', '1');
INSERT INTO `tb_operation_log` VALUES ('0a03d61d-cb56-4ade-b2d5-f92ed421b074', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:11:10', '1');
INSERT INTO `tb_operation_log` VALUES ('0a1165bb-e37b-4ab4-8350-11c28735ce65', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:31:59', '1');
INSERT INTO `tb_operation_log` VALUES ('0a198102-f0a1-4e20-aad3-28855cb2b71b', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-14 17:01:55', '1');
INSERT INTO `tb_operation_log` VALUES ('0a21232c-ac4d-4c5e-a669-c11e7475dcd9', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 18:52:58', '1');
INSERT INTO `tb_operation_log` VALUES ('0a52cf1c-e3ef-4948-b8e4-dcd638ca4e09', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:11:19', '1');
INSERT INTO `tb_operation_log` VALUES ('0a702b1a-f9ae-4146-bfe8-0f4f6f3896bb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:23:59', '1');
INSERT INTO `tb_operation_log` VALUES ('0aca2094-9684-4dba-be1f-0d02491a429b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:26:05', '1');
INSERT INTO `tb_operation_log` VALUES ('0acc6adb-68f5-4366-aa46-9f1398ab8c60', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 07:31:47', '1');
INSERT INTO `tb_operation_log` VALUES ('0afdf8b4-e210-4895-a62e-61f869a4b331', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-01 15:55:44', '1');
INSERT INTO `tb_operation_log` VALUES ('0b4a8aaa-675c-4bea-a518-abce4c0dd129', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-16 23:11:57', '1');
INSERT INTO `tb_operation_log` VALUES ('0b57a8f3-ad8c-4420-b3b3-1005dd237779', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:13:50', '1');
INSERT INTO `tb_operation_log` VALUES ('0b9044e8-d1bb-46be-b24e-34ba0398ed97', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:08:55', '1');
INSERT INTO `tb_operation_log` VALUES ('0c1778c5-f653-41a9-9a6c-fbee7df70cd8', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:32:35', '1');
INSERT INTO `tb_operation_log` VALUES ('0c5779e7-a738-4d3f-943b-6c88759890d1', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '删除菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.delete()', '2017-03-13 19:39:59', '1');
INSERT INTO `tb_operation_log` VALUES ('0c5ad37c-0968-4038-93d7-7d06b73867a0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:26:34', '1');
INSERT INTO `tb_operation_log` VALUES ('0c7376cb-4f9b-4434-a419-a6c19f1df27b', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '为角色授予权限', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.grantPermissionToRole()', '2017-04-03 13:46:55', '1');
INSERT INTO `tb_operation_log` VALUES ('0cb27397-4e68-4fd2-bdd0-34e8ff72f4c1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:41:44', '1');
INSERT INTO `tb_operation_log` VALUES ('0cc180e6-865b-469e-b93f-ea1867866641', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-14 17:32:01', '1');
INSERT INTO `tb_operation_log` VALUES ('0cd8b967-3406-437d-bd1d-79f0f4e50113', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 13:52:35', '1');
INSERT INTO `tb_operation_log` VALUES ('0d2b789c-8723-4d56-8c1e-7958634e393e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:13:25', '1');
INSERT INTO `tb_operation_log` VALUES ('0d4fe5de-6dd0-4da6-ad8b-4ca771a0a623', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:27:18', '1');
INSERT INTO `tb_operation_log` VALUES ('0d5d9025-bd8f-4a93-9d7c-15045c5fbcdf', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:23:32', '1');
INSERT INTO `tb_operation_log` VALUES ('0da929f6-60a7-48e2-bd4e-b31993d52b40', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-16 23:11:48', '1');
INSERT INTO `tb_operation_log` VALUES ('0dbf19d9-9294-4066-a47d-f0b3b02ccc11', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:16:43', '1');
INSERT INTO `tb_operation_log` VALUES ('0dfa1e96-7025-4272-bf44-e11bf93ab1af', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:45:00', '1');
INSERT INTO `tb_operation_log` VALUES ('0e4bca76-fad3-40d0-bf82-f60580b0cb93', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:47:10', '1');
INSERT INTO `tb_operation_log` VALUES ('0e87fd52-795d-4550-afd4-e8b59226fdfc', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:20:25', '1');
INSERT INTO `tb_operation_log` VALUES ('0e8cdd87-2408-42b6-8ba4-7c95db9c4d00', '001', 'admin', '116.18.228.114', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-03 18:33:47', '1');
INSERT INTO `tb_operation_log` VALUES ('0e8f7656-7496-4892-a59e-8948b2c7623a', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-01 16:15:12', '1');
INSERT INTO `tb_operation_log` VALUES ('0f1961e9-8d07-4a08-b15b-acdce9ac389d', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:28:41', '1');
INSERT INTO `tb_operation_log` VALUES ('0f4b7403-0e46-4495-a89d-ee0e44edbefa', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:28:27', '1');
INSERT INTO `tb_operation_log` VALUES ('0fac0601-5c4d-42cb-978e-96a7478e549d', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:20:42', '1');
INSERT INTO `tb_operation_log` VALUES ('0fbb66d8-200e-41b1-8edb-9a77e6ecd3a7', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 19:40:20', '1');
INSERT INTO `tb_operation_log` VALUES ('0fcb0017-4756-46a0-b8f3-75e8298723cc', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 18:42:46', '1');
INSERT INTO `tb_operation_log` VALUES ('0ffc032d-f14f-4052-b2eb-62490f307f7a', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:33:57', '1');
INSERT INTO `tb_operation_log` VALUES ('102852e2-3345-4b44-8b27-e3536a376b15', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 16:17:05', '1');
INSERT INTO `tb_operation_log` VALUES ('1045f822-6959-4981-82bd-312206b2acee', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:48:45', '1');
INSERT INTO `tb_operation_log` VALUES ('106be13b-7c27-4c4d-abe8-63cb3a7fbd45', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:09:51', '1');
INSERT INTO `tb_operation_log` VALUES ('109166d2-ba68-4ff4-9ea2-737d5e62e0b0', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:18:01', '1');
INSERT INTO `tb_operation_log` VALUES ('10bce7e0-a43a-428a-8011-679f698c0848', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 18:57:26', '1');
INSERT INTO `tb_operation_log` VALUES ('10c581d0-b5b7-49a5-84fc-fe90504ce842', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:21:41', '1');
INSERT INTO `tb_operation_log` VALUES ('10ca9af9-da2e-4203-b057-f03009be69b8', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:14:53', '1');
INSERT INTO `tb_operation_log` VALUES ('10e4e23a-8886-4c83-b55e-5a2511985791', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:36:17', '1');
INSERT INTO `tb_operation_log` VALUES ('10e56aed-f252-40f0-b684-a4045d30ace0', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 14:45:32', '1');
INSERT INTO `tb_operation_log` VALUES ('110abe06-b940-4bac-9162-2bf86c4ae256', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:07:04', '1');
INSERT INTO `tb_operation_log` VALUES ('116a2e17-147e-4c46-b4d2-0668a21f49e0', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-16 23:16:41', '1');
INSERT INTO `tb_operation_log` VALUES ('116b6107-b2fb-4e41-9bf1-26413fe64e9e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:32:58', '1');
INSERT INTO `tb_operation_log` VALUES ('1172c4c8-dc0e-4b91-b714-e806fa094800', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:16:21', '1');
INSERT INTO `tb_operation_log` VALUES ('1178b57b-cf7e-4c56-ad16-39c7764ffa5d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:12:26', '1');
INSERT INTO `tb_operation_log` VALUES ('1182879c-cfbe-494a-be88-f131b512563d', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:26:19', '1');
INSERT INTO `tb_operation_log` VALUES ('11d06ce3-1582-4603-91dc-eabb174ba5cd', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 17:08:29', '1');
INSERT INTO `tb_operation_log` VALUES ('11fdf349-b543-4587-9510-a64318133fe2', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:17:11', '1');
INSERT INTO `tb_operation_log` VALUES ('120ef568-ef1d-41e7-9337-79beaac950ec', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-01 16:23:31', '1');
INSERT INTO `tb_operation_log` VALUES ('12657713-c6b8-40e0-983c-c888e8a01162', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:42:43', '1');
INSERT INTO `tb_operation_log` VALUES ('129522b5-663a-4b70-ab61-434984062a25', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:13:23', '1');
INSERT INTO `tb_operation_log` VALUES ('12b3d5cb-c200-4774-9964-5918268bc8af', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:49:46', '1');
INSERT INTO `tb_operation_log` VALUES ('12c41017-b157-4239-94ef-1ddca9ae4036', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:11:24', '1');
INSERT INTO `tb_operation_log` VALUES ('12c922d3-5dd5-4ed5-befb-b2317a4d4c94', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:54:12', '1');
INSERT INTO `tb_operation_log` VALUES ('12cacef5-4c66-4e97-a7d0-1a535c67af04', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:00:31', '1');
INSERT INTO `tb_operation_log` VALUES ('12da768b-775f-495f-92be-743cb745e04a', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:03', '1');
INSERT INTO `tb_operation_log` VALUES ('131e9eaa-4ee1-4497-8b78-2f78ba2d0688', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:51:39', '1');
INSERT INTO `tb_operation_log` VALUES ('13a79a02-fa46-4d3e-b5c8-4cf5881a1c6c', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '编辑代码生成器', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.update()', '2017-02-13 21:09:30', '1');
INSERT INTO `tb_operation_log` VALUES ('13b0fe0f-1b8d-49ca-bfca-32d32ffd6a17', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:14:57', '1');
INSERT INTO `tb_operation_log` VALUES ('13c54455-78e2-4e8e-a488-e6433f471e45', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:47:45', '1');
INSERT INTO `tb_operation_log` VALUES ('13f8b1a2-dbe1-4949-a788-e40ec7d2901a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:24:55', '1');
INSERT INTO `tb_operation_log` VALUES ('14659a8f-1574-4015-95fb-f9f99c10c629', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 14:31:49', '1');
INSERT INTO `tb_operation_log` VALUES ('147cb4fd-8ee8-44a6-840d-ea4767d4196b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-13 21:28:48', '1');
INSERT INTO `tb_operation_log` VALUES ('149e87ab-74a1-499b-bc5a-1e727b0ca6ef', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', '调用的方法：cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser():<br/>异常类型：java.lang.ClassCastException', '2017-03-13 20:58:13', '0');
INSERT INTO `tb_operation_log` VALUES ('14ee843f-dff9-4890-8af3-d74bcc8d10a5', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '编辑权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.update()', '2017-04-03 13:28:43', '1');
INSERT INTO `tb_operation_log` VALUES ('152967d4-49a5-4de8-a6a2-c0c2e948da26', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:31:49', '1');
INSERT INTO `tb_operation_log` VALUES ('157f3611-0d11-422f-94b7-e4e901d37cdd', '001', 'admin', '116.18.228.114', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 18:36:33', '1');
INSERT INTO `tb_operation_log` VALUES ('15a76d73-9dd8-4270-a4e2-096e5ed3f5ae', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-14 17:28:06', '1');
INSERT INTO `tb_operation_log` VALUES ('15b90e65-9cad-4a87-8432-37ff27c46db0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 19:10:34', '1');
INSERT INTO `tb_operation_log` VALUES ('15b910a3-a7c7-4753-945c-448bfb5797b7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 16:23:51', '1');
INSERT INTO `tb_operation_log` VALUES ('16090320-64d3-4775-a822-de9bdd2485ec', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 08:24:29', '1');
INSERT INTO `tb_operation_log` VALUES ('160ea0b0-4a56-4fd0-8197-b7f0313947c7', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 06:53:02', '1');
INSERT INTO `tb_operation_log` VALUES ('162a9b3e-3245-4d1f-bcff-79efd465fe37', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 16:29:33', '1');
INSERT INTO `tb_operation_log` VALUES ('162b2bba-b63b-482f-8b49-8d22a60569d8', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:46:50', '1');
INSERT INTO `tb_operation_log` VALUES ('162c97e5-45e3-4168-8573-c9112eaa7c29', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-04 10:42:46', '1');
INSERT INTO `tb_operation_log` VALUES ('16453b69-5a88-482e-934b-340386fd6112', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 19:03:57', '1');
INSERT INTO `tb_operation_log` VALUES ('165e0e1d-0a64-48e4-a2c3-817f7b764a3c', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 12:51:13', '1');
INSERT INTO `tb_operation_log` VALUES ('166d4bd7-0c76-49d8-865f-58e42dc711b6', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 16:14:46', '1');
INSERT INTO `tb_operation_log` VALUES ('16768b89-2167-4be7-bc23-7d75ef935806', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 07:43:06', '1');
INSERT INTO `tb_operation_log` VALUES ('16818774-4788-40b6-9ab7-8ab60a6c4008', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:25:07', '1');
INSERT INTO `tb_operation_log` VALUES ('169d7558-9134-4893-bbcc-d9a8a374f85d', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:51:42', '1');
INSERT INTO `tb_operation_log` VALUES ('172a2a2d-2130-4c8a-86a1-f40b01ac86ce', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '删除权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.delete()', '2017-04-03 13:44:21', '1');
INSERT INTO `tb_operation_log` VALUES ('176571f2-6e9a-4847-9f33-6faf9b9172b8', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 00:19:26', '1');
INSERT INTO `tb_operation_log` VALUES ('17b8020c-ec04-4dc9-b0f5-35c32590170e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:23:33', '1');
INSERT INTO `tb_operation_log` VALUES ('17bb750c-8ce6-434f-bb8b-92af4cdee68b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:47:42', '1');
INSERT INTO `tb_operation_log` VALUES ('181cfbba-ff3d-4ecf-92fa-df8f29269e8b', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:28:55', '1');
INSERT INTO `tb_operation_log` VALUES ('18360bc8-25e3-44a0-963b-6d989222dafd', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:09:27', '1');
INSERT INTO `tb_operation_log` VALUES ('184e2fab-521b-4745-93e9-0b0e11e37746', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:24:42', '1');
INSERT INTO `tb_operation_log` VALUES ('186ec8f5-9804-4cd6-b0c6-ea73fe766214', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:26:35', '1');
INSERT INTO `tb_operation_log` VALUES ('18a7f415-a6f3-4fa7-856f-89f6cc7d55f8', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:35:42', '1');
INSERT INTO `tb_operation_log` VALUES ('18e5c1b5-10d0-4443-b831-b7279836387b', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:40', '1');
INSERT INTO `tb_operation_log` VALUES ('190d3b67-b24f-4d72-8350-d16c981cfaa1', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:59:58', '1');
INSERT INTO `tb_operation_log` VALUES ('1916c923-da69-4c5d-b207-fc86cd92677b', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:59:42', '1');
INSERT INTO `tb_operation_log` VALUES ('19229447-fa2f-46de-8611-2af6309dabef', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-14 15:49:45', '1');
INSERT INTO `tb_operation_log` VALUES ('192b6861-2baa-4a3b-b105-ddf0f320cab7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:12', '1');
INSERT INTO `tb_operation_log` VALUES ('1984203d-fc4d-4698-97a0-fbdcce0d8dc9', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:16:42', '1');
INSERT INTO `tb_operation_log` VALUES ('19a16732-953f-41bc-b1e1-47b3e3cc690d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:13:13', '1');
INSERT INTO `tb_operation_log` VALUES ('1a5422e4-5436-466a-a760-2e89a796408c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:13:43', '1');
INSERT INTO `tb_operation_log` VALUES ('1a5a340b-af16-48a6-baed-f05d88c93658', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:37:25', '1');
INSERT INTO `tb_operation_log` VALUES ('1a6881c1-65ac-4b30-bb08-6f83914ecd32', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 11:30:57', '1');
INSERT INTO `tb_operation_log` VALUES ('1a7dcba3-06c2-4669-86e4-0078945318d7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:37:23', '1');
INSERT INTO `tb_operation_log` VALUES ('1ab17a06-c097-4c50-a854-a9f7a3038f61', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-16 23:40:36', '1');
INSERT INTO `tb_operation_log` VALUES ('1ac74433-6e62-40f3-b690-50960e846b54', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:44:05', '1');
INSERT INTO `tb_operation_log` VALUES ('1af0a13d-8b38-47a8-ab82-51a32069998d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:20:14', '1');
INSERT INTO `tb_operation_log` VALUES ('1b05400b-4f0a-41d6-9e0c-a7c24a544313', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:11:16', '1');
INSERT INTO `tb_operation_log` VALUES ('1b21d569-1c43-47f7-9cf3-cb89b218c63b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 18:45:50', '1');
INSERT INTO `tb_operation_log` VALUES ('1b4faccb-6990-4ccb-8e65-7388e608a377', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:38:02', '1');
INSERT INTO `tb_operation_log` VALUES ('1b6fc982-23de-45b8-aa7a-e4864d26aff9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:35:01', '1');
INSERT INTO `tb_operation_log` VALUES ('1b793bf5-adc5-4dfa-a11e-b98eb97da24e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:34:22', '1');
INSERT INTO `tb_operation_log` VALUES ('1b9f35d6-0351-40ac-a8ed-ff158099c919', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:29:09', '1');
INSERT INTO `tb_operation_log` VALUES ('1bbf11e1-7c22-47c1-9ff4-f36ad03753c2', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:20:23', '1');
INSERT INTO `tb_operation_log` VALUES ('1bc7ddd5-bb0b-4665-a276-46bd00d2436d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-01 15:20:22', '1');
INSERT INTO `tb_operation_log` VALUES ('1bd49a1d-0255-49ab-b78a-5ec47ae6c163', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:39:29', '1');
INSERT INTO `tb_operation_log` VALUES ('1bdecdf0-bea6-4973-971b-181d7263635c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:31:04', '1');
INSERT INTO `tb_operation_log` VALUES ('1bf1ab73-fd83-40f7-868b-647424b8f9d9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:08:46', '1');
INSERT INTO `tb_operation_log` VALUES ('1c60da3b-5b00-4d2f-be0c-bffdfebac816', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:22:09', '1');
INSERT INTO `tb_operation_log` VALUES ('1c7a69f9-e567-496a-826e-1d33c245f024', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:27:18', '1');
INSERT INTO `tb_operation_log` VALUES ('1c7bad1f-565f-4746-9725-34640a1ab8f2', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-01 15:29:50', '1');
INSERT INTO `tb_operation_log` VALUES ('1d326d69-44c2-424e-a067-cae7950ec9b2', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:38:28', '1');
INSERT INTO `tb_operation_log` VALUES ('1d3cede7-5302-43fd-bbb1-c242f893fb44', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:55:43', '1');
INSERT INTO `tb_operation_log` VALUES ('1d4e1f7e-fde5-4c59-9384-970ffe524c43', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 14:36:54', '1');
INSERT INTO `tb_operation_log` VALUES ('1d7216ce-40ed-4bb6-9cb3-ab2493b70ee8', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:55:21', '1');
INSERT INTO `tb_operation_log` VALUES ('1de00501-f28f-4c20-8239-e3dfef950ff4', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:17:20', '1');
INSERT INTO `tb_operation_log` VALUES ('1e2e39a6-ca9e-46d5-9064-9b5054542f1a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:44:18', '1');
INSERT INTO `tb_operation_log` VALUES ('1e70c9ae-a125-4cff-a94b-4175831df2cb', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:56:22', '1');
INSERT INTO `tb_operation_log` VALUES ('1e71e7ee-f16d-4cce-a1ff-28fd507560f4', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:36:36', '1');
INSERT INTO `tb_operation_log` VALUES ('1e7700e3-2f55-4a18-b29a-41fa0aedeb84', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:28:33', '1');
INSERT INTO `tb_operation_log` VALUES ('1e88ef2e-d383-43e3-ae4b-5635024b2eac', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:11:37', '1');
INSERT INTO `tb_operation_log` VALUES ('1e94490d-08a4-4ffe-9eda-12f74990cd30', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-04 11:27:03', '1');
INSERT INTO `tb_operation_log` VALUES ('1ec1a0d2-207b-4fd1-8e25-3b9a9fa7da9f', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:57:12', '1');
INSERT INTO `tb_operation_log` VALUES ('1f0883a4-cc52-4629-9a15-afdd720f0cca', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-04-03 11:31:07', '1');
INSERT INTO `tb_operation_log` VALUES ('1f3487c4-c9c5-4e47-8af9-8eafd3a9d465', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:09:06', '1');
INSERT INTO `tb_operation_log` VALUES ('1f40c292-797a-44aa-8877-e13e98e3cf7f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 11:37:56', '1');
INSERT INTO `tb_operation_log` VALUES ('1f507892-4e8b-4a5f-b918-53451312928d', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:17:50', '1');
INSERT INTO `tb_operation_log` VALUES ('1f7f9dad-2ca6-4bd6-8d4c-dc860098ca11', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:15:46', '1');
INSERT INTO `tb_operation_log` VALUES ('1f94c350-774c-4357-857d-d9e549368d27', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:39:56', '1');
INSERT INTO `tb_operation_log` VALUES ('1f97afc2-31a8-4560-a55f-1aeb45233c00', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-04 10:16:22', '1');
INSERT INTO `tb_operation_log` VALUES ('1fc21cff-6c7e-4733-84b1-a27bb7082311', '001', 'admin', '116.18.228.114', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 21:26:39', '1');
INSERT INTO `tb_operation_log` VALUES ('20008c32-ae75-4547-9e34-be7d2187eae3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:22:27', '1');
INSERT INTO `tb_operation_log` VALUES ('20409138-2122-43ac-8966-768be38cca45', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:35:37', '1');
INSERT INTO `tb_operation_log` VALUES ('208caec9-53e7-4d81-b4ac-5557fcdd84b7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:39:33', '1');
INSERT INTO `tb_operation_log` VALUES ('20985fc0-51d4-4e3d-adbf-7cde22359dc0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:35:24', '1');
INSERT INTO `tb_operation_log` VALUES ('210b5f3d-d5ed-405a-a148-6cb5a5b57f85', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-01 15:55:44', '1');
INSERT INTO `tb_operation_log` VALUES ('216f784c-67f6-4fe9-9de5-9cac07ac1ae4', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:05:34', '1');
INSERT INTO `tb_operation_log` VALUES ('21767e09-982c-4f5d-99d3-3a26015f8c15', '001', 'admin', '127.0.0.1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 19:07:15', '1');
INSERT INTO `tb_operation_log` VALUES ('21970529-464c-46dc-af9b-aa68e2b703d1', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 00:19:23', '1');
INSERT INTO `tb_operation_log` VALUES ('21eb3f4a-4342-48d4-9961-f99be0cc0e7f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 15:19:46', '1');
INSERT INTO `tb_operation_log` VALUES ('227e84b6-27e1-43a7-a39a-357663304b83', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:23:43', '1');
INSERT INTO `tb_operation_log` VALUES ('22d26405-35db-4c4a-b711-1017ca06ef28', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:49:48', '1');
INSERT INTO `tb_operation_log` VALUES ('2369c334-efaf-4467-baa0-c2eb6cd51cf9', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:55:37', '1');
INSERT INTO `tb_operation_log` VALUES ('23b140ce-cc32-4765-8607-1997b80db239', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:08:56', '1');
INSERT INTO `tb_operation_log` VALUES ('23c3aefd-20bf-466c-a73e-63da3d711997', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:04', '1');
INSERT INTO `tb_operation_log` VALUES ('240690a2-c110-4300-9e76-58d00f88bac1', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 19:43:32', '1');
INSERT INTO `tb_operation_log` VALUES ('24093d6b-c9b5-4f53-9394-6e1edebff837', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:17:10', '1');
INSERT INTO `tb_operation_log` VALUES ('2410d3d2-1892-447d-b622-6eaf7b1f3425', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:15:58', '1');
INSERT INTO `tb_operation_log` VALUES ('241c65f4-91b3-494d-b9fa-56fd58dbebec', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:13:57', '1');
INSERT INTO `tb_operation_log` VALUES ('2431f9b1-5c63-44a0-b5bc-ccc60ddba5dc', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:41:47', '1');
INSERT INTO `tb_operation_log` VALUES ('243f726a-ffaa-41cb-a3cd-bc50b6b31536', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:48:02', '1');
INSERT INTO `tb_operation_log` VALUES ('246f4c04-d6e0-4a1d-844a-9c50186e0eb1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:07:41', '1');
INSERT INTO `tb_operation_log` VALUES ('248c8892-fd89-4f6a-a16e-ba8058bb3328', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:43:48', '1');
INSERT INTO `tb_operation_log` VALUES ('24d72342-9f97-4c4b-93b2-3ef0816e66c1', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:47:01', '1');
INSERT INTO `tb_operation_log` VALUES ('2512b0e3-a978-4c5a-ad4f-4af22f83aa47', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:44:11', '1');
INSERT INTO `tb_operation_log` VALUES ('251302a4-6490-48cf-9de6-6a1fe768e1f1', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:00:33', '1');
INSERT INTO `tb_operation_log` VALUES ('252ca023-48e3-4121-b4ef-8345e0f03289', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:39:14', '1');
INSERT INTO `tb_operation_log` VALUES ('2567e087-4b60-4da5-984e-4848104eb7db', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:07:10', '1');
INSERT INTO `tb_operation_log` VALUES ('257fcba4-c9b1-4669-a65d-ded7b4d420da', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:11:39', '1');
INSERT INTO `tb_operation_log` VALUES ('25c71422-a25a-4514-9711-87cefc8ac764', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 16:21:28', '1');
INSERT INTO `tb_operation_log` VALUES ('26521e42-f856-4074-bc3d-8a4863ccaf92', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 07:15:47', '1');
INSERT INTO `tb_operation_log` VALUES ('26b2fb72-2897-4ef7-9c56-5a81bb9d71de', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 14:44:44', '1');
INSERT INTO `tb_operation_log` VALUES ('26c57e92-c90b-48b8-aa31-ebd4fe377d3b', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:28:59', '1');
INSERT INTO `tb_operation_log` VALUES ('26cff36d-ec1d-42c3-9103-2b780e72745c', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:38:12', '1');
INSERT INTO `tb_operation_log` VALUES ('26e34e2b-5cc5-4c4f-b630-d87c1f2ceeeb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:09:23', '1');
INSERT INTO `tb_operation_log` VALUES ('26e91cf3-c20e-40b8-8a6c-d69ad117b9e6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.add()', '2017-04-03 13:42:47', '1');
INSERT INTO `tb_operation_log` VALUES ('27344f4a-6fcb-4241-a20f-0e75186d035f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:29:31', '1');
INSERT INTO `tb_operation_log` VALUES ('2780706e-7194-42a9-9fea-c52b683c23b6', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:44:50', '1');
INSERT INTO `tb_operation_log` VALUES ('278e8b34-2222-4026-8e38-82c50ba4e402', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:44:21', '1');
INSERT INTO `tb_operation_log` VALUES ('27b453fd-03ed-4257-bf7c-81ec80ed0fb7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:45:49', '1');
INSERT INTO `tb_operation_log` VALUES ('27e05d10-6873-4ab8-9856-b8b36be6e625', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 16:23:32', '1');
INSERT INTO `tb_operation_log` VALUES ('28199212-bae4-4d3f-b387-bd9f9ec0be88', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:29:27', '1');
INSERT INTO `tb_operation_log` VALUES ('28294909-7903-4745-96f3-1976cf0e58f6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:41:47', '1');
INSERT INTO `tb_operation_log` VALUES ('28630597-652c-4a20-bd9c-4a522ce686d1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:42:30', '1');
INSERT INTO `tb_operation_log` VALUES ('2865802f-a646-4b31-b202-2a26774c2966', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:59:01', '1');
INSERT INTO `tb_operation_log` VALUES ('2899607b-2eb1-4c30-a64a-079b235dba39', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:13:20', '1');
INSERT INTO `tb_operation_log` VALUES ('28d59fb1-b7ff-419a-b738-870342cae502', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:40:00', '1');
INSERT INTO `tb_operation_log` VALUES ('28e898dd-b6cf-4107-9270-3d9ce406d5cf', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:55:25', '1');
INSERT INTO `tb_operation_log` VALUES ('291f7c51-a8b8-498d-877d-f895432e881c', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:29:14', '1');
INSERT INTO `tb_operation_log` VALUES ('294fbb27-57d2-4a14-9044-f0cf8078443d', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:32:04', '1');
INSERT INTO `tb_operation_log` VALUES ('29664eb4-94e6-4ab6-bdef-f9ed7b4b2664', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 18:48:02', '1');
INSERT INTO `tb_operation_log` VALUES ('2976a8c5-313d-4c10-bb84-1874a64df0bf', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 19:06:56', '1');
INSERT INTO `tb_operation_log` VALUES ('29ca2365-3bbd-4c57-8667-05996a0a3f26', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:38:36', '1');
INSERT INTO `tb_operation_log` VALUES ('29cc510b-d731-459d-9c4e-45ff2357ad0e', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-01 15:19:55', '1');
INSERT INTO `tb_operation_log` VALUES ('2a3212e3-cbf5-4917-ab16-b4a16e88079d', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:25:54', '1');
INSERT INTO `tb_operation_log` VALUES ('2a48e139-9df0-4fd1-8460-56ca9302d11e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:04:35', '1');
INSERT INTO `tb_operation_log` VALUES ('2a7718f7-604c-4a26-9e40-069f9109c61a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:19:37', '1');
INSERT INTO `tb_operation_log` VALUES ('2a9ef166-c5ce-4664-ba26-7a5b309d9dd0', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:37:22', '1');
INSERT INTO `tb_operation_log` VALUES ('2ac25a6c-f727-4c4a-aee9-087dec5628f8', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:13:36', '1');
INSERT INTO `tb_operation_log` VALUES ('2b0e98a3-0692-436c-9591-3763a1c19da7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:39', '1');
INSERT INTO `tb_operation_log` VALUES ('2b22167e-1f72-473d-b743-e38dff0f7439', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 13:38:18', '1');
INSERT INTO `tb_operation_log` VALUES ('2b2e6f4d-0641-4d20-8f24-8dec109629e4', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:22:29', '1');
INSERT INTO `tb_operation_log` VALUES ('2b3c89de-2c6c-4aa4-8a53-fd7645114f48', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:09:35', '1');
INSERT INTO `tb_operation_log` VALUES ('2b6ba309-a497-4cfd-a6c8-8a6e2944ed85', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 13:56:34', '1');
INSERT INTO `tb_operation_log` VALUES ('2b96d132-1401-4170-bcae-50af1aef1d75', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:27:03', '1');
INSERT INTO `tb_operation_log` VALUES ('2ba40fb4-cfa2-47ea-a611-570bd752cfb4', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:31:28', '1');
INSERT INTO `tb_operation_log` VALUES ('2bd3e571-2548-4b6e-925c-450bf6c77712', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:15:35', '1');
INSERT INTO `tb_operation_log` VALUES ('2c068f39-c055-42ae-8cb6-82843a03ca29', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:41:26', '1');
INSERT INTO `tb_operation_log` VALUES ('2c1355f6-5aa2-46b9-b03c-237c64012fb7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:49:53', '1');
INSERT INTO `tb_operation_log` VALUES ('2c378d46-cf45-450c-b9c6-994515d017d8', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:26:46', '1');
INSERT INTO `tb_operation_log` VALUES ('2c466ede-f66c-486f-8c6e-233b9d311388', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:12:59', '1');
INSERT INTO `tb_operation_log` VALUES ('2c5a1537-37ac-406d-99c1-a65094076025', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:04:41', '1');
INSERT INTO `tb_operation_log` VALUES ('2c7e0fa5-6fad-4848-a90f-a9b39b870104', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:09:11', '1');
INSERT INTO `tb_operation_log` VALUES ('2c9e6208-3d2f-4049-be2e-c9a0ad527e6a', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 08:10:58', '1');
INSERT INTO `tb_operation_log` VALUES ('2cce67f2-e5e4-41af-a50f-df391af64468', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 18:28:25', '1');
INSERT INTO `tb_operation_log` VALUES ('2d235ec7-33a4-4e38-bedd-1109ef1f37ec', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-15 20:38:02', '1');
INSERT INTO `tb_operation_log` VALUES ('2dd3abb5-90e2-47af-a1f5-cc2e6f130308', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:27:22', '1');
INSERT INTO `tb_operation_log` VALUES ('2e0e3c5f-77b3-43d0-8718-94406f4cb853', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:09:37', '1');
INSERT INTO `tb_operation_log` VALUES ('2e57ef20-49cd-4782-8986-d7b87aa38dcc', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:11:18', '1');
INSERT INTO `tb_operation_log` VALUES ('2e6ff144-4032-452a-b30f-c1c49958d388', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:13:52', '1');
INSERT INTO `tb_operation_log` VALUES ('2ec88f18-31a3-46ac-8e52-2d9fb7c9180b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:03:32', '1');
INSERT INTO `tb_operation_log` VALUES ('2ece015d-924c-4f8a-bc7c-af6b35dd06d6', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:21:03', '1');
INSERT INTO `tb_operation_log` VALUES ('2ecf27f5-c8e9-482c-ac92-404cea9e32a3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 13:52:37', '1');
INSERT INTO `tb_operation_log` VALUES ('2ef8de83-153d-40bd-a3f8-7c4469928d72', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:14:55', '1');
INSERT INTO `tb_operation_log` VALUES ('2efc5c14-49a6-4220-866b-9ed109953557', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-04-03 13:45:03', '1');
INSERT INTO `tb_operation_log` VALUES ('2efdaa76-b1aa-4bec-86c5-eeec2b6fd987', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:35:28', '1');
INSERT INTO `tb_operation_log` VALUES ('2f06f5ee-d711-4ba4-9901-ea11031efd32', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:59:28', '1');
INSERT INTO `tb_operation_log` VALUES ('2f33c805-d0db-4cfe-a4a5-e058070c7ca6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:41:20', '1');
INSERT INTO `tb_operation_log` VALUES ('2f54a694-77c2-492a-b70c-1bc3e4067e93', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 19:10:15', '1');
INSERT INTO `tb_operation_log` VALUES ('2f8b195b-0ecc-488f-8a7a-49e79fff8932', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:02:49', '1');
INSERT INTO `tb_operation_log` VALUES ('2fa86a55-a9f2-4695-a2a4-094c7a4e40a1', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:03:09', '1');
INSERT INTO `tb_operation_log` VALUES ('2fac246d-6706-4011-8c67-7d06ebacef49', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-04-01 15:30:00', '1');
INSERT INTO `tb_operation_log` VALUES ('2fe5647c-b565-40d1-a418-e157afe65ecc', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:23', '1');
INSERT INTO `tb_operation_log` VALUES ('2ffa4f1a-856b-428e-9954-b68d618a7d0d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:14:01', '1');
INSERT INTO `tb_operation_log` VALUES ('30224f68-a5f4-42d9-b6d9-38d1e2b1b346', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:21:08', '1');
INSERT INTO `tb_operation_log` VALUES ('30258a4f-6d91-4405-b45c-3dd18d2a3dfe', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:30:27', '1');
INSERT INTO `tb_operation_log` VALUES ('3035b360-6c2c-4f0b-94ea-ba2c65ba1b5d', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '编辑权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.update()', '2017-04-03 13:29:13', '1');
INSERT INTO `tb_operation_log` VALUES ('3071f056-babd-4cab-a11b-04cc257c4f09', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:41:21', '1');
INSERT INTO `tb_operation_log` VALUES ('3075a18f-180c-408e-993c-6f04a83c759d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:38:26', '1');
INSERT INTO `tb_operation_log` VALUES ('30853ab1-6c95-4da1-a3e6-dbbdcb284cea', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:41:06', '1');
INSERT INTO `tb_operation_log` VALUES ('30ccd0af-ee01-4d55-9ca7-cb5dd81a8c08', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:40:51', '1');
INSERT INTO `tb_operation_log` VALUES ('31048674-9cef-4b11-8d07-887a5190f3c8', '001', 'admin', '127.0.0.1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 19:07:20', '1');
INSERT INTO `tb_operation_log` VALUES ('311ce2ee-2c00-4e5d-b1cf-ebf75cd0800c', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:47:14', '1');
INSERT INTO `tb_operation_log` VALUES ('312fa38f-fb7d-4437-ad06-8ab07864a948', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 13:38:23', '1');
INSERT INTO `tb_operation_log` VALUES ('3153ecbc-ca66-48f0-b506-fc4e10d7e952', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:42:12', '1');
INSERT INTO `tb_operation_log` VALUES ('3155d472-d1a0-4a93-adfd-1afcfb960fe0', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:41:17', '1');
INSERT INTO `tb_operation_log` VALUES ('315fc0c1-a91b-4ae7-80a7-1f304957f8bc', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 21:14:08', '1');
INSERT INTO `tb_operation_log` VALUES ('317679e3-a890-400c-8820-e1b3a18ed6dd', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:31:44', '1');
INSERT INTO `tb_operation_log` VALUES ('3181fa40-4d04-44cb-9204-facb4ddfa7fc', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 18:28:13', '1');
INSERT INTO `tb_operation_log` VALUES ('318d4184-4f42-45c7-bfac-897a9e2fa3c1', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:40', '1');
INSERT INTO `tb_operation_log` VALUES ('31943510-0165-4990-bf54-f19a1e497afa', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:09:50', '1');
INSERT INTO `tb_operation_log` VALUES ('31a7143a-6000-447f-977d-5091d337a55e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:12:58', '1');
INSERT INTO `tb_operation_log` VALUES ('31d62e86-8b85-4ffd-b688-6b41689dc887', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:34:35', '1');
INSERT INTO `tb_operation_log` VALUES ('31d85a09-2045-46c9-b0f8-34f585d5ffe4', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:27:55', '1');
INSERT INTO `tb_operation_log` VALUES ('31de9da9-9be7-4538-964a-a3ea4d32a810', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:24:23', '1');
INSERT INTO `tb_operation_log` VALUES ('322f3cb4-c261-42c6-903e-69634125d351', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:27:28', '1');
INSERT INTO `tb_operation_log` VALUES ('32647982-3583-4d77-96e3-382d9b6144af', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:33:08', '1');
INSERT INTO `tb_operation_log` VALUES ('32691e89-f9dd-4ca9-8af6-0487896c586e', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:33:54', '1');
INSERT INTO `tb_operation_log` VALUES ('326ee3c5-c711-446a-a15b-306d1ba2ec68', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:29:44', '1');
INSERT INTO `tb_operation_log` VALUES ('3271a457-4977-4669-a079-42e3e821a057', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 07:20:22', '1');
INSERT INTO `tb_operation_log` VALUES ('3285cff6-bab6-48ef-964a-af475efe6dfa', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:39:09', '1');
INSERT INTO `tb_operation_log` VALUES ('328e8381-e17b-4f07-a2a3-4324a7eda4f8', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:04', '1');
INSERT INTO `tb_operation_log` VALUES ('32fa880a-d7b2-4bea-b19d-651c264b2a1b', '001', 'admin', '127.0.0.1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:07:20', '1');
INSERT INTO `tb_operation_log` VALUES ('3300119c-1b37-4a3e-b4ec-a3e8e99d6ca6', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:55:55', '1');
INSERT INTO `tb_operation_log` VALUES ('33897284-fbf7-4cf3-a7ff-f0b6f33f4035', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-15 20:32:51', '1');
INSERT INTO `tb_operation_log` VALUES ('33d3f612-a0f1-4c01-86e9-3ee485ba948d', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-13 21:15:38', '1');
INSERT INTO `tb_operation_log` VALUES ('340d1d31-ce71-443c-88a3-69be7f294a89', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 09:12:09', '1');
INSERT INTO `tb_operation_log` VALUES ('348dcf18-ea6a-46d3-b9dc-8ab43f86dc2d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:39:34', '1');
INSERT INTO `tb_operation_log` VALUES ('34a74da8-ab61-4ed6-b935-09601e98a1e3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:15:02', '1');
INSERT INTO `tb_operation_log` VALUES ('34b91322-ef79-4afa-88ca-c4f6e0861258', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:22:58', '1');
INSERT INTO `tb_operation_log` VALUES ('34bed8bd-bd4b-4922-bca4-272fde256adf', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:24:39', '1');
INSERT INTO `tb_operation_log` VALUES ('34c607b3-465f-4f06-92ac-3e3d2233ceb6', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:12:58', '1');
INSERT INTO `tb_operation_log` VALUES ('34ed924c-d954-421d-911a-539e1b435072', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:20:52', '1');
INSERT INTO `tb_operation_log` VALUES ('351b62ea-881e-4e77-8e1e-5903829d8f84', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '编辑权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.update()', '2017-02-11 16:30:48', '1');
INSERT INTO `tb_operation_log` VALUES ('35230286-a18e-412c-b6c1-d872ccb3d840', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-14 17:28:58', '1');
INSERT INTO `tb_operation_log` VALUES ('35498e25-6dee-480a-80d8-e079c8810b1f', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:14:56', '1');
INSERT INTO `tb_operation_log` VALUES ('35989691-2d90-4049-8dad-d8209c191a52', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:41:56', '1');
INSERT INTO `tb_operation_log` VALUES ('35c131af-903a-410c-9962-8c35eb0f53f2', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-13 22:16:40', '1');
INSERT INTO `tb_operation_log` VALUES ('35ecfb0a-66f1-48ae-9bd9-5b3f1bf63654', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:25:33', '1');
INSERT INTO `tb_operation_log` VALUES ('36d9d3ae-47b6-4d93-992d-24f938717ea7', '001', 'admin', '116.18.228.114', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 18:37:35', '1');
INSERT INTO `tb_operation_log` VALUES ('371d129d-3b5f-4a07-98d2-131e7d059e0e', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:44:33', '1');
INSERT INTO `tb_operation_log` VALUES ('371f925a-c323-48ae-87c6-fd651c9974e0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:42', '1');
INSERT INTO `tb_operation_log` VALUES ('37a1506b-383c-4343-8b52-d89562d42a1c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:43:03', '1');
INSERT INTO `tb_operation_log` VALUES ('37fa1523-3ca2-40b9-89f6-107ab7cb0fb0', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:24:41', '1');
INSERT INTO `tb_operation_log` VALUES ('380f2ad9-e907-4886-bdf0-1930bb4e63aa', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:26', '1');
INSERT INTO `tb_operation_log` VALUES ('38411b84-a52c-426d-a74f-162a752d970b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:59:23', '1');
INSERT INTO `tb_operation_log` VALUES ('385bfbec-7f88-4dc7-b1db-4c84f8ba7901', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:13:25', '1');
INSERT INTO `tb_operation_log` VALUES ('388040c4-dee1-4b99-a437-8e509ea82452', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:38:53', '1');
INSERT INTO `tb_operation_log` VALUES ('3882d340-fe4c-45ec-8805-6c0a4ca56683', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:03:50', '1');
INSERT INTO `tb_operation_log` VALUES ('38aad764-eff5-42d7-b66b-f9aa0f860eaf', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 15:55:17', '1');
INSERT INTO `tb_operation_log` VALUES ('38d42616-fc71-4986-a80d-15fd860d5d47', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:40:14', '1');
INSERT INTO `tb_operation_log` VALUES ('38ef0554-ed9a-4f82-a892-67e78bfaf667', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:26:22', '1');
INSERT INTO `tb_operation_log` VALUES ('391a35d5-0d6c-4430-89ba-566e49061fd7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:26', '1');
INSERT INTO `tb_operation_log` VALUES ('3926ea3a-fc20-4d67-a920-90a6f9feaaa8', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-16 23:22:12', '1');
INSERT INTO `tb_operation_log` VALUES ('39bffc3c-d8d8-4ec0-9991-4a5fbc26e34a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 09:56:30', '1');
INSERT INTO `tb_operation_log` VALUES ('39c1aad4-bb25-41bd-befe-b8c9778ed8ac', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:13:40', '1');
INSERT INTO `tb_operation_log` VALUES ('3a242dcc-b1fd-4f16-8dbd-b8d459e0ab63', '001', 'admin', '116.18.228.114', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-03 18:54:27', '1');
INSERT INTO `tb_operation_log` VALUES ('3a277431-82fc-436b-91dc-9906428b20e2', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:37:48', '1');
INSERT INTO `tb_operation_log` VALUES ('3a2c6738-b981-4eef-a0da-cad586dc898f', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:13:52', '1');
INSERT INTO `tb_operation_log` VALUES ('3a494c1c-52a7-450f-b39d-6ae3e0941212', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:25:18', '1');
INSERT INTO `tb_operation_log` VALUES ('3aac5eb2-ba78-48d2-9a22-8b1ee71e123a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 21:13:55', '1');
INSERT INTO `tb_operation_log` VALUES ('3ae19e55-bf06-48c7-9d7b-0106a9122e29', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:23', '1');
INSERT INTO `tb_operation_log` VALUES ('3b0f3dd2-c2c1-49fa-be6e-531c3f12f8c3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:15:11', '1');
INSERT INTO `tb_operation_log` VALUES ('3b19b728-b90b-4501-ab5c-fc43d15d5976', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:06:31', '1');
INSERT INTO `tb_operation_log` VALUES ('3b1b7f29-01e6-424c-b4f3-7d0fd59fa000', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:41:30', '1');
INSERT INTO `tb_operation_log` VALUES ('3b7ddce6-de3f-4eef-8104-d8a7fa453988', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '编辑权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.update()', '2017-02-11 14:47:59', '1');
INSERT INTO `tb_operation_log` VALUES ('3bb6b555-c4ae-4433-9178-bc448654cb4c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:27:18', '1');
INSERT INTO `tb_operation_log` VALUES ('3bbf16bf-f647-4ac4-9a65-5d00b304c4c6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:09:14', '1');
INSERT INTO `tb_operation_log` VALUES ('3bcf00c5-5c1f-4f2d-9043-618d7f6b0f05', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 19:05:41', '1');
INSERT INTO `tb_operation_log` VALUES ('3c166e82-4867-40ce-900f-0453e246c0e9', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:13:45', '1');
INSERT INTO `tb_operation_log` VALUES ('3c25d2cf-6982-4f94-955a-232ce7d9ce70', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:28:58', '1');
INSERT INTO `tb_operation_log` VALUES ('3c6f48c2-5f0d-453b-90e4-bb54b1c387c4', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:40:37', '1');
INSERT INTO `tb_operation_log` VALUES ('3cea4676-318b-4b9e-aab0-7fbfc7b5734e', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:25:53', '1');
INSERT INTO `tb_operation_log` VALUES ('3cf929f1-8057-4fa5-8087-3c89a8e69d05', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:16:13', '1');
INSERT INTO `tb_operation_log` VALUES ('3d33aefa-8594-4309-b881-fd30a6ae6a6c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:13:10', '1');
INSERT INTO `tb_operation_log` VALUES ('3d66e5ab-b225-47e0-9767-e764e429225f', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 19:04:11', '1');
INSERT INTO `tb_operation_log` VALUES ('3d76f2bd-c8fd-4ae8-b6a3-52dfff440b57', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:24:43', '1');
INSERT INTO `tb_operation_log` VALUES ('3db0a98f-f3f3-46b9-8454-53258b97a722', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:29:51', '1');
INSERT INTO `tb_operation_log` VALUES ('3dfc224c-9060-4edf-b05f-ee731601d850', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:22:42', '1');
INSERT INTO `tb_operation_log` VALUES ('3e0f6965-7a24-40fc-94f0-7c3fee4d7625', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:15:45', '1');
INSERT INTO `tb_operation_log` VALUES ('3e79b9cd-c771-45c1-8b1a-9e4ee9861df5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:17:40', '1');
INSERT INTO `tb_operation_log` VALUES ('3e9d0aed-53f8-4f2b-933e-aacb4fb89a2b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:16:04', '1');
INSERT INTO `tb_operation_log` VALUES ('3eb107d0-d193-46e4-853a-4f16bd206a24', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:23:59', '1');
INSERT INTO `tb_operation_log` VALUES ('3eee8f19-80cf-40e0-a434-da819bda6682', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:48:58', '1');
INSERT INTO `tb_operation_log` VALUES ('3ef2a42a-ffed-4a49-a5fb-b68cadcdbe49', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:26:47', '1');
INSERT INTO `tb_operation_log` VALUES ('3f10d674-f5ee-40c2-b4ab-524272b62091', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:16:09', '1');
INSERT INTO `tb_operation_log` VALUES ('3f53a4d9-343e-4357-848e-0505d9a401c8', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-14 15:49:45', '1');
INSERT INTO `tb_operation_log` VALUES ('3f5adbb5-447b-4ecf-8859-1f2d1685ad92', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:28:20', '1');
INSERT INTO `tb_operation_log` VALUES ('3f86ac59-7195-465e-aa04-5ab40853a89a', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:54:36', '1');
INSERT INTO `tb_operation_log` VALUES ('3f8a778b-d01f-4ae8-acbe-5e030f8efa27', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.add()', '2017-04-03 13:49:27', '1');
INSERT INTO `tb_operation_log` VALUES ('4032479b-357f-4d13-8e9b-f9c63f0abc6b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:33:51', '1');
INSERT INTO `tb_operation_log` VALUES ('403d1284-4c27-4317-b847-9d1c007ae77d', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-01 15:20:09', '1');
INSERT INTO `tb_operation_log` VALUES ('406fa223-7e16-4308-9c14-15c8a51f8ca2', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:40:12', '1');
INSERT INTO `tb_operation_log` VALUES ('4106bf38-df5c-471a-a685-ca283c61705a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:24:49', '1');
INSERT INTO `tb_operation_log` VALUES ('410d8185-f96c-48b0-85ae-4f70da72e7f6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 18:28:01', '1');
INSERT INTO `tb_operation_log` VALUES ('412671c5-007d-4137-9ea6-8d94e3de9223', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:23:38', '1');
INSERT INTO `tb_operation_log` VALUES ('4136714c-740b-40d0-8cea-8eca5e9ea681', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:00:19', '1');
INSERT INTO `tb_operation_log` VALUES ('414f83a5-c95f-497a-a597-dc46cec736d7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 16:16:05', '1');
INSERT INTO `tb_operation_log` VALUES ('41c153e7-c52b-453e-a346-e2bd7bdda7b6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:33:08', '1');
INSERT INTO `tb_operation_log` VALUES ('423cbf58-7b4a-4c0d-8ca7-6fa6d102daf1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:06:51', '1');
INSERT INTO `tb_operation_log` VALUES ('42b47ea5-53a8-4021-a201-6c08926843eb', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:25:28', '1');
INSERT INTO `tb_operation_log` VALUES ('42b74e5d-3a13-4474-9872-5698ce875ff7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:51:17', '1');
INSERT INTO `tb_operation_log` VALUES ('42e7935a-6526-486a-a28b-52572e21d5a6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:26:47', '1');
INSERT INTO `tb_operation_log` VALUES ('42f56a04-2bc2-4adc-8e4e-03867b1dd4a7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:22:38', '1');
INSERT INTO `tb_operation_log` VALUES ('436b240c-5fee-423d-83f3-102f9e3f05c3', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:21:03', '1');
INSERT INTO `tb_operation_log` VALUES ('436d5e96-5248-484c-a8f5-75f26735cd0c', '001', 'admin', '116.18.228.114', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-03 18:59:05', '1');
INSERT INTO `tb_operation_log` VALUES ('437d7c7b-ea22-4d0b-9d42-add3cbe7be53', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-13 22:08:05', '1');
INSERT INTO `tb_operation_log` VALUES ('43de51a1-1bc6-4a41-9c75-232ab04c9848', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 00:14:52', '1');
INSERT INTO `tb_operation_log` VALUES ('43e960be-4367-4a80-8c4d-c6710e9a6413', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:01:33', '1');
INSERT INTO `tb_operation_log` VALUES ('443c39a3-0ca9-4946-876b-f7d12e394c16', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:18:08', '1');
INSERT INTO `tb_operation_log` VALUES ('4464f690-ec0f-48ac-aadc-da6fbcf4c50e', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:41:12', '1');
INSERT INTO `tb_operation_log` VALUES ('4470f214-90af-42eb-8c60-2aec4f68b240', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-16 23:22:13', '1');
INSERT INTO `tb_operation_log` VALUES ('4473fc92-863d-461d-9789-50713d04adcc', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 08:25:32', '1');
INSERT INTO `tb_operation_log` VALUES ('44ad9dc4-5be4-4ad5-a465-eb7950b2959a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:36', '1');
INSERT INTO `tb_operation_log` VALUES ('44c6b5ef-799f-43e6-b768-efa6309b07ad', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 09:06:51', '1');
INSERT INTO `tb_operation_log` VALUES ('45113a1f-86ce-4ae9-86b5-251543987780', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 13:50:06', '1');
INSERT INTO `tb_operation_log` VALUES ('4550a5bd-e01e-4088-bcff-fd16c8f4c35e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:55:45', '1');
INSERT INTO `tb_operation_log` VALUES ('4581e799-055f-4c98-a0e5-f839af3f33ad', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:20', '1');
INSERT INTO `tb_operation_log` VALUES ('458b5c88-98d6-4218-b2a3-9d71369d3693', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 18:46:02', '1');
INSERT INTO `tb_operation_log` VALUES ('45b70a98-809f-4114-9628-91cf3edec6f0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:32:04', '1');
INSERT INTO `tb_operation_log` VALUES ('45bb2111-bbdb-40be-a86a-4bfc8c4fb44f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:10:04', '1');
INSERT INTO `tb_operation_log` VALUES ('45eb0425-eab8-4373-be8b-47dadfcb3800', '001', 'admin', '116.18.228.114', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-04-03 21:26:34', '1');
INSERT INTO `tb_operation_log` VALUES ('45fc3ce8-b393-4d8f-87e1-f3d09e31889f', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:28:35', '1');
INSERT INTO `tb_operation_log` VALUES ('46175a3f-914a-438c-8572-2efe9a0c8e76', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:00:04', '1');
INSERT INTO `tb_operation_log` VALUES ('46207316-c3c9-4873-a8fc-4bb6226896fa', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:52:46', '1');
INSERT INTO `tb_operation_log` VALUES ('4620c4e6-81ef-4792-b01e-809d68074311', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-13 22:01:53', '1');
INSERT INTO `tb_operation_log` VALUES ('46303ec9-e9f2-49db-973e-ad5740fc114a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-14 17:34:42', '1');
INSERT INTO `tb_operation_log` VALUES ('463bd678-cd07-4de0-9329-48f283930abe', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:02:03', '1');
INSERT INTO `tb_operation_log` VALUES ('46631b65-2486-47ae-bd22-a3e023df3d5b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:25:30', '1');
INSERT INTO `tb_operation_log` VALUES ('46837268-d5b3-4198-90af-50afeadd7bff', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-04 10:19:19', '1');
INSERT INTO `tb_operation_log` VALUES ('46a4bc89-835e-4c6a-a8e0-602849096408', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 07:27:22', '1');
INSERT INTO `tb_operation_log` VALUES ('46b45ccd-b7ff-4a43-9822-d95ddbee35c1', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '为角色授予权限', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.grantPermissionToRole()', '2017-04-03 13:47:32', '1');
INSERT INTO `tb_operation_log` VALUES ('46b86c3d-5d5e-4ff4-b798-c4cd3fe0631a', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:41:20', '1');
INSERT INTO `tb_operation_log` VALUES ('46ce69c5-0666-4981-81d6-f11a46bcd2f7', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 18:41:52', '1');
INSERT INTO `tb_operation_log` VALUES ('46e2b7d2-d98f-4d4c-acae-fe1e48f589b7', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:09:09', '1');
INSERT INTO `tb_operation_log` VALUES ('47445c47-84cf-401d-9c5b-15d7a7bbc027', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:10:38', '1');
INSERT INTO `tb_operation_log` VALUES ('47c2e3ad-13b1-47d2-af7e-b618a19ce56b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:40:01', '1');
INSERT INTO `tb_operation_log` VALUES ('47d663c5-585e-4579-819a-73756acf0780', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 21:14:31', '1');
INSERT INTO `tb_operation_log` VALUES ('47d8c666-7545-451a-93c5-f1894cf82d57', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 07:43:05', '1');
INSERT INTO `tb_operation_log` VALUES ('48315680-b581-493e-b86c-92953896f293', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:22:22', '1');
INSERT INTO `tb_operation_log` VALUES ('486605a1-8469-45ca-a974-0b5ee4d70b42', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:08:41', '1');
INSERT INTO `tb_operation_log` VALUES ('487741c4-b845-4bd0-a43d-8e9582ea1363', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:26:09', '1');
INSERT INTO `tb_operation_log` VALUES ('4877c9c7-66a7-4ff2-beae-2b17642426e7', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:42:44', '1');
INSERT INTO `tb_operation_log` VALUES ('48a1a7fe-8197-4b23-8459-5ec01fd05502', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:07:13', '1');
INSERT INTO `tb_operation_log` VALUES ('48a9e0ab-011c-42dd-9815-f67d13ca52c0', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:48:49', '1');
INSERT INTO `tb_operation_log` VALUES ('48fe73f2-a9ad-49ce-b9da-20c09771fbd3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:45:56', '1');
INSERT INTO `tb_operation_log` VALUES ('490672e5-0e5b-4686-9073-c9acf0eb68ab', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:03:58', '1');
INSERT INTO `tb_operation_log` VALUES ('4919ed9b-fb4e-4c13-9e96-f723abcb008a', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '新增代码生成器', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.add()', '2017-02-12 08:05:25', '1');
INSERT INTO `tb_operation_log` VALUES ('49b28fc6-fc73-44de-8f0a-118acff38c90', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:13:46', '1');
INSERT INTO `tb_operation_log` VALUES ('49c08ac8-b97d-443d-80e0-75fb0c601b10', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-04-03 11:31:25', '1');
INSERT INTO `tb_operation_log` VALUES ('49d5d1b4-7e62-433f-90b4-2f1af0921930', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 16:14:44', '1');
INSERT INTO `tb_operation_log` VALUES ('49e29219-b21a-4820-8164-9d1718e1866c', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 19:46:11', '1');
INSERT INTO `tb_operation_log` VALUES ('4a748c97-d1d6-4afb-9254-97523cc9fa48', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:51:39', '1');
INSERT INTO `tb_operation_log` VALUES ('4a775c94-23db-4b6e-b17e-c1115ce53ca8', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:15:41', '1');
INSERT INTO `tb_operation_log` VALUES ('4a8a0ab3-3d26-47b8-961d-ee856993ebfd', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:31:52', '1');
INSERT INTO `tb_operation_log` VALUES ('4abb33e7-79c9-4dab-8ba5-e731d92108da', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 09:12:55', '1');
INSERT INTO `tb_operation_log` VALUES ('4ad7b79f-57ee-462c-beb8-98017ec406dc', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 22:28:40', '1');
INSERT INTO `tb_operation_log` VALUES ('4adb2e28-e321-43a7-a5e7-500059f54220', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:17:43', '1');
INSERT INTO `tb_operation_log` VALUES ('4b839147-e232-491b-b0af-912db371d889', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:18:45', '1');
INSERT INTO `tb_operation_log` VALUES ('4b965c0d-e55c-4352-8feb-360f89c912f8', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:26:28', '1');
INSERT INTO `tb_operation_log` VALUES ('4bb535bc-72ff-434f-8e7b-2c4af5588da4', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 21:15:02', '1');
INSERT INTO `tb_operation_log` VALUES ('4bc258c7-caa0-4803-8c73-7040b3a1caa3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:10:16', '1');
INSERT INTO `tb_operation_log` VALUES ('4bc617a2-2516-46a8-98be-00224a355f41', '001', 'admin', '127.0.0.1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:07:24', '1');
INSERT INTO `tb_operation_log` VALUES ('4bc9a9b1-da01-4c75-821d-b498b42af05b', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:48:14', '1');
INSERT INTO `tb_operation_log` VALUES ('4bfa2a9f-938e-4f50-87f6-b04493d90cf7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:17:26', '1');
INSERT INTO `tb_operation_log` VALUES ('4c0a0663-bb23-4fda-9041-34b4bea59250', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 18:45:56', '1');
INSERT INTO `tb_operation_log` VALUES ('4c1d192f-91b3-4759-b544-d28db6028d79', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 17:08:25', '1');
INSERT INTO `tb_operation_log` VALUES ('4c215c52-4ed2-4e57-9954-7c2485c8538f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:28:50', '1');
INSERT INTO `tb_operation_log` VALUES ('4c504e05-020c-4d53-bdbd-e3871a0c60b7', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 13:50:27', '1');
INSERT INTO `tb_operation_log` VALUES ('4c6d18cd-5cc4-4331-b886-2c3f39c80f1e', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-01 15:25:09', '1');
INSERT INTO `tb_operation_log` VALUES ('4d13c899-4ec0-484d-83ae-d584f40d6cc7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-14 17:39:57', '1');
INSERT INTO `tb_operation_log` VALUES ('4d22f01c-39a1-4a56-9fa3-1c47d7ce6ee5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-14 15:22:31', '1');
INSERT INTO `tb_operation_log` VALUES ('4d32bdec-8384-43e9-8ca5-582f3b8ee48d', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-13 19:47:17', '1');
INSERT INTO `tb_operation_log` VALUES ('4d349302-1203-4975-a15e-0cdf70a7ee3c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:01:43', '1');
INSERT INTO `tb_operation_log` VALUES ('4da3b439-407f-4eb7-9fe3-3611b2822e93', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:39:41', '1');
INSERT INTO `tb_operation_log` VALUES ('4de43d69-cb53-4f8c-993e-7b207f2456d1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:16:37', '1');
INSERT INTO `tb_operation_log` VALUES ('4e11c120-569c-4d50-8f02-13f5cad860f5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:37:51', '1');
INSERT INTO `tb_operation_log` VALUES ('4e16eab0-1fdc-475b-ab96-b489adebbc2c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:16:08', '1');
INSERT INTO `tb_operation_log` VALUES ('4e266f45-89b7-45d3-92fb-6992e48288d4', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:14:57', '1');
INSERT INTO `tb_operation_log` VALUES ('4e95b097-61e1-4df6-8fe3-c474651eb629', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:09:04', '1');
INSERT INTO `tb_operation_log` VALUES ('4ebed669-3e74-4865-8647-098f21e940f5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:08:52', '1');
INSERT INTO `tb_operation_log` VALUES ('4f071a96-804c-4f74-8770-158b0a131b38', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 20:48:23', '1');
INSERT INTO `tb_operation_log` VALUES ('4f18b76c-5107-4988-833a-e9bb60976b4d', '001', 'admin', '116.18.228.114', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 18:38:08', '1');
INSERT INTO `tb_operation_log` VALUES ('4f587619-eb20-4b89-acad-fcea3a72bed4', '001', 'admin', '116.18.228.114', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 18:36:30', '1');
INSERT INTO `tb_operation_log` VALUES ('4f62c797-cdcf-46da-bbad-f6c96aaf3249', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:45:02', '1');
INSERT INTO `tb_operation_log` VALUES ('4fa76206-aea9-4ca2-a7aa-3da4ad72ce67', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:22:05', '1');
INSERT INTO `tb_operation_log` VALUES ('50323b08-cff2-452c-9c23-104867701b26', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:36', '1');
INSERT INTO `tb_operation_log` VALUES ('50585ad1-5aa3-4c94-8680-84a023145c2d', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-04-01 16:14:34', '1');
INSERT INTO `tb_operation_log` VALUES ('5067f503-459c-49e9-bf80-055128eee70e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:10:41', '1');
INSERT INTO `tb_operation_log` VALUES ('511a429a-137d-4c5e-8f44-0e63b76cdc27', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 14:15:42', '1');
INSERT INTO `tb_operation_log` VALUES ('512162bf-61af-4613-8bda-d077559203e2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:45:15', '1');
INSERT INTO `tb_operation_log` VALUES ('51346a96-5880-41df-b50c-31743bea1bd1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:11:25', '1');
INSERT INTO `tb_operation_log` VALUES ('517e4307-9546-49be-8e04-882e2f612c3e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:29:50', '1');
INSERT INTO `tb_operation_log` VALUES ('5198de33-c5ba-430c-99f8-0ad6632489f2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:41:33', '1');
INSERT INTO `tb_operation_log` VALUES ('51c9339f-a4b5-4d5c-ab20-26f23716b72d', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:49:14', '1');
INSERT INTO `tb_operation_log` VALUES ('51d2de6c-8aee-43ff-b56b-6a80977198d6', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 20:46:55', '1');
INSERT INTO `tb_operation_log` VALUES ('51d44ce9-cbe4-4ea4-b8ce-ce9e8856e798', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:15:43', '1');
INSERT INTO `tb_operation_log` VALUES ('51de7109-e467-4479-ba0d-b5b90b07dcef', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:40:08', '1');
INSERT INTO `tb_operation_log` VALUES ('51e7ceaf-acaa-4003-bf4f-26c8abf538eb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:16:42', '1');
INSERT INTO `tb_operation_log` VALUES ('51f66571-588b-4363-a783-47a35e634faa', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-21 22:23:47', '1');
INSERT INTO `tb_operation_log` VALUES ('520508ff-b1b1-438a-b17b-91507377c0fd', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-04-01 16:13:11', '1');
INSERT INTO `tb_operation_log` VALUES ('523f1526-a61b-45b3-bdbf-109b376f9218', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:49:21', '1');
INSERT INTO `tb_operation_log` VALUES ('524309d3-d421-4ef4-9469-9044856a1e1d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 15:41:35', '1');
INSERT INTO `tb_operation_log` VALUES ('52500c7e-68e3-4e81-bda2-1f07709636c5', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:13:25', '1');
INSERT INTO `tb_operation_log` VALUES ('527b2406-239b-4345-aee3-f6d34989367f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:17:20', '1');
INSERT INTO `tb_operation_log` VALUES ('52d0597b-4cca-4f88-9a9a-59b7c3fa0232', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:20:54', '1');
INSERT INTO `tb_operation_log` VALUES ('531ceebb-1176-4a94-a989-e0d66d74aef9', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:51:22', '1');
INSERT INTO `tb_operation_log` VALUES ('532b8183-fac1-4ea7-b5b7-cc18354bac26', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 13:20:17', '1');
INSERT INTO `tb_operation_log` VALUES ('53991d97-1879-477e-b02c-136d7798ee07', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:18:07', '1');
INSERT INTO `tb_operation_log` VALUES ('53a73eb4-a7ee-4385-a397-0b82849d1547', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:29:56', '1');
INSERT INTO `tb_operation_log` VALUES ('542790a9-6f17-48ba-a5d5-592c2a0ecc57', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:37:27', '1');
INSERT INTO `tb_operation_log` VALUES ('54435f5b-946b-4946-a6d5-1b662f4a1166', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:09:37', '1');
INSERT INTO `tb_operation_log` VALUES ('54654cfe-0b05-4820-b25a-3f32812f10a6', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:51:37', '1');
INSERT INTO `tb_operation_log` VALUES ('5466f601-da7b-4433-bb53-d461aab6c964', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 18:46:53', '1');
INSERT INTO `tb_operation_log` VALUES ('5474a403-8e5a-4d13-8c64-31221194e1b5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:11', '1');
INSERT INTO `tb_operation_log` VALUES ('5475a054-4b89-413f-af92-4fde66a99e41', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:03', '1');
INSERT INTO `tb_operation_log` VALUES ('5484e1da-b45a-43dd-97ce-037c119c76f7', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:16:12', '1');
INSERT INTO `tb_operation_log` VALUES ('54b4d87d-b3d6-4ad8-be02-e7b64ba51c52', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:18', '1');
INSERT INTO `tb_operation_log` VALUES ('54ede81d-71a3-44b2-b292-f02443a20443', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:07:40', '1');
INSERT INTO `tb_operation_log` VALUES ('54f08e60-c5c0-432f-b296-fe90ca8e1e47', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 16:17:06', '1');
INSERT INTO `tb_operation_log` VALUES ('54f4659e-6a7d-4141-ab4a-d07c72a02fe6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:27:51', '1');
INSERT INTO `tb_operation_log` VALUES ('55316da1-9008-4a65-9dd3-26379f1ebbfc', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:03:32', '1');
INSERT INTO `tb_operation_log` VALUES ('5570b898-3d61-4e50-b008-edfc795ddbf4', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:47:54', '1');
INSERT INTO `tb_operation_log` VALUES ('5574b8ba-1161-48ed-a07f-1dc0354dc214', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:30:26', '1');
INSERT INTO `tb_operation_log` VALUES ('5590662f-57ba-4d4d-b3fa-e5dd96a4bc15', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 18:41:52', '1');
INSERT INTO `tb_operation_log` VALUES ('55bd61a9-4299-499e-b15a-94853644d423', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:53:54', '1');
INSERT INTO `tb_operation_log` VALUES ('55c5661b-3101-49b0-bd83-8ce55e21804e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:31:58', '1');
INSERT INTO `tb_operation_log` VALUES ('55f4c6c3-c1df-484f-915c-932df1d58365', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:07:48', '1');
INSERT INTO `tb_operation_log` VALUES ('5601c740-d8ed-493c-ae56-14169df16738', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:26:56', '1');
INSERT INTO `tb_operation_log` VALUES ('5602be25-1820-4be9-8572-c35ffbfe7a1a', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:19:33', '1');
INSERT INTO `tb_operation_log` VALUES ('56063683-ac39-4652-bb89-6e2f77b8d04c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:55:24', '1');
INSERT INTO `tb_operation_log` VALUES ('56176e2a-9079-40bc-9ec1-8d274bf8f28c', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 21:14:33', '1');
INSERT INTO `tb_operation_log` VALUES ('56696b99-96d1-4b41-a9cf-b9cae50b8bc9', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:40:33', '1');
INSERT INTO `tb_operation_log` VALUES ('56751daf-bc51-4bd4-8890-1d40d79af817', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:40', '1');
INSERT INTO `tb_operation_log` VALUES ('568acf13-3eb1-434b-a58f-fbde28fde080', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 07:24:58', '1');
INSERT INTO `tb_operation_log` VALUES ('56919e4d-b01c-4a20-a96a-cf1542931a37', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:40:18', '1');
INSERT INTO `tb_operation_log` VALUES ('56a00ec3-4467-480b-8d5b-aee32582d28e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:30', '1');
INSERT INTO `tb_operation_log` VALUES ('56d9f65c-6bf5-4c23-96a1-4f1ff6856630', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:40:14', '1');
INSERT INTO `tb_operation_log` VALUES ('5757dec7-15f7-4994-8810-c5648da54fc1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 19:10:42', '1');
INSERT INTO `tb_operation_log` VALUES ('575dffad-8cdb-4ce0-86b7-e9c74db5cf29', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:11:26', '1');
INSERT INTO `tb_operation_log` VALUES ('576ae605-2d00-4a64-9601-248b56afe66e', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '删除权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.delete()', '2017-04-03 13:44:41', '1');
INSERT INTO `tb_operation_log` VALUES ('582065f2-46f4-4b5c-a799-a39e59b48f9f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:02:58', '1');
INSERT INTO `tb_operation_log` VALUES ('5835b934-2bab-4bb8-8701-fc48d987b58d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:30:27', '1');
INSERT INTO `tb_operation_log` VALUES ('5866cbaa-fa52-4f9d-8f1d-195804db70a9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:20:27', '1');
INSERT INTO `tb_operation_log` VALUES ('587be94b-e43d-47c5-85f9-72dc2bfdec95', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:43:01', '1');
INSERT INTO `tb_operation_log` VALUES ('58938032-5143-4c5f-acc5-a376386a1bcc', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:22:37', '1');
INSERT INTO `tb_operation_log` VALUES ('58971f13-48a9-4d25-bd71-c928b5631a56', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:49:55', '1');
INSERT INTO `tb_operation_log` VALUES ('58e04ca8-9d77-4432-93dd-e2e2653dc19a', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 20:04:02', '1');
INSERT INTO `tb_operation_log` VALUES ('592d90e4-6e93-40bf-8661-e865c00e0924', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:30:29', '1');
INSERT INTO `tb_operation_log` VALUES ('594ff729-9712-42b6-8e67-e9b7c9ae6914', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:11:20', '1');
INSERT INTO `tb_operation_log` VALUES ('5951cd63-4139-472f-bef5-3c305c0b146d', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:20:40', '1');
INSERT INTO `tb_operation_log` VALUES ('5970b51f-5cb7-42a1-a137-90941a7d59e7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 00:19:17', '1');
INSERT INTO `tb_operation_log` VALUES ('599084c1-5c0c-43e6-b8e1-09d7f6189fbc', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:32:08', '1');
INSERT INTO `tb_operation_log` VALUES ('59bb2f49-ae17-4c10-aec4-b2b9f06fe1e9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:16:30', '1');
INSERT INTO `tb_operation_log` VALUES ('59e21506-fb81-497a-b4ce-347e21adba6a', '001', 'admin', '116.18.228.114', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-04-03 21:26:35', '1');
INSERT INTO `tb_operation_log` VALUES ('5ae6fcd0-1e0f-4edf-a92a-27d5118f5966', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:07:51', '1');
INSERT INTO `tb_operation_log` VALUES ('5ae807db-ae2f-4d84-8ff4-7d24a4e45c5a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:11:07', '1');
INSERT INTO `tb_operation_log` VALUES ('5ae84d1a-5f64-41f8-9e60-5e7020b21042', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:47:49', '1');
INSERT INTO `tb_operation_log` VALUES ('5aeb5ae8-886e-4d7a-ba4a-819468ddb329', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:26:29', '1');
INSERT INTO `tb_operation_log` VALUES ('5b1d374b-d0e6-4181-b9e0-38202c8f0e66', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:29:31', '1');
INSERT INTO `tb_operation_log` VALUES ('5b7d9aa5-17c7-43dc-9d70-10a3c1ef399e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 18:48:01', '1');
INSERT INTO `tb_operation_log` VALUES ('5bb5aee6-1428-46a6-b324-cef8cb2ffbed', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:48:41', '1');
INSERT INTO `tb_operation_log` VALUES ('5bc48c3b-b760-443c-a561-feeb73f573d2', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:08:21', '1');
INSERT INTO `tb_operation_log` VALUES ('5be5c44b-6bcd-46fa-899d-77b155f341f2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:25:07', '1');
INSERT INTO `tb_operation_log` VALUES ('5bf7aa25-4cb9-4c12-b122-73c2c18e69ab', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:16:45', '1');
INSERT INTO `tb_operation_log` VALUES ('5ca57648-192f-43ee-9794-437fc46542d0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 19:10:36', '1');
INSERT INTO `tb_operation_log` VALUES ('5cfcb994-e435-411e-9eea-e6a446ae7dda', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:15:41', '1');
INSERT INTO `tb_operation_log` VALUES ('5d2843b3-eecf-418d-9fc4-e308ba24ae8b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:25:47', '1');
INSERT INTO `tb_operation_log` VALUES ('5d2a32c1-9d5d-48d0-8da8-68ecc6f2d6a9', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:53:59', '1');
INSERT INTO `tb_operation_log` VALUES ('5d45a6bf-06b3-48cf-8c77-833c7c7043a4', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '编辑代码生成器', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.update()', '2017-02-13 12:46:44', '1');
INSERT INTO `tb_operation_log` VALUES ('5da5f752-b328-4b72-9e90-15c0c801f60c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-13 20:59:13', '1');
INSERT INTO `tb_operation_log` VALUES ('5db687d8-e5be-4d98-9d01-34c1083ff424', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:41:08', '1');
INSERT INTO `tb_operation_log` VALUES ('5dbd1600-93bc-45a1-9033-f28725bc198e', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-14 17:37:45', '1');
INSERT INTO `tb_operation_log` VALUES ('5dec9e25-e10e-4cc3-9ea2-5155af590bee', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:11:02', '1');
INSERT INTO `tb_operation_log` VALUES ('5df5563f-90eb-45f8-8422-5d3fd934712e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:16:39', '1');
INSERT INTO `tb_operation_log` VALUES ('5dfb18d6-2752-492d-bba4-a07eba602bce', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-14 17:32:18', '1');
INSERT INTO `tb_operation_log` VALUES ('5e11cd11-ef86-4877-a2eb-5a4e274b05f0', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 16:23:53', '1');
INSERT INTO `tb_operation_log` VALUES ('5e1ced4e-2800-45a8-b091-83fa78be5dd1', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.add()', '2017-04-03 13:40:50', '1');
INSERT INTO `tb_operation_log` VALUES ('5e228cbd-65b1-4a74-9972-32cf4161137a', '001', 'admin', '116.18.228.114', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 18:36:25', '1');
INSERT INTO `tb_operation_log` VALUES ('5e369f8a-108b-4a9b-8a12-2f770c2ba361', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-01 15:20:21', '1');
INSERT INTO `tb_operation_log` VALUES ('5e3a614b-ea01-4fc9-bc97-66364c76e97d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:20:39', '1');
INSERT INTO `tb_operation_log` VALUES ('5e5dd494-23d5-4a79-8fcb-3a050b9fe297', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 13:52:45', '1');
INSERT INTO `tb_operation_log` VALUES ('5ea0383b-0055-4781-9891-fa796b8980c2', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-15 20:38:32', '1');
INSERT INTO `tb_operation_log` VALUES ('5ecd1761-8bcf-41bb-bd0f-f77f0371a406', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:12:54', '1');
INSERT INTO `tb_operation_log` VALUES ('5ee61360-2c2b-4098-8db6-dc7d1833ab61', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 15:55:19', '1');
INSERT INTO `tb_operation_log` VALUES ('5f0d2711-699d-4373-9b84-56ee6ad17816', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:40:05', '1');
INSERT INTO `tb_operation_log` VALUES ('5f21af4d-388a-4ba1-b2a6-a59c67f81f59', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-04 11:26:46', '1');
INSERT INTO `tb_operation_log` VALUES ('5f7696b2-0a5a-4305-b1bb-e9d2b63089bb', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-01 15:30:13', '1');
INSERT INTO `tb_operation_log` VALUES ('5f96178c-e688-402d-a9a9-e05e8ee9fd6b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 12:51:07', '1');
INSERT INTO `tb_operation_log` VALUES ('5fa26814-34e9-48ee-bcfb-3276d1011107', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:44:59', '1');
INSERT INTO `tb_operation_log` VALUES ('5faa8d2f-7c0c-493d-a656-1a68fdd9b57f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:30:53', '1');
INSERT INTO `tb_operation_log` VALUES ('5fc05f1a-9356-4e0b-8d20-a9d2c40dd4c6', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:10:03', '1');
INSERT INTO `tb_operation_log` VALUES ('5fc85dd9-fdd2-494b-a6dd-d991d770205b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-11 13:52:54', '1');
INSERT INTO `tb_operation_log` VALUES ('5febdc7c-e8b3-4f11-9597-46efad36c1ff', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:49', '1');
INSERT INTO `tb_operation_log` VALUES ('6041d863-83f9-4b06-8652-82d2640c6d19', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-14 17:28:06', '1');
INSERT INTO `tb_operation_log` VALUES ('606b07ef-c5ce-4b7d-aa7d-76c52e1eed81', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 18:41:50', '1');
INSERT INTO `tb_operation_log` VALUES ('606b88d0-fd40-4f08-8d43-2ef60c1450dd', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 18:28:00', '1');
INSERT INTO `tb_operation_log` VALUES ('60818bfc-3f1c-49cf-ad0b-d6dd56b62164', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-13 12:35:40', '1');
INSERT INTO `tb_operation_log` VALUES ('6094c8d3-6dfe-4a7e-8b02-a1f24a90e6e5', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:43:33', '1');
INSERT INTO `tb_operation_log` VALUES ('60a55477-3329-4d55-ad8f-fddba2e4a89b', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:24:04', '1');
INSERT INTO `tb_operation_log` VALUES ('60c788bc-d728-4265-b031-de10ec0d5b0b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-14 17:01:51', '1');
INSERT INTO `tb_operation_log` VALUES ('60de67a2-10f7-46d2-b3e6-1c3104ec0ce4', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:37:19', '1');
INSERT INTO `tb_operation_log` VALUES ('60e939cc-2429-4b14-96e4-b3780dea20a1', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:25:58', '1');
INSERT INTO `tb_operation_log` VALUES ('60f9623c-22b8-4b40-9e50-6e911a50d8f8', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:02:01', '1');
INSERT INTO `tb_operation_log` VALUES ('6113a0c2-8cdd-48bf-933c-faf28b501f33', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:03:04', '1');
INSERT INTO `tb_operation_log` VALUES ('614a89c3-39c2-485b-ba0b-6159d0b49767', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:32:10', '1');
INSERT INTO `tb_operation_log` VALUES ('61876b42-9401-4c5e-b4e5-3a96d6e5eb97', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:12:19', '1');
INSERT INTO `tb_operation_log` VALUES ('61c18fda-bd5d-447b-83c9-143ac3846ea7', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 14:44:47', '1');
INSERT INTO `tb_operation_log` VALUES ('61f2514a-9c54-452a-a8a3-4489abbe52d2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:22:12', '1');
INSERT INTO `tb_operation_log` VALUES ('624d7316-b437-42b3-82a1-2b36ba9fb9e3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:46:09', '1');
INSERT INTO `tb_operation_log` VALUES ('6261e340-832c-4db4-b7b6-db0c637b4777', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:20:33', '1');
INSERT INTO `tb_operation_log` VALUES ('62b11378-ed6a-4e47-b3f2-f1200967355b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:08:43', '1');
INSERT INTO `tb_operation_log` VALUES ('62e4fc10-483e-4b97-bc6b-282da1a17908', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:46:15', '1');
INSERT INTO `tb_operation_log` VALUES ('62fdeabf-381b-4d9d-bba1-63ac0925def3', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:14:44', '1');
INSERT INTO `tb_operation_log` VALUES ('6345ead6-dac0-434a-b44b-07f816f3ae8e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:51:47', '1');
INSERT INTO `tb_operation_log` VALUES ('63610a62-de97-415c-a2bf-273a1e80c9cb', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:18:40', '1');
INSERT INTO `tb_operation_log` VALUES ('637aabd3-b503-44ae-b6f7-2053e6b11bd7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:47:34', '1');
INSERT INTO `tb_operation_log` VALUES ('63a54c74-9aae-4f91-a00f-5b91e2ebb447', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 09:56:31', '1');
INSERT INTO `tb_operation_log` VALUES ('63c5ae5b-8e26-4c72-b1b4-d8c628cf98f7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-16 23:22:39', '1');
INSERT INTO `tb_operation_log` VALUES ('63ee3674-2d07-48ad-ba4a-94a21da3fd61', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', '调用的方法：cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser():<br/>异常类型：org.springframework.jdbc.BadSqlGrammarException<br/>异常描述：Unknown column \'5b506f3d\' in \'where clause\'', '2017-03-14 17:38:42', '0');
INSERT INTO `tb_operation_log` VALUES ('642659dc-2dcb-478d-b4ce-f9236174af31', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:43:39', '1');
INSERT INTO `tb_operation_log` VALUES ('6464291f-cc29-494e-b56b-7a13e4712851', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:45:56', '1');
INSERT INTO `tb_operation_log` VALUES ('64ee55e0-d2ea-4a51-98e3-7d2ad9dcf937', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 18:28:24', '1');
INSERT INTO `tb_operation_log` VALUES ('654cbf74-ee41-4827-b107-b503df1586a8', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '禁用／启用用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.updateUserStatus()', '2017-03-14 17:42:11', '1');
INSERT INTO `tb_operation_log` VALUES ('654d534f-5d66-47c8-a32e-a695d57217fa', '001', 'admin', '116.18.228.114', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-03 18:47:57', '1');
INSERT INTO `tb_operation_log` VALUES ('65e38ab6-1a65-490a-815f-a88be822bd02', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 21:11:24', '1');
INSERT INTO `tb_operation_log` VALUES ('65f79cbd-daf5-4a82-81ce-86cbf2e12b9c', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:11:42', '1');
INSERT INTO `tb_operation_log` VALUES ('66097dbc-eea4-44dc-96dd-898c71e5cd11', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:15:09', '1');
INSERT INTO `tb_operation_log` VALUES ('662c3981-8d4c-4498-870b-7420eb4eec68', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 15:43:00', '1');
INSERT INTO `tb_operation_log` VALUES ('665a18f6-52a9-4630-acf1-c4fd815ecd1a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:27:28', '1');
INSERT INTO `tb_operation_log` VALUES ('66772729-52a9-4bcc-a820-3d47b5028e63', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:20:39', '1');
INSERT INTO `tb_operation_log` VALUES ('66a9a069-f612-4630-b56b-40fde7b29c38', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:37:02', '1');
INSERT INTO `tb_operation_log` VALUES ('66c63909-bef5-43be-8af2-fb3ed9417543', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:03:20', '1');
INSERT INTO `tb_operation_log` VALUES ('66c99dd7-0ae9-4420-86a4-e2739d8d197c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:50:13', '1');
INSERT INTO `tb_operation_log` VALUES ('66ea06c7-386c-4428-8d65-702164666277', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:16:47', '1');
INSERT INTO `tb_operation_log` VALUES ('67061eb2-0aa4-4a43-8c9e-6e4bb8886cfb', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:12:54', '1');
INSERT INTO `tb_operation_log` VALUES ('6718539c-34ab-490d-a8ce-adc0ef818d02', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:36:45', '1');
INSERT INTO `tb_operation_log` VALUES ('6774dca5-68c9-44d9-b5a7-fd5369ad02fb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:41:06', '1');
INSERT INTO `tb_operation_log` VALUES ('6784d5fa-abc5-48ad-b014-dd0cfeb510d3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:07', '1');
INSERT INTO `tb_operation_log` VALUES ('67862a7a-8e52-4226-b73b-43507048a8bb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 18:45:54', '1');
INSERT INTO `tb_operation_log` VALUES ('678c4784-20f5-4c1e-bebc-738f6c48f3ce', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:49:28', '1');
INSERT INTO `tb_operation_log` VALUES ('67a7ffd0-8bfb-4973-90c3-e596442b3867', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:18:44', '1');
INSERT INTO `tb_operation_log` VALUES ('67c301b2-2303-4a07-848c-01de65b901a4', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 18:46:09', '1');
INSERT INTO `tb_operation_log` VALUES ('67d2a723-2df6-4080-b618-e6488c2311f3', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:39', '1');
INSERT INTO `tb_operation_log` VALUES ('6858da5d-3a5c-4615-bc2d-b8c4bfd2d1be', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '编辑代码生成器', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.update()', '2017-02-13 12:38:11', '1');
INSERT INTO `tb_operation_log` VALUES ('685d7ffb-0ccc-47e7-a2e4-8326908ddb5f', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '编辑代码生成器', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.update()', '2017-02-13 12:41:07', '1');
INSERT INTO `tb_operation_log` VALUES ('686b8d5f-3dab-4ee2-b1b2-d17bfd0b1f33', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '编辑扩展配置', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.update()', '2017-03-16 23:25:18', '1');
INSERT INTO `tb_operation_log` VALUES ('687e3dda-22bc-47cf-803f-d5b5f831d2a9', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 06:54:30', '1');
INSERT INTO `tb_operation_log` VALUES ('689f8bf5-7015-4051-bfbf-323a49a97d3f', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:42:09', '1');
INSERT INTO `tb_operation_log` VALUES ('68acfb49-d5e0-458d-bb5f-7b7bb9a539fe', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:14:51', '1');
INSERT INTO `tb_operation_log` VALUES ('692077f1-6f8a-4f4a-a89a-e10bfb4f9459', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:09:30', '1');
INSERT INTO `tb_operation_log` VALUES ('69468488-6bea-417f-adaf-ff299e846fdf', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:26:42', '1');
INSERT INTO `tb_operation_log` VALUES ('695147b1-51d3-4aae-ae06-d31c956e7921', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 06:57:15', '1');
INSERT INTO `tb_operation_log` VALUES ('698b758f-178e-4c2c-9891-2f6821f9fa37', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 07:34:25', '1');
INSERT INTO `tb_operation_log` VALUES ('69ad35cd-d8b9-467f-9bdc-b3043eb1e113', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 12:57:40', '1');
INSERT INTO `tb_operation_log` VALUES ('69cedc37-e6f7-47a7-8539-adfccf238404', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:47:34', '1');
INSERT INTO `tb_operation_log` VALUES ('6a65362d-c1b7-4b3a-a127-0fa8b6127d09', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 07:20:22', '1');
INSERT INTO `tb_operation_log` VALUES ('6a93e83e-936e-481a-afe8-b80af5d4bd55', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 00:14:50', '1');
INSERT INTO `tb_operation_log` VALUES ('6aa8fd8c-39c4-427c-98a5-ad1af2a7b129', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:19', '1');
INSERT INTO `tb_operation_log` VALUES ('6aba6beb-dc28-4c0e-b806-cb49af4ff1be', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:27:05', '1');
INSERT INTO `tb_operation_log` VALUES ('6b155284-a7c0-459e-b6ea-a2bdb6416f74', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:38:24', '1');
INSERT INTO `tb_operation_log` VALUES ('6b1e7a96-be91-4737-a839-053fe16c3a99', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-14 17:28:56', '1');
INSERT INTO `tb_operation_log` VALUES ('6b5af128-19fc-41e5-808c-5ddeca9d05f9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:59:55', '1');
INSERT INTO `tb_operation_log` VALUES ('6ba4bbb1-33b2-4a1c-90d3-63bb01c37bf1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:51:34', '1');
INSERT INTO `tb_operation_log` VALUES ('6bb5bcaa-d6cc-4c21-abac-55881502fd6e', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:23:59', '1');
INSERT INTO `tb_operation_log` VALUES ('6be935d8-1877-4b72-bf47-28ff956e4bac', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-01 15:55:49', '1');
INSERT INTO `tb_operation_log` VALUES ('6c1ae76b-97c6-47a2-990c-d3ea866a3317', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:39', '1');
INSERT INTO `tb_operation_log` VALUES ('6c5ad9ad-ef00-4efd-a07f-553e7f7443bb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:15:48', '1');
INSERT INTO `tb_operation_log` VALUES ('6c6ab464-3eab-46c5-be8f-0ef0e4e9873a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:35:43', '1');
INSERT INTO `tb_operation_log` VALUES ('6cc1030d-d248-407d-91e3-a33d0f4d0815', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:21:09', '1');
INSERT INTO `tb_operation_log` VALUES ('6cdcd667-f783-4599-983c-3e15c5a26597', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:25', '1');
INSERT INTO `tb_operation_log` VALUES ('6d838b7f-e9aa-4fe8-a527-25ba1db1afa6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:32:56', '1');
INSERT INTO `tb_operation_log` VALUES ('6dbec57c-798d-4651-9fa7-ae727f405d91', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:46:08', '1');
INSERT INTO `tb_operation_log` VALUES ('6dbf0243-3ef7-4368-b97b-6faefb820720', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:33:54', '1');
INSERT INTO `tb_operation_log` VALUES ('6dd228fd-2397-4abf-b020-f23fb7f2010e', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 08:25:39', '1');
INSERT INTO `tb_operation_log` VALUES ('6e46b0e4-309a-460c-b06c-bedda9696c29', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:52:55', '1');
INSERT INTO `tb_operation_log` VALUES ('6eddf440-1d46-44ad-b018-7e0f66ef67c4', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 19:09:33', '1');
INSERT INTO `tb_operation_log` VALUES ('6f015f51-5420-4074-8e6a-e63d2f2ca9ef', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:46:42', '1');
INSERT INTO `tb_operation_log` VALUES ('6f40497f-9c93-46d8-9baf-aa0e5a99f908', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 15:28:36', '1');
INSERT INTO `tb_operation_log` VALUES ('6f4dac0a-7f1f-4273-bad6-220fa164b495', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:21:15', '1');
INSERT INTO `tb_operation_log` VALUES ('6f97e735-6596-450b-b97f-8e9b5bbdc176', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:49:44', '1');
INSERT INTO `tb_operation_log` VALUES ('6fdba575-2c3e-44f4-9b40-139219826282', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:04:49', '1');
INSERT INTO `tb_operation_log` VALUES ('6fea01b5-f11f-4b6d-9fb2-240a19228578', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '为角色授予权限', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.grantPermissionToRole()', '2017-03-16 23:11:06', '1');
INSERT INTO `tb_operation_log` VALUES ('703ca0be-40b5-4363-84a9-fed1c9fb44c5', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:46:50', '1');
INSERT INTO `tb_operation_log` VALUES ('703d58eb-0971-49e3-9ad2-062911440ebb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:12:50', '1');
INSERT INTO `tb_operation_log` VALUES ('70775d4d-a34b-44d4-9e5c-431412c28781', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:58:55', '1');
INSERT INTO `tb_operation_log` VALUES ('70a22fc7-1448-43e5-a879-9e4d6cb89582', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:03:16', '1');
INSERT INTO `tb_operation_log` VALUES ('70e03731-6135-4c93-b401-71c38e558277', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:45:39', '1');
INSERT INTO `tb_operation_log` VALUES ('70e47bdf-7b3c-43f7-9f59-7c3b9929d248', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:51:41', '1');
INSERT INTO `tb_operation_log` VALUES ('70f91290-91ee-4d46-ae1c-7f63aec135a2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 05:26:45', '1');
INSERT INTO `tb_operation_log` VALUES ('71a428d8-23d9-4872-9b28-f0b6f72b78f0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:13:21', '1');
INSERT INTO `tb_operation_log` VALUES ('71a6be30-ca13-4225-b6b4-48c2609a35ef', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:03:01', '1');
INSERT INTO `tb_operation_log` VALUES ('71b28406-f835-464e-869d-15eaabd07656', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-04-03 13:48:40', '1');
INSERT INTO `tb_operation_log` VALUES ('71b547db-c1da-40ec-8163-9c237e03283f', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:54:58', '1');
INSERT INTO `tb_operation_log` VALUES ('71d5cd24-1f25-4e66-bba6-3d6ec4dc67ed', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:46:20', '1');
INSERT INTO `tb_operation_log` VALUES ('71e7ec82-0f03-470b-9985-fe2b808db594', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:10:39', '1');
INSERT INTO `tb_operation_log` VALUES ('71e84034-26d7-4755-bb72-4f98fa11a8f4', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-03-16 23:10:40', '1');
INSERT INTO `tb_operation_log` VALUES ('72003363-2d12-46f3-8a17-4620bce71374', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:37:13', '1');
INSERT INTO `tb_operation_log` VALUES ('72381055-472a-499c-a33e-b7a9fff270e7', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:10:22', '1');
INSERT INTO `tb_operation_log` VALUES ('72c9ce43-c6de-47eb-863d-1a37e2780f43', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:46:27', '1');
INSERT INTO `tb_operation_log` VALUES ('72f099f9-9832-4259-8a2c-1be9624b05c3', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-04 11:26:29', '1');
INSERT INTO `tb_operation_log` VALUES ('72f24b1c-3791-4b87-911d-6ddfcc2c05f9', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:01:46', '1');
INSERT INTO `tb_operation_log` VALUES ('7332bd08-2c35-4b34-b8c4-7ea190c17132', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:40:17', '1');
INSERT INTO `tb_operation_log` VALUES ('7358d222-7a39-4abe-a0f9-c93862c44591', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:19', '1');
INSERT INTO `tb_operation_log` VALUES ('738380ad-fe60-4077-8fe3-a4302fe572aa', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:42:11', '1');
INSERT INTO `tb_operation_log` VALUES ('73e10820-33f0-4aba-9d60-927b419e5444', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:11:22', '1');
INSERT INTO `tb_operation_log` VALUES ('73e591e8-8e8b-4424-8189-804d9bc787ea', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:00:20', '1');
INSERT INTO `tb_operation_log` VALUES ('746870b8-5014-4b25-9bf7-8750491e8598', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:00:16', '1');
INSERT INTO `tb_operation_log` VALUES ('747590de-06fa-43fc-a93d-43fab5d03e4a', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:50:52', '1');
INSERT INTO `tb_operation_log` VALUES ('747b6a17-dcc7-4d22-b856-a9fb0a90eec6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:13:48', '1');
INSERT INTO `tb_operation_log` VALUES ('74807e1f-0a99-4df8-98e5-32d65d1b5dff', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:47:10', '1');
INSERT INTO `tb_operation_log` VALUES ('751460e4-acf7-4702-8aa6-1863882c5e1a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 06:13:25', '1');
INSERT INTO `tb_operation_log` VALUES ('752d7ea8-8211-45a1-b8c3-a9c6c70702ca', '001', 'admin', '116.18.228.114', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-04-03 18:38:12', '1');
INSERT INTO `tb_operation_log` VALUES ('7568e71a-efc6-44ec-8646-5224380b58b8', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:29:44', '1');
INSERT INTO `tb_operation_log` VALUES ('7584c3fb-9d62-47be-95b1-72533334da63', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:23:44', '1');
INSERT INTO `tb_operation_log` VALUES ('758df81d-7efc-49b8-9710-cb354bd68af2', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:11:26', '1');
INSERT INTO `tb_operation_log` VALUES ('759cb94c-f992-47e1-8f99-c7cd70e3cc84', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:43:29', '1');
INSERT INTO `tb_operation_log` VALUES ('75a04f17-f778-4fb9-9524-e8d49b382acf', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 12:57:41', '1');
INSERT INTO `tb_operation_log` VALUES ('75c4fb23-3dfc-41ad-a06e-eed885956290', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:37:21', '1');
INSERT INTO `tb_operation_log` VALUES ('760b29ab-ad60-4594-b543-6f1125c2f467', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-04 10:42:45', '1');
INSERT INTO `tb_operation_log` VALUES ('7630c2c8-10c8-4f72-8066-5313fb7b7b2b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:27:22', '1');
INSERT INTO `tb_operation_log` VALUES ('763c0d15-e96a-43a0-a95a-3ca1f45ea4d1', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-04-04 10:42:46', '1');
INSERT INTO `tb_operation_log` VALUES ('76639c50-222e-4390-858e-df7e445ec102', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:41:23', '1');
INSERT INTO `tb_operation_log` VALUES ('766abbe1-448b-43e6-b84c-a13d3ab9e7d3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 21:16:19', '1');
INSERT INTO `tb_operation_log` VALUES ('766e20ff-0619-4d78-adcb-1b434d0c398c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:25:00', '1');
INSERT INTO `tb_operation_log` VALUES ('76c1d68b-c901-4804-8d37-138558e5760c', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:34:34', '1');
INSERT INTO `tb_operation_log` VALUES ('77030efa-a400-4c02-a45f-b2cae0aa59e7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:12:15', '1');
INSERT INTO `tb_operation_log` VALUES ('773088e2-f0c8-4952-8c07-227fdbb3943e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:38:34', '1');
INSERT INTO `tb_operation_log` VALUES ('77410cdd-7d33-42de-9c92-aa74adb56d1c', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:26:49', '1');
INSERT INTO `tb_operation_log` VALUES ('776fb9b5-3f65-4679-a1ec-8c27b27c9f69', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:55:29', '1');
INSERT INTO `tb_operation_log` VALUES ('7770ee08-6501-4735-b7de-dfd1c6c54590', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 16:29:30', '1');
INSERT INTO `tb_operation_log` VALUES ('7776f364-b079-4c2d-9995-4eabafe54e42', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:53:47', '1');
INSERT INTO `tb_operation_log` VALUES ('777a89f3-6f2f-4454-bca8-f21998e0d802', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 18:14:53', '1');
INSERT INTO `tb_operation_log` VALUES ('779198e7-5650-48fb-95ab-e22e5880cfc5', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 14:47:45', '1');
INSERT INTO `tb_operation_log` VALUES ('77fcd683-85d4-426a-8301-8fe46059df95', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:37:31', '1');
INSERT INTO `tb_operation_log` VALUES ('7830e3a9-0333-4b46-b204-e2d273965e5d', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:00:21', '1');
INSERT INTO `tb_operation_log` VALUES ('78b347d0-7660-4818-abb8-38d65f95be28', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 15:41:37', '1');
INSERT INTO `tb_operation_log` VALUES ('79540847-4bc1-4b47-8c58-e0bc606fc85c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 19:35:23', '1');
INSERT INTO `tb_operation_log` VALUES ('79670a90-9eba-494c-b6ad-7ed5b2a29a61', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:48:31', '1');
INSERT INTO `tb_operation_log` VALUES ('798348ec-a983-4bc4-8065-a5e6a078c756', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:09:28', '1');
INSERT INTO `tb_operation_log` VALUES ('7984b19f-813e-4040-bd91-801eb2669db2', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 08:25:34', '1');
INSERT INTO `tb_operation_log` VALUES ('7987ca9b-8eb0-438c-ad8d-3f7f0a88bea7', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 19:05:32', '1');
INSERT INTO `tb_operation_log` VALUES ('79d3ae56-871c-4184-816e-bd54f6c04272', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:10:15', '1');
INSERT INTO `tb_operation_log` VALUES ('7a0a735e-6037-43d7-822f-a7eae18e4087', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:16:13', '1');
INSERT INTO `tb_operation_log` VALUES ('7a0ccc99-9e18-4f8a-a831-57461608d53a', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-13 20:48:23', '1');
INSERT INTO `tb_operation_log` VALUES ('7a2e874b-f624-4018-bc44-f3d6f45a3036', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 18:46:21', '1');
INSERT INTO `tb_operation_log` VALUES ('7a430e2c-a55b-4944-8935-6a3256d50508', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:24:45', '1');
INSERT INTO `tb_operation_log` VALUES ('7ae9f25c-dc8d-42f8-9a46-62119376b50c', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:28:02', '1');
INSERT INTO `tb_operation_log` VALUES ('7aefef93-22e8-4859-bbb7-c545867aa0fe', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 18:28:01', '1');
INSERT INTO `tb_operation_log` VALUES ('7afd97d6-0fd8-4aa2-9f17-7fcfea832af3', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:40:20', '1');
INSERT INTO `tb_operation_log` VALUES ('7aff4079-5709-4988-9db1-243bbfbf2238', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:17', '1');
INSERT INTO `tb_operation_log` VALUES ('7b17c87d-9737-4cf5-bab2-13bc90f5bc24', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 07:24:59', '1');
INSERT INTO `tb_operation_log` VALUES ('7b24ea2d-176a-4504-8054-427f842e8cc0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:54:07', '1');
INSERT INTO `tb_operation_log` VALUES ('7b31a5e6-5dea-42a6-a411-63558df4de3e', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:45:40', '1');
INSERT INTO `tb_operation_log` VALUES ('7bb38d4e-6b71-4c3e-96a9-2af16eb0cbbc', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:19:14', '1');
INSERT INTO `tb_operation_log` VALUES ('7bba384a-63be-4d72-93f7-a4997fd0df2b', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:05:25', '1');
INSERT INTO `tb_operation_log` VALUES ('7bc45bb9-acab-48ed-8bfb-8b2265e7f454', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:43:31', '1');
INSERT INTO `tb_operation_log` VALUES ('7c1ffef7-e378-4849-916b-6181312b4e3c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:51:35', '1');
INSERT INTO `tb_operation_log` VALUES ('7c2cec39-2e9c-4214-9dcb-f5f36d32ef4a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:38:27', '1');
INSERT INTO `tb_operation_log` VALUES ('7c5f0175-dc81-439f-b4c0-505e1caff167', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:32:31', '1');
INSERT INTO `tb_operation_log` VALUES ('7d28f294-aae4-455c-a735-1e064e823d56', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:04:41', '1');
INSERT INTO `tb_operation_log` VALUES ('7d4e103c-affc-480d-980d-7a4b671364a8', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 18:41:51', '1');
INSERT INTO `tb_operation_log` VALUES ('7d7a69c0-8967-41b8-809e-7e2172d1ac9f', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-04-03 13:45:38', '1');
INSERT INTO `tb_operation_log` VALUES ('7db257c5-1e6a-48a3-b891-f8f95cd721db', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:41:23', '1');
INSERT INTO `tb_operation_log` VALUES ('7e03460c-12f9-4579-b16b-413ed5652231', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:03:45', '1');
INSERT INTO `tb_operation_log` VALUES ('7e2b89d2-9d50-4c8f-96d6-bff74ec370a0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:21:01', '1');
INSERT INTO `tb_operation_log` VALUES ('7e3b970c-877b-46f3-9080-abfdc861e331', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 18:46:19', '1');
INSERT INTO `tb_operation_log` VALUES ('7e7c5080-bb8a-4fa9-9dcb-713626f4bb0c', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-13 22:16:54', '1');
INSERT INTO `tb_operation_log` VALUES ('7e7d5520-a70a-4b9b-ab2d-e9864a48fd4d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 15:55:01', '1');
INSERT INTO `tb_operation_log` VALUES ('7ed3e2cb-87fa-4c77-9dd0-777f0cb15b42', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:08:01', '1');
INSERT INTO `tb_operation_log` VALUES ('7f35fac9-38ec-440c-899c-a72aa75e5293', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:57:54', '1');
INSERT INTO `tb_operation_log` VALUES ('7f50b442-137d-40aa-a4cc-6aad747f1cd6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:19:34', '1');
INSERT INTO `tb_operation_log` VALUES ('7f6e26a9-420c-4942-ad16-41a2ef133f29', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:37:18', '1');
INSERT INTO `tb_operation_log` VALUES ('7f8f520d-d79d-4dcb-b609-4d7b538c6270', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:50:23', '1');
INSERT INTO `tb_operation_log` VALUES ('7faa61d0-01ef-4add-9168-5fe7fd4e53b6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:40:58', '1');
INSERT INTO `tb_operation_log` VALUES ('7fc6d5f9-88f4-4025-b219-9e0cca7b06e6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-14 17:28:58', '1');
INSERT INTO `tb_operation_log` VALUES ('7ff14c34-be23-4773-a328-31c9d15b459a', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 22:25:12', '1');
INSERT INTO `tb_operation_log` VALUES ('8012f286-d4ba-486f-b391-e166ac54c47e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 21:13:42', '1');
INSERT INTO `tb_operation_log` VALUES ('802e1494-8091-44f9-90a3-36f842067f1d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:40', '1');
INSERT INTO `tb_operation_log` VALUES ('8038632c-6378-4362-99a9-76b8c7166b0a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:37:11', '1');
INSERT INTO `tb_operation_log` VALUES ('808a8f4d-6019-48a8-a9d2-5fdf6a89ba6f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:11:22', '1');
INSERT INTO `tb_operation_log` VALUES ('80acab7b-1924-4194-8ce8-ebe0418fc04a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:25:32', '1');
INSERT INTO `tb_operation_log` VALUES ('80c88e25-4b53-480b-aa41-3db7f5eb2526', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:12:58', '1');
INSERT INTO `tb_operation_log` VALUES ('80dc6736-07af-406f-80d5-24fd0240cdbb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:08:56', '1');
INSERT INTO `tb_operation_log` VALUES ('80e937ad-a707-4575-9174-cdb29b3bdd9f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-04 10:42:40', '1');
INSERT INTO `tb_operation_log` VALUES ('80faae47-0395-46fc-afb8-40936b204324', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 18:46:00', '1');
INSERT INTO `tb_operation_log` VALUES ('811f4099-cebf-4a05-8dd4-1e1696c4df6b', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:32:06', '1');
INSERT INTO `tb_operation_log` VALUES ('8138d631-8a09-4aa3-85c9-650175482d99', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:29:57', '1');
INSERT INTO `tb_operation_log` VALUES ('8139a9ab-1200-4757-917f-f039406a4d31', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 09:59:15', '1');
INSERT INTO `tb_operation_log` VALUES ('813be1ae-1c80-4ef3-88fa-e8a9b0ce5f98', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:12:13', '1');
INSERT INTO `tb_operation_log` VALUES ('816080a0-8ff9-4db5-8c3d-01d4d9dac251', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:59', '1');
INSERT INTO `tb_operation_log` VALUES ('81b21176-eed1-4b68-8b65-9620935b5ff1', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-15 20:32:46', '1');
INSERT INTO `tb_operation_log` VALUES ('81f20be2-6d6f-4974-8dcf-77aa6bb3be1c', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-16 23:08:53', '1');
INSERT INTO `tb_operation_log` VALUES ('8208f50c-53fe-4726-b6f0-b0a4a43b4f61', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:54:27', '1');
INSERT INTO `tb_operation_log` VALUES ('822e82d1-3871-48fa-bd6d-cac2530ce03e', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:48:43', '1');
INSERT INTO `tb_operation_log` VALUES ('823f988f-8de9-4a6d-b756-a5efc0700be6', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:07:43', '1');
INSERT INTO `tb_operation_log` VALUES ('8256ea50-04ac-4b5a-a779-f28b6169d41a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:40:26', '1');
INSERT INTO `tb_operation_log` VALUES ('82695c1a-c663-457f-87fa-74effad13d93', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:09:06', '1');
INSERT INTO `tb_operation_log` VALUES ('826a95a2-f9c8-4f09-aa59-48b8c8b80b20', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:04:48', '1');
INSERT INTO `tb_operation_log` VALUES ('82adde05-153f-40a8-bae7-1dd80b524f23', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:20', '1');
INSERT INTO `tb_operation_log` VALUES ('82d0e240-417e-4d9a-9ed0-284be08061c7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-03-13 19:40:07', '1');
INSERT INTO `tb_operation_log` VALUES ('82e6e403-5a5f-4908-9e1e-775df8370888', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:42:06', '1');
INSERT INTO `tb_operation_log` VALUES ('8302ab85-912b-43e3-8c30-10d8305066ab', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-14 17:01:51', '1');
INSERT INTO `tb_operation_log` VALUES ('831dc53e-8dcf-4007-bd49-14bec4670e1f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 18:41:51', '1');
INSERT INTO `tb_operation_log` VALUES ('8325e8a6-4cd1-46d8-9749-8fe16e0b3d0c', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:08:05', '1');
INSERT INTO `tb_operation_log` VALUES ('83539068-f15c-48f8-8731-d3c46dacac48', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:36:37', '1');
INSERT INTO `tb_operation_log` VALUES ('83698e2f-f6c0-41c0-a7e6-6b08e8951c5b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-16 23:22:28', '1');
INSERT INTO `tb_operation_log` VALUES ('8384a93d-c8fc-498f-863f-ecbeec983c1c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:29:54', '1');
INSERT INTO `tb_operation_log` VALUES ('83b12c5f-ac73-4171-803b-fc6304d61e61', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 06:50:17', '1');
INSERT INTO `tb_operation_log` VALUES ('84375514-b7c0-40bd-af6f-aad53fa3d933', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 22:21:53', '1');
INSERT INTO `tb_operation_log` VALUES ('8450765e-4cde-4090-a32e-863e5c579a16', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '为用户授予角色', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.grantRoleToUser()', '2017-03-16 23:22:17', '1');
INSERT INTO `tb_operation_log` VALUES ('84536d8d-866d-4a25-a883-f0c422bcf834', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:08:59', '1');
INSERT INTO `tb_operation_log` VALUES ('848f3085-29ac-4c10-89ca-38bde8fef6d3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:08:43', '1');
INSERT INTO `tb_operation_log` VALUES ('84c0c040-5d17-4244-92a2-c97c320dbb04', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 15:29:50', '1');
INSERT INTO `tb_operation_log` VALUES ('84f9ec7e-b1db-4452-b856-68bf07041efd', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:53:00', '1');
INSERT INTO `tb_operation_log` VALUES ('8519baf9-823d-4ca4-a265-93ea453f02af', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:10:05', '1');
INSERT INTO `tb_operation_log` VALUES ('856cabcf-1206-4592-86e7-0ee65464a0ae', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:09:20', '1');
INSERT INTO `tb_operation_log` VALUES ('8580ff9f-9605-4118-981c-087b4665f06d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:26:07', '1');
INSERT INTO `tb_operation_log` VALUES ('85ecc2d4-5dd9-431f-a4a0-58bdf476f100', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:31:32', '1');
INSERT INTO `tb_operation_log` VALUES ('85eecb0b-4578-49da-9908-f7d91f456e1e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:20:09', '1');
INSERT INTO `tb_operation_log` VALUES ('8631b797-1002-4738-8330-6745f9674bb0', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 13:45:01', '1');
INSERT INTO `tb_operation_log` VALUES ('8667d34a-b024-4068-aa29-e7cc8f1db358', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:04:51', '1');
INSERT INTO `tb_operation_log` VALUES ('867b4684-f2e0-4969-ab9b-0072aa6ddffa', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:38:31', '1');
INSERT INTO `tb_operation_log` VALUES ('86ac7fbc-f3a6-4bac-ab9a-a6bcafd0e9a5', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 06:38:49', '1');
INSERT INTO `tb_operation_log` VALUES ('86e79d50-ae15-4ce3-8a00-7dd3039c3740', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-14 17:40:51', '1');
INSERT INTO `tb_operation_log` VALUES ('87338b1d-fbfc-45fe-b5b3-41fda83f8678', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 18:45:56', '1');
INSERT INTO `tb_operation_log` VALUES ('8739a161-ab20-448a-af76-b1a5bace9780', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:10:14', '1');
INSERT INTO `tb_operation_log` VALUES ('8764a927-a65d-430b-9db7-c8993c715dff', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:40:26', '1');
INSERT INTO `tb_operation_log` VALUES ('879a46a2-4ef9-4cfc-acbc-cd639558ad6b', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:14:27', '1');
INSERT INTO `tb_operation_log` VALUES ('87ee5cda-98af-4b52-8a93-82f0f0fe7dab', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:15:10', '1');
INSERT INTO `tb_operation_log` VALUES ('87fc17c2-ef15-414f-8777-4be06e90ea9f', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:27:35', '1');
INSERT INTO `tb_operation_log` VALUES ('882cc960-b6ae-49e1-be1a-13ffa5ca8f18', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 19:12:09', '1');
INSERT INTO `tb_operation_log` VALUES ('883be464-3ded-406d-aad7-e9d4c3f02078', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:47:33', '1');
INSERT INTO `tb_operation_log` VALUES ('88c24de2-d165-49de-940b-31ce62d1b5c3', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:50:12', '1');
INSERT INTO `tb_operation_log` VALUES ('88d52876-0b8a-4596-abac-5a520f968102', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:11:38', '1');
INSERT INTO `tb_operation_log` VALUES ('893481ce-62c2-4e9f-8737-4c88906d324d', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '删除角色', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.RoleController.delete()', '2017-03-14 17:30:33', '1');
INSERT INTO `tb_operation_log` VALUES ('895b03c8-1fe4-42ae-bce0-8ae1482d1df2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 05:52:15', '1');
INSERT INTO `tb_operation_log` VALUES ('89754d66-368b-4619-bfbc-678e88f7d2ea', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:17', '1');
INSERT INTO `tb_operation_log` VALUES ('8976f734-86db-47b7-a1a4-97d968b88f2c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:26:56', '1');
INSERT INTO `tb_operation_log` VALUES ('89782c6a-6d66-434a-9054-917d3dda67fb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 07:24:59', '1');
INSERT INTO `tb_operation_log` VALUES ('899220e7-7a0f-46ee-a789-a3418c38c135', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:16:55', '1');
INSERT INTO `tb_operation_log` VALUES ('8a8065f1-f582-4e32-a551-b4aa09cb9e3a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:49:25', '1');
INSERT INTO `tb_operation_log` VALUES ('8a95a983-2be7-4b10-9631-09ba8178d103', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:50:37', '1');
INSERT INTO `tb_operation_log` VALUES ('8ad19174-16fe-499f-9860-507ee5524561', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:31:34', '1');
INSERT INTO `tb_operation_log` VALUES ('8ad23b05-58bb-47d0-9f1d-59dded9051ac', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:48:16', '1');
INSERT INTO `tb_operation_log` VALUES ('8afc8620-2439-4abe-9d77-524e22c8f9f7', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:01:44', '1');
INSERT INTO `tb_operation_log` VALUES ('8b18964f-86d0-407d-a2a1-77c7986ab26d', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:27:23', '1');
INSERT INTO `tb_operation_log` VALUES ('8b42e2bc-a50c-4257-aef7-bb25eba03a5f', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:39:42', '1');
INSERT INTO `tb_operation_log` VALUES ('8b51169b-e101-465d-863b-a89e6dd5323c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:04:49', '1');
INSERT INTO `tb_operation_log` VALUES ('8b657792-6701-4f4c-9ed6-3bd507222710', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:23:33', '1');
INSERT INTO `tb_operation_log` VALUES ('8b82cb34-6a00-4e7e-95dd-3bdacd9776fa', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:26:46', '1');
INSERT INTO `tb_operation_log` VALUES ('8be13aa6-81aa-4bf3-85f8-0dd5b28fca32', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 18:41:28', '1');
INSERT INTO `tb_operation_log` VALUES ('8be774c4-ac50-4acf-a2ba-85d64529403f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:39:38', '1');
INSERT INTO `tb_operation_log` VALUES ('8c0deb87-9e11-4534-8035-cad91a6d1a3c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 13:52:42', '1');
INSERT INTO `tb_operation_log` VALUES ('8c1e5c2c-c14d-495e-977d-58ac5c703660', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-04-03 13:45:59', '1');
INSERT INTO `tb_operation_log` VALUES ('8c47340d-9082-488c-9f3f-64f8d068e15c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:23:38', '1');
INSERT INTO `tb_operation_log` VALUES ('8c551700-8d88-4e7d-85b8-19732998703f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:13:26', '1');
INSERT INTO `tb_operation_log` VALUES ('8ca93e75-f3b0-43d9-bd4b-460468317621', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.add()', '2017-02-21 23:12:43', '1');
INSERT INTO `tb_operation_log` VALUES ('8ce984f0-fa14-4e7d-a7c3-f4d1059d42f4', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:11:13', '1');
INSERT INTO `tb_operation_log` VALUES ('8d03e210-6470-4f57-9256-ffa818c52989', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 16:30:20', '1');
INSERT INTO `tb_operation_log` VALUES ('8d1730f3-927a-4864-b237-1eceb0c1a627', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 11:31:03', '1');
INSERT INTO `tb_operation_log` VALUES ('8d31b13a-c672-43d9-81dc-02d3450d01e6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 11:31:03', '1');
INSERT INTO `tb_operation_log` VALUES ('8d31ca29-8bb7-43ba-b5ad-f54908ff518d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:20:03', '1');
INSERT INTO `tb_operation_log` VALUES ('8d78bee7-5f74-409f-891b-b4e1c250f168', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:00', '1');
INSERT INTO `tb_operation_log` VALUES ('8db0a64e-1a55-4b8b-8efb-0d83601cc5f2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:00', '1');
INSERT INTO `tb_operation_log` VALUES ('8e0ceefd-d579-417f-a774-96af1189a346', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:28:40', '1');
INSERT INTO `tb_operation_log` VALUES ('8e47e5fc-b488-40c4-ad28-cff29b1beb1d', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-04-01 16:13:12', '1');
INSERT INTO `tb_operation_log` VALUES ('8ed69032-b0e7-4055-96f3-c7ce03bf6ddd', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:16:46', '1');
INSERT INTO `tb_operation_log` VALUES ('8edea1a8-4700-4a9b-a0d5-3c43c286ce36', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:07:51', '1');
INSERT INTO `tb_operation_log` VALUES ('8f2d761e-d807-4fde-9aa7-f97efdd9ec76', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:21:46', '1');
INSERT INTO `tb_operation_log` VALUES ('8f3bcda2-971b-47b5-b30a-bce7b14aa1d1', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:08:17', '1');
INSERT INTO `tb_operation_log` VALUES ('8f5fd751-f0bb-427e-8634-fe2baea7668e', '001', 'admin', '116.18.228.114', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 18:36:31', '1');
INSERT INTO `tb_operation_log` VALUES ('8fb1cce0-d0a1-4d00-aab4-05ec8994f67e', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:40', '1');
INSERT INTO `tb_operation_log` VALUES ('8fd14c95-c5e1-4a01-bac5-78aa29128074', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:21:39', '1');
INSERT INTO `tb_operation_log` VALUES ('8fd7149f-0676-419e-b03f-8e583f31fe38', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:14:00', '1');
INSERT INTO `tb_operation_log` VALUES ('90193d64-74d1-4a43-9a2c-3c57f0f08434', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:23:40', '1');
INSERT INTO `tb_operation_log` VALUES ('90ed5a36-f82e-402d-a136-70a998ada446', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-14 17:32:01', '1');
INSERT INTO `tb_operation_log` VALUES ('90f29190-da80-49b1-b06e-4d010d8021f7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:43:21', '1');
INSERT INTO `tb_operation_log` VALUES ('9103a1da-b8dd-4e64-8735-d1ff0c21f94d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 08:25:34', '1');
INSERT INTO `tb_operation_log` VALUES ('919f6ba9-2317-4626-87c6-beafda8001c8', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 13:19:20', '1');
INSERT INTO `tb_operation_log` VALUES ('91b73d60-daba-4d8f-a9d7-f3170a5a1855', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-01 15:55:46', '1');
INSERT INTO `tb_operation_log` VALUES ('91df24c0-7483-4680-92bc-51e1f0c709f0', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 08:25:47', '1');
INSERT INTO `tb_operation_log` VALUES ('91e9acc8-6351-450d-94f3-257c47468270', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '为角色授予权限', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.grantPermissionToRole()', '2017-04-04 10:19:19', '1');
INSERT INTO `tb_operation_log` VALUES ('923dc722-58e3-47f5-8151-51913a995e85', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 13:52:52', '1');
INSERT INTO `tb_operation_log` VALUES ('924460f4-0eb2-4e3f-832f-74ccbb347f4c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:40:10', '1');
INSERT INTO `tb_operation_log` VALUES ('928d45fa-a5f9-43a5-b68c-50448a391181', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 14:43:06', '1');
INSERT INTO `tb_operation_log` VALUES ('929b18b4-d824-49c3-be81-7ca7274c0549', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 22:21:55', '1');
INSERT INTO `tb_operation_log` VALUES ('92c12daf-13d9-4a17-9c12-7ad3a47cb879', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:40', '1');
INSERT INTO `tb_operation_log` VALUES ('92c657c9-ee36-495d-9da4-49b4412e2135', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:46:45', '1');
INSERT INTO `tb_operation_log` VALUES ('92f36c9b-4215-469e-9d7e-3a2dbdb4190c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:31:02', '1');
INSERT INTO `tb_operation_log` VALUES ('93067f5c-f74b-489c-bd68-4ad1df2d0ac4', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:28:53', '1');
INSERT INTO `tb_operation_log` VALUES ('932a1eb7-6267-48d3-863c-1317df7aaac4', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:09:17', '1');
INSERT INTO `tb_operation_log` VALUES ('932d34af-4f54-4261-b743-310a9e7bf68e', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:38:18', '1');
INSERT INTO `tb_operation_log` VALUES ('93b0e240-ad1b-4585-b9ec-ecee74f346c5', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:58:58', '1');
INSERT INTO `tb_operation_log` VALUES ('93d6a5a1-31d4-4acc-8b75-3304301fed0d', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:32:06', '1');
INSERT INTO `tb_operation_log` VALUES ('94604706-a74e-4221-863a-0a8b1069bb93', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:39:58', '1');
INSERT INTO `tb_operation_log` VALUES ('94f76b5c-cde4-4235-ab51-8ccb901ca940', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 21:14:42', '1');
INSERT INTO `tb_operation_log` VALUES ('950652ac-476e-4bd5-87ca-08d90973c5c4', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-21 22:51:50', '1');
INSERT INTO `tb_operation_log` VALUES ('950dd5f2-b918-4e63-bafd-278d6d3faa4e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:13:40', '1');
INSERT INTO `tb_operation_log` VALUES ('950f05d7-8957-4e00-9083-49ed94beb21e', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 08:10:00', '1');
INSERT INTO `tb_operation_log` VALUES ('95835410-a07e-478f-8f83-ab96c465a479', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:17:13', '1');
INSERT INTO `tb_operation_log` VALUES ('95913203-7747-4afe-b087-9265519863e7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:41:18', '1');
INSERT INTO `tb_operation_log` VALUES ('95c88f28-1568-4ec6-8fb3-8531bf4b2473', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:03', '1');
INSERT INTO `tb_operation_log` VALUES ('95d28731-59af-4d25-a199-31086fe6dbd2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 16:01:59', '1');
INSERT INTO `tb_operation_log` VALUES ('95e9bf3c-d6a2-4053-b7a9-132fe1030f96', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:27:25', '1');
INSERT INTO `tb_operation_log` VALUES ('95f09156-9183-42ad-a3cf-a203c27fc7bf', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 05:26:42', '1');
INSERT INTO `tb_operation_log` VALUES ('96151e63-6c21-4ef3-809f-6bc4e6b12c38', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-13 19:06:58', '1');
INSERT INTO `tb_operation_log` VALUES ('962f9bfc-b133-404e-bbf9-a8329c409462', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:24:21', '1');
INSERT INTO `tb_operation_log` VALUES ('963d1ad8-c839-4c44-a3b4-24e92a0ef4ec', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:31:59', '1');
INSERT INTO `tb_operation_log` VALUES ('963e5d77-932e-45f8-b9eb-3a0c4ea29112', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-01 15:55:44', '1');
INSERT INTO `tb_operation_log` VALUES ('96d2a6b6-545c-46f4-b68e-75bb566f9d0a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:25:05', '1');
INSERT INTO `tb_operation_log` VALUES ('96d887af-476e-4660-be12-4abd03dd925e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 13:26:13', '1');
INSERT INTO `tb_operation_log` VALUES ('971218ed-227b-4b2c-9471-6fb0b8ebb91e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:37:17', '1');
INSERT INTO `tb_operation_log` VALUES ('971b920d-6bd0-4ae6-83b9-cf50e7179ef8', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:31:57', '1');
INSERT INTO `tb_operation_log` VALUES ('9768f3f7-54b4-44d8-ae95-c91319fa584a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 14:44:46', '1');
INSERT INTO `tb_operation_log` VALUES ('97a2a61e-196a-458b-9ffe-1e1f7e64505b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:42:00', '1');
INSERT INTO `tb_operation_log` VALUES ('9813eebf-1351-4bea-a0bf-0dd938eb834f', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-16 23:12:00', '1');
INSERT INTO `tb_operation_log` VALUES ('9820d022-a444-4378-b514-f031fa5969c2', '001', 'admin', '116.18.228.114', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 18:37:35', '1');
INSERT INTO `tb_operation_log` VALUES ('984092e6-3de8-4634-9ff3-898c38920da7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:28:52', '1');
INSERT INTO `tb_operation_log` VALUES ('98728c0a-682a-49ba-9731-786de9637ec0', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-14 17:01:57', '1');
INSERT INTO `tb_operation_log` VALUES ('98b74da0-b15f-43d7-9620-51a1a01bb7b0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:18:05', '1');
INSERT INTO `tb_operation_log` VALUES ('98e580ba-d0fa-4235-a849-af0945eb095e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 18:42:46', '1');
INSERT INTO `tb_operation_log` VALUES ('98ff6768-9622-49d6-a602-6c88c09f6354', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:00:41', '1');
INSERT INTO `tb_operation_log` VALUES ('995c1c87-76ce-41ed-84dd-3a290fd2384b', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 22:23:35', '1');
INSERT INTO `tb_operation_log` VALUES ('996c30a9-2a06-42b2-b98d-c7d8f5bf009c', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:11:06', '1');
INSERT INTO `tb_operation_log` VALUES ('998ba08d-62e7-4d05-af70-2c9df2868647', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-13 21:37:15', '1');
INSERT INTO `tb_operation_log` VALUES ('9997667a-a76a-40c4-a8dc-3a3ea53007d6', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:26:07', '1');
INSERT INTO `tb_operation_log` VALUES ('9999b02f-c2e9-4558-b88a-76e98b0baffd', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:31:23', '1');
INSERT INTO `tb_operation_log` VALUES ('9a04f328-edca-41b3-8bad-d74e4a11ee2c', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '为角色授予权限', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.grantPermissionToRole()', '2017-04-03 13:44:50', '1');
INSERT INTO `tb_operation_log` VALUES ('9a8025c8-e75a-4eee-9e0e-bb163317dca5', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:14:33', '1');
INSERT INTO `tb_operation_log` VALUES ('9aa8531e-2b91-4b64-bf52-a547b7200ff0', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:24:10', '1');
INSERT INTO `tb_operation_log` VALUES ('9ae0b1fe-700d-4bcf-88b3-19ab50e388f0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:10:41', '1');
INSERT INTO `tb_operation_log` VALUES ('9b3b27eb-ce81-4286-bde5-eac8feceea49', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:45:20', '1');
INSERT INTO `tb_operation_log` VALUES ('9b6e6e66-9ca3-4b1f-9900-955cc6453ca3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 08:25:32', '1');
INSERT INTO `tb_operation_log` VALUES ('9b718e34-164f-43df-8373-c965b1ad5446', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '编辑代码生成器', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.update()', '2017-02-13 12:39:42', '1');
INSERT INTO `tb_operation_log` VALUES ('9b89aa67-b10e-47fd-abda-2c82d6d400ba', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:46:27', '1');
INSERT INTO `tb_operation_log` VALUES ('9bb10c05-b7c9-49ab-b55c-2eff33abb573', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:46:52', '1');
INSERT INTO `tb_operation_log` VALUES ('9bc2a168-be02-4590-9c03-b7bef386d04e', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:54:24', '1');
INSERT INTO `tb_operation_log` VALUES ('9bf9f445-b8e4-4996-b7af-5532809af544', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:45:50', '1');
INSERT INTO `tb_operation_log` VALUES ('9c208f3f-e1a1-4f2b-877b-3b91c42329a9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:46:12', '1');
INSERT INTO `tb_operation_log` VALUES ('9c410b46-02f3-4d9a-ae39-d84ef10ad4cc', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:40', '1');
INSERT INTO `tb_operation_log` VALUES ('9c799620-68f3-4480-85dc-0d76cac94642', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:43', '1');
INSERT INTO `tb_operation_log` VALUES ('9c85f999-8603-4cef-801f-bdb9eb67ea0e', '001', 'admin', '116.18.228.114', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 18:37:12', '1');
INSERT INTO `tb_operation_log` VALUES ('9ca5f1c1-f0a3-4b13-9132-161255d40236', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 13:48:39', '1');
INSERT INTO `tb_operation_log` VALUES ('9caab835-8c41-469c-acb9-b21d967508c4', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.add()', '2017-04-03 13:25:53', '1');
INSERT INTO `tb_operation_log` VALUES ('9cbbc01f-35ec-401b-b0cb-ee1840be4201', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:29:39', '1');
INSERT INTO `tb_operation_log` VALUES ('9cc73e35-0b2b-45c3-b689-022c67120f57', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:45:17', '1');
INSERT INTO `tb_operation_log` VALUES ('9d232bbc-959d-48ba-a229-fe40332ac917', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:33:51', '1');
INSERT INTO `tb_operation_log` VALUES ('9d34ae38-12b1-4ca6-aec0-7a529c5fd422', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:06:54', '1');
INSERT INTO `tb_operation_log` VALUES ('9d37b235-fe2d-4f5c-a293-ce80547dd2af', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:16', '1');
INSERT INTO `tb_operation_log` VALUES ('9d86f22c-e38b-4665-8028-2632b0c0bbfc', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-04 10:19:16', '1');
INSERT INTO `tb_operation_log` VALUES ('9d9897ed-155d-4cf6-a38c-3af0c65bfbea', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-16 23:29:23', '1');
INSERT INTO `tb_operation_log` VALUES ('9e0394b1-aec7-4fdd-8dfd-49e6f67ebc06', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 07:34:24', '1');
INSERT INTO `tb_operation_log` VALUES ('9e29ca48-4c01-4435-9acd-2f002100b79e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:09:05', '1');
INSERT INTO `tb_operation_log` VALUES ('9e83a732-93f5-4b6a-a5b4-8a33d7d985e3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:10:15', '1');
INSERT INTO `tb_operation_log` VALUES ('9eb53b3f-62ff-4637-8cd0-d964b8b06ea9', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:55:47', '1');
INSERT INTO `tb_operation_log` VALUES ('9ec98e41-f430-4dbf-bbc1-64a898bd7a4a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 14:33:34', '1');
INSERT INTO `tb_operation_log` VALUES ('9ecee3a5-c037-43d5-bc68-32c038ae1d84', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:30:43', '1');
INSERT INTO `tb_operation_log` VALUES ('9ecfca9c-3d79-413a-aec0-644ed7973e2b', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:44:00', '1');
INSERT INTO `tb_operation_log` VALUES ('9ee044fc-3ffa-4739-811e-93ced0ef975b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 21:08:15', '1');
INSERT INTO `tb_operation_log` VALUES ('9ee9c98e-816c-495d-89bc-0495d547a83c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:16:04', '1');
INSERT INTO `tb_operation_log` VALUES ('9f056687-036e-4901-b108-2217e2d7cd43', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:50:47', '1');
INSERT INTO `tb_operation_log` VALUES ('9f08de95-6dcb-4f9f-b8b9-910981272273', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-16 23:22:17', '1');
INSERT INTO `tb_operation_log` VALUES ('9f1d1c3c-bbd1-4d42-a7fc-549b9e884388', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:57:27', '1');
INSERT INTO `tb_operation_log` VALUES ('9f36dfc4-4c83-4c2a-b89f-5fd2e0f0d896', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '修改用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.updateUser()', '2017-03-13 20:45:08', '1');
INSERT INTO `tb_operation_log` VALUES ('9f7cee30-2e1c-47f9-87c0-fc7371a80bde', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-16 23:15:24', '1');
INSERT INTO `tb_operation_log` VALUES ('9f893630-3be3-49d8-b54d-59a612e7e4bb', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:15:41', '1');
INSERT INTO `tb_operation_log` VALUES ('9fa44ad3-4b55-4678-a553-b47d5a1121d9', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 06:38:49', '1');
INSERT INTO `tb_operation_log` VALUES ('9fccf4e1-3045-4d44-963e-0986fea56883', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:46:35', '1');
INSERT INTO `tb_operation_log` VALUES ('9fdfb700-95be-4d0f-abe8-fb0354ec08d5', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:46:18', '1');
INSERT INTO `tb_operation_log` VALUES ('9feb70c5-0e58-4860-88b5-0f5a6057bad6', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:15:35', '1');
INSERT INTO `tb_operation_log` VALUES ('a01b552c-5c07-45c2-8ba9-5fc001bb8c5b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:57:50', '1');
INSERT INTO `tb_operation_log` VALUES ('a05262ad-0861-4090-9f35-d172112ff5b6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:29:29', '1');
INSERT INTO `tb_operation_log` VALUES ('a06f1daf-1eb6-49d9-9141-80db098cee3c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:59:23', '1');
INSERT INTO `tb_operation_log` VALUES ('a07692a1-364a-4959-b367-ae1aad529619', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:36', '1');
INSERT INTO `tb_operation_log` VALUES ('a0a15f66-8732-4245-a9ce-fae5fa20a7c2', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:16:19', '1');
INSERT INTO `tb_operation_log` VALUES ('a1016488-aca8-4790-aff0-2298877ad5de', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:15:08', '1');
INSERT INTO `tb_operation_log` VALUES ('a1066dc0-0fff-4789-8c1a-8b6e1b4ad354', '001', 'admin', '116.18.228.114', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-03 19:05:41', '1');
INSERT INTO `tb_operation_log` VALUES ('a11b0590-b5be-4ea2-a4a3-3a617f866bc4', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 18:41:53', '1');
INSERT INTO `tb_operation_log` VALUES ('a1407a20-8b84-4bcd-b06d-8a42a74e13f8', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-04-03 13:47:21', '1');
INSERT INTO `tb_operation_log` VALUES ('a149fc5c-5b98-4807-9860-2661c3438bbf', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:21:19', '1');
INSERT INTO `tb_operation_log` VALUES ('a15e425e-9b96-4e8e-83a4-cf1469bf34ab', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:58:40', '1');
INSERT INTO `tb_operation_log` VALUES ('a1d6c2b8-6e62-421c-afa7-ff3cb5879b37', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:55:44', '1');
INSERT INTO `tb_operation_log` VALUES ('a1f10ff3-73b4-451b-9f07-d7f2bb600d4c', '001', 'admin', '116.18.228.114', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-03 18:52:44', '1');
INSERT INTO `tb_operation_log` VALUES ('a2083082-ded3-4a5c-9010-c30c045c10b3', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '为用户授予角色', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.grantRoleToUser()', '2017-03-14 17:30:01', '1');
INSERT INTO `tb_operation_log` VALUES ('a24d5eec-a934-49cc-aafd-e8f92a745d93', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:39:44', '1');
INSERT INTO `tb_operation_log` VALUES ('a2762268-cdc7-40ec-b0ac-edaca7d1c6ac', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:29:51', '1');
INSERT INTO `tb_operation_log` VALUES ('a2f05948-caa7-4e47-86e9-220f9338b661', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:12:21', '1');
INSERT INTO `tb_operation_log` VALUES ('a3369c63-484d-4099-b0cb-b3258b3df9a5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:10:20', '1');
INSERT INTO `tb_operation_log` VALUES ('a3995857-bd05-4f5c-b28f-d97165dcb1ae', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:37:13', '1');
INSERT INTO `tb_operation_log` VALUES ('a3ad08ec-e48a-4534-9d73-e7027289f536', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:37:21', '1');
INSERT INTO `tb_operation_log` VALUES ('a3c9f8c5-3746-4ca0-94dc-f24370f759ae', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-14 17:35:10', '1');
INSERT INTO `tb_operation_log` VALUES ('a3cbc55f-4fc2-40a4-9055-51c5c1224f7d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-01 15:20:19', '1');
INSERT INTO `tb_operation_log` VALUES ('a3da3c9c-6cba-4f65-a409-da286eac4865', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:47:40', '1');
INSERT INTO `tb_operation_log` VALUES ('a46e2496-c44e-437f-9817-884ae4b9f22c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:30:05', '1');
INSERT INTO `tb_operation_log` VALUES ('a470b223-d9f4-4a74-aff9-dfd1518037f8', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '禁用／启用用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.updateUserStatus()', '2017-03-14 17:42:12', '1');
INSERT INTO `tb_operation_log` VALUES ('a4942067-6118-49bc-a0aa-89421f283b67', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:33:11', '1');
INSERT INTO `tb_operation_log` VALUES ('a4cdd74b-e203-434b-b2c6-0ffe49b9bb3a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 16:12:45', '1');
INSERT INTO `tb_operation_log` VALUES ('a5341ea3-bf0f-4489-898c-29a3f8ac94dc', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 22:21:51', '1');
INSERT INTO `tb_operation_log` VALUES ('a54c4439-f27f-4984-9b37-38a6537e86e8', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '编辑权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.update()', '2017-02-11 17:08:58', '1');
INSERT INTO `tb_operation_log` VALUES ('a54f5a80-a69c-4f8c-b77e-feedd324d824', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:20:24', '1');
INSERT INTO `tb_operation_log` VALUES ('a58bc224-2c30-4954-99b2-6ef596427976', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:48:58', '1');
INSERT INTO `tb_operation_log` VALUES ('a5ab56aa-bd41-4a03-903e-1989809b3458', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 15:19:51', '1');
INSERT INTO `tb_operation_log` VALUES ('a5e9dbe4-c8ff-4bfb-abfa-d02b5b6f944c', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 07:41:18', '1');
INSERT INTO `tb_operation_log` VALUES ('a5ed53e3-7e42-434a-b50c-f1f0c406b338', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-14 17:28:57', '1');
INSERT INTO `tb_operation_log` VALUES ('a60c52b6-46b1-40dd-ab08-e4e67cfb1b78', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-14 15:49:44', '1');
INSERT INTO `tb_operation_log` VALUES ('a63ba9e0-a703-40e4-8a85-bf5bb34fe79f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 00:19:26', '1');
INSERT INTO `tb_operation_log` VALUES ('a63f4d81-af35-4f2d-a1d2-d1aad6b486a9', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:19:57', '1');
INSERT INTO `tb_operation_log` VALUES ('a67a3c8a-b30c-4119-9141-6bceb9555590', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:47:11', '1');
INSERT INTO `tb_operation_log` VALUES ('a67d9af3-6988-4ae4-a30b-543574d65afe', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:14:32', '1');
INSERT INTO `tb_operation_log` VALUES ('a6888120-9275-4e6e-9273-1b96729f54e1', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:54:59', '1');
INSERT INTO `tb_operation_log` VALUES ('a6a47264-b179-46aa-96cc-214c7f2a19c2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:37:50', '1');
INSERT INTO `tb_operation_log` VALUES ('a71633ef-8656-4fc8-9145-2e0f11064497', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:13:46', '1');
INSERT INTO `tb_operation_log` VALUES ('a741296e-44f5-46db-8947-37bfebb9ab91', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:14:54', '1');
INSERT INTO `tb_operation_log` VALUES ('a7b3bbf0-d324-4755-a380-159f512659bd', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:48:53', '1');
INSERT INTO `tb_operation_log` VALUES ('a7cbf047-daba-4618-9d78-2047ba826059', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:18:11', '1');
INSERT INTO `tb_operation_log` VALUES ('a7fc0bfe-c3fa-4f4e-94d8-5c393274aaf8', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:41:36', '1');
INSERT INTO `tb_operation_log` VALUES ('a80659a8-8187-4f62-9862-fd98f0ed0b06', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-04-03 13:43:44', '1');
INSERT INTO `tb_operation_log` VALUES ('a81d56c1-9f57-4d65-b463-38fbe75c67ac', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 16:17:02', '1');
INSERT INTO `tb_operation_log` VALUES ('a844837b-74b0-4b74-a632-d33744c0c3ea', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 14:48:00', '1');
INSERT INTO `tb_operation_log` VALUES ('a85f11a8-e5fc-4c61-a943-f26b31ea9043', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:25:04', '1');
INSERT INTO `tb_operation_log` VALUES ('a893072c-4cef-468d-b3f5-c23e1187634c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 11:32:06', '1');
INSERT INTO `tb_operation_log` VALUES ('a8a26fc1-97fd-42be-a3d7-a2df32edd156', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-04 11:27:05', '1');
INSERT INTO `tb_operation_log` VALUES ('a8c8a6cb-2812-45c7-86a6-a7be7876dc42', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:45:12', '1');
INSERT INTO `tb_operation_log` VALUES ('a8e1620c-4528-4fd0-8af2-fcfbcbd1c343', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-01 16:23:31', '1');
INSERT INTO `tb_operation_log` VALUES ('a9562936-9c6e-494f-bb2e-22f0099b6503', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:12:20', '1');
INSERT INTO `tb_operation_log` VALUES ('a9b67e8d-7d0f-47d5-9d96-ca7f463f813d', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 16:12:54', '1');
INSERT INTO `tb_operation_log` VALUES ('a9c24aa6-6e77-4e93-a751-bae3bea3a812', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:09:19', '1');
INSERT INTO `tb_operation_log` VALUES ('a9e191c8-fc3a-414e-80ce-dac8e875ae3c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:37:33', '1');
INSERT INTO `tb_operation_log` VALUES ('a9e411d5-3cad-4cad-a6ac-2b604e0f6b17', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:25:38', '1');
INSERT INTO `tb_operation_log` VALUES ('a9f39fe3-fb47-4c65-b140-92f83ee77099', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:10:18', '1');
INSERT INTO `tb_operation_log` VALUES ('aa2a64f7-9711-48e4-a001-409dc07f3c46', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 00:14:47', '1');
INSERT INTO `tb_operation_log` VALUES ('aaab2274-84c3-49bc-9399-f02925b778fa', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:06:53', '1');
INSERT INTO `tb_operation_log` VALUES ('aae5ee5a-fea6-4b7e-b3cd-e824077ebaa3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:27:54', '1');
INSERT INTO `tb_operation_log` VALUES ('ab1790af-06e0-4b93-92df-c8790d883371', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 07:33:58', '1');
INSERT INTO `tb_operation_log` VALUES ('ab49dff6-6dba-4537-abd2-8365bff19ca4', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 07:43:06', '1');
INSERT INTO `tb_operation_log` VALUES ('ab6885d4-2150-43ff-951f-68def76e969b', '001', 'admin', '127.0.0.1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:07:24', '1');
INSERT INTO `tb_operation_log` VALUES ('ab6c1d0d-9a6f-44a6-a04d-93668a764aa5', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:33:41', '1');
INSERT INTO `tb_operation_log` VALUES ('ab6de346-d963-4dca-88d6-6d6548d40e09', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:39:37', '1');
INSERT INTO `tb_operation_log` VALUES ('abaeeaca-4a54-4a39-b534-6c4aa4f0557c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:40:18', '1');
INSERT INTO `tb_operation_log` VALUES ('abb9df4a-0e40-43ff-b6cd-b06bb6ec92f4', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 18:34:33', '1');
INSERT INTO `tb_operation_log` VALUES ('abd9994c-8322-4bd6-a467-341bfa80f579', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:37:45', '1');
INSERT INTO `tb_operation_log` VALUES ('abeaaa4f-1669-40e6-a8e2-01671e30cd51', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:49:08', '1');
INSERT INTO `tb_operation_log` VALUES ('abef6846-706e-4931-ad7b-692e82379ea0', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:17', '1');
INSERT INTO `tb_operation_log` VALUES ('abf5ca6d-29f5-4e21-a490-f748e6256da5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:48:55', '1');
INSERT INTO `tb_operation_log` VALUES ('abf84d5b-fa81-4b52-9ad0-0f16858fa85a', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:16:20', '1');
INSERT INTO `tb_operation_log` VALUES ('ac43df47-8ab2-48fa-86e2-457f22ee266a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:48:02', '1');
INSERT INTO `tb_operation_log` VALUES ('ac51ed49-d02e-4e2b-889c-f19efae72d57', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 19:40:21', '1');
INSERT INTO `tb_operation_log` VALUES ('ac7c7ae9-6947-4e22-9127-917b827097b6', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:20:07', '1');
INSERT INTO `tb_operation_log` VALUES ('ac83b4f8-9c11-4971-a1aa-628fda94e784', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 18:48:02', '1');
INSERT INTO `tb_operation_log` VALUES ('acb43164-7066-48b3-a968-b7a957ea06e7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-04 10:42:45', '1');
INSERT INTO `tb_operation_log` VALUES ('ad3e16c1-39a9-4ae9-82a9-add20433d839', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:50', '1');
INSERT INTO `tb_operation_log` VALUES ('ad44b615-1497-40bd-98ad-10a977bf2db1', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-16 23:39:42', '1');
INSERT INTO `tb_operation_log` VALUES ('ad51c73f-2bf0-42fe-8486-0920837297d2', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:39:43', '1');
INSERT INTO `tb_operation_log` VALUES ('ad738807-a67a-4787-9aae-58ed19f0f127', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '编辑团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.update()', '2017-04-04 10:42:00', '1');
INSERT INTO `tb_operation_log` VALUES ('ad7ca0c3-1552-421c-ad5a-fdf4dca7e69d', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-16 23:22:34', '1');
INSERT INTO `tb_operation_log` VALUES ('ad86a6d7-6e79-44be-8774-447f2b07b3a2', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:23:46', '1');
INSERT INTO `tb_operation_log` VALUES ('add8081a-e4b9-48e6-9c1a-a219abe38ec1', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 19:42:32', '1');
INSERT INTO `tb_operation_log` VALUES ('addd9003-ee20-425c-be8e-25b054b6b76d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:49:46', '1');
INSERT INTO `tb_operation_log` VALUES ('ae1b57c9-520a-4717-9f4f-d0c159666924', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:21:14', '1');
INSERT INTO `tb_operation_log` VALUES ('ae48df60-14ab-4f33-9e1d-bf0a710cc02d', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:59:37', '1');
INSERT INTO `tb_operation_log` VALUES ('ae6e99f2-f5b2-4a25-a979-130c1e95fda6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:44:02', '1');
INSERT INTO `tb_operation_log` VALUES ('aed62e7c-d728-4549-8db2-d4aecc844a75', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:14:55', '1');
INSERT INTO `tb_operation_log` VALUES ('aedc9088-7921-4ccc-9897-d4e6485e348e', '001', 'admin', '116.18.228.114', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-03 18:52:48', '1');
INSERT INTO `tb_operation_log` VALUES ('aee95b6a-9895-41fd-814f-ff3d8df1730d', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-14 17:37:29', '1');
INSERT INTO `tb_operation_log` VALUES ('af28bc6b-c76d-4e10-bc24-408e265bbe75', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:07:06', '1');
INSERT INTO `tb_operation_log` VALUES ('af599d07-3daf-4136-9664-07049b356aaa', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-16 23:16:45', '1');
INSERT INTO `tb_operation_log` VALUES ('af7183a5-f0c8-41a6-ad54-af46c32fc5b3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 18:45:54', '1');
INSERT INTO `tb_operation_log` VALUES ('af7cb96b-822c-4349-bb44-f30992aff4c2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:56:28', '1');
INSERT INTO `tb_operation_log` VALUES ('af8d8dfe-073f-4fc8-9b2c-cb36991fed3e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 13:23:50', '1');
INSERT INTO `tb_operation_log` VALUES ('af95fbcf-01ac-43b7-a7c7-c2113a796cc1', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-04 10:19:47', '1');
INSERT INTO `tb_operation_log` VALUES ('afcf276d-bda2-4a16-91d5-1687a36113d2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:59:03', '1');
INSERT INTO `tb_operation_log` VALUES ('b010e615-a8dd-4f39-b7ae-3430674c04fe', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:28:49', '1');
INSERT INTO `tb_operation_log` VALUES ('b022b44c-b6dd-4f50-b22f-1f7249666b56', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '禁用／启用用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.updateUserStatus()', '2017-03-14 17:42:06', '1');
INSERT INTO `tb_operation_log` VALUES ('b025d79e-c3d5-41ad-b33e-39501dcbc1f2', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 20:02:30', '1');
INSERT INTO `tb_operation_log` VALUES ('b050da46-3bc1-4920-b521-efd64ca0a7c2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:43:58', '1');
INSERT INTO `tb_operation_log` VALUES ('b063ed80-ce35-4173-8c0d-24176047a6d2', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:11:21', '1');
INSERT INTO `tb_operation_log` VALUES ('b08265fe-5dd0-49eb-b80a-12ead817ab5b', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 23:23:37', '1');
INSERT INTO `tb_operation_log` VALUES ('b0861832-9229-4301-afe9-36de80cae3fb', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 00:51:06', '1');
INSERT INTO `tb_operation_log` VALUES ('b11b37e1-18e6-45e9-9e30-187eb7c174b3', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-14 15:49:45', '1');
INSERT INTO `tb_operation_log` VALUES ('b16dac4d-1872-438a-aa82-8f8f0be49966', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:44:58', '1');
INSERT INTO `tb_operation_log` VALUES ('b17d0b4d-5ee6-4fac-8e08-d1b6896925bf', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:16:45', '1');
INSERT INTO `tb_operation_log` VALUES ('b1cf2cd6-71e4-44db-88d2-842279219c22', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 14:44:48', '1');
INSERT INTO `tb_operation_log` VALUES ('b272ef6b-d3be-41b4-b102-da4e1fc519b1', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:21:39', '1');
INSERT INTO `tb_operation_log` VALUES ('b28a6afc-90d5-4e35-8ffc-3e3c27779677', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 06:38:37', '1');
INSERT INTO `tb_operation_log` VALUES ('b295a1a9-6a65-4b1c-af8f-96ad24b5562b', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 09:59:35', '1');
INSERT INTO `tb_operation_log` VALUES ('b2bb1a16-0567-4819-8399-d987045317e7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:01:39', '1');
INSERT INTO `tb_operation_log` VALUES ('b2bdd524-62dd-468e-86b7-341bdf7b99fe', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 15:29:51', '1');
INSERT INTO `tb_operation_log` VALUES ('b2c9ea0a-5419-4aca-9553-7a6da9cd29ce', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:00:18', '1');
INSERT INTO `tb_operation_log` VALUES ('b320d1df-f0ac-4210-a190-40269a6b5b7b', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:15:41', '1');
INSERT INTO `tb_operation_log` VALUES ('b32bfbcb-e7f6-4cd5-9bff-da8ca119de1d', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:22:30', '1');
INSERT INTO `tb_operation_log` VALUES ('b38c6d98-58a0-42ce-8821-4910326dc7d7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:10:56', '1');
INSERT INTO `tb_operation_log` VALUES ('b394848e-56cc-43c0-bb9e-f46727e13307', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:50:01', '1');
INSERT INTO `tb_operation_log` VALUES ('b3a26fea-b97e-4369-86f5-3e3049ef426e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:30:53', '1');
INSERT INTO `tb_operation_log` VALUES ('b3e315bb-d132-4304-9654-cd31451c38a7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-14 17:36:50', '1');
INSERT INTO `tb_operation_log` VALUES ('b3fa4b99-ebb3-422c-9d5c-c32f80a043c2', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-21 22:51:43', '1');
INSERT INTO `tb_operation_log` VALUES ('b417a220-2e9a-47e4-9c4c-e0ca77f94a06', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:28:30', '1');
INSERT INTO `tb_operation_log` VALUES ('b4437a7f-18b3-4961-9da9-7c3224cf9c6c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:20:16', '1');
INSERT INTO `tb_operation_log` VALUES ('b46814bc-b9d4-41e4-99f2-4c068da7df16', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 16:17:00', '1');
INSERT INTO `tb_operation_log` VALUES ('b48cd9b7-ce0d-4f60-8bd6-4e1099922bbe', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:28:07', '1');
INSERT INTO `tb_operation_log` VALUES ('b4b4be6d-7ab7-4dbb-a3d3-c069e2a3a5b2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:25:19', '1');
INSERT INTO `tb_operation_log` VALUES ('b4cb8220-4043-4f8e-a709-72a366f8a5e5', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:25:37', '1');
INSERT INTO `tb_operation_log` VALUES ('b4f9256b-0c4a-42a1-827f-ed417b40a050', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:39:26', '1');
INSERT INTO `tb_operation_log` VALUES ('b4ffa85b-0d99-404e-b365-959715b1507f', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:25:18', '1');
INSERT INTO `tb_operation_log` VALUES ('b55b9358-7324-4560-87d5-2aa449da8f69', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:19:25', '1');
INSERT INTO `tb_operation_log` VALUES ('b57a1678-d2f1-4dc8-bfe9-6c8ccd4db31d', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 08:25:21', '1');
INSERT INTO `tb_operation_log` VALUES ('b595a530-e206-4a31-8050-302827b8aa9a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:02:58', '1');
INSERT INTO `tb_operation_log` VALUES ('b5999745-c3d8-4735-b5f1-5e2a3d5c12cf', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '删除用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.deleteUser()', '2017-03-14 17:34:27', '1');
INSERT INTO `tb_operation_log` VALUES ('b5b4ad26-58da-474c-a737-458d636dba15', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:07:48', '1');
INSERT INTO `tb_operation_log` VALUES ('b5e63678-f4c8-40d9-89ed-ac2f681d165d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:38:24', '1');
INSERT INTO `tb_operation_log` VALUES ('b65740cd-0d9f-43e4-947c-8391eb82460d', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:30:07', '1');
INSERT INTO `tb_operation_log` VALUES ('b679915e-fb54-448d-8fdd-2ffaf9fc4207', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-13 18:49:05', '1');
INSERT INTO `tb_operation_log` VALUES ('b6a2c47e-f4b1-4826-b567-611e684d0a6c', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 18:28:00', '1');
INSERT INTO `tb_operation_log` VALUES ('b6fe233c-c843-491a-b2b5-0a20024a9639', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:47:56', '1');
INSERT INTO `tb_operation_log` VALUES ('b700a8f3-807a-487a-a38e-07ed0ef568cd', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:29:00', '1');
INSERT INTO `tb_operation_log` VALUES ('b725fefb-fd2e-44e8-aafe-4814f773d299', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:54:07', '1');
INSERT INTO `tb_operation_log` VALUES ('b74389f6-c244-4ace-85ce-12c57ab9a56e', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:35:39', '1');
INSERT INTO `tb_operation_log` VALUES ('b75642ba-b79c-40f3-bc1d-e8490888e3f5', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:16:47', '1');
INSERT INTO `tb_operation_log` VALUES ('b7674631-472b-4fc9-855d-7208af89734e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-04 10:42:40', '1');
INSERT INTO `tb_operation_log` VALUES ('b77fdcd2-f090-457d-9711-5b9d51773f95', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:25:30', '1');
INSERT INTO `tb_operation_log` VALUES ('b7950819-03e5-4292-bd7d-2069fad367ac', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 20:48:01', '1');
INSERT INTO `tb_operation_log` VALUES ('b7c33a22-2e7f-40b0-9992-f91ca77c2fe3', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:27:03', '1');
INSERT INTO `tb_operation_log` VALUES ('b7e258b4-c386-4262-ac5d-f186b2e78fef', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:51:34', '1');
INSERT INTO `tb_operation_log` VALUES ('b7ebee73-d2c7-4e56-812c-13f034decb64', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '为角色授予权限', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.grantPermissionToRole()', '2017-03-14 17:28:49', '1');
INSERT INTO `tb_operation_log` VALUES ('b82280f1-310b-4f55-b8d4-4969342fa70d', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:58:12', '1');
INSERT INTO `tb_operation_log` VALUES ('b8ad0fa2-4547-46c5-89ba-2b26c902f40a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:51:03', '1');
INSERT INTO `tb_operation_log` VALUES ('b8e6c224-93bd-4d1f-8e9c-63d3563d6051', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:37:12', '1');
INSERT INTO `tb_operation_log` VALUES ('b8f64946-3955-41b1-9d0a-c97c596f4332', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:35:37', '1');
INSERT INTO `tb_operation_log` VALUES ('b9489d27-5bd1-4c6e-bdeb-5cae104e01c6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:11:14', '1');
INSERT INTO `tb_operation_log` VALUES ('b96c834b-1e87-4758-8043-9bc2c47b7bbe', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:36:39', '1');
INSERT INTO `tb_operation_log` VALUES ('b979e00a-8287-472d-b59f-aecf94d52d9e', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:51:41', '1');
INSERT INTO `tb_operation_log` VALUES ('b97bb9ea-7cf4-4769-b2a4-cc5598ef57fe', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:30:31', '1');
INSERT INTO `tb_operation_log` VALUES ('b9ae7fce-46ee-490b-81a3-66751ade753a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:47:59', '1');
INSERT INTO `tb_operation_log` VALUES ('b9b2aca8-9448-4c06-a748-a26bc773ba1e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:39:12', '1');
INSERT INTO `tb_operation_log` VALUES ('b9d50795-df21-407f-bff6-1a8e9f706186', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 15:31:57', '1');
INSERT INTO `tb_operation_log` VALUES ('ba158c34-8cdd-4c9b-b666-6e6995a4c6d5', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:47:47', '1');
INSERT INTO `tb_operation_log` VALUES ('ba54e406-483e-40b5-9073-c87995e09f7a', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 19:35:30', '1');
INSERT INTO `tb_operation_log` VALUES ('baba1d1f-dbad-41e1-bf23-1bffe76cc32d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:26:57', '1');
INSERT INTO `tb_operation_log` VALUES ('bb594742-0a97-4f2d-92a2-0e82362ab29e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:38:19', '1');
INSERT INTO `tb_operation_log` VALUES ('bb748f78-1ac6-40ab-8615-4a87bbb29c7a', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 15:43:09', '1');
INSERT INTO `tb_operation_log` VALUES ('bb839c17-d3df-43da-87cd-d9a21599f044', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:39:44', '1');
INSERT INTO `tb_operation_log` VALUES ('bb87f988-8e52-469d-8ac7-fb1a3dc41ece', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:40:19', '1');
INSERT INTO `tb_operation_log` VALUES ('bbaadfef-a616-468d-84ed-b986956e8373', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:26:58', '1');
INSERT INTO `tb_operation_log` VALUES ('bbbfb1e5-cc05-4d4d-8a7e-2b6fe486f3dc', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 23:02:54', '1');
INSERT INTO `tb_operation_log` VALUES ('bbe5b84f-0470-4686-a7cb-90a7344d0af9', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:46:14', '1');
INSERT INTO `tb_operation_log` VALUES ('bbf6810b-c77c-4bc6-9021-0739be78d440', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:19:57', '1');
INSERT INTO `tb_operation_log` VALUES ('bc82d17a-ba00-4341-8f1d-3fb3ca9cef09', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:15:36', '1');
INSERT INTO `tb_operation_log` VALUES ('bc85231b-0752-4ad3-bc08-2afae0724b97', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:21:44', '1');
INSERT INTO `tb_operation_log` VALUES ('bc9f7eaa-f36a-49f5-bf38-c98d81c56f6c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 07:25:32', '1');
INSERT INTO `tb_operation_log` VALUES ('bcbaf9d0-54f5-4d98-ad1c-89bee81c88d6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:47:54', '1');
INSERT INTO `tb_operation_log` VALUES ('bceba5bd-49e3-4106-9c56-39830ce96edd', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:13:53', '1');
INSERT INTO `tb_operation_log` VALUES ('bd214766-3aa8-4148-8996-a8dd7737c9b0', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:36:20', '1');
INSERT INTO `tb_operation_log` VALUES ('bd51c91d-7141-4c06-925b-348b87c20c83', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:38:28', '1');
INSERT INTO `tb_operation_log` VALUES ('bd57fca3-d067-4f19-b780-9b17468939d9', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:39:55', '1');
INSERT INTO `tb_operation_log` VALUES ('bd6b7556-f3cd-4bf1-84d9-9d625ffd691f', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 11:30:52', '1');
INSERT INTO `tb_operation_log` VALUES ('bd76207b-549e-4d74-9590-051e572743e8', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:10:13', '1');
INSERT INTO `tb_operation_log` VALUES ('be27bda6-ccbf-4156-985a-d0c418ab160c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:46:20', '1');
INSERT INTO `tb_operation_log` VALUES ('be4cdd55-0a14-43c3-a025-5f8a7d92a368', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:23:35', '1');
INSERT INTO `tb_operation_log` VALUES ('be6fd11d-8486-415c-a079-870cb9c95402', '001', 'admin', '116.18.228.114', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-03 18:55:55', '1');
INSERT INTO `tb_operation_log` VALUES ('be9924d2-cfb1-4864-bf33-358c2ea58924', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:20:23', '1');
INSERT INTO `tb_operation_log` VALUES ('bf19804c-bcef-4ace-8c8a-f6653b4f3cc7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:14:01', '1');
INSERT INTO `tb_operation_log` VALUES ('bf206ab7-86e5-4685-b263-503a6e066e2c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:14:54', '1');
INSERT INTO `tb_operation_log` VALUES ('bf480f66-2d4b-4c3a-bca6-eca9bdf2ee4f', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:45:08', '1');
INSERT INTO `tb_operation_log` VALUES ('bf48830e-e305-464b-83b8-946999b0a24c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:31:57', '1');
INSERT INTO `tb_operation_log` VALUES ('bf5f32d0-b49d-4ca8-a100-88be59fd3ad1', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:40:21', '1');
INSERT INTO `tb_operation_log` VALUES ('bf681b37-1862-41c3-bc87-b8ed5e40ff14', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:30:43', '1');
INSERT INTO `tb_operation_log` VALUES ('bf790b87-fad3-41f8-a224-5a3448093781', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 07:43:07', '1');
INSERT INTO `tb_operation_log` VALUES ('bf8e1624-42df-45a5-85dc-3d27b6fbbd52', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:41:47', '1');
INSERT INTO `tb_operation_log` VALUES ('bfceff8c-a93c-41b2-8395-4f525cd3332f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:44:12', '1');
INSERT INTO `tb_operation_log` VALUES ('bfd54960-4be4-47e2-aa43-ce70db3dbc79', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:45:27', '1');
INSERT INTO `tb_operation_log` VALUES ('bfef707f-fb8b-4ec9-9270-0805a70e70a8', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:13:26', '1');
INSERT INTO `tb_operation_log` VALUES ('c02f910b-1fc5-4f45-967d-d7c053880c32', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-21 22:51:47', '1');
INSERT INTO `tb_operation_log` VALUES ('c041abd8-7137-4e7f-8eb6-5b9212162ef9', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:40', '1');
INSERT INTO `tb_operation_log` VALUES ('c0708386-d5d8-41c4-b1d0-fcd9e4e8fd1e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:10:11', '1');
INSERT INTO `tb_operation_log` VALUES ('c076216f-cba9-4b37-a10a-b2de8ccbabd9', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:14:01', '1');
INSERT INTO `tb_operation_log` VALUES ('c08a790e-3ada-4b1b-900e-cda34f759978', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:20:19', '1');
INSERT INTO `tb_operation_log` VALUES ('c0c4e853-71ea-42d3-a89b-ee0dd3351cec', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:26:07', '1');
INSERT INTO `tb_operation_log` VALUES ('c1161513-d345-49a5-a751-dc4b868fa769', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 07:15:47', '1');
INSERT INTO `tb_operation_log` VALUES ('c117a59a-8bc6-442d-8186-e87f74711c61', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:39:37', '1');
INSERT INTO `tb_operation_log` VALUES ('c11884f5-a39c-4f88-ba10-f291b98097e2', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 00:14:51', '1');
INSERT INTO `tb_operation_log` VALUES ('c14b6888-3ca6-4c0a-ace4-87a0ac630a63', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:46:44', '1');
INSERT INTO `tb_operation_log` VALUES ('c1541866-6bb9-4355-ae13-73934c19a946', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:39:33', '1');
INSERT INTO `tb_operation_log` VALUES ('c16c7505-207b-4522-80b9-c99cc544cd1b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:24:07', '1');
INSERT INTO `tb_operation_log` VALUES ('c1a57315-a808-4872-9454-bb15dce37547', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:50:16', '1');
INSERT INTO `tb_operation_log` VALUES ('c1c5270c-0dae-4d80-abcb-d14f459cc3ad', '001', 'admin', '116.18.228.114', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 18:14:24', '1');
INSERT INTO `tb_operation_log` VALUES ('c1c75e77-f566-4b0a-8947-098ce9701970', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 16:24:16', '1');
INSERT INTO `tb_operation_log` VALUES ('c1f61bb2-8393-4f9c-b8c0-f7dbf58767be', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:18:43', '1');
INSERT INTO `tb_operation_log` VALUES ('c238dd09-8b8a-4cac-843f-d5a6345057b0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-11 19:10:33', '1');
INSERT INTO `tb_operation_log` VALUES ('c2d3cb1d-b46c-4e46-927e-a4a05fc34650', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:17:35', '1');
INSERT INTO `tb_operation_log` VALUES ('c3d21182-a10a-4836-939f-1393592578d1', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:48:06', '1');
INSERT INTO `tb_operation_log` VALUES ('c406475e-934c-40c4-905d-574fbb6008cb', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 06:13:26', '1');
INSERT INTO `tb_operation_log` VALUES ('c40ea97b-f1bd-4ad7-97c6-5f440a073df2', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:08:54', '1');
INSERT INTO `tb_operation_log` VALUES ('c47a82ec-9f6c-41a9-b941-8acee23a05a2', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 20:43:34', '1');
INSERT INTO `tb_operation_log` VALUES ('c489e072-bdc4-4f86-9e5a-dab11117ccc5', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 16:23:51', '1');
INSERT INTO `tb_operation_log` VALUES ('c49665db-7dbf-4170-bfb2-a921131e14f6', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:51:04', '1');
INSERT INTO `tb_operation_log` VALUES ('c4ea5af3-537b-47bc-b2db-d25f00b8af32', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:10:40', '1');
INSERT INTO `tb_operation_log` VALUES ('c4fd297c-f895-43e2-91cb-a5204cf55696', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:40:12', '1');
INSERT INTO `tb_operation_log` VALUES ('c5802c7b-6794-47ff-bb69-5df956a1b3dd', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:42:47', '1');
INSERT INTO `tb_operation_log` VALUES ('c591e40a-dd33-43d0-9a02-e724c6e4ee3e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-03-13 20:15:02', '1');
INSERT INTO `tb_operation_log` VALUES ('c5a1d6ba-ec69-45e4-9ffd-854cb6c192f8', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:27:13', '1');
INSERT INTO `tb_operation_log` VALUES ('c5b93f41-f0eb-43bc-93ea-24ed40e478ba', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:40:47', '1');
INSERT INTO `tb_operation_log` VALUES ('c5fb5a8b-8ad0-47c9-b641-1ce2f7f42c25', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:07:45', '1');
INSERT INTO `tb_operation_log` VALUES ('c5fd4554-9e50-4c9e-a106-893ff32dad5c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:09:32', '1');
INSERT INTO `tb_operation_log` VALUES ('c6097810-2ac8-405d-a3bd-994234850e9d', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 15:20:04', '1');
INSERT INTO `tb_operation_log` VALUES ('c674f477-0022-4071-949e-77b0a7e24dac', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:07:28', '1');
INSERT INTO `tb_operation_log` VALUES ('c6865dcd-ea65-482d-b529-34fffd93905f', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:47:32', '1');
INSERT INTO `tb_operation_log` VALUES ('c6deebe6-724c-4ddc-a58d-cabb4f3db3d7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '为用户授予角色', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.grantRoleToUser()', '2017-03-16 23:22:39', '1');
INSERT INTO `tb_operation_log` VALUES ('c6fb9c09-178f-45d7-b494-b00401e46079', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-14 17:44:14', '1');
INSERT INTO `tb_operation_log` VALUES ('c703eca3-59c1-460a-81ba-ad60f0abc0ca', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:17:33', '1');
INSERT INTO `tb_operation_log` VALUES ('c747335e-4313-48d8-a4c5-20a4c75be89a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:35:37', '1');
INSERT INTO `tb_operation_log` VALUES ('c7995e39-0e8d-4e82-9041-5ff814e24a97', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:10:13', '1');
INSERT INTO `tb_operation_log` VALUES ('c7ad4988-92a0-4d4a-8d63-2aa460fe2b3a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:03:34', '1');
INSERT INTO `tb_operation_log` VALUES ('c7cfbef4-a60f-41c2-84f4-b6754257cd9d', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:36:14', '1');
INSERT INTO `tb_operation_log` VALUES ('c812f662-ce4b-4da3-ada3-4781d42752c2', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:40:07', '1');
INSERT INTO `tb_operation_log` VALUES ('c83e7ec5-07a7-4dba-859b-6ff72b11172c', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 17:15:14', '1');
INSERT INTO `tb_operation_log` VALUES ('c86220ef-a808-4182-8066-2d89797fa4f3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:53:57', '1');
INSERT INTO `tb_operation_log` VALUES ('c88c2437-40bb-44b9-b42c-1e99aa4c6ba7', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:38:21', '1');
INSERT INTO `tb_operation_log` VALUES ('c89167dd-d61f-41b8-b153-34f8b97ec82d', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:28:39', '1');
INSERT INTO `tb_operation_log` VALUES ('c8a81466-77dc-4641-8abf-58d727bafe86', '001', 'admin', '116.18.228.114', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 21:26:40', '1');
INSERT INTO `tb_operation_log` VALUES ('c8adcfc6-e343-4e58-abb3-31d073dd4a07', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:12:47', '1');
INSERT INTO `tb_operation_log` VALUES ('c8bbba7b-9473-4b08-aa6a-37dbca13b17f', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:27:35', '1');
INSERT INTO `tb_operation_log` VALUES ('c8d15249-97a6-40b4-a7ac-ce69dd663240', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 13:46:48', '1');
INSERT INTO `tb_operation_log` VALUES ('c8f68d1d-54db-43a8-87d3-629c29f6a287', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:40', '1');
INSERT INTO `tb_operation_log` VALUES ('c903d37d-5358-4bff-b2a8-a7c966b10973', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-13 19:47:27', '1');
INSERT INTO `tb_operation_log` VALUES ('c9398df2-85d9-4e0a-b3b8-b9f15cf4e8a3', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 18:45:52', '1');
INSERT INTO `tb_operation_log` VALUES ('c93b6aa2-052f-467a-aab8-b5d468af2abd', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:23:57', '1');
INSERT INTO `tb_operation_log` VALUES ('c97bf8de-789c-4dca-bac1-dc04fa2de4f6', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 07:21:03', '1');
INSERT INTO `tb_operation_log` VALUES ('c9d91056-ee1a-40ba-81d7-c24c9628e909', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-01 15:30:15', '1');
INSERT INTO `tb_operation_log` VALUES ('c9f49c9f-a0c3-429d-8990-bfb65cacada0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-01 15:55:49', '1');
INSERT INTO `tb_operation_log` VALUES ('ca0b9e9f-bb4f-4f45-bd38-a03059e12aac', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:19:39', '1');
INSERT INTO `tb_operation_log` VALUES ('ca1116d2-f795-47f8-9625-674f6e6111c3', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 20:14:00', '1');
INSERT INTO `tb_operation_log` VALUES ('ca727b50-965f-4c00-b8c3-02d2ed74ff06', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:29:39', '1');
INSERT INTO `tb_operation_log` VALUES ('ca88e566-e6af-451c-8014-d8ac13a6493f', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-04-03 12:57:44', '1');
INSERT INTO `tb_operation_log` VALUES ('caf4ca1b-b631-4b18-86b7-cbcf90e1ca47', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:43:25', '1');
INSERT INTO `tb_operation_log` VALUES ('cb24be1b-cb2e-403f-9c3f-b29c7b52e1b6', '001', 'admin', '116.18.228.114', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-03 18:47:01', '1');
INSERT INTO `tb_operation_log` VALUES ('cb389be5-3ad8-4cd8-85a7-cee7be2a5c39', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 19:04:05', '1');
INSERT INTO `tb_operation_log` VALUES ('cb6fec8b-e003-40ca-8fe1-17456dc39f9d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:15:34', '1');
INSERT INTO `tb_operation_log` VALUES ('cb81eeaf-ada0-4f61-a160-af8f4a423a66', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:59:05', '1');
INSERT INTO `tb_operation_log` VALUES ('cb9a408e-f610-41ca-b992-684e410ffd38', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:03:34', '1');
INSERT INTO `tb_operation_log` VALUES ('cba798d9-dad6-4074-961a-75678cf93f1c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:46:36', '1');
INSERT INTO `tb_operation_log` VALUES ('cbb7ea2f-5237-46d7-be94-ce8005ee6a23', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 16:17:03', '1');
INSERT INTO `tb_operation_log` VALUES ('cbcc33ef-4499-4934-9828-70be8e8f61c7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 14:44:48', '1');
INSERT INTO `tb_operation_log` VALUES ('cbe9c76d-1b7a-466d-9207-520174b2a8bf', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:19:18', '1');
INSERT INTO `tb_operation_log` VALUES ('cc3cf7a1-20eb-44ae-9075-4bb25e7e6941', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:08:49', '1');
INSERT INTO `tb_operation_log` VALUES ('ccc32e43-f599-4d09-85f0-49401dddfbfd', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:39:25', '1');
INSERT INTO `tb_operation_log` VALUES ('ccd48282-bf97-4c11-a8df-c45a13c12ad8', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:58:59', '1');
INSERT INTO `tb_operation_log` VALUES ('ccf34617-7c75-42fc-9a12-653cc498cda1', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:39:37', '1');
INSERT INTO `tb_operation_log` VALUES ('ccfd7006-f1ab-4c8a-b6d5-639b109d8148', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 00:14:52', '1');
INSERT INTO `tb_operation_log` VALUES ('cd3d426e-9b80-4247-b406-61b7d3f85f60', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:03:47', '1');
INSERT INTO `tb_operation_log` VALUES ('cd579540-0a12-4642-8e2c-f655c62d7e45', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:13:34', '1');
INSERT INTO `tb_operation_log` VALUES ('cdf72829-ac14-4ea7-b35f-57ae1182d075', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:21:09', '1');
INSERT INTO `tb_operation_log` VALUES ('ce7a290f-0cbe-4902-a712-d63eaf0f9bc0', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 15:20:05', '1');
INSERT INTO `tb_operation_log` VALUES ('cee93945-eecf-4326-b9d7-171034077dc4', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 22:10:58', '1');
INSERT INTO `tb_operation_log` VALUES ('cf3eed3d-ee88-42da-8d16-664e8aab9448', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 07:20:34', '1');
INSERT INTO `tb_operation_log` VALUES ('cf8c38f3-f829-4879-abde-4ba52c73c1ac', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:06:53', '1');
INSERT INTO `tb_operation_log` VALUES ('cfb45542-28da-41f7-a0eb-2c02300a955a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:38:29', '1');
INSERT INTO `tb_operation_log` VALUES ('d01c37bd-df7d-43d6-bf20-9d99909ece76', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-14 15:22:34', '1');
INSERT INTO `tb_operation_log` VALUES ('d03a0aa5-a9d0-40ca-926f-5de16dd87471', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 11:30:48', '1');
INSERT INTO `tb_operation_log` VALUES ('d052faa3-740e-4e30-9f75-cc5d39d65219', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-01 15:20:22', '1');
INSERT INTO `tb_operation_log` VALUES ('d0a4d272-887e-4690-995b-0b13c95211d3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:41:07', '1');
INSERT INTO `tb_operation_log` VALUES ('d0a87c6a-5a6b-467f-b666-daeeb8adc1e2', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:11:35', '1');
INSERT INTO `tb_operation_log` VALUES ('d102ac68-caea-49dc-974e-97bca5c05c87', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 16:16:07', '1');
INSERT INTO `tb_operation_log` VALUES ('d13831f9-a60f-4623-af0c-9bd74e2f12c8', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:00:57', '1');
INSERT INTO `tb_operation_log` VALUES ('d1664ec3-7f9e-475f-80c3-7b12b2e65b24', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:36:56', '1');
INSERT INTO `tb_operation_log` VALUES ('d1eb36aa-35e6-4791-967f-bf81c621cea0', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 06:38:47', '1');
INSERT INTO `tb_operation_log` VALUES ('d21d311b-b70d-423c-beb9-84b588c3a319', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:46:46', '1');
INSERT INTO `tb_operation_log` VALUES ('d22ba076-6a82-4369-94f9-67752d905a4d', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:38:13', '1');
INSERT INTO `tb_operation_log` VALUES ('d22f4c76-7dac-4751-8237-5d17aa8f75b6', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:00:35', '1');
INSERT INTO `tb_operation_log` VALUES ('d2337d8a-5f97-4373-9ad0-9d74fe79e29f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:29:18', '1');
INSERT INTO `tb_operation_log` VALUES ('d26b012b-ebb7-485b-a907-ab1f8b20d26e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:19:32', '1');
INSERT INTO `tb_operation_log` VALUES ('d287b400-f15e-40b9-bca3-f3cd24536694', '001', 'admin', '116.18.228.114', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-03 18:54:58', '1');
INSERT INTO `tb_operation_log` VALUES ('d2883d26-a752-46cb-8a9e-1465e5f37a37', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:13:52', '1');
INSERT INTO `tb_operation_log` VALUES ('d2ab3c94-fe1b-4678-9eb3-018d91729006', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-16 23:10:54', '1');
INSERT INTO `tb_operation_log` VALUES ('d30507fd-42a4-484e-8100-b10cc66a70e8', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:07', '1');
INSERT INTO `tb_operation_log` VALUES ('d34acc50-7679-45bf-8407-dbba3713cc09', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 18:45:48', '1');
INSERT INTO `tb_operation_log` VALUES ('d35c0603-844f-4a8c-9950-84aef60a0d80', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:18:09', '1');
INSERT INTO `tb_operation_log` VALUES ('d37c9bb2-9e6c-4328-8e4a-43541f84f589', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:51:03', '1');
INSERT INTO `tb_operation_log` VALUES ('d3f315aa-6063-4155-af1e-7910e98b3f34', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:33:17', '1');
INSERT INTO `tb_operation_log` VALUES ('d3fb00e5-8e13-48cc-bb98-f5c649bd8f12', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:03:01', '1');
INSERT INTO `tb_operation_log` VALUES ('d4152f70-3545-492a-8314-2e6263207f53', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:46:25', '1');
INSERT INTO `tb_operation_log` VALUES ('d4330dab-0ef8-491c-90e0-e42ea8908beb', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:08:19', '1');
INSERT INTO `tb_operation_log` VALUES ('d470328b-cd8a-42c0-999a-df90dc5d9dc9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:11:10', '1');
INSERT INTO `tb_operation_log` VALUES ('d47e9f4e-8488-4d23-81ed-72ff45ac9460', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:32:09', '1');
INSERT INTO `tb_operation_log` VALUES ('d49dcfb0-16f0-4baa-85aa-af0f7c268a28', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 20:03:48', '1');
INSERT INTO `tb_operation_log` VALUES ('d4a1cc23-4ccc-49bc-a97f-b9991ac7178b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:16:39', '1');
INSERT INTO `tb_operation_log` VALUES ('d4a876f1-e2ec-459f-9678-f4a2ca9e09e8', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:30:30', '1');
INSERT INTO `tb_operation_log` VALUES ('d4db80e6-9ba9-4962-b9ed-ce9ff6922383', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:16:22', '1');
INSERT INTO `tb_operation_log` VALUES ('d4f95fb3-d408-4f89-b1e7-46c599d07991', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:39:54', '1');
INSERT INTO `tb_operation_log` VALUES ('d50fe37f-b861-41aa-a26f-b9ad73f37d1a', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-16 23:08:49', '1');
INSERT INTO `tb_operation_log` VALUES ('d580252f-57f8-4313-89b9-e7cd03b91119', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-12 08:27:14', '1');
INSERT INTO `tb_operation_log` VALUES ('d59484fd-3ddb-4b5f-98b7-a47b33d648e0', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 11:31:00', '1');
INSERT INTO `tb_operation_log` VALUES ('d5b3aee1-4320-4bed-b89b-bcba0b5b1b67', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-13 22:16:55', '1');
INSERT INTO `tb_operation_log` VALUES ('d628035a-201d-4623-ab01-b70f5b8f55d0', '001', 'admin', '116.18.228.114', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-03 18:58:32', '1');
INSERT INTO `tb_operation_log` VALUES ('d66c6aae-e17e-4a3d-a1a7-9f985ae51742', '001', 'admin', '116.18.228.114', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 18:36:33', '1');
INSERT INTO `tb_operation_log` VALUES ('d6794f31-6659-426c-9c9f-aa823fb6e3f0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:37:05', '1');
INSERT INTO `tb_operation_log` VALUES ('d6a77df8-9441-4cda-beee-5251fb5d95d6', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 16:16:08', '1');
INSERT INTO `tb_operation_log` VALUES ('d6acbc26-b2a9-4bfa-a86a-075a23beb19b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-13 21:11:40', '1');
INSERT INTO `tb_operation_log` VALUES ('d6c398c8-5e9d-46e6-819b-c715098b8b47', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:09:59', '1');
INSERT INTO `tb_operation_log` VALUES ('d6d9daaf-106e-465f-9231-db27adb94576', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:58:32', '1');
INSERT INTO `tb_operation_log` VALUES ('d70b93bb-d3d4-4950-8aea-d9e237ea835a', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:50:08', '1');
INSERT INTO `tb_operation_log` VALUES ('d73ee505-5374-46d7-97b2-3ac9da1629bf', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:15:01', '1');
INSERT INTO `tb_operation_log` VALUES ('d73f623b-5d23-497a-abe4-3bc253159f12', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-01 15:29:54', '1');
INSERT INTO `tb_operation_log` VALUES ('d7471651-fb3f-403a-b70d-11dcfc455d07', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:15:32', '1');
INSERT INTO `tb_operation_log` VALUES ('d7a3706a-97c9-4813-868d-a0aff05b8fd5', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '编辑扩展配置', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.update()', '2017-03-16 23:23:27', '1');
INSERT INTO `tb_operation_log` VALUES ('d7b7f325-7c23-4816-a1a8-375a1114b3d7', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:35', '1');
INSERT INTO `tb_operation_log` VALUES ('d7d17e55-738b-4b8c-9d81-0da680bbe830', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:48:57', '1');
INSERT INTO `tb_operation_log` VALUES ('d7f4ccf4-8ad1-4c9f-9e95-511be1060026', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 20:46:52', '1');
INSERT INTO `tb_operation_log` VALUES ('d82c2ba1-8ef7-4857-858a-9c490e991d78', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-16 23:16:44', '1');
INSERT INTO `tb_operation_log` VALUES ('d8427fa6-17e2-4c97-967c-7022f051749b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-13 21:30:10', '1');
INSERT INTO `tb_operation_log` VALUES ('d852c67b-f47a-4762-ab01-6307fecec321', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:44:41', '1');
INSERT INTO `tb_operation_log` VALUES ('d930a4c3-1817-402c-81f0-ebf550b15e2e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-04 11:26:35', '1');
INSERT INTO `tb_operation_log` VALUES ('d9584347-d1a7-453a-ab30-e4a0ccf1cbe3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:30:04', '1');
INSERT INTO `tb_operation_log` VALUES ('d98d682d-6915-4a85-ac4e-114d37dc49c9', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:24:47', '1');
INSERT INTO `tb_operation_log` VALUES ('d9a989fc-8bc4-4cb3-95d4-b753a1161ca3', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 08:10:01', '1');
INSERT INTO `tb_operation_log` VALUES ('d9b1e142-bcd0-4e3c-9397-60f235f88c5d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:09:25', '1');
INSERT INTO `tb_operation_log` VALUES ('d9da3fc7-ef14-4d04-9bcc-e4bcdaa2a43d', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:29:48', '1');
INSERT INTO `tb_operation_log` VALUES ('d9db847b-9505-43d9-9b3f-0c0b9ed2e6c4', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:14:55', '1');
INSERT INTO `tb_operation_log` VALUES ('da29517c-227e-412c-bf02-bd00283af796', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:00:08', '1');
INSERT INTO `tb_operation_log` VALUES ('da2b9f0d-7a0a-49ef-a98f-3d6e2fa29714', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 07:20:36', '1');
INSERT INTO `tb_operation_log` VALUES ('da67ce5e-ddee-4a2b-8a63-a1710c968f98', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:34:20', '1');
INSERT INTO `tb_operation_log` VALUES ('da83f5e9-5636-484a-8f84-d15040b3320b', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:15:04', '1');
INSERT INTO `tb_operation_log` VALUES ('daa9b074-7a3b-4dfe-8053-f666935160b7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-03-16 23:09:23', '1');
INSERT INTO `tb_operation_log` VALUES ('db0ad622-3d69-4c4d-a1bd-9598bea4539a', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:29:52', '1');
INSERT INTO `tb_operation_log` VALUES ('db73fa10-f7c4-4cb0-972c-56c39daa5785', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:41:55', '1');
INSERT INTO `tb_operation_log` VALUES ('dba3bea8-6613-42c7-9e15-3b70594cd0ff', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:07:41', '1');
INSERT INTO `tb_operation_log` VALUES ('dba6fcf2-3ce4-49d4-95cd-47a96ca8c42a', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:23:01', '1');
INSERT INTO `tb_operation_log` VALUES ('dbd5621c-1c25-4db0-9280-25394937774a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:46:23', '1');
INSERT INTO `tb_operation_log` VALUES ('dc2aaea0-1216-49e7-982f-b999a318a835', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-03-16 23:08:48', '1');
INSERT INTO `tb_operation_log` VALUES ('dc2e989f-c579-4bfc-b86d-726cad333088', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:10:59', '1');
INSERT INTO `tb_operation_log` VALUES ('dc80a61e-fef0-461b-bdc8-dc812b768041', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 14:44:48', '1');
INSERT INTO `tb_operation_log` VALUES ('dc905607-3e84-4a44-803c-9d367a4265f4', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 13:52:36', '1');
INSERT INTO `tb_operation_log` VALUES ('dc9962b2-d479-41b2-b9ac-237f41fdcc34', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:23:15', '1');
INSERT INTO `tb_operation_log` VALUES ('dcd6789b-92e5-45d8-ab24-aaa64a94ee80', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:21:19', '1');
INSERT INTO `tb_operation_log` VALUES ('dd2b9866-3645-4fdc-86bf-0a3aab6cb49f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:22', '1');
INSERT INTO `tb_operation_log` VALUES ('dd2cb0b8-e733-433f-8bd3-620828cbd02d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 16:14:38', '1');
INSERT INTO `tb_operation_log` VALUES ('dd71b878-d3fe-4dff-ba35-e3892c9c98be', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:24:21', '1');
INSERT INTO `tb_operation_log` VALUES ('dd854da8-e417-47ea-aef8-aed83a7d0eee', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 19:55:23', '1');
INSERT INTO `tb_operation_log` VALUES ('dd8855d7-32ea-4704-abbe-6e742db10fe5', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-01 15:23:33', '1');
INSERT INTO `tb_operation_log` VALUES ('ddab8bb5-3e70-42ea-b139-4fdbedfafb00', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 14:13:08', '1');
INSERT INTO `tb_operation_log` VALUES ('dddd47b2-2bc5-4c6a-bd4b-b4d8167c445a', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 06:55:33', '1');
INSERT INTO `tb_operation_log` VALUES ('de0663e6-19f8-4ab1-957f-6a8f280e0641', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:34:28', '1');
INSERT INTO `tb_operation_log` VALUES ('de217464-e3c0-4334-8b19-73f3d06ea436', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:33', '1');
INSERT INTO `tb_operation_log` VALUES ('de7fee01-9678-47d7-b3de-3a4ad022e856', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 06:50:15', '1');
INSERT INTO `tb_operation_log` VALUES ('deca58aa-5dac-4f4d-b7b3-b8dc3824cc14', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:14:33', '1');
INSERT INTO `tb_operation_log` VALUES ('dee58fa8-3dc9-4e78-8a11-7ccedc7de81d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:08:41', '1');
INSERT INTO `tb_operation_log` VALUES ('def8fb3e-40ed-46f0-81eb-ed703ac2759e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:48:41', '1');
INSERT INTO `tb_operation_log` VALUES ('df20bce8-7eb7-4941-8b0e-3b58f89d0b9f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:07:22', '1');
INSERT INTO `tb_operation_log` VALUES ('df537744-f5bd-45bd-8ce8-53f3236621f7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:44:16', '1');
INSERT INTO `tb_operation_log` VALUES ('e094b28a-f620-4df5-be3c-8be03a646005', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:52:52', '1');
INSERT INTO `tb_operation_log` VALUES ('e0a93c58-ce0a-4e64-9568-0f9dfc280d85', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:33:20', '1');
INSERT INTO `tb_operation_log` VALUES ('e0b53d4e-429f-48a0-bcc7-5aaf7b989b10', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-16 23:11:08', '1');
INSERT INTO `tb_operation_log` VALUES ('e0cb748d-2aa7-41ff-8c96-9b71a21791de', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:30:48', '1');
INSERT INTO `tb_operation_log` VALUES ('e0d4c977-0292-42f8-bae2-1c61802b8c40', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:40:58', '1');
INSERT INTO `tb_operation_log` VALUES ('e1091c30-3bbf-4e39-a2bf-d8d894f8f6fd', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '为角色授予权限', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.grantPermissionToRole()', '2017-04-03 13:50:16', '1');
INSERT INTO `tb_operation_log` VALUES ('e12e92ee-a772-4870-857b-eb0908bc97f5', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:50:11', '1');
INSERT INTO `tb_operation_log` VALUES ('e12f0dcd-530b-41ad-9254-6f1b8c223312', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:09:30', '1');
INSERT INTO `tb_operation_log` VALUES ('e1656c3d-d87f-4fcd-9f7f-a8567b5c791b', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-21 22:45:44', '1');
INSERT INTO `tb_operation_log` VALUES ('e198bd35-ed88-4481-b0b0-fe3bbbbb7eb0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-15 20:24:10', '1');
INSERT INTO `tb_operation_log` VALUES ('e1ac7b6d-7f25-4285-879f-8c698d59d93e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:39:46', '1');
INSERT INTO `tb_operation_log` VALUES ('e1bd46a5-eb56-4556-aa46-48743274c458', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:39:29', '1');
INSERT INTO `tb_operation_log` VALUES ('e1e1bf26-9c0e-4883-b8c3-041f71a013d7', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:27:45', '1');
INSERT INTO `tb_operation_log` VALUES ('e1eadb13-71ac-493d-a53a-59527758ce46', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-13 20:38:00', '1');
INSERT INTO `tb_operation_log` VALUES ('e25a6286-ded7-460b-b9e0-542d730da952', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 15:29:51', '1');
INSERT INTO `tb_operation_log` VALUES ('e27a4c17-72a2-4b91-a87e-7a7d5a5c4e47', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 18:41:28', '1');
INSERT INTO `tb_operation_log` VALUES ('e29c4166-734e-48d5-925e-3fcd2ee3b89f', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-16 23:39:38', '1');
INSERT INTO `tb_operation_log` VALUES ('e2f94541-9279-4067-9914-5c5a8c4be20e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:09:32', '1');
INSERT INTO `tb_operation_log` VALUES ('e2ff5597-a801-4c44-9d9b-2358b4e07135', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '新增团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.add()', '2017-04-04 11:28:27', '1');
INSERT INTO `tb_operation_log` VALUES ('e300b92f-a3c8-4d9b-aca6-2c879f7070ed', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:19:55', '1');
INSERT INTO `tb_operation_log` VALUES ('e37a2d43-5470-46d5-a5e1-54ae8f6e4032', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:46:00', '1');
INSERT INTO `tb_operation_log` VALUES ('e3b4c770-4863-47a7-b67d-88592b8db923', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:15:19', '1');
INSERT INTO `tb_operation_log` VALUES ('e46c7874-0ae1-478d-b597-d014609cf0d2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:26:07', '1');
INSERT INTO `tb_operation_log` VALUES ('e47d77cc-03b5-4ae0-b002-3005e28434df', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:37:07', '1');
INSERT INTO `tb_operation_log` VALUES ('e494d825-ae57-4a37-9b55-0fc2924f9337', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 18:42:43', '1');
INSERT INTO `tb_operation_log` VALUES ('e5154c44-8441-49dd-80bd-0de62858d140', '001', 'admin', '116.18.228.114', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-04-03 18:38:14', '1');
INSERT INTO `tb_operation_log` VALUES ('e5231968-d935-4d18-9610-6e7c60fe7677', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:09:25', '1');
INSERT INTO `tb_operation_log` VALUES ('e526ed3b-cd9b-42fb-89c4-dbd45d7ea66f', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:25:16', '1');
INSERT INTO `tb_operation_log` VALUES ('e52cf6ee-14c3-43b6-973a-6d7a65926da8', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:40:19', '1');
INSERT INTO `tb_operation_log` VALUES ('e55d8116-6051-45eb-98ea-681792ea25a6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:47:04', '1');
INSERT INTO `tb_operation_log` VALUES ('e57ce5e8-e760-48b7-a0c1-75134c9ef8a3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:33:18', '1');
INSERT INTO `tb_operation_log` VALUES ('e595c4c6-3f25-41a5-a435-3e323d1b8d06', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:30:57', '1');
INSERT INTO `tb_operation_log` VALUES ('e59ee965-36d4-46eb-a3e4-f0f92007c106', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:12:52', '1');
INSERT INTO `tb_operation_log` VALUES ('e5a777af-40ea-4934-b442-eebe1944a9ee', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 00:19:11', '1');
INSERT INTO `tb_operation_log` VALUES ('e5c36958-6b2f-480d-a41f-f695ef1c343a', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:06:44', '1');
INSERT INTO `tb_operation_log` VALUES ('e5f933bc-e368-479e-a8be-45fbc8ea57d3', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:10:23', '1');
INSERT INTO `tb_operation_log` VALUES ('e613c9ae-1ed5-480b-9579-1535f892f484', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 13:27:15', '1');
INSERT INTO `tb_operation_log` VALUES ('e624c95c-d536-455d-9f5e-71d554d79e52', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:36:11', '1');
INSERT INTO `tb_operation_log` VALUES ('e641bdd6-d8af-434a-be46-544274268ffc', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:08:56', '1');
INSERT INTO `tb_operation_log` VALUES ('e6701558-40d8-4249-a082-0400f6509fa2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:16:35', '1');
INSERT INTO `tb_operation_log` VALUES ('e679f62b-0151-4eb8-9683-9e19a02b4121', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:30:00', '1');
INSERT INTO `tb_operation_log` VALUES ('e6ae8bec-5e97-40e9-a7d2-c9cda29c6079', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:36', '1');
INSERT INTO `tb_operation_log` VALUES ('e6cfc616-3d60-4089-8304-2b8cc1c004f0', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:15:10', '1');
INSERT INTO `tb_operation_log` VALUES ('e6ff9139-4a82-42fc-8483-038061d3aa25', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:08:44', '1');
INSERT INTO `tb_operation_log` VALUES ('e76e7819-4fff-40de-aaab-d73000b38944', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:39:15', '1');
INSERT INTO `tb_operation_log` VALUES ('e78856dd-a517-4de4-a5fa-7f88dd54c1c5', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:47:26', '1');
INSERT INTO `tb_operation_log` VALUES ('e7d42140-7cf4-4819-9619-9b204ad6bd6f', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:42:00', '1');
INSERT INTO `tb_operation_log` VALUES ('e7df9abd-e180-4bfc-87bd-8ada385b98b2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 13:43:42', '1');
INSERT INTO `tb_operation_log` VALUES ('e8027a33-7836-45c5-9f4c-50d6691ecefc', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-11 19:09:32', '1');
INSERT INTO `tb_operation_log` VALUES ('e8048dcb-9671-437c-b4af-2dc79cbe13b1', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:15:03', '1');
INSERT INTO `tb_operation_log` VALUES ('e8572895-a5c9-4798-a6ec-bcefac07a679', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:20:29', '1');
INSERT INTO `tb_operation_log` VALUES ('e85b518e-ff5d-4f40-90f5-cbb461e1300a', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:53:49', '1');
INSERT INTO `tb_operation_log` VALUES ('e86e514c-8a07-4cf7-ad33-58fb939b8c3f', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-12 07:12:30', '1');
INSERT INTO `tb_operation_log` VALUES ('e88dca3c-0bf7-4657-8002-89b179a9a55b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 06:54:30', '1');
INSERT INTO `tb_operation_log` VALUES ('e8d48316-92ed-4531-bc98-93a18eebdb2c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 13:23:06', '1');
INSERT INTO `tb_operation_log` VALUES ('e964aa8b-0a85-4e6a-b3b0-93bfc2e4292d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:51:41', '1');
INSERT INTO `tb_operation_log` VALUES ('e98a7a26-525d-4573-9dc5-45e52fe5a7de', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-04-03 17:54:53', '1');
INSERT INTO `tb_operation_log` VALUES ('e9dbbd42-7c7f-4a13-90e5-0ad27646ae2c', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:19:47', '1');
INSERT INTO `tb_operation_log` VALUES ('e9df1839-ace0-44cf-b078-9e80c16b68a3', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '删除团员管理', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.delete()', '2017-04-04 11:26:56', '1');
INSERT INTO `tb_operation_log` VALUES ('e9e5d7e8-5ab7-4b56-9629-1b9096b0d60a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:26:28', '1');
INSERT INTO `tb_operation_log` VALUES ('ea290dde-9bee-44ba-a3c2-c69aa6862f1b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 13:45:39', '1');
INSERT INTO `tb_operation_log` VALUES ('ea3b9b8f-c2f5-4cbe-9e58-2583dedd8f72', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:15:47', '1');
INSERT INTO `tb_operation_log` VALUES ('eaba216d-72b8-4407-bd94-879c38e10c2b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 00:51:05', '1');
INSERT INTO `tb_operation_log` VALUES ('eaba6dba-a77e-4df4-a329-5bedfe716c03', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '删除菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.delete()', '2017-03-13 21:16:13', '1');
INSERT INTO `tb_operation_log` VALUES ('eac5ad37-b544-43c4-8585-8950a7d0f5b2', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-04-03 13:44:44', '1');
INSERT INTO `tb_operation_log` VALUES ('ead541b7-6be7-430f-a1f3-1eed47eca99b', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 22:34:40', '1');
INSERT INTO `tb_operation_log` VALUES ('ead92dc5-049f-4906-bbe6-fffdc4512588', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:37:20', '1');
INSERT INTO `tb_operation_log` VALUES ('eae5f0c6-f7d4-48f4-8f4d-59ec0f6ecd8e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 08:11:36', '1');
INSERT INTO `tb_operation_log` VALUES ('eaea7d5a-38ee-436a-9fc5-d9094e3634fb', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:28:06', '1');
INSERT INTO `tb_operation_log` VALUES ('eb0c348f-722f-4245-baa2-4ffa55deba1b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 12:36:47', '1');
INSERT INTO `tb_operation_log` VALUES ('eb4ed818-295d-468d-a366-65efc1315c1f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 19:55:24', '1');
INSERT INTO `tb_operation_log` VALUES ('eb4f6430-b35b-4a16-a012-77a50af7e365', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:14:44', '1');
INSERT INTO `tb_operation_log` VALUES ('eb796bca-86d7-4b55-8af6-1582a7d5aec3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 11:31:56', '1');
INSERT INTO `tb_operation_log` VALUES ('ebe277d5-0bac-4f50-a651-1709cde6f778', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 00:14:49', '1');
INSERT INTO `tb_operation_log` VALUES ('ec058dae-857a-427f-b2eb-eb32889d462a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 17:47:00', '1');
INSERT INTO `tb_operation_log` VALUES ('ec9ee089-88a8-4597-8c7c-24eddfc9ba7e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:37:21', '1');
INSERT INTO `tb_operation_log` VALUES ('ecae472c-05b4-47f7-84d2-7241a8edd161', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:00:19', '1');
INSERT INTO `tb_operation_log` VALUES ('ecdb8c00-411a-4ad0-9148-b1390fe4052e', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '禁用／启用用户', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.updateUserStatus()', '2017-03-13 20:38:02', '1');
INSERT INTO `tb_operation_log` VALUES ('ecfcd176-5e0a-4e53-9814-38ee000ab591', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 12:27:47', '1');
INSERT INTO `tb_operation_log` VALUES ('ed0d1670-73a4-47a1-b4e4-020d5003e686', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-12 07:34:24', '1');
INSERT INTO `tb_operation_log` VALUES ('ed2bf366-a6d2-4464-ad92-ec0265a1cd64', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-16 23:31:49', '1');
INSERT INTO `tb_operation_log` VALUES ('ed3af6ac-02d9-47a2-b479-254116a8c56c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:12:50', '1');
INSERT INTO `tb_operation_log` VALUES ('ed4e6482-4665-4fb9-aaca-6c10ff3916b2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:19:36', '1');
INSERT INTO `tb_operation_log` VALUES ('ed6bc652-ac37-45aa-8c70-c9f8b411f5f0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:45:39', '1');
INSERT INTO `tb_operation_log` VALUES ('ed75f5fc-ced9-44b1-9b67-47485bcbee8b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:44:02', '1');
INSERT INTO `tb_operation_log` VALUES ('ed8225b0-4415-49e6-9ef0-da2ae9013372', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-13 20:46:46', '1');
INSERT INTO `tb_operation_log` VALUES ('ee1f5eef-65e4-489e-9a77-f7138ba13c94', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 13:52:52', '1');
INSERT INTO `tb_operation_log` VALUES ('ee6e6f6a-0a18-4030-92aa-8cae101faf85', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:47:17', '1');
INSERT INTO `tb_operation_log` VALUES ('ee6f7082-3af1-4adc-9117-aa53f12cba7a', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:21:38', '1');
INSERT INTO `tb_operation_log` VALUES ('ee8cd706-686e-4082-9289-0e65ed61b5b1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:28:03', '1');
INSERT INTO `tb_operation_log` VALUES ('ee92734b-b665-4d61-8588-0fd6bd265534', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:20:53', '1');
INSERT INTO `tb_operation_log` VALUES ('ee9e37e2-7c40-4377-a20a-8bd764f16698', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-01 15:20:19', '1');
INSERT INTO `tb_operation_log` VALUES ('ef0a0be5-ef52-4e79-87df-30c849ab4480', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:25:21', '1');
INSERT INTO `tb_operation_log` VALUES ('ef320066-a30e-4e4e-9fe0-7d1ce7b04e96', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:29:29', '1');
INSERT INTO `tb_operation_log` VALUES ('ef9742a5-5633-4c9d-80d3-113b70ada033', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:12:54', '1');
INSERT INTO `tb_operation_log` VALUES ('efb66092-3e42-439f-88e7-f9ce05d9a2eb', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:17:24', '1');
INSERT INTO `tb_operation_log` VALUES ('f0383f65-eee8-498c-93ba-ad7ce2ba307d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:04:00', '1');
INSERT INTO `tb_operation_log` VALUES ('f055385f-545b-4c82-b095-97716cec9222', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:54:58', '1');
INSERT INTO `tb_operation_log` VALUES ('f069e78f-db18-4a7a-8c42-d308e4ce034e', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 23:25:48', '1');
INSERT INTO `tb_operation_log` VALUES ('f080dc07-d052-4859-ba07-091420cca60d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:37:48', '1');
INSERT INTO `tb_operation_log` VALUES ('f0bd99af-043c-413d-a0d7-f18b709a01d0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 19:30:45', '1');
INSERT INTO `tb_operation_log` VALUES ('f0debbe2-1591-48ca-b4d5-c3120ecf4d30', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:34:20', '1');
INSERT INTO `tb_operation_log` VALUES ('f0df26d2-cebf-41c7-b8b3-34e48590fe73', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:46:35', '1');
INSERT INTO `tb_operation_log` VALUES ('f10566b0-d550-4b2d-b93d-81dd0166b8a6', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:10:52', '1');
INSERT INTO `tb_operation_log` VALUES ('f17ba8bf-07fa-4582-956c-3f2edd07816e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:28:00', '1');
INSERT INTO `tb_operation_log` VALUES ('f1c635de-176a-4f59-9745-f39275bf82e6', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 09:01:04', '1');
INSERT INTO `tb_operation_log` VALUES ('f1eb43d8-2808-4815-9efa-6c9983b40007', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:03:40', '1');
INSERT INTO `tb_operation_log` VALUES ('f20afa42-e525-4920-9ccf-c7c47c43c9b4', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 21:24:49', '1');
INSERT INTO `tb_operation_log` VALUES ('f20f08b7-2fb1-4687-bebd-ca55bb08dcdd', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-01 15:23:32', '1');
INSERT INTO `tb_operation_log` VALUES ('f260721d-61d2-48e5-af91-4876e13b213c', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:31:31', '1');
INSERT INTO `tb_operation_log` VALUES ('f2a16ec2-2812-4c5b-b5df-189b67ecf45b', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 19:11:18', '1');
INSERT INTO `tb_operation_log` VALUES ('f2a28cfa-c7cb-4e58-a1a4-279b0173b70c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 19:12:08', '1');
INSERT INTO `tb_operation_log` VALUES ('f2b376ef-9854-4efe-940c-1f21594a3437', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-16 23:09:20', '1');
INSERT INTO `tb_operation_log` VALUES ('f2b61301-664f-4400-8588-6b7f5cebed14', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 20:04:34', '1');
INSERT INTO `tb_operation_log` VALUES ('f2c7ca91-1b78-4735-8fa6-2a938db3a9b2', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-11 13:52:54', '1');
INSERT INTO `tb_operation_log` VALUES ('f2e57f43-0db7-4e9a-8031-3bd9f587d34d', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:52:30', '1');
INSERT INTO `tb_operation_log` VALUES ('f2fe4ac6-7de8-4308-93f2-cf8f2c2fc5f7', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.getRoleList()', '2017-03-14 17:32:33', '1');
INSERT INTO `tb_operation_log` VALUES ('f2feeab3-42cf-4dc0-8916-1b867e43d39c', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 07:31:48', '1');
INSERT INTO `tb_operation_log` VALUES ('f32e1c35-76c8-4373-b5d9-a0f23719a949', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 21:18:38', '1');
INSERT INTO `tb_operation_log` VALUES ('f37aef40-3214-4864-8b6d-a50bd3f4154e', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:25:54', '1');
INSERT INTO `tb_operation_log` VALUES ('f38a5a48-578d-4fcb-b58c-70f605c61924', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:46:38', '1');
INSERT INTO `tb_operation_log` VALUES ('f395f881-e6d3-43d7-9718-a87d2927d017', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 21:28:47', '1');
INSERT INTO `tb_operation_log` VALUES ('f3a3c30f-b425-4df9-b6de-aa4e38d1243f', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:11:02', '1');
INSERT INTO `tb_operation_log` VALUES ('f3a3f68f-7e4d-46e8-bb11-b31ed1986150', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-12 06:01:56', '1');
INSERT INTO `tb_operation_log` VALUES ('f3b7d8c9-f619-43d7-bf1d-a0d1a3249bc1', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:46:41', '1');
INSERT INTO `tb_operation_log` VALUES ('f403b806-b0a7-4703-a7d8-46058f72db2f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:47:36', '1');
INSERT INTO `tb_operation_log` VALUES ('f40e6dbd-8610-4d76-a285-7ec09dd107e7', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 18:52:42', '1');
INSERT INTO `tb_operation_log` VALUES ('f41206ca-fc5e-4d98-a96a-47655149f18a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:29:22', '1');
INSERT INTO `tb_operation_log` VALUES ('f41e7253-5f3b-43b3-8745-4b88bf79267c', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-13 21:40:19', '1');
INSERT INTO `tb_operation_log` VALUES ('f4286f04-4618-45f0-9a5d-702f0849f27c', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 20:09:27', '1');
INSERT INTO `tb_operation_log` VALUES ('f45a556b-424e-4924-ad27-75329eb73bb9', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 11:23:16', '1');
INSERT INTO `tb_operation_log` VALUES ('f4ee5fae-efea-4a82-8871-af3801045827', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 09:57:28', '1');
INSERT INTO `tb_operation_log` VALUES ('f519e854-be03-42f0-95bd-55e3d7732dd5', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:13:23', '1');
INSERT INTO `tb_operation_log` VALUES ('f530fe87-8cd7-4882-a4ec-9c0d462b3b1b', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:19:25', '1');
INSERT INTO `tb_operation_log` VALUES ('f5d17556-18ab-4092-ad50-a8deb4a5b5b0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 09:08:05', '1');
INSERT INTO `tb_operation_log` VALUES ('f5f39f0d-6bd9-4318-ab42-4f55cf99a8d7', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-16 23:29:27', '1');
INSERT INTO `tb_operation_log` VALUES ('f5f9dfd2-1f9f-463c-acae-d011e4575648', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-13 21:14:11', '1');
INSERT INTO `tb_operation_log` VALUES ('f64c28c1-6d06-4b59-9ca5-bbf964e456e3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:13:40', '1');
INSERT INTO `tb_operation_log` VALUES ('f68ba1e2-19c3-48a5-b287-fd9e93fe1d9d', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-14 17:40:42', '1');
INSERT INTO `tb_operation_log` VALUES ('f6c1cdd0-621e-465b-9d86-5e03a3703385', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:09:51', '1');
INSERT INTO `tb_operation_log` VALUES ('f6e7741e-b6c9-440e-aa35-36b967857293', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 12:57:40', '1');
INSERT INTO `tb_operation_log` VALUES ('f78abe48-55d9-4c31-92bb-4131705f4df1', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-14 17:32:18', '1');
INSERT INTO `tb_operation_log` VALUES ('f78d128b-0841-4d33-badf-c7f20755319b', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:40:05', '1');
INSERT INTO `tb_operation_log` VALUES ('f798746a-a1de-4083-b8dd-3686e81ea64b', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:23:38', '1');
INSERT INTO `tb_operation_log` VALUES ('f82cbd77-eaaa-4b04-a7b5-156750c9ae6d', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-03-13 21:37:23', '1');
INSERT INTO `tb_operation_log` VALUES ('f88a5ac9-095f-48f9-bff3-fc1ae723628d', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-02-11 14:45:32', '1');
INSERT INTO `tb_operation_log` VALUES ('f8a66e6f-1a1f-4fa7-b958-2444247318cf', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:22:29', '1');
INSERT INTO `tb_operation_log` VALUES ('f8d15124-ca85-45ae-9866-9d00600796aa', '001', 'admin', '116.18.228.114', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 18:36:31', '1');
INSERT INTO `tb_operation_log` VALUES ('f8db08a2-0af8-4351-88c5-59128aae342e', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-21 23:13:43', '1');
INSERT INTO `tb_operation_log` VALUES ('f94bbe3c-68a9-45b1-82e3-dd71ff20871b', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:12:54', '1');
INSERT INTO `tb_operation_log` VALUES ('f961095d-b0bb-4631-b791-a076e204d96f', '001', 'admin', '116.18.228.114', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 19:04:09', '1');
INSERT INTO `tb_operation_log` VALUES ('f9b1816c-39ed-466e-99d0-d65e55e8de93', '001', 'admin', '0:0:0:0:0:0:0:1', '扩展配置模块', '扩展配置列表', 'cn.com.gzqinghui.sysextmgr.extconfig.ui.SysConfigController.list()', '2017-03-16 23:24:26', '1');
INSERT INTO `tb_operation_log` VALUES ('f9c17a10-294c-44ba-a55c-bed3316f85ea', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:58:46', '1');
INSERT INTO `tb_operation_log` VALUES ('f9c3ebf8-2253-4d78-b713-fd37fe55d418', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 13:40:33', '1');
INSERT INTO `tb_operation_log` VALUES ('f9cbc140-dc61-4a1f-91d0-37aa8df5edd4', '001', 'admin', '0:0:0:0:0:0:0:1', '日志模块', '日志列表', 'cn.com.gzqinghui.sysmgr.operationlog.ui.OperaLogController.list()', '2017-02-11 14:45:28', '1');
INSERT INTO `tb_operation_log` VALUES ('f9ef2061-644c-46de-9899-f592ffbac2b0', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-13 20:02:28', '1');
INSERT INTO `tb_operation_log` VALUES ('f9f3d544-750a-49e5-9825-73724602a84c', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-02-12 08:16:57', '1');
INSERT INTO `tb_operation_log` VALUES ('fa220972-1ba9-4ed5-83f2-a92cf03b957f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-13 22:01:51', '1');
INSERT INTO `tb_operation_log` VALUES ('fa56d745-6515-461a-a50c-68ba3de2f74c', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 05:39:07', '1');
INSERT INTO `tb_operation_log` VALUES ('fa9fc310-1030-426a-9405-cf50d709c9b6', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 06:50:14', '1');
INSERT INTO `tb_operation_log` VALUES ('faea46e7-4064-4d66-bb1e-5486de585210', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 06:57:15', '1');
INSERT INTO `tb_operation_log` VALUES ('faf09db1-e93d-4443-ae09-5a7d515bc1bb', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-03 17:39:21', '1');
INSERT INTO `tb_operation_log` VALUES ('faff39d0-1008-4b8f-85f1-559bedf01228', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-12 07:30:55', '1');
INSERT INTO `tb_operation_log` VALUES ('fb00997f-5f1b-459f-809a-240ac32c428a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 01:21:42', '1');
INSERT INTO `tb_operation_log` VALUES ('fb157871-ff2e-45c7-8ead-ae4252e661bd', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 12:51:04', '1');
INSERT INTO `tb_operation_log` VALUES ('fbaedd08-f417-488f-92b3-dc4851d3abb3', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:54:11', '1');
INSERT INTO `tb_operation_log` VALUES ('fbbe26ca-0443-4c6a-95fa-3928ee530445', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 11:37:56', '1');
INSERT INTO `tb_operation_log` VALUES ('fbc13344-a53b-4adb-846c-55ec2a5f4f44', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-02-21 22:22:44', '1');
INSERT INTO `tb_operation_log` VALUES ('fbde245a-45f3-458e-8946-43814a334a93', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-11 16:17:06', '1');
INSERT INTO `tb_operation_log` VALUES ('fc57b727-6f5c-4c3b-82ec-ca945123c7a2', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-04-03 13:48:44', '1');
INSERT INTO `tb_operation_log` VALUES ('fc6ae692-bc96-40e2-912f-efe93e224292', '001', 'admin', '116.18.228.114', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-04-03 21:26:38', '1');
INSERT INTO `tb_operation_log` VALUES ('fc7d8268-ddc7-455d-810e-625ba9dc5175', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-21 23:03:30', '1');
INSERT INTO `tb_operation_log` VALUES ('fc8b29fe-4d66-459a-a8f6-da1f6fa82d62', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 10:37:33', '1');
INSERT INTO `tb_operation_log` VALUES ('fcb9a1b7-dca9-4e76-9b3b-e77eeb4d4943', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '新增角色', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.RoleController.add()', '2017-03-16 23:28:20', '1');
INSERT INTO `tb_operation_log` VALUES ('fcec2138-358b-4451-b7e5-0afdd1e5d0c0', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:46:17', '1');
INSERT INTO `tb_operation_log` VALUES ('fd10da87-990b-467b-900a-bf07fcb6ca33', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '编辑菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.update()', '2017-02-21 23:21:40', '1');
INSERT INTO `tb_operation_log` VALUES ('fd19bd99-04ac-48c6-bf72-1ff7b6da677f', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 07:21:54', '1');
INSERT INTO `tb_operation_log` VALUES ('fd2f3337-2fb9-4e68-81c8-fa2f6efb7b59', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '新增菜单', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.list()', '2017-02-12 07:33:58', '1');
INSERT INTO `tb_operation_log` VALUES ('fd74d647-7006-44b1-8340-68138047b63e', '001', 'admin', '0:0:0:0:0:0:0:1', '代码生成器模块', '代码生成器列表', 'cn.com.gzqinghui.sysmgr.generator.ui.SysGeneratorController.list()', '2017-03-16 23:39:43', '1');
INSERT INTO `tb_operation_log` VALUES ('fd7b4422-e822-4775-8cf7-fa576dbabc86', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-03-16 23:40:34', '1');
INSERT INTO `tb_operation_log` VALUES ('fd982de6-ef60-4408-b603-b412c1531ce9', '001', 'admin', '116.18.228.114', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-04-03 21:26:38', '1');
INSERT INTO `tb_operation_log` VALUES ('fdc24d81-1f9b-48e5-bfd7-bc9423a13e9a', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-12 06:51:57', '1');
INSERT INTO `tb_operation_log` VALUES ('fde4e194-a267-416b-9c8f-e68c11c098b2', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 21:33:03', '1');
INSERT INTO `tb_operation_log` VALUES ('fde7b3c1-fd48-4fce-a020-eceec82709f9', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-03 23:25:16', '1');
INSERT INTO `tb_operation_log` VALUES ('fdf3269e-da1e-430c-b14e-91630a400340', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-02-21 23:13:48', '1');
INSERT INTO `tb_operation_log` VALUES ('fe1ceb22-1088-4226-969c-dabe85f70d05', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-14 17:30:33', '1');
INSERT INTO `tb_operation_log` VALUES ('fe251e0a-136e-4e4b-b085-a559281fa29e', '001', 'admin', '0:0:0:0:0:0:0:1', '角色模块', '获取角色列表', 'cn.com.gzqinghui.sysmgr.sysmgr.ui.SysMgrController.getRoleList()', '2017-03-16 23:39:58', '1');
INSERT INTO `tb_operation_log` VALUES ('fe2994ac-13e2-47c2-8dc1-def6b2aa8cce', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-02-11 16:24:14', '1');
INSERT INTO `tb_operation_log` VALUES ('fe572e26-8a7b-4edf-b65d-095a6b8a6702', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-01 16:12:51', '1');
INSERT INTO `tb_operation_log` VALUES ('fe669de8-8b67-4c96-8f3a-3eeb9ff05dfb', '001', 'admin', '0:0:0:0:0:0:0:1', '团员管理模块', '团员管理列表', 'cn.com.gzqinghui.acitivtymgr.member.ui.MemberController.list()', '2017-04-04 01:12:14', '1');
INSERT INTO `tb_operation_log` VALUES ('fe7d5262-c158-4669-aabb-c6e00a709ec1', '001', 'admin', '0:0:0:0:0:0:0:1', '用户管理模块', '获取代理商列表', 'cn.com.gzqinghui.sysmgr.usermanage.ui.UserManageController.ajaxSearch()', '2017-03-13 20:38:06', '1');
INSERT INTO `tb_operation_log` VALUES ('fea41129-c3cb-4ef1-863f-7310c74b385b', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-04-03 13:44:37', '1');
INSERT INTO `tb_operation_log` VALUES ('ff13c862-b95e-480b-9c55-92343fc5478a', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-02-11 16:30:23', '1');
INSERT INTO `tb_operation_log` VALUES ('ff53b36f-8f99-42c3-82d9-3af22ef89bde', '001', 'admin', '0:0:0:0:0:0:0:1', '菜单模块', '所有菜单目录列表', 'cn.com.gzqinghui.sysmgr.menu.ui.MenuController.allDirs()', '2017-03-13 19:51:04', '1');
INSERT INTO `tb_operation_log` VALUES ('ff9afc2c-3b11-4ad0-b1a1-e4248c593b56', '001', 'admin', '0:0:0:0:0:0:0:1', '字典模块', '字典列表', 'cn.com.gzqinghui.sysmgr.dict.ui.DictController.list()', '2017-04-04 10:03:08', '1');
INSERT INTO `tb_operation_log` VALUES ('ffb2f767-59f3-4f6f-9095-ec75cf4e3f41', '001', 'admin', '0:0:0:0:0:0:0:1', '权限模块', '新增权限', 'cn.com.gzqinghui.sysmgr.permission.ui.PermissionController.list()', '2017-03-13 21:15:37', '1');

-- ----------------------------
-- Table structure for tb_ref_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_ref_role_permission`;
CREATE TABLE `tb_ref_role_permission` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) DEFAULT NULL COMMENT '角色ID',
  `PERMISSION_ID` varchar(36) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色和权限关联表';

-- ----------------------------
-- Records of tb_ref_role_permission
-- ----------------------------
INSERT INTO `tb_ref_role_permission` VALUES ('0046db8c-c27c-4e68-a77e-47c5abd1b9f1', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'cb04de33-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('0063bc3a-cc6c-4235-988a-cf1f77633058', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', '09e2dfe5-1ec0-4711-bf7c-7a1175c6683e');
INSERT INTO `tb_ref_role_permission` VALUES ('0578df39-feb3-4aef-aa86-4777eaf5a0a5', '004', '15db1c5d-460d-44dd-83c5-010a3aec1d56');
INSERT INTO `tb_ref_role_permission` VALUES ('068845ec-5b1d-446d-9bcc-f6812bebc520', '003', 'cb04d976-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('07c951c6-8145-4c9b-be72-76a3fe4f5e14', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('0aacf648-fe73-41c2-a334-6cee03c8eb4b', '003', 'cb04e230-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('10b44cb0-fcb1-46b8-b070-a94342d8e2e2', '001', 'cb04e485-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('10e51271-0495-4f5e-bf2a-9735db8a4dd2', '002', '032cd939-ded6-4ac3-9354-6ee9f6956e36');
INSERT INTO `tb_ref_role_permission` VALUES ('122b3b3e-db74-4682-be18-f37f031dd9a7', '004', '4e3e5fdc-222f-4e07-9f9c-d80590aa652a');
INSERT INTO `tb_ref_role_permission` VALUES ('12d8edce-3b1e-4560-8cfa-260bf1948771', '001', '2cc42a8c-cabe-45d3-ac75-00f8c4218675');
INSERT INTO `tb_ref_role_permission` VALUES ('12d92b25-1857-4284-bedd-140a271aeeb2', '005', '0937dae2-9ebf-46d0-a012-d534fa404da6');
INSERT INTO `tb_ref_role_permission` VALUES ('13038f55-b821-4595-9627-4e3627bf769f', '003', '7abbd908-41dc-4587-b5c2-7d3fcafc2448');
INSERT INTO `tb_ref_role_permission` VALUES ('147cc46f-5d0c-4a5b-9614-873f881e6569', '003', 'ba70946b-a55a-4c1b-b413-3264d12f748f');
INSERT INTO `tb_ref_role_permission` VALUES ('174957c1-03ab-4427-8bf5-d8faba70c74c', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', 'ba3bbb26-8b0b-4255-ab7f-fc452b2c1eba');
INSERT INTO `tb_ref_role_permission` VALUES ('18a935da-ea9b-43ee-8b4a-f8e37c0e1d19', '003', 'cb04d572-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('1abed8f5-2bd3-41aa-ba03-92f9301f7d3a', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('1ae788dd-7f3e-443e-8753-ba29056a37ef', '005', '3afd2895-48ad-4c90-a44b-a1d37445acab');
INSERT INTO `tb_ref_role_permission` VALUES ('1ce3521f-6e2a-43be-8466-2ad32a5bb0d8', '004', '0937dae2-9ebf-46d0-a012-d534fa404da6');
INSERT INTO `tb_ref_role_permission` VALUES ('1d557af6-ca9e-4b69-ba25-56ef5d3245bc', '004', '8327f409-1795-435f-b4ea-6dde0e05c1d5');
INSERT INTO `tb_ref_role_permission` VALUES ('1f16bf8b-3875-4c02-8d2b-cab78a07e9dd', '001', 'cb04dbdb-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('1f390de3-948a-4001-8402-000d72b18e58', '002', 'cb04e485-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('1f430ece-ec4e-4e73-ba2a-b1c093d2bc06', '004', 'a8191c68-9936-4806-a3a6-e930eddfd559');
INSERT INTO `tb_ref_role_permission` VALUES ('22fdc068-cc0c-4ce4-8b71-eefa8f3c5ef2', '003', 'cb04e7b1-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('233e00db-0cad-4591-8bc8-615d6d3da7fa', '002', 'cb04ea0b-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('246ec980-f428-4e0e-a3a7-58102b48954e', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', '8ca2302d-aacc-4635-bc14-8ea287f71dd2');
INSERT INTO `tb_ref_role_permission` VALUES ('25adcb38-4c94-4321-81ef-ce8f865a815f', '004', 'a155aafb-2ca2-4acf-bb8e-12018952717a');
INSERT INTO `tb_ref_role_permission` VALUES ('27597933-6739-42fe-a04e-e2d53b6ddf35', '004', '9a2a48e4-1185-4577-98df-dd759b37ab3d');
INSERT INTO `tb_ref_role_permission` VALUES ('2a701737-8749-4278-9814-594e9c0ce13f', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('2bdbc668-365d-4ebe-9784-fa45cd125093', '005', 'cb04de33-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('31121302-76dc-42d6-93ce-188626443c33', '004', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('319ed6b2-383b-4573-b0f3-d1f00979bd75', '003', '7316d44f-c27d-482d-94d4-9ed8b2795335');
INSERT INTO `tb_ref_role_permission` VALUES ('335b8dfd-dda0-4a4c-a53d-8756719f23f9', '004', 'c6022e32-c5d1-44b0-ba3f-7c3ac5b1caf2');
INSERT INTO `tb_ref_role_permission` VALUES ('36d57bfb-7e8c-4f4c-910a-1478998707cd', '001', '36a1627e-cf95-440c-9cf2-99b821451048');
INSERT INTO `tb_ref_role_permission` VALUES ('37152927-7a59-4c8e-a907-f823399216be', '003', '1e10996f-75d0-4ee1-8020-5bd4733b40e9');
INSERT INTO `tb_ref_role_permission` VALUES ('390319ac-953b-474a-95e3-a8038924c738', '001', 'cb04e2f9-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('39322023-3e3e-47e0-9d6a-4feba549fb53', '004', '41b3a53c-27e0-40bd-a09e-763ecf70f3a9');
INSERT INTO `tb_ref_role_permission` VALUES ('3ade7c52-b0ce-4193-a8c5-8f9237d9e66a', '003', 'bef3fcd9-d7f6-4d50-8cf4-e8d33ea9d24b');
INSERT INTO `tb_ref_role_permission` VALUES ('3bfd65ee-2afe-45fa-9982-619dbd5f1395', '004', '8d8cf791-6b0e-4736-bf04-4fd81f8b2ed0');
INSERT INTO `tb_ref_role_permission` VALUES ('3e645120-5eff-4fb3-b1cb-5102ac122114', '003', 'd601ab5c-d407-4677-b603-73669e7de6c5');
INSERT INTO `tb_ref_role_permission` VALUES ('41fbe67f-dd16-43cc-add2-66a544882fcb', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'd5ad6dec-a056-40b5-aa57-79f3b4205814');
INSERT INTO `tb_ref_role_permission` VALUES ('46e6698b-8192-4ac7-9500-75a744474d18', '002', 'cb04dbdb-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('4926244a-cde3-4ed3-919d-06f2f55bcd2f', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', '394d23de-3d3a-4c44-871f-ca9e6caf40c4');
INSERT INTO `tb_ref_role_permission` VALUES ('4c63560f-1ae8-4417-9a4e-fbef72cad7b2', '003', 'cb04cbd2-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('4f855473-a2aa-440e-a952-4612ae70c2df', '004', '115f3fd6-64c6-40ed-a750-ac87b0b36f74');
INSERT INTO `tb_ref_role_permission` VALUES ('500717e9-8917-4262-9381-58aaf7c48401', '004', '1875e06c-22d9-408b-94b1-27c126fa88da');
INSERT INTO `tb_ref_role_permission` VALUES ('507f466f-8f41-46f3-87e6-8fe92b0f2c4b', '002', '904a1caf-2941-400e-88c7-07c519091e83');
INSERT INTO `tb_ref_role_permission` VALUES ('52ebffb9-e932-4a05-a5d4-628e46a175e5', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('547b903c-9bbd-43c3-b072-64b36e8dd1f7', '005', 'a8191c68-9936-4806-a3a6-e930eddfd559');
INSERT INTO `tb_ref_role_permission` VALUES ('54cd2b46-667e-4399-bc2d-462f221ea43b', '001', 'cb04ea0b-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('55e45dde-b727-4ff2-a4a9-948629033ab6', '004', 'cb04de33-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('56acb793-3a09-470e-8b06-6c6ec6f7b9c9', '002', 'cb04e2f9-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('5ed3f3ab-d2cd-4d01-8ede-7ae8d7dbb58a', '001', 'b5676bd0-c813-425c-89db-cac87a964f63');
INSERT INTO `tb_ref_role_permission` VALUES ('6199add4-0ac7-4461-a697-d9bb5c82d050', '003', '2ce2033e-9ba0-4148-902c-9c6bf8515a1c');
INSERT INTO `tb_ref_role_permission` VALUES ('636c4521-a482-4576-9575-6219c3d9a0b6', '005', 'd636ef1a-49f4-4cb7-8c3c-7127af6a4a0d');
INSERT INTO `tb_ref_role_permission` VALUES ('65b5563e-2873-4dfc-a69d-c61b31a4de4f', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', '3496ede0-c4d0-4c2e-9544-d8ef9271ec61');
INSERT INTO `tb_ref_role_permission` VALUES ('65c6fc79-2bea-4eb5-bc03-0867db48bcdf', '004', 'cb04e61e-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('65faa5a1-9715-4252-b333-e56e896b890e', '003', 'cb04db0a-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('66236a6a-cc1b-4eba-8640-62acb0ebc337', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', '61925654-1b9e-4194-bc12-c7d9e7bdbb45');
INSERT INTO `tb_ref_role_permission` VALUES ('66ae0179-ea94-4ee9-b408-29af7455ab47', '005', '41b3a53c-27e0-40bd-a09e-763ecf70f3a9');
INSERT INTO `tb_ref_role_permission` VALUES ('6b07fd01-52b3-42c4-be8a-b14c63ddbf89', '022c28ce-8c8b-45f6-9e8d-817d73e85979', 'cb04e876-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('6b906ef0-e4eb-443c-a913-cc7c953cdbc3', '002', '36a1627e-cf95-440c-9cf2-99b821451048');
INSERT INTO `tb_ref_role_permission` VALUES ('70043ec1-b54c-4575-bec8-952e86774e14', '003', 'cb04dca5-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('70537159-2c8a-4ec9-a716-9a2240a94a04', '005', '4e3e5fdc-222f-4e07-9f9c-d80590aa652a');
INSERT INTO `tb_ref_role_permission` VALUES ('721a889d-bc5b-404b-a75a-4809559819b1', '003', '24444d92-c525-4a40-9ad9-724edadd979d');
INSERT INTO `tb_ref_role_permission` VALUES ('775e5baa-985b-43b4-8d1c-60aaaf1536fd', '003', 'cb04d70a-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('786a032b-7f91-47d2-93bf-215f692adbaf', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', '2d63bf15-42cd-4563-8e6b-c5efc9c7e287');
INSERT INTO `tb_ref_role_permission` VALUES ('7b1e1c09-15c1-413e-b864-bbba0a042a55', '004', '3afd2895-48ad-4c90-a44b-a1d37445acab');
INSERT INTO `tb_ref_role_permission` VALUES ('7e59463f-a21a-4e74-9d5f-95f4512aa96e', '004', 'e9cd41ef-6920-49bf-a107-d396621ac721');
INSERT INTO `tb_ref_role_permission` VALUES ('810f522e-3e1c-4eca-8e16-2c4bce12dbf3', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'cb04de33-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('869244e9-d7b0-482b-98fe-9871e2e6102b', '003', 'd2749891-f1ad-42f8-8d52-68ceee734dcb');
INSERT INTO `tb_ref_role_permission` VALUES ('877640cb-7e15-4e0a-8356-6a93bf91c059', '005', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('88e5fe9a-734c-4787-9b1d-5d599bded6b5', '004', '9a349bdb-27c3-48e3-ab97-12c4049f7456');
INSERT INTO `tb_ref_role_permission` VALUES ('8b87bf83-6f73-4c36-abcf-512155124d0f', '003', 'cb04cd7c-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('8c22df99-3b71-434e-bc4c-6d0061033bf3', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'a4e38d92-0d45-4f9a-92b3-7a26ceb75ede');
INSERT INTO `tb_ref_role_permission` VALUES ('91bd3251-3254-4f2d-b312-096c837d5037', '005', 'cb04e099-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('92c80ee1-7ecc-422d-9f6a-d7e21be0182c', '005', 'd5ad6dec-a056-40b5-aa57-79f3b4205814');
INSERT INTO `tb_ref_role_permission` VALUES ('94c3a2de-77c2-47e3-92e3-d5880333e221', '004', 'd636ef1a-49f4-4cb7-8c3c-7127af6a4a0d');
INSERT INTO `tb_ref_role_permission` VALUES ('94e8084e-869c-4cde-9c43-d2ae2881c162', '003', '2491301b-501f-4d84-9910-2a4c3552e57b');
INSERT INTO `tb_ref_role_permission` VALUES ('95cc8842-9688-427b-a524-593fb0ef00fc', '004', 'cb04e099-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('96ca67b1-5a35-49e1-af16-68a8e7302a82', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'c90ad304-2e3a-47a8-9e52-f925dbb241e3');
INSERT INTO `tb_ref_role_permission` VALUES ('9b235ee7-9df9-40d5-9738-d613402b712f', '002', '254a2f56-2c9f-46f7-9a84-5797c9dc41c0');
INSERT INTO `tb_ref_role_permission` VALUES ('9b433c83-9723-4adc-b975-82006894b565', '005', '3d4fd7ad-84c1-46a0-b988-ea9fec33c279');
INSERT INTO `tb_ref_role_permission` VALUES ('9dd8b4ab-2e29-4f8c-9594-7dea4ef76d3c', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'de2e59c8-8057-43d6-af35-598cc14338a5');
INSERT INTO `tb_ref_role_permission` VALUES ('9e56cb2b-93ca-4a47-a1a1-b651ebd4fd47', '003', 'cb04ce4d-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('a2ec6544-e844-44ca-91a1-5c95c89184a7', '001', 'cb04d3d4-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('a3ed90e8-cc78-4915-aa7a-56a7bb725059', '003', 'cb04d8af-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('a40f8d48-70ff-47de-a47c-a6c50e71f4fa', '003', 'cb04d8af-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('a521081b-d50e-48ca-a347-409ce0c65806', '004', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('a782ca45-4136-4cda-96de-cf3d3203e63e', '003', '4b8cd0e3-0237-4ba8-85c7-17188f672279');
INSERT INTO `tb_ref_role_permission` VALUES ('a7d32951-c531-4726-832e-5cf9dd2a6833', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', '8ca2302d-aacc-4635-bc14-8ea287f71dd2');
INSERT INTO `tb_ref_role_permission` VALUES ('aa05c5ae-1675-427e-914b-5132a0ce108e', '004', 'cb04d7de-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('aa281583-b4ce-4285-91d5-2839fe17b49c', '005', '115f3fd6-64c6-40ed-a750-ac87b0b36f74');
INSERT INTO `tb_ref_role_permission` VALUES ('aad80d4a-61e6-4bb9-af77-cf83658e5e91', '004', 'd7e2eb31-9c2d-417f-b7eb-9a9526a8e426');
INSERT INTO `tb_ref_role_permission` VALUES ('ab9dc477-ee59-47f1-9dfb-56f6139de164', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', 'deb062c3-7416-4c42-bef3-b4d975b3fddf');
INSERT INTO `tb_ref_role_permission` VALUES ('ad1c3b19-e657-434d-a361-3bd4ea333157', '002', 'cb04d3d4-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('ae74fe5b-cf89-4c9e-b097-2557b64ccbb3', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', '4223de1b-092c-4534-9ad2-aea6eef22e1c');
INSERT INTO `tb_ref_role_permission` VALUES ('b19457ac-bcc7-4aeb-bcbe-241e5952678c', '001', 'cb04dfd1-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('b7e220e6-c086-4dbb-82c2-a1e1b3019dc0', '003', '92441211-2fb6-4884-8aaf-5cb2709918ac');
INSERT INTO `tb_ref_role_permission` VALUES ('bac545b3-1334-414c-98f4-eafd4368d41f', '003', '6f21cd29-008f-45db-8a59-2de1602439ee');
INSERT INTO `tb_ref_role_permission` VALUES ('be59ce06-0090-408e-8226-7f9a0bf9473c', '004', 'cb04d49b-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('be8f4603-fca4-470b-aff3-bfa444204d1c', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('c1d70e47-bccc-4c7a-bdb5-d5300de6e753', '001', '5aa661ec-b990-445b-b638-f636617ff934');
INSERT INTO `tb_ref_role_permission` VALUES ('c200ebce-aeda-4230-8f08-fe3e97198e45', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'cb04e099-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c3d572e5-414e-46c8-84f8-31a80db74946', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'fc3d0362-259b-4f0d-b343-80992915ec46');
INSERT INTO `tb_ref_role_permission` VALUES ('c416c21a-69af-48ba-978c-5ad09969f19b', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'cb04e099-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c52d193a-6111-41d2-ad86-7c85abdc583d', '003', 'cb04e54c-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c5a430d9-e210-4d8d-b115-8c79b966c543', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c5c26e05-1197-4719-ab29-336a2a858005', '003', '7ebb9183-c726-42a5-951d-090e1b176f17');
INSERT INTO `tb_ref_role_permission` VALUES ('c85c444b-84d4-4696-88ac-a5944ef13f7a', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'd5ad6dec-a056-40b5-aa57-79f3b4205814');
INSERT INTO `tb_ref_role_permission` VALUES ('ca8e1ee5-55d0-4157-af68-14a783d22ac0', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', '3496ede0-c4d0-4c2e-9544-d8ef9271ec61');
INSERT INTO `tb_ref_role_permission` VALUES ('cda8c5e6-9fc1-4cc9-83c8-52d5f53aac34', '004', '3496ede0-c4d0-4c2e-9544-d8ef9271ec61');
INSERT INTO `tb_ref_role_permission` VALUES ('d0216fe9-2dc3-4a13-9d69-76211ae2fc2c', '003', 'cb04dd6a-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('d0742fff-b303-4f3a-8ce2-42e479a7514a', '002', '5aa661ec-b990-445b-b638-f636617ff934');
INSERT INTO `tb_ref_role_permission` VALUES ('d4929fe9-d0f8-4325-88d2-947f4bf71e3e', '002', '2cc42a8c-cabe-45d3-ac75-00f8c4218675');
INSERT INTO `tb_ref_role_permission` VALUES ('d50844d2-fd12-448c-a649-8a025c94bdc3', '004', '5a03c8a2-95ab-42b9-8dfc-859ce9779dc9');
INSERT INTO `tb_ref_role_permission` VALUES ('d8376a84-573d-47f6-a2a6-9ffd93070df7', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'cb04e099-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('d86d04b0-aed0-401a-afad-6913bfce2a63', '004', '3d4fd7ad-84c1-46a0-b988-ea9fec33c279');
INSERT INTO `tb_ref_role_permission` VALUES ('db5f5ab0-783b-46f4-afb2-b5cfb173be4f', '005', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('dceb6426-b633-4ad6-bb4f-f17e165e305a', '004', 'd5ad6dec-a056-40b5-aa57-79f3b4205814');
INSERT INTO `tb_ref_role_permission` VALUES ('dfb701bd-e9b1-4626-be95-5d231c8d592a', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', 'bd2d91cf-17c4-4ee8-89d5-15b5de85e091');
INSERT INTO `tb_ref_role_permission` VALUES ('dff6f3dd-5e04-4105-8cca-37c9850faf32', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', '3496ede0-c4d0-4c2e-9544-d8ef9271ec61');
INSERT INTO `tb_ref_role_permission` VALUES ('e29f5f90-0ca3-4caa-814e-e66bc0a4e2c7', '005', '1875e06c-22d9-408b-94b1-27c126fa88da');
INSERT INTO `tb_ref_role_permission` VALUES ('e390d4be-c53d-449d-ab2c-3ff30a37f56d', '002', 'cb04dfd1-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('e98899ea-d68b-43b6-b1be-a9cd0443e732', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'd5ad6dec-a056-40b5-aa57-79f3b4205814');
INSERT INTO `tb_ref_role_permission` VALUES ('ea0319f8-756d-4f46-bd42-aec903a32859', '004', '8ca2302d-aacc-4635-bc14-8ea287f71dd2');
INSERT INTO `tb_ref_role_permission` VALUES ('ea869fc7-59d9-4153-aa24-609938c3aae3', '003', 'cb04e54c-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('eb647b5e-efa5-4a80-9cdf-bece0f38ac1e', '003', '66c077c2-af7f-4266-8c30-017ef618cad5');
INSERT INTO `tb_ref_role_permission` VALUES ('ebc3c3fb-a208-4660-aca4-dbf44db59e54', '003', 'cb04da40-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('ee7ca37c-0574-4c70-8fbe-d361d1c5ab17', '003', 'cb04ccac-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('ef774fcc-24e8-4c5c-8112-cc1ac180811b', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', 'a991c28c-32ed-4110-8756-cc0f6fdf1ae5');
INSERT INTO `tb_ref_role_permission` VALUES ('ef8ff11f-9586-4f6b-88f0-388b916c49e0', '003', 'cb04df04-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('f0824ab2-3d8c-4f61-a259-39cc150e80ce', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', 'b4b6047c-a856-4c27-8de9-fa1c49158f03');
INSERT INTO `tb_ref_role_permission` VALUES ('f092f1da-6409-42d0-a9ca-fd15c7be6d1e', '003', 'cb04cd7c-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('f2723568-fcda-40dc-bf46-fe65c3e76094', '005', '3496ede0-c4d0-4c2e-9544-d8ef9271ec61');
INSERT INTO `tb_ref_role_permission` VALUES ('f31f4994-11fd-4cf5-ac8e-7407094c6bbb', '003', 'cb04ccac-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('f374cb07-e408-470f-ab73-69e92ef54f5f', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', '8ca2302d-aacc-4635-bc14-8ea287f71dd2');
INSERT INTO `tb_ref_role_permission` VALUES ('f5724202-41b4-4ba4-845f-08b98d56ca45', '005', 'd7e2eb31-9c2d-417f-b7eb-9a9526a8e426');
INSERT INTO `tb_ref_role_permission` VALUES ('f959c6fc-71ff-45bd-b811-94acd210dffc', '005', '8ca2302d-aacc-4635-bc14-8ea287f71dd2');
INSERT INTO `tb_ref_role_permission` VALUES ('f964959a-2427-4cab-afa3-a9c175d56224', '003', 'a76d086e-b154-4829-b729-e2f766d5d323');
INSERT INTO `tb_ref_role_permission` VALUES ('f9eee626-3f62-495f-be2a-83572ae7a9e0', '003', 'd2749891-f1ad-42f8-8d52-68ceee734dcb');
INSERT INTO `tb_ref_role_permission` VALUES ('fb88af81-eb31-48cf-b51d-d1adac3aaaab', '005', 'c6022e32-c5d1-44b0-ba3f-7c3ac5b1caf2');
INSERT INTO `tb_ref_role_permission` VALUES ('fce33bc5-fc6a-4f4a-b5ee-7dfc78d8c733', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'cb04de33-ec03-11e5-ac22-00163e002c89');

-- ----------------------------
-- Table structure for tb_ref_usr_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_ref_usr_role`;
CREATE TABLE `tb_ref_usr_role` (
  `ID` varchar(36) NOT NULL,
  `USR_ID` varchar(36) DEFAULT NULL COMMENT '账号ID',
  `ROLE_ID` varchar(36) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='账号和角色关联表';

-- ----------------------------
-- Records of tb_ref_usr_role
-- ----------------------------
INSERT INTO `tb_ref_usr_role` VALUES ('011ac780-9d80-11e6-b690-00163e0c0ff6', '004da23d-75fd-4435-b9ca-0416e0b8a9a0', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('0169654f-de45-49e2-b880-eccd18d832ff', '7fd01df7-9ad8-45c6-bab1-9602270d69f4', '7f1748b1-7849-4b8b-a700-3ea6fb973a56');
INSERT INTO `tb_ref_usr_role` VALUES ('08c29167-c848-45c1-a023-b455ee70bc5e', '1559e88b-6b6b-49a5-a0f9-4002472896fb', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('0d0c4718-cb30-11e6-871b-00163e0c0ff6', '7ad9b0dd-0a2e-466c-a4ed-1d74cde66636', '002');
INSERT INTO `tb_ref_usr_role` VALUES ('15426536-556e-11e6-a1f3-00163e0c0ff6', '38ecaeff-958a-494c-8bc3-89efc6992b02', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('1733b5ec-aad1-11e6-9063-00163e0c0ff6', 'dcfad33f-a06f-4151-b6ac-6a9bcb1ed6be', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('179053b6-9cd9-11e6-9ff4-00163e0c0ff6', '6f1fe2db-6152-4794-ab27-60294b9e1b88', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('1d552dd6-650a-11e6-be99-00163e0c0ff6', 'ee1178cc-7cee-4ea3-b678-8c0c92e34edb', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('264ea1b4-5e02-4fa0-8d27-3d1b52d3d139', '001', '002');
INSERT INTO `tb_ref_usr_role` VALUES ('2675f52d-1305-49cf-a084-dbf8a55f2e78', '6bc6cd2b-4514-4ba3-8ab5-04dc91591584', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7');
INSERT INTO `tb_ref_usr_role` VALUES ('2941f47b-cf7a-4d95-8a65-620da416ebaf', '2e110f86-2be4-42c2-81ce-0e9b268d0310', '002');
INSERT INTO `tb_ref_usr_role` VALUES ('33e909d5-6dbc-11e6-a2d1-00163e0c0ff6', 'd2cc0bda-0fae-4198-b228-4941479cf3fa', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('40d14922-6e5e-11e6-a7a7-00163e0c0ff6', '5ddff62d-a740-47a7-a001-37df6be08f25', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('4b82a5f7-7321-4496-b872-5cc6cd30d9cc', '851b560b-dbd2-4ad0-9a74-171d4f1564ed', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('4c80d36e-81ea-4dd1-beea-3d80a392af59', 'e052412b-1293-4fb1-8c8d-2ada45014a84', '004');
INSERT INTO `tb_ref_usr_role` VALUES ('4f799a54-fed5-11e5-aebb-ecf4bbc00600', '61cdeb93-d4a3-46ce-b1ef-eff41e340318', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('52a12361-3f4c-4909-88b7-d0ee2694027d', '9c9e419c-4c30-4252-99bf-fe812c7bbd56', 'a8c1542c-fbfd-45ce-8360-345bc30b982a');
INSERT INTO `tb_ref_usr_role` VALUES ('563a5575-37c7-4d72-84cc-22b24bddf812', 'd8825677-658e-4692-8b73-1b811cf108a0', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('5a9024e7-f288-447f-b4d4-275c2bf82508', 'e052412b-1293-4fb1-8c8d-2ada45014a84', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('5d79531a-a40b-4f5c-9f66-e78c3e04c561', '7ee6b44b-1ba8-4de7-bee6-9afcde6539d0', '004');
INSERT INTO `tb_ref_usr_role` VALUES ('64b47442-0149-11e6-aebb-ecf4bbc00600', '18de7794-0297-400e-9d33-e3d18e2a2ac9', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('72b96f01-9359-45db-8b02-533bf9316396', 'e052412b-1293-4fb1-8c8d-2ada45014a84', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('7ad18a04-6a65-11e6-b24a-00163e0c0ff6', '6a780bb8-52ec-41dd-80fb-16de4ad6e4ec', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('9bad2070-bab4-11e6-9664-00163e0c0ff6', '7bd5777c-4e29-4bb6-8560-5f406fbd7735', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('9e3b9a33-374a-42f4-9532-51c6c9a69f73', '1559e88b-6b6b-49a5-a0f9-4002472896fb', '001');
INSERT INTO `tb_ref_usr_role` VALUES ('9e748f14-a657-4fd0-b8ac-61ed321b5b2b', '1559e88b-6b6b-49a5-a0f9-4002472896fb', '002');
INSERT INTO `tb_ref_usr_role` VALUES ('a4e64e70-5630-4cc9-b255-46f605620a43', 'dc76142e-9ff4-408c-8e12-e3f8b3e58a4e', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('a5b882d9-d964-11e6-8c70-00163e0c0ff6', '59ba5b84-9252-42a9-854a-d9b225ef3df1', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('a60ef6ae-aa6b-47ff-a8c3-6a739e315c4d', '372a8112-19ce-4013-999c-75066a0c6de0', '7f1748b1-7849-4b8b-a700-3ea6fb973a56');
INSERT INTO `tb_ref_usr_role` VALUES ('ab9ebf17-69a4-11e6-8501-00163e0c0ff6', 'c851a155-2b1c-4cbd-a38a-f6dc744b0fe8', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('ac5c3343-700b-11e6-93e4-00163e0c0ff6', '116f44cb-269e-446c-a889-8c95edf9e96e', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('ad0fc9d4-6b61-11e6-a14d-00163e0c0ff6', 'bb3a85cd-76e0-401c-be8a-0ff4810a9343', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('af753448-5d1a-11e6-9b39-00163e0c0ff6', '0aec996f-91ac-4e91-9aa9-42252240442b', '005');
INSERT INTO `tb_ref_usr_role` VALUES ('afd51893-aa58-461e-9cf7-0d9308a478bb', '5bbce100-df3a-4b2e-b7a8-4eff4f2aa3ee', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('cc8f427e-70da-11e6-80a1-00163e0c0ff6', '9bf6c597-484a-4cb5-bedb-c5eb1dca4d84', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('ce348c74-aa08-11e6-bb9b-00163e0c0ff6', '9bc45791-fc19-4507-a250-251b4acad400', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('ce918aa5-cffd-465e-90f1-72f89f02b6b0', '2e110f86-2be4-42c2-81ce-0e9b268d0310', '001');
INSERT INTO `tb_ref_usr_role` VALUES ('d1f05098-fe35-11e5-aebb-ecf4bbc00600', 'df981f6b-3f26-4f74-bc66-48189c004f20', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('d6e61dc3-53c6-4d05-9f5d-f9ff541dc4c1', '1b4b5943-7110-42fa-922c-c2e34e40c406', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e');
INSERT INTO `tb_ref_usr_role` VALUES ('ec40eefa-07e9-11e7-b025-8cd8976a4d45', 'edb7d10a-fc37-4843-a07e-531fc1c65a85', '002');
INSERT INTO `tb_ref_usr_role` VALUES ('f0a41f4f-f4b7-4ad7-a020-839ba4a0bdbe', '001', '001');
INSERT INTO `tb_ref_usr_role` VALUES ('f35e800f-7701-11e6-bb76-00163e0c0ff6', '5b506f3d-00bf-4820-ab8c-af967f765bba', '002');
INSERT INTO `tb_ref_usr_role` VALUES ('f913d6d9-9d84-11e6-b592-00163e0c0ff6', 'ce762aa5-2916-4d71-9c6c-672b6881ed27', '003');
INSERT INTO `tb_ref_usr_role` VALUES ('fbcaee4b-bab2-11e6-858c-00163e0c0ff6', 'fa617342-ec0c-4e8d-b559-e4b4b8fd6d0e', '003');

-- ----------------------------
-- Table structure for tb_sys_generator_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_generator_log`;
CREATE TABLE `tb_sys_generator_log` (
  `id` varchar(36) NOT NULL,
  `root_path` varchar(255) DEFAULT NULL COMMENT '项目根路径',
  `src_root_path` varchar(255) DEFAULT NULL COMMENT 'java代码路径',
  `web_root_path` varchar(255) DEFAULT NULL COMMENT 'jsp页面路径',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名',
  `db_name` varchar(255) DEFAULT NULL COMMENT '数据库',
  `java_name` varchar(255) DEFAULT NULL COMMENT 'java文件前缀',
  `component_name` varchar(255) DEFAULT NULL COMMENT '组件包名',
  `component_namezh_cn` varchar(255) DEFAULT NULL COMMENT '组件中文名',
  `moduel_name` varchar(255) DEFAULT NULL COMMENT '模块包名',
  `moduel_namezn_cn` varchar(255) DEFAULT NULL COMMENT '模块中文名称',
  `vo_sql` varchar(255) DEFAULT NULL COMMENT '生成vo的sql',
  `user` varchar(255) DEFAULT 'platform' COMMENT '创建人',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sys_generator_log
-- ----------------------------
INSERT INTO `tb_sys_generator_log` VALUES ('1d07b3ba-e604-49cb-9963-fc76d898db81', '/Users/user/develop/web/baseframe/baseframe-sysmgr', '', '', 'tb_sys_generator_log', 'base_platform', 'SysGenerator3', 'sysextmgr', '系统管理', 'generator', '代码生成器', 'select * from tb_sys_generator_log', 'kki', '2017-02-13 21:09:30');
INSERT INTO `tb_sys_generator_log` VALUES ('4900db86-329c-4975-8f8c-a9c2cc00e028', '/Users/user/develop/web/baseframe/baseframe-sysmgr', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/java', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/webapp', 'tb_sys_generator_log', 'base_platform', 'SysGenerator', 'sysextmgr', '系统管理', 'generator', '代码生成器', 'select * from tb_sys_generator_log', 'kki', '2017-02-13 12:38:11');
INSERT INTO `tb_sys_generator_log` VALUES ('4cbb6d9f-edf9-4dbd-b1ce-cecdd5c5b1bc', '/Users/user/develop/web/baseframe/baseframe-sysmgr', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/java', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/webapp', 'tb_sys_generator_log', 'base_platform', 'SysGenerator3', 'sysextmgr', '系统管理', 'generator', '代码生成器', 'select * from tb_sys_generator_log', 'kki', '2017-02-13 12:41:07');
INSERT INTO `tb_sys_generator_log` VALUES ('a2b6f106-8d1f-409f-8971-a6b1febfcdd7', '/Users/user/develop/web/baseframe/baseframe-sysmgr', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/java', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/webapp', 'tb_sys_generator_log', 'base_platform', 'SysGenerator2', 'sysextmgr', '系统管理', 'generator', '代码生成器', 'select * from tb_sys_generator_log', 'kki', '2017-02-13 12:39:42');
INSERT INTO `tb_sys_generator_log` VALUES ('b73bd08f-d33e-4ac4-872f-c4584461dbd5', '/Users/user/develop/web/baseframe/baseframe-sysmgr', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/java', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/webapp', 'tb_sys_generator_log', 'base_platform', 'SysGenerator4', 'sysextmgr', '系统管理', 'generator', '代码生成器', 'select * from tb_sys_generator_log', 'kki', '2017-02-13 12:46:44');
INSERT INTO `tb_sys_generator_log` VALUES ('ee092ffe-8d01-4ed1-aeb8-86589881ed36', '/Users/user/develop/web/baseframe/baseframe-sysmgr', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/java', '/Users/user/develop/web/baseframe/baseframe-sysmgr/src/main/webapp', 'tb_sys_generator_log', 'base_platform', 'SysGenerator', 'sysextmgr', '系统管理', 'generator', '代码生成器', 'select * from tb_sys_generator_log', 'kki', '2017-10-10 00:00:00');

-- ----------------------------
-- Table structure for tb_sys_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_menu_info`;
CREATE TABLE `tb_sys_menu_info` (
  `ID` varchar(36) NOT NULL,
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单名称',
  `MENU_TYPE` smallint(1) DEFAULT '1' COMMENT '菜单类型：1目录 、2地址',
  `MENU_ICON` varchar(50) DEFAULT NULL,
  `MENU_LINK` varchar(150) NOT NULL COMMENT '菜单地址',
  `MENU_TARGET` varchar(50) DEFAULT 'rightFrame' COMMENT '打开位置',
  `MENU_PERMISSION` varchar(50) NOT NULL COMMENT '菜单权限',
  `PARENT_ID` varchar(36) DEFAULT NULL COMMENT '上级菜单ID',
  `MENU_LEVEL` smallint(6) DEFAULT '0' COMMENT '菜单层级',
  `ORDER_NUM` int(11) DEFAULT '10000' COMMENT '菜单排序',
  `DESC` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of tb_sys_menu_info
-- ----------------------------
INSERT INTO `tb_sys_menu_info` VALUES ('2199c2af-a95f-400b-81f4-a30962cd620e', '代码生成', '2', null, '/jsp/sysextmgr/generator/generator_list.jsp', 'rightFrame', 'MEMBER_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', '0', '100', '');
INSERT INTO `tb_sys_menu_info` VALUES ('6d187ca7-5ba6-49a3-b84b-e55069c6a542', '扩展配置', '2', null, '/jsp/sysextmgr/extconfig/extconfig_list.jsp', 'rightFrame', 'EXT_CONFIG_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', '0', '8', '');
INSERT INTO `tb_sys_menu_info` VALUES ('89db3662-50a4-460a-81c8-5874386c4555', '菜单管理', '2', null, '/jsp/sysextmgr/menu/menu_list.jsp', 'rightFrame', 'MENU_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '4', '');
INSERT INTO `tb_sys_menu_info` VALUES ('aaf8d759-3bb7-4798-91d1-acfaca2a2600', '角色管理', '2', null, '/jsp/sysextmgr/role/role_list.jsp', 'rightFrame', 'ROLE_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '2', '');
INSERT INTO `tb_sys_menu_info` VALUES ('c0c5550b-333e-41c9-8bae-a0e0dec63c29', '字典管理', '2', null, '/jsp/sysextmgr/dictionary/dictionary_list.jsp', 'rightFrame', 'DICT_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '5', null);
INSERT INTO `tb_sys_menu_info` VALUES ('c6a62b1d-2fc2-4b6b-89bb-71014d523cb5', '用户管理', '2', null, '/jsp/sysextmgr/usermanage/usermanage_list.jsp', 'rightFrame', 'USER_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '1', '');
INSERT INTO `tb_sys_menu_info` VALUES ('cd595f89-ddee-42ca-9765-4ff66eb2338d', '权限管理', '2', null, '/jsp/sysextmgr/permission/permission_list.jsp', 'rightFrame', 'PERMISSON_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', '0', '3', '');
INSERT INTO `tb_sys_menu_info` VALUES ('ce827f05-a8d4-479c-a111-af96578a5fd9', '团员管理', '2', null, '/jsp/acitivtymgr/member/member_list.jsp', 'rightFrame', 'MEMBER_MGR', 'f2bca1d7-ee6d-499b-8f64-beeeba435068', '0', '1', '');
INSERT INTO `tb_sys_menu_info` VALUES ('d0c8a943-93d9-449c-ad89-cff82d4a9103', '系统管理', '1', '/staticres/images/xitong.png', '', 'rightFrame', 'SYS_MGR_MODUEL', '', null, '1', '');
INSERT INTO `tb_sys_menu_info` VALUES ('d10127f4-80c7-4188-a850-56434db1c06d', '日志管理', '2', null, '/jsp/sysextmgr/operationlog/operationlog_list.jsp', 'rightFrame', 'LOG_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '6', '');
INSERT INTO `tb_sys_menu_info` VALUES ('f2bca1d7-ee6d-499b-8f64-beeeba435068', '五四活动管理', '1', null, '', 'rightFrame', 'ACTIVITY_MGR_MODUEL', '', '0', '1', '');

-- ----------------------------
-- Table structure for tb_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_permission`;
CREATE TABLE `tb_sys_permission` (
  `ID` varchar(36) NOT NULL,
  `PERMISSION_CODE` varchar(100) DEFAULT NULL COMMENT '权限代码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `MODUEL_NAME` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `MODUEL_CODE` varchar(255) DEFAULT NULL COMMENT '模块代码',
  `PERMISSION_TYPE` int(11) DEFAULT NULL COMMENT '权限类型',
  `DESC` varchar(300) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限表';

-- ----------------------------
-- Records of tb_sys_permission
-- ----------------------------
INSERT INTO `tb_sys_permission` VALUES ('032cd939-ded6-4ac3-9354-6ee9f6956e36', 'PERMISSON_MGR', '代码生成', '系统管理', 'SYS_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('254a2f56-2c9f-46f7-9a84-5797c9dc41c0', 'PERMISSON_MGR', '权限管理', '系统管理', 'SYS_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('2cc42a8c-cabe-45d3-ac75-00f8c4218675', 'PARAMETERCONFIGURATION_LIST', '参数配置', '系统管理', 'SYS_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('36a1627e-cf95-440c-9cf2-99b821451048', 'SYS_MGR_MODUEL', '系统管理', '系统管理', 'SYS_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('5aa661ec-b990-445b-b638-f636617ff934', 'MEMBER_MGR', '团员管理', '五四活动管理', 'ACTIVITY_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('904a1caf-2941-400e-88c7-07c519091e83', 'EXT_CONFIG_MGR', '扩展配置', '系统管理', 'SYS_MGR_MODUEL', '1', null, null);
INSERT INTO `tb_sys_permission` VALUES ('b5676bd0-c813-425c-89db-cac87a964f63', 'ACTIVITY_MGR_MODUEL', '五四活动管理', '五四活动管理', 'ACTIVITY_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('cb04d3d4-ec03-11e5-ac22-00163e002c89', 'MENU_MGR', '菜单管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04dbdb-ec03-11e5-ac22-00163e002c89', 'ROLE_MGR', '角色管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04dfd1-ec03-11e5-ac22-00163e002c89', 'DICT_MGR', '字典管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04e2f9-ec03-11e5-ac22-00163e002c89', 'USER_MGR', '用户管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04e485-ec03-11e5-ac22-00163e002c89', 'LOG_MGR', '日志管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04ea0b-ec03-11e5-ac22-00163e002c89', 'PERMISSON_MGR', '权限管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');

-- ----------------------------
-- Table structure for tb_sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_role_info`;
CREATE TABLE `tb_sys_role_info` (
  `ID` varchar(36) NOT NULL,
  `ROLE_NAME` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(450) DEFAULT NULL COMMENT '角色描述',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态，0不可用，1正常，2已删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY_ID` varchar(36) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_BY_USR` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `UPD_BY_ID` varchar(36) DEFAULT NULL COMMENT '修改人ID',
  `UPD_BY_USR` varchar(50) DEFAULT NULL COMMENT '修改人名称',
  `DEL_BY_ID` varchar(36) DEFAULT NULL COMMENT '删除人ID',
  `DEL_BY_USR` varchar(50) DEFAULT NULL COMMENT '删除人名称',
  PRIMARY KEY (`ID`),
  KEY `STATUS` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统角色表';

-- ----------------------------
-- Records of tb_sys_role_info
-- ----------------------------
INSERT INTO `tb_sys_role_info` VALUES ('001', '管理员', null, '1', null, null, null, null, null, null, null);
INSERT INTO `tb_sys_role_info` VALUES ('002', '总部管理员', null, '1', null, null, null, null, null, null, null);
INSERT INTO `tb_sys_role_info` VALUES ('003', '社区管理员', null, '1', null, null, null, null, null, null, null);
INSERT INTO `tb_sys_role_info` VALUES ('004', '商户管理员', null, '1', null, null, null, null, null, null, null);
INSERT INTO `tb_sys_role_info` VALUES ('005', '门店管理员', null, '1', null, null, null, null, null, null, null);
INSERT INTO `tb_sys_role_info` VALUES ('2ebe31c5-9988-48f7-a63c-a41a0507c75c', 'aaa', 'aaa', '1', '2017-03-16 23:28:21', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_sys_usr_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_usr_info`;
CREATE TABLE `tb_sys_usr_info` (
  `ID` varchar(36) NOT NULL,
  `MERCHANT_ID` varchar(36) DEFAULT NULL COMMENT '如果是商家管理员，则保存对应的商家ID',
  `STORE_ID` varchar(36) DEFAULT NULL COMMENT '如果是门店管理员，则保存对应的门店ID',
  `COMMUNITY_ID` varchar(36) DEFAULT NULL COMMENT '如果是社区管理员，则保存对应的社区ID',
  `ACCOUNT` varchar(50) NOT NULL COMMENT '账号',
  `NAME` varchar(50) NOT NULL COMMENT '账号名称',
  `PASSWORD` varchar(50) DEFAULT NULL COMMENT '密码',
  `STATUS` int(3) NOT NULL DEFAULT '1' COMMENT '状态，0禁止登录，1正常，2登录失败超过三次',
  `RECENTLY_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近登录时间',
  `RECENTLY_LOGIN_IP` int(11) DEFAULT NULL COMMENT '最近登录IP',
  `LAST_TIME_LOGIN_TIME` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `LAST_TIME_LOGIN_IP` int(11) DEFAULT NULL COMMENT '上一次登录IP',
  `NEED_CHANGE_PWD` tinyint(1) DEFAULT NULL COMMENT '强制重新设置密码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY_ID` varchar(36) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_BY_USR` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `UPD_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPD_BY_ID` varchar(36) DEFAULT NULL COMMENT '修改人ID',
  `UPD_BY_USR` varchar(50) DEFAULT NULL COMMENT '修改人名称',
  `DEL_BY_ID` varchar(36) DEFAULT NULL COMMENT '删除人ID',
  `DEL_BY_USR` varchar(50) DEFAULT NULL COMMENT '删除人名称',
  `IS_DEL` tinyint(3) DEFAULT '0' COMMENT '0正常 1删除',
  `PHONE` varchar(15) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`ID`,`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统账号表';

-- ----------------------------
-- Records of tb_sys_usr_info
-- ----------------------------
INSERT INTO `tb_sys_usr_info` VALUES ('001', null, null, null, 'admin', 'admin', '098f6bcd4621d373cade4e832627b4f6', '1', '2017-04-04 11:23:14', '2130706433', '2017-04-04 13:19:19', '2130706433', null, '2015-10-10 16:52:12', null, null, '2015-10-19 15:59:07', '001', 'admin', null, null, '0', null);

-- ----------------------------
-- View structure for view_user_permission
-- ----------------------------
DROP VIEW IF EXISTS `view_user_permission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_user_permission` AS select `usr`.`ACCOUNT` AS `USERNAME`,`per`.`PERMISSION_CODE` AS `ROLE` from ((((`tb_sys_usr_info` `usr` join `tb_ref_usr_role` `ref_ur` on((`usr`.`ID` = `ref_ur`.`USR_ID`))) join `tb_ref_role_permission` `ref_rp` on((`ref_rp`.`ROLE_ID` = `ref_ur`.`ROLE_ID`))) join `tb_sys_role_info` `role` on((`role`.`ID` = `ref_ur`.`ROLE_ID`))) join `tb_sys_permission` `per` on((`per`.`ID` = `ref_rp`.`PERMISSION_ID`))) where ((`usr`.`STATUS` = 1) and (`role`.`STATUS` = 1)) ;
