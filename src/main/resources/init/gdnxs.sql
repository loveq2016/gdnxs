/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 60011
Source Host           : 192.168.0.29:3306
Source Database       : basep

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-04-07 17:44:06
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
INSERT INTO `tb_activity_info` VALUES ('032adb91-997a-4e64-8c15-307402b16226', 'XX活动', '/upload/member/201704/36d7bd48-882c-4fc4-a027-ae8d549949a1.jpg', '2017-04-12 10:56:00', '1', '<p>sbsbs</p>', '1', '001', '2017-04-05 10:56:22', '001', '2017-04-07 14:47:47', '0');
INSERT INTO `tb_activity_info` VALUES ('40a8d75e-8a39-4553-ac90-eef79e7323da', '最新活动', '/upload/activity/201704/7e6a212f-c623-4c61-8627-0ba42d18b249.jpg', '2017-04-14 14:47:53', '0', '<p>是不是不是<br/></p>', '0', '001', '2017-04-07 14:48:09', '001', '2017-04-07 14:48:09', '0');
INSERT INTO `tb_activity_info` VALUES ('837037c5-9e79-47ad-b5d6-618c8c8ed94d', '第二个活动', '/upload/member/201704/3bd95888-7f30-4148-8fe2-3f47c0045628.jpg', '2017-04-12 15:38:00', '0', '<p>随便随便说说</p>', '0', '001', '2017-04-05 15:39:06', '001', '2017-04-07 14:39:08', '0');

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
INSERT INTO `tb_activity_pics` VALUES ('cad2c58b-8620-4d4e-8cf0-4f215e2e7297', '837037c5-9e79-47ad-b5d6-618c8c8ed94d', null, '/upload/activity/201704/4be51b0a-3bf0-44cc-9d95-9bc9188ce073.jpg', '001', '2017-04-07 15:45:43', '001', '2017-04-07 15:45:43', '0');
INSERT INTO `tb_activity_pics` VALUES ('f9ee6b1c-220d-4925-a2d5-26063c89420f', '837037c5-9e79-47ad-b5d6-618c8c8ed94d', null, '/upload/activity/201704/8a6686b5-1ac0-4b91-908d-81f6b05c07ee.jpg', '001', '2017-04-07 15:45:40', '001', '2017-04-07 15:45:40', '0');

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
INSERT INTO `tb_act_member_ref` VALUES ('0a896208-a7da-40a1-b99d-c36deb6cc270', '837037c5-9e79-47ad-b5d6-618c8c8ed94d', '7a379b93-2a58-4f25-a1e0-68a5160ce2a3', '2', '0', '001', '2017-04-05 15:40:15');
INSERT INTO `tb_act_member_ref` VALUES ('0f56083e-c36c-4608-a628-21f3c93d9fa1', '837037c5-9e79-47ad-b5d6-618c8c8ed94d', '4b9ab219-8060-4f5b-878b-580825ddabb7', '1', '0', '001', '2017-04-05 15:40:15');
INSERT INTO `tb_act_member_ref` VALUES ('b0de1bf9-445e-420f-9e85-6c56c75a8d4f', '032adb91-997a-4e64-8c15-307402b16226', '7a379b93-2a58-4f25-a1e0-68a5160ce2a3', '1', '0', '001', '2017-04-05 15:38:25');
INSERT INTO `tb_act_member_ref` VALUES ('fcefa9ed-32eb-40ac-8ee5-baaad84e64f0', '032adb91-997a-4e64-8c15-307402b16226', '4b9ab219-8060-4f5b-878b-580825ddabb7', '0', '0', '001', '2017-04-05 15:38:25');

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `ID` varchar(36) NOT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `AREATEXT` varchar(2000) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES ('123', '茂名', ',茂名市,信宜,高州,化州,电白,茂南', '2017-04-06 16:32:06');
INSERT INTO `tb_area` VALUES ('1234', '肇庆', ',肇庆办事处,高要,四会,广宁,怀集,封开,德庆,鼎湖,端州', '2017-04-29 16:32:15');

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
INSERT INTO `tb_dictionary` VALUES ('00906023-2f78-4560-8584-8a302c177f17', 'MTYPE', '团员类型', '1', '团员', '2533824f-9478-419f-8660-d2f9f345d43c', '1', '0', '2017-04-06 17:15:06');
INSERT INTO `tb_dictionary` VALUES ('0d3b9d41-3190-46d3-8ef8-036b2e934580', 'MTYPE', '团员类型', '0', '团干', '2533824f-9478-419f-8660-d2f9f345d43c', '1', '0', '2017-04-06 17:14:56');
INSERT INTO `tb_dictionary` VALUES ('0e3cc5d2-3bf6-4759-8329-55b5232884b4', 'personSex', '性别', '0', '男', 'd9749a85-fc14-4dae-bd5c-79ce0518749c', '1', '0', '2017-04-03 17:30:15');
INSERT INTO `tb_dictionary` VALUES ('104ae252-d979-11e6-b82a-00163e002c89', 'menuType', '菜单类型', '1', '目录', '73f9e8f2-07f3-11e7-b025-8cd8976a4d45', '1', '0', '2016-03-15 16:43:17');
INSERT INTO `tb_dictionary` VALUES ('104d916c-d979-11e6-b82a-00163e002c89', 'menuType', '菜单类型', '2', '链接', '73f9e8f2-07f3-11e7-b025-8cd8976a4d45', '1', '0', '2016-03-17 11:12:56');
INSERT INTO `tb_dictionary` VALUES ('10d73389-d621-4e3a-9413-fe680f23705b', 'area', '区域', null, null, null, '0', '0', '2017-04-03 17:35:01');
INSERT INTO `tb_dictionary` VALUES ('11a2421a-b056-4434-9e64-f005f7e72bde', 'ACTSTATUS', '活动状态', null, null, null, '0', '0', '2017-04-05 09:42:43');
INSERT INTO `tb_dictionary` VALUES ('2533824f-9478-419f-8660-d2f9f345d43c', 'MTYPE', '团员类型', null, null, null, '0', '0', '2017-04-06 17:14:48');
INSERT INTO `tb_dictionary` VALUES ('2aac56e4-3072-4f4a-9269-80e355206e2a', 'personSex', '性别', '1', '女', 'd9749a85-fc14-4dae-bd5c-79ce0518749c', '1', '0', '2017-04-03 17:30:32');
INSERT INTO `tb_dictionary` VALUES ('33d32d98-b1f5-4c20-84ac-d707208b2c26', 'area', '区域', '1', '深圳', '10d73389-d621-4e3a-9413-fe680f23705b', '1', '0', '2017-04-03 17:35:16');
INSERT INTO `tb_dictionary` VALUES ('36001520-4cdb-442f-a48f-e2be93d82411', '1', '否', null, null, null, '0', '1', '2017-04-03 17:31:17');
INSERT INTO `tb_dictionary` VALUES ('6cafd59d-2fb4-4b8b-94ba-be0805394b7e', 'people', '民族', null, null, null, '0', '0', '2017-04-07 09:37:08');
INSERT INTO `tb_dictionary` VALUES ('7293009b-6069-467a-bd2e-8039735029db', 'YesOrNo', '是否', '0', '是', 'e5e51c66-22e3-4349-ab5e-b87a28e5c77c', '1', '0', '2017-04-03 17:31:05');
INSERT INTO `tb_dictionary` VALUES ('73f9e8f2-07f3-11e7-b025-8cd8976a4d45', 'menuType', '菜单类型', null, null, null, '0', '0', '2017-03-13 21:46:26');
INSERT INTO `tb_dictionary` VALUES ('8244d742-35f9-46be-8b7f-5b0bc0a73dd7', 'ACTSTATUS', '活动状态', '1', '已结束', '11a2421a-b056-4434-9e64-f005f7e72bde', '1', '0', '2017-04-05 09:43:08');
INSERT INTO `tb_dictionary` VALUES ('96235716-870e-4837-b1a0-af881aa7c2ef', 'people', '民族', '1', '汉族', '6cafd59d-2fb4-4b8b-94ba-be0805394b7e', '1', '0', '2017-04-07 09:37:16');
INSERT INTO `tb_dictionary` VALUES ('9c043cf5-6641-4893-9e8d-bc2f313b9f8d', 'ACTSTATUS', '活动状态', '0', '进行中', '11a2421a-b056-4434-9e64-f005f7e72bde', '1', '0', '2017-04-05 09:42:50');
INSERT INTO `tb_dictionary` VALUES ('c8beb4e9-0b59-4145-9eef-6020b1885bb7', 'area', '区域', '1', '1', '33d32d98-b1f5-4c20-84ac-d707208b2c26', '2', '0', '2017-04-06 15:59:26');
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
INSERT INTO `tb_faq_info` VALUES ('dcab4844-9d7e-4626-b14d-de9516ff8195', '标题', '<p>test</p>', '001', '2017-04-07 10:13:13', '001', '2017-04-07 10:15:02', '0');

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
  `BIRTHDAY` date DEFAULT NULL,
  `MTYPE` varchar(2) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `AREA` varchar(100) DEFAULT NULL,
  `PEOPLE` varchar(2) DEFAULT NULL,
  `SPECIALTY` varchar(200) DEFAULT NULL,
  `SELFDESC` varchar(300) DEFAULT NULL,
  `AVATAR` varchar(100) DEFAULT NULL,
  `PROFILE` text,
  `OPEINID` varchar(100) DEFAULT NULL,
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
INSERT INTO `tb_member_info` VALUES ('4b9ab219-8060-4f5b-878b-580825ddabb7', '123123', '1', '18613002847', '18613002847', '2017-04-04', '1', '肇庆', '肇庆办事处', '1', '吹牛B', '', '/upload/member/201704/6e0be816-a383-438b-a12e-786be172df04.jpg', '<p>ni tm jiushi ge sb<br/></p>', null, null, null, '001', '2017-04-07 14:38:21', null);
INSERT INTO `tb_member_info` VALUES ('7a379b93-2a58-4f25-a1e0-68a5160ce2a3', 'oy', '0', 'aa', '18613002847', '2017-04-11', '0', '茂名', '信宜', '1', '', '', '/upload/member/201704/01ba29c7-ebe7-437c-adec-6aad078355a9.jpg', '<p>sb</p>', null, null, null, '001', '2017-04-07 09:42:11', null);
INSERT INTO `tb_member_info` VALUES ('eb7932e5-fbe9-4f04-9cf2-3d956a08aa4a', '第三个团员', '0', '啊啊啊', '15666666666', '2017-04-11', '1', '茂名', '茂名市', '1', '', '', '/upload/member/201704/5f92546a-59ec-4f7e-b921-886c8175566d.jpg', '<p>煞笔煞笔煞笔</p>', null, '001', '2017-04-07 14:47:31', '001', '2017-04-07 14:47:31', '0');

-- ----------------------------
-- Table structure for tb_msg_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_msg_info`;
CREATE TABLE `tb_msg_info` (
  `ID` varchar(36) NOT NULL,
  `MEMBER_ID` varchar(36) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `MSGDESC` varchar(500) DEFAULT NULL,
  `CREATORID` varchar(36) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_msg_info
-- ----------------------------
INSERT INTO `tb_msg_info` VALUES ('uuid', '7a379b93-2a58-4f25-a1e0-68a5160ce2a3', '这是消息标题', '亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的亲爱的', 'a', '2017-04-12 11:51:48');

-- ----------------------------
-- Table structure for tb_notice_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice_info`;
CREATE TABLE `tb_notice_info` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `PURL` varchar(100) DEFAULT NULL,
  `NDESC` text,
  `CITY` varchar(100) DEFAULT NULL,
  `AREA` varchar(100) DEFAULT NULL,
  `ATTACHMENTNAME` varchar(100) DEFAULT NULL,
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
INSERT INTO `tb_notice_info` VALUES ('40f6206a-4d44-4ac0-999e-a6b148a95ccb', '这是一个通知', '/upload/member/201704/290ff448-5c21-477c-85c4-c69371420fc5.jpg', '<p>ssss</p>', '茂名', '茂名市', '1 (8).jpg', '/upload/notice/201704/5e14b305-2e3b-40b3-8d4e-0501cc1bf092.jpg', '001', '2017-04-07 09:22:53', '001', '2017-04-07 09:24:12', null);

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
INSERT INTO `tb_ref_role_permission` VALUES ('04071edb-346c-43ee-a4da-528aac3038f6', '001', 'ab0175ef-0271-4b70-90c3-08c3ce6ba045');
INSERT INTO `tb_ref_role_permission` VALUES ('0578df39-feb3-4aef-aa86-4777eaf5a0a5', '004', '15db1c5d-460d-44dd-83c5-010a3aec1d56');
INSERT INTO `tb_ref_role_permission` VALUES ('068845ec-5b1d-446d-9bcc-f6812bebc520', '003', 'cb04d976-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('07c951c6-8145-4c9b-be72-76a3fe4f5e14', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('0aacf648-fe73-41c2-a334-6cee03c8eb4b', '003', 'cb04e230-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('0d6936a5-d563-4e18-811b-7885cd994acb', '001', 'a4bee7d4-5304-42a6-8787-409e67c468cd');
INSERT INTO `tb_ref_role_permission` VALUES ('0f58cb73-bacd-4a35-a853-daba2106077b', '001', 'cb04d3d4-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('10e51271-0495-4f5e-bf2a-9735db8a4dd2', '002', '032cd939-ded6-4ac3-9354-6ee9f6956e36');
INSERT INTO `tb_ref_role_permission` VALUES ('122b3b3e-db74-4682-be18-f37f031dd9a7', '004', '4e3e5fdc-222f-4e07-9f9c-d80590aa652a');
INSERT INTO `tb_ref_role_permission` VALUES ('12d92b25-1857-4284-bedd-140a271aeeb2', '005', '0937dae2-9ebf-46d0-a012-d534fa404da6');
INSERT INTO `tb_ref_role_permission` VALUES ('13038f55-b821-4595-9627-4e3627bf769f', '003', '7abbd908-41dc-4587-b5c2-7d3fcafc2448');
INSERT INTO `tb_ref_role_permission` VALUES ('147cc46f-5d0c-4a5b-9614-873f881e6569', '003', 'ba70946b-a55a-4c1b-b413-3264d12f748f');
INSERT INTO `tb_ref_role_permission` VALUES ('174957c1-03ab-4427-8bf5-d8faba70c74c', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', 'ba3bbb26-8b0b-4255-ab7f-fc452b2c1eba');
INSERT INTO `tb_ref_role_permission` VALUES ('18a935da-ea9b-43ee-8b4a-f8e37c0e1d19', '003', 'cb04d572-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('1abed8f5-2bd3-41aa-ba03-92f9301f7d3a', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('1ae788dd-7f3e-443e-8753-ba29056a37ef', '005', '3afd2895-48ad-4c90-a44b-a1d37445acab');
INSERT INTO `tb_ref_role_permission` VALUES ('1ce3521f-6e2a-43be-8466-2ad32a5bb0d8', '004', '0937dae2-9ebf-46d0-a012-d534fa404da6');
INSERT INTO `tb_ref_role_permission` VALUES ('1d557af6-ca9e-4b69-ba25-56ef5d3245bc', '004', '8327f409-1795-435f-b4ea-6dde0e05c1d5');
INSERT INTO `tb_ref_role_permission` VALUES ('1f390de3-948a-4001-8402-000d72b18e58', '002', 'cb04e485-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('1f430ece-ec4e-4e73-ba2a-b1c093d2bc06', '004', 'a8191c68-9936-4806-a3a6-e930eddfd559');
INSERT INTO `tb_ref_role_permission` VALUES ('22fdc068-cc0c-4ce4-8b71-eefa8f3c5ef2', '003', 'cb04e7b1-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('233e00db-0cad-4591-8bc8-615d6d3da7fa', '002', 'cb04ea0b-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('246ec980-f428-4e0e-a3a7-58102b48954e', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', '8ca2302d-aacc-4635-bc14-8ea287f71dd2');
INSERT INTO `tb_ref_role_permission` VALUES ('25adcb38-4c94-4321-81ef-ce8f865a815f', '004', 'a155aafb-2ca2-4acf-bb8e-12018952717a');
INSERT INTO `tb_ref_role_permission` VALUES ('262e8647-de93-4eff-91b3-2791fd612e6f', '001', 'df1edb40-366e-4f43-b8b9-155112a26390');
INSERT INTO `tb_ref_role_permission` VALUES ('27597933-6739-42fe-a04e-e2d53b6ddf35', '004', '9a2a48e4-1185-4577-98df-dd759b37ab3d');
INSERT INTO `tb_ref_role_permission` VALUES ('2a4f5b01-1640-4b49-af6d-6050513f425d', '001', '2cc42a8c-cabe-45d3-ac75-00f8c4218675');
INSERT INTO `tb_ref_role_permission` VALUES ('2a701737-8749-4278-9814-594e9c0ce13f', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('2bdbc668-365d-4ebe-9784-fa45cd125093', '005', 'cb04de33-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('31121302-76dc-42d6-93ce-188626443c33', '004', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('319ed6b2-383b-4573-b0f3-d1f00979bd75', '003', '7316d44f-c27d-482d-94d4-9ed8b2795335');
INSERT INTO `tb_ref_role_permission` VALUES ('335b8dfd-dda0-4a4c-a53d-8756719f23f9', '004', 'c6022e32-c5d1-44b0-ba3f-7c3ac5b1caf2');
INSERT INTO `tb_ref_role_permission` VALUES ('37152927-7a59-4c8e-a907-f823399216be', '003', '1e10996f-75d0-4ee1-8020-5bd4733b40e9');
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
INSERT INTO `tb_ref_role_permission` VALUES ('541bdba6-acac-4fc9-b88d-d8552ab4705a', '001', '766382c8-c3d1-4ad3-955d-d0d3b9acecc6');
INSERT INTO `tb_ref_role_permission` VALUES ('547b903c-9bbd-43c3-b072-64b36e8dd1f7', '005', 'a8191c68-9936-4806-a3a6-e930eddfd559');
INSERT INTO `tb_ref_role_permission` VALUES ('55e45dde-b727-4ff2-a4a9-948629033ab6', '004', 'cb04de33-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('56acb793-3a09-470e-8b06-6c6ec6f7b9c9', '002', 'cb04e2f9-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('5caaae4e-2646-48b6-b3a5-7b1798753f14', '001', 'b5676bd0-c813-425c-89db-cac87a964f63');
INSERT INTO `tb_ref_role_permission` VALUES ('5dccb158-ffe1-411a-a37e-1a9aeac58c61', '001', 'cb04ea0b-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('6199add4-0ac7-4461-a697-d9bb5c82d050', '003', '2ce2033e-9ba0-4148-902c-9c6bf8515a1c');
INSERT INTO `tb_ref_role_permission` VALUES ('62c282c3-7191-4048-a4b9-b8b8b0135f34', '001', '5aa661ec-b990-445b-b638-f636617ff934');
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
INSERT INTO `tb_ref_role_permission` VALUES ('77b5e993-a051-44e0-9642-3d7c9158ae30', '001', 'cb04dbdb-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('786a032b-7f91-47d2-93bf-215f692adbaf', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', '2d63bf15-42cd-4563-8e6b-c5efc9c7e287');
INSERT INTO `tb_ref_role_permission` VALUES ('7b1e1c09-15c1-413e-b864-bbba0a042a55', '004', '3afd2895-48ad-4c90-a44b-a1d37445acab');
INSERT INTO `tb_ref_role_permission` VALUES ('7e4b1941-a79b-4fab-8790-c53c170fa898', '001', 'cb04dfd1-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('7e59463f-a21a-4e74-9d5f-95f4512aa96e', '004', 'e9cd41ef-6920-49bf-a107-d396621ac721');
INSERT INTO `tb_ref_role_permission` VALUES ('810f522e-3e1c-4eca-8e16-2c4bce12dbf3', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'cb04de33-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('869244e9-d7b0-482b-98fe-9871e2e6102b', '003', 'd2749891-f1ad-42f8-8d52-68ceee734dcb');
INSERT INTO `tb_ref_role_permission` VALUES ('877640cb-7e15-4e0a-8356-6a93bf91c059', '005', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('88e5fe9a-734c-4787-9b1d-5d599bded6b5', '004', '9a349bdb-27c3-48e3-ab97-12c4049f7456');
INSERT INTO `tb_ref_role_permission` VALUES ('8a190de4-2714-47e6-9bb6-3694529c995e', '001', 'cb04e2f9-ec03-11e5-ac22-00163e002c89');
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
INSERT INTO `tb_ref_role_permission` VALUES ('9bbeb054-2c06-4e57-9932-3396b4cb5e5d', '001', 'cb04e485-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('9dd8b4ab-2e29-4f8c-9594-7dea4ef76d3c', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'de2e59c8-8057-43d6-af35-598cc14338a5');
INSERT INTO `tb_ref_role_permission` VALUES ('9e56cb2b-93ca-4a47-a1a1-b651ebd4fd47', '003', 'cb04ce4d-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('9fde62ae-d054-460c-8cee-9413be4dabe5', '001', '58432011-e153-4407-94c0-7c1b10915b42');
INSERT INTO `tb_ref_role_permission` VALUES ('a3ed90e8-cc78-4915-aa7a-56a7bb725059', '003', 'cb04d8af-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('a40f8d48-70ff-47de-a47c-a6c50e71f4fa', '003', 'cb04d8af-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('a521081b-d50e-48ca-a347-409ce0c65806', '004', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('a5c07fe2-d764-4134-bd58-f5f8f33a4e5d', '001', 'b2b4af64-cda0-4370-8d2f-b6579c33fcc0');
INSERT INTO `tb_ref_role_permission` VALUES ('a782ca45-4136-4cda-96de-cf3d3203e63e', '003', '4b8cd0e3-0237-4ba8-85c7-17188f672279');
INSERT INTO `tb_ref_role_permission` VALUES ('a7d32951-c531-4726-832e-5cf9dd2a6833', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', '8ca2302d-aacc-4635-bc14-8ea287f71dd2');
INSERT INTO `tb_ref_role_permission` VALUES ('aa05c5ae-1675-427e-914b-5132a0ce108e', '004', 'cb04d7de-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('aa281583-b4ce-4285-91d5-2839fe17b49c', '005', '115f3fd6-64c6-40ed-a750-ac87b0b36f74');
INSERT INTO `tb_ref_role_permission` VALUES ('aad80d4a-61e6-4bb9-af77-cf83658e5e91', '004', 'd7e2eb31-9c2d-417f-b7eb-9a9526a8e426');
INSERT INTO `tb_ref_role_permission` VALUES ('ab9dc477-ee59-47f1-9dfb-56f6139de164', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', 'deb062c3-7416-4c42-bef3-b4d975b3fddf');
INSERT INTO `tb_ref_role_permission` VALUES ('ad1c3b19-e657-434d-a361-3bd4ea333157', '002', 'cb04d3d4-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('ae74fe5b-cf89-4c9e-b097-2557b64ccbb3', '7f1748b1-7849-4b8b-a700-3ea6fb973a56', '4223de1b-092c-4534-9ad2-aea6eef22e1c');
INSERT INTO `tb_ref_role_permission` VALUES ('b7e220e6-c086-4dbb-82c2-a1e1b3019dc0', '003', '92441211-2fb6-4884-8aaf-5cb2709918ac');
INSERT INTO `tb_ref_role_permission` VALUES ('bac545b3-1334-414c-98f4-eafd4368d41f', '003', '6f21cd29-008f-45db-8a59-2de1602439ee');
INSERT INTO `tb_ref_role_permission` VALUES ('be59ce06-0090-408e-8226-7f9a0bf9473c', '004', 'cb04d49b-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('be8f4603-fca4-470b-aff3-bfa444204d1c', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'f0ed419f-3354-4299-b6ed-4b5afb713907');
INSERT INTO `tb_ref_role_permission` VALUES ('c200ebce-aeda-4230-8f08-fe3e97198e45', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'cb04e099-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c3d572e5-414e-46c8-84f8-31a80db74946', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'fc3d0362-259b-4f0d-b343-80992915ec46');
INSERT INTO `tb_ref_role_permission` VALUES ('c416c21a-69af-48ba-978c-5ad09969f19b', 'd82c0b29-4445-4d0d-98ae-9a7cd5683aa7', 'cb04e099-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c4f64a39-5a8a-46c6-9320-a4dc8303c5e8', '001', '0df95deb-2480-427b-8978-1009afc2200d');
INSERT INTO `tb_ref_role_permission` VALUES ('c52d193a-6111-41d2-ad86-7c85abdc583d', '003', 'cb04e54c-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c5a430d9-e210-4d8d-b115-8c79b966c543', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', 'cb04c7ef-ec03-11e5-ac22-00163e002c89');
INSERT INTO `tb_ref_role_permission` VALUES ('c5c26e05-1197-4719-ab29-336a2a858005', '003', '7ebb9183-c726-42a5-951d-090e1b176f17');
INSERT INTO `tb_ref_role_permission` VALUES ('c85c444b-84d4-4696-88ac-a5944ef13f7a', 'a8c1542c-fbfd-45ce-8360-345bc30b982a', 'd5ad6dec-a056-40b5-aa57-79f3b4205814');
INSERT INTO `tb_ref_role_permission` VALUES ('ca8e1ee5-55d0-4157-af68-14a783d22ac0', '441e0d3a-da85-4aa4-86a1-8b12ffefcf4e', '3496ede0-c4d0-4c2e-9544-d8ef9271ec61');
INSERT INTO `tb_ref_role_permission` VALUES ('cda8c5e6-9fc1-4cc9-83c8-52d5f53aac34', '004', '3496ede0-c4d0-4c2e-9544-d8ef9271ec61');
INSERT INTO `tb_ref_role_permission` VALUES ('cf6812be-e318-447e-9384-a45b81bdf58f', '001', '36a1627e-cf95-440c-9cf2-99b821451048');
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
INSERT INTO `tb_sys_menu_info` VALUES ('2c2833b5-a355-44a7-8fe6-73f9abc1b562', '活动管理', '2', null, '/jsp/acitivtymgr/activity/activity_list.jsp', 'rightFrame', 'ACTIVITY_MGR', 'f2bca1d7-ee6d-499b-8f64-beeeba435068', '0', '2', '');
INSERT INTO `tb_sys_menu_info` VALUES ('488042bf-e135-4ab9-a66e-4a164a6686c7', '问题管理', '1', null, '', 'rightFrame', 'FAQ_MGR_MODUEL', '', '0', '4', '');
INSERT INTO `tb_sys_menu_info` VALUES ('6d187ca7-5ba6-49a3-b84b-e55069c6a542', '扩展配置', '2', null, '/jsp/sysextmgr/extconfig/extconfig_list.jsp', 'rightFrame', 'EXT_CONFIG_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', '0', '8', '');
INSERT INTO `tb_sys_menu_info` VALUES ('6f18336a-2e9c-4992-8e72-a685ac42944f', '消息管理', '2', null, '/jsp/messagemgr/msginfo/msginfo_list.jsp', 'rightFrame', 'MESSAGE_MGR', 'a83f17e9-4633-4104-978e-f7f6bf6f661f', '0', '2', '');
INSERT INTO `tb_sys_menu_info` VALUES ('89db3662-50a4-460a-81c8-5874386c4555', '菜单管理', '2', null, '/jsp/sysextmgr/menu/menu_list.jsp', 'rightFrame', 'MENU_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '4', '');
INSERT INTO `tb_sys_menu_info` VALUES ('a83f17e9-4633-4104-978e-f7f6bf6f661f', '信息管理', '1', null, '', 'rightFrame', 'MESSAGE_MGR_MODUEL', '', '0', '3', '');
INSERT INTO `tb_sys_menu_info` VALUES ('aaf8d759-3bb7-4798-91d1-acfaca2a2600', '角色管理', '2', null, '/jsp/sysextmgr/role/role_list.jsp', 'rightFrame', 'ROLE_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '2', '');
INSERT INTO `tb_sys_menu_info` VALUES ('c0c5550b-333e-41c9-8bae-a0e0dec63c29', '字典管理', '2', null, '/jsp/sysextmgr/dictionary/dictionary_list.jsp', 'rightFrame', 'DICT_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '5', null);
INSERT INTO `tb_sys_menu_info` VALUES ('c6a62b1d-2fc2-4b6b-89bb-71014d523cb5', '用户管理', '2', null, '/jsp/sysextmgr/usermanage/usermanage_list.jsp', 'rightFrame', 'USER_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '1', '');
INSERT INTO `tb_sys_menu_info` VALUES ('caf9208f-d24c-4eb1-b7c0-0001c6ed8cc4', '活动结果', '2', null, '/jsp/acitivtymgr/activityquery/activityquery_list.jsp', 'rightFrame', 'ACTIVITYQUERY_MGR', 'f2bca1d7-ee6d-499b-8f64-beeeba435068', '0', '3', '');
INSERT INTO `tb_sys_menu_info` VALUES ('cd595f89-ddee-42ca-9765-4ff66eb2338d', '权限管理', '2', null, '/jsp/sysextmgr/permission/permission_list.jsp', 'rightFrame', 'PERMISSON_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', '0', '3', '');
INSERT INTO `tb_sys_menu_info` VALUES ('ce49c6dc-3cbd-4b90-a560-609d6aeb6c7d', '问题管理', '2', null, '/jsp/faqinfomgr/faqinfomgr/faqinfomgr_list.jsp', 'rightFrame', 'FAQ_MGR', '488042bf-e135-4ab9-a66e-4a164a6686c7', '0', '1', '');
INSERT INTO `tb_sys_menu_info` VALUES ('ce827f05-a8d4-479c-a111-af96578a5fd9', '团员管理', '2', null, '/jsp/acitivtymgr/member/member_list.jsp', 'rightFrame', 'MEMBER_MGR', 'f2bca1d7-ee6d-499b-8f64-beeeba435068', '0', '1', '');
INSERT INTO `tb_sys_menu_info` VALUES ('d0c8a943-93d9-449c-ad89-cff82d4a9103', '系统管理', '1', '/staticres/images/xitong.png', '', 'rightFrame', 'SYS_MGR_MODUEL', '', null, '1', '');
INSERT INTO `tb_sys_menu_info` VALUES ('d10127f4-80c7-4188-a850-56434db1c06d', '日志管理', '2', null, '/jsp/sysextmgr/operationlog/operationlog_list.jsp', 'rightFrame', 'LOG_MGR', 'd0c8a943-93d9-449c-ad89-cff82d4a9103', null, '6', '');
INSERT INTO `tb_sys_menu_info` VALUES ('f1348bbc-8909-4838-acaf-447427603376', '通知管理', '2', null, '/jsp/messagemgr/notice/notice_list.jsp', 'rightFrame', 'NOTICE_MGR', 'a83f17e9-4633-4104-978e-f7f6bf6f661f', '0', '1', '');
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
INSERT INTO `tb_sys_permission` VALUES ('09712813-2614-4f1d-b118-5b7492d68c9d', 'FAQ_MGR_MODUEL', '问题管理', '问题管理', 'FAQ_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('0df95deb-2480-427b-8978-1009afc2200d', 'ACTIVITYQUERY_MGR', '活动结果', '五四活动管理', 'ACTIVITY_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('254a2f56-2c9f-46f7-9a84-5797c9dc41c0', 'PERMISSON_MGR', '权限管理', '系统管理', 'SYS_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('2cc42a8c-cabe-45d3-ac75-00f8c4218675', 'PARAMETERCONFIGURATION_LIST', '参数配置', '系统管理', 'SYS_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('36a1627e-cf95-440c-9cf2-99b821451048', 'SYS_MGR_MODUEL', '系统管理', '系统管理', 'SYS_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('58432011-e153-4407-94c0-7c1b10915b42', 'MESSAGE_MGR', '消息管理', '信息管理', 'MESSAGE_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('5aa661ec-b990-445b-b638-f636617ff934', 'MEMBER_MGR', '团员管理', '五四活动管理', 'ACTIVITY_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('766382c8-c3d1-4ad3-955d-d0d3b9acecc6', 'MESSAGE_MGR_MODUEL', '信息管理', '信息管理', 'MESSAGE_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('904a1caf-2941-400e-88c7-07c519091e83', 'EXT_CONFIG_MGR', '扩展配置', '系统管理', 'SYS_MGR_MODUEL', '1', null, null);
INSERT INTO `tb_sys_permission` VALUES ('a4bee7d4-5304-42a6-8787-409e67c468cd', 'ACTIVITY_MGR', '活动管理', '五四活动管理', 'ACTIVITY_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('ab0175ef-0271-4b70-90c3-08c3ce6ba045', 'NOTICE_MGR', '通知管理', '信息管理', 'MESSAGE_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('b2b4af64-cda0-4370-8d2f-b6579c33fcc0', 'FAQ_MGR_MODUEL', '问题管理', '问题管理', 'FAQ_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('b5676bd0-c813-425c-89db-cac87a964f63', 'ACTIVITY_MGR_MODUEL', '五四活动管理', '五四活动管理', 'ACTIVITY_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('be8f7b3f-fc09-4f1f-b50d-15e858f0de88', 'FAQ_MGR', '问题管理', '问题管理', 'FAQ_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('cb04d3d4-ec03-11e5-ac22-00163e002c89', 'MENU_MGR', '菜单管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04dbdb-ec03-11e5-ac22-00163e002c89', 'ROLE_MGR', '角色管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04dfd1-ec03-11e5-ac22-00163e002c89', 'DICT_MGR', '字典管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04e2f9-ec03-11e5-ac22-00163e002c89', 'USER_MGR', '用户管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04e485-ec03-11e5-ac22-00163e002c89', 'LOG_MGR', '日志管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('cb04ea0b-ec03-11e5-ac22-00163e002c89', 'PERMISSON_MGR', '权限管理', '系统管理', 'SYS_MGR_MODUEL', '1', null, '2016-03-17 13:47:53');
INSERT INTO `tb_sys_permission` VALUES ('de0fc718-e2c1-44c5-833d-b4347b415d4b', 'FAQ_MGR', '问题管理', '问题管理', 'FAQ_MGR_MODUEL', null, null, null);
INSERT INTO `tb_sys_permission` VALUES ('df1edb40-366e-4f43-b8b9-155112a26390', 'FAQ_MGR', '问题管理', '问题管理', 'FAQ_MGR_MODUEL', null, null, null);

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
INSERT INTO `tb_sys_usr_info` VALUES ('001', null, null, null, 'admin', 'admin', '098f6bcd4621d373cade4e832627b4f6', '1', '2017-04-07 14:43:31', '2130706433', '2017-04-07 15:45:25', '2130706433', null, '2015-10-10 16:52:12', null, null, '2015-10-19 15:59:07', '001', 'admin', null, null, '0', null);

-- ----------------------------
-- View structure for view_user_permission
-- ----------------------------
DROP VIEW IF EXISTS `view_user_permission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_user_permission` AS select `usr`.`ACCOUNT` AS `USERNAME`,`per`.`PERMISSION_CODE` AS `ROLE` from ((((`tb_sys_usr_info` `usr` join `tb_ref_usr_role` `ref_ur` on((`usr`.`ID` = `ref_ur`.`USR_ID`))) join `tb_ref_role_permission` `ref_rp` on((`ref_rp`.`ROLE_ID` = `ref_ur`.`ROLE_ID`))) join `tb_sys_role_info` `role` on((`role`.`ID` = `ref_ur`.`ROLE_ID`))) join `tb_sys_permission` `per` on((`per`.`ID` = `ref_rp`.`PERMISSION_ID`))) where ((`usr`.`STATUS` = 1) and (`role`.`STATUS` = 1)) ;
