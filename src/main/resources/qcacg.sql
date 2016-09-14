/*
Navicat MySQL Data Transfer

Source Server         : qcacg
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : qcacg

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-09-14 19:48:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fin_account
-- ----------------------------
DROP TABLE IF EXISTS `fin_account`;
CREATE TABLE `fin_account` (
  `AccountId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `UserId` bigint(11) unsigned NOT NULL COMMENT '用户ID',
  `AccountStatus` enum('0','1') DEFAULT '1' COMMENT '账户状态',
  `CopperAccount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '青铜币余额',
  `SilverAccount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '白银币余额',
  `CashAccount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `Alipay` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `BankCard` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `RealName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  PRIMARY KEY (`AccountId`),
  KEY `AccountID` (`AccountId`) USING BTREE,
  KEY `fin_account_ibfk_1` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of fin_account
-- ----------------------------

-- ----------------------------
-- Table structure for fin_cashexpenses
-- ----------------------------
DROP TABLE IF EXISTS `fin_cashexpenses`;
CREATE TABLE `fin_cashexpenses` (
  `CashExpensesId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '账户支出ID',
  `AccountId` int(11) unsigned NOT NULL COMMENT '账户ID',
  `Alipay` varchar(255) DEFAULT NULL,
  `CashExpensesStatus` enum('0','1') DEFAULT '1',
  `CashExpensesDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CashExpensesMoney` decimal(15,2) unsigned DEFAULT NULL COMMENT '交易金额',
  `RealName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `CashExpensesRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`CashExpensesId`),
  KEY `fin_cashexpenses_ibfk_1` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fin_cashexpenses
-- ----------------------------

-- ----------------------------
-- Table structure for fin_cashincome
-- ----------------------------
DROP TABLE IF EXISTS `fin_cashincome`;
CREATE TABLE `fin_cashincome` (
  `CashIncomeId` int(11) NOT NULL COMMENT '账户收入ID',
  `AccountId` int(11) unsigned NOT NULL COMMENT '账户ID',
  `CashIncomeStatus` enum('0','1') DEFAULT '1' COMMENT '交易状态',
  `CashIncomeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `CashIncomeMoney` decimal(15,2) DEFAULT NULL COMMENT '交易金额',
  `CashIncomeRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`CashIncomeId`),
  KEY `AccountID` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fin_cashincome
-- ----------------------------

-- ----------------------------
-- Table structure for fin_copperexpenses
-- ----------------------------
DROP TABLE IF EXISTS `fin_copperexpenses`;
CREATE TABLE `fin_copperexpenses` (
  `CopperExpensesId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '青铜币交易ID',
  `AccountId` int(11) unsigned NOT NULL COMMENT '账户ID',
  `BookId` int(11) unsigned NOT NULL COMMENT '小说ID',
  `CopperExpensesDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '青铜币交易时间',
  `CopperExpensesMoney` int(11) unsigned DEFAULT NULL COMMENT '青铜币交易金额',
  `CopperExpensesRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `CopperExpensesStatus` enum('false','true') DEFAULT 'true',
  PRIMARY KEY (`CopperExpensesId`),
  KEY `AccountID` (`AccountId`),
  KEY `BookID` (`BookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fin_copperexpenses
-- ----------------------------

-- ----------------------------
-- Table structure for fin_copperincome
-- ----------------------------
DROP TABLE IF EXISTS `fin_copperincome`;
CREATE TABLE `fin_copperincome` (
  `CopperIncomeId` int(11) NOT NULL COMMENT '青铜币收入ID',
  `AccountId` int(11) unsigned NOT NULL COMMENT '账户ID',
  `CopperIncomeStatus` enum('0','1') DEFAULT '1' COMMENT '交易状态',
  `CopperIncomeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `CopperIncomeMoney` decimal(15,2) DEFAULT NULL COMMENT '交易金额',
  `CopperIncomeRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`CopperIncomeId`),
  KEY `AccountID` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fin_copperincome
-- ----------------------------

-- ----------------------------
-- Table structure for fin_silverexpenses
-- ----------------------------
DROP TABLE IF EXISTS `fin_silverexpenses`;
CREATE TABLE `fin_silverexpenses` (
  `SilverExpensesId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '白银币交易ID',
  `AccountId` int(11) unsigned NOT NULL COMMENT '账户ID',
  `BookId` int(11) unsigned NOT NULL COMMENT '小说ID',
  `SilverExpensesDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '白银币交易时间',
  `SilverExpensesMoney` int(11) unsigned DEFAULT NULL COMMENT '白银币交易金额',
  `SilverExpensesRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `SilverExpensesStatus` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`SilverExpensesId`),
  KEY `AccountID` (`AccountId`),
  KEY `BookID` (`BookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fin_silverexpenses
-- ----------------------------

-- ----------------------------
-- Table structure for fin_silverincome
-- ----------------------------
DROP TABLE IF EXISTS `fin_silverincome`;
CREATE TABLE `fin_silverincome` (
  `SilverIncomeId` int(11) NOT NULL COMMENT '白银收入ID',
  `AccountId` int(11) unsigned NOT NULL COMMENT '账户ID',
  `SilverIncomeStatus` enum('0','1') DEFAULT '1' COMMENT '交易状态',
  `SilverIncomeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `SilverIncomeMoney` int(11) DEFAULT NULL COMMENT '交易金额',
  `SilverIncomeRemark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`SilverIncomeId`),
  KEY `AccountID` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fin_silverincome
-- ----------------------------

-- ----------------------------
-- Table structure for inf_ad
-- ----------------------------
DROP TABLE IF EXISTS `inf_ad`;
CREATE TABLE `inf_ad` (
  `AdId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `AdName` varchar(255) DEFAULT NULL COMMENT '广告名称',
  `AdLinks` varchar(255) DEFAULT NULL COMMENT '广告链接',
  `AdPicture` varchar(255) DEFAULT NULL COMMENT '广告图片',
  PRIMARY KEY (`AdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_ad
-- ----------------------------

-- ----------------------------
-- Table structure for inf_columns
-- ----------------------------
DROP TABLE IF EXISTS `inf_columns`;
CREATE TABLE `inf_columns` (
  `ColumnsId` int(11) NOT NULL COMMENT '辅助栏目ID',
  `ColumnsName` varchar(255) DEFAULT NULL COMMENT '辅助栏目名称',
  `ColumnsContent` text COMMENT '辅助栏目内容',
  `ColumnsPicture` varchar(255) DEFAULT NULL COMMENT '辅助栏目图片',
  PRIMARY KEY (`ColumnsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_columns
-- ----------------------------

-- ----------------------------
-- Table structure for inf_comment
-- ----------------------------
DROP TABLE IF EXISTS `inf_comment`;
CREATE TABLE `inf_comment` (
  `CommentId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `UserId` int(11) NOT NULL COMMENT '用户ID',
  `BookId` int(11) NOT NULL COMMENT '小说ID',
  `Comment` text COMMENT '评论内容',
  `CommentPicture` varchar(255) DEFAULT NULL COMMENT '评论图片',
  `CommentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表时间',
  PRIMARY KEY (`CommentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_comment
-- ----------------------------

-- ----------------------------
-- Table structure for inf_contentcomment
-- ----------------------------
DROP TABLE IF EXISTS `inf_contentcomment`;
CREATE TABLE `inf_contentcomment` (
  `ContentCommentId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容评论ID',
  `UserId` int(11) NOT NULL COMMENT '用户ID',
  `ContentId` int(11) NOT NULL COMMENT '内容ID',
  `ContentComment` text COMMENT '评论内容',
  `ContentCommentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表时间',
  PRIMARY KEY (`ContentCommentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_contentcomment
-- ----------------------------

-- ----------------------------
-- Table structure for inf_links
-- ----------------------------
DROP TABLE IF EXISTS `inf_links`;
CREATE TABLE `inf_links` (
  `LinksId` int(11) NOT NULL,
  `LinksName` varchar(255) DEFAULT NULL COMMENT '友情链接名称',
  `Links` varchar(255) DEFAULT NULL COMMENT '友情链接',
  `LinksPicture` varchar(255) DEFAULT NULL COMMENT '友情链接图片',
  PRIMARY KEY (`LinksId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_links
-- ----------------------------

-- ----------------------------
-- Table structure for inf_officialannouncement
-- ----------------------------
DROP TABLE IF EXISTS `inf_officialannouncement`;
CREATE TABLE `inf_officialannouncement` (
  `OfficialAnnouncementId` int(11) NOT NULL,
  `OfficialAnnouncementTitle` varchar(255) DEFAULT NULL COMMENT '官方公告标题',
  `OfficialAnnouncementnContent` text COMMENT '官方公告内容',
  `OfficialAnnouncementPicture` varchar(255) DEFAULT NULL,
  `OfficialAnnouncementDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表时间',
  PRIMARY KEY (`OfficialAnnouncementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_officialannouncement
-- ----------------------------

-- ----------------------------
-- Table structure for inf_reply
-- ----------------------------
DROP TABLE IF EXISTS `inf_reply`;
CREATE TABLE `inf_reply` (
  `ReplyId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `UserId` int(11) NOT NULL COMMENT '用户ID',
  `CommentId` int(11) NOT NULL COMMENT '评论ID',
  `ReplyContent` text COMMENT '回复内容',
  `ReplyPicture` varchar(255) DEFAULT NULL COMMENT '回复图片',
  `ReplyDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表时间',
  PRIMARY KEY (`ReplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_reply
-- ----------------------------

-- ----------------------------
-- Table structure for inf_systeminformation
-- ----------------------------
DROP TABLE IF EXISTS `inf_systeminformation`;
CREATE TABLE `inf_systeminformation` (
  `SystemInformationId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统消息ID',
  `SystemInformationTitle` varchar(255) DEFAULT NULL COMMENT '系统消息标题',
  `SystemInformationContent` text,
  `SystemInformationPicture` varchar(255) DEFAULT NULL,
  `SystemInformationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表时间',
  PRIMARY KEY (`SystemInformationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_systeminformation
-- ----------------------------

-- ----------------------------
-- Table structure for sys_button
-- ----------------------------
DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `ButtonId` int(11) NOT NULL AUTO_INCREMENT COMMENT '按钮ID',
  `ButtonName` varchar(255) DEFAULT NULL COMMENT '按钮名称',
  `ButtonDescription` varchar(255) DEFAULT NULL COMMENT '按钮描述',
  `ButtonCode` varchar(255) DEFAULT NULL COMMENT '按钮代码',
  `ButtonUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '按钮更新时间',
  PRIMARY KEY (`ButtonId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_button
-- ----------------------------
INSERT INTO `sys_button` VALUES ('1', '新增', '<button onclick=\"addFun()\" class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-plus-square\"></i> 新增</button>', null, '2016-07-05 18:53:06');
INSERT INTO `sys_button` VALUES ('2', '编辑', '<button onclick=\"editFun()\" class=\"btn btn-success\" type=\"button\"><i class=\"fa fa-paste\"></i> 编辑</button>', null, '2016-07-05 18:53:43');
INSERT INTO `sys_button` VALUES ('3', '删除', '<button onclick=\"delFun()\" class=\"btn btn btn-danger\" type=\"button\"><i class=\"fa fa-remove\"></i> 删除</button>', null, '2016-07-05 18:53:52');
INSERT INTO `sys_button` VALUES ('4', '导出', '<button onclick=\"exportFun()\" class=\"btn btn-primary\" type=\"button\"><i class=\"fa fa-file-excel-o\"></i> 导出</button>', null, '2016-07-05 18:54:04');
INSERT INTO `sys_button` VALUES ('5', '分配权限', '<button onclick=\"distFun()\" class=\"btn btn-warning\" type=\"button\"><i class=\"fa fa-reorder\"></i> 分配权限</button>', null, '2016-07-05 18:54:15');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `LogId` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `UserName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `ResourcesName` varchar(255) DEFAULT NULL COMMENT '请求模块',
  `Methods` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL COMMENT '请求方法',
  `LogActionTime` varchar(255) DEFAULT NULL COMMENT '执行时间',
  `IP` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `LogDescription` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `LogUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日志更新时间',
  `ResourcesUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LogId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '15067171806', '用户管理', '查询用户', '执行成功!', '14', '0:0:0:0:0:0:0:1', null, '2016-06-15 15:31:10', null);
INSERT INTO `sys_log` VALUES ('2', '15067171806', '用户管理', '查询用户', '执行成功!', '3', '0:0:0:0:0:0:0:1', null, '2016-06-15 15:36:50', null);
INSERT INTO `sys_log` VALUES ('3', '15067171806', '用户管理', '查询用户', '执行成功!', '7', '0:0:0:0:0:0:0:1', null, '2016-06-15 18:32:51', null);
INSERT INTO `sys_log` VALUES ('4', '15067171806', '用户管理', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-05 15:01:19', null);
INSERT INTO `sys_log` VALUES ('5', '15067171806', '用户管理', '查询用户', '执行成功!', '20', '0:0:0:0:0:0:0:1', null, '2016-07-05 16:20:28', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('6', '15067171806', '用户管理', '查询用户', '执行成功!', '4', '0:0:0:0:0:0:0:1', null, '2016-07-05 16:21:39', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('7', '15067171806', '用户管理', '查询用户', '执行成功!', '17', '0:0:0:0:0:0:0:1', null, '2016-07-05 16:50:29', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('8', '15067171806', '用户管理', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-05 16:50:40', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('9', '15067171806', '用户管理', '查询用户', '执行成功!', '16', '0:0:0:0:0:0:0:1', null, '2016-07-05 17:11:44', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('10', '15067171806', '用户管理', '查询用户', '执行成功!', '10', '0:0:0:0:0:0:0:1', null, '2016-07-05 17:16:58', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('11', '15067171806', '用户管理', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-05 17:28:15', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('12', '15067171806', '用户管理', '查询用户', '执行成功!', '15', '0:0:0:0:0:0:0:1', null, '2016-07-05 18:29:24', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('13', '15067171806', '用户管理', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-05 18:29:43', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('14', '15067171806', '用户管理', '查询用户', '执行成功!', '15', '0:0:0:0:0:0:0:1', null, '2016-07-05 18:45:36', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('15', '15067171806', '用户管理', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-05 18:50:59', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('16', '15067171806', '用户管理', '查询用户', '执行成功!', '18', '0:0:0:0:0:0:0:1', null, '2016-07-05 19:15:12', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('17', '15067171806', '用户管理', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-05 19:15:37', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('18', '15067171806', '用户管理', '查询用户', '执行成功!', '5', '0:0:0:0:0:0:0:1', null, '2016-07-05 19:16:31', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('19', '15067171806', '用户管理', '查询用户', '执行成功!', '60517', '0:0:0:0:0:0:0:1', null, '2016-07-05 19:39:52', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('20', '15067171806', '用户管理', '查询用户', '执行成功!', '9', '0:0:0:0:0:0:0:1', null, '2016-07-05 19:40:15', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('21', '15067171806', '用户管理', '查询用户', '执行成功!', '4', '0:0:0:0:0:0:0:1', null, '2016-07-05 20:04:43', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('22', '15067171806', '用户管理', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-05 20:05:33', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('23', '15067171806', '用户管理', '查询用户', '执行成功!', '13', '0:0:0:0:0:0:0:1', null, '2016-07-05 20:12:26', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('24', '15067171806', '用户管理', '查询用户', '执行成功!', '8', '0:0:0:0:0:0:0:1', null, '2016-07-05 20:16:29', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('25', '15067171806', '用户管理', '查询用户', '执行成功!', '5', '0:0:0:0:0:0:0:1', null, '2016-07-05 20:39:33', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('26', '15067171806', '用户管理', '查询用户', '执行成功!', '374884', '0:0:0:0:0:0:0:1', null, '2016-07-05 20:51:41', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('27', '15067171806', '用户管理', '查询用户', '执行成功!', '3268', '0:0:0:0:0:0:0:1', null, '2016-07-05 20:51:53', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('28', '15067171806', 'null', '查询用户', '执行成功!', '3689', '0:0:0:0:0:0:0:1', null, '2016-07-05 21:10:03', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('29', '15067171806', 'null', '查询用户', '执行成功!', '12', '0:0:0:0:0:0:0:1', null, '2016-07-05 21:10:16', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('30', '15067171806', 'null', '查询用户', '执行成功!', '19', '0:0:0:0:0:0:0:1', null, '2016-07-06 10:13:54', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('31', '15067171806', 'null', '查询用户', '执行成功!', '9957', '0:0:0:0:0:0:0:1', null, '2016-07-06 10:39:45', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('32', '15067171806', 'null', '查询用户', '执行成功!', '21071', '0:0:0:0:0:0:0:1', null, '2016-07-06 10:40:34', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('33', '15067171806', 'null', '查询用户', '执行成功!', '1252345', '0:0:0:0:0:0:0:1', null, '2016-07-06 11:09:05', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('34', '15067171806', 'null', '查询用户', '执行成功!', '63347', '0:0:0:0:0:0:0:1', null, '2016-07-06 11:11:54', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('35', '15067171806', 'null', '查询用户', '执行成功!', '22', '0:0:0:0:0:0:0:1', null, '2016-07-06 11:25:31', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('36', '15067171806', 'null', '查询用户', '执行成功!', '88748', '0:0:0:0:0:0:0:1', null, '2016-07-06 11:55:27', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('37', '15067171806', 'null', '查询用户', '执行成功!', '6034', '0:0:0:0:0:0:0:1', null, '2016-07-06 11:58:40', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('38', '15067171806', 'null', '查询用户', '执行成功!', '161745', '0:0:0:0:0:0:0:1', null, '2016-07-06 12:04:31', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('39', '15067171806', 'null', '查询用户', '执行成功!', '16', '0:0:0:0:0:0:0:1', null, '2016-07-06 12:05:41', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('40', '15067171806', 'null', '查询用户', '执行成功!', '2594258', '0:0:0:0:0:0:0:1', null, '2016-07-06 13:31:36', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('41', '15067171806', 'null', '查询用户', '执行成功!', '4326', '0:0:0:0:0:0:0:1', null, '2016-07-06 13:36:17', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('42', '15067171806', 'null', '查询用户', '执行成功!', '237152', '0:0:0:0:0:0:0:1', null, '2016-07-06 13:54:00', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('43', '15067171806', 'null', '查询用户', '执行成功!', '1470', '0:0:0:0:0:0:0:1', null, '2016-07-06 13:55:37', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('44', '15067171806', 'null', '查询用户', '执行成功!', '540054', '0:0:0:0:0:0:0:1', null, '2016-07-06 14:21:41', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('45', '15067171806', 'null', '查询用户', '执行成功!', '1733', '0:0:0:0:0:0:0:1', null, '2016-07-06 14:21:48', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('46', '15067171806', 'null', '查询用户', '执行成功!', '14', '0:0:0:0:0:0:0:1', null, '2016-07-06 14:25:06', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('47', '15067171806', 'null', '查询用户', '执行成功!', '15', '0:0:0:0:0:0:0:1', null, '2016-07-06 14:45:33', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('48', '15067171806', 'null', '查询用户', '执行成功!', '11', '0:0:0:0:0:0:0:1', null, '2016-07-06 14:55:34', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('49', '15067171806', 'null', '查询用户', '执行成功!', '6', '0:0:0:0:0:0:0:1', null, '2016-07-06 14:55:50', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('50', '15067171806', 'null', '查询用户', '执行成功!', '8', '0:0:0:0:0:0:0:1', null, '2016-07-06 15:04:44', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('51', '15067171806', 'null', '查询用户', '执行成功!', '9', '0:0:0:0:0:0:0:1', null, '2016-07-06 15:09:07', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('52', '15067171806', 'null', '查询用户', '执行成功!', '8', '0:0:0:0:0:0:0:1', null, '2016-07-06 15:14:06', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('53', '15067171806', 'null', '查询用户', '执行成功!', '5', '0:0:0:0:0:0:0:1', null, '2016-07-06 15:19:16', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('54', '15067171806', 'null', '查询用户', '执行成功!', '7', '0:0:0:0:0:0:0:1', null, '2016-07-06 15:19:19', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('55', '15067171806', 'null', '查询用户', '执行成功!', '7', '0:0:0:0:0:0:0:1', null, '2016-07-06 15:21:09', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('56', '15067171806', 'null', '查询用户', '执行成功!', '13', '0:0:0:0:0:0:0:1', null, '2016-07-06 15:31:50', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('57', '15067171806', '用户管理', '查询用户', '执行成功!', '26', '0:0:0:0:0:0:0:1', null, '2016-07-06 20:01:59', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('58', '15067171806', '用户管理', '查询用户', '执行成功!', '5', '0:0:0:0:0:0:0:1', null, '2016-07-06 20:08:08', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('59', '15067171806', 'null', '查询用户', '执行成功!', '40', '0:0:0:0:0:0:0:1', null, '2016-07-15 13:01:30', '/user/list.shtml');
INSERT INTO `sys_log` VALUES ('60', '15067171806', 'null', '查询用户', '执行成功!', '62', '0:0:0:0:0:0:0:1', null, '2016-07-22 18:42:48', '/user/list.shtml');

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `ResourcesId` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `ResourcesName` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `ResourcesDescription` varchar(255) DEFAULT NULL COMMENT '模块描述',
  `ResourcesUrl` varchar(255) DEFAULT NULL COMMENT '请求URL地址',
  `ParentResourcesId` int(11) DEFAULT NULL COMMENT '上级模块',
  `ResourcesLevel` varchar(255) DEFAULT NULL COMMENT '等级,根据此排序',
  `ResourcesOrder` int(11) DEFAULT NULL COMMENT '模块序号',
  `ResourcesSort` varchar(255) DEFAULT NULL COMMENT '模块排序',
  `ResourcesType` varchar(255) DEFAULT NULL COMMENT '模块类型',
  `ResourcesView` varchar(255) DEFAULT NULL COMMENT '模块图标',
  `ResourcesUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '模块更新时间',
  PRIMARY KEY (`ResourcesId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '系统管理', '系统管理', null, '0', '1', '1', ',1,', '0', 'fa fa-home', '2016-06-14 15:33:03');
INSERT INTO `sys_resources` VALUES ('2', '用户管理', '用户管理', '/user/list.shtml', '1', '2', '1', ',1,2,', '1', null, '2016-06-14 15:34:45');
INSERT INTO `sys_resources` VALUES ('3', '角色管理', '角色管理', '/role/list.shtml', '1', '3', '1', ',1,3,', '1', null, '2016-06-14 15:35:54');
INSERT INTO `sys_resources` VALUES ('4', '菜单管理', '菜单管理', '/resources/list.shtml', '1', '4', '1', ',1,4,', '1', null, '2016-06-14 15:36:36');
INSERT INTO `sys_resources` VALUES ('5', '按钮管理', '按钮管理', '/buttom/list.shtml', '1', '5', '1', ',1,5,', '1', null, '2016-06-14 15:37:07');
INSERT INTO `sys_resources` VALUES ('6', '日志管理', '日志管理', null, '0', '1', '1', ',6,', '0', 'fa fa-home', '2016-07-06 11:23:52');
INSERT INTO `sys_resources` VALUES ('7', '登陆日志', '登陆日志', '/log/list.shtml', '6', '2', '1', ',6,7,', '1', null, '2016-07-06 11:23:55');
INSERT INTO `sys_resources` VALUES ('8', '添加用户', '<button onclick=\"addUser()\" class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-plus-square\"></i> 新增</button>', null, '2', '1', '2', ',1,2,8,', '2', null, '2016-06-14 17:14:52');
INSERT INTO `sys_resources` VALUES ('9', '编辑用户', '<button onclick=\"editUser()\" class=\"btn btn-success\" type=\"button\"><i class=\"fa fa-paste\"></i> 编辑</button>', null, '2', '2', '2', ',1,2,9,', '2', null, '2016-06-14 17:14:59');
INSERT INTO `sys_resources` VALUES ('10', '删除用户', '<button onclick=\"delUser()\" class=\"btn btn-danger\" type=\"button\"><i class=\"fa fa-remove\"></i> 删除</button>', null, '2', '3', '2', ',1,2,10,', '2', null, '2016-06-14 17:15:13');
INSERT INTO `sys_resources` VALUES ('11', '分配权限', '<button onclick=\"userPermissions()\" class=\"btn btn-warning\" type=\"button\"><i class=\"fa fa-reorder\"></i> 分配权限</button>', null, '2', '4', '2', ',1,2,11,', '2', null, '2016-06-14 17:15:28');
INSERT INTO `sys_resources` VALUES ('12', '添加角色', '<button onclick=\"addRole()\" class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-plus-square\"></i> 新增</button>', null, '3', '1', '2', ',1,3,12,', '2', null, '2016-06-14 17:15:35');
INSERT INTO `sys_resources` VALUES ('13', '编辑角色', '<button onclick=\"editRole()\" class=\"btn btn-success\" type=\"button\"><i class=\"fa fa-paste\"></i> 编辑</button>', null, '3', '2', '2', ',1,3,13,', '2', null, '2016-06-14 17:15:41');
INSERT INTO `sys_resources` VALUES ('14', '删除角色', '<button onclick=\"delRole()\" class=\"btn btn-danger\" type=\"button\"><i class=\"fa fa-remove\"></i> 删除</button>', null, '3', '3', '2', ',1,3,14,', '2', null, '2016-06-14 17:15:47');
INSERT INTO `sys_resources` VALUES ('15', '分配权限', '<button onclick=\"rolePermissions()\" class=\"btn btn-warning\" type=\"button\"><i class=\"fa fa-reorder\"></i> 分配权限</button>', null, '3', '4', '2', ',1,3,15,', '2', null, '2016-06-14 17:16:00');
INSERT INTO `sys_resources` VALUES ('16', '系统监管', '系统监管', null, '0', '1', '1', ',16,', '0', 'fa fa-columns icon', '2016-06-14 17:13:03');
INSERT INTO `sys_resources` VALUES ('17', '实时监控', '实时监控', '/sys/monitor.shtml', '16', '2', '1', ',16,17,', '1', null, '2016-06-14 17:14:00');
INSERT INTO `sys_resources` VALUES ('18', '告警列表', '告警列表', '/sys/list.shtml', '16', '3', '1', ',16,18,', '1', null, '2016-06-14 17:14:41');
INSERT INTO `sys_resources` VALUES ('19', '个人信息', '个人信息', '/user/info.shtml', '0', '1', '1', ',19,', '0', 'fa fa-home', '2016-07-13 14:44:47');
INSERT INTO `sys_resources` VALUES ('20', '我的投稿', '我的投稿', '/book/list.shtml', '0', '1', '1', ',20,', '0', 'fa fa-columns icon', '2016-07-13 14:46:49');
INSERT INTO `sys_resources` VALUES ('21', '我的书架', '我的书架', '', '0', '1', '1', ',21,', '0', 'fa fa-columns icon', '2016-07-13 15:13:46');

-- ----------------------------
-- Table structure for sys_resources_button
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources_button`;
CREATE TABLE `sys_resources_button` (
  `ResourcesId` int(11) NOT NULL COMMENT '模块ID',
  `ButtonId` int(11) NOT NULL COMMENT '按钮ID',
  PRIMARY KEY (`ResourcesId`,`ButtonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resources_button
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ParentRole` varchar(255) DEFAULT NULL COMMENT '上级角色',
  `RoleName` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `RoleDescription` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `RoleStatus` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '0', '超级管理员', '超级管理员权限', '1');
INSERT INTO `sys_role` VALUES ('2', '1', '管理员', '管理员权限', '1');
INSERT INTO `sys_role` VALUES ('3', '2', '普通会员', '普通会员权限', '1');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `RoleId` int(11) NOT NULL COMMENT '角色ID',
  `ResourcesId` int(11) NOT NULL COMMENT '模块ID',
  PRIMARY KEY (`RoleId`,`ResourcesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES ('1', '1');
INSERT INTO `sys_role_resources` VALUES ('1', '2');
INSERT INTO `sys_role_resources` VALUES ('1', '3');
INSERT INTO `sys_role_resources` VALUES ('1', '4');
INSERT INTO `sys_role_resources` VALUES ('1', '5');
INSERT INTO `sys_role_resources` VALUES ('1', '6');
INSERT INTO `sys_role_resources` VALUES ('1', '7');
INSERT INTO `sys_role_resources` VALUES ('1', '8');
INSERT INTO `sys_role_resources` VALUES ('1', '9');
INSERT INTO `sys_role_resources` VALUES ('1', '10');
INSERT INTO `sys_role_resources` VALUES ('1', '11');
INSERT INTO `sys_role_resources` VALUES ('1', '12');
INSERT INTO `sys_role_resources` VALUES ('1', '13');
INSERT INTO `sys_role_resources` VALUES ('1', '14');
INSERT INTO `sys_role_resources` VALUES ('1', '15');
INSERT INTO `sys_role_resources` VALUES ('1', '17');
INSERT INTO `sys_role_resources` VALUES ('1', '18');

-- ----------------------------
-- Table structure for sys_server
-- ----------------------------
DROP TABLE IF EXISTS `sys_server`;
CREATE TABLE `sys_server` (
  `ServerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务器ID',
  `CpuUsage` varchar(255) DEFAULT NULL COMMENT 'CUP使用率',
  `setCpuUsage` varchar(255) DEFAULT NULL COMMENT '设置CPU使用率',
  `JvmUsage` varchar(255) DEFAULT NULL COMMENT 'JVM使用率',
  `setJvmUsage` varchar(255) DEFAULT NULL COMMENT '设置JVM使用率',
  `RamUsage` varchar(255) DEFAULT NULL COMMENT 'RAM使用率',
  `setRamUsage` varchar(255) DEFAULT NULL COMMENT '设置RAM使用率',
  `ServerUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '服务器更新时间',
  `ServerMark` varchar(255) DEFAULT NULL COMMENT '服务器记录',
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ServerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5097 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_server
-- ----------------------------
INSERT INTO `sys_server` VALUES ('1', '9', '90', '62', '90', '95', '90', '2016-06-14 10:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2', '13', '90', '63', '90', '94', '90', '2016-06-14 10:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3', '5', '90', '73', '90', '93', '90', '2016-06-14 10:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4', '14', '90', '49', '90', '94', '90', '2016-06-14 10:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5', '12', '90', '51', '90', '91', '90', '2016-06-14 11:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('6', '10', '90', '53', '90', '91', '90', '2016-06-14 11:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('7', '3', '90', '53', '90', '91', '90', '2016-06-14 11:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('8', '2', '90', '54', '90', '91', '90', '2016-06-14 11:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('9', '3', '90', '54', '90', '91', '90', '2016-06-14 11:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('10', '4', '90', '55', '90', '91', '90', '2016-06-14 11:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('11', '18', '90', '55', '90', '92', '90', '2016-06-14 11:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('12', '4', '90', '65', '90', '94', '90', '2016-06-14 11:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('13', '18', '90', '68', '90', '94', '90', '2016-06-14 11:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('14', '15', '90', '68', '90', '98', '90', '2016-06-14 11:47:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('15', '24', '90', '68', '90', '98', '90', '2016-06-14 11:48:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('16', '19', '90', '69', '90', '97', '90', '2016-06-14 11:49:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('17', '23', '90', '69', '90', '94', '90', '2016-06-14 11:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('18', '12', '90', '69', '90', '95', '90', '2016-06-14 11:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('19', '16', '90', '70', '90', '94', '90', '2016-06-14 11:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('20', '21', '90', '70', '90', '92', '90', '2016-06-14 11:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('21', '15', '90', '70', '90', '95', '90', '2016-06-14 11:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('22', '17', '90', '71', '90', '96', '90', '2016-06-14 11:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('23', '22', '90', '71', '90', '92', '90', '2016-06-14 11:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('24', '6', '90', '71', '90', '92', '90', '2016-06-14 11:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('25', '28', '90', '71', '90', '93', '90', '2016-06-14 11:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('26', '23', '90', '72', '90', '93', '90', '2016-06-14 12:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('27', '2', '90', '72', '90', '93', '90', '2016-06-14 12:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('28', '0', '90', '72', '90', '92', '90', '2016-06-14 12:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('29', '9', '90', '73', '90', '92', '90', '2016-06-14 12:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('30', '6', '90', '73', '90', '93', '90', '2016-06-14 12:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('31', '26', '90', '81', '90', '91', '90', '2016-06-14 12:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('32', '12', '90', '81', '90', '92', '90', '2016-06-14 12:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('33', '27', '90', '81', '90', '91', '90', '2016-06-14 12:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('34', '25', '90', '82', '90', '91', '90', '2016-06-14 12:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('35', '33', '90', '82', '90', '93', '90', '2016-06-14 12:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('36', '28', '90', '82', '90', '95', '90', '2016-06-14 12:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('37', '55', '90', '82', '90', '94', '90', '2016-06-14 12:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('38', '6', '90', '83', '90', '97', '90', '2016-06-14 12:54:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('39', '66', '90', '83', '90', '94', '90', '2016-06-14 12:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('40', '67', '90', '83', '90', '94', '90', '2016-06-14 12:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('41', '68', '90', '84', '90', '95', '90', '2016-06-14 12:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('42', '42', '90', '84', '90', '96', '90', '2016-06-14 12:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('43', '63', '90', '84', '90', '96', '90', '2016-06-14 12:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('44', '60', '90', '84', '90', '98', '90', '2016-06-14 13:00:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('45', '76', '90', '85', '90', '99', '90', '2016-06-14 13:01:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('46', '58', '90', '85', '90', '95', '90', '2016-06-14 13:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('47', '63', '90', '85', '90', '95', '90', '2016-06-14 13:03:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('48', '66', '90', '85', '90', '96', '90', '2016-06-14 13:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('49', '64', '90', '86', '90', '93', '90', '2016-06-14 13:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('50', '2', '90', '86', '90', '94', '90', '2016-06-14 13:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('51', '5', '90', '86', '90', '94', '90', '2016-06-14 13:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('52', '2', '90', '59', '90', '94', '90', '2016-06-14 13:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('53', '5', '90', '59', '90', '94', '90', '2016-06-14 13:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('54', '4', '90', '59', '90', '94', '90', '2016-06-14 13:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('55', '5', '90', '59', '90', '94', '90', '2016-06-14 13:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('56', '6', '90', '60', '90', '94', '90', '2016-06-14 13:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('57', '2', '90', '60', '90', '93', '90', '2016-06-14 13:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('58', '9', '90', '74', '90', '91', '90', '2016-06-14 15:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('59', '8', '90', '51', '90', '91', '90', '2016-06-14 15:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('60', '15', '90', '52', '90', '91', '90', '2016-06-14 15:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('61', '0', '90', '52', '90', '92', '90', '2016-06-14 15:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('62', '6', '90', '52', '90', '92', '90', '2016-06-14 15:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('63', '1', '90', '52', '90', '92', '90', '2016-06-14 15:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('64', '0', '90', '53', '90', '92', '90', '2016-06-14 15:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('65', '2', '90', '53', '90', '93', '90', '2016-06-14 15:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('66', '0', '90', '53', '90', '93', '90', '2016-06-14 15:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('67', '15', '90', '53', '90', '92', '90', '2016-06-14 15:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('68', '11', '90', '54', '90', '93', '90', '2016-06-14 15:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('69', '12', '90', '54', '90', '93', '90', '2016-06-14 15:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('70', '2', '90', '54', '90', '91', '90', '2016-06-14 15:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('71', '15', '90', '54', '90', '91', '90', '2016-06-14 15:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('72', '14', '90', '55', '90', '91', '90', '2016-06-14 15:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('73', '5', '90', '55', '90', '92', '90', '2016-06-14 15:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('74', '2', '90', '55', '90', '93', '90', '2016-06-14 15:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('75', '0', '90', '56', '90', '92', '90', '2016-06-14 15:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('76', '6', '90', '56', '90', '92', '90', '2016-06-14 15:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('77', '2', '90', '75', '90', '93', '90', '2016-06-14 15:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('78', '10', '90', '52', '90', '93', '90', '2016-06-14 15:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('79', '3', '90', '52', '90', '93', '90', '2016-06-14 15:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('80', '39', '90', '52', '90', '93', '90', '2016-06-14 15:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('81', '1', '90', '53', '90', '92', '90', '2016-06-14 15:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('82', '10', '90', '53', '90', '92', '90', '2016-06-14 15:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('83', '1', '90', '53', '90', '92', '90', '2016-06-14 15:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('84', '4', '90', '54', '90', '92', '90', '2016-06-14 15:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('85', '10', '90', '54', '90', '94', '90', '2016-06-14 15:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('86', '4', '90', '66', '90', '94', '90', '2016-06-14 15:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('87', '1', '90', '70', '90', '94', '90', '2016-06-14 15:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('88', '3', '90', '71', '90', '92', '90', '2016-06-14 15:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('89', '3', '90', '71', '90', '92', '90', '2016-06-14 15:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('90', '16', '90', '71', '90', '92', '90', '2016-06-14 15:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('91', '15', '90', '72', '90', '92', '90', '2016-06-14 15:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('92', '7', '90', '72', '90', '92', '90', '2016-06-14 15:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('93', '1', '90', '82', '90', '93', '90', '2016-06-14 15:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('94', '8', '90', '69', '90', '93', '90', '2016-06-14 15:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('95', '2', '90', '71', '90', '93', '90', '2016-06-14 15:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('96', '2', '90', '71', '90', '93', '90', '2016-06-14 15:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('97', '5', '90', '71', '90', '94', '90', '2016-06-14 15:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('98', '13', '90', '72', '90', '93', '90', '2016-06-14 15:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('99', '5', '90', '72', '90', '93', '90', '2016-06-14 15:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('100', '29', '90', '72', '90', '96', '90', '2016-06-14 15:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('101', '6', '90', '87', '90', '95', '90', '2016-06-14 15:56:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('102', '3', '90', '84', '90', '95', '90', '2016-06-14 15:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('103', '2', '90', '84', '90', '94', '90', '2016-06-14 15:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('104', '10', '90', '87', '90', '91', '90', '2016-06-14 16:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('105', '9', '90', '88', '90', '91', '90', '2016-06-14 16:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('106', '7', '90', '89', '90', '93', '90', '2016-06-14 17:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('107', '4', '90', '71', '90', '92', '90', '2016-06-14 17:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('108', '2', '90', '84', '90', '92', '90', '2016-06-14 17:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('109', '30', '90', '88', '90', '92', '90', '2016-06-14 17:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('110', '13', '90', '63', '90', '91', '90', '2016-06-14 17:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('111', '5', '90', '65', '90', '91', '90', '2016-06-14 17:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('112', '24', '90', '68', '90', '92', '90', '2016-06-14 17:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('113', '7', '90', '70', '90', '92', '90', '2016-06-14 17:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('114', '8', '90', '72', '90', '93', '90', '2016-06-14 17:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('115', '5', '90', '75', '90', '92', '90', '2016-06-14 17:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('116', '10', '90', '77', '90', '92', '90', '2016-06-14 17:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('117', '11', '90', '79', '90', '92', '90', '2016-06-14 17:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('118', '6', '90', '82', '90', '92', '90', '2016-06-14 17:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('119', '4', '90', '69', '90', '91', '90', '2016-06-14 17:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('120', '16', '90', '46', '90', '91', '90', '2016-06-14 17:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('121', '0', '90', '46', '90', '91', '90', '2016-06-14 17:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('122', '0', '90', '46', '90', '91', '90', '2016-06-14 17:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('123', '1', '90', '47', '90', '91', '90', '2016-06-14 17:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('124', '4', '90', '47', '90', '91', '90', '2016-06-14 17:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('125', '2', '90', '47', '90', '91', '90', '2016-06-14 17:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('126', '5', '90', '49', '90', '91', '90', '2016-06-14 17:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('127', '2', '90', '50', '90', '91', '90', '2016-06-14 18:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('128', '1', '90', '50', '90', '91', '90', '2016-06-14 18:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('129', '1', '90', '50', '90', '91', '90', '2016-06-14 18:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('130', '4', '90', '50', '90', '91', '90', '2016-06-14 18:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('131', '2', '90', '51', '90', '91', '90', '2016-06-14 18:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('132', '0', '90', '51', '90', '91', '90', '2016-06-14 18:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('133', '3', '90', '51', '90', '91', '90', '2016-06-14 18:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('134', '6', '90', '52', '90', '91', '90', '2016-06-14 18:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('135', '0', '90', '52', '90', '91', '90', '2016-06-14 18:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('136', '1', '90', '52', '90', '91', '90', '2016-06-14 18:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('137', '2', '90', '52', '90', '91', '90', '2016-06-14 18:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('138', '1', '90', '52', '90', '91', '90', '2016-06-14 18:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('139', '3', '90', '53', '90', '91', '90', '2016-06-14 18:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('140', '2', '90', '53', '90', '91', '90', '2016-06-14 18:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('141', '5', '90', '53', '90', '91', '90', '2016-06-14 18:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('142', '1', '90', '53', '90', '93', '90', '2016-06-14 18:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('143', '14', '90', '54', '90', '93', '90', '2016-06-14 18:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('144', '2', '90', '54', '90', '93', '90', '2016-06-14 18:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('145', '1', '90', '54', '90', '93', '90', '2016-06-14 18:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('146', '0', '90', '54', '90', '93', '90', '2016-06-14 18:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('147', '17', '90', '54', '90', '93', '90', '2016-06-14 18:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('148', '2', '90', '55', '90', '93', '90', '2016-06-14 18:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('149', '7', '90', '55', '90', '93', '90', '2016-06-14 18:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('150', '13', '90', '55', '90', '94', '90', '2016-06-14 18:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('151', '13', '90', '55', '90', '92', '90', '2016-06-14 18:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('152', '17', '90', '73', '90', '91', '90', '2016-06-15 14:25:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('153', '35', '90', '64', '90', '91', '90', '2016-06-15 14:27:06', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('154', '17', '90', '66', '90', '94', '90', '2016-06-15 14:30:38', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('155', '48', '90', '73', '90', '95', '90', '2016-06-15 14:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('156', '9', '90', '60', '90', '91', '90', '2016-06-15 14:32:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('157', '3', '90', '66', '90', '93', '90', '2016-06-15 15:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('158', '3', '90', '57', '90', '95', '90', '2016-06-15 15:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('159', '21', '90', '59', '90', '91', '90', '2016-06-15 15:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('160', '13', '90', '54', '90', '91', '90', '2016-06-15 15:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('161', '2', '90', '51', '90', '91', '90', '2016-06-15 15:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('162', '12', '90', '51', '90', '91', '90', '2016-06-15 15:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('163', '12', '90', '51', '90', '91', '90', '2016-06-15 15:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('164', '26', '90', '67', '90', '91', '90', '2016-06-15 15:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('165', '20', '90', '50', '90', '91', '90', '2016-06-15 15:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('166', '2', '90', '55', '90', '91', '90', '2016-06-15 15:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('167', '9', '90', '55', '90', '91', '90', '2016-06-15 15:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('168', '1', '90', '58', '90', '92', '90', '2016-06-15 15:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('169', '7', '90', '59', '90', '91', '90', '2016-06-15 15:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('170', '8', '90', '65', '90', '92', '90', '2016-06-15 15:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('171', '5', '90', '65', '90', '91', '90', '2016-06-15 15:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('172', '19', '90', '65', '90', '92', '90', '2016-06-15 15:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('173', '19', '90', '66', '90', '92', '90', '2016-06-15 15:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('174', '3', '90', '66', '90', '93', '90', '2016-06-15 15:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('175', '7', '90', '66', '90', '93', '90', '2016-06-15 15:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('176', '39', '90', '67', '90', '93', '90', '2016-06-15 15:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('177', '3', '90', '67', '90', '93', '90', '2016-06-15 15:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('178', '28', '90', '68', '90', '91', '90', '2016-06-15 15:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('179', '5', '90', '68', '90', '91', '90', '2016-06-15 15:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('180', '11', '90', '68', '90', '92', '90', '2016-06-15 15:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('181', '21', '90', '68', '90', '91', '90', '2016-06-15 15:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('182', '5', '90', '69', '90', '92', '90', '2016-06-15 15:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('183', '1', '90', '69', '90', '91', '90', '2016-06-15 15:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('184', '4', '90', '69', '90', '91', '90', '2016-06-15 15:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('185', '18', '90', '69', '90', '91', '90', '2016-06-15 15:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('186', '2', '90', '70', '90', '92', '90', '2016-06-15 16:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('187', '2', '90', '70', '90', '93', '90', '2016-06-15 16:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('188', '6', '90', '70', '90', '93', '90', '2016-06-15 16:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('189', '2', '90', '70', '90', '93', '90', '2016-06-15 16:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('190', '31', '90', '71', '90', '93', '90', '2016-06-15 16:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('191', '5', '90', '71', '90', '93', '90', '2016-06-15 16:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('192', '11', '90', '72', '90', '92', '90', '2016-06-15 16:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('193', '11', '90', '72', '90', '91', '90', '2016-06-15 16:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('194', '16', '90', '72', '90', '91', '90', '2016-06-15 16:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('195', '6', '90', '72', '90', '92', '90', '2016-06-15 16:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('196', '7', '90', '72', '90', '94', '90', '2016-06-15 16:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('197', '1', '90', '73', '90', '93', '90', '2016-06-15 16:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('198', '7', '90', '73', '90', '92', '90', '2016-06-15 16:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('199', '1', '90', '73', '90', '91', '90', '2016-06-15 16:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('200', '2', '90', '73', '90', '91', '90', '2016-06-15 16:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('201', '0', '90', '74', '90', '91', '90', '2016-06-15 16:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('202', '0', '90', '74', '90', '91', '90', '2016-06-15 16:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('203', '0', '90', '46', '90', '91', '90', '2016-06-15 16:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('204', '3', '90', '47', '90', '91', '90', '2016-06-15 16:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('205', '3', '90', '47', '90', '91', '90', '2016-06-15 16:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('206', '0', '90', '47', '90', '91', '90', '2016-06-15 16:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('207', '2', '90', '47', '90', '91', '90', '2016-06-15 16:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('208', '0', '90', '48', '90', '91', '90', '2016-06-15 16:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('209', '0', '90', '48', '90', '91', '90', '2016-06-15 16:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('210', '22', '90', '48', '90', '94', '90', '2016-06-15 16:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('211', '9', '90', '48', '90', '94', '90', '2016-06-15 16:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('212', '17', '90', '49', '90', '94', '90', '2016-06-15 16:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('213', '7', '90', '49', '90', '94', '90', '2016-06-15 16:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('214', '13', '90', '49', '90', '96', '90', '2016-06-15 16:31:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('215', '13', '90', '49', '90', '93', '90', '2016-06-15 16:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('216', '2', '90', '50', '90', '92', '90', '2016-06-15 16:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('217', '12', '90', '50', '90', '93', '90', '2016-06-15 16:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('218', '37', '90', '50', '90', '93', '90', '2016-06-15 16:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('219', '11', '90', '50', '90', '94', '90', '2016-06-15 16:36:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('220', '15', '90', '50', '90', '93', '90', '2016-06-15 16:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('221', '6', '90', '51', '90', '92', '90', '2016-06-15 16:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('222', '14', '90', '51', '90', '92', '90', '2016-06-15 16:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('223', '21', '90', '51', '90', '92', '90', '2016-06-15 16:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('224', '0', '90', '51', '90', '93', '90', '2016-06-15 16:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('225', '5', '90', '52', '90', '92', '90', '2016-06-15 16:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('226', '5', '90', '52', '90', '93', '90', '2016-06-15 16:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('227', '21', '90', '52', '90', '93', '90', '2016-06-15 16:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('228', '34', '90', '52', '90', '93', '90', '2016-06-15 16:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('229', '21', '90', '52', '90', '93', '90', '2016-06-15 16:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('230', '26', '90', '53', '90', '93', '90', '2016-06-15 16:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('231', '3', '90', '53', '90', '93', '90', '2016-06-15 16:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('232', '10', '90', '53', '90', '92', '90', '2016-06-15 16:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('233', '21', '90', '53', '90', '93', '90', '2016-06-15 16:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('234', '22', '90', '54', '90', '93', '90', '2016-06-15 16:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('235', '22', '90', '54', '90', '93', '90', '2016-06-15 16:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('236', '2', '90', '54', '90', '95', '90', '2016-06-15 17:12:06', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('237', '10', '90', '54', '90', '94', '90', '2016-06-15 17:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('238', '10', '90', '54', '90', '93', '90', '2016-06-15 17:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('239', '25', '90', '55', '90', '95', '90', '2016-06-15 17:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('240', '20', '90', '55', '90', '95', '90', '2016-06-15 17:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('241', '26', '90', '55', '90', '95', '90', '2016-06-15 17:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('242', '17', '90', '55', '90', '95', '90', '2016-06-15 17:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('243', '23', '90', '56', '90', '95', '90', '2016-06-15 17:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('244', '15', '90', '56', '90', '95', '90', '2016-06-15 17:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('245', '20', '90', '56', '90', '95', '90', '2016-06-15 17:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('246', '16', '90', '56', '90', '95', '90', '2016-06-15 17:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('247', '25', '90', '56', '90', '93', '90', '2016-06-15 17:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('248', '19', '90', '57', '90', '93', '90', '2016-06-15 17:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('249', '13', '90', '57', '90', '94', '90', '2016-06-15 17:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('250', '11', '90', '57', '90', '94', '90', '2016-06-15 17:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('251', '14', '90', '57', '90', '93', '90', '2016-06-15 17:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('252', '22', '90', '58', '90', '94', '90', '2016-06-15 17:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('253', '24', '90', '58', '90', '94', '90', '2016-06-15 17:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('254', '16', '90', '58', '90', '94', '90', '2016-06-15 17:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('255', '13', '90', '58', '90', '95', '90', '2016-06-15 17:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('256', '17', '90', '58', '90', '95', '90', '2016-06-15 17:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('257', '15', '90', '59', '90', '95', '90', '2016-06-15 17:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('258', '13', '90', '59', '90', '96', '90', '2016-06-15 17:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('259', '37', '90', '59', '90', '95', '90', '2016-06-15 17:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('260', '18', '90', '59', '90', '95', '90', '2016-06-15 17:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('261', '13', '90', '60', '90', '95', '90', '2016-06-15 17:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('262', '30', '90', '60', '90', '94', '90', '2016-06-15 17:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('263', '14', '90', '60', '90', '92', '90', '2016-06-15 17:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('264', '31', '90', '60', '90', '92', '90', '2016-06-15 17:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('265', '52', '90', '61', '90', '95', '90', '2016-06-15 17:42:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('266', '76', '90', '61', '90', '97', '90', '2016-06-15 17:43:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('267', '52', '90', '61', '90', '97', '90', '2016-06-15 17:44:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('268', '58', '90', '61', '90', '98', '90', '2016-06-15 17:45:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('269', '32', '90', '61', '90', '98', '90', '2016-06-15 17:46:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('270', '65', '90', '62', '90', '98', '90', '2016-06-15 17:47:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('271', '33', '90', '62', '90', '99', '90', '2016-06-15 17:48:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('272', '5', '90', '74', '90', '91', '90', '2016-06-15 18:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('273', '39', '90', '47', '90', '92', '90', '2016-06-15 18:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('274', '3', '90', '48', '90', '92', '90', '2016-06-15 18:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('275', '3', '90', '48', '90', '92', '90', '2016-06-15 18:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('276', '3', '90', '48', '90', '92', '90', '2016-06-15 18:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('277', '12', '90', '48', '90', '91', '90', '2016-06-15 18:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('278', '3', '90', '49', '90', '92', '90', '2016-06-15 18:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('279', '9', '90', '57', '90', '91', '90', '2016-06-15 18:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('280', '9', '90', '57', '90', '91', '90', '2016-06-15 18:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('281', '2', '90', '57', '90', '92', '90', '2016-06-15 18:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('282', '40', '90', '58', '90', '92', '90', '2016-06-15 18:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('283', '3', '90', '58', '90', '93', '90', '2016-06-15 18:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('284', '9', '90', '58', '90', '93', '90', '2016-06-15 18:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('285', '12', '90', '66', '90', '91', '90', '2016-06-15 19:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('286', '10', '90', '48', '90', '91', '90', '2016-06-15 19:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('287', '39', '90', '90', '90', '91', '90', '2016-06-15 19:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('288', '5', '90', '56', '90', '92', '90', '2016-06-15 19:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('289', '2', '90', '56', '90', '91', '90', '2016-06-15 19:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('290', '2', '90', '56', '90', '91', '90', '2016-06-15 19:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('291', '8', '90', '56', '90', '92', '90', '2016-06-15 19:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('292', '5', '90', '57', '90', '92', '90', '2016-06-15 19:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('293', '7', '90', '57', '90', '92', '90', '2016-06-15 19:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('294', '2', '90', '57', '90', '93', '90', '2016-06-15 19:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('295', '3', '90', '58', '90', '93', '90', '2016-06-15 19:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('296', '4', '90', '58', '90', '92', '90', '2016-06-15 19:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('297', '2', '90', '66', '90', '93', '90', '2016-06-15 19:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('298', '1', '90', '66', '90', '92', '90', '2016-06-15 19:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('299', '16', '90', '76', '90', '91', '90', '2016-06-15 19:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('300', '9', '90', '76', '90', '91', '90', '2016-06-15 19:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('301', '3', '90', '48', '90', '91', '90', '2016-06-15 19:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('302', '10', '90', '52', '90', '91', '90', '2016-06-15 19:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('303', '5', '90', '52', '90', '91', '90', '2016-06-15 19:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('304', '2', '90', '53', '90', '92', '90', '2016-06-15 19:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('305', '2', '90', '53', '90', '91', '90', '2016-06-15 19:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('306', '4', '90', '53', '90', '92', '90', '2016-06-15 19:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('307', '1', '90', '54', '90', '92', '90', '2016-06-15 19:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('308', '1', '90', '55', '90', '93', '90', '2016-06-15 19:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('309', '1', '90', '59', '90', '91', '90', '2016-06-15 19:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('310', '5', '90', '59', '90', '92', '90', '2016-06-15 19:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('311', '2', '90', '59', '90', '93', '90', '2016-06-15 19:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('312', '2', '90', '59', '90', '92', '90', '2016-06-15 19:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('313', '20', '90', '60', '90', '93', '90', '2016-06-15 19:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('314', '13', '90', '90', '90', '91', '90', '2016-06-16 12:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('315', '6', '90', '73', '90', '91', '90', '2016-06-16 12:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('316', '7', '90', '73', '90', '96', '90', '2016-06-16 12:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('317', '2', '90', '87', '90', '95', '90', '2016-06-16 13:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('318', '2', '90', '70', '90', '95', '90', '2016-06-16 13:03:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('319', '2', '90', '70', '90', '95', '90', '2016-06-16 13:04:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('320', '25', '90', '70', '90', '96', '90', '2016-06-16 13:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('321', '13', '90', '71', '90', '93', '90', '2016-06-16 13:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('322', '15', '90', '71', '90', '93', '90', '2016-06-16 13:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('323', '19', '90', '72', '90', '93', '90', '2016-06-16 13:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('324', '15', '90', '72', '90', '95', '90', '2016-06-16 13:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('325', '63', '90', '72', '90', '97', '90', '2016-06-16 13:10:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('326', '10', '90', '73', '90', '94', '90', '2016-06-16 13:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('327', '10', '90', '73', '90', '95', '90', '2016-06-16 13:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('328', '47', '90', '73', '90', '91', '90', '2016-06-16 13:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('329', '10', '90', '73', '90', '92', '90', '2016-06-16 13:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('330', '14', '90', '74', '90', '92', '90', '2016-06-16 13:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('331', '18', '90', '74', '90', '93', '90', '2016-06-16 13:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('332', '2', '90', '75', '90', '91', '90', '2016-06-16 13:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('333', '2', '90', '75', '90', '91', '90', '2016-06-16 13:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('334', '2', '90', '75', '90', '91', '90', '2016-06-16 13:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('335', '35', '90', '76', '90', '92', '90', '2016-06-16 13:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('336', '14', '90', '70', '90', '93', '90', '2016-06-16 13:22:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('337', '2', '90', '79', '90', '93', '90', '2016-06-16 13:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('338', '2', '90', '80', '90', '94', '90', '2016-06-16 13:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('339', '2', '90', '80', '90', '95', '90', '2016-06-16 13:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('340', '1', '90', '80', '90', '94', '90', '2016-06-16 13:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('341', '16', '90', '81', '90', '94', '90', '2016-06-16 13:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('342', '4', '90', '50', '90', '92', '90', '2016-06-16 13:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('343', '1', '90', '57', '90', '91', '90', '2016-06-16 13:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('344', '12', '90', '72', '90', '91', '90', '2016-06-16 13:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('345', '10', '90', '82', '90', '92', '90', '2016-06-16 13:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('346', '19', '90', '82', '90', '92', '90', '2016-06-16 13:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('347', '5', '90', '83', '90', '93', '90', '2016-06-16 13:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('348', '4', '90', '78', '90', '93', '90', '2016-06-16 13:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('349', '8', '90', '88', '90', '94', '90', '2016-06-16 13:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('350', '17', '90', '88', '90', '94', '90', '2016-06-16 13:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('351', '10', '90', '88', '90', '93', '90', '2016-06-16 13:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('352', '4', '90', '89', '90', '93', '90', '2016-06-16 13:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('353', '9', '90', '89', '90', '94', '90', '2016-06-16 13:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('354', '10', '90', '63', '90', '94', '90', '2016-06-16 13:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('355', '0', '90', '74', '90', '92', '90', '2016-06-16 14:55:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('356', '5', '90', '82', '90', '92', '90', '2016-06-16 14:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('357', '10', '90', '61', '90', '94', '90', '2016-06-16 15:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('358', '7', '90', '69', '90', '94', '90', '2016-06-16 15:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('359', '3', '90', '70', '90', '94', '90', '2016-06-16 15:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('360', '4', '90', '70', '90', '94', '90', '2016-06-16 15:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('361', '2', '90', '81', '90', '94', '90', '2016-06-16 15:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('362', '9', '90', '82', '90', '94', '90', '2016-06-16 15:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('363', '10', '90', '82', '90', '91', '90', '2016-06-16 15:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('364', '20', '90', '82', '90', '92', '90', '2016-06-16 15:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('365', '2', '90', '83', '90', '92', '90', '2016-06-16 15:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('366', '9', '90', '83', '90', '92', '90', '2016-06-16 15:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('367', '18', '90', '83', '90', '93', '90', '2016-06-16 15:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('368', '4', '90', '84', '90', '91', '90', '2016-06-16 15:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('369', '5', '90', '84', '90', '93', '90', '2016-06-16 15:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('370', '7', '90', '84', '90', '93', '90', '2016-06-16 15:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('371', '10', '90', '59', '90', '91', '90', '2016-06-16 15:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('372', '7', '90', '59', '90', '91', '90', '2016-06-16 15:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('373', '16', '90', '60', '90', '92', '90', '2016-06-16 15:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('374', '1', '90', '60', '90', '93', '90', '2016-06-16 15:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('375', '16', '90', '60', '90', '92', '90', '2016-06-16 15:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('376', '14', '90', '60', '90', '92', '90', '2016-06-16 15:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('377', '5', '90', '61', '90', '92', '90', '2016-06-16 15:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('378', '4', '90', '61', '90', '92', '90', '2016-06-16 15:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('379', '14', '90', '61', '90', '92', '90', '2016-06-16 15:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('380', '6', '90', '62', '90', '93', '90', '2016-06-16 15:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('381', '13', '90', '62', '90', '93', '90', '2016-06-16 15:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('382', '5', '90', '62', '90', '92', '90', '2016-06-16 15:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('383', '28', '90', '62', '90', '91', '90', '2016-06-16 15:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('384', '11', '90', '63', '90', '91', '90', '2016-06-16 15:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('385', '2', '90', '63', '90', '92', '90', '2016-06-16 15:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('386', '1', '90', '63', '90', '93', '90', '2016-06-16 15:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('387', '4', '90', '64', '90', '92', '90', '2016-06-16 15:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('388', '10', '90', '64', '90', '92', '90', '2016-06-16 15:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('389', '4', '90', '64', '90', '92', '90', '2016-06-16 15:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('390', '5', '90', '90', '90', '91', '90', '2016-06-16 15:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('391', '6', '90', '69', '90', '91', '90', '2016-06-16 15:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('392', '18', '90', '78', '90', '93', '90', '2016-06-16 15:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('393', '34', '90', '79', '90', '94', '90', '2016-06-16 15:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('394', '16', '90', '79', '90', '93', '90', '2016-06-16 15:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('395', '1', '90', '79', '90', '95', '90', '2016-06-16 15:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('396', '22', '90', '80', '90', '94', '90', '2016-06-16 15:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('397', '11', '90', '80', '90', '95', '90', '2016-06-16 15:56:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('398', '9', '90', '81', '90', '93', '90', '2016-06-16 15:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('399', '2', '90', '81', '90', '93', '90', '2016-06-16 15:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('400', '12', '90', '81', '90', '94', '90', '2016-06-16 15:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('401', '14', '90', '81', '90', '93', '90', '2016-06-16 16:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('402', '17', '90', '64', '90', '93', '90', '2016-06-16 16:07:02', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('403', '2', '90', '71', '90', '93', '90', '2016-06-16 16:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('404', '0', '90', '71', '90', '92', '90', '2016-06-16 16:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('405', '2', '90', '71', '90', '92', '90', '2016-06-16 16:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('406', '9', '90', '71', '90', '93', '90', '2016-06-16 16:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('407', '17', '90', '72', '90', '93', '90', '2016-06-16 16:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('408', '2', '90', '73', '90', '93', '90', '2016-06-16 16:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('409', '36', '90', '73', '90', '93', '90', '2016-06-16 16:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('410', '4', '90', '72', '90', '94', '90', '2016-06-16 16:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('411', '3', '90', '51', '90', '94', '90', '2016-06-16 16:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('412', '3', '90', '51', '90', '93', '90', '2016-06-16 16:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('413', '6', '90', '51', '90', '93', '90', '2016-06-16 16:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('414', '2', '90', '51', '90', '93', '90', '2016-06-16 16:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('415', '14', '90', '52', '90', '95', '90', '2016-06-16 16:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('416', '13', '90', '52', '90', '91', '90', '2016-06-16 16:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('417', '5', '90', '52', '90', '91', '90', '2016-06-16 16:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('418', '10', '90', '52', '90', '94', '90', '2016-06-16 16:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('419', '2', '90', '53', '90', '95', '90', '2016-06-16 16:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('420', '2', '90', '53', '90', '94', '90', '2016-06-16 16:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('421', '16', '90', '53', '90', '94', '90', '2016-06-16 16:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('422', '23', '90', '70', '90', '94', '90', '2016-06-16 16:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('423', '12', '90', '63', '90', '91', '90', '2016-06-16 16:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('424', '28', '90', '66', '90', '91', '90', '2016-06-16 17:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('425', '24', '90', '67', '90', '91', '90', '2016-06-16 17:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('426', '23', '90', '67', '90', '92', '90', '2016-06-16 17:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('427', '31', '90', '50', '90', '91', '90', '2016-06-16 17:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('428', '20', '90', '74', '90', '91', '90', '2016-06-16 17:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('429', '20', '90', '45', '90', '93', '90', '2016-06-16 17:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('430', '21', '90', '46', '90', '93', '90', '2016-06-16 17:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('431', '21', '90', '46', '90', '93', '90', '2016-06-16 17:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('432', '14', '90', '46', '90', '94', '90', '2016-06-16 17:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('433', '31', '90', '46', '90', '94', '90', '2016-06-16 17:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('434', '25', '90', '47', '90', '94', '90', '2016-06-16 17:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('435', '38', '90', '47', '90', '94', '90', '2016-06-16 17:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('436', '13', '90', '47', '90', '94', '90', '2016-06-16 17:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('437', '22', '90', '47', '90', '94', '90', '2016-06-16 17:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('438', '25', '90', '48', '90', '94', '90', '2016-06-16 17:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('439', '22', '90', '48', '90', '94', '90', '2016-06-16 17:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('440', '19', '90', '48', '90', '93', '90', '2016-06-16 17:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('441', '21', '90', '48', '90', '93', '90', '2016-06-16 17:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('442', '26', '90', '49', '90', '91', '90', '2016-06-16 17:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('443', '19', '90', '49', '90', '91', '90', '2016-06-16 17:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('444', '21', '90', '49', '90', '91', '90', '2016-06-16 17:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('445', '25', '90', '49', '90', '91', '90', '2016-06-16 17:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('446', '19', '90', '50', '90', '91', '90', '2016-06-16 17:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('447', '31', '90', '50', '90', '91', '90', '2016-06-16 17:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('448', '27', '90', '50', '90', '91', '90', '2016-06-16 17:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('449', '14', '90', '51', '90', '91', '90', '2016-06-16 17:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('450', '24', '90', '51', '90', '91', '90', '2016-06-16 17:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('451', '19', '90', '51', '90', '91', '90', '2016-06-16 17:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('452', '27', '90', '51', '90', '91', '90', '2016-06-16 17:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('453', '27', '90', '52', '90', '91', '90', '2016-06-16 17:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('454', '17', '90', '52', '90', '91', '90', '2016-06-16 17:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('455', '27', '90', '52', '90', '91', '90', '2016-06-16 17:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('456', '24', '90', '52', '90', '91', '90', '2016-06-16 17:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('457', '22', '90', '52', '90', '92', '90', '2016-06-16 17:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('458', '21', '90', '53', '90', '92', '90', '2016-06-16 17:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('459', '25', '90', '53', '90', '92', '90', '2016-06-16 17:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('460', '25', '90', '53', '90', '92', '90', '2016-06-16 17:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('461', '28', '90', '53', '90', '92', '90', '2016-06-16 17:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('462', '18', '90', '54', '90', '92', '90', '2016-06-16 17:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('463', '22', '90', '54', '90', '92', '90', '2016-06-16 17:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('464', '18', '90', '54', '90', '91', '90', '2016-06-16 17:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('465', '23', '90', '54', '90', '91', '90', '2016-06-16 17:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('466', '28', '90', '55', '90', '91', '90', '2016-06-16 17:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('467', '16', '90', '55', '90', '93', '90', '2016-06-16 17:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('468', '20', '90', '55', '90', '97', '90', '2016-06-16 17:51:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('469', '17', '90', '55', '90', '97', '90', '2016-06-16 17:52:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('470', '20', '90', '55', '90', '97', '90', '2016-06-16 17:53:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('471', '19', '90', '56', '90', '97', '90', '2016-06-16 17:54:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('472', '30', '90', '56', '90', '96', '90', '2016-06-16 17:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('473', '26', '90', '56', '90', '96', '90', '2016-06-16 17:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('474', '20', '90', '56', '90', '94', '90', '2016-06-16 17:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('475', '27', '90', '57', '90', '91', '90', '2016-06-16 17:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('476', '5', '90', '57', '90', '92', '90', '2016-06-16 18:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('477', '20', '90', '70', '90', '93', '90', '2016-06-16 18:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('478', '7', '90', '47', '90', '93', '90', '2016-06-16 18:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('479', '9', '90', '50', '90', '94', '90', '2016-06-16 18:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('480', '5', '90', '57', '90', '94', '90', '2016-06-16 18:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('481', '24', '90', '57', '90', '93', '90', '2016-06-16 18:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('482', '3', '90', '57', '90', '93', '90', '2016-06-16 18:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('483', '5', '90', '57', '90', '93', '90', '2016-06-16 18:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('484', '7', '90', '58', '90', '93', '90', '2016-06-16 18:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('485', '6', '90', '58', '90', '93', '90', '2016-06-16 18:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('486', '2', '90', '58', '90', '94', '90', '2016-06-16 18:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('487', '13', '90', '58', '90', '98', '90', '2016-06-16 18:23:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('488', '15', '90', '59', '90', '94', '90', '2016-06-16 18:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('489', '14', '90', '49', '90', '92', '90', '2016-06-17 14:12:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('490', '3', '90', '53', '90', '97', '90', '2016-06-17 14:13:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('491', '23', '90', '53', '90', '98', '90', '2016-06-17 14:14:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('492', '11', '90', '53', '90', '98', '90', '2016-06-17 14:15:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('493', '10', '90', '53', '90', '97', '90', '2016-06-17 14:16:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('494', '24', '90', '53', '90', '98', '90', '2016-06-17 14:17:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('495', '31', '90', '54', '90', '98', '90', '2016-06-17 14:18:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('496', '9', '90', '54', '90', '96', '90', '2016-06-17 14:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('497', '14', '90', '54', '90', '98', '90', '2016-06-17 14:20:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('498', '10', '90', '54', '90', '97', '90', '2016-06-17 14:21:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('499', '13', '90', '55', '90', '97', '90', '2016-06-17 14:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('500', '8', '90', '73', '90', '91', '90', '2016-06-17 14:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('501', '6', '90', '50', '90', '92', '90', '2016-06-17 14:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('502', '12', '90', '58', '90', '93', '90', '2016-06-17 14:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('503', '9', '90', '60', '90', '93', '90', '2016-06-17 14:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('504', '17', '90', '60', '90', '92', '90', '2016-06-17 14:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('505', '27', '90', '61', '90', '92', '90', '2016-06-17 14:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('506', '26', '90', '62', '90', '92', '90', '2016-06-17 14:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('507', '31', '90', '71', '90', '93', '90', '2016-06-17 14:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('508', '16', '90', '74', '90', '93', '90', '2016-06-17 14:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('509', '10', '90', '74', '90', '93', '90', '2016-06-17 14:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('510', '5', '90', '75', '90', '93', '90', '2016-06-17 14:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('511', '16', '90', '75', '90', '94', '90', '2016-06-17 14:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('512', '3', '90', '75', '90', '94', '90', '2016-06-17 14:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('513', '41', '90', '76', '90', '93', '90', '2016-06-17 14:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('514', '10', '90', '76', '90', '94', '90', '2016-06-17 14:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('515', '8', '90', '51', '90', '91', '90', '2016-06-17 14:46:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('516', '9', '90', '58', '90', '92', '90', '2016-06-17 14:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('517', '18', '90', '58', '90', '93', '90', '2016-06-17 14:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('518', '9', '90', '64', '90', '93', '90', '2016-06-17 14:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('519', '13', '90', '69', '90', '93', '90', '2016-06-17 14:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('520', '4', '90', '69', '90', '92', '90', '2016-06-17 14:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('521', '9', '90', '69', '90', '93', '90', '2016-06-17 14:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('522', '11', '90', '70', '90', '92', '90', '2016-06-17 14:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('523', '5', '90', '70', '90', '93', '90', '2016-06-17 14:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('524', '4', '90', '73', '90', '92', '90', '2016-06-17 14:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('525', '14', '90', '73', '90', '95', '90', '2016-06-17 14:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('526', '9', '90', '46', '90', '95', '90', '2016-06-17 14:58:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('527', '10', '90', '47', '90', '95', '90', '2016-06-17 14:59:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('528', '5', '90', '47', '90', '95', '90', '2016-06-17 15:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('529', '11', '90', '47', '90', '94', '90', '2016-06-17 15:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('530', '19', '90', '60', '90', '91', '90', '2016-06-17 15:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('531', '75', '90', '64', '90', '94', '90', '2016-06-17 15:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('532', '23', '90', '78', '90', '93', '90', '2016-06-17 15:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('533', '21', '90', '62', '90', '93', '90', '2016-06-17 15:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('534', '16', '90', '62', '90', '93', '90', '2016-06-17 15:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('535', '15', '90', '62', '90', '93', '90', '2016-06-17 15:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('536', '3', '90', '64', '90', '91', '90', '2016-06-17 16:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('537', '4', '90', '64', '90', '91', '90', '2016-06-17 16:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('538', '15', '90', '64', '90', '91', '90', '2016-06-17 16:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('539', '19', '90', '65', '90', '91', '90', '2016-06-17 16:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('540', '1', '90', '69', '90', '91', '90', '2016-06-18 11:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('541', '5', '90', '78', '90', '91', '90', '2016-06-18 11:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('542', '18', '90', '78', '90', '93', '90', '2016-06-18 11:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('543', '10', '90', '78', '90', '93', '90', '2016-06-18 11:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('544', '32', '90', '79', '90', '93', '90', '2016-06-18 11:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('545', '29', '90', '79', '90', '94', '90', '2016-06-18 11:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('546', '15', '90', '83', '90', '94', '90', '2016-06-18 11:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('547', '17', '90', '83', '90', '93', '90', '2016-06-18 12:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('548', '32', '90', '83', '90', '94', '90', '2016-06-18 12:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('549', '19', '90', '84', '90', '94', '90', '2016-06-18 12:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('550', '21', '90', '84', '90', '94', '90', '2016-06-18 12:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('551', '26', '90', '84', '90', '94', '90', '2016-06-18 12:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('552', '23', '90', '85', '90', '94', '90', '2016-06-18 12:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('553', '14', '90', '85', '90', '94', '90', '2016-06-18 12:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('554', '27', '90', '85', '90', '93', '90', '2016-06-18 12:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('555', '26', '90', '86', '90', '95', '90', '2016-06-18 12:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('556', '21', '90', '86', '90', '94', '90', '2016-06-18 12:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('557', '30', '90', '86', '90', '94', '90', '2016-06-18 12:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('558', '16', '90', '86', '90', '94', '90', '2016-06-18 12:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('559', '21', '90', '87', '90', '94', '90', '2016-06-18 12:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('560', '33', '90', '87', '90', '94', '90', '2016-06-18 12:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('561', '7', '90', '87', '90', '94', '90', '2016-06-18 12:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('562', '12', '90', '87', '90', '94', '90', '2016-06-18 12:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('563', '24', '90', '88', '90', '94', '90', '2016-06-18 12:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('564', '14', '90', '88', '90', '94', '90', '2016-06-18 12:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('565', '26', '90', '88', '90', '94', '90', '2016-06-18 12:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('566', '24', '90', '89', '90', '94', '90', '2016-06-18 12:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('567', '10', '90', '61', '90', '94', '90', '2016-06-18 12:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('568', '16', '90', '62', '90', '95', '90', '2016-06-18 12:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('569', '28', '90', '62', '90', '94', '90', '2016-06-18 12:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('570', '21', '90', '62', '90', '95', '90', '2016-06-18 12:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('571', '16', '90', '63', '90', '95', '90', '2016-06-18 12:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('572', '29', '90', '63', '90', '95', '90', '2016-06-18 12:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('573', '27', '90', '63', '90', '95', '90', '2016-06-18 12:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('574', '13', '90', '64', '90', '95', '90', '2016-06-18 12:27:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('575', '27', '90', '64', '90', '95', '90', '2016-06-18 12:28:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('576', '19', '90', '64', '90', '95', '90', '2016-06-18 12:29:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('577', '15', '90', '64', '90', '94', '90', '2016-06-18 12:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('578', '24', '90', '65', '90', '95', '90', '2016-06-18 12:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('579', '21', '90', '65', '90', '95', '90', '2016-06-18 12:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('580', '15', '90', '65', '90', '96', '90', '2016-06-18 12:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('581', '21', '90', '65', '90', '96', '90', '2016-06-18 12:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('582', '20', '90', '66', '90', '94', '90', '2016-06-18 12:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('583', '14', '90', '85', '90', '94', '90', '2016-06-18 13:32:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('584', '10', '90', '61', '90', '91', '90', '2016-06-18 13:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('585', '6', '90', '64', '90', '93', '90', '2016-06-18 13:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('586', '22', '90', '65', '90', '97', '90', '2016-06-18 13:35:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('587', '19', '90', '65', '90', '98', '90', '2016-06-18 13:36:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('588', '13', '90', '66', '90', '97', '90', '2016-06-18 13:37:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('589', '18', '90', '78', '90', '91', '90', '2016-06-18 13:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('590', '2', '90', '83', '90', '93', '90', '2016-06-18 13:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('591', '5', '90', '57', '90', '91', '90', '2016-06-18 14:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('592', '28', '90', '58', '90', '91', '90', '2016-06-18 14:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('593', '40', '90', '69', '90', '91', '90', '2016-06-18 14:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('594', '2', '90', '77', '90', '91', '90', '2016-06-18 14:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('595', '3', '90', '79', '90', '91', '90', '2016-06-18 14:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('596', '6', '90', '51', '90', '91', '90', '2016-06-18 14:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('597', '12', '90', '54', '90', '91', '90', '2016-06-18 14:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('598', '2', '90', '54', '90', '91', '90', '2016-06-18 14:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('599', '11', '90', '55', '90', '91', '90', '2016-06-18 14:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('600', '13', '90', '55', '90', '92', '90', '2016-06-18 14:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('601', '26', '90', '85', '90', '93', '90', '2016-06-19 11:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('602', '15', '90', '63', '90', '93', '90', '2016-06-19 11:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('603', '52', '90', '64', '90', '99', '90', '2016-06-19 11:48:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('604', '31', '90', '64', '90', '91', '90', '2016-06-19 11:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('605', '24', '90', '64', '90', '95', '90', '2016-06-19 11:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('606', '23', '90', '65', '90', '91', '90', '2016-06-19 11:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('607', '2', '90', '65', '90', '91', '90', '2016-06-19 11:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('608', '2', '90', '66', '90', '91', '90', '2016-06-19 11:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('609', '1', '90', '66', '90', '91', '90', '2016-06-19 11:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('610', '17', '90', '66', '90', '91', '90', '2016-06-19 11:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('611', '6', '90', '67', '90', '91', '90', '2016-06-19 11:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('612', '1', '90', '67', '90', '91', '90', '2016-06-19 11:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('613', '6', '90', '67', '90', '93', '90', '2016-06-19 12:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('614', '3', '90', '68', '90', '93', '90', '2016-06-19 12:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('615', '2', '90', '73', '90', '92', '90', '2016-06-19 12:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('616', '3', '90', '79', '90', '91', '90', '2016-06-19 12:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('617', '1', '90', '79', '90', '91', '90', '2016-06-19 12:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('618', '8', '90', '80', '90', '93', '90', '2016-06-19 12:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('619', '14', '90', '80', '90', '92', '90', '2016-06-19 12:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('620', '12', '90', '80', '90', '94', '90', '2016-06-19 12:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('621', '19', '90', '81', '90', '94', '90', '2016-06-19 12:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('622', '14', '90', '81', '90', '94', '90', '2016-06-19 12:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('623', '23', '90', '81', '90', '91', '90', '2016-06-19 12:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('624', '1', '90', '84', '90', '92', '90', '2016-06-19 12:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('625', '2', '90', '84', '90', '92', '90', '2016-06-19 12:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('626', '2', '90', '84', '90', '92', '90', '2016-06-19 12:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('627', '2', '90', '85', '90', '92', '90', '2016-06-19 12:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('628', '8', '90', '85', '90', '93', '90', '2016-06-19 12:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('629', '7', '90', '85', '90', '91', '90', '2016-06-19 12:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('630', '25', '90', '85', '90', '91', '90', '2016-06-19 12:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('631', '5', '90', '86', '90', '91', '90', '2016-06-19 12:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('632', '14', '90', '86', '90', '92', '90', '2016-06-19 12:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('633', '2', '90', '87', '90', '91', '90', '2016-06-19 12:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('634', '2', '90', '87', '90', '91', '90', '2016-06-19 12:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('635', '4', '90', '87', '90', '91', '90', '2016-06-19 12:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('636', '0', '90', '87', '90', '91', '90', '2016-06-19 12:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('637', '3', '90', '88', '90', '91', '90', '2016-06-19 12:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('638', '2', '90', '88', '90', '91', '90', '2016-06-19 12:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('639', '5', '90', '88', '90', '91', '90', '2016-06-19 12:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('640', '1', '90', '62', '90', '91', '90', '2016-06-19 12:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('641', '5', '90', '62', '90', '91', '90', '2016-06-19 12:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('642', '9', '90', '62', '90', '91', '90', '2016-06-19 12:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('643', '3', '90', '62', '90', '92', '90', '2016-06-19 13:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('644', '15', '90', '63', '90', '93', '90', '2016-06-19 13:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('645', '3', '90', '63', '90', '94', '90', '2016-06-19 13:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('646', '14', '90', '84', '90', '96', '90', '2016-06-19 13:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('647', '20', '90', '61', '90', '95', '90', '2016-06-19 13:45:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('648', '17', '90', '61', '90', '95', '90', '2016-06-19 13:46:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('649', '20', '90', '62', '90', '96', '90', '2016-06-19 13:47:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('650', '21', '90', '62', '90', '96', '90', '2016-06-19 13:48:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('651', '19', '90', '62', '90', '94', '90', '2016-06-19 13:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('652', '24', '90', '62', '90', '93', '90', '2016-06-19 13:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('653', '27', '90', '66', '90', '92', '90', '2016-06-19 13:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('654', '45', '90', '66', '90', '92', '90', '2016-06-19 13:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('655', '26', '90', '66', '90', '92', '90', '2016-06-19 13:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('656', '22', '90', '67', '90', '92', '90', '2016-06-19 13:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('657', '27', '90', '67', '90', '92', '90', '2016-06-19 13:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('658', '25', '90', '67', '90', '92', '90', '2016-06-19 13:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('659', '29', '90', '68', '90', '92', '90', '2016-06-19 13:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('660', '27', '90', '68', '90', '92', '90', '2016-06-19 13:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('661', '34', '90', '68', '90', '94', '90', '2016-06-19 13:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('662', '34', '90', '69', '90', '91', '90', '2016-06-19 14:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('663', '27', '90', '69', '90', '95', '90', '2016-06-19 14:01:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('664', '17', '90', '66', '90', '91', '90', '2016-06-21 16:48:02', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('665', '16', '90', '73', '90', '93', '90', '2016-06-21 16:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('666', '2', '90', '74', '90', '92', '90', '2016-06-21 16:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('667', '9', '90', '53', '90', '95', '90', '2016-06-21 17:49:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('668', '9', '90', '75', '90', '93', '90', '2016-06-21 17:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('669', '28', '90', '58', '90', '92', '90', '2016-06-21 17:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('670', '21', '90', '64', '90', '94', '90', '2016-06-21 17:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('671', '1', '90', '65', '90', '92', '90', '2016-06-21 17:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('672', '13', '90', '48', '90', '92', '90', '2016-06-21 18:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('673', '5', '90', '78', '90', '93', '90', '2016-06-21 18:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('674', '4', '90', '88', '90', '93', '90', '2016-06-21 18:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('675', '1', '90', '89', '90', '93', '90', '2016-06-21 18:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('676', '10', '90', '89', '90', '93', '90', '2016-06-21 18:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('677', '9', '90', '90', '90', '94', '90', '2016-06-21 18:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('678', '14', '90', '90', '90', '93', '90', '2016-06-21 18:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('679', '24', '90', '90', '90', '92', '90', '2016-06-21 18:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('680', '21', '90', '64', '90', '94', '90', '2016-06-21 18:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('681', '6', '90', '72', '90', '94', '90', '2016-06-21 18:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('682', '3', '90', '72', '90', '94', '90', '2016-06-21 18:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('683', '1', '90', '72', '90', '94', '90', '2016-06-21 18:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('684', '13', '90', '73', '90', '95', '90', '2016-06-21 18:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('685', '2', '90', '73', '90', '94', '90', '2016-06-21 18:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('686', '32', '90', '74', '90', '96', '90', '2016-06-21 18:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('687', '9', '90', '64', '90', '92', '90', '2016-06-21 18:16:02', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('688', '7', '90', '71', '90', '92', '90', '2016-06-21 18:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('689', '7', '90', '62', '90', '93', '90', '2016-06-21 18:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('690', '18', '90', '62', '90', '93', '90', '2016-06-21 18:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('691', '12', '90', '63', '90', '93', '90', '2016-06-21 18:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('692', '3', '90', '63', '90', '92', '90', '2016-06-21 18:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('693', '4', '90', '64', '90', '92', '90', '2016-06-21 18:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('694', '4', '90', '64', '90', '93', '90', '2016-06-21 18:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('695', '12', '90', '64', '90', '93', '90', '2016-06-21 18:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('696', '8', '90', '64', '90', '94', '90', '2016-06-21 18:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('697', '3', '90', '65', '90', '94', '90', '2016-06-21 18:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('698', '4', '90', '65', '90', '93', '90', '2016-06-21 18:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('699', '6', '90', '65', '90', '93', '90', '2016-06-21 18:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('700', '2', '90', '65', '90', '94', '90', '2016-06-21 18:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('701', '4', '90', '66', '90', '93', '90', '2016-06-21 18:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('702', '5', '90', '66', '90', '93', '90', '2016-06-21 18:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('703', '5', '90', '66', '90', '93', '90', '2016-06-21 18:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('704', '0', '90', '66', '90', '93', '90', '2016-06-21 18:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('705', '4', '90', '47', '90', '94', '90', '2016-06-21 18:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('706', '2', '90', '47', '90', '94', '90', '2016-06-21 18:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('707', '6', '90', '47', '90', '93', '90', '2016-06-21 18:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('708', '12', '90', '47', '90', '94', '90', '2016-06-21 18:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('709', '7', '90', '48', '90', '94', '90', '2016-06-21 18:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('710', '9', '90', '48', '90', '94', '90', '2016-06-21 18:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('711', '13', '90', '48', '90', '94', '90', '2016-06-21 18:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('712', '10', '90', '48', '90', '94', '90', '2016-06-21 18:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('713', '14', '90', '49', '90', '94', '90', '2016-06-21 18:42:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('714', '10', '90', '49', '90', '94', '90', '2016-06-21 18:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('715', '23', '90', '49', '90', '96', '90', '2016-06-21 18:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('716', '21', '90', '49', '90', '93', '90', '2016-06-21 18:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('717', '16', '90', '50', '90', '92', '90', '2016-06-21 18:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('718', '21', '90', '50', '90', '92', '90', '2016-06-21 18:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('719', '17', '90', '50', '90', '92', '90', '2016-06-21 18:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('720', '29', '90', '50', '90', '93', '90', '2016-06-21 18:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('721', '22', '90', '50', '90', '92', '90', '2016-06-21 18:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('722', '21', '90', '51', '90', '91', '90', '2016-06-21 18:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('723', '14', '90', '51', '90', '93', '90', '2016-06-21 18:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('724', '17', '90', '53', '90', '95', '90', '2016-06-22 13:56:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('725', '2', '90', '48', '90', '92', '90', '2016-06-22 13:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('726', '2', '90', '48', '90', '91', '90', '2016-06-22 13:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('727', '13', '90', '49', '90', '92', '90', '2016-06-22 14:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('728', '5', '90', '49', '90', '91', '90', '2016-06-22 14:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('729', '2', '90', '50', '90', '91', '90', '2016-06-22 14:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('730', '7', '90', '50', '90', '91', '90', '2016-06-22 14:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('731', '5', '90', '54', '90', '91', '90', '2016-06-22 14:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('732', '5', '90', '54', '90', '92', '90', '2016-06-22 14:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('733', '14', '90', '54', '90', '92', '90', '2016-06-22 14:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('734', '5', '90', '54', '90', '92', '90', '2016-06-22 14:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('735', '5', '90', '55', '90', '91', '90', '2016-06-22 14:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('736', '24', '90', '55', '90', '93', '90', '2016-06-22 14:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('737', '16', '90', '55', '90', '92', '90', '2016-06-22 14:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('738', '12', '90', '42', '90', '93', '90', '2016-06-22 15:13:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('739', '13', '90', '49', '90', '94', '90', '2016-06-22 15:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('740', '9', '90', '49', '90', '94', '90', '2016-06-22 15:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('741', '20', '90', '50', '90', '96', '90', '2016-06-22 15:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('742', '23', '90', '50', '90', '95', '90', '2016-06-22 15:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('743', '6', '90', '50', '90', '95', '90', '2016-06-22 15:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('744', '6', '90', '58', '90', '96', '90', '2016-06-22 15:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('745', '7', '90', '58', '90', '96', '90', '2016-06-22 15:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('746', '5', '90', '59', '90', '96', '90', '2016-06-22 15:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('747', '13', '90', '59', '90', '96', '90', '2016-06-22 15:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('748', '9', '90', '59', '90', '97', '90', '2016-06-22 15:23:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('749', '2', '90', '59', '90', '98', '90', '2016-06-22 15:24:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('750', '11', '90', '60', '90', '94', '90', '2016-06-22 15:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('751', '3', '90', '60', '90', '94', '90', '2016-06-22 15:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('752', '8', '90', '60', '90', '94', '90', '2016-06-22 15:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('753', '2', '90', '61', '90', '94', '90', '2016-06-22 15:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('754', '6', '90', '61', '90', '94', '90', '2016-06-22 15:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('755', '0', '90', '61', '90', '95', '90', '2016-06-22 15:30:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('756', '16', '90', '61', '90', '96', '90', '2016-06-22 15:31:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('757', '8', '90', '62', '90', '97', '90', '2016-06-22 15:32:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('758', '5', '90', '62', '90', '97', '90', '2016-06-22 15:33:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('759', '1', '90', '62', '90', '96', '90', '2016-06-22 15:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('760', '9', '90', '62', '90', '97', '90', '2016-06-22 15:35:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('761', '8', '90', '62', '90', '97', '90', '2016-06-22 15:36:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('762', '4', '90', '63', '90', '97', '90', '2016-06-22 15:37:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('763', '5', '90', '63', '90', '97', '90', '2016-06-22 15:38:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('764', '7', '90', '63', '90', '97', '90', '2016-06-22 15:39:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('765', '7', '90', '63', '90', '97', '90', '2016-06-22 15:40:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('766', '8', '90', '63', '90', '95', '90', '2016-06-22 15:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('767', '2', '90', '64', '90', '91', '90', '2016-06-22 15:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('768', '0', '90', '61', '90', '91', '90', '2016-06-22 16:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('769', '6', '90', '67', '90', '91', '90', '2016-06-22 16:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('770', '12', '90', '74', '90', '91', '90', '2016-06-22 16:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('771', '46', '90', '77', '90', '91', '90', '2016-06-22 16:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('772', '17', '90', '77', '90', '91', '90', '2016-06-22 16:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('773', '4', '90', '77', '90', '91', '90', '2016-06-22 16:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('774', '22', '90', '77', '90', '92', '90', '2016-06-22 16:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('775', '18', '90', '78', '90', '91', '90', '2016-06-22 16:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('776', '9', '90', '78', '90', '93', '90', '2016-06-22 16:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('777', '10', '90', '82', '90', '93', '90', '2016-06-22 17:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('778', '22', '90', '60', '90', '92', '90', '2016-06-22 17:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('779', '5', '90', '61', '90', '92', '90', '2016-06-22 17:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('780', '2', '90', '62', '90', '93', '90', '2016-06-22 17:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('781', '3', '90', '62', '90', '93', '90', '2016-06-22 17:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('782', '15', '90', '62', '90', '93', '90', '2016-06-22 17:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('783', '13', '90', '63', '90', '93', '90', '2016-06-22 17:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('784', '7', '90', '63', '90', '94', '90', '2016-06-22 17:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('785', '7', '90', '63', '90', '94', '90', '2016-06-22 17:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('786', '1', '90', '64', '90', '94', '90', '2016-06-22 17:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('787', '3', '90', '64', '90', '94', '90', '2016-06-22 17:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('788', '10', '90', '64', '90', '94', '90', '2016-06-22 17:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('789', '2', '90', '65', '90', '95', '90', '2016-06-22 17:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('790', '23', '90', '65', '90', '95', '90', '2016-06-22 17:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('791', '4', '90', '65', '90', '93', '90', '2016-06-22 17:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('792', '6', '90', '66', '90', '93', '90', '2016-06-22 17:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('793', '15', '90', '66', '90', '93', '90', '2016-06-22 17:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('794', '2', '90', '66', '90', '93', '90', '2016-06-22 17:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('795', '2', '90', '66', '90', '93', '90', '2016-06-22 17:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('796', '4', '90', '67', '90', '93', '90', '2016-06-22 17:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('797', '5', '90', '67', '90', '93', '90', '2016-06-22 17:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('798', '10', '90', '67', '90', '92', '90', '2016-06-22 17:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('799', '0', '90', '67', '90', '92', '90', '2016-06-22 17:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('800', '10', '90', '68', '90', '93', '90', '2016-06-22 17:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('801', '9', '90', '68', '90', '93', '90', '2016-06-22 17:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('802', '2', '90', '68', '90', '93', '90', '2016-06-22 17:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('803', '4', '90', '73', '90', '91', '90', '2016-06-22 17:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('804', '1', '90', '73', '90', '91', '90', '2016-06-22 17:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('805', '2', '90', '73', '90', '93', '90', '2016-06-22 17:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('806', '18', '90', '73', '90', '96', '90', '2016-06-22 17:52:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('807', '16', '90', '74', '90', '96', '90', '2016-06-22 17:53:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('808', '9', '90', '74', '90', '96', '90', '2016-06-22 17:54:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('809', '10', '90', '74', '90', '95', '90', '2016-06-22 17:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('810', '7', '90', '74', '90', '95', '90', '2016-06-22 17:56:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('811', '2', '90', '75', '90', '96', '90', '2016-06-22 17:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('812', '18', '90', '75', '90', '97', '90', '2016-06-22 17:58:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('813', '2', '90', '75', '90', '96', '90', '2016-06-22 17:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('814', '2', '90', '76', '90', '96', '90', '2016-06-22 18:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('815', '2', '90', '76', '90', '96', '90', '2016-06-22 18:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('816', '2', '90', '76', '90', '96', '90', '2016-06-22 18:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('817', '6', '90', '77', '90', '96', '90', '2016-06-22 18:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('818', '8', '90', '77', '90', '96', '90', '2016-06-22 18:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('819', '0', '90', '77', '90', '96', '90', '2016-06-22 18:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('820', '1', '90', '78', '90', '96', '90', '2016-06-22 18:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('821', '9', '90', '78', '90', '95', '90', '2016-06-22 18:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('822', '2', '90', '78', '90', '96', '90', '2016-06-22 18:08:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('823', '8', '90', '78', '90', '96', '90', '2016-06-22 18:09:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('824', '0', '90', '79', '90', '96', '90', '2016-06-22 18:10:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('825', '9', '90', '79', '90', '96', '90', '2016-06-22 18:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('826', '1', '90', '79', '90', '96', '90', '2016-06-22 18:12:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('827', '2', '90', '79', '90', '96', '90', '2016-06-22 18:13:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('828', '2', '90', '80', '90', '96', '90', '2016-06-22 18:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('829', '3', '90', '80', '90', '96', '90', '2016-06-22 18:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('830', '6', '90', '80', '90', '96', '90', '2016-06-22 18:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('831', '2', '90', '80', '90', '96', '90', '2016-06-22 18:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('832', '5', '90', '81', '90', '96', '90', '2016-06-22 18:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('833', '6', '90', '81', '90', '96', '90', '2016-06-22 18:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('834', '7', '90', '81', '90', '98', '90', '2016-06-22 18:20:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('835', '2', '90', '82', '90', '96', '90', '2016-06-22 18:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('836', '2', '90', '82', '90', '96', '90', '2016-06-22 18:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('837', '3', '90', '82', '90', '96', '90', '2016-06-22 18:23:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('838', '4', '90', '82', '90', '97', '90', '2016-06-22 18:24:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('839', '1', '90', '83', '90', '96', '90', '2016-06-22 18:25:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('840', '2', '90', '83', '90', '96', '90', '2016-06-22 18:26:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('841', '1', '90', '83', '90', '96', '90', '2016-06-22 18:27:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('842', '2', '90', '83', '90', '96', '90', '2016-06-22 18:28:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('843', '5', '90', '48', '90', '93', '90', '2016-06-23 10:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('844', '5', '90', '50', '90', '92', '90', '2016-06-23 10:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('845', '1', '90', '50', '90', '94', '90', '2016-06-23 10:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('846', '5', '90', '51', '90', '94', '90', '2016-06-23 10:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('847', '5', '90', '51', '90', '95', '90', '2016-06-23 10:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('848', '2', '90', '51', '90', '94', '90', '2016-06-23 10:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('849', '2', '90', '51', '90', '94', '90', '2016-06-23 10:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('850', '4', '90', '51', '90', '94', '90', '2016-06-23 10:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('851', '2', '90', '52', '90', '94', '90', '2016-06-23 10:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('852', '4', '90', '52', '90', '91', '90', '2016-06-23 11:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('853', '12', '90', '52', '90', '91', '90', '2016-06-23 11:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('854', '12', '90', '53', '90', '91', '90', '2016-06-23 11:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('855', '5', '90', '53', '90', '91', '90', '2016-06-23 11:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('856', '5', '90', '53', '90', '91', '90', '2016-06-23 11:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('857', '9', '90', '53', '90', '92', '90', '2016-06-23 11:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('858', '5', '90', '63', '90', '91', '90', '2016-06-23 12:38:39', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('859', '33', '90', '63', '90', '91', '90', '2016-06-23 12:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('860', '0', '90', '63', '90', '91', '90', '2016-06-23 12:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('861', '1', '90', '63', '90', '92', '90', '2016-06-23 12:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('862', '2', '90', '63', '90', '92', '90', '2016-06-23 12:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('863', '1', '90', '64', '90', '92', '90', '2016-06-23 12:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('864', '2', '90', '64', '90', '92', '90', '2016-06-23 12:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('865', '8', '90', '64', '90', '92', '90', '2016-06-23 12:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('866', '2', '90', '64', '90', '91', '90', '2016-06-23 12:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('867', '0', '90', '65', '90', '91', '90', '2016-06-23 12:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('868', '1', '90', '65', '90', '91', '90', '2016-06-23 12:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('869', '22', '90', '65', '90', '91', '90', '2016-06-23 12:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('870', '11', '90', '65', '90', '93', '90', '2016-06-23 12:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('871', '13', '90', '65', '90', '92', '90', '2016-06-23 12:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('872', '2', '90', '66', '90', '92', '90', '2016-06-23 12:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('873', '13', '90', '52', '90', '92', '90', '2016-06-23 12:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('874', '3', '90', '67', '90', '94', '90', '2016-06-23 12:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('875', '1', '90', '68', '90', '95', '90', '2016-06-23 12:56:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('876', '5', '90', '68', '90', '94', '90', '2016-06-23 12:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('877', '1', '90', '68', '90', '94', '90', '2016-06-23 12:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('878', '2', '90', '68', '90', '94', '90', '2016-06-23 12:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('879', '1', '90', '69', '90', '95', '90', '2016-06-23 13:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('880', '8', '90', '69', '90', '95', '90', '2016-06-23 13:01:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('881', '16', '90', '69', '90', '95', '90', '2016-06-23 13:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('882', '6', '90', '69', '90', '96', '90', '2016-06-23 13:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('883', '24', '90', '70', '90', '97', '90', '2016-06-23 13:04:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('884', '29', '90', '70', '90', '92', '90', '2016-06-23 13:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('885', '17', '90', '70', '90', '97', '90', '2016-06-23 13:06:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('886', '28', '90', '70', '90', '97', '90', '2016-06-23 13:07:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('887', '15', '90', '55', '90', '92', '90', '2016-06-23 13:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('888', '24', '90', '56', '90', '94', '90', '2016-06-23 13:42:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('889', '8', '90', '56', '90', '91', '90', '2016-06-23 13:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('890', '18', '90', '57', '90', '92', '90', '2016-06-23 13:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('891', '12', '90', '57', '90', '91', '90', '2016-06-23 13:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('892', '3', '90', '67', '90', '91', '90', '2016-06-23 14:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('893', '4', '90', '70', '90', '91', '90', '2016-06-23 14:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('894', '2', '90', '70', '90', '91', '90', '2016-06-23 14:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('895', '2', '90', '72', '90', '91', '90', '2016-06-23 14:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('896', '3', '90', '72', '90', '91', '90', '2016-06-23 14:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('897', '11', '90', '72', '90', '91', '90', '2016-06-23 14:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('898', '6', '90', '72', '90', '91', '90', '2016-06-23 14:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('899', '10', '90', '73', '90', '91', '90', '2016-06-23 14:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('900', '2', '90', '73', '90', '91', '90', '2016-06-23 14:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('901', '2', '90', '74', '90', '91', '90', '2016-06-23 14:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('902', '0', '90', '74', '90', '91', '90', '2016-06-23 14:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('903', '2', '90', '74', '90', '91', '90', '2016-06-23 14:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('904', '2', '90', '74', '90', '91', '90', '2016-06-23 14:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('905', '8', '90', '74', '90', '91', '90', '2016-06-23 14:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('906', '6', '90', '75', '90', '91', '90', '2016-06-23 14:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('907', '7', '90', '75', '90', '94', '90', '2016-06-23 14:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('908', '6', '90', '76', '90', '92', '90', '2016-06-23 14:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('909', '8', '90', '68', '90', '91', '90', '2016-06-23 14:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('910', '12', '90', '78', '90', '92', '90', '2016-06-23 14:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('911', '2', '90', '51', '90', '92', '90', '2016-06-23 14:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('912', '2', '90', '51', '90', '91', '90', '2016-06-23 14:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('913', '1', '90', '51', '90', '91', '90', '2016-06-23 14:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('914', '1', '90', '51', '90', '91', '90', '2016-06-23 14:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('915', '16', '90', '56', '90', '95', '90', '2016-06-23 15:04:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('916', '41', '90', '56', '90', '93', '90', '2016-06-23 15:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('917', '18', '90', '56', '90', '96', '90', '2016-06-23 15:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('918', '16', '90', '57', '90', '95', '90', '2016-06-23 15:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('919', '20', '90', '57', '90', '91', '90', '2016-06-23 15:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('920', '11', '90', '68', '90', '95', '90', '2016-06-23 15:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('921', '2', '90', '73', '90', '93', '90', '2016-06-23 15:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('922', '5', '90', '73', '90', '94', '90', '2016-06-23 15:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('923', '2', '90', '73', '90', '93', '90', '2016-06-23 15:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('924', '24', '90', '74', '90', '93', '90', '2016-06-23 15:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('925', '2', '90', '74', '90', '93', '90', '2016-06-23 15:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('926', '1', '90', '48', '90', '91', '90', '2016-06-23 16:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('927', '20', '90', '51', '90', '92', '90', '2016-06-23 16:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('928', '14', '90', '51', '90', '92', '90', '2016-06-23 16:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('929', '5', '90', '51', '90', '92', '90', '2016-06-23 16:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('930', '14', '90', '52', '90', '91', '90', '2016-06-23 16:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('931', '4', '90', '52', '90', '91', '90', '2016-06-23 16:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('932', '9', '90', '52', '90', '91', '90', '2016-06-23 16:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('933', '12', '90', '52', '90', '92', '90', '2016-06-23 16:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('934', '5', '90', '53', '90', '91', '90', '2016-06-23 16:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('935', '3', '90', '53', '90', '91', '90', '2016-06-23 16:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('936', '8', '90', '54', '90', '93', '90', '2016-06-23 16:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('937', '10', '90', '54', '90', '93', '90', '2016-06-23 16:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('938', '0', '90', '54', '90', '92', '90', '2016-06-23 16:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('939', '12', '90', '54', '90', '93', '90', '2016-06-23 16:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('940', '25', '90', '54', '90', '96', '90', '2016-06-23 16:23:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('941', '21', '90', '55', '90', '96', '90', '2016-06-23 16:24:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('942', '20', '90', '55', '90', '95', '90', '2016-06-23 16:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('943', '12', '90', '55', '90', '96', '90', '2016-06-23 16:26:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('944', '20', '90', '56', '90', '96', '90', '2016-06-23 16:27:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('945', '20', '90', '56', '90', '95', '90', '2016-06-23 16:28:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('946', '18', '90', '56', '90', '96', '90', '2016-06-23 16:29:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('947', '17', '90', '56', '90', '96', '90', '2016-06-23 16:30:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('948', '26', '90', '56', '90', '96', '90', '2016-06-23 16:31:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('949', '25', '90', '57', '90', '96', '90', '2016-06-23 16:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('950', '28', '90', '57', '90', '96', '90', '2016-06-23 16:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('951', '16', '90', '57', '90', '96', '90', '2016-06-23 16:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('952', '19', '90', '57', '90', '96', '90', '2016-06-23 16:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('953', '24', '90', '57', '90', '96', '90', '2016-06-23 16:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('954', '18', '90', '58', '90', '96', '90', '2016-06-23 16:37:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('955', '18', '90', '59', '90', '91', '90', '2016-06-23 16:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('956', '28', '90', '61', '90', '92', '90', '2016-06-23 16:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('957', '25', '90', '67', '90', '93', '90', '2016-06-23 16:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('958', '24', '90', '67', '90', '93', '90', '2016-06-23 16:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('959', '21', '90', '67', '90', '93', '90', '2016-06-23 16:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('960', '22', '90', '68', '90', '93', '90', '2016-06-23 16:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('961', '21', '90', '68', '90', '94', '90', '2016-06-23 16:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('962', '32', '90', '65', '90', '91', '90', '2016-06-23 16:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('963', '15', '90', '69', '90', '91', '90', '2016-06-23 17:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('964', '27', '90', '50', '90', '92', '90', '2016-06-23 17:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('965', '20', '90', '51', '90', '94', '90', '2016-06-23 17:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('966', '37', '90', '51', '90', '95', '90', '2016-06-23 17:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('967', '20', '90', '51', '90', '96', '90', '2016-06-23 17:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('968', '29', '90', '51', '90', '95', '90', '2016-06-23 17:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('969', '27', '90', '52', '90', '95', '90', '2016-06-23 17:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('970', '24', '90', '52', '90', '91', '90', '2016-06-23 17:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('971', '23', '90', '52', '90', '91', '90', '2016-06-23 17:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('972', '20', '90', '57', '90', '94', '90', '2016-06-23 17:42:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('973', '7', '90', '48', '90', '91', '90', '2016-06-24 11:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('974', '8', '90', '50', '90', '91', '90', '2016-06-24 11:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('975', '4', '90', '51', '90', '91', '90', '2016-06-24 11:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('976', '1', '90', '51', '90', '91', '90', '2016-06-24 11:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('977', '5', '90', '51', '90', '91', '90', '2016-06-24 11:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('978', '5', '90', '51', '90', '92', '90', '2016-06-24 11:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('979', '8', '90', '72', '90', '94', '90', '2016-06-24 13:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('980', '23', '90', '72', '90', '94', '90', '2016-06-24 13:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('981', '1', '90', '72', '90', '91', '90', '2016-06-24 13:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('982', '4', '90', '73', '90', '91', '90', '2016-06-24 13:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('983', '2', '90', '73', '90', '92', '90', '2016-06-24 13:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('984', '2', '90', '73', '90', '92', '90', '2016-06-24 13:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('985', '6', '90', '73', '90', '92', '90', '2016-06-24 13:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('986', '9', '90', '73', '90', '92', '90', '2016-06-24 13:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('987', '9', '90', '74', '90', '92', '90', '2016-06-24 13:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('988', '14', '90', '74', '90', '93', '90', '2016-06-24 13:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('989', '10', '90', '74', '90', '95', '90', '2016-06-24 14:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('990', '2', '90', '46', '90', '95', '90', '2016-06-24 14:01:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('991', '94', '90', '51', '90', '87', '90', '2016-06-24 15:52:00', '<font color=\"red\">CPU当前：94%,超出预设值  90%<br></font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('992', '6', '90', '52', '90', '93', '90', '2016-06-24 16:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('993', '4', '90', '56', '90', '93', '90', '2016-06-24 16:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('994', '1', '90', '56', '90', '95', '90', '2016-06-24 16:47:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('995', '6', '90', '57', '90', '95', '90', '2016-06-24 16:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('996', '19', '90', '57', '90', '96', '90', '2016-06-24 16:49:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('997', '1', '90', '57', '90', '95', '90', '2016-06-24 16:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('998', '18', '90', '57', '90', '96', '90', '2016-06-24 16:51:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('999', '9', '90', '58', '90', '95', '90', '2016-06-24 16:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1000', '16', '90', '58', '90', '97', '90', '2016-06-24 16:53:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1001', '9', '90', '58', '90', '97', '90', '2016-06-24 16:54:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1002', '2', '90', '58', '90', '96', '90', '2016-06-24 16:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1003', '6', '90', '58', '90', '96', '90', '2016-06-24 16:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1004', '8', '90', '59', '90', '97', '90', '2016-06-24 16:57:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1005', '9', '90', '59', '90', '97', '90', '2016-06-24 16:58:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1006', '13', '90', '59', '90', '96', '90', '2016-06-24 16:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1007', '4', '90', '59', '90', '96', '90', '2016-06-24 17:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1008', '5', '90', '60', '90', '96', '90', '2016-06-24 17:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1009', '5', '90', '60', '90', '96', '90', '2016-06-24 17:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1010', '7', '90', '61', '90', '96', '90', '2016-06-24 17:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1011', '8', '90', '61', '90', '96', '90', '2016-06-24 17:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1012', '5', '90', '61', '90', '96', '90', '2016-06-24 17:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1013', '16', '90', '62', '90', '96', '90', '2016-06-24 17:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1014', '11', '90', '62', '90', '96', '90', '2016-06-24 17:07:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1015', '14', '90', '64', '90', '91', '90', '2016-06-24 17:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1016', '16', '90', '65', '90', '91', '90', '2016-06-24 17:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1017', '13', '90', '65', '90', '91', '90', '2016-06-24 17:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1018', '17', '90', '65', '90', '91', '90', '2016-06-24 17:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1019', '23', '90', '66', '90', '91', '90', '2016-06-24 17:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1020', '19', '90', '66', '90', '94', '90', '2016-06-24 17:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1021', '9', '90', '64', '90', '91', '90', '2016-06-24 19:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1022', '17', '90', '68', '90', '91', '90', '2016-06-24 19:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1023', '17', '90', '69', '90', '91', '90', '2016-06-24 19:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1024', '12', '90', '67', '90', '93', '90', '2016-06-25 12:39:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1025', '2', '90', '69', '90', '95', '90', '2016-06-25 12:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1026', '5', '90', '69', '90', '95', '90', '2016-06-25 12:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1027', '5', '90', '70', '90', '95', '90', '2016-06-25 12:42:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1028', '3', '90', '70', '90', '95', '90', '2016-06-25 12:43:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1029', '35', '90', '70', '90', '97', '90', '2016-06-25 12:44:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1030', '9', '90', '71', '90', '91', '90', '2016-06-25 12:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1031', '33', '90', '71', '90', '91', '90', '2016-06-25 12:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1032', '20', '90', '71', '90', '92', '90', '2016-06-25 12:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1033', '31', '90', '46', '90', '92', '90', '2016-06-25 13:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1034', '2', '90', '51', '90', '91', '90', '2016-06-25 13:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1035', '5', '90', '51', '90', '92', '90', '2016-06-25 13:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1036', '8', '90', '51', '90', '91', '90', '2016-06-25 13:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1037', '15', '90', '51', '90', '91', '90', '2016-06-25 13:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1038', '15', '90', '51', '90', '93', '90', '2016-06-25 13:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1039', '15', '90', '52', '90', '93', '90', '2016-06-25 13:46:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1040', '5', '90', '52', '90', '92', '90', '2016-06-25 13:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1041', '20', '90', '81', '90', '97', '90', '2016-06-25 13:48:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1042', '4', '90', '50', '90', '96', '90', '2016-06-25 13:49:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1043', '3', '90', '50', '90', '96', '90', '2016-06-25 13:50:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1044', '2', '90', '50', '90', '97', '90', '2016-06-25 13:51:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1045', '2', '90', '51', '90', '97', '90', '2016-06-25 13:52:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1046', '6', '90', '51', '90', '97', '90', '2016-06-25 13:53:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1047', '1', '90', '51', '90', '97', '90', '2016-06-25 13:54:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1048', '13', '90', '52', '90', '97', '90', '2016-06-25 13:55:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1049', '2', '90', '52', '90', '96', '90', '2016-06-25 13:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1050', '7', '90', '52', '90', '96', '90', '2016-06-25 13:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1051', '2', '90', '52', '90', '96', '90', '2016-06-25 13:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1052', '7', '90', '52', '90', '96', '90', '2016-06-25 13:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1053', '20', '90', '53', '90', '98', '90', '2016-06-25 14:00:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1054', '12', '90', '53', '90', '96', '90', '2016-06-25 14:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1055', '1', '90', '53', '90', '96', '90', '2016-06-25 14:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1056', '2', '90', '54', '90', '96', '90', '2016-06-25 14:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1057', '1', '90', '54', '90', '96', '90', '2016-06-25 14:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1058', '3', '90', '54', '90', '95', '90', '2016-06-25 14:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1059', '1', '90', '54', '90', '96', '90', '2016-06-25 14:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1060', '19', '90', '60', '90', '94', '90', '2016-06-25 15:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1061', '8', '90', '64', '90', '93', '90', '2016-06-25 15:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1062', '23', '90', '54', '90', '91', '90', '2016-06-25 15:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1063', '21', '90', '63', '90', '91', '90', '2016-06-25 15:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1064', '4', '90', '64', '90', '91', '90', '2016-06-25 15:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1065', '6', '90', '64', '90', '91', '90', '2016-06-25 15:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1066', '2', '90', '66', '90', '91', '90', '2016-06-25 15:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1067', '1', '90', '66', '90', '91', '90', '2016-06-25 15:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1068', '28', '90', '66', '90', '91', '90', '2016-06-25 15:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1069', '9', '90', '48', '90', '91', '90', '2016-06-25 15:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1070', '5', '90', '48', '90', '91', '90', '2016-06-25 15:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1071', '7', '90', '48', '90', '92', '90', '2016-06-25 15:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1072', '4', '90', '48', '90', '91', '90', '2016-06-25 15:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1073', '2', '90', '49', '90', '92', '90', '2016-06-25 15:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1074', '1', '90', '49', '90', '93', '90', '2016-06-25 15:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1075', '4', '90', '49', '90', '92', '90', '2016-06-25 15:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1076', '2', '90', '50', '90', '93', '90', '2016-06-25 15:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1077', '2', '90', '50', '90', '92', '90', '2016-06-25 15:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1078', '2', '90', '50', '90', '92', '90', '2016-06-25 15:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1079', '2', '90', '50', '90', '92', '90', '2016-06-25 15:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1080', '1', '90', '50', '90', '92', '90', '2016-06-25 15:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1081', '3', '90', '51', '90', '92', '90', '2016-06-25 15:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1082', '3', '90', '51', '90', '92', '90', '2016-06-25 15:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1083', '1', '90', '51', '90', '92', '90', '2016-06-25 15:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1084', '1', '90', '52', '90', '91', '90', '2016-06-25 15:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1085', '5', '90', '52', '90', '91', '90', '2016-06-25 15:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1086', '13', '90', '52', '90', '91', '90', '2016-06-25 15:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1087', '2', '90', '52', '90', '92', '90', '2016-06-25 15:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1088', '2', '90', '53', '90', '92', '90', '2016-06-25 15:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1089', '2', '90', '53', '90', '92', '90', '2016-06-25 15:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1090', '2', '90', '53', '90', '92', '90', '2016-06-25 15:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1091', '1', '90', '53', '90', '92', '90', '2016-06-25 15:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1092', '2', '90', '53', '90', '91', '90', '2016-06-25 15:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1093', '17', '90', '54', '90', '92', '90', '2016-06-25 15:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1094', '2', '90', '54', '90', '92', '90', '2016-06-25 15:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1095', '9', '90', '54', '90', '92', '90', '2016-06-25 15:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1096', '18', '90', '54', '90', '94', '90', '2016-06-25 15:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1097', '5', '90', '54', '90', '93', '90', '2016-06-25 16:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1098', '5', '90', '55', '90', '93', '90', '2016-06-25 16:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1099', '16', '90', '55', '90', '93', '90', '2016-06-25 16:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1100', '6', '90', '55', '90', '93', '90', '2016-06-25 16:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1101', '3', '90', '55', '90', '94', '90', '2016-06-25 16:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1102', '3', '90', '56', '90', '93', '90', '2016-06-25 16:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1103', '4', '90', '56', '90', '93', '90', '2016-06-25 16:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1104', '26', '90', '56', '90', '93', '90', '2016-06-25 16:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1105', '15', '90', '56', '90', '94', '90', '2016-06-25 16:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1106', '20', '90', '57', '90', '95', '90', '2016-06-25 16:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1107', '16', '90', '57', '90', '94', '90', '2016-06-25 16:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1108', '11', '90', '57', '90', '95', '90', '2016-06-25 16:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1109', '19', '90', '57', '90', '95', '90', '2016-06-25 16:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1110', '18', '90', '58', '90', '94', '90', '2016-06-25 16:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1111', '2', '90', '58', '90', '96', '90', '2016-06-25 16:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1112', '3', '90', '58', '90', '96', '90', '2016-06-25 16:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1113', '7', '90', '58', '90', '97', '90', '2016-06-25 16:16:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1114', '1', '90', '58', '90', '98', '90', '2016-06-25 16:17:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1115', '21', '90', '59', '90', '97', '90', '2016-06-25 16:18:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1116', '7', '90', '59', '90', '91', '90', '2016-06-25 16:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1117', '35', '90', '59', '90', '94', '90', '2016-06-25 16:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1118', '21', '90', '59', '90', '93', '90', '2016-06-25 16:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1119', '6', '90', '59', '90', '95', '90', '2016-06-25 16:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1120', '9', '90', '60', '90', '94', '90', '2016-06-25 16:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1121', '2', '90', '60', '90', '95', '90', '2016-06-25 16:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1122', '6', '90', '60', '90', '94', '90', '2016-06-25 16:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1123', '2', '90', '60', '90', '94', '90', '2016-06-25 16:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1124', '10', '90', '61', '90', '96', '90', '2016-06-25 16:27:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1125', '1', '90', '48', '90', '91', '90', '2016-06-25 16:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1126', '12', '90', '56', '90', '91', '90', '2016-06-25 16:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1127', '3', '90', '57', '90', '91', '90', '2016-06-25 16:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1128', '4', '90', '57', '90', '92', '90', '2016-06-25 16:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1129', '18', '90', '57', '90', '91', '90', '2016-06-25 16:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1130', '5', '90', '46', '90', '92', '90', '2016-06-25 16:40:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1131', '2', '90', '61', '90', '93', '90', '2016-06-25 16:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1132', '9', '90', '61', '90', '93', '90', '2016-06-25 16:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1133', '6', '90', '61', '90', '93', '90', '2016-06-25 16:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1134', '17', '90', '61', '90', '93', '90', '2016-06-25 16:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1135', '10', '90', '62', '90', '93', '90', '2016-06-25 16:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1136', '10', '90', '62', '90', '93', '90', '2016-06-25 16:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1137', '17', '90', '62', '90', '94', '90', '2016-06-25 16:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1138', '2', '90', '63', '90', '94', '90', '2016-06-25 16:48:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1139', '19', '90', '63', '90', '95', '90', '2016-06-25 16:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1140', '3', '90', '63', '90', '94', '90', '2016-06-25 16:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1141', '7', '90', '63', '90', '94', '90', '2016-06-25 16:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1142', '14', '90', '64', '90', '93', '90', '2016-06-25 16:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1143', '2', '90', '64', '90', '92', '90', '2016-06-25 16:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1144', '5', '90', '64', '90', '92', '90', '2016-06-25 16:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1145', '8', '90', '64', '90', '92', '90', '2016-06-25 16:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1146', '1', '90', '65', '90', '92', '90', '2016-06-25 16:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1147', '9', '90', '65', '90', '91', '90', '2016-06-25 16:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1148', '0', '90', '65', '90', '91', '90', '2016-06-25 16:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1149', '13', '90', '65', '90', '93', '90', '2016-06-25 16:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1150', '17', '90', '66', '90', '93', '90', '2016-06-25 17:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1151', '16', '90', '66', '90', '93', '90', '2016-06-25 17:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1152', '11', '90', '66', '90', '94', '90', '2016-06-25 17:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1153', '4', '90', '48', '90', '94', '90', '2016-06-25 17:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1154', '21', '90', '54', '90', '94', '90', '2016-06-25 17:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1155', '27', '90', '55', '90', '94', '90', '2016-06-25 17:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1156', '22', '90', '55', '90', '94', '90', '2016-06-25 17:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1157', '43', '90', '55', '90', '94', '90', '2016-06-25 17:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1158', '12', '90', '60', '90', '95', '90', '2016-06-25 17:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1159', '17', '90', '67', '90', '95', '90', '2016-06-25 17:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1160', '10', '90', '67', '90', '95', '90', '2016-06-25 17:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1161', '13', '90', '47', '90', '95', '90', '2016-06-25 17:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1162', '19', '90', '67', '90', '96', '90', '2016-06-25 17:13:34', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1163', '22', '90', '55', '90', '97', '90', '2016-06-25 17:14:07', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1164', '27', '90', '56', '90', '91', '90', '2016-06-25 17:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1165', '11', '90', '57', '90', '92', '90', '2016-06-25 18:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1166', '16', '90', '70', '90', '92', '90', '2016-06-25 18:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1167', '8', '90', '80', '90', '94', '90', '2016-06-25 18:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1168', '10', '90', '66', '90', '95', '90', '2016-06-25 18:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1169', '12', '90', '48', '90', '94', '90', '2016-06-25 18:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1170', '10', '90', '69', '90', '94', '90', '2016-06-25 18:08:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1171', '48', '90', '54', '90', '95', '90', '2016-06-25 18:09:49', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1172', '37', '90', '54', '90', '94', '90', '2016-06-25 18:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1173', '5', '90', '50', '90', '93', '90', '2016-06-27 11:14:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1174', '28', '90', '57', '90', '94', '90', '2016-06-27 11:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1175', '5', '90', '57', '90', '94', '90', '2016-06-27 11:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1176', '9', '90', '58', '90', '94', '90', '2016-06-27 11:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1177', '17', '90', '58', '90', '95', '90', '2016-06-27 11:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1178', '8', '90', '49', '90', '92', '90', '2016-06-27 11:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1179', '3', '90', '53', '90', '92', '90', '2016-06-27 11:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1180', '1', '90', '53', '90', '92', '90', '2016-06-27 11:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1181', '13', '90', '53', '90', '92', '90', '2016-06-27 11:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1182', '1', '90', '53', '90', '93', '90', '2016-06-27 11:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1183', '6', '90', '54', '90', '92', '90', '2016-06-27 11:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1184', '6', '90', '54', '90', '94', '90', '2016-06-27 11:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1185', '2', '90', '54', '90', '93', '90', '2016-06-27 11:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1186', '2', '90', '54', '90', '93', '90', '2016-06-27 11:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1187', '2', '90', '55', '90', '93', '90', '2016-06-27 11:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1188', '5', '90', '55', '90', '93', '90', '2016-06-27 11:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1189', '2', '90', '55', '90', '92', '90', '2016-06-27 11:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1190', '5', '90', '55', '90', '93', '90', '2016-06-27 11:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1191', '5', '90', '56', '90', '93', '90', '2016-06-27 11:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1192', '1', '90', '56', '90', '93', '90', '2016-06-27 11:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1193', '2', '90', '56', '90', '93', '90', '2016-06-27 11:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1194', '2', '90', '57', '90', '93', '90', '2016-06-27 11:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1195', '3', '90', '57', '90', '93', '90', '2016-06-27 11:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1196', '2', '90', '57', '90', '93', '90', '2016-06-27 11:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1197', '1', '90', '57', '90', '93', '90', '2016-06-27 11:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1198', '2', '90', '57', '90', '94', '90', '2016-06-27 11:42:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1199', '1', '90', '58', '90', '94', '90', '2016-06-27 11:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1200', '5', '90', '58', '90', '94', '90', '2016-06-27 11:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1201', '5', '90', '58', '90', '94', '90', '2016-06-27 11:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1202', '2', '90', '58', '90', '94', '90', '2016-06-27 11:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1203', '5', '90', '58', '90', '94', '90', '2016-06-27 11:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1204', '4', '90', '59', '90', '95', '90', '2016-06-27 11:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1205', '13', '90', '60', '90', '93', '90', '2016-06-27 11:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1206', '9', '90', '60', '90', '92', '90', '2016-06-27 11:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1207', '11', '90', '60', '90', '93', '90', '2016-06-27 11:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1208', '6', '90', '60', '90', '93', '90', '2016-06-27 11:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1209', '8', '90', '61', '90', '93', '90', '2016-06-27 11:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1210', '2', '90', '61', '90', '92', '90', '2016-06-27 12:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1211', '3', '90', '61', '90', '91', '90', '2016-06-27 12:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1212', '7', '90', '62', '90', '92', '90', '2016-06-27 12:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1213', '5', '90', '62', '90', '92', '90', '2016-06-27 12:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1214', '3', '90', '62', '90', '92', '90', '2016-06-27 12:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1215', '11', '90', '62', '90', '92', '90', '2016-06-27 12:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1216', '1', '90', '63', '90', '97', '90', '2016-06-27 12:08:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1217', '0', '90', '63', '90', '92', '90', '2016-06-27 12:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1218', '3', '90', '63', '90', '91', '90', '2016-06-27 12:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1219', '5', '90', '63', '90', '91', '90', '2016-06-27 12:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1220', '1', '90', '63', '90', '91', '90', '2016-06-27 12:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1221', '9', '90', '64', '90', '91', '90', '2016-06-27 12:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1222', '2', '90', '64', '90', '93', '90', '2016-06-27 12:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1223', '8', '90', '64', '90', '92', '90', '2016-06-27 12:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1224', '1', '90', '64', '90', '92', '90', '2016-06-27 12:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1225', '4', '90', '64', '90', '93', '90', '2016-06-27 12:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1226', '1', '90', '65', '90', '93', '90', '2016-06-27 12:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1227', '10', '90', '65', '90', '93', '90', '2016-06-27 12:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1228', '5', '90', '65', '90', '94', '90', '2016-06-27 12:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1229', '2', '90', '66', '90', '93', '90', '2016-06-27 12:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1230', '3', '90', '66', '90', '93', '90', '2016-06-27 12:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1231', '14', '90', '66', '90', '93', '90', '2016-06-27 12:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1232', '7', '90', '66', '90', '94', '90', '2016-06-27 12:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1233', '3', '90', '66', '90', '94', '90', '2016-06-27 12:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1234', '4', '90', '67', '90', '94', '90', '2016-06-27 12:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1235', '12', '90', '67', '90', '98', '90', '2016-06-27 12:27:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1236', '1', '90', '67', '90', '91', '90', '2016-06-27 12:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1237', '6', '90', '68', '90', '92', '90', '2016-06-27 12:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1238', '3', '90', '68', '90', '92', '90', '2016-06-27 12:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1239', '25', '90', '68', '90', '92', '90', '2016-06-27 12:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1240', '9', '90', '68', '90', '93', '90', '2016-06-27 12:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1241', '2', '90', '68', '90', '91', '90', '2016-06-27 12:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1242', '4', '90', '69', '90', '91', '90', '2016-06-27 12:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1243', '25', '90', '69', '90', '92', '90', '2016-06-27 12:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1244', '5', '90', '69', '90', '92', '90', '2016-06-27 12:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1245', '8', '90', '70', '90', '92', '90', '2016-06-27 12:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1246', '17', '90', '70', '90', '91', '90', '2016-06-27 12:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1247', '6', '90', '71', '90', '92', '90', '2016-06-27 12:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1248', '23', '90', '71', '90', '92', '90', '2016-06-27 12:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1249', '2', '90', '71', '90', '92', '90', '2016-06-27 12:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1250', '2', '90', '71', '90', '92', '90', '2016-06-27 12:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1251', '5', '90', '72', '90', '92', '90', '2016-06-27 12:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1252', '1', '90', '72', '90', '92', '90', '2016-06-27 12:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1253', '2', '90', '72', '90', '94', '90', '2016-06-27 12:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1254', '10', '90', '72', '90', '95', '90', '2016-06-27 12:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1255', '8', '90', '72', '90', '95', '90', '2016-06-27 12:53:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1256', '29', '90', '73', '90', '94', '90', '2016-06-27 12:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1257', '9', '90', '73', '90', '98', '90', '2016-06-27 12:55:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1258', '17', '90', '73', '90', '96', '90', '2016-06-27 12:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1259', '9', '90', '73', '90', '96', '90', '2016-06-27 12:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1260', '15', '90', '73', '90', '96', '90', '2016-06-27 12:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1261', '9', '90', '74', '90', '96', '90', '2016-06-27 12:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1262', '8', '90', '74', '90', '96', '90', '2016-06-27 13:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1263', '7', '90', '74', '90', '96', '90', '2016-06-27 13:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1264', '9', '90', '74', '90', '97', '90', '2016-06-27 13:02:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1265', '17', '90', '75', '90', '91', '90', '2016-06-27 13:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1266', '17', '90', '75', '90', '92', '90', '2016-06-27 13:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1267', '8', '90', '47', '90', '93', '90', '2016-06-27 13:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1268', '8', '90', '47', '90', '94', '90', '2016-06-27 13:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1269', '5', '90', '48', '90', '95', '90', '2016-06-27 13:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1270', '5', '90', '48', '90', '94', '90', '2016-06-27 13:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1271', '5', '90', '48', '90', '95', '90', '2016-06-27 13:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1272', '0', '90', '48', '90', '95', '90', '2016-06-27 13:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1273', '1', '90', '48', '90', '95', '90', '2016-06-27 13:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1274', '5', '90', '49', '90', '95', '90', '2016-06-27 13:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1275', '8', '90', '49', '90', '95', '90', '2016-06-27 13:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1276', '1', '90', '49', '90', '95', '90', '2016-06-27 13:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1277', '2', '90', '49', '90', '95', '90', '2016-06-27 13:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1278', '1', '90', '50', '90', '95', '90', '2016-06-27 13:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1279', '3', '90', '50', '90', '97', '90', '2016-06-27 13:19:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1280', '1', '90', '50', '90', '96', '90', '2016-06-27 13:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1281', '2', '90', '50', '90', '96', '90', '2016-06-27 13:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1282', '5', '90', '51', '90', '96', '90', '2016-06-27 13:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1283', '0', '90', '51', '90', '97', '90', '2016-06-27 13:23:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1284', '4', '90', '51', '90', '98', '90', '2016-06-27 13:24:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1285', '2', '90', '51', '90', '98', '90', '2016-06-27 13:25:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1286', '1', '90', '51', '90', '98', '90', '2016-06-27 13:26:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1287', '1', '90', '51', '90', '98', '90', '2016-06-27 13:27:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1288', '1', '90', '52', '90', '98', '90', '2016-06-27 13:28:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1289', '4', '90', '52', '90', '98', '90', '2016-06-27 13:29:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1290', '1', '90', '52', '90', '97', '90', '2016-06-27 13:30:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1291', '3', '90', '52', '90', '98', '90', '2016-06-27 13:31:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1292', '2', '90', '53', '90', '98', '90', '2016-06-27 13:32:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1293', '1', '90', '53', '90', '98', '90', '2016-06-27 13:33:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1294', '7', '90', '53', '90', '99', '90', '2016-06-27 13:34:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1295', '2', '90', '53', '90', '91', '90', '2016-06-27 13:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1296', '8', '90', '54', '90', '92', '90', '2016-06-27 13:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1297', '2', '90', '55', '90', '93', '90', '2016-06-27 13:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1298', '17', '90', '57', '90', '92', '90', '2016-06-27 13:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1299', '2', '90', '59', '90', '92', '90', '2016-06-27 15:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1300', '13', '90', '67', '90', '93', '90', '2016-06-27 15:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1301', '25', '90', '68', '90', '92', '90', '2016-06-27 15:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1302', '16', '90', '68', '90', '92', '90', '2016-06-27 15:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1303', '2', '90', '68', '90', '92', '90', '2016-06-27 15:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1304', '10', '90', '69', '90', '92', '90', '2016-06-27 15:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1305', '3', '90', '69', '90', '91', '90', '2016-06-27 15:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1306', '2', '90', '69', '90', '91', '90', '2016-06-27 15:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1307', '2', '90', '69', '90', '92', '90', '2016-06-27 15:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1308', '9', '90', '70', '90', '92', '90', '2016-06-27 15:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1309', '7', '90', '70', '90', '91', '90', '2016-06-27 15:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1310', '15', '90', '70', '90', '92', '90', '2016-06-27 15:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1311', '22', '90', '71', '90', '93', '90', '2016-06-27 15:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1312', '9', '90', '71', '90', '92', '90', '2016-06-27 15:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1313', '5', '90', '71', '90', '92', '90', '2016-06-27 15:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1314', '14', '90', '72', '90', '92', '90', '2016-06-27 15:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1315', '11', '90', '72', '90', '92', '90', '2016-06-27 15:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1316', '1', '90', '72', '90', '92', '90', '2016-06-27 15:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1317', '1', '90', '73', '90', '93', '90', '2016-06-27 15:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1318', '5', '90', '73', '90', '95', '90', '2016-06-27 15:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1319', '1', '90', '73', '90', '94', '90', '2016-06-27 15:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1320', '5', '90', '73', '90', '94', '90', '2016-06-27 15:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1321', '23', '90', '74', '90', '96', '90', '2016-06-27 15:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1322', '13', '90', '74', '90', '94', '90', '2016-06-27 15:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1323', '16', '90', '74', '90', '94', '90', '2016-06-27 15:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1324', '2', '90', '75', '90', '93', '90', '2016-06-27 15:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1325', '2', '90', '75', '90', '93', '90', '2016-06-27 15:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1326', '1', '90', '75', '90', '93', '90', '2016-06-27 15:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1327', '5', '90', '75', '90', '93', '90', '2016-06-27 15:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1328', '5', '90', '76', '90', '92', '90', '2016-06-27 15:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1329', '4', '90', '76', '90', '93', '90', '2016-06-27 15:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1330', '9', '90', '76', '90', '93', '90', '2016-06-27 15:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1331', '7', '90', '77', '90', '93', '90', '2016-06-27 15:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1332', '9', '90', '77', '90', '92', '90', '2016-06-27 15:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1333', '2', '90', '77', '90', '92', '90', '2016-06-27 15:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1334', '16', '90', '78', '90', '92', '90', '2016-06-27 15:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1335', '4', '90', '78', '90', '92', '90', '2016-06-27 15:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1336', '3', '90', '78', '90', '92', '90', '2016-06-27 15:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1337', '5', '90', '79', '90', '92', '90', '2016-06-27 15:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1338', '2', '90', '79', '90', '92', '90', '2016-06-27 15:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1339', '1', '90', '79', '90', '92', '90', '2016-06-27 16:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1340', '2', '90', '79', '90', '92', '90', '2016-06-27 16:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1341', '13', '90', '80', '90', '94', '90', '2016-06-27 16:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1342', '5', '90', '80', '90', '94', '90', '2016-06-27 16:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1343', '5', '90', '80', '90', '93', '90', '2016-06-27 16:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1344', '5', '90', '80', '90', '93', '90', '2016-06-27 16:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1345', '13', '90', '81', '90', '93', '90', '2016-06-27 16:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1346', '13', '90', '81', '90', '93', '90', '2016-06-27 16:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1347', '4', '90', '81', '90', '93', '90', '2016-06-27 16:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1348', '2', '90', '82', '90', '93', '90', '2016-06-27 16:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1349', '2', '90', '82', '90', '92', '90', '2016-06-27 16:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1350', '2', '90', '82', '90', '92', '90', '2016-06-27 16:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1351', '2', '90', '82', '90', '92', '90', '2016-06-27 16:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1352', '2', '90', '83', '90', '92', '90', '2016-06-27 16:13:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1353', '5', '90', '83', '90', '92', '90', '2016-06-27 16:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1354', '5', '90', '83', '90', '92', '90', '2016-06-27 16:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1355', '6', '90', '83', '90', '92', '90', '2016-06-27 16:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1356', '2', '90', '57', '90', '92', '90', '2016-06-27 16:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1357', '4', '90', '57', '90', '92', '90', '2016-06-27 16:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1358', '2', '90', '58', '90', '92', '90', '2016-06-27 16:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1359', '2', '90', '58', '90', '91', '90', '2016-06-27 16:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1360', '7', '90', '59', '90', '91', '90', '2016-06-27 16:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1361', '1', '90', '60', '90', '91', '90', '2016-06-27 16:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1362', '12', '90', '60', '90', '91', '90', '2016-06-27 16:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1363', '7', '90', '60', '90', '91', '90', '2016-06-27 16:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1364', '5', '90', '60', '90', '91', '90', '2016-06-27 16:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1365', '3', '90', '61', '90', '91', '90', '2016-06-27 16:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1366', '6', '90', '61', '90', '91', '90', '2016-06-27 16:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1367', '4', '90', '61', '90', '91', '90', '2016-06-27 16:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1368', '3', '90', '61', '90', '91', '90', '2016-06-27 16:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1369', '5', '90', '62', '90', '91', '90', '2016-06-27 16:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1370', '2', '90', '62', '90', '91', '90', '2016-06-27 16:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1371', '5', '90', '62', '90', '92', '90', '2016-06-27 16:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1372', '7', '90', '60', '90', '93', '90', '2016-06-28 12:48:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1373', '8', '90', '67', '90', '93', '90', '2016-06-28 12:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1374', '2', '90', '67', '90', '93', '90', '2016-06-28 12:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1375', '23', '90', '49', '90', '93', '90', '2016-06-28 12:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1376', '1', '90', '68', '90', '94', '90', '2016-06-28 12:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1377', '2', '90', '68', '90', '93', '90', '2016-06-28 12:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1378', '1', '90', '69', '90', '92', '90', '2016-06-28 12:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1379', '10', '90', '69', '90', '92', '90', '2016-06-28 12:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1380', '1', '90', '69', '90', '93', '90', '2016-06-28 12:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1381', '1', '90', '69', '90', '93', '90', '2016-06-28 12:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1382', '2', '90', '69', '90', '93', '90', '2016-06-28 12:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1383', '6', '90', '70', '90', '93', '90', '2016-06-28 12:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1384', '1', '90', '70', '90', '93', '90', '2016-06-28 13:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1385', '13', '90', '72', '90', '94', '90', '2016-06-28 13:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1386', '10', '90', '74', '90', '94', '90', '2016-06-28 13:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1387', '25', '90', '61', '90', '94', '90', '2016-06-28 16:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1388', '2', '90', '51', '90', '93', '90', '2016-06-28 16:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1389', '2', '90', '51', '90', '92', '90', '2016-06-28 16:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1390', '7', '90', '51', '90', '92', '90', '2016-06-28 16:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1391', '5', '90', '52', '90', '92', '90', '2016-06-28 16:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1392', '2', '90', '52', '90', '92', '90', '2016-06-28 16:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1393', '8', '90', '52', '90', '92', '90', '2016-06-28 16:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1394', '8', '90', '52', '90', '91', '90', '2016-06-28 16:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1395', '13', '90', '53', '90', '92', '90', '2016-06-28 16:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1396', '15', '90', '53', '90', '93', '90', '2016-06-28 16:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1397', '9', '90', '53', '90', '92', '90', '2016-06-28 16:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1398', '6', '90', '53', '90', '92', '90', '2016-06-28 16:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1399', '22', '90', '57', '90', '91', '90', '2016-06-28 16:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1400', '12', '90', '64', '90', '93', '90', '2016-06-28 16:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1401', '25', '90', '51', '90', '93', '90', '2016-06-28 16:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1402', '31', '90', '52', '90', '93', '90', '2016-06-28 16:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1403', '13', '90', '52', '90', '93', '90', '2016-06-28 16:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1404', '6', '90', '52', '90', '93', '90', '2016-06-28 16:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1405', '10', '90', '53', '90', '93', '90', '2016-06-28 16:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1406', '12', '90', '53', '90', '93', '90', '2016-06-28 16:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1407', '8', '90', '53', '90', '93', '90', '2016-06-28 16:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1408', '9', '90', '53', '90', '93', '90', '2016-06-28 16:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1409', '7', '90', '54', '90', '92', '90', '2016-06-28 16:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1410', '9', '90', '54', '90', '92', '90', '2016-06-28 16:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1411', '2', '90', '54', '90', '92', '90', '2016-06-28 16:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1412', '17', '90', '54', '90', '92', '90', '2016-06-28 16:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1413', '9', '90', '55', '90', '92', '90', '2016-06-28 16:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1414', '17', '90', '55', '90', '93', '90', '2016-06-28 16:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1415', '8', '90', '55', '90', '93', '90', '2016-06-28 16:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1416', '12', '90', '55', '90', '93', '90', '2016-06-28 17:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1417', '8', '90', '56', '90', '93', '90', '2016-06-28 17:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1418', '7', '90', '56', '90', '93', '90', '2016-06-28 17:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1419', '15', '90', '56', '90', '96', '90', '2016-06-28 17:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1420', '13', '90', '56', '90', '92', '90', '2016-06-28 17:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1421', '5', '90', '57', '90', '94', '90', '2016-06-28 17:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1422', '2', '90', '57', '90', '94', '90', '2016-06-28 17:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1423', '6', '90', '57', '90', '95', '90', '2016-06-28 17:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1424', '16', '90', '57', '90', '93', '90', '2016-06-28 17:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1425', '17', '90', '58', '90', '91', '90', '2016-06-28 17:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1426', '19', '90', '58', '90', '95', '90', '2016-06-28 17:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1427', '7', '90', '58', '90', '96', '90', '2016-06-28 17:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1428', '8', '90', '58', '90', '95', '90', '2016-06-28 17:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1429', '4', '90', '59', '90', '95', '90', '2016-06-28 17:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1430', '5', '90', '59', '90', '95', '90', '2016-06-28 17:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1431', '4', '90', '59', '90', '94', '90', '2016-06-28 17:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1432', '5', '90', '59', '90', '94', '90', '2016-06-28 17:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1433', '12', '90', '60', '90', '96', '90', '2016-06-28 17:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1434', '3', '90', '60', '90', '96', '90', '2016-06-28 17:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1435', '5', '90', '60', '90', '96', '90', '2016-06-28 17:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1436', '2', '90', '60', '90', '96', '90', '2016-06-28 17:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1437', '5', '90', '60', '90', '96', '90', '2016-06-28 17:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1438', '3', '90', '61', '90', '96', '90', '2016-06-28 17:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1439', '2', '90', '61', '90', '96', '90', '2016-06-28 17:23:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1440', '5', '90', '61', '90', '96', '90', '2016-06-28 17:24:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1441', '7', '90', '61', '90', '95', '90', '2016-06-28 17:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1442', '6', '90', '61', '90', '95', '90', '2016-06-28 17:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1443', '1', '90', '62', '90', '95', '90', '2016-06-28 17:27:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1444', '2', '90', '62', '90', '95', '90', '2016-06-28 17:28:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1445', '4', '90', '62', '90', '95', '90', '2016-06-28 17:29:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1446', '7', '90', '63', '90', '96', '90', '2016-06-28 17:30:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1447', '7', '90', '63', '90', '96', '90', '2016-06-28 17:31:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1448', '1', '90', '63', '90', '96', '90', '2016-06-28 17:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1449', '5', '90', '63', '90', '96', '90', '2016-06-28 17:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1450', '0', '90', '63', '90', '96', '90', '2016-06-28 17:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1451', '6', '90', '64', '90', '95', '90', '2016-06-28 17:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1452', '5', '90', '64', '90', '95', '90', '2016-06-28 17:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1453', '2', '90', '64', '90', '95', '90', '2016-06-28 17:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1454', '3', '90', '64', '90', '96', '90', '2016-06-28 17:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1455', '1', '90', '65', '90', '96', '90', '2016-06-28 17:39:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1456', '1', '90', '65', '90', '96', '90', '2016-06-28 17:40:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1457', '4', '90', '65', '90', '96', '90', '2016-06-28 17:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1458', '5', '90', '65', '90', '96', '90', '2016-06-28 17:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1459', '3', '90', '65', '90', '96', '90', '2016-06-28 17:43:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1460', '6', '90', '66', '90', '97', '90', '2016-06-28 17:44:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1461', '29', '90', '66', '90', '91', '90', '2016-06-28 17:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1462', '20', '90', '66', '90', '93', '90', '2016-06-28 17:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1463', '35', '90', '67', '90', '94', '90', '2016-06-28 17:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1464', '17', '90', '67', '90', '94', '90', '2016-06-28 17:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1465', '24', '90', '67', '90', '95', '90', '2016-06-28 17:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1466', '28', '90', '67', '90', '92', '90', '2016-06-28 17:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1467', '32', '90', '68', '90', '94', '90', '2016-06-28 17:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1468', '28', '90', '68', '90', '93', '90', '2016-06-28 17:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1469', '19', '90', '68', '90', '92', '90', '2016-06-28 17:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1470', '14', '90', '69', '90', '91', '90', '2016-06-28 17:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1471', '4', '90', '69', '90', '93', '90', '2016-06-28 18:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1472', '4', '90', '69', '90', '93', '90', '2016-06-28 18:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1473', '18', '90', '69', '90', '91', '90', '2016-06-28 18:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1474', '5', '90', '70', '90', '91', '90', '2016-06-28 18:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1475', '20', '90', '73', '90', '91', '90', '2016-06-28 18:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1476', '24', '90', '74', '90', '91', '90', '2016-06-28 18:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1477', '23', '90', '74', '90', '92', '90', '2016-06-28 18:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1478', '19', '90', '74', '90', '91', '90', '2016-06-28 18:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1479', '13', '90', '74', '90', '91', '90', '2016-06-28 18:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1480', '17', '90', '75', '90', '91', '90', '2016-06-28 18:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1481', '21', '90', '75', '90', '92', '90', '2016-06-28 18:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1482', '17', '90', '75', '90', '92', '90', '2016-06-28 18:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1483', '17', '90', '75', '90', '93', '90', '2016-06-28 18:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1484', '12', '90', '75', '90', '93', '90', '2016-06-28 18:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1485', '26', '90', '76', '90', '93', '90', '2016-06-28 18:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1486', '20', '90', '76', '90', '93', '90', '2016-06-28 18:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1487', '12', '90', '76', '90', '93', '90', '2016-06-28 18:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1488', '16', '90', '76', '90', '93', '90', '2016-06-28 18:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1489', '12', '90', '77', '90', '93', '90', '2016-06-28 18:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1490', '16', '90', '49', '90', '93', '90', '2016-06-28 18:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1491', '26', '90', '49', '90', '92', '90', '2016-06-28 18:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1492', '20', '90', '49', '90', '92', '90', '2016-06-28 18:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1493', '20', '90', '49', '90', '92', '90', '2016-06-28 18:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1494', '6', '90', '57', '90', '91', '90', '2016-06-28 19:43:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1495', '17', '90', '59', '90', '91', '90', '2016-06-28 19:51:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1496', '2', '90', '60', '90', '93', '90', '2016-06-28 20:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1497', '2', '90', '60', '90', '94', '90', '2016-06-28 20:01:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1498', '13', '90', '61', '90', '91', '90', '2016-06-28 20:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1499', '4', '90', '61', '90', '93', '90', '2016-06-28 20:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1500', '7', '90', '61', '90', '91', '90', '2016-06-28 20:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1501', '3', '90', '62', '90', '92', '90', '2016-06-28 20:10:06', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1502', '20', '90', '62', '90', '95', '90', '2016-06-28 20:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1503', '5', '90', '62', '90', '93', '90', '2016-06-28 20:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1504', '16', '90', '62', '90', '93', '90', '2016-06-28 20:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1505', '5', '90', '63', '90', '93', '90', '2016-06-28 20:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1506', '5', '90', '63', '90', '92', '90', '2016-06-28 20:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1507', '8', '90', '63', '90', '92', '90', '2016-06-28 20:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1508', '8', '90', '64', '90', '94', '90', '2016-06-28 20:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1509', '21', '90', '64', '90', '94', '90', '2016-06-28 20:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1510', '61', '90', '64', '90', '95', '90', '2016-06-28 20:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1511', '11', '90', '65', '90', '92', '90', '2016-06-28 20:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1512', '10', '90', '65', '90', '93', '90', '2016-06-28 20:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1513', '9', '90', '65', '90', '92', '90', '2016-06-28 20:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1514', '5', '90', '66', '90', '92', '90', '2016-06-28 20:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1515', '3', '90', '66', '90', '93', '90', '2016-06-28 20:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1516', '3', '90', '66', '90', '93', '90', '2016-06-28 20:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1517', '6', '90', '66', '90', '91', '90', '2016-06-28 20:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1518', '13', '90', '66', '90', '91', '90', '2016-06-29 10:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1519', '4', '90', '76', '90', '92', '90', '2016-06-29 11:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1520', '2', '90', '60', '90', '93', '90', '2016-06-29 11:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1521', '3', '90', '79', '90', '95', '90', '2016-06-29 11:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1522', '2', '90', '73', '90', '95', '90', '2016-06-29 11:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1523', '20', '90', '74', '90', '95', '90', '2016-06-29 11:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1524', '10', '90', '81', '90', '92', '90', '2016-06-29 11:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1525', '16', '90', '62', '90', '95', '90', '2016-06-29 11:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1526', '4', '90', '62', '90', '96', '90', '2016-06-29 11:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1527', '20', '90', '62', '90', '95', '90', '2016-06-29 11:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1528', '45', '90', '63', '90', '95', '90', '2016-06-29 11:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1529', '2', '90', '63', '90', '95', '90', '2016-06-29 11:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1530', '1', '90', '63', '90', '95', '90', '2016-06-29 11:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1531', '2', '90', '64', '90', '95', '90', '2016-06-29 11:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1532', '2', '90', '64', '90', '94', '90', '2016-06-29 11:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1533', '2', '90', '64', '90', '94', '90', '2016-06-29 11:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1534', '2', '90', '65', '90', '94', '90', '2016-06-29 11:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1535', '2', '90', '65', '90', '94', '90', '2016-06-29 11:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1536', '2', '90', '65', '90', '94', '90', '2016-06-29 11:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1537', '2', '90', '66', '90', '95', '90', '2016-06-29 11:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1538', '2', '90', '66', '90', '95', '90', '2016-06-29 11:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1539', '2', '90', '66', '90', '95', '90', '2016-06-29 11:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1540', '1', '90', '67', '90', '94', '90', '2016-06-29 11:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1541', '1', '90', '67', '90', '94', '90', '2016-06-29 11:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1542', '2', '90', '67', '90', '94', '90', '2016-06-29 11:36:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1543', '2', '90', '68', '90', '94', '90', '2016-06-29 11:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1544', '2', '90', '68', '90', '94', '90', '2016-06-29 11:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1545', '2', '90', '68', '90', '94', '90', '2016-06-29 11:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1546', '2', '90', '68', '90', '94', '90', '2016-06-29 11:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1547', '1', '90', '69', '90', '94', '90', '2016-06-29 11:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1548', '3', '90', '69', '90', '94', '90', '2016-06-29 11:42:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1549', '2', '90', '69', '90', '94', '90', '2016-06-29 11:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1550', '6', '90', '69', '90', '95', '90', '2016-06-29 11:44:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1551', '14', '90', '70', '90', '96', '90', '2016-06-29 11:45:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1552', '12', '90', '70', '90', '96', '90', '2016-06-29 11:46:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1553', '17', '90', '70', '90', '97', '90', '2016-06-29 11:47:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1554', '2', '90', '70', '90', '98', '90', '2016-06-29 11:48:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1555', '7', '90', '71', '90', '96', '90', '2016-06-29 11:49:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1556', '5', '90', '71', '90', '97', '90', '2016-06-29 11:50:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1557', '2', '90', '71', '90', '96', '90', '2016-06-29 11:51:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1558', '2', '90', '72', '90', '96', '90', '2016-06-29 11:52:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1559', '8', '90', '72', '90', '97', '90', '2016-06-29 11:53:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1560', '1', '90', '72', '90', '97', '90', '2016-06-29 11:54:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1561', '3', '90', '73', '90', '97', '90', '2016-06-29 11:55:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1562', '2', '90', '73', '90', '96', '90', '2016-06-29 11:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1563', '4', '90', '73', '90', '96', '90', '2016-06-29 11:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1564', '2', '90', '73', '90', '96', '90', '2016-06-29 11:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1565', '1', '90', '73', '90', '96', '90', '2016-06-29 11:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1566', '4', '90', '74', '90', '96', '90', '2016-06-29 12:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1567', '1', '90', '74', '90', '96', '90', '2016-06-29 12:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1568', '2', '90', '74', '90', '96', '90', '2016-06-29 12:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1569', '1', '90', '75', '90', '96', '90', '2016-06-29 12:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1570', '2', '90', '75', '90', '96', '90', '2016-06-29 12:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1571', '2', '90', '75', '90', '96', '90', '2016-06-29 12:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1572', '5', '90', '75', '90', '95', '90', '2016-06-29 12:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1573', '16', '90', '76', '90', '95', '90', '2016-06-29 12:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1574', '22', '90', '78', '90', '94', '90', '2016-06-29 12:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1575', '33', '90', '78', '90', '95', '90', '2016-06-29 12:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1576', '38', '90', '78', '90', '93', '90', '2016-06-29 12:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1577', '60', '90', '79', '90', '95', '90', '2016-06-29 12:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1578', '30', '90', '79', '90', '97', '90', '2016-06-29 12:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1579', '31', '90', '79', '90', '97', '90', '2016-06-29 12:23:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1580', '12', '90', '79', '90', '94', '90', '2016-06-29 12:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1581', '19', '90', '80', '90', '94', '90', '2016-06-29 12:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1582', '17', '90', '80', '90', '94', '90', '2016-06-29 12:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1583', '19', '90', '80', '90', '94', '90', '2016-06-29 12:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1584', '24', '90', '81', '90', '93', '90', '2016-06-29 12:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1585', '26', '90', '67', '90', '93', '90', '2016-06-29 13:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1586', '30', '90', '84', '90', '94', '90', '2016-06-29 13:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1587', '13', '90', '85', '90', '93', '90', '2016-06-29 13:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1588', '4', '90', '86', '90', '93', '90', '2016-06-29 13:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1589', '4', '90', '86', '90', '93', '90', '2016-06-29 13:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1590', '2', '90', '87', '90', '93', '90', '2016-06-29 13:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1591', '2', '90', '87', '90', '93', '90', '2016-06-29 14:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1592', '2', '90', '59', '90', '93', '90', '2016-06-29 14:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1593', '3', '90', '59', '90', '93', '90', '2016-06-29 14:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1594', '5', '90', '60', '90', '93', '90', '2016-06-29 14:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1595', '5', '90', '60', '90', '93', '90', '2016-06-29 14:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1596', '5', '90', '60', '90', '93', '90', '2016-06-29 14:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1597', '8', '90', '61', '90', '92', '90', '2016-06-29 14:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1598', '7', '90', '61', '90', '91', '90', '2016-06-29 14:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1599', '5', '90', '61', '90', '92', '90', '2016-06-29 14:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1600', '13', '90', '62', '90', '92', '90', '2016-06-29 14:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1601', '5', '90', '51', '90', '91', '90', '2016-06-29 14:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1602', '1', '90', '57', '90', '91', '90', '2016-06-29 14:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1603', '8', '90', '58', '90', '92', '90', '2016-06-29 14:13:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1604', '9', '90', '58', '90', '92', '90', '2016-06-29 14:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1605', '1', '90', '58', '90', '92', '90', '2016-06-29 14:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1606', '15', '90', '59', '90', '93', '90', '2016-06-29 14:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1607', '2', '90', '59', '90', '93', '90', '2016-06-29 14:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1608', '6', '90', '59', '90', '95', '90', '2016-06-29 14:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1609', '10', '90', '59', '90', '97', '90', '2016-06-29 14:19:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1610', '8', '90', '60', '90', '98', '90', '2016-06-29 14:20:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1611', '5', '90', '60', '90', '94', '90', '2016-06-29 14:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1612', '5', '90', '60', '90', '93', '90', '2016-06-29 14:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1613', '4', '90', '60', '90', '93', '90', '2016-06-29 14:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1614', '1', '90', '60', '90', '93', '90', '2016-06-29 14:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1615', '2', '90', '61', '90', '93', '90', '2016-06-29 14:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1616', '2', '90', '61', '90', '93', '90', '2016-06-29 14:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1617', '3', '90', '62', '90', '93', '90', '2016-06-29 14:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1618', '2', '90', '62', '90', '93', '90', '2016-06-29 14:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1619', '9', '90', '62', '90', '94', '90', '2016-06-29 14:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1620', '2', '90', '62', '90', '94', '90', '2016-06-29 14:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1621', '1', '90', '62', '90', '94', '90', '2016-06-29 14:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1622', '5', '90', '63', '90', '94', '90', '2016-06-29 14:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1623', '1', '90', '63', '90', '94', '90', '2016-06-29 14:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1624', '5', '90', '63', '90', '94', '90', '2016-06-29 14:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1625', '1', '90', '63', '90', '94', '90', '2016-06-29 14:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1626', '2', '90', '64', '90', '94', '90', '2016-06-29 14:36:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1627', '1', '90', '64', '90', '94', '90', '2016-06-29 14:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1628', '1', '90', '64', '90', '94', '90', '2016-06-29 14:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1629', '24', '90', '64', '90', '94', '90', '2016-06-29 14:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1630', '3', '90', '48', '90', '94', '90', '2016-06-29 14:48:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1631', '10', '90', '52', '90', '94', '90', '2016-06-29 14:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1632', '6', '90', '52', '90', '94', '90', '2016-06-29 14:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1633', '10', '90', '52', '90', '94', '90', '2016-06-29 14:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1634', '5', '90', '53', '90', '95', '90', '2016-06-29 14:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1635', '3', '90', '53', '90', '95', '90', '2016-06-29 14:53:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1636', '2', '90', '53', '90', '95', '90', '2016-06-29 14:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1637', '1', '90', '54', '90', '95', '90', '2016-06-29 14:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1638', '2', '90', '54', '90', '94', '90', '2016-06-29 14:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1639', '2', '90', '54', '90', '94', '90', '2016-06-29 14:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1640', '4', '90', '54', '90', '94', '90', '2016-06-29 14:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1641', '11', '90', '55', '90', '96', '90', '2016-06-29 14:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1642', '1', '90', '55', '90', '95', '90', '2016-06-29 15:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1643', '3', '90', '55', '90', '95', '90', '2016-06-29 15:01:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1644', '2', '90', '55', '90', '95', '90', '2016-06-29 15:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1645', '2', '90', '56', '90', '95', '90', '2016-06-29 15:03:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1646', '3', '90', '56', '90', '95', '90', '2016-06-29 15:04:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1647', '4', '90', '56', '90', '95', '90', '2016-06-29 15:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1648', '3', '90', '56', '90', '94', '90', '2016-06-29 15:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1649', '10', '90', '56', '90', '94', '90', '2016-06-29 15:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1650', '2', '90', '57', '90', '94', '90', '2016-06-29 15:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1651', '5', '90', '57', '90', '94', '90', '2016-06-29 15:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1652', '1', '90', '57', '90', '94', '90', '2016-06-29 15:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1653', '6', '90', '57', '90', '94', '90', '2016-06-29 15:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1654', '4', '90', '58', '90', '95', '90', '2016-06-29 15:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1655', '2', '90', '58', '90', '95', '90', '2016-06-29 15:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1656', '6', '90', '58', '90', '95', '90', '2016-06-29 15:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1657', '6', '90', '58', '90', '95', '90', '2016-06-29 15:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1658', '4', '90', '58', '90', '95', '90', '2016-06-29 15:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1659', '5', '90', '58', '90', '95', '90', '2016-06-29 15:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1660', '4', '90', '59', '90', '95', '90', '2016-06-29 15:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1661', '5', '90', '59', '90', '95', '90', '2016-06-29 15:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1662', '6', '90', '59', '90', '95', '90', '2016-06-29 15:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1663', '5', '90', '59', '90', '95', '90', '2016-06-29 15:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1664', '3', '90', '60', '90', '95', '90', '2016-06-29 15:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1665', '2', '90', '60', '90', '95', '90', '2016-06-29 15:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1666', '3', '90', '60', '90', '95', '90', '2016-06-29 15:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1667', '2', '90', '60', '90', '95', '90', '2016-06-29 15:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1668', '3', '90', '61', '90', '95', '90', '2016-06-29 15:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1669', '5', '90', '61', '90', '93', '90', '2016-06-29 15:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1670', '13', '90', '61', '90', '92', '90', '2016-06-29 15:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1671', '13', '90', '51', '90', '91', '90', '2016-06-29 15:33:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1672', '29', '90', '69', '90', '95', '90', '2016-06-29 15:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1673', '1', '90', '57', '90', '96', '90', '2016-06-29 15:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1674', '17', '90', '64', '90', '96', '90', '2016-06-29 15:39:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1675', '20', '90', '66', '90', '98', '90', '2016-06-29 15:40:02', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1676', '2', '90', '56', '90', '94', '90', '2016-06-29 15:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1677', '4', '90', '56', '90', '96', '90', '2016-06-29 15:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1678', '3', '90', '56', '90', '93', '90', '2016-06-29 15:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1679', '14', '90', '57', '90', '93', '90', '2016-06-29 15:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1680', '18', '90', '64', '90', '95', '90', '2016-06-29 15:50:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1681', '5', '90', '58', '90', '93', '90', '2016-06-29 15:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1682', '3', '90', '58', '90', '93', '90', '2016-06-29 15:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1683', '0', '90', '59', '90', '93', '90', '2016-06-29 15:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1684', '4', '90', '59', '90', '93', '90', '2016-06-29 15:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1685', '9', '90', '59', '90', '93', '90', '2016-06-29 15:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1686', '5', '90', '60', '90', '92', '90', '2016-06-29 15:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1687', '8', '90', '61', '90', '92', '90', '2016-06-29 15:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1688', '2', '90', '61', '90', '92', '90', '2016-06-29 16:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1689', '6', '90', '61', '90', '93', '90', '2016-06-29 16:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1690', '14', '90', '61', '90', '93', '90', '2016-06-29 16:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1691', '10', '90', '62', '90', '96', '90', '2016-06-29 16:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1692', '38', '90', '62', '90', '96', '90', '2016-06-29 16:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1693', '42', '90', '62', '90', '96', '90', '2016-06-29 16:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1694', '37', '90', '62', '90', '96', '90', '2016-06-29 16:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1695', '20', '90', '63', '90', '96', '90', '2016-06-29 16:07:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1696', '12', '90', '63', '90', '97', '90', '2016-06-29 16:08:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1697', '16', '90', '63', '90', '95', '90', '2016-06-29 16:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1698', '8', '90', '64', '90', '95', '90', '2016-06-29 16:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1699', '4', '90', '64', '90', '95', '90', '2016-06-29 16:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1700', '8', '90', '64', '90', '95', '90', '2016-06-29 16:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1701', '10', '90', '64', '90', '95', '90', '2016-06-29 16:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1702', '24', '90', '65', '90', '95', '90', '2016-06-29 16:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1703', '4', '90', '65', '90', '96', '90', '2016-06-29 16:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1704', '7', '90', '65', '90', '95', '90', '2016-06-29 16:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1705', '15', '90', '66', '90', '95', '90', '2016-06-29 16:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1706', '10', '90', '66', '90', '96', '90', '2016-06-29 16:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1707', '20', '90', '66', '90', '95', '90', '2016-06-29 16:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1708', '38', '90', '68', '90', '91', '90', '2016-06-29 16:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1709', '9', '90', '68', '90', '92', '90', '2016-06-29 16:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1710', '3', '90', '68', '90', '91', '90', '2016-06-29 16:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1711', '41', '90', '68', '90', '91', '90', '2016-06-29 16:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1712', '5', '90', '68', '90', '91', '90', '2016-06-29 16:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1713', '8', '90', '69', '90', '91', '90', '2016-06-29 16:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1714', '6', '90', '69', '90', '91', '90', '2016-06-29 16:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1715', '10', '90', '69', '90', '91', '90', '2016-06-29 16:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1716', '22', '90', '70', '90', '95', '90', '2016-06-29 16:38:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1717', '10', '90', '70', '90', '95', '90', '2016-06-29 16:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1718', '11', '90', '70', '90', '95', '90', '2016-06-29 16:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1719', '10', '90', '70', '90', '95', '90', '2016-06-29 16:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1720', '9', '90', '71', '90', '92', '90', '2016-06-29 16:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1721', '20', '90', '62', '90', '91', '90', '2016-06-30 10:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1722', '17', '90', '66', '90', '92', '90', '2016-06-30 10:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1723', '2', '90', '66', '90', '92', '90', '2016-06-30 10:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1724', '9', '90', '66', '90', '93', '90', '2016-06-30 10:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1725', '26', '90', '67', '90', '95', '90', '2016-06-30 10:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1726', '2', '90', '67', '90', '95', '90', '2016-06-30 10:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1727', '1', '90', '67', '90', '95', '90', '2016-06-30 10:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1728', '3', '90', '68', '90', '95', '90', '2016-06-30 10:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1729', '1', '90', '68', '90', '95', '90', '2016-06-30 10:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1730', '2', '90', '68', '90', '95', '90', '2016-06-30 10:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1731', '1', '90', '68', '90', '95', '90', '2016-06-30 10:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1732', '2', '90', '69', '90', '95', '90', '2016-06-30 10:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1733', '2', '90', '69', '90', '94', '90', '2016-06-30 10:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1734', '1', '90', '69', '90', '94', '90', '2016-06-30 10:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1735', '6', '90', '69', '90', '94', '90', '2016-06-30 10:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1736', '6', '90', '70', '90', '94', '90', '2016-06-30 10:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1737', '2', '90', '70', '90', '94', '90', '2016-06-30 10:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1738', '1', '90', '70', '90', '96', '90', '2016-06-30 10:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1739', '1', '90', '70', '90', '96', '90', '2016-06-30 10:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1740', '2', '90', '70', '90', '95', '90', '2016-06-30 10:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1741', '1', '90', '71', '90', '95', '90', '2016-06-30 10:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1742', '2', '90', '71', '90', '95', '90', '2016-06-30 10:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1743', '2', '90', '71', '90', '95', '90', '2016-06-30 10:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1744', '2', '90', '71', '90', '94', '90', '2016-06-30 10:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1745', '1', '90', '72', '90', '94', '90', '2016-06-30 10:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1746', '1', '90', '72', '90', '94', '90', '2016-06-30 10:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1747', '1', '90', '72', '90', '94', '90', '2016-06-30 10:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1748', '2', '90', '72', '90', '94', '90', '2016-06-30 10:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1749', '2', '90', '73', '90', '94', '90', '2016-06-30 10:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1750', '1', '90', '73', '90', '94', '90', '2016-06-30 10:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1751', '4', '90', '73', '90', '94', '90', '2016-06-30 10:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1752', '8', '90', '45', '90', '96', '90', '2016-06-30 10:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1753', '5', '90', '45', '90', '95', '90', '2016-06-30 10:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1754', '2', '90', '45', '90', '96', '90', '2016-06-30 10:37:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1755', '14', '90', '45', '90', '96', '90', '2016-06-30 10:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1756', '2', '90', '57', '90', '91', '90', '2016-06-30 11:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1757', '4', '90', '57', '90', '91', '90', '2016-06-30 11:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1758', '2', '90', '58', '90', '91', '90', '2016-06-30 12:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1759', '3', '90', '58', '90', '91', '90', '2016-06-30 12:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1760', '2', '90', '58', '90', '91', '90', '2016-06-30 12:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1761', '2', '90', '58', '90', '91', '90', '2016-06-30 12:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1762', '1', '90', '58', '90', '91', '90', '2016-06-30 12:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1763', '1', '90', '59', '90', '91', '90', '2016-06-30 12:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1764', '8', '90', '59', '90', '91', '90', '2016-06-30 12:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1765', '2', '90', '59', '90', '91', '90', '2016-06-30 12:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1766', '2', '90', '59', '90', '91', '90', '2016-06-30 12:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1767', '3', '90', '60', '90', '91', '90', '2016-06-30 12:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1768', '12', '90', '61', '90', '91', '90', '2016-06-30 12:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1769', '11', '90', '61', '90', '92', '90', '2016-06-30 12:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1770', '11', '90', '61', '90', '93', '90', '2016-06-30 12:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1771', '14', '90', '61', '90', '93', '90', '2016-06-30 12:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1772', '4', '90', '62', '90', '93', '90', '2016-06-30 12:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1773', '1', '90', '62', '90', '92', '90', '2016-06-30 12:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1774', '1', '90', '62', '90', '92', '90', '2016-06-30 12:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1775', '3', '90', '62', '90', '91', '90', '2016-06-30 12:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1776', '2', '90', '63', '90', '93', '90', '2016-06-30 12:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1777', '2', '90', '63', '90', '93', '90', '2016-06-30 12:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1778', '2', '90', '63', '90', '92', '90', '2016-06-30 12:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1779', '2', '90', '63', '90', '93', '90', '2016-06-30 12:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1780', '3', '90', '64', '90', '94', '90', '2016-06-30 12:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1781', '2', '90', '64', '90', '93', '90', '2016-06-30 12:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1782', '5', '90', '64', '90', '96', '90', '2016-06-30 12:31:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1783', '2', '90', '64', '90', '96', '90', '2016-06-30 12:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1784', '2', '90', '64', '90', '96', '90', '2016-06-30 12:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1785', '2', '90', '65', '90', '96', '90', '2016-06-30 12:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1786', '1', '90', '65', '90', '96', '90', '2016-06-30 12:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1787', '2', '90', '65', '90', '96', '90', '2016-06-30 12:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1788', '1', '90', '65', '90', '96', '90', '2016-06-30 12:37:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1789', '9', '90', '66', '90', '96', '90', '2016-06-30 12:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1790', '1', '90', '66', '90', '96', '90', '2016-06-30 12:39:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1791', '2', '90', '66', '90', '96', '90', '2016-06-30 12:40:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1792', '1', '90', '66', '90', '96', '90', '2016-06-30 12:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1793', '2', '90', '66', '90', '96', '90', '2016-06-30 12:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1794', '2', '90', '67', '90', '96', '90', '2016-06-30 12:43:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1795', '1', '90', '67', '90', '96', '90', '2016-06-30 12:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1796', '1', '90', '67', '90', '96', '90', '2016-06-30 12:45:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1797', '2', '90', '67', '90', '97', '90', '2016-06-30 12:46:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1798', '1', '90', '67', '90', '96', '90', '2016-06-30 12:47:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1799', '2', '90', '68', '90', '96', '90', '2016-06-30 12:48:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1800', '2', '90', '68', '90', '96', '90', '2016-06-30 12:49:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1801', '1', '90', '68', '90', '96', '90', '2016-06-30 12:50:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1802', '1', '90', '68', '90', '96', '90', '2016-06-30 12:51:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1803', '1', '90', '69', '90', '96', '90', '2016-06-30 12:52:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1804', '1', '90', '69', '90', '97', '90', '2016-06-30 12:53:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1805', '6', '90', '69', '90', '97', '90', '2016-06-30 12:54:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1806', '2', '90', '69', '90', '96', '90', '2016-06-30 12:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1807', '2', '90', '70', '90', '96', '90', '2016-06-30 12:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1808', '1', '90', '70', '90', '96', '90', '2016-06-30 12:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1809', '2', '90', '70', '90', '96', '90', '2016-06-30 12:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1810', '1', '90', '70', '90', '96', '90', '2016-06-30 12:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1811', '2', '90', '71', '90', '96', '90', '2016-06-30 13:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1812', '1', '90', '71', '90', '96', '90', '2016-06-30 13:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1813', '2', '90', '71', '90', '97', '90', '2016-06-30 13:02:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1814', '1', '90', '71', '90', '97', '90', '2016-06-30 13:03:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1815', '1', '90', '71', '90', '96', '90', '2016-06-30 13:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1816', '1', '90', '72', '90', '96', '90', '2016-06-30 13:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1817', '2', '90', '72', '90', '96', '90', '2016-06-30 13:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1818', '5', '90', '44', '90', '97', '90', '2016-06-30 13:07:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1819', '2', '90', '44', '90', '97', '90', '2016-06-30 13:08:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1820', '1', '90', '44', '90', '97', '90', '2016-06-30 13:09:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1821', '1', '90', '44', '90', '96', '90', '2016-06-30 13:10:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1822', '1', '90', '45', '90', '96', '90', '2016-06-30 13:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1823', '2', '90', '51', '90', '91', '90', '2016-06-30 13:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1824', '27', '90', '52', '90', '92', '90', '2016-06-30 14:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1825', '15', '90', '52', '90', '94', '90', '2016-06-30 14:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1826', '3', '90', '52', '90', '96', '90', '2016-06-30 14:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1827', '6', '90', '53', '90', '98', '90', '2016-06-30 14:05:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1828', '8', '90', '53', '90', '98', '90', '2016-06-30 14:06:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1829', '5', '90', '53', '90', '98', '90', '2016-06-30 14:07:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1830', '6', '90', '53', '90', '94', '90', '2016-06-30 14:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1831', '12', '90', '53', '90', '95', '90', '2016-06-30 14:09:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1832', '23', '90', '54', '90', '94', '90', '2016-06-30 14:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1833', '24', '90', '54', '90', '95', '90', '2016-06-30 14:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1834', '24', '90', '54', '90', '95', '90', '2016-06-30 14:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1835', '24', '90', '55', '90', '98', '90', '2016-06-30 14:15:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1836', '23', '90', '55', '90', '96', '90', '2016-06-30 14:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1837', '12', '90', '55', '90', '95', '90', '2016-06-30 14:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1838', '20', '90', '55', '90', '96', '90', '2016-06-30 14:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1839', '38', '90', '56', '90', '95', '90', '2016-06-30 14:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1840', '9', '90', '56', '90', '92', '90', '2016-06-30 14:24:02', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1841', '6', '90', '56', '90', '93', '90', '2016-06-30 14:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1842', '13', '90', '57', '90', '91', '90', '2016-06-30 14:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1843', '14', '90', '57', '90', '91', '90', '2016-06-30 14:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1844', '2', '90', '59', '90', '91', '90', '2016-06-30 14:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1845', '3', '90', '59', '90', '91', '90', '2016-06-30 14:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1846', '1', '90', '60', '90', '91', '90', '2016-06-30 14:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1847', '1', '90', '60', '90', '91', '90', '2016-06-30 14:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1848', '2', '90', '61', '90', '91', '90', '2016-06-30 14:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1849', '5', '90', '61', '90', '91', '90', '2016-06-30 14:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1850', '1', '90', '61', '90', '91', '90', '2016-06-30 14:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1851', '2', '90', '61', '90', '91', '90', '2016-06-30 14:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1852', '5', '90', '62', '90', '91', '90', '2016-06-30 14:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1853', '5', '90', '62', '90', '91', '90', '2016-06-30 14:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1854', '5', '90', '62', '90', '91', '90', '2016-06-30 14:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1855', '3', '90', '62', '90', '91', '90', '2016-06-30 14:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1856', '2', '90', '62', '90', '91', '90', '2016-06-30 15:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1857', '3', '90', '63', '90', '91', '90', '2016-06-30 15:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1858', '2', '90', '63', '90', '91', '90', '2016-06-30 15:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1859', '2', '90', '63', '90', '91', '90', '2016-06-30 15:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1860', '2', '90', '63', '90', '91', '90', '2016-06-30 15:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1861', '5', '90', '64', '90', '91', '90', '2016-06-30 15:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1862', '2', '90', '64', '90', '91', '90', '2016-06-30 15:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1863', '13', '90', '64', '90', '91', '90', '2016-06-30 15:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1864', '3', '90', '64', '90', '92', '90', '2016-06-30 15:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1865', '4', '90', '65', '90', '94', '90', '2016-06-30 15:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1866', '2', '90', '65', '90', '92', '90', '2016-06-30 15:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1867', '2', '90', '65', '90', '92', '90', '2016-06-30 15:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1868', '5', '90', '65', '90', '92', '90', '2016-06-30 15:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1869', '5', '90', '65', '90', '92', '90', '2016-06-30 15:13:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1870', '5', '90', '66', '90', '92', '90', '2016-06-30 15:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1871', '5', '90', '66', '90', '92', '90', '2016-06-30 15:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1872', '5', '90', '66', '90', '92', '90', '2016-06-30 15:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1873', '21', '90', '66', '90', '92', '90', '2016-06-30 15:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1874', '4', '90', '66', '90', '93', '90', '2016-06-30 15:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1875', '4', '90', '67', '90', '92', '90', '2016-06-30 15:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1876', '13', '90', '67', '90', '93', '90', '2016-06-30 15:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1877', '13', '90', '67', '90', '94', '90', '2016-06-30 15:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1878', '2', '90', '67', '90', '93', '90', '2016-06-30 15:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1879', '2', '90', '68', '90', '93', '90', '2016-06-30 15:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1880', '4', '90', '68', '90', '93', '90', '2016-06-30 15:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1881', '4', '90', '68', '90', '93', '90', '2016-06-30 15:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1882', '12', '90', '68', '90', '93', '90', '2016-06-30 15:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1883', '21', '90', '69', '90', '93', '90', '2016-06-30 15:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1884', '4', '90', '69', '90', '93', '90', '2016-06-30 15:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1885', '7', '90', '69', '90', '93', '90', '2016-06-30 15:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1886', '2', '90', '69', '90', '93', '90', '2016-06-30 15:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1887', '2', '90', '69', '90', '93', '90', '2016-06-30 15:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1888', '3', '90', '70', '90', '93', '90', '2016-06-30 15:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1889', '2', '90', '70', '90', '93', '90', '2016-06-30 15:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1890', '2', '90', '70', '90', '93', '90', '2016-06-30 15:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1891', '25', '90', '70', '90', '95', '90', '2016-06-30 15:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1892', '25', '90', '71', '90', '95', '90', '2016-06-30 15:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1893', '27', '90', '71', '90', '94', '90', '2016-06-30 15:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1894', '25', '90', '71', '90', '95', '90', '2016-06-30 15:38:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1895', '27', '90', '44', '90', '95', '90', '2016-06-30 15:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1896', '34', '90', '44', '90', '95', '90', '2016-06-30 15:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1897', '26', '90', '44', '90', '95', '90', '2016-06-30 15:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1898', '27', '90', '45', '90', '96', '90', '2016-06-30 15:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1899', '25', '90', '45', '90', '95', '90', '2016-06-30 15:43:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1900', '29', '90', '45', '90', '95', '90', '2016-06-30 15:44:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1901', '27', '90', '45', '90', '96', '90', '2016-06-30 15:45:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1902', '25', '90', '45', '90', '96', '90', '2016-06-30 15:46:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1903', '25', '90', '45', '90', '95', '90', '2016-06-30 15:47:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1904', '26', '90', '46', '90', '95', '90', '2016-06-30 15:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1905', '27', '90', '46', '90', '95', '90', '2016-06-30 15:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1906', '28', '90', '46', '90', '95', '90', '2016-06-30 15:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1907', '27', '90', '46', '90', '96', '90', '2016-06-30 15:51:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1908', '25', '90', '47', '90', '96', '90', '2016-06-30 15:52:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1909', '25', '90', '47', '90', '96', '90', '2016-06-30 15:53:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1910', '27', '90', '47', '90', '96', '90', '2016-06-30 15:54:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1911', '26', '90', '47', '90', '96', '90', '2016-06-30 15:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1912', '25', '90', '48', '90', '96', '90', '2016-06-30 15:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1913', '26', '90', '48', '90', '96', '90', '2016-06-30 15:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1914', '27', '90', '48', '90', '96', '90', '2016-06-30 15:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1915', '26', '90', '48', '90', '96', '90', '2016-06-30 15:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1916', '25', '90', '48', '90', '96', '90', '2016-06-30 16:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1917', '26', '90', '49', '90', '96', '90', '2016-06-30 16:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1918', '25', '90', '49', '90', '96', '90', '2016-06-30 16:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1919', '26', '90', '49', '90', '96', '90', '2016-06-30 16:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1920', '26', '90', '49', '90', '96', '90', '2016-06-30 16:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1921', '25', '90', '49', '90', '96', '90', '2016-06-30 16:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1922', '25', '90', '50', '90', '96', '90', '2016-06-30 16:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1923', '30', '90', '50', '90', '96', '90', '2016-06-30 16:07:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1924', '26', '90', '50', '90', '96', '90', '2016-06-30 16:08:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1925', '26', '90', '51', '90', '96', '90', '2016-06-30 16:09:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1926', '28', '90', '51', '90', '96', '90', '2016-06-30 16:10:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1927', '25', '90', '51', '90', '96', '90', '2016-06-30 16:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1928', '25', '90', '51', '90', '96', '90', '2016-06-30 16:12:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1929', '25', '90', '51', '90', '96', '90', '2016-06-30 16:13:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1930', '25', '90', '52', '90', '96', '90', '2016-06-30 16:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1931', '25', '90', '52', '90', '96', '90', '2016-06-30 16:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1932', '25', '90', '52', '90', '96', '90', '2016-06-30 16:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1933', '26', '90', '52', '90', '96', '90', '2016-06-30 16:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1934', '29', '90', '52', '90', '96', '90', '2016-06-30 16:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1935', '25', '90', '53', '90', '96', '90', '2016-06-30 16:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1936', '27', '90', '53', '90', '96', '90', '2016-06-30 16:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1937', '25', '90', '53', '90', '96', '90', '2016-06-30 16:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1938', '26', '90', '53', '90', '96', '90', '2016-06-30 16:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1939', '28', '90', '53', '90', '93', '90', '2016-06-30 16:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1940', '26', '90', '54', '90', '95', '90', '2016-06-30 16:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1941', '28', '90', '54', '90', '96', '90', '2016-06-30 16:25:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1942', '26', '90', '54', '90', '95', '90', '2016-06-30 16:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1943', '27', '90', '60', '90', '91', '90', '2016-06-30 17:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1944', '47', '90', '60', '90', '92', '90', '2016-06-30 17:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1945', '27', '90', '61', '90', '93', '90', '2016-06-30 17:11:03', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1946', '25', '90', '64', '90', '91', '90', '2016-06-30 17:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1947', '26', '90', '64', '90', '91', '90', '2016-06-30 17:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1948', '26', '90', '64', '90', '91', '90', '2016-06-30 17:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1949', '25', '90', '64', '90', '91', '90', '2016-06-30 17:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1950', '25', '90', '64', '90', '91', '90', '2016-06-30 17:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1951', '26', '90', '65', '90', '91', '90', '2016-06-30 17:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1952', '26', '90', '65', '90', '91', '90', '2016-06-30 17:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1953', '25', '90', '65', '90', '91', '90', '2016-06-30 17:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1954', '25', '90', '66', '90', '91', '90', '2016-06-30 17:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1955', '25', '90', '66', '90', '91', '90', '2016-06-30 17:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1956', '27', '90', '66', '90', '91', '90', '2016-06-30 17:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1957', '27', '90', '66', '90', '92', '90', '2016-06-30 17:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1958', '25', '90', '66', '90', '92', '90', '2016-06-30 17:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1959', '29', '90', '67', '90', '94', '90', '2016-06-30 17:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1960', '25', '90', '67', '90', '93', '90', '2016-06-30 17:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1961', '25', '90', '67', '90', '93', '90', '2016-06-30 17:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1962', '26', '90', '67', '90', '93', '90', '2016-06-30 17:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1963', '25', '90', '67', '90', '93', '90', '2016-06-30 17:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1964', '27', '90', '68', '90', '93', '90', '2016-06-30 17:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1965', '26', '90', '68', '90', '92', '90', '2016-06-30 17:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1966', '26', '90', '68', '90', '92', '90', '2016-06-30 17:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1967', '25', '90', '68', '90', '92', '90', '2016-06-30 17:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1968', '25', '90', '69', '90', '92', '90', '2016-06-30 17:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1969', '25', '90', '69', '90', '92', '90', '2016-06-30 17:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1970', '25', '90', '69', '90', '92', '90', '2016-06-30 17:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1971', '26', '90', '69', '90', '92', '90', '2016-06-30 17:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1972', '27', '90', '70', '90', '92', '90', '2016-06-30 17:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1973', '29', '90', '70', '90', '92', '90', '2016-06-30 18:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1974', '25', '90', '70', '90', '93', '90', '2016-06-30 18:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1975', '29', '90', '70', '90', '93', '90', '2016-06-30 18:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1976', '25', '90', '70', '90', '93', '90', '2016-06-30 18:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1977', '26', '90', '71', '90', '93', '90', '2016-06-30 18:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1978', '25', '90', '71', '90', '93', '90', '2016-06-30 18:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1979', '26', '90', '44', '90', '93', '90', '2016-06-30 18:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1980', '27', '90', '44', '90', '93', '90', '2016-06-30 18:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1981', '25', '90', '44', '90', '93', '90', '2016-06-30 18:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1982', '25', '90', '44', '90', '93', '90', '2016-06-30 18:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1983', '26', '90', '45', '90', '93', '90', '2016-06-30 18:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1984', '25', '90', '45', '90', '93', '90', '2016-06-30 18:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1985', '25', '90', '45', '90', '93', '90', '2016-06-30 18:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1986', '25', '90', '45', '90', '93', '90', '2016-06-30 18:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1987', '25', '90', '45', '90', '93', '90', '2016-06-30 18:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1988', '25', '90', '46', '90', '93', '90', '2016-06-30 18:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1989', '25', '90', '46', '90', '94', '90', '2016-06-30 18:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1990', '26', '90', '46', '90', '93', '90', '2016-06-30 18:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1991', '28', '90', '46', '90', '93', '90', '2016-06-30 18:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1992', '25', '90', '47', '90', '93', '90', '2016-06-30 18:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1993', '25', '90', '47', '90', '93', '90', '2016-06-30 18:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1994', '25', '90', '47', '90', '93', '90', '2016-06-30 18:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1995', '26', '90', '47', '90', '93', '90', '2016-06-30 18:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1996', '26', '90', '48', '90', '93', '90', '2016-06-30 18:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1997', '25', '90', '48', '90', '93', '90', '2016-06-30 18:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1998', '26', '90', '48', '90', '93', '90', '2016-06-30 18:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('1999', '25', '90', '48', '90', '94', '90', '2016-06-30 18:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2000', '25', '90', '48', '90', '93', '90', '2016-06-30 18:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2001', '25', '90', '49', '90', '93', '90', '2016-06-30 18:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2002', '25', '90', '49', '90', '93', '90', '2016-06-30 18:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2003', '27', '90', '49', '90', '93', '90', '2016-06-30 18:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2004', '25', '90', '49', '90', '93', '90', '2016-06-30 18:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2005', '26', '90', '49', '90', '93', '90', '2016-06-30 18:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2006', '30', '90', '50', '90', '95', '90', '2016-06-30 18:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2007', '39', '90', '50', '90', '97', '90', '2016-06-30 18:34:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2008', '37', '90', '50', '90', '96', '90', '2016-06-30 18:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2009', '37', '90', '50', '90', '96', '90', '2016-06-30 18:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2010', '35', '90', '51', '90', '95', '90', '2016-06-30 18:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2011', '54', '90', '51', '90', '96', '90', '2016-06-30 18:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2012', '29', '90', '51', '90', '92', '90', '2016-06-30 18:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2013', '31', '90', '53', '90', '91', '90', '2016-06-30 18:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2014', '26', '90', '57', '90', '91', '90', '2016-06-30 19:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2015', '25', '90', '58', '90', '91', '90', '2016-06-30 19:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2016', '25', '90', '58', '90', '91', '90', '2016-06-30 19:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2017', '26', '90', '58', '90', '91', '90', '2016-06-30 19:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2018', '25', '90', '58', '90', '91', '90', '2016-06-30 19:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2019', '26', '90', '59', '90', '91', '90', '2016-06-30 19:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2020', '25', '90', '59', '90', '91', '90', '2016-06-30 19:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2021', '25', '90', '59', '90', '91', '90', '2016-06-30 19:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2022', '25', '90', '59', '90', '91', '90', '2016-06-30 19:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2023', '25', '90', '60', '90', '92', '90', '2016-06-30 19:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2024', '25', '90', '60', '90', '93', '90', '2016-06-30 19:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2025', '25', '90', '60', '90', '93', '90', '2016-06-30 19:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2026', '26', '90', '60', '90', '93', '90', '2016-06-30 19:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2027', '26', '90', '60', '90', '93', '90', '2016-06-30 19:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2028', '25', '90', '61', '90', '93', '90', '2016-06-30 19:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2029', '25', '90', '61', '90', '93', '90', '2016-06-30 19:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2030', '26', '90', '61', '90', '93', '90', '2016-06-30 19:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2031', '28', '90', '61', '90', '94', '90', '2016-06-30 19:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2032', '25', '90', '62', '90', '94', '90', '2016-06-30 19:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2033', '28', '90', '62', '90', '95', '90', '2016-06-30 19:45:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2034', '25', '90', '62', '90', '95', '90', '2016-06-30 19:46:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2035', '27', '90', '62', '90', '95', '90', '2016-06-30 19:47:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2036', '25', '90', '63', '90', '95', '90', '2016-06-30 19:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2037', '27', '90', '63', '90', '95', '90', '2016-06-30 19:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2038', '25', '90', '63', '90', '95', '90', '2016-06-30 19:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2039', '26', '90', '63', '90', '96', '90', '2016-06-30 19:51:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2040', '31', '90', '63', '90', '96', '90', '2016-06-30 19:52:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2041', '31', '90', '63', '90', '94', '90', '2016-06-30 19:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2042', '35', '90', '64', '90', '95', '90', '2016-06-30 19:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2043', '33', '90', '64', '90', '93', '90', '2016-06-30 19:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2044', '30', '90', '64', '90', '93', '90', '2016-06-30 19:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2045', '39', '90', '65', '90', '92', '90', '2016-06-30 19:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2046', '27', '90', '65', '90', '95', '90', '2016-06-30 19:58:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2047', '23', '90', '66', '90', '91', '90', '2016-06-30 20:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2048', '26', '90', '66', '90', '91', '90', '2016-06-30 20:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2049', '27', '90', '66', '90', '91', '90', '2016-06-30 20:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2050', '25', '90', '67', '90', '91', '90', '2016-06-30 20:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2051', '26', '90', '67', '90', '91', '90', '2016-06-30 20:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2052', '25', '90', '67', '90', '91', '90', '2016-06-30 20:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2053', '32', '90', '67', '90', '92', '90', '2016-06-30 20:13:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2054', '26', '90', '68', '90', '92', '90', '2016-06-30 20:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2055', '25', '90', '68', '90', '93', '90', '2016-06-30 20:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2056', '25', '90', '68', '90', '93', '90', '2016-06-30 20:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2057', '1', '90', '77', '90', '92', '90', '2016-07-02 13:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2058', '2', '90', '73', '90', '93', '90', '2016-07-02 13:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2059', '20', '90', '74', '90', '93', '90', '2016-07-02 13:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2060', '2', '90', '75', '90', '93', '90', '2016-07-02 13:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2061', '2', '90', '75', '90', '93', '90', '2016-07-02 13:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2062', '6', '90', '75', '90', '93', '90', '2016-07-02 13:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2063', '11', '90', '75', '90', '94', '90', '2016-07-02 13:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2064', '70', '90', '76', '90', '92', '90', '2016-07-02 13:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2065', '5', '90', '76', '90', '93', '90', '2016-07-02 13:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2066', '8', '90', '76', '90', '93', '90', '2016-07-02 13:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2067', '16', '90', '76', '90', '93', '90', '2016-07-02 13:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2068', '2', '90', '76', '90', '92', '90', '2016-07-02 13:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2069', '2', '90', '77', '90', '91', '90', '2016-07-02 13:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2070', '3', '90', '77', '90', '93', '90', '2016-07-02 13:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2071', '2', '90', '77', '90', '93', '90', '2016-07-02 13:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2072', '10', '90', '78', '90', '93', '90', '2016-07-02 13:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2073', '44', '90', '78', '90', '91', '90', '2016-07-02 13:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2074', '2', '90', '80', '90', '91', '90', '2016-07-02 13:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2075', '6', '90', '57', '90', '91', '90', '2016-07-02 13:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2076', '15', '90', '57', '90', '91', '90', '2016-07-02 13:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2077', '1', '90', '58', '90', '91', '90', '2016-07-02 13:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2078', '2', '90', '58', '90', '91', '90', '2016-07-02 13:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2079', '12', '90', '58', '90', '91', '90', '2016-07-02 13:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2080', '15', '90', '59', '90', '92', '90', '2016-07-02 13:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2081', '4', '90', '57', '90', '92', '90', '2016-07-02 13:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2082', '5', '90', '58', '90', '92', '90', '2016-07-02 13:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2083', '7', '90', '58', '90', '93', '90', '2016-07-02 13:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2084', '2', '90', '58', '90', '93', '90', '2016-07-02 13:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2085', '2', '90', '59', '90', '92', '90', '2016-07-02 13:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2086', '18', '90', '59', '90', '93', '90', '2016-07-02 13:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2087', '2', '90', '69', '90', '91', '90', '2016-07-02 13:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2088', '3', '90', '80', '90', '93', '90', '2016-07-02 13:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2089', '2', '90', '81', '90', '92', '90', '2016-07-02 13:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2090', '22', '90', '55', '90', '91', '90', '2016-07-02 14:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2091', '14', '90', '49', '90', '92', '90', '2016-07-02 15:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2092', '18', '90', '53', '90', '97', '90', '2016-07-02 15:25:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2093', '4', '90', '59', '90', '95', '90', '2016-07-02 15:27:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2094', '6', '90', '65', '90', '95', '90', '2016-07-02 15:28:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2095', '20', '90', '66', '90', '94', '90', '2016-07-02 15:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2096', '8', '90', '66', '90', '95', '90', '2016-07-02 15:30:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2097', '5', '90', '67', '90', '95', '90', '2016-07-02 15:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2098', '2', '90', '68', '90', '95', '90', '2016-07-02 15:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2099', '4', '90', '68', '90', '95', '90', '2016-07-02 15:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2100', '6', '90', '68', '90', '95', '90', '2016-07-02 15:34:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2101', '4', '90', '75', '90', '93', '90', '2016-07-02 15:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2102', '31', '90', '55', '90', '91', '90', '2016-07-02 15:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2103', '9', '90', '51', '90', '91', '90', '2016-07-02 15:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2104', '4', '90', '51', '90', '91', '90', '2016-07-02 15:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2105', '2', '90', '51', '90', '91', '90', '2016-07-02 15:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2106', '15', '90', '51', '90', '91', '90', '2016-07-02 15:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2107', '2', '90', '52', '90', '91', '90', '2016-07-02 15:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2108', '9', '90', '54', '90', '92', '90', '2016-07-02 15:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2109', '93', '90', '61', '90', '92', '90', '2016-07-02 15:44:00', '<font color=\"red\">CPU当前：93%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2110', '4', '90', '62', '90', '91', '90', '2016-07-02 15:46:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2111', '2', '90', '50', '90', '91', '90', '2016-07-02 15:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2112', '5', '90', '51', '90', '95', '90', '2016-07-02 15:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2113', '10', '90', '51', '90', '96', '90', '2016-07-02 15:49:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2114', '18', '90', '51', '90', '95', '90', '2016-07-02 15:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2115', '9', '90', '51', '90', '95', '90', '2016-07-02 15:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2116', '9', '90', '52', '90', '95', '90', '2016-07-02 15:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2117', '30', '90', '52', '90', '93', '90', '2016-07-02 15:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2118', '26', '90', '53', '90', '94', '90', '2016-07-02 15:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2119', '17', '90', '53', '90', '95', '90', '2016-07-02 15:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2120', '15', '90', '65', '90', '99', '90', '2016-07-03 10:18:02', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2121', '27', '90', '83', '90', '94', '90', '2016-07-03 10:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2122', '14', '90', '62', '90', '95', '90', '2016-07-03 10:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2123', '17', '90', '62', '90', '98', '90', '2016-07-03 10:21:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2124', '2', '90', '63', '90', '97', '90', '2016-07-03 10:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2125', '25', '90', '65', '90', '91', '90', '2016-07-03 10:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2126', '13', '90', '74', '90', '92', '90', '2016-07-03 10:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2127', '45', '90', '75', '90', '92', '90', '2016-07-03 10:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2128', '32', '90', '71', '90', '91', '90', '2016-07-03 10:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2129', '43', '90', '47', '90', '91', '90', '2016-07-03 10:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2130', '37', '90', '69', '90', '93', '90', '2016-07-03 10:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2131', '16', '90', '64', '90', '92', '90', '2016-07-03 10:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2132', '22', '90', '71', '90', '93', '90', '2016-07-03 10:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2133', '25', '90', '76', '90', '93', '90', '2016-07-03 10:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2134', '15', '90', '52', '90', '93', '90', '2016-07-03 10:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2135', '60', '90', '53', '90', '93', '90', '2016-07-03 10:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2136', '2', '90', '53', '90', '95', '90', '2016-07-03 10:58:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2137', '14', '90', '54', '90', '94', '90', '2016-07-03 10:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2138', '16', '90', '54', '90', '94', '90', '2016-07-03 11:00:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2139', '15', '90', '54', '90', '93', '90', '2016-07-03 11:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2140', '16', '90', '54', '90', '93', '90', '2016-07-03 11:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2141', '26', '90', '55', '90', '92', '90', '2016-07-03 11:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2142', '1', '90', '55', '90', '93', '90', '2016-07-03 11:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2143', '17', '90', '55', '90', '93', '90', '2016-07-03 11:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2144', '38', '90', '55', '90', '91', '90', '2016-07-03 11:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2145', '26', '90', '56', '90', '91', '90', '2016-07-03 11:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2146', '58', '90', '56', '90', '92', '90', '2016-07-03 11:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2147', '20', '90', '56', '90', '92', '90', '2016-07-03 11:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2148', '12', '90', '56', '90', '92', '90', '2016-07-03 11:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2149', '13', '90', '57', '90', '92', '90', '2016-07-03 11:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2150', '17', '90', '57', '90', '91', '90', '2016-07-03 11:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2151', '23', '90', '57', '90', '91', '90', '2016-07-03 11:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2152', '25', '90', '57', '90', '91', '90', '2016-07-03 11:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2153', '27', '90', '58', '90', '91', '90', '2016-07-03 11:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2154', '15', '90', '58', '90', '91', '90', '2016-07-03 11:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2155', '14', '90', '58', '90', '91', '90', '2016-07-03 11:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2156', '21', '90', '58', '90', '91', '90', '2016-07-03 11:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2157', '20', '90', '59', '90', '91', '90', '2016-07-03 11:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2158', '25', '90', '59', '90', '91', '90', '2016-07-03 11:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2159', '18', '90', '59', '90', '91', '90', '2016-07-03 11:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2160', '14', '90', '59', '90', '91', '90', '2016-07-03 11:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2161', '15', '90', '60', '90', '91', '90', '2016-07-03 11:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2162', '22', '90', '60', '90', '91', '90', '2016-07-03 11:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2163', '20', '90', '61', '90', '91', '90', '2016-07-03 11:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2164', '13', '90', '61', '90', '91', '90', '2016-07-03 11:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2165', '13', '90', '61', '90', '91', '90', '2016-07-03 11:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2166', '2', '90', '61', '90', '91', '90', '2016-07-03 11:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2167', '2', '90', '62', '90', '91', '90', '2016-07-03 11:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2168', '10', '90', '62', '90', '91', '90', '2016-07-03 11:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2169', '16', '90', '62', '90', '91', '90', '2016-07-03 11:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2170', '14', '90', '62', '90', '91', '90', '2016-07-03 11:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2171', '20', '90', '63', '90', '91', '90', '2016-07-03 11:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2172', '2', '90', '64', '90', '91', '90', '2016-07-03 11:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2173', '2', '90', '65', '90', '91', '90', '2016-07-03 11:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2174', '2', '90', '65', '90', '91', '90', '2016-07-03 11:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2175', '1', '90', '65', '90', '91', '90', '2016-07-03 11:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2176', '2', '90', '65', '90', '91', '90', '2016-07-03 12:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2177', '2', '90', '66', '90', '91', '90', '2016-07-03 12:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2178', '12', '90', '67', '90', '92', '90', '2016-07-03 12:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2179', '5', '90', '67', '90', '92', '90', '2016-07-03 12:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2180', '2', '90', '67', '90', '92', '90', '2016-07-03 12:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2181', '6', '90', '67', '90', '95', '90', '2016-07-03 12:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2182', '2', '90', '68', '90', '95', '90', '2016-07-03 12:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2183', '9', '90', '68', '90', '98', '90', '2016-07-03 12:13:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2184', '2', '90', '68', '90', '93', '90', '2016-07-03 12:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2185', '27', '90', '69', '90', '96', '90', '2016-07-03 12:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2186', '12', '90', '69', '90', '95', '90', '2016-07-03 12:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2187', '24', '90', '69', '90', '97', '90', '2016-07-03 12:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2188', '22', '90', '70', '90', '95', '90', '2016-07-03 12:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2189', '21', '90', '70', '90', '93', '90', '2016-07-03 12:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2190', '37', '90', '70', '90', '94', '90', '2016-07-03 12:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2191', '14', '90', '70', '90', '94', '90', '2016-07-03 12:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2192', '18', '90', '71', '90', '94', '90', '2016-07-03 12:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2193', '14', '90', '71', '90', '95', '90', '2016-07-03 12:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2194', '43', '90', '50', '90', '94', '90', '2016-07-03 13:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2195', '18', '90', '54', '90', '94', '90', '2016-07-03 13:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2196', '6', '90', '55', '90', '93', '90', '2016-07-03 13:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2197', '7', '90', '56', '90', '93', '90', '2016-07-03 13:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2198', '1', '90', '56', '90', '92', '90', '2016-07-03 13:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2199', '5', '90', '57', '90', '93', '90', '2016-07-03 13:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2200', '52', '90', '57', '90', '94', '90', '2016-07-03 13:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2201', '2', '90', '57', '90', '93', '90', '2016-07-03 13:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2202', '42', '90', '57', '90', '92', '90', '2016-07-03 13:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2203', '2', '90', '58', '90', '93', '90', '2016-07-03 13:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2204', '2', '90', '58', '90', '93', '90', '2016-07-03 13:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2205', '2', '90', '58', '90', '94', '90', '2016-07-03 13:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2206', '1', '90', '58', '90', '95', '90', '2016-07-03 13:56:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2207', '2', '90', '58', '90', '95', '90', '2016-07-03 13:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2208', '5', '90', '59', '90', '95', '90', '2016-07-03 13:58:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2209', '4', '90', '59', '90', '99', '90', '2016-07-03 13:59:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2210', '12', '90', '59', '90', '92', '90', '2016-07-03 14:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2211', '5', '90', '60', '90', '92', '90', '2016-07-03 14:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2212', '4', '90', '60', '90', '91', '90', '2016-07-03 14:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2213', '2', '90', '60', '90', '91', '90', '2016-07-03 14:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2214', '3', '90', '60', '90', '92', '90', '2016-07-03 14:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2215', '2', '90', '60', '90', '91', '90', '2016-07-03 14:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2216', '15', '90', '61', '90', '91', '90', '2016-07-03 14:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2217', '8', '90', '61', '90', '92', '90', '2016-07-03 14:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2218', '37', '90', '61', '90', '91', '90', '2016-07-03 14:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2219', '3', '90', '61', '90', '91', '90', '2016-07-03 14:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2220', '1', '90', '61', '90', '91', '90', '2016-07-03 14:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2221', '1', '90', '62', '90', '91', '90', '2016-07-03 14:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2222', '10', '90', '62', '90', '91', '90', '2016-07-03 14:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2223', '6', '90', '62', '90', '91', '90', '2016-07-03 14:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2224', '16', '90', '63', '90', '91', '90', '2016-07-03 14:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2225', '32', '90', '63', '90', '91', '90', '2016-07-03 14:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2226', '20', '90', '63', '90', '91', '90', '2016-07-03 14:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2227', '16', '90', '63', '90', '91', '90', '2016-07-03 14:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2228', '10', '90', '63', '90', '91', '90', '2016-07-03 14:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2229', '26', '90', '64', '90', '92', '90', '2016-07-03 14:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2230', '15', '90', '64', '90', '91', '90', '2016-07-03 14:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2231', '2', '90', '64', '90', '92', '90', '2016-07-03 14:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2232', '27', '90', '64', '90', '93', '90', '2016-07-03 14:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2233', '2', '90', '83', '90', '96', '90', '2016-07-03 14:26:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2234', '6', '90', '66', '90', '96', '90', '2016-07-03 14:27:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2235', '20', '90', '86', '90', '95', '90', '2016-07-03 14:29:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2236', '2', '90', '78', '90', '95', '90', '2016-07-03 14:30:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2237', '4', '90', '52', '90', '92', '90', '2016-07-05 14:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2238', '12', '90', '54', '90', '92', '90', '2016-07-05 14:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2239', '5', '90', '65', '90', '92', '90', '2016-07-05 14:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2240', '11', '90', '57', '90', '91', '90', '2016-07-05 14:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2241', '19', '90', '64', '90', '92', '90', '2016-07-05 14:36:25', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2242', '19', '90', '65', '90', '92', '90', '2016-07-05 14:48:41', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2243', '5', '90', '65', '90', '92', '90', '2016-07-05 14:52:07', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2244', '20', '90', '66', '90', '94', '90', '2016-07-05 15:01:11', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2245', '10', '90', '58', '90', '95', '90', '2016-07-05 15:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2246', '2', '90', '58', '90', '94', '90', '2016-07-05 15:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2247', '12', '90', '58', '90', '93', '90', '2016-07-05 15:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2248', '2', '90', '59', '90', '94', '90', '2016-07-05 15:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2249', '20', '90', '59', '90', '94', '90', '2016-07-05 15:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2250', '9', '90', '59', '90', '93', '90', '2016-07-05 15:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2251', '7', '90', '59', '90', '93', '90', '2016-07-05 15:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2252', '7', '90', '60', '90', '94', '90', '2016-07-05 15:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2253', '4', '90', '60', '90', '93', '90', '2016-07-05 15:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2254', '11', '90', '60', '90', '93', '90', '2016-07-05 15:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2255', '2', '90', '60', '90', '94', '90', '2016-07-05 15:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2256', '2', '90', '60', '90', '91', '90', '2016-07-05 15:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2257', '8', '90', '61', '90', '91', '90', '2016-07-05 15:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2258', '17', '90', '62', '90', '92', '90', '2016-07-05 15:18:24', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2259', '9', '90', '64', '90', '93', '90', '2016-07-05 15:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2260', '26', '90', '67', '90', '93', '90', '2016-07-05 15:23:12', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2261', '25', '90', '57', '90', '93', '90', '2016-07-05 15:24:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2262', '45', '90', '67', '90', '96', '90', '2016-07-05 15:25:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2263', '41', '90', '52', '90', '97', '90', '2016-07-05 15:26:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2264', '19', '90', '57', '90', '91', '90', '2016-07-05 15:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2265', '4', '90', '59', '90', '91', '90', '2016-07-05 15:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2266', '29', '90', '48', '90', '91', '90', '2016-07-05 16:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2267', '23', '90', '50', '90', '93', '90', '2016-07-05 16:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2268', '17', '90', '74', '90', '93', '90', '2016-07-05 16:30:59', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2269', '14', '90', '76', '90', '94', '90', '2016-07-05 16:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2270', '25', '90', '50', '90', '93', '90', '2016-07-05 17:16:48', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2271', '10', '90', '66', '90', '93', '90', '2016-07-05 17:20:40', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2272', '14', '90', '60', '90', '93', '90', '2016-07-05 17:21:48', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2273', '13', '90', '62', '90', '93', '90', '2016-07-05 17:23:47', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2274', '19', '90', '62', '90', '93', '90', '2016-07-05 17:25:22', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2275', '35', '90', '63', '90', '94', '90', '2016-07-05 17:27:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2276', '8', '90', '64', '90', '94', '90', '2016-07-05 17:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2277', '15', '90', '66', '90', '94', '90', '2016-07-05 17:29:13', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2278', '17', '90', '71', '90', '92', '90', '2016-07-05 18:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2279', '5', '90', '72', '90', '94', '90', '2016-07-05 18:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2280', '8', '90', '69', '90', '94', '90', '2016-07-05 18:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2281', '20', '90', '70', '90', '95', '90', '2016-07-05 18:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2282', '30', '90', '67', '90', '97', '90', '2016-07-05 19:45:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2283', '25', '90', '68', '90', '98', '90', '2016-07-05 19:46:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2284', '33', '90', '68', '90', '96', '90', '2016-07-05 19:47:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2285', '39', '90', '69', '90', '95', '90', '2016-07-05 19:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2286', '33', '90', '69', '90', '95', '90', '2016-07-05 19:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2287', '25', '90', '69', '90', '95', '90', '2016-07-05 19:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2288', '23', '90', '70', '90', '95', '90', '2016-07-05 19:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2289', '38', '90', '70', '90', '96', '90', '2016-07-05 19:53:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2290', '35', '90', '70', '90', '96', '90', '2016-07-05 19:54:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2291', '54', '90', '70', '90', '96', '90', '2016-07-05 19:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2292', '34', '90', '70', '90', '96', '90', '2016-07-05 19:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2293', '38', '90', '71', '90', '95', '90', '2016-07-05 19:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2294', '41', '90', '71', '90', '95', '90', '2016-07-05 19:58:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2295', '34', '90', '71', '90', '95', '90', '2016-07-05 19:59:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2296', '38', '90', '71', '90', '95', '90', '2016-07-05 20:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2297', '42', '90', '72', '90', '95', '90', '2016-07-05 20:01:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2298', '35', '90', '72', '90', '95', '90', '2016-07-05 20:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2299', '36', '90', '72', '90', '96', '90', '2016-07-05 20:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2300', '3', '90', '56', '90', '91', '90', '2016-07-06 10:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2301', '2', '90', '57', '90', '93', '90', '2016-07-06 10:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2302', '1', '90', '73', '90', '92', '90', '2016-07-06 10:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2303', '2', '90', '54', '90', '93', '90', '2016-07-06 10:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2304', '27', '90', '60', '90', '93', '90', '2016-07-06 10:41:32', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2305', '17', '90', '52', '90', '95', '90', '2016-07-06 10:44:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2306', '19', '90', '59', '90', '94', '90', '2016-07-06 10:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2307', '3', '90', '59', '90', '94', '90', '2016-07-06 10:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2308', '3', '90', '60', '90', '94', '90', '2016-07-06 10:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2309', '8', '90', '60', '90', '94', '90', '2016-07-06 10:48:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2310', '13', '90', '51', '90', '92', '90', '2016-07-06 11:01:51', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2311', '14', '90', '52', '90', '93', '90', '2016-07-06 11:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2312', '13', '90', '52', '90', '93', '90', '2016-07-06 11:09:06', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2313', '13', '90', '69', '90', '93', '90', '2016-07-06 11:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2314', '13', '90', '69', '90', '94', '90', '2016-07-06 11:11:09', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2315', '20', '90', '70', '90', '94', '90', '2016-07-06 11:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2316', '17', '90', '70', '90', '94', '90', '2016-07-06 11:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2317', '36', '90', '71', '90', '94', '90', '2016-07-06 11:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2318', '16', '90', '71', '90', '94', '90', '2016-07-06 11:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2319', '13', '90', '71', '90', '95', '90', '2016-07-06 11:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2320', '14', '90', '71', '90', '94', '90', '2016-07-06 11:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2321', '13', '90', '71', '90', '94', '90', '2016-07-06 11:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2322', '22', '90', '72', '90', '95', '90', '2016-07-06 11:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2323', '17', '90', '72', '90', '94', '90', '2016-07-06 11:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2324', '16', '90', '72', '90', '95', '90', '2016-07-06 11:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2325', '21', '90', '72', '90', '94', '90', '2016-07-06 11:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2326', '14', '90', '73', '90', '95', '90', '2016-07-06 11:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2327', '4', '90', '68', '90', '91', '90', '2016-07-06 12:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2328', '7', '90', '67', '90', '91', '90', '2016-07-06 12:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2329', '12', '90', '73', '90', '91', '90', '2016-07-06 12:08:23', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2330', '14', '90', '62', '90', '91', '90', '2016-07-06 12:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2331', '9', '90', '74', '90', '92', '90', '2016-07-06 13:31:19', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2332', '9', '90', '49', '90', '91', '90', '2016-07-06 13:32:10', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2333', '7', '90', '50', '90', '91', '90', '2016-07-06 13:33:25', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2334', '4', '90', '66', '90', '91', '90', '2016-07-06 13:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2335', '4', '90', '66', '90', '91', '90', '2016-07-06 13:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2336', '33', '90', '66', '90', '93', '90', '2016-07-06 13:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2337', '6', '90', '49', '90', '94', '90', '2016-07-06 13:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2338', '2', '90', '49', '90', '94', '90', '2016-07-06 13:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2339', '55', '90', '49', '90', '94', '90', '2016-07-06 13:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2340', '1', '90', '49', '90', '93', '90', '2016-07-06 13:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2341', '4', '90', '49', '90', '93', '90', '2016-07-06 13:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2342', '3', '90', '50', '90', '93', '90', '2016-07-06 13:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2343', '12', '90', '52', '90', '92', '90', '2016-07-06 13:45:11', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2344', '13', '90', '52', '90', '92', '90', '2016-07-06 13:48:08', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2345', '8', '90', '67', '90', '92', '90', '2016-07-06 13:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2346', '14', '90', '67', '90', '92', '90', '2016-07-06 13:52:17', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2347', '14', '90', '68', '90', '92', '90', '2016-07-06 13:53:36', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2348', '17', '90', '68', '90', '92', '90', '2016-07-06 13:54:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2349', '8', '90', '69', '90', '92', '90', '2016-07-06 13:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2350', '8', '90', '70', '90', '93', '90', '2016-07-06 13:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2351', '16', '90', '74', '90', '93', '90', '2016-07-06 13:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2352', '5', '90', '57', '90', '93', '90', '2016-07-06 13:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2353', '10', '90', '59', '90', '93', '90', '2016-07-06 13:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2354', '2', '90', '59', '90', '93', '90', '2016-07-06 14:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2355', '6', '90', '59', '90', '93', '90', '2016-07-06 14:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2356', '4', '90', '59', '90', '93', '90', '2016-07-06 14:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2357', '2', '90', '60', '90', '93', '90', '2016-07-06 14:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2358', '6', '90', '60', '90', '93', '90', '2016-07-06 14:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2359', '2', '90', '60', '90', '93', '90', '2016-07-06 14:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2360', '3', '90', '60', '90', '93', '90', '2016-07-06 14:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2361', '8', '90', '61', '90', '93', '90', '2016-07-06 14:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2362', '5', '90', '61', '90', '93', '90', '2016-07-06 14:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2363', '3', '90', '61', '90', '93', '90', '2016-07-06 14:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2364', '2', '90', '61', '90', '93', '90', '2016-07-06 14:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2365', '9', '90', '62', '90', '93', '90', '2016-07-06 14:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2366', '14', '90', '62', '90', '93', '90', '2016-07-06 14:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2367', '8', '90', '56', '90', '91', '90', '2016-07-06 15:19:16', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2368', '9', '90', '60', '90', '91', '90', '2016-07-06 15:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2369', '1', '90', '65', '90', '91', '90', '2016-07-06 15:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2370', '6', '90', '65', '90', '91', '90', '2016-07-06 15:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2371', '1', '90', '65', '90', '91', '90', '2016-07-06 15:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2372', '6', '90', '66', '90', '91', '90', '2016-07-06 15:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2373', '3', '90', '66', '90', '91', '90', '2016-07-06 15:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2374', '7', '90', '66', '90', '91', '90', '2016-07-06 15:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2375', '24', '90', '75', '90', '93', '90', '2016-07-06 20:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2376', '5', '90', '72', '90', '92', '90', '2016-07-06 20:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2377', '13', '90', '54', '90', '93', '90', '2016-07-06 20:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2378', '13', '90', '59', '90', '94', '90', '2016-07-06 20:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2379', '21', '90', '49', '90', '94', '90', '2016-07-06 20:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2380', '9', '90', '58', '90', '93', '90', '2016-07-06 20:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2381', '17', '90', '58', '90', '94', '90', '2016-07-06 20:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2382', '18', '90', '59', '90', '94', '90', '2016-07-06 20:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2383', '27', '90', '73', '90', '92', '90', '2016-07-08 16:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2384', '9', '90', '59', '90', '92', '90', '2016-07-08 16:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2385', '12', '90', '59', '90', '92', '90', '2016-07-08 16:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2386', '9', '90', '59', '90', '92', '90', '2016-07-15 14:50:03', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2387', '9', '90', '76', '90', '95', '90', '2016-07-15 14:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2388', '9', '90', '77', '90', '94', '90', '2016-07-15 14:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2389', '11', '90', '78', '90', '94', '90', '2016-07-15 14:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2390', '2', '90', '78', '90', '94', '90', '2016-07-15 14:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2391', '6', '90', '78', '90', '94', '90', '2016-07-15 14:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2392', '12', '90', '79', '90', '96', '90', '2016-07-15 14:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2393', '26', '90', '79', '90', '94', '90', '2016-07-15 14:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2394', '6', '90', '80', '90', '91', '90', '2016-07-15 14:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2395', '31', '90', '77', '90', '91', '90', '2016-07-15 15:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2396', '28', '90', '86', '90', '91', '90', '2016-07-15 15:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2397', '16', '90', '70', '90', '91', '90', '2016-07-15 15:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2398', '11', '90', '67', '90', '91', '90', '2016-07-15 15:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2399', '12', '90', '67', '90', '95', '90', '2016-07-15 15:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2400', '41', '90', '67', '90', '95', '90', '2016-07-15 15:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2401', '25', '90', '68', '90', '93', '90', '2016-07-15 15:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2402', '7', '90', '68', '90', '92', '90', '2016-07-15 15:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2403', '7', '90', '68', '90', '92', '90', '2016-07-15 15:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2404', '9', '90', '69', '90', '93', '90', '2016-07-15 15:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2405', '17', '90', '69', '90', '93', '90', '2016-07-15 15:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2406', '14', '90', '69', '90', '93', '90', '2016-07-15 15:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2407', '2', '90', '63', '90', '96', '90', '2016-07-15 15:43:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2408', '6', '90', '59', '90', '96', '90', '2016-07-15 15:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2409', '10', '90', '59', '90', '96', '90', '2016-07-15 15:45:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2410', '9', '90', '60', '90', '98', '90', '2016-07-15 15:46:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2411', '4', '90', '60', '90', '97', '90', '2016-07-15 15:47:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2412', '14', '90', '60', '90', '95', '90', '2016-07-15 15:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2413', '21', '90', '54', '90', '95', '90', '2016-07-15 15:49:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2414', '20', '90', '63', '90', '95', '90', '2016-07-15 15:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2415', '6', '90', '64', '90', '95', '90', '2016-07-15 15:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2416', '12', '90', '64', '90', '95', '90', '2016-07-15 15:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2417', '6', '90', '64', '90', '94', '90', '2016-07-15 15:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2418', '18', '90', '65', '90', '92', '90', '2016-07-15 15:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2419', '21', '90', '67', '90', '91', '90', '2016-07-15 15:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2420', '15', '90', '69', '90', '92', '90', '2016-07-15 16:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2421', '8', '90', '69', '90', '92', '90', '2016-07-15 16:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2422', '2', '90', '69', '90', '92', '90', '2016-07-15 16:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2423', '7', '90', '70', '90', '93', '90', '2016-07-15 16:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2424', '15', '90', '70', '90', '93', '90', '2016-07-15 16:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2425', '9', '90', '70', '90', '94', '90', '2016-07-15 16:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2426', '11', '90', '70', '90', '94', '90', '2016-07-15 16:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2427', '10', '90', '71', '90', '95', '90', '2016-07-15 16:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2428', '41', '90', '71', '90', '92', '90', '2016-07-15 16:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2429', '3', '90', '68', '90', '92', '90', '2016-07-15 16:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2430', '9', '90', '71', '90', '92', '90', '2016-07-15 16:13:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2431', '2', '90', '71', '90', '92', '90', '2016-07-15 16:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2432', '1', '90', '72', '90', '92', '90', '2016-07-15 16:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2433', '4', '90', '72', '90', '92', '90', '2016-07-15 16:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2434', '9', '90', '73', '90', '92', '90', '2016-07-15 16:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2435', '2', '90', '73', '90', '92', '90', '2016-07-15 16:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2436', '1', '90', '74', '90', '92', '90', '2016-07-15 16:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2437', '15', '90', '74', '90', '93', '90', '2016-07-15 16:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2438', '13', '90', '74', '90', '94', '90', '2016-07-15 16:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2439', '10', '90', '75', '90', '95', '90', '2016-07-15 16:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2440', '17', '90', '75', '90', '93', '90', '2016-07-15 16:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2441', '8', '90', '75', '90', '92', '90', '2016-07-15 16:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2442', '12', '90', '75', '90', '92', '90', '2016-07-15 16:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2443', '9', '90', '76', '90', '92', '90', '2016-07-15 16:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2444', '18', '90', '76', '90', '92', '90', '2016-07-15 16:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2445', '16', '90', '77', '90', '93', '90', '2016-07-15 16:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2446', '10', '90', '56', '90', '94', '90', '2016-07-15 18:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2447', '17', '90', '55', '90', '93', '90', '2016-07-15 18:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2448', '12', '90', '61', '90', '93', '90', '2016-07-15 18:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2449', '10', '90', '61', '90', '93', '90', '2016-07-15 18:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2450', '5', '90', '62', '90', '93', '90', '2016-07-15 18:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2451', '17', '90', '62', '90', '93', '90', '2016-07-15 18:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2452', '18', '90', '62', '90', '94', '90', '2016-07-15 18:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2453', '19', '90', '62', '90', '95', '90', '2016-07-15 18:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2454', '20', '90', '62', '90', '96', '90', '2016-07-15 18:27:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2455', '21', '90', '63', '90', '96', '90', '2016-07-15 18:28:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2456', '2', '90', '63', '90', '93', '90', '2016-07-15 18:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2457', '18', '90', '63', '90', '94', '90', '2016-07-15 18:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2458', '17', '90', '63', '90', '98', '90', '2016-07-15 18:31:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2459', '7', '90', '64', '90', '95', '90', '2016-07-15 18:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2460', '4', '90', '64', '90', '95', '90', '2016-07-15 18:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2461', '13', '90', '66', '90', '91', '90', '2016-07-19 11:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2462', '18', '90', '70', '90', '94', '90', '2016-07-19 11:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2463', '2', '90', '70', '90', '95', '90', '2016-07-19 11:03:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2464', '0', '90', '70', '90', '93', '90', '2016-07-19 11:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2465', '5', '90', '71', '90', '93', '90', '2016-07-19 11:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2466', '2', '90', '71', '90', '93', '90', '2016-07-19 11:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2467', '8', '90', '71', '90', '93', '90', '2016-07-19 11:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2468', '7', '90', '71', '90', '93', '90', '2016-07-19 11:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2469', '12', '90', '72', '90', '93', '90', '2016-07-19 11:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2470', '6', '90', '72', '90', '93', '90', '2016-07-19 11:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2471', '7', '90', '73', '90', '94', '90', '2016-07-19 11:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2472', '9', '90', '73', '90', '94', '90', '2016-07-19 11:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2473', '5', '90', '60', '90', '96', '90', '2016-07-19 11:14:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2474', '39', '90', '60', '90', '91', '90', '2016-07-19 11:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2475', '26', '90', '50', '90', '93', '90', '2016-07-19 11:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2476', '12', '90', '72', '90', '95', '90', '2016-07-19 11:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2477', '14', '90', '66', '90', '92', '90', '2016-07-19 11:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2478', '2', '90', '88', '90', '96', '90', '2016-07-19 11:28:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2479', '8', '90', '88', '90', '94', '90', '2016-07-19 11:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2480', '21', '90', '62', '90', '93', '90', '2016-07-19 11:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2481', '2', '90', '62', '90', '93', '90', '2016-07-19 11:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2482', '17', '90', '62', '90', '94', '90', '2016-07-19 11:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2483', '2', '90', '63', '90', '93', '90', '2016-07-19 11:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2484', '4', '90', '63', '90', '93', '90', '2016-07-19 11:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2485', '13', '90', '63', '90', '94', '90', '2016-07-19 11:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2486', '6', '90', '64', '90', '93', '90', '2016-07-19 11:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2487', '2', '90', '64', '90', '93', '90', '2016-07-19 11:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2488', '2', '90', '64', '90', '93', '90', '2016-07-19 11:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2489', '5', '90', '65', '90', '94', '90', '2016-07-19 11:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2490', '3', '90', '65', '90', '94', '90', '2016-07-19 11:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2491', '2', '90', '65', '90', '93', '90', '2016-07-19 11:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2492', '2', '90', '65', '90', '93', '90', '2016-07-19 11:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2493', '2', '90', '66', '90', '93', '90', '2016-07-19 11:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2494', '2', '90', '66', '90', '93', '90', '2016-07-19 11:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2495', '2', '90', '66', '90', '93', '90', '2016-07-19 11:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2496', '2', '90', '67', '90', '93', '90', '2016-07-19 11:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2497', '3', '90', '67', '90', '93', '90', '2016-07-19 11:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2498', '2', '90', '67', '90', '93', '90', '2016-07-19 11:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2499', '6', '90', '67', '90', '93', '90', '2016-07-19 11:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2500', '2', '90', '68', '90', '93', '90', '2016-07-19 11:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2501', '1', '90', '68', '90', '93', '90', '2016-07-19 11:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2502', '2', '90', '68', '90', '93', '90', '2016-07-19 11:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2503', '2', '90', '68', '90', '93', '90', '2016-07-19 11:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2504', '2', '90', '69', '90', '93', '90', '2016-07-19 11:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2505', '2', '90', '69', '90', '93', '90', '2016-07-19 11:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2506', '2', '90', '69', '90', '93', '90', '2016-07-19 11:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2507', '2', '90', '69', '90', '93', '90', '2016-07-19 11:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2508', '24', '90', '70', '90', '94', '90', '2016-07-19 11:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2509', '5', '90', '72', '90', '92', '90', '2016-07-19 12:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2510', '14', '90', '73', '90', '93', '90', '2016-07-19 12:01:02', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2511', '9', '90', '73', '90', '97', '90', '2016-07-19 12:02:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2512', '38', '90', '73', '90', '96', '90', '2016-07-19 12:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2513', '24', '90', '74', '90', '96', '90', '2016-07-19 12:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2514', '23', '90', '74', '90', '93', '90', '2016-07-19 12:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2515', '7', '90', '74', '90', '93', '90', '2016-07-19 12:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2516', '24', '90', '74', '90', '93', '90', '2016-07-19 12:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2517', '12', '90', '75', '90', '95', '90', '2016-07-19 12:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2518', '63', '90', '75', '90', '96', '90', '2016-07-19 12:09:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2519', '21', '90', '75', '90', '92', '90', '2016-07-19 12:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2520', '27', '90', '75', '90', '91', '90', '2016-07-19 12:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2521', '28', '90', '76', '90', '95', '90', '2016-07-19 12:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2522', '13', '90', '76', '90', '96', '90', '2016-07-19 12:13:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2523', '16', '90', '76', '90', '97', '90', '2016-07-19 12:14:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2524', '24', '90', '77', '90', '97', '90', '2016-07-19 12:15:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2525', '2', '90', '77', '90', '92', '90', '2016-07-19 12:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2526', '9', '90', '77', '90', '93', '90', '2016-07-19 12:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2527', '12', '90', '77', '90', '92', '90', '2016-07-19 12:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2528', '32', '90', '79', '90', '93', '90', '2016-07-19 12:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2529', '21', '90', '79', '90', '91', '90', '2016-07-19 12:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2530', '35', '90', '79', '90', '91', '90', '2016-07-19 12:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2531', '26', '90', '80', '90', '91', '90', '2016-07-19 12:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2532', '20', '90', '80', '90', '92', '90', '2016-07-19 12:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2533', '30', '90', '80', '90', '92', '90', '2016-07-19 12:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2534', '22', '90', '81', '90', '92', '90', '2016-07-19 12:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2535', '19', '90', '82', '90', '92', '90', '2016-07-19 12:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2536', '24', '90', '83', '90', '93', '90', '2016-07-19 12:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2537', '37', '90', '61', '90', '91', '90', '2016-07-19 13:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2538', '1', '90', '62', '90', '91', '90', '2016-07-19 13:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2539', '29', '90', '67', '90', '91', '90', '2016-07-19 13:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2540', '10', '90', '67', '90', '92', '90', '2016-07-19 13:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2541', '22', '90', '68', '90', '95', '90', '2016-07-19 13:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2542', '7', '90', '68', '90', '95', '90', '2016-07-19 13:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2543', '8', '90', '68', '90', '96', '90', '2016-07-19 13:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2544', '3', '90', '69', '90', '96', '90', '2016-07-19 13:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2545', '9', '90', '69', '90', '96', '90', '2016-07-19 13:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2546', '8', '90', '69', '90', '98', '90', '2016-07-19 13:59:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2547', '5', '90', '69', '90', '96', '90', '2016-07-19 14:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2548', '9', '90', '76', '90', '92', '90', '2016-07-19 14:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2549', '34', '90', '76', '90', '93', '90', '2016-07-19 14:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2550', '11', '90', '78', '90', '91', '90', '2016-07-19 14:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2551', '23', '90', '78', '90', '91', '90', '2016-07-19 14:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2552', '23', '90', '78', '90', '95', '90', '2016-07-19 14:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2553', '24', '90', '79', '90', '97', '90', '2016-07-19 14:21:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2554', '8', '90', '79', '90', '98', '90', '2016-07-19 14:22:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2555', '33', '90', '79', '90', '95', '90', '2016-07-19 14:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2556', '15', '90', '79', '90', '92', '90', '2016-07-19 14:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2557', '21', '90', '80', '90', '91', '90', '2016-07-19 14:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2558', '5', '90', '80', '90', '92', '90', '2016-07-19 14:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2559', '25', '90', '80', '90', '93', '90', '2016-07-19 14:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2560', '13', '90', '81', '90', '94', '90', '2016-07-19 14:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2561', '8', '90', '81', '90', '93', '90', '2016-07-19 14:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2562', '17', '90', '81', '90', '94', '90', '2016-07-19 14:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2563', '27', '90', '81', '90', '93', '90', '2016-07-19 14:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2564', '6', '90', '82', '90', '91', '90', '2016-07-19 14:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2565', '7', '90', '83', '90', '92', '90', '2016-07-19 14:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2566', '8', '90', '83', '90', '91', '90', '2016-07-19 14:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2567', '8', '90', '83', '90', '92', '90', '2016-07-19 14:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2568', '5', '90', '84', '90', '91', '90', '2016-07-19 14:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2569', '5', '90', '84', '90', '91', '90', '2016-07-19 14:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2570', '5', '90', '84', '90', '92', '90', '2016-07-19 14:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2571', '1', '90', '84', '90', '92', '90', '2016-07-19 14:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2572', '3', '90', '85', '90', '92', '90', '2016-07-19 14:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2573', '4', '90', '85', '90', '92', '90', '2016-07-19 14:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2574', '5', '90', '85', '90', '92', '90', '2016-07-19 14:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2575', '10', '90', '86', '90', '94', '90', '2016-07-19 14:48:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2576', '3', '90', '86', '90', '93', '90', '2016-07-19 14:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2577', '21', '90', '86', '90', '95', '90', '2016-07-19 14:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2578', '25', '90', '86', '90', '94', '90', '2016-07-19 14:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2579', '20', '90', '87', '90', '93', '90', '2016-07-19 14:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2580', '5', '90', '87', '90', '93', '90', '2016-07-19 14:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2581', '10', '90', '67', '90', '91', '90', '2016-07-19 15:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2582', '10', '90', '67', '90', '91', '90', '2016-07-19 15:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2583', '2', '90', '68', '90', '91', '90', '2016-07-19 15:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2584', '29', '90', '68', '90', '91', '90', '2016-07-19 15:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2585', '41', '90', '68', '90', '92', '90', '2016-07-19 15:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2586', '3', '90', '68', '90', '92', '90', '2016-07-19 15:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2587', '16', '90', '68', '90', '92', '90', '2016-07-19 15:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2588', '9', '90', '69', '90', '92', '90', '2016-07-19 15:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2589', '16', '90', '69', '90', '92', '90', '2016-07-19 15:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2590', '12', '90', '70', '90', '92', '90', '2016-07-19 15:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2591', '10', '90', '70', '90', '92', '90', '2016-07-19 15:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2592', '5', '90', '70', '90', '94', '90', '2016-07-19 15:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2593', '22', '90', '70', '90', '95', '90', '2016-07-19 15:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2594', '6', '90', '71', '90', '96', '90', '2016-07-19 15:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2595', '44', '90', '71', '90', '96', '90', '2016-07-19 15:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2596', '2', '90', '71', '90', '96', '90', '2016-07-19 15:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2597', '2', '90', '72', '90', '96', '90', '2016-07-19 15:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2598', '3', '90', '72', '90', '96', '90', '2016-07-19 15:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2599', '15', '90', '67', '90', '91', '90', '2016-07-20 10:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2600', '5', '90', '71', '90', '91', '90', '2016-07-20 10:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2601', '1', '90', '72', '90', '92', '90', '2016-07-20 10:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2602', '6', '90', '72', '90', '91', '90', '2016-07-20 10:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2603', '17', '90', '72', '90', '92', '90', '2016-07-20 10:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2604', '10', '90', '73', '90', '92', '90', '2016-07-20 10:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2605', '4', '90', '74', '90', '91', '90', '2016-07-20 10:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2606', '18', '90', '74', '90', '92', '90', '2016-07-20 10:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2607', '26', '90', '74', '90', '94', '90', '2016-07-20 10:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2608', '2', '90', '74', '90', '94', '90', '2016-07-20 10:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2609', '36', '90', '75', '90', '93', '90', '2016-07-20 10:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2610', '4', '90', '77', '90', '91', '90', '2016-07-20 10:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2611', '1', '90', '77', '90', '91', '90', '2016-07-20 10:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2612', '1', '90', '77', '90', '92', '90', '2016-07-20 10:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2613', '10', '90', '77', '90', '92', '90', '2016-07-20 10:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2614', '8', '90', '78', '90', '93', '90', '2016-07-20 10:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2615', '13', '90', '78', '90', '94', '90', '2016-07-20 10:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2616', '9', '90', '79', '90', '94', '90', '2016-07-20 10:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2617', '49', '90', '79', '90', '94', '90', '2016-07-20 10:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2618', '5', '90', '79', '90', '94', '90', '2016-07-20 10:48:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2619', '20', '90', '80', '90', '94', '90', '2016-07-20 10:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2620', '11', '90', '80', '90', '94', '90', '2016-07-20 10:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2621', '6', '90', '80', '90', '94', '90', '2016-07-20 10:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2622', '14', '90', '80', '90', '94', '90', '2016-07-20 10:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2623', '10', '90', '81', '90', '94', '90', '2016-07-20 10:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2624', '12', '90', '81', '90', '94', '90', '2016-07-20 10:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2625', '30', '90', '81', '90', '96', '90', '2016-07-20 10:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2626', '5', '90', '82', '90', '94', '90', '2016-07-20 10:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2627', '4', '90', '82', '90', '95', '90', '2016-07-20 10:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2628', '6', '90', '82', '90', '92', '90', '2016-07-20 10:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2629', '12', '90', '73', '90', '93', '90', '2016-07-20 11:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2630', '3', '90', '51', '90', '95', '90', '2016-07-20 11:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2631', '8', '90', '52', '90', '95', '90', '2016-07-20 11:03:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2632', '14', '90', '52', '90', '95', '90', '2016-07-20 11:04:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2633', '16', '90', '53', '90', '95', '90', '2016-07-20 11:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2634', '2', '90', '53', '90', '95', '90', '2016-07-20 11:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2635', '23', '90', '53', '90', '94', '90', '2016-07-20 11:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2636', '11', '90', '72', '90', '91', '90', '2016-07-20 11:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2637', '3', '90', '72', '90', '91', '90', '2016-07-20 11:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2638', '2', '90', '72', '90', '91', '90', '2016-07-20 11:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2639', '1', '90', '72', '90', '91', '90', '2016-07-20 11:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2640', '2', '90', '73', '90', '91', '90', '2016-07-20 11:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2641', '27', '90', '73', '90', '94', '90', '2016-07-20 11:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2642', '19', '90', '73', '90', '96', '90', '2016-07-20 11:46:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2643', '14', '90', '74', '90', '91', '90', '2016-07-20 11:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2644', '6', '90', '74', '90', '91', '90', '2016-07-20 11:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2645', '4', '90', '74', '90', '91', '90', '2016-07-20 11:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2646', '6', '90', '74', '90', '91', '90', '2016-07-20 11:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2647', '2', '90', '75', '90', '91', '90', '2016-07-20 11:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2648', '2', '90', '75', '90', '91', '90', '2016-07-20 11:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2649', '2', '90', '75', '90', '91', '90', '2016-07-20 11:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2650', '2', '90', '75', '90', '91', '90', '2016-07-20 11:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2651', '6', '90', '76', '90', '92', '90', '2016-07-20 11:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2652', '2', '90', '49', '90', '92', '90', '2016-07-20 11:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2653', '2', '90', '49', '90', '92', '90', '2016-07-20 12:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2654', '3', '90', '49', '90', '93', '90', '2016-07-20 12:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2655', '1', '90', '49', '90', '93', '90', '2016-07-20 12:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2656', '1', '90', '50', '90', '93', '90', '2016-07-20 12:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2657', '1', '90', '50', '90', '92', '90', '2016-07-20 12:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2658', '2', '90', '50', '90', '93', '90', '2016-07-20 12:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2659', '2', '90', '50', '90', '93', '90', '2016-07-20 12:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2660', '10', '90', '50', '90', '92', '90', '2016-07-20 12:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2661', '3', '90', '51', '90', '93', '90', '2016-07-20 12:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2662', '1', '90', '51', '90', '93', '90', '2016-07-20 12:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2663', '7', '90', '51', '90', '93', '90', '2016-07-20 12:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2664', '17', '90', '51', '90', '93', '90', '2016-07-20 12:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2665', '25', '90', '51', '90', '95', '90', '2016-07-20 12:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2666', '25', '90', '52', '90', '96', '90', '2016-07-20 12:13:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2667', '12', '90', '52', '90', '95', '90', '2016-07-20 12:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2668', '5', '90', '52', '90', '96', '90', '2016-07-20 12:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2669', '8', '90', '53', '90', '96', '90', '2016-07-20 12:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2670', '19', '90', '53', '90', '96', '90', '2016-07-20 12:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2671', '15', '90', '53', '90', '97', '90', '2016-07-20 12:18:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2672', '39', '90', '53', '90', '98', '90', '2016-07-20 12:19:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2673', '26', '90', '53', '90', '98', '90', '2016-07-20 12:20:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2674', '26', '90', '54', '90', '98', '90', '2016-07-20 12:21:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2675', '27', '90', '62', '90', '91', '90', '2016-07-20 13:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2676', '18', '90', '62', '90', '92', '90', '2016-07-20 13:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2677', '13', '90', '62', '90', '93', '90', '2016-07-20 13:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2678', '25', '90', '62', '90', '91', '90', '2016-07-20 13:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2679', '39', '90', '63', '90', '92', '90', '2016-07-20 13:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2680', '25', '90', '63', '90', '92', '90', '2016-07-20 13:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2681', '6', '90', '64', '90', '92', '90', '2016-07-20 13:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2682', '2', '90', '64', '90', '92', '90', '2016-07-20 13:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2683', '10', '90', '64', '90', '92', '90', '2016-07-20 13:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2684', '2', '90', '64', '90', '92', '90', '2016-07-20 13:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2685', '14', '90', '65', '90', '92', '90', '2016-07-20 13:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2686', '14', '90', '65', '90', '93', '90', '2016-07-20 13:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2687', '3', '90', '65', '90', '93', '90', '2016-07-20 13:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2688', '16', '90', '65', '90', '95', '90', '2016-07-20 13:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2689', '2', '90', '65', '90', '94', '90', '2016-07-20 13:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2690', '5', '90', '66', '90', '94', '90', '2016-07-20 13:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2691', '21', '90', '66', '90', '95', '90', '2016-07-20 13:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2692', '10', '90', '66', '90', '91', '90', '2016-07-20 13:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2693', '2', '90', '67', '90', '91', '90', '2016-07-20 13:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2694', '16', '90', '67', '90', '91', '90', '2016-07-20 13:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2695', '10', '90', '68', '90', '91', '90', '2016-07-20 13:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2696', '4', '90', '68', '90', '91', '90', '2016-07-20 13:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2697', '10', '90', '68', '90', '91', '90', '2016-07-20 13:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2698', '5', '90', '69', '90', '91', '90', '2016-07-20 13:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2699', '2', '90', '69', '90', '91', '90', '2016-07-20 13:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2700', '14', '90', '69', '90', '91', '90', '2016-07-20 13:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2701', '10', '90', '69', '90', '91', '90', '2016-07-20 13:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2702', '19', '90', '71', '90', '91', '90', '2016-07-20 14:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2703', '6', '90', '71', '90', '94', '90', '2016-07-20 14:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2704', '13', '90', '72', '90', '96', '90', '2016-07-20 14:07:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2705', '23', '90', '72', '90', '95', '90', '2016-07-20 14:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2706', '15', '90', '72', '90', '96', '90', '2016-07-20 14:09:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2707', '5', '90', '74', '90', '92', '90', '2016-07-20 14:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2708', '5', '90', '74', '90', '91', '90', '2016-07-20 14:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2709', '40', '90', '50', '90', '91', '90', '2016-07-20 14:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2710', '9', '90', '50', '90', '91', '90', '2016-07-20 14:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2711', '19', '90', '50', '90', '91', '90', '2016-07-20 14:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2712', '16', '90', '50', '90', '91', '90', '2016-07-20 14:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2713', '22', '90', '50', '90', '92', '90', '2016-07-20 14:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2714', '5', '90', '51', '90', '92', '90', '2016-07-20 14:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2715', '12', '90', '51', '90', '91', '90', '2016-07-20 14:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2716', '14', '90', '51', '90', '91', '90', '2016-07-20 14:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2717', '42', '90', '52', '90', '91', '90', '2016-07-20 14:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2718', '8', '90', '52', '90', '91', '90', '2016-07-20 14:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2719', '5', '90', '52', '90', '91', '90', '2016-07-20 14:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2720', '10', '90', '52', '90', '91', '90', '2016-07-20 14:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2721', '13', '90', '53', '90', '91', '90', '2016-07-20 14:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2722', '24', '90', '53', '90', '91', '90', '2016-07-20 15:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2723', '14', '90', '53', '90', '92', '90', '2016-07-20 15:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2724', '21', '90', '53', '90', '92', '90', '2016-07-20 15:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2725', '1', '90', '54', '90', '91', '90', '2016-07-20 15:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2726', '17', '90', '54', '90', '91', '90', '2016-07-20 15:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2727', '9', '90', '54', '90', '92', '90', '2016-07-20 15:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2728', '7', '90', '54', '90', '92', '90', '2016-07-20 15:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2729', '7', '90', '55', '90', '92', '90', '2016-07-20 15:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2730', '14', '90', '55', '90', '92', '90', '2016-07-20 15:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2731', '14', '90', '55', '90', '93', '90', '2016-07-20 15:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2732', '14', '90', '55', '90', '93', '90', '2016-07-20 15:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2733', '7', '90', '55', '90', '94', '90', '2016-07-20 15:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2734', '16', '90', '56', '90', '91', '90', '2016-07-20 15:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2735', '4', '90', '56', '90', '91', '90', '2016-07-20 15:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2736', '12', '90', '56', '90', '91', '90', '2016-07-20 15:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2737', '17', '90', '56', '90', '92', '90', '2016-07-20 15:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2738', '12', '90', '57', '90', '92', '90', '2016-07-20 15:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2739', '8', '90', '57', '90', '91', '90', '2016-07-20 15:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2740', '14', '90', '57', '90', '91', '90', '2016-07-20 15:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2741', '20', '90', '58', '90', '93', '90', '2016-07-20 15:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2742', '19', '90', '58', '90', '91', '90', '2016-07-20 15:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2743', '9', '90', '59', '90', '92', '90', '2016-07-20 15:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2744', '3', '90', '59', '90', '92', '90', '2016-07-20 15:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2745', '7', '90', '59', '90', '92', '90', '2016-07-20 15:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2746', '2', '90', '59', '90', '91', '90', '2016-07-20 15:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2747', '3', '90', '60', '90', '92', '90', '2016-07-20 15:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2748', '1', '90', '60', '90', '91', '90', '2016-07-20 15:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2749', '3', '90', '60', '90', '91', '90', '2016-07-20 15:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2750', '1', '90', '60', '90', '91', '90', '2016-07-20 15:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2751', '13', '90', '61', '90', '91', '90', '2016-07-20 15:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2752', '10', '90', '61', '90', '92', '90', '2016-07-20 15:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2753', '24', '90', '61', '90', '92', '90', '2016-07-20 15:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2754', '2', '90', '61', '90', '91', '90', '2016-07-20 15:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2755', '60', '90', '62', '90', '93', '90', '2016-07-20 15:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2756', '28', '90', '63', '90', '91', '90', '2016-07-20 15:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2757', '8', '90', '63', '90', '91', '90', '2016-07-20 15:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2758', '33', '90', '63', '90', '92', '90', '2016-07-20 15:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2759', '30', '90', '64', '90', '92', '90', '2016-07-20 15:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2760', '21', '90', '64', '90', '93', '90', '2016-07-20 15:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2761', '7', '90', '64', '90', '94', '90', '2016-07-20 15:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2762', '2', '90', '64', '90', '96', '90', '2016-07-20 15:54:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2763', '9', '90', '64', '90', '95', '90', '2016-07-20 15:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2764', '25', '90', '65', '90', '96', '90', '2016-07-20 15:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2765', '13', '90', '65', '90', '93', '90', '2016-07-20 15:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2766', '33', '90', '68', '90', '91', '90', '2016-07-20 16:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2767', '13', '90', '65', '90', '91', '90', '2016-07-20 16:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2768', '12', '90', '65', '90', '91', '90', '2016-07-20 16:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2769', '8', '90', '65', '90', '91', '90', '2016-07-20 16:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2770', '14', '90', '66', '90', '91', '90', '2016-07-20 16:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2771', '10', '90', '66', '90', '91', '90', '2016-07-20 16:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2772', '8', '90', '66', '90', '91', '90', '2016-07-20 16:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2773', '40', '90', '66', '90', '92', '90', '2016-07-20 16:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2774', '25', '90', '67', '90', '93', '90', '2016-07-20 16:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2775', '15', '90', '67', '90', '91', '90', '2016-07-20 16:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2776', '23', '90', '67', '90', '96', '90', '2016-07-20 16:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2777', '31', '90', '68', '90', '92', '90', '2016-07-20 16:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2778', '16', '90', '68', '90', '94', '90', '2016-07-20 16:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2779', '14', '90', '68', '90', '93', '90', '2016-07-20 16:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2780', '15', '90', '68', '90', '93', '90', '2016-07-20 16:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2781', '9', '90', '68', '90', '93', '90', '2016-07-20 16:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2782', '11', '90', '69', '90', '93', '90', '2016-07-20 16:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2783', '13', '90', '69', '90', '93', '90', '2016-07-20 16:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2784', '13', '90', '69', '90', '94', '90', '2016-07-20 16:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2785', '15', '90', '69', '90', '96', '90', '2016-07-20 16:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2786', '24', '90', '70', '90', '92', '90', '2016-07-20 16:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2787', '14', '90', '70', '90', '94', '90', '2016-07-20 16:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2788', '12', '90', '71', '90', '93', '90', '2016-07-20 16:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2789', '27', '90', '71', '90', '93', '90', '2016-07-20 16:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2790', '13', '90', '72', '90', '91', '90', '2016-07-20 16:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2791', '10', '90', '72', '90', '91', '90', '2016-07-20 16:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2792', '15', '90', '72', '90', '93', '90', '2016-07-20 16:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2793', '10', '90', '75', '90', '91', '90', '2016-07-20 17:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2794', '10', '90', '56', '90', '92', '90', '2016-07-20 18:24:24', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2795', '18', '90', '50', '90', '94', '90', '2016-07-20 20:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2796', '3', '90', '50', '90', '91', '90', '2016-07-20 20:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2797', '2', '90', '72', '90', '94', '90', '2016-07-21 11:31:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2798', '19', '90', '81', '90', '94', '90', '2016-07-21 11:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2799', '24', '90', '72', '90', '92', '90', '2016-07-21 11:34:02', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2800', '4', '90', '72', '90', '92', '90', '2016-07-21 11:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2801', '2', '90', '72', '90', '93', '90', '2016-07-21 11:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2802', '19', '90', '72', '90', '95', '90', '2016-07-21 11:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2803', '23', '90', '76', '90', '97', '90', '2016-07-21 12:20:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2804', '7', '90', '49', '90', '93', '90', '2016-07-21 12:21:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2805', '16', '90', '49', '90', '97', '90', '2016-07-21 12:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2806', '34', '90', '50', '90', '99', '90', '2016-07-21 12:23:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2807', '28', '90', '50', '90', '94', '90', '2016-07-21 12:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2808', '21', '90', '50', '90', '92', '90', '2016-07-21 12:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2809', '22', '90', '50', '90', '92', '90', '2016-07-21 12:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2810', '10', '90', '51', '90', '91', '90', '2016-07-21 12:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2811', '5', '90', '51', '90', '91', '90', '2016-07-21 12:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2812', '28', '90', '51', '90', '93', '90', '2016-07-21 12:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2813', '10', '90', '51', '90', '93', '90', '2016-07-21 12:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2814', '5', '90', '52', '90', '95', '90', '2016-07-21 12:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2815', '20', '90', '52', '90', '95', '90', '2016-07-21 12:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2816', '9', '90', '52', '90', '94', '90', '2016-07-21 12:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2817', '27', '90', '52', '90', '95', '90', '2016-07-21 12:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2818', '24', '90', '53', '90', '95', '90', '2016-07-21 12:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2819', '7', '90', '55', '90', '91', '90', '2016-07-21 12:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2820', '7', '90', '55', '90', '91', '90', '2016-07-21 12:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2821', '9', '90', '56', '90', '91', '90', '2016-07-21 12:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2822', '12', '90', '56', '90', '91', '90', '2016-07-21 12:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2823', '17', '90', '56', '90', '91', '90', '2016-07-21 12:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2824', '9', '90', '57', '90', '91', '90', '2016-07-21 13:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2825', '9', '90', '57', '90', '91', '90', '2016-07-21 13:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2826', '29', '90', '57', '90', '91', '90', '2016-07-21 13:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2827', '7', '90', '57', '90', '91', '90', '2016-07-21 13:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2828', '16', '90', '58', '90', '91', '90', '2016-07-21 13:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2829', '8', '90', '58', '90', '92', '90', '2016-07-21 13:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2830', '35', '90', '58', '90', '91', '90', '2016-07-21 13:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2831', '23', '90', '58', '90', '94', '90', '2016-07-21 13:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2832', '6', '90', '58', '90', '93', '90', '2016-07-21 13:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2833', '7', '90', '59', '90', '92', '90', '2016-07-21 13:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2834', '26', '90', '59', '90', '94', '90', '2016-07-21 13:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2835', '10', '90', '59', '90', '93', '90', '2016-07-21 13:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2836', '15', '90', '60', '90', '94', '90', '2016-07-21 13:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2837', '12', '90', '60', '90', '94', '90', '2016-07-21 13:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2838', '13', '90', '60', '90', '96', '90', '2016-07-21 13:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2839', '9', '90', '61', '90', '92', '90', '2016-07-21 13:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2840', '9', '90', '61', '90', '92', '90', '2016-07-21 13:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2841', '5', '90', '61', '90', '91', '90', '2016-07-21 13:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2842', '38', '90', '61', '90', '92', '90', '2016-07-21 13:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2843', '1', '90', '62', '90', '93', '90', '2016-07-21 13:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2844', '8', '90', '62', '90', '92', '90', '2016-07-21 13:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2845', '19', '90', '62', '90', '93', '90', '2016-07-21 13:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2846', '5', '90', '62', '90', '93', '90', '2016-07-21 13:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2847', '13', '90', '63', '90', '93', '90', '2016-07-21 13:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2848', '20', '90', '63', '90', '93', '90', '2016-07-21 13:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2849', '9', '90', '67', '90', '92', '90', '2016-07-21 13:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2850', '3', '90', '67', '90', '92', '90', '2016-07-21 13:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2851', '31', '90', '72', '90', '96', '90', '2016-07-21 14:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2852', '24', '90', '72', '90', '97', '90', '2016-07-21 14:33:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2853', '13', '90', '73', '90', '96', '90', '2016-07-21 14:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2854', '10', '90', '73', '90', '95', '90', '2016-07-21 14:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2855', '9', '90', '51', '90', '92', '90', '2016-07-21 15:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2856', '9', '90', '51', '90', '93', '90', '2016-07-21 15:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2857', '13', '90', '52', '90', '93', '90', '2016-07-21 15:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2858', '15', '90', '52', '90', '93', '90', '2016-07-21 15:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2859', '5', '90', '53', '90', '94', '90', '2016-07-21 15:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2860', '2', '90', '53', '90', '94', '90', '2016-07-21 15:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2861', '3', '90', '53', '90', '94', '90', '2016-07-21 15:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2862', '18', '90', '53', '90', '93', '90', '2016-07-21 15:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2863', '14', '90', '54', '90', '93', '90', '2016-07-21 15:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2864', '26', '90', '63', '90', '95', '90', '2016-07-21 15:28:04', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2865', '8', '90', '69', '90', '94', '90', '2016-07-21 15:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2866', '10', '90', '69', '90', '95', '90', '2016-07-21 15:30:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2867', '9', '90', '70', '90', '98', '90', '2016-07-21 15:31:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2868', '3', '90', '71', '90', '95', '90', '2016-07-21 15:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2869', '1', '90', '71', '90', '95', '90', '2016-07-21 15:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2870', '23', '90', '71', '90', '95', '90', '2016-07-21 15:34:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2871', '17', '90', '72', '90', '96', '90', '2016-07-21 15:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2872', '9', '90', '72', '90', '96', '90', '2016-07-21 15:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2873', '6', '90', '72', '90', '96', '90', '2016-07-21 15:37:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2874', '2', '90', '73', '90', '91', '90', '2016-07-21 15:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2875', '6', '90', '73', '90', '91', '90', '2016-07-21 15:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2876', '40', '90', '74', '90', '91', '90', '2016-07-21 15:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2877', '4', '90', '82', '90', '97', '90', '2016-07-21 15:58:02', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2878', '22', '90', '61', '90', '96', '90', '2016-07-21 15:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2879', '24', '90', '61', '90', '93', '90', '2016-07-21 16:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2880', '20', '90', '50', '90', '93', '90', '2016-07-21 18:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2881', '6', '90', '52', '90', '92', '90', '2016-07-21 18:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2882', '2', '90', '53', '90', '94', '90', '2016-07-21 18:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2883', '2', '90', '53', '90', '94', '90', '2016-07-21 18:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2884', '5', '90', '53', '90', '94', '90', '2016-07-21 18:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2885', '1', '90', '53', '90', '94', '90', '2016-07-21 18:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2886', '4', '90', '54', '90', '94', '90', '2016-07-21 18:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2887', '1', '90', '54', '90', '94', '90', '2016-07-21 18:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2888', '11', '90', '54', '90', '94', '90', '2016-07-21 18:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2889', '17', '90', '54', '90', '97', '90', '2016-07-21 18:20:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2890', '20', '90', '55', '90', '96', '90', '2016-07-21 18:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2891', '13', '90', '57', '90', '91', '90', '2016-07-21 18:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2892', '5', '90', '57', '90', '91', '90', '2016-07-21 18:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2893', '13', '90', '57', '90', '91', '90', '2016-07-21 18:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2894', '20', '90', '58', '90', '91', '90', '2016-07-21 18:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2895', '8', '90', '58', '90', '92', '90', '2016-07-21 18:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2896', '10', '90', '58', '90', '91', '90', '2016-07-21 18:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2897', '18', '90', '58', '90', '91', '90', '2016-07-21 18:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2898', '16', '90', '59', '90', '92', '90', '2016-07-21 18:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2899', '12', '90', '59', '90', '93', '90', '2016-07-21 18:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2900', '23', '90', '59', '90', '93', '90', '2016-07-21 18:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2901', '12', '90', '59', '90', '92', '90', '2016-07-21 18:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2902', '35', '90', '60', '90', '92', '90', '2016-07-21 18:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2903', '39', '90', '60', '90', '92', '90', '2016-07-21 18:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2904', '20', '90', '60', '90', '92', '90', '2016-07-21 18:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2905', '13', '90', '60', '90', '92', '90', '2016-07-21 18:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2906', '3', '90', '60', '90', '92', '90', '2016-07-21 18:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2907', '9', '90', '61', '90', '94', '90', '2016-07-21 18:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2908', '16', '90', '61', '90', '93', '90', '2016-07-21 18:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2909', '27', '90', '61', '90', '94', '90', '2016-07-21 18:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2910', '2', '90', '61', '90', '94', '90', '2016-07-21 18:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2911', '5', '90', '62', '90', '94', '90', '2016-07-21 18:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2912', '4', '90', '62', '90', '95', '90', '2016-07-21 18:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2913', '12', '90', '62', '90', '95', '90', '2016-07-21 18:58:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2914', '18', '90', '62', '90', '96', '90', '2016-07-21 18:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2915', '31', '90', '63', '90', '93', '90', '2016-07-21 19:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2916', '27', '90', '63', '90', '93', '90', '2016-07-21 19:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2917', '22', '90', '63', '90', '93', '90', '2016-07-21 19:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2918', '15', '90', '63', '90', '93', '90', '2016-07-21 19:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2919', '13', '90', '64', '90', '94', '90', '2016-07-21 19:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2920', '18', '90', '64', '90', '93', '90', '2016-07-21 19:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2921', '17', '90', '64', '90', '94', '90', '2016-07-21 19:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2922', '24', '90', '64', '90', '93', '90', '2016-07-21 19:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2923', '16', '90', '64', '90', '94', '90', '2016-07-21 19:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2924', '23', '90', '65', '90', '94', '90', '2016-07-21 19:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2925', '28', '90', '65', '90', '94', '90', '2016-07-21 19:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2926', '10', '90', '65', '90', '93', '90', '2016-07-21 19:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2927', '18', '90', '65', '90', '94', '90', '2016-07-21 19:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2928', '31', '90', '66', '90', '95', '90', '2016-07-21 19:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2929', '20', '90', '66', '90', '95', '90', '2016-07-21 19:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2930', '12', '90', '69', '90', '91', '90', '2016-07-21 19:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2931', '26', '90', '85', '90', '97', '90', '2016-07-22 16:38:08', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2932', '8', '90', '67', '90', '94', '90', '2016-07-22 16:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2933', '16', '90', '67', '90', '95', '90', '2016-07-22 16:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2934', '6', '90', '70', '90', '96', '90', '2016-07-22 16:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2935', '19', '90', '70', '90', '96', '90', '2016-07-22 16:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2936', '4', '90', '71', '90', '96', '90', '2016-07-22 16:43:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2937', '18', '90', '71', '90', '96', '90', '2016-07-22 16:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2938', '16', '90', '75', '90', '92', '90', '2016-07-22 16:46:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2939', '17', '90', '57', '90', '91', '90', '2016-07-22 16:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2940', '17', '90', '58', '90', '91', '90', '2016-07-22 16:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2941', '25', '90', '72', '90', '93', '90', '2016-07-22 16:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2942', '25', '90', '51', '90', '93', '90', '2016-07-22 16:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2943', '17', '90', '51', '90', '93', '90', '2016-07-22 16:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2944', '14', '90', '56', '90', '94', '90', '2016-07-22 16:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2945', '6', '90', '56', '90', '93', '90', '2016-07-22 16:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2946', '14', '90', '57', '90', '91', '90', '2016-07-22 16:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2947', '27', '90', '57', '90', '91', '90', '2016-07-22 16:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2948', '5', '90', '57', '90', '91', '90', '2016-07-22 16:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2949', '11', '90', '57', '90', '91', '90', '2016-07-22 17:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2950', '2', '90', '58', '90', '91', '90', '2016-07-22 17:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2951', '22', '90', '58', '90', '91', '90', '2016-07-22 17:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2952', '27', '90', '58', '90', '93', '90', '2016-07-22 17:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2953', '19', '90', '58', '90', '91', '90', '2016-07-22 17:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2954', '17', '90', '59', '90', '92', '90', '2016-07-22 17:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2955', '16', '90', '59', '90', '91', '90', '2016-07-22 17:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2956', '23', '90', '69', '90', '95', '90', '2016-07-22 17:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2957', '8', '90', '56', '90', '91', '90', '2016-07-22 17:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2958', '7', '90', '57', '90', '93', '90', '2016-07-22 17:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2959', '11', '90', '57', '90', '92', '90', '2016-07-22 17:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2960', '13', '90', '57', '90', '92', '90', '2016-07-22 17:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2961', '3', '90', '57', '90', '92', '90', '2016-07-22 17:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2962', '20', '90', '58', '90', '92', '90', '2016-07-22 17:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2963', '5', '90', '58', '90', '92', '90', '2016-07-22 17:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2964', '20', '90', '58', '90', '92', '90', '2016-07-22 17:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2965', '6', '90', '58', '90', '91', '90', '2016-07-22 17:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2966', '13', '90', '59', '90', '91', '90', '2016-07-22 17:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2967', '5', '90', '59', '90', '91', '90', '2016-07-22 17:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2968', '21', '90', '59', '90', '92', '90', '2016-07-22 17:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2969', '3', '90', '59', '90', '92', '90', '2016-07-22 17:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2970', '2', '90', '60', '90', '92', '90', '2016-07-22 17:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2971', '1', '90', '60', '90', '92', '90', '2016-07-22 17:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2972', '15', '90', '60', '90', '92', '90', '2016-07-22 17:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2973', '17', '90', '61', '90', '92', '90', '2016-07-22 17:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2974', '7', '90', '61', '90', '93', '90', '2016-07-22 17:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2975', '8', '90', '61', '90', '93', '90', '2016-07-22 17:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2976', '5', '90', '61', '90', '92', '90', '2016-07-22 17:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2977', '20', '90', '61', '90', '93', '90', '2016-07-22 17:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2978', '16', '90', '62', '90', '92', '90', '2016-07-22 17:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2979', '6', '90', '62', '90', '92', '90', '2016-07-22 17:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2980', '1', '90', '62', '90', '92', '90', '2016-07-22 17:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2981', '8', '90', '62', '90', '93', '90', '2016-07-22 17:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2982', '5', '90', '63', '90', '92', '90', '2016-07-22 17:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2983', '10', '90', '63', '90', '93', '90', '2016-07-22 17:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2984', '16', '90', '63', '90', '92', '90', '2016-07-22 17:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2985', '10', '90', '63', '90', '93', '90', '2016-07-22 17:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2986', '16', '90', '64', '90', '92', '90', '2016-07-22 17:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2987', '3', '90', '64', '90', '92', '90', '2016-07-22 17:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2988', '20', '90', '64', '90', '93', '90', '2016-07-22 17:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2989', '9', '90', '64', '90', '93', '90', '2016-07-22 17:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2990', '22', '90', '64', '90', '93', '90', '2016-07-22 17:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2991', '18', '90', '65', '90', '93', '90', '2016-07-22 17:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2992', '11', '90', '65', '90', '93', '90', '2016-07-22 17:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2993', '1', '90', '65', '90', '92', '90', '2016-07-22 17:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2994', '7', '90', '65', '90', '94', '90', '2016-07-22 17:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2995', '10', '90', '66', '90', '95', '90', '2016-07-22 18:09:29', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2996', '7', '90', '66', '90', '93', '90', '2016-07-22 18:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2997', '14', '90', '60', '90', '93', '90', '2016-07-22 18:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2998', '8', '90', '60', '90', '93', '90', '2016-07-22 18:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('2999', '25', '90', '60', '90', '95', '90', '2016-07-22 18:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3000', '11', '90', '60', '90', '95', '90', '2016-07-22 18:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3001', '7', '90', '61', '90', '94', '90', '2016-07-22 18:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3002', '15', '90', '61', '90', '95', '90', '2016-07-22 18:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3003', '11', '90', '61', '90', '92', '90', '2016-07-22 18:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3004', '18', '90', '61', '90', '93', '90', '2016-07-22 18:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3005', '8', '90', '62', '90', '94', '90', '2016-07-22 18:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3006', '13', '90', '62', '90', '96', '90', '2016-07-22 18:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3007', '26', '90', '62', '90', '95', '90', '2016-07-22 18:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3008', '15', '90', '62', '90', '95', '90', '2016-07-22 18:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3009', '19', '90', '63', '90', '96', '90', '2016-07-22 18:24:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3010', '20', '90', '63', '90', '98', '90', '2016-07-22 18:25:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3011', '2', '90', '63', '90', '93', '90', '2016-07-22 18:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3012', '29', '90', '63', '90', '93', '90', '2016-07-22 18:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3013', '29', '90', '64', '90', '92', '90', '2016-07-22 18:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3014', '8', '90', '63', '90', '92', '90', '2016-07-22 18:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3015', '4', '90', '63', '90', '91', '90', '2016-07-22 18:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3016', '28', '90', '64', '90', '92', '90', '2016-07-22 18:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3017', '9', '90', '64', '90', '93', '90', '2016-07-22 18:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3018', '15', '90', '64', '90', '94', '90', '2016-07-22 18:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3019', '12', '90', '64', '90', '95', '90', '2016-07-22 18:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3020', '17', '90', '65', '90', '92', '90', '2016-07-22 18:58:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3021', '4', '90', '65', '90', '91', '90', '2016-07-22 18:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3022', '18', '90', '65', '90', '91', '90', '2016-07-22 19:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3023', '11', '90', '65', '90', '91', '90', '2016-07-22 19:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3024', '3', '90', '66', '90', '91', '90', '2016-07-22 19:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3025', '25', '90', '67', '90', '91', '90', '2016-07-22 19:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3026', '5', '90', '68', '90', '91', '90', '2016-07-22 19:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3027', '8', '90', '68', '90', '91', '90', '2016-07-22 19:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3028', '12', '90', '68', '90', '91', '90', '2016-07-22 19:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3029', '4', '90', '68', '90', '91', '90', '2016-07-22 19:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3030', '2', '90', '68', '90', '91', '90', '2016-07-22 19:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3031', '9', '90', '69', '90', '91', '90', '2016-07-22 19:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3032', '3', '90', '69', '90', '91', '90', '2016-07-22 19:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3033', '5', '90', '69', '90', '91', '90', '2016-07-22 19:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3034', '5', '90', '69', '90', '91', '90', '2016-07-22 19:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3035', '1', '90', '70', '90', '91', '90', '2016-07-22 19:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3036', '5', '90', '70', '90', '91', '90', '2016-07-22 19:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3037', '2', '90', '70', '90', '91', '90', '2016-07-22 19:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3038', '2', '90', '70', '90', '91', '90', '2016-07-22 19:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3039', '20', '90', '70', '90', '91', '90', '2016-07-22 19:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3040', '3', '90', '75', '90', '91', '90', '2016-07-22 20:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3041', '12', '90', '75', '90', '93', '90', '2016-07-22 20:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3042', '15', '90', '75', '90', '92', '90', '2016-07-22 20:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3043', '4', '90', '76', '90', '92', '90', '2016-07-22 20:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3044', '32', '90', '76', '90', '92', '90', '2016-07-22 20:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3045', '12', '90', '76', '90', '92', '90', '2016-07-22 20:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3046', '4', '90', '77', '90', '92', '90', '2016-07-22 20:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3047', '8', '90', '77', '90', '92', '90', '2016-07-22 20:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3048', '13', '90', '77', '90', '92', '90', '2016-07-22 20:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3049', '6', '90', '77', '90', '93', '90', '2016-07-22 20:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3050', '20', '90', '78', '90', '94', '90', '2016-07-22 20:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3051', '1', '90', '78', '90', '93', '90', '2016-07-22 20:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3052', '13', '90', '78', '90', '93', '90', '2016-07-22 20:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3053', '11', '90', '79', '90', '93', '90', '2016-07-22 20:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3054', '4', '90', '79', '90', '92', '90', '2016-07-22 20:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3055', '2', '90', '79', '90', '91', '90', '2016-07-22 20:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3056', '15', '90', '80', '90', '91', '90', '2016-07-22 20:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3057', '5', '90', '80', '90', '92', '90', '2016-07-22 20:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3058', '5', '90', '80', '90', '92', '90', '2016-07-22 20:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3059', '2', '90', '80', '90', '92', '90', '2016-07-22 20:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3060', '40', '90', '81', '90', '93', '90', '2016-07-22 20:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3061', '5', '90', '81', '90', '93', '90', '2016-07-22 20:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3062', '2', '90', '81', '90', '93', '90', '2016-07-22 20:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3063', '2', '90', '82', '90', '94', '90', '2016-07-22 20:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3064', '17', '90', '82', '90', '93', '90', '2016-07-22 20:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3065', '7', '90', '83', '90', '94', '90', '2016-07-22 20:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3066', '15', '90', '83', '90', '93', '90', '2016-07-22 20:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3067', '3', '90', '83', '90', '93', '90', '2016-07-22 20:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3068', '4', '90', '83', '90', '93', '90', '2016-07-22 20:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3069', '4', '90', '84', '90', '93', '90', '2016-07-22 20:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3070', '24', '90', '84', '90', '93', '90', '2016-07-22 20:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3071', '13', '90', '84', '90', '94', '90', '2016-07-22 20:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3072', '9', '90', '84', '90', '94', '90', '2016-07-22 20:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3073', '2', '90', '85', '90', '94', '90', '2016-07-22 20:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3074', '5', '90', '85', '90', '94', '90', '2016-07-22 20:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3075', '4', '90', '85', '90', '94', '90', '2016-07-22 20:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3076', '7', '90', '85', '90', '92', '90', '2016-07-22 20:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3077', '8', '90', '86', '90', '91', '90', '2016-07-22 20:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3078', '6', '90', '86', '90', '92', '90', '2016-07-22 20:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3079', '10', '90', '86', '90', '93', '90', '2016-07-22 20:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3080', '12', '90', '87', '90', '94', '90', '2016-07-22 20:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3081', '5', '90', '87', '90', '95', '90', '2016-07-22 20:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3082', '8', '90', '87', '90', '95', '90', '2016-07-22 20:42:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3083', '9', '90', '88', '90', '96', '90', '2016-07-22 20:43:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3084', '24', '90', '88', '90', '96', '90', '2016-07-22 20:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3085', '3', '90', '88', '90', '94', '90', '2016-07-22 20:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3086', '1', '90', '62', '90', '94', '90', '2016-07-22 20:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3087', '12', '90', '62', '90', '95', '90', '2016-07-22 20:47:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3088', '62', '90', '62', '90', '95', '90', '2016-07-22 20:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3089', '16', '90', '63', '90', '95', '90', '2016-07-22 20:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3090', '6', '90', '63', '90', '95', '90', '2016-07-22 20:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3091', '11', '90', '63', '90', '95', '90', '2016-07-22 20:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3092', '26', '90', '63', '90', '95', '90', '2016-07-22 20:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3093', '11', '90', '64', '90', '96', '90', '2016-07-22 20:53:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3094', '8', '90', '64', '90', '95', '90', '2016-07-22 20:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3095', '6', '90', '64', '90', '96', '90', '2016-07-22 20:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3096', '9', '90', '65', '90', '96', '90', '2016-07-22 20:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3097', '3', '90', '65', '90', '95', '90', '2016-07-22 20:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3098', '8', '90', '70', '90', '92', '90', '2016-07-23 11:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3099', '2', '90', '75', '90', '93', '90', '2016-07-23 11:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3100', '5', '90', '75', '90', '93', '90', '2016-07-23 11:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3101', '4', '90', '76', '90', '94', '90', '2016-07-23 11:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3102', '9', '90', '76', '90', '93', '90', '2016-07-23 11:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3103', '7', '90', '76', '90', '93', '90', '2016-07-23 11:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3104', '3', '90', '82', '90', '94', '90', '2016-07-23 11:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3105', '35', '90', '63', '90', '95', '90', '2016-07-23 11:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3106', '5', '90', '76', '90', '91', '90', '2016-07-23 11:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3107', '2', '90', '86', '90', '94', '90', '2016-07-23 11:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3108', '2', '90', '66', '90', '94', '90', '2016-07-23 11:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3109', '4', '90', '86', '90', '91', '90', '2016-07-23 11:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3110', '30', '90', '81', '90', '91', '90', '2016-07-23 11:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3111', '1', '90', '72', '90', '91', '90', '2016-07-23 11:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3112', '7', '90', '69', '90', '93', '90', '2016-07-23 11:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3113', '29', '90', '76', '90', '95', '90', '2016-07-23 11:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3114', '8', '90', '76', '90', '94', '90', '2016-07-23 11:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3115', '2', '90', '76', '90', '94', '90', '2016-07-23 11:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3116', '42', '90', '50', '90', '92', '90', '2016-07-23 11:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3117', '2', '90', '50', '90', '94', '90', '2016-07-23 11:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3118', '2', '90', '51', '90', '94', '90', '2016-07-23 11:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3119', '7', '90', '51', '90', '95', '90', '2016-07-23 11:42:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3120', '7', '90', '58', '90', '91', '90', '2016-07-23 12:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3121', '12', '90', '60', '90', '91', '90', '2016-07-23 12:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3122', '5', '90', '60', '90', '91', '90', '2016-07-23 12:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3123', '15', '90', '63', '90', '96', '90', '2016-07-23 12:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3124', '17', '90', '64', '90', '97', '90', '2016-07-23 12:21:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3125', '8', '90', '64', '90', '96', '90', '2016-07-23 12:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3126', '49', '90', '64', '90', '95', '90', '2016-07-23 12:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3127', '40', '90', '64', '90', '95', '90', '2016-07-23 12:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3128', '34', '90', '65', '90', '97', '90', '2016-07-23 12:25:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3129', '4', '90', '65', '90', '91', '90', '2016-07-23 12:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3130', '12', '90', '65', '90', '91', '90', '2016-07-23 12:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3131', '17', '90', '66', '90', '92', '90', '2016-07-23 12:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3132', '16', '90', '66', '90', '92', '90', '2016-07-23 12:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3133', '36', '90', '66', '90', '93', '90', '2016-07-23 12:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3134', '22', '90', '66', '90', '91', '90', '2016-07-23 12:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3135', '17', '90', '67', '90', '91', '90', '2016-07-23 12:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3136', '17', '90', '67', '90', '92', '90', '2016-07-23 12:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3137', '21', '90', '67', '90', '94', '90', '2016-07-23 12:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3138', '9', '90', '68', '90', '92', '90', '2016-07-23 12:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3139', '12', '90', '52', '90', '93', '90', '2016-07-23 12:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3140', '2', '90', '52', '90', '93', '90', '2016-07-23 12:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3141', '11', '90', '53', '90', '94', '90', '2016-07-23 12:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3142', '2', '90', '53', '90', '93', '90', '2016-07-23 12:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3143', '5', '90', '53', '90', '93', '90', '2016-07-23 12:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3144', '1', '90', '53', '90', '93', '90', '2016-07-23 12:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3145', '11', '90', '54', '90', '93', '90', '2016-07-23 12:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3146', '8', '90', '54', '90', '93', '90', '2016-07-23 12:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3147', '7', '90', '54', '90', '94', '90', '2016-07-23 12:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3148', '1', '90', '54', '90', '93', '90', '2016-07-23 12:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3149', '5', '90', '54', '90', '94', '90', '2016-07-23 12:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3150', '5', '90', '55', '90', '93', '90', '2016-07-23 12:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3151', '2', '90', '55', '90', '93', '90', '2016-07-23 12:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3152', '5', '90', '55', '90', '93', '90', '2016-07-23 12:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3153', '2', '90', '55', '90', '93', '90', '2016-07-23 12:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3154', '2', '90', '56', '90', '93', '90', '2016-07-23 12:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3155', '9', '90', '56', '90', '93', '90', '2016-07-23 12:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3156', '1', '90', '56', '90', '93', '90', '2016-07-23 12:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3157', '1', '90', '56', '90', '93', '90', '2016-07-23 13:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3158', '1', '90', '56', '90', '94', '90', '2016-07-23 13:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3159', '4', '90', '57', '90', '94', '90', '2016-07-23 13:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3160', '1', '90', '57', '90', '94', '90', '2016-07-23 13:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3161', '2', '90', '57', '90', '94', '90', '2016-07-23 13:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3162', '1', '90', '57', '90', '94', '90', '2016-07-23 13:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3163', '1', '90', '57', '90', '94', '90', '2016-07-23 13:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3164', '6', '90', '58', '90', '94', '90', '2016-07-23 13:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3165', '2', '90', '58', '90', '94', '90', '2016-07-23 13:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3166', '1', '90', '58', '90', '94', '90', '2016-07-23 13:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3167', '2', '90', '58', '90', '95', '90', '2016-07-23 13:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3168', '1', '90', '59', '90', '95', '90', '2016-07-23 13:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3169', '2', '90', '59', '90', '94', '90', '2016-07-23 13:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3170', '2', '90', '59', '90', '94', '90', '2016-07-23 13:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3171', '0', '90', '59', '90', '94', '90', '2016-07-23 13:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3172', '3', '90', '59', '90', '94', '90', '2016-07-23 13:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3173', '2', '90', '60', '90', '94', '90', '2016-07-23 13:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3174', '2', '90', '60', '90', '94', '90', '2016-07-23 13:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3175', '3', '90', '60', '90', '94', '90', '2016-07-23 13:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3176', '6', '90', '61', '90', '94', '90', '2016-07-23 13:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3177', '2', '90', '61', '90', '94', '90', '2016-07-23 13:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3178', '2', '90', '61', '90', '94', '90', '2016-07-23 13:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3179', '1', '90', '61', '90', '94', '90', '2016-07-23 13:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3180', '2', '90', '61', '90', '94', '90', '2016-07-23 13:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3181', '2', '90', '62', '90', '94', '90', '2016-07-23 13:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3182', '2', '90', '62', '90', '94', '90', '2016-07-23 13:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3183', '1', '90', '62', '90', '96', '90', '2016-07-23 13:26:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3184', '3', '90', '62', '90', '95', '90', '2016-07-23 13:27:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3185', '2', '90', '63', '90', '96', '90', '2016-07-23 13:28:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3186', '6', '90', '66', '90', '91', '90', '2016-07-23 13:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3187', '11', '90', '72', '90', '91', '90', '2016-07-23 14:00:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3188', '20', '90', '54', '90', '92', '90', '2016-07-23 14:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3189', '2', '90', '78', '90', '91', '90', '2016-07-23 14:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3190', '1', '90', '80', '90', '91', '90', '2016-07-23 14:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3191', '2', '90', '81', '90', '91', '90', '2016-07-23 14:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3192', '4', '90', '81', '90', '91', '90', '2016-07-23 14:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3193', '14', '90', '82', '90', '91', '90', '2016-07-23 14:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3194', '8', '90', '83', '90', '91', '90', '2016-07-23 14:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3195', '3', '90', '83', '90', '91', '90', '2016-07-23 14:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3196', '3', '90', '83', '90', '91', '90', '2016-07-23 14:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3197', '1', '90', '84', '90', '91', '90', '2016-07-23 14:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3198', '4', '90', '81', '90', '92', '90', '2016-07-23 15:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3199', '26', '90', '83', '90', '94', '90', '2016-07-23 15:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3200', '6', '90', '84', '90', '94', '90', '2016-07-23 15:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3201', '13', '90', '84', '90', '95', '90', '2016-07-23 15:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3202', '23', '90', '84', '90', '95', '90', '2016-07-23 15:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3203', '27', '90', '85', '90', '95', '90', '2016-07-23 15:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3204', '2', '90', '85', '90', '95', '90', '2016-07-23 15:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3205', '12', '90', '85', '90', '95', '90', '2016-07-23 15:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3206', '5', '90', '85', '90', '95', '90', '2016-07-23 15:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3207', '26', '90', '86', '90', '95', '90', '2016-07-23 15:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3208', '12', '90', '86', '90', '95', '90', '2016-07-23 15:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3209', '7', '90', '86', '90', '95', '90', '2016-07-23 15:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3210', '11', '90', '86', '90', '95', '90', '2016-07-23 15:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3211', '26', '90', '87', '90', '95', '90', '2016-07-23 15:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3212', '9', '90', '87', '90', '95', '90', '2016-07-23 15:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3213', '8', '90', '87', '90', '95', '90', '2016-07-23 15:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3214', '100', '90', '67', '90', '88', '90', '2016-07-23 16:16:00', '<font color=\"red\">CPU当前：100%,超出预设值  90%<br></font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3215', '2', '90', '63', '90', '92', '90', '2016-07-23 16:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3216', '14', '90', '74', '90', '92', '90', '2016-07-23 16:34:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3217', '18', '90', '79', '90', '91', '90', '2016-07-23 16:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3218', '27', '90', '88', '90', '91', '90', '2016-07-23 16:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3219', '24', '90', '86', '90', '92', '90', '2016-07-23 16:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3220', '14', '90', '65', '90', '93', '90', '2016-07-23 16:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3221', '11', '90', '65', '90', '92', '90', '2016-07-23 16:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3222', '24', '90', '65', '90', '91', '90', '2016-07-23 16:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3223', '24', '90', '80', '90', '92', '90', '2016-07-23 16:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3224', '5', '90', '82', '90', '96', '90', '2016-07-23 17:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3225', '21', '90', '84', '90', '91', '90', '2016-07-23 17:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3226', '16', '90', '84', '90', '92', '90', '2016-07-23 17:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3227', '21', '90', '55', '90', '93', '90', '2016-07-23 18:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3228', '11', '90', '58', '90', '92', '90', '2016-07-23 18:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3229', '15', '90', '58', '90', '92', '90', '2016-07-23 18:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3230', '23', '90', '58', '90', '91', '90', '2016-07-23 18:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3231', '11', '90', '58', '90', '91', '90', '2016-07-23 18:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3232', '12', '90', '59', '90', '91', '90', '2016-07-23 18:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3233', '12', '90', '59', '90', '91', '90', '2016-07-23 18:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3234', '12', '90', '59', '90', '92', '90', '2016-07-23 18:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3235', '21', '90', '59', '90', '92', '90', '2016-07-23 18:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3236', '24', '90', '60', '90', '92', '90', '2016-07-23 18:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3237', '16', '90', '60', '90', '92', '90', '2016-07-23 18:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3238', '18', '90', '60', '90', '93', '90', '2016-07-23 18:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3239', '11', '90', '60', '90', '93', '90', '2016-07-23 18:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3240', '26', '90', '61', '90', '93', '90', '2016-07-23 18:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3241', '25', '90', '61', '90', '93', '90', '2016-07-23 18:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3242', '9', '90', '61', '90', '93', '90', '2016-07-23 18:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3243', '13', '90', '61', '90', '93', '90', '2016-07-23 18:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3244', '13', '90', '62', '90', '93', '90', '2016-07-23 18:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3245', '11', '90', '62', '90', '93', '90', '2016-07-23 18:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3246', '8', '90', '62', '90', '93', '90', '2016-07-23 18:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3247', '8', '90', '62', '90', '93', '90', '2016-07-23 18:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3248', '13', '90', '63', '90', '94', '90', '2016-07-23 18:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3249', '12', '90', '63', '90', '94', '90', '2016-07-23 18:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3250', '12', '90', '63', '90', '93', '90', '2016-07-23 18:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3251', '8', '90', '63', '90', '93', '90', '2016-07-23 18:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3252', '16', '90', '63', '90', '93', '90', '2016-07-23 18:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3253', '14', '90', '64', '90', '93', '90', '2016-07-23 18:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3254', '10', '90', '64', '90', '93', '90', '2016-07-23 18:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3255', '11', '90', '64', '90', '93', '90', '2016-07-23 18:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3256', '40', '90', '64', '90', '93', '90', '2016-07-23 18:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3257', '13', '90', '65', '90', '93', '90', '2016-07-23 18:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3258', '20', '90', '65', '90', '94', '90', '2016-07-23 18:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3259', '13', '90', '65', '90', '94', '90', '2016-07-23 18:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3260', '17', '90', '65', '90', '93', '90', '2016-07-23 18:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3261', '11', '90', '65', '90', '94', '90', '2016-07-23 18:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3262', '30', '90', '66', '90', '93', '90', '2016-07-23 18:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3263', '15', '90', '66', '90', '93', '90', '2016-07-23 18:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3264', '5', '90', '66', '90', '93', '90', '2016-07-23 18:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3265', '9', '90', '66', '90', '93', '90', '2016-07-23 18:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3266', '11', '90', '67', '90', '93', '90', '2016-07-23 18:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3267', '13', '90', '67', '90', '93', '90', '2016-07-23 18:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3268', '21', '90', '67', '90', '93', '90', '2016-07-23 18:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3269', '13', '90', '67', '90', '93', '90', '2016-07-23 18:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3270', '26', '90', '68', '90', '91', '90', '2016-07-23 18:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3271', '8', '90', '68', '90', '91', '90', '2016-07-23 18:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3272', '12', '90', '69', '90', '92', '90', '2016-07-23 18:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3273', '48', '90', '70', '90', '93', '90', '2016-07-23 18:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3274', '19', '90', '70', '90', '91', '90', '2016-07-23 18:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3275', '16', '90', '70', '90', '91', '90', '2016-07-23 18:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3276', '17', '90', '70', '90', '91', '90', '2016-07-23 19:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3277', '21', '90', '70', '90', '91', '90', '2016-07-23 19:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3278', '19', '90', '71', '90', '91', '90', '2016-07-23 19:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3279', '17', '90', '71', '90', '91', '90', '2016-07-23 19:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3280', '17', '90', '71', '90', '91', '90', '2016-07-23 19:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3281', '16', '90', '71', '90', '91', '90', '2016-07-23 19:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3282', '21', '90', '72', '90', '91', '90', '2016-07-23 19:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3283', '20', '90', '72', '90', '92', '90', '2016-07-23 19:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3284', '15', '90', '72', '90', '92', '90', '2016-07-23 19:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3285', '13', '90', '72', '90', '92', '90', '2016-07-23 19:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3286', '21', '90', '73', '90', '93', '90', '2016-07-23 19:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3287', '17', '90', '73', '90', '93', '90', '2016-07-23 19:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3288', '17', '90', '73', '90', '93', '90', '2016-07-23 19:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3289', '14', '90', '73', '90', '93', '90', '2016-07-23 19:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3290', '18', '90', '74', '90', '93', '90', '2016-07-23 19:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3291', '15', '90', '74', '90', '93', '90', '2016-07-23 19:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3292', '27', '90', '74', '90', '93', '90', '2016-07-23 19:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3293', '3', '90', '74', '90', '93', '90', '2016-07-23 19:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3294', '5', '90', '74', '90', '91', '90', '2016-07-23 19:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3295', '5', '90', '75', '90', '92', '90', '2016-07-23 19:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3296', '15', '90', '75', '90', '91', '90', '2016-07-23 19:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3297', '12', '90', '64', '90', '93', '90', '2016-07-23 20:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3298', '9', '90', '71', '90', '94', '90', '2016-07-23 20:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3299', '16', '90', '71', '90', '94', '90', '2016-07-23 20:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3300', '9', '90', '71', '90', '93', '90', '2016-07-23 20:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3301', '17', '90', '71', '90', '94', '90', '2016-07-23 20:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3302', '7', '90', '72', '90', '94', '90', '2016-07-23 20:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3303', '12', '90', '72', '90', '94', '90', '2016-07-23 20:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3304', '20', '90', '72', '90', '93', '90', '2016-07-23 20:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3305', '5', '90', '74', '90', '91', '90', '2016-07-23 20:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3306', '8', '90', '68', '90', '92', '90', '2016-07-25 11:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3307', '2', '90', '57', '90', '91', '90', '2016-07-25 11:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3308', '1', '90', '57', '90', '91', '90', '2016-07-25 11:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3309', '13', '90', '58', '90', '91', '90', '2016-07-25 11:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3310', '27', '90', '58', '90', '92', '90', '2016-07-25 11:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3311', '10', '90', '58', '90', '93', '90', '2016-07-25 11:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3312', '25', '90', '58', '90', '93', '90', '2016-07-25 11:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3313', '91', '90', '58', '90', '96', '90', '2016-07-25 11:14:00', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br>内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3314', '16', '90', '59', '90', '97', '90', '2016-07-25 11:15:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3315', '4', '90', '59', '90', '96', '90', '2016-07-25 11:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3316', '2', '90', '59', '90', '96', '90', '2016-07-25 11:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3317', '1', '90', '60', '90', '96', '90', '2016-07-25 11:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3318', '9', '90', '60', '90', '96', '90', '2016-07-25 11:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3319', '3', '90', '60', '90', '92', '90', '2016-07-25 11:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3320', '6', '90', '60', '90', '92', '90', '2016-07-25 11:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3321', '6', '90', '61', '90', '93', '90', '2016-07-25 11:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3322', '12', '90', '61', '90', '92', '90', '2016-07-25 11:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3323', '22', '90', '61', '90', '95', '90', '2016-07-25 11:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3324', '2', '90', '61', '90', '91', '90', '2016-07-25 11:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3325', '7', '90', '62', '90', '92', '90', '2016-07-25 11:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3326', '1', '90', '62', '90', '92', '90', '2016-07-25 11:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3327', '1', '90', '62', '90', '92', '90', '2016-07-25 11:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3328', '3', '90', '62', '90', '92', '90', '2016-07-25 11:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3329', '16', '90', '63', '90', '93', '90', '2016-07-25 11:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3330', '2', '90', '63', '90', '92', '90', '2016-07-25 11:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3331', '2', '90', '66', '90', '93', '90', '2016-07-25 11:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3332', '1', '90', '67', '90', '93', '90', '2016-07-25 11:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3333', '19', '90', '67', '90', '93', '90', '2016-07-25 11:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3334', '4', '90', '67', '90', '93', '90', '2016-07-25 11:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3335', '1', '90', '67', '90', '93', '90', '2016-07-25 11:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3336', '1', '90', '68', '90', '92', '90', '2016-07-25 11:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3337', '5', '90', '68', '90', '92', '90', '2016-07-25 11:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3338', '2', '90', '69', '90', '92', '90', '2016-07-25 11:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3339', '13', '90', '69', '90', '92', '90', '2016-07-25 11:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3340', '3', '90', '69', '90', '92', '90', '2016-07-25 11:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3341', '8', '90', '69', '90', '91', '90', '2016-07-25 11:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3342', '2', '90', '69', '90', '91', '90', '2016-07-25 11:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3343', '4', '90', '70', '90', '91', '90', '2016-07-25 12:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3344', '19', '90', '70', '90', '93', '90', '2016-07-25 12:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3345', '15', '90', '47', '90', '96', '90', '2016-07-25 12:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3346', '4', '90', '47', '90', '98', '90', '2016-07-25 12:34:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3347', '8', '90', '47', '90', '95', '90', '2016-07-25 12:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3348', '11', '90', '48', '90', '96', '90', '2016-07-25 12:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3349', '12', '90', '48', '90', '98', '90', '2016-07-25 12:37:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3350', '12', '90', '49', '90', '91', '90', '2016-07-25 12:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3351', '11', '90', '49', '90', '91', '90', '2016-07-25 12:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3352', '5', '90', '49', '90', '91', '90', '2016-07-25 12:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3353', '12', '90', '49', '90', '91', '90', '2016-07-25 12:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3354', '14', '90', '49', '90', '91', '90', '2016-07-25 12:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3355', '13', '90', '50', '90', '91', '90', '2016-07-25 12:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3356', '25', '90', '50', '90', '93', '90', '2016-07-25 12:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3357', '38', '90', '51', '90', '91', '90', '2016-07-25 12:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3358', '30', '90', '51', '90', '93', '90', '2016-07-25 12:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3359', '40', '90', '51', '90', '93', '90', '2016-07-25 12:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3360', '80', '90', '58', '90', '91', '90', '2016-07-25 13:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3361', '75', '90', '58', '90', '91', '90', '2016-07-25 13:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3362', '71', '90', '58', '90', '92', '90', '2016-07-25 13:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3363', '70', '90', '58', '90', '92', '90', '2016-07-25 13:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3364', '72', '90', '59', '90', '92', '90', '2016-07-25 13:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3365', '72', '90', '59', '90', '93', '90', '2016-07-25 13:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3366', '78', '90', '59', '90', '93', '90', '2016-07-25 13:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3367', '73', '90', '59', '90', '93', '90', '2016-07-25 13:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3368', '75', '90', '60', '90', '93', '90', '2016-07-25 13:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3369', '78', '90', '60', '90', '95', '90', '2016-07-25 13:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3370', '75', '90', '60', '90', '95', '90', '2016-07-25 13:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3371', '75', '90', '60', '90', '95', '90', '2016-07-25 13:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3372', '71', '90', '60', '90', '95', '90', '2016-07-25 13:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3373', '73', '90', '61', '90', '96', '90', '2016-07-25 13:53:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3374', '72', '90', '61', '90', '95', '90', '2016-07-25 13:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3375', '74', '90', '61', '90', '96', '90', '2016-07-25 13:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3376', '75', '90', '61', '90', '95', '90', '2016-07-25 13:56:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3377', '70', '90', '62', '90', '96', '90', '2016-07-25 13:57:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3378', '71', '90', '62', '90', '96', '90', '2016-07-25 13:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3379', '67', '90', '62', '90', '96', '90', '2016-07-25 13:59:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3380', '72', '90', '62', '90', '96', '90', '2016-07-25 14:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3381', '77', '90', '62', '90', '96', '90', '2016-07-25 14:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3382', '71', '90', '63', '90', '96', '90', '2016-07-25 14:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3383', '74', '90', '63', '90', '96', '90', '2016-07-25 14:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3384', '78', '90', '63', '90', '97', '90', '2016-07-25 14:04:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3385', '68', '90', '64', '90', '96', '90', '2016-07-25 14:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3386', '71', '90', '64', '90', '96', '90', '2016-07-25 14:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3387', '77', '90', '64', '90', '96', '90', '2016-07-25 14:07:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3388', '60', '90', '69', '90', '91', '90', '2016-07-25 14:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3389', '70', '90', '69', '90', '91', '90', '2016-07-25 14:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3390', '77', '90', '69', '90', '91', '90', '2016-07-25 14:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3391', '71', '90', '69', '90', '91', '90', '2016-07-25 14:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3392', '11', '90', '70', '90', '91', '90', '2016-07-25 14:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3393', '75', '90', '70', '90', '91', '90', '2016-07-25 14:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3394', '77', '90', '70', '90', '91', '90', '2016-07-25 14:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3395', '72', '90', '70', '90', '92', '90', '2016-07-25 14:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3396', '71', '90', '71', '90', '92', '90', '2016-07-25 14:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3397', '72', '90', '71', '90', '93', '90', '2016-07-25 14:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3398', '71', '90', '71', '90', '94', '90', '2016-07-25 14:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3399', '74', '90', '71', '90', '94', '90', '2016-07-25 14:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3400', '73', '90', '71', '90', '94', '90', '2016-07-25 14:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3401', '81', '90', '72', '90', '95', '90', '2016-07-25 14:53:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3402', '70', '90', '72', '90', '95', '90', '2016-07-25 14:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3403', '71', '90', '72', '90', '96', '90', '2016-07-25 14:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3404', '67', '90', '72', '90', '96', '90', '2016-07-25 14:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3405', '80', '90', '72', '90', '95', '90', '2016-07-25 14:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3406', '77', '90', '73', '90', '96', '90', '2016-07-25 14:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3407', '68', '90', '73', '90', '95', '90', '2016-07-25 14:59:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3408', '68', '90', '73', '90', '95', '90', '2016-07-25 15:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3409', '73', '90', '46', '90', '95', '90', '2016-07-25 15:01:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3410', '79', '90', '46', '90', '95', '90', '2016-07-25 15:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3411', '71', '90', '46', '90', '96', '90', '2016-07-25 15:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3412', '75', '90', '47', '90', '95', '90', '2016-07-25 15:04:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3413', '74', '90', '47', '90', '95', '90', '2016-07-25 15:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3414', '69', '90', '47', '90', '96', '90', '2016-07-25 15:06:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3415', '82', '90', '47', '90', '95', '90', '2016-07-25 15:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3416', '84', '90', '48', '90', '95', '90', '2016-07-25 15:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3417', '73', '90', '48', '90', '96', '90', '2016-07-25 15:09:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3418', '78', '90', '48', '90', '95', '90', '2016-07-25 15:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3419', '75', '90', '48', '90', '96', '90', '2016-07-25 15:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3420', '83', '90', '49', '90', '96', '90', '2016-07-25 15:12:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3421', '82', '90', '49', '90', '95', '90', '2016-07-25 15:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3422', '71', '90', '49', '90', '96', '90', '2016-07-25 15:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3423', '73', '90', '49', '90', '96', '90', '2016-07-25 15:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3424', '69', '90', '49', '90', '96', '90', '2016-07-25 15:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3425', '71', '90', '50', '90', '96', '90', '2016-07-25 15:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3426', '38', '90', '50', '90', '95', '90', '2016-07-25 15:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3427', '28', '90', '50', '90', '96', '90', '2016-07-25 15:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3428', '27', '90', '50', '90', '92', '90', '2016-07-25 15:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3429', '59', '90', '51', '90', '92', '90', '2016-07-25 15:22:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3430', '17', '90', '58', '90', '93', '90', '2016-07-25 15:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3431', '8', '90', '58', '90', '94', '90', '2016-07-25 15:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3432', '5', '90', '58', '90', '94', '90', '2016-07-25 15:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3433', '75', '90', '59', '90', '94', '90', '2016-07-25 15:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3434', '10', '90', '59', '90', '94', '90', '2016-07-25 15:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3435', '2', '90', '59', '90', '95', '90', '2016-07-25 15:59:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3436', '16', '90', '59', '90', '95', '90', '2016-07-25 16:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3437', '6', '90', '59', '90', '92', '90', '2016-07-25 16:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3438', '4', '90', '59', '90', '93', '90', '2016-07-25 16:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3439', '2', '90', '60', '90', '92', '90', '2016-07-25 16:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3440', '2', '90', '60', '90', '91', '90', '2016-07-25 16:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3441', '10', '90', '60', '90', '92', '90', '2016-07-25 16:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3442', '6', '90', '61', '90', '93', '90', '2016-07-25 16:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3443', '5', '90', '61', '90', '93', '90', '2016-07-25 16:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3444', '1', '90', '61', '90', '93', '90', '2016-07-25 16:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3445', '4', '90', '61', '90', '93', '90', '2016-07-25 16:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3446', '1', '90', '62', '90', '94', '90', '2016-07-25 16:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3447', '4', '90', '62', '90', '95', '90', '2016-07-25 16:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3448', '6', '90', '62', '90', '94', '90', '2016-07-25 16:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3449', '1', '90', '63', '90', '94', '90', '2016-07-25 16:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3450', '10', '90', '63', '90', '95', '90', '2016-07-25 16:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3451', '6', '90', '63', '90', '95', '90', '2016-07-25 16:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3452', '23', '90', '64', '90', '98', '90', '2016-07-25 16:16:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3453', '24', '90', '64', '90', '99', '90', '2016-07-25 16:17:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3454', '5', '90', '64', '90', '92', '90', '2016-07-25 16:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3455', '9', '90', '64', '90', '93', '90', '2016-07-25 16:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3456', '13', '90', '64', '90', '93', '90', '2016-07-25 16:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3457', '19', '90', '65', '90', '94', '90', '2016-07-25 16:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3458', '2', '90', '65', '90', '93', '90', '2016-07-25 16:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3459', '4', '90', '65', '90', '94', '90', '2016-07-25 16:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3460', '5', '90', '65', '90', '94', '90', '2016-07-25 16:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3461', '15', '90', '66', '90', '95', '90', '2016-07-25 16:25:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3462', '5', '90', '66', '90', '94', '90', '2016-07-25 16:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3463', '26', '90', '66', '90', '94', '90', '2016-07-25 16:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3464', '2', '90', '66', '90', '94', '90', '2016-07-25 16:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3465', '2', '90', '66', '90', '94', '90', '2016-07-25 16:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3466', '7', '90', '67', '90', '94', '90', '2016-07-25 16:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3467', '16', '90', '68', '90', '91', '90', '2016-07-25 16:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3468', '31', '90', '70', '90', '92', '90', '2016-07-25 16:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3469', '21', '90', '70', '90', '91', '90', '2016-07-25 16:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3470', '20', '90', '70', '90', '91', '90', '2016-07-25 16:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3471', '49', '90', '70', '90', '92', '90', '2016-07-25 16:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3472', '43', '90', '71', '90', '91', '90', '2016-07-25 16:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3473', '27', '90', '71', '90', '92', '90', '2016-07-25 16:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3474', '23', '90', '71', '90', '93', '90', '2016-07-25 16:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3475', '28', '90', '71', '90', '93', '90', '2016-07-25 16:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3476', '23', '90', '72', '90', '92', '90', '2016-07-25 16:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3477', '6', '90', '72', '90', '93', '90', '2016-07-25 17:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3478', '36', '90', '72', '90', '95', '90', '2016-07-25 17:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3479', '20', '90', '72', '90', '91', '90', '2016-07-25 17:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3480', '24', '90', '73', '90', '92', '90', '2016-07-25 17:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3481', '23', '90', '73', '90', '92', '90', '2016-07-25 17:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3482', '61', '90', '54', '90', '94', '90', '2016-07-25 18:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3483', '71', '90', '54', '90', '95', '90', '2016-07-25 18:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3484', '9', '90', '54', '90', '95', '90', '2016-07-25 18:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3485', '55', '90', '54', '90', '95', '90', '2016-07-25 18:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3486', '60', '90', '55', '90', '95', '90', '2016-07-25 18:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3487', '61', '90', '55', '90', '96', '90', '2016-07-25 18:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3488', '56', '90', '55', '90', '95', '90', '2016-07-25 18:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3489', '64', '90', '55', '90', '97', '90', '2016-07-25 18:24:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3490', '57', '90', '55', '90', '97', '90', '2016-07-25 18:25:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3491', '56', '90', '56', '90', '96', '90', '2016-07-25 18:26:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3492', '59', '90', '56', '90', '97', '90', '2016-07-25 18:27:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3493', '63', '90', '56', '90', '97', '90', '2016-07-25 18:28:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3494', '71', '90', '56', '90', '98', '90', '2016-07-25 18:29:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3495', '65', '90', '57', '90', '97', '90', '2016-07-25 18:30:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3496', '57', '90', '57', '90', '98', '90', '2016-07-25 18:31:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3497', '62', '90', '57', '90', '97', '90', '2016-07-25 18:32:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3498', '57', '90', '57', '90', '97', '90', '2016-07-25 18:33:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3499', '73', '90', '58', '90', '97', '90', '2016-07-25 18:34:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3500', '60', '90', '58', '90', '97', '90', '2016-07-25 18:35:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3501', '62', '90', '58', '90', '98', '90', '2016-07-25 18:36:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3502', '55', '90', '58', '90', '98', '90', '2016-07-25 18:37:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3503', '62', '90', '58', '90', '98', '90', '2016-07-25 18:38:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3504', '62', '90', '62', '90', '92', '90', '2016-07-25 19:02:06', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3505', '70', '90', '62', '90', '92', '90', '2016-07-25 19:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3506', '74', '90', '63', '90', '93', '90', '2016-07-25 19:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3507', '66', '90', '63', '90', '94', '90', '2016-07-25 19:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3508', '65', '90', '63', '90', '96', '90', '2016-07-25 19:08:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3509', '68', '90', '63', '90', '97', '90', '2016-07-25 19:09:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3510', '60', '90', '64', '90', '95', '90', '2016-07-25 19:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3511', '57', '90', '64', '90', '94', '90', '2016-07-25 19:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3512', '68', '90', '64', '90', '93', '90', '2016-07-25 19:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3513', '6', '90', '83', '90', '91', '90', '2016-07-27 13:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3514', '3', '90', '86', '90', '91', '90', '2016-07-27 13:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3515', '2', '90', '86', '90', '91', '90', '2016-07-27 13:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3516', '2', '90', '87', '90', '91', '90', '2016-07-27 13:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3517', '14', '90', '87', '90', '91', '90', '2016-07-27 13:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3518', '2', '90', '87', '90', '91', '90', '2016-07-27 13:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3519', '2', '90', '88', '90', '91', '90', '2016-07-27 13:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3520', '8', '90', '88', '90', '92', '90', '2016-07-27 13:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3521', '2', '90', '88', '90', '91', '90', '2016-07-27 13:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3522', '8', '90', '88', '90', '91', '90', '2016-07-27 13:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3523', '6', '90', '89', '90', '92', '90', '2016-07-27 13:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3524', '3', '90', '62', '90', '92', '90', '2016-07-27 13:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3525', '3', '90', '62', '90', '93', '90', '2016-07-27 13:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3526', '1', '90', '62', '90', '93', '90', '2016-07-27 13:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3527', '12', '90', '62', '90', '94', '90', '2016-07-27 13:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3528', '3', '90', '63', '90', '94', '90', '2016-07-27 13:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3529', '1', '90', '63', '90', '94', '90', '2016-07-27 13:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3530', '2', '90', '63', '90', '94', '90', '2016-07-27 13:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3531', '2', '90', '64', '90', '94', '90', '2016-07-27 13:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3532', '2', '90', '64', '90', '94', '90', '2016-07-27 13:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3533', '2', '90', '64', '90', '94', '90', '2016-07-27 13:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3534', '3', '90', '64', '90', '94', '90', '2016-07-27 13:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3535', '4', '90', '65', '90', '94', '90', '2016-07-27 13:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3536', '2', '90', '65', '90', '94', '90', '2016-07-27 13:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3537', '6', '90', '65', '90', '94', '90', '2016-07-27 13:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3538', '7', '90', '66', '90', '94', '90', '2016-07-27 13:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3539', '2', '90', '66', '90', '94', '90', '2016-07-27 13:36:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3540', '2', '90', '66', '90', '95', '90', '2016-07-27 13:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3541', '5', '90', '67', '90', '95', '90', '2016-07-27 13:38:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3542', '6', '90', '67', '90', '95', '90', '2016-07-27 13:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3543', '4', '90', '67', '90', '96', '90', '2016-07-27 13:40:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3544', '4', '90', '67', '90', '96', '90', '2016-07-27 13:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3545', '3', '90', '68', '90', '96', '90', '2016-07-27 13:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3546', '6', '90', '68', '90', '96', '90', '2016-07-27 13:43:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3547', '1', '90', '68', '90', '96', '90', '2016-07-27 13:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3548', '2', '90', '69', '90', '96', '90', '2016-07-27 13:45:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3549', '3', '90', '69', '90', '96', '90', '2016-07-27 13:46:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3550', '2', '90', '69', '90', '96', '90', '2016-07-27 13:47:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3551', '7', '90', '70', '90', '92', '90', '2016-07-27 13:50:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3552', '8', '90', '70', '90', '93', '90', '2016-07-27 13:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3553', '15', '90', '70', '90', '93', '90', '2016-07-27 13:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3554', '11', '90', '71', '90', '92', '90', '2016-07-27 13:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3555', '10', '90', '71', '90', '93', '90', '2016-07-27 13:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3556', '16', '90', '71', '90', '93', '90', '2016-07-27 13:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3557', '9', '90', '71', '90', '94', '90', '2016-07-27 13:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3558', '8', '90', '72', '90', '94', '90', '2016-07-27 13:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3559', '9', '90', '72', '90', '93', '90', '2016-07-27 13:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3560', '16', '90', '72', '90', '93', '90', '2016-07-27 13:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3561', '8', '90', '73', '90', '93', '90', '2016-07-27 14:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3562', '12', '90', '73', '90', '93', '90', '2016-07-27 14:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3563', '8', '90', '73', '90', '93', '90', '2016-07-27 14:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3564', '5', '90', '73', '90', '93', '90', '2016-07-27 14:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3565', '7', '90', '74', '90', '93', '90', '2016-07-27 14:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3566', '5', '90', '74', '90', '95', '90', '2016-07-27 14:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3567', '6', '90', '74', '90', '95', '90', '2016-07-27 14:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3568', '17', '90', '74', '90', '94', '90', '2016-07-27 14:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3569', '13', '90', '75', '90', '95', '90', '2016-07-27 14:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3570', '28', '90', '75', '90', '95', '90', '2016-07-27 14:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3571', '16', '90', '76', '90', '92', '90', '2016-07-27 14:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3572', '98', '90', '65', '90', '89', '90', '2016-07-28 11:10:01', '<font color=\"red\">CPU当前：98%,超出预设值  90%<br></font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3573', '16', '90', '77', '90', '91', '90', '2016-07-28 11:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3574', '2', '90', '77', '90', '92', '90', '2016-07-28 11:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3575', '39', '90', '65', '90', '96', '90', '2016-07-28 12:08:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3576', '27', '90', '67', '90', '98', '90', '2016-07-28 12:09:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3577', '2', '90', '68', '90', '97', '90', '2016-07-28 12:10:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3578', '21', '90', '68', '90', '96', '90', '2016-07-28 12:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3579', '36', '90', '68', '90', '98', '90', '2016-07-28 12:12:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3580', '8', '90', '69', '90', '96', '90', '2016-07-28 12:13:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3581', '33', '90', '69', '90', '97', '90', '2016-07-28 12:14:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3582', '28', '90', '69', '90', '93', '90', '2016-07-28 12:15:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3583', '46', '90', '70', '90', '91', '90', '2016-07-28 12:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3584', '28', '90', '70', '90', '94', '90', '2016-07-28 12:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3585', '18', '90', '70', '90', '96', '90', '2016-07-28 12:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3586', '16', '90', '71', '90', '92', '90', '2016-07-28 12:21:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3587', '27', '90', '71', '90', '92', '90', '2016-07-28 12:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3588', '21', '90', '71', '90', '93', '90', '2016-07-28 12:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3589', '29', '90', '72', '90', '95', '90', '2016-07-28 12:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3590', '28', '90', '72', '90', '92', '90', '2016-07-28 12:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3591', '20', '90', '72', '90', '93', '90', '2016-07-28 12:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3592', '15', '90', '72', '90', '93', '90', '2016-07-28 12:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3593', '40', '90', '73', '90', '91', '90', '2016-07-28 12:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3594', '14', '90', '73', '90', '95', '90', '2016-07-28 12:29:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3595', '26', '90', '73', '90', '92', '90', '2016-07-28 12:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3596', '30', '90', '73', '90', '92', '90', '2016-07-28 12:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3597', '19', '90', '74', '90', '93', '90', '2016-07-28 12:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3598', '29', '90', '79', '90', '95', '90', '2016-07-28 13:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3599', '7', '90', '80', '90', '93', '90', '2016-07-28 13:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3600', '13', '90', '81', '90', '94', '90', '2016-07-28 13:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3601', '5', '90', '81', '90', '93', '90', '2016-07-28 13:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3602', '4', '90', '81', '90', '93', '90', '2016-07-28 13:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3603', '1', '90', '82', '90', '93', '90', '2016-07-28 13:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3604', '6', '90', '82', '90', '93', '90', '2016-07-28 13:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3605', '5', '90', '82', '90', '93', '90', '2016-07-28 13:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3606', '8', '90', '82', '90', '94', '90', '2016-07-28 13:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3607', '3', '90', '83', '90', '93', '90', '2016-07-28 13:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3608', '12', '90', '83', '90', '93', '90', '2016-07-28 13:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3609', '16', '90', '83', '90', '94', '90', '2016-07-28 13:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3610', '21', '90', '83', '90', '94', '90', '2016-07-28 13:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3611', '11', '90', '84', '90', '94', '90', '2016-07-28 13:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3612', '2', '90', '84', '90', '94', '90', '2016-07-28 13:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3613', '3', '90', '84', '90', '94', '90', '2016-07-28 13:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3614', '12', '90', '85', '90', '94', '90', '2016-07-28 13:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3615', '10', '90', '85', '90', '94', '90', '2016-07-28 13:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3616', '6', '90', '85', '90', '93', '90', '2016-07-28 13:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3617', '11', '90', '85', '90', '94', '90', '2016-07-28 13:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3618', '7', '90', '88', '90', '95', '90', '2016-07-28 13:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3619', '5', '90', '74', '90', '91', '90', '2016-07-28 13:55:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3620', '2', '90', '83', '90', '91', '90', '2016-07-28 13:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3621', '2', '90', '83', '90', '91', '90', '2016-07-28 14:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3622', '2', '90', '83', '90', '91', '90', '2016-07-28 14:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3623', '4', '90', '68', '90', '92', '90', '2016-07-28 14:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3624', '13', '90', '84', '90', '91', '90', '2016-07-28 14:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3625', '13', '90', '84', '90', '91', '90', '2016-07-28 14:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3626', '18', '90', '88', '90', '91', '90', '2016-07-28 14:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3627', '3', '90', '89', '90', '91', '90', '2016-07-28 14:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3628', '6', '90', '90', '90', '92', '90', '2016-07-28 14:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3629', '10', '90', '90', '90', '92', '90', '2016-07-28 14:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3630', '1', '90', '63', '90', '91', '90', '2016-07-28 14:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3631', '7', '90', '67', '90', '91', '90', '2016-07-28 14:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3632', '20', '90', '67', '90', '93', '90', '2016-07-28 14:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3633', '8', '90', '67', '90', '92', '90', '2016-07-28 14:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3634', '5', '90', '68', '90', '92', '90', '2016-07-28 14:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3635', '2', '90', '68', '90', '92', '90', '2016-07-28 14:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3636', '3', '90', '68', '90', '94', '90', '2016-07-28 14:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3637', '21', '90', '69', '90', '93', '90', '2016-07-28 14:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3638', '1', '90', '69', '90', '93', '90', '2016-07-28 14:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3639', '11', '90', '69', '90', '93', '90', '2016-07-28 14:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3640', '15', '90', '69', '90', '92', '90', '2016-07-28 14:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3641', '4', '90', '70', '90', '93', '90', '2016-07-28 14:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3642', '3', '90', '70', '90', '94', '90', '2016-07-28 14:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3643', '2', '90', '70', '90', '93', '90', '2016-07-28 14:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3644', '9', '90', '71', '90', '93', '90', '2016-07-28 14:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3645', '2', '90', '72', '90', '93', '90', '2016-07-28 15:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3646', '5', '90', '72', '90', '94', '90', '2016-07-28 15:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3647', '11', '90', '73', '90', '95', '90', '2016-07-28 15:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3648', '1', '90', '73', '90', '95', '90', '2016-07-28 15:03:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3649', '2', '90', '74', '90', '95', '90', '2016-07-28 15:04:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3650', '18', '90', '74', '90', '95', '90', '2016-07-28 15:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3651', '2', '90', '74', '90', '95', '90', '2016-07-28 15:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3652', '7', '90', '74', '90', '96', '90', '2016-07-28 15:07:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3653', '5', '90', '75', '90', '96', '90', '2016-07-28 15:08:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3654', '2', '90', '75', '90', '96', '90', '2016-07-28 15:09:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3655', '9', '90', '75', '90', '97', '90', '2016-07-28 15:10:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3656', '2', '90', '76', '90', '96', '90', '2016-07-28 15:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3657', '2', '90', '76', '90', '96', '90', '2016-07-28 15:12:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3658', '11', '90', '76', '90', '97', '90', '2016-07-28 15:13:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3659', '10', '90', '76', '90', '97', '90', '2016-07-28 15:14:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3660', '2', '90', '77', '90', '96', '90', '2016-07-28 15:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3661', '6', '90', '77', '90', '97', '90', '2016-07-28 15:16:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3662', '4', '90', '77', '90', '97', '90', '2016-07-28 15:17:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3663', '2', '90', '77', '90', '97', '90', '2016-07-28 15:18:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3664', '3', '90', '78', '90', '97', '90', '2016-07-28 15:19:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3665', '9', '90', '78', '90', '97', '90', '2016-07-28 15:20:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3666', '10', '90', '78', '90', '91', '90', '2016-07-28 15:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3667', '2', '90', '85', '90', '92', '90', '2016-07-28 15:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3668', '4', '90', '87', '90', '92', '90', '2016-07-28 15:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3669', '9', '90', '88', '90', '92', '90', '2016-07-28 15:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3670', '15', '90', '88', '90', '93', '90', '2016-07-28 15:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3671', '6', '90', '88', '90', '93', '90', '2016-07-28 15:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3672', '1', '90', '88', '90', '92', '90', '2016-07-28 15:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3673', '3', '90', '89', '90', '93', '90', '2016-07-28 15:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3674', '4', '90', '89', '90', '93', '90', '2016-07-28 15:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3675', '2', '90', '90', '90', '93', '90', '2016-07-28 15:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3676', '4', '90', '90', '90', '94', '90', '2016-07-28 15:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3677', '15', '90', '90', '90', '94', '90', '2016-07-28 15:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3678', '23', '90', '63', '90', '92', '90', '2016-07-28 15:36:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3679', '25', '90', '69', '90', '95', '90', '2016-07-28 16:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3680', '14', '90', '69', '90', '94', '90', '2016-07-28 16:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3681', '12', '90', '69', '90', '94', '90', '2016-07-28 16:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3682', '6', '90', '73', '90', '92', '90', '2016-07-28 16:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3683', '17', '90', '74', '90', '94', '90', '2016-07-28 16:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3684', '9', '90', '74', '90', '91', '90', '2016-07-28 16:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3685', '8', '90', '74', '90', '91', '90', '2016-07-28 16:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3686', '5', '90', '75', '90', '91', '90', '2016-07-28 16:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3687', '9', '90', '75', '90', '91', '90', '2016-07-28 16:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3688', '7', '90', '75', '90', '91', '90', '2016-07-28 16:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3689', '9', '90', '75', '90', '91', '90', '2016-07-28 16:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3690', '3', '90', '76', '90', '91', '90', '2016-07-28 16:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3691', '2', '90', '76', '90', '91', '90', '2016-07-28 16:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3692', '3', '90', '76', '90', '91', '90', '2016-07-28 16:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3693', '5', '90', '76', '90', '91', '90', '2016-07-28 16:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3694', '5', '90', '77', '90', '91', '90', '2016-07-28 16:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3695', '4', '90', '77', '90', '91', '90', '2016-07-28 16:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3696', '2', '90', '77', '90', '91', '90', '2016-07-28 16:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3697', '4', '90', '78', '90', '91', '90', '2016-07-28 16:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3698', '3', '90', '78', '90', '91', '90', '2016-07-28 16:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3699', '9', '90', '78', '90', '91', '90', '2016-07-28 16:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3700', '5', '90', '80', '90', '91', '90', '2016-07-28 17:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3701', '2', '90', '80', '90', '91', '90', '2016-07-28 17:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3702', '2', '90', '81', '90', '91', '90', '2016-07-28 17:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3703', '4', '90', '81', '90', '91', '90', '2016-07-28 17:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3704', '2', '90', '82', '90', '91', '90', '2016-07-28 17:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3705', '3', '90', '82', '90', '91', '90', '2016-07-28 17:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3706', '2', '90', '82', '90', '91', '90', '2016-07-28 17:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3707', '9', '90', '82', '90', '91', '90', '2016-07-28 17:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3708', '6', '90', '83', '90', '91', '90', '2016-07-28 17:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3709', '5', '90', '83', '90', '91', '90', '2016-07-28 17:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3710', '2', '90', '83', '90', '91', '90', '2016-07-28 17:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3711', '4', '90', '83', '90', '91', '90', '2016-07-28 17:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3712', '1', '90', '84', '90', '92', '90', '2016-07-28 17:12:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3713', '13', '90', '84', '90', '94', '90', '2016-07-28 17:25:05', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3714', '3', '90', '84', '90', '95', '90', '2016-07-28 17:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3715', '4', '90', '85', '90', '94', '90', '2016-07-28 17:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3716', '8', '90', '85', '90', '94', '90', '2016-07-28 17:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3717', '8', '90', '85', '90', '94', '90', '2016-07-28 17:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3718', '6', '90', '85', '90', '94', '90', '2016-07-28 17:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3719', '2', '90', '86', '90', '93', '90', '2016-07-28 17:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3720', '2', '90', '86', '90', '93', '90', '2016-07-28 17:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3721', '3', '90', '86', '90', '93', '90', '2016-07-28 17:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3722', '5', '90', '87', '90', '93', '90', '2016-07-28 17:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3723', '2', '90', '87', '90', '93', '90', '2016-07-28 17:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3724', '4', '90', '87', '90', '93', '90', '2016-07-28 17:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3725', '11', '90', '88', '90', '94', '90', '2016-07-28 17:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3726', '3', '90', '88', '90', '94', '90', '2016-07-28 17:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3727', '19', '90', '88', '90', '95', '90', '2016-07-28 17:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3728', '15', '90', '88', '90', '94', '90', '2016-07-28 17:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3729', '8', '90', '89', '90', '97', '90', '2016-07-28 17:41:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3730', '8', '90', '89', '90', '95', '90', '2016-07-28 17:42:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3731', '5', '90', '89', '90', '95', '90', '2016-07-28 17:43:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3732', '2', '90', '90', '90', '95', '90', '2016-07-28 17:44:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3733', '39', '90', '90', '90', '93', '90', '2016-07-28 17:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3734', '31', '90', '67', '90', '94', '90', '2016-07-28 18:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3735', '14', '90', '68', '90', '93', '90', '2016-07-28 18:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3736', '15', '90', '68', '90', '93', '90', '2016-07-28 18:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3737', '18', '90', '68', '90', '93', '90', '2016-07-28 18:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3738', '17', '90', '69', '90', '93', '90', '2016-07-28 18:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3739', '14', '90', '69', '90', '93', '90', '2016-07-28 18:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3740', '6', '90', '69', '90', '92', '90', '2016-07-28 18:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3741', '17', '90', '69', '90', '93', '90', '2016-07-28 18:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3742', '17', '90', '70', '90', '92', '90', '2016-07-28 18:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3743', '17', '90', '70', '90', '97', '90', '2016-07-28 18:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3744', '12', '90', '73', '90', '91', '90', '2016-07-28 18:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3745', '8', '90', '74', '90', '91', '90', '2016-07-28 18:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3746', '9', '90', '74', '90', '91', '90', '2016-07-28 18:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3747', '12', '90', '74', '90', '91', '90', '2016-07-28 18:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3748', '11', '90', '74', '90', '91', '90', '2016-07-28 18:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3749', '9', '90', '75', '90', '91', '90', '2016-07-28 18:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3750', '9', '90', '75', '90', '91', '90', '2016-07-28 18:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3751', '8', '90', '75', '90', '91', '90', '2016-07-28 18:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3752', '15', '90', '75', '90', '92', '90', '2016-07-28 18:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3753', '15', '90', '76', '90', '92', '90', '2016-07-28 18:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3754', '9', '90', '76', '90', '92', '90', '2016-07-28 18:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3755', '12', '90', '76', '90', '92', '90', '2016-07-28 18:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3756', '7', '90', '77', '90', '92', '90', '2016-07-28 18:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3757', '13', '90', '77', '90', '91', '90', '2016-07-28 18:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3758', '12', '90', '77', '90', '91', '90', '2016-07-28 18:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3759', '6', '90', '78', '90', '92', '90', '2016-07-28 18:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3760', '20', '90', '78', '90', '92', '90', '2016-07-28 18:56:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3761', '52', '90', '78', '90', '92', '90', '2016-07-28 18:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3762', '48', '90', '78', '90', '94', '90', '2016-07-28 18:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3763', '38', '90', '79', '90', '94', '90', '2016-07-28 18:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3764', '40', '90', '79', '90', '94', '90', '2016-07-28 19:00:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3765', '53', '90', '79', '90', '94', '90', '2016-07-28 19:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3766', '56', '90', '80', '90', '94', '90', '2016-07-28 19:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3767', '64', '90', '80', '90', '94', '90', '2016-07-28 19:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3768', '55', '90', '80', '90', '94', '90', '2016-07-28 19:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3769', '72', '90', '81', '90', '95', '90', '2016-07-28 19:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3770', '75', '90', '81', '90', '95', '90', '2016-07-28 19:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3771', '71', '90', '81', '90', '95', '90', '2016-07-28 19:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3772', '69', '90', '82', '90', '95', '90', '2016-07-28 19:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3773', '65', '90', '82', '90', '95', '90', '2016-07-28 19:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3774', '11', '90', '82', '90', '95', '90', '2016-07-28 19:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3775', '77', '90', '82', '90', '95', '90', '2016-07-28 19:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3776', '67', '90', '82', '90', '95', '90', '2016-07-28 19:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3777', '73', '90', '83', '90', '95', '90', '2016-07-28 19:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3778', '68', '90', '83', '90', '95', '90', '2016-07-28 19:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3779', '70', '90', '83', '90', '95', '90', '2016-07-28 19:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3780', '76', '90', '84', '90', '95', '90', '2016-07-28 19:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3781', '41', '90', '84', '90', '94', '90', '2016-07-28 19:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3782', '19', '90', '84', '90', '93', '90', '2016-07-28 19:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3783', '8', '90', '84', '90', '94', '90', '2016-07-28 19:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3784', '14', '90', '85', '90', '94', '90', '2016-07-28 19:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3785', '9', '90', '85', '90', '95', '90', '2016-07-28 19:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3786', '3', '90', '85', '90', '95', '90', '2016-07-28 19:22:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3787', '9', '90', '86', '90', '93', '90', '2016-07-28 19:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3788', '12', '90', '53', '90', '91', '90', '2016-07-29 10:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3789', '2', '90', '55', '90', '91', '90', '2016-07-29 10:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3790', '4', '90', '56', '90', '91', '90', '2016-07-29 10:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3791', '15', '90', '82', '90', '91', '90', '2016-07-29 11:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3792', '7', '90', '63', '90', '92', '90', '2016-07-29 11:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3793', '2', '90', '64', '90', '92', '90', '2016-07-29 11:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3794', '6', '90', '64', '90', '93', '90', '2016-07-29 11:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3795', '7', '90', '64', '90', '92', '90', '2016-07-29 11:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3796', '2', '90', '65', '90', '92', '90', '2016-07-29 11:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3797', '3', '90', '65', '90', '92', '90', '2016-07-29 11:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3798', '32', '90', '65', '90', '92', '90', '2016-07-29 11:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3799', '32', '90', '66', '90', '94', '90', '2016-07-29 11:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3800', '18', '90', '66', '90', '95', '90', '2016-07-29 11:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3801', '5', '90', '66', '90', '94', '90', '2016-07-29 11:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3802', '3', '90', '75', '90', '92', '90', '2016-07-29 11:16:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3803', '12', '90', '82', '90', '92', '90', '2016-07-29 11:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3804', '5', '90', '82', '90', '92', '90', '2016-07-29 11:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3805', '5', '90', '82', '90', '93', '90', '2016-07-29 11:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3806', '35', '90', '83', '90', '94', '90', '2016-07-29 11:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3807', '1', '90', '83', '90', '94', '90', '2016-07-29 11:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3808', '37', '90', '83', '90', '92', '90', '2016-07-29 11:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3809', '12', '90', '84', '90', '92', '90', '2016-07-29 11:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3810', '3', '90', '84', '90', '92', '90', '2016-07-29 11:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3811', '25', '90', '84', '90', '93', '90', '2016-07-29 11:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3812', '10', '90', '85', '90', '94', '90', '2016-07-29 11:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3813', '9', '90', '85', '90', '93', '90', '2016-07-29 11:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3814', '20', '90', '85', '90', '94', '90', '2016-07-29 11:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3815', '3', '90', '86', '90', '94', '90', '2016-07-29 11:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3816', '12', '90', '86', '90', '94', '90', '2016-07-29 11:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3817', '5', '90', '53', '90', '93', '90', '2016-07-29 11:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3818', '2', '90', '59', '90', '95', '90', '2016-07-29 11:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3819', '17', '90', '63', '90', '92', '90', '2016-07-29 11:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3820', '10', '90', '76', '90', '94', '90', '2016-07-29 11:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3821', '19', '90', '83', '90', '91', '90', '2016-07-29 12:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3822', '2', '90', '84', '90', '92', '90', '2016-07-29 12:13:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3823', '18', '90', '84', '90', '94', '90', '2016-07-29 12:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3824', '24', '90', '84', '90', '99', '90', '2016-07-29 12:15:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3825', '5', '90', '85', '90', '97', '90', '2016-07-29 12:16:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3826', '3', '90', '85', '90', '96', '90', '2016-07-29 12:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3827', '9', '90', '85', '90', '96', '90', '2016-07-29 12:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3828', '38', '90', '85', '90', '95', '90', '2016-07-29 12:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3829', '26', '90', '86', '90', '94', '90', '2016-07-29 12:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3830', '16', '90', '86', '90', '96', '90', '2016-07-29 12:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3831', '15', '90', '86', '90', '99', '90', '2016-07-29 12:22:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3832', '27', '90', '87', '90', '94', '90', '2016-07-29 12:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3833', '22', '90', '87', '90', '94', '90', '2016-07-29 12:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3834', '13', '90', '86', '90', '94', '90', '2016-07-29 15:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3835', '13', '90', '86', '90', '94', '90', '2016-07-29 15:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3836', '34', '90', '86', '90', '94', '90', '2016-07-29 15:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3837', '29', '90', '87', '90', '92', '90', '2016-07-29 15:07:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3838', '49', '90', '87', '90', '97', '90', '2016-07-29 15:08:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3839', '7', '90', '62', '90', '91', '90', '2016-07-29 15:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3840', '6', '90', '62', '90', '92', '90', '2016-07-29 15:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3841', '5', '90', '63', '90', '93', '90', '2016-07-29 15:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3842', '5', '90', '63', '90', '94', '90', '2016-07-29 15:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3843', '2', '90', '63', '90', '93', '90', '2016-07-29 15:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3844', '7', '90', '64', '90', '94', '90', '2016-07-29 15:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3845', '2', '90', '64', '90', '91', '90', '2016-07-29 15:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3846', '4', '90', '64', '90', '91', '90', '2016-07-29 15:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3847', '26', '90', '64', '90', '91', '90', '2016-07-29 15:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3848', '16', '90', '71', '90', '91', '90', '2016-07-29 15:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3849', '8', '90', '72', '90', '91', '90', '2016-07-29 15:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3850', '9', '90', '72', '90', '91', '90', '2016-07-29 15:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3851', '11', '90', '73', '90', '91', '90', '2016-07-29 15:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3852', '9', '90', '74', '90', '91', '90', '2016-07-29 15:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3853', '6', '90', '74', '90', '91', '90', '2016-07-29 15:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3854', '10', '90', '74', '90', '91', '90', '2016-07-29 16:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3855', '6', '90', '75', '90', '91', '90', '2016-07-29 16:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3856', '6', '90', '75', '90', '92', '90', '2016-07-29 16:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3857', '7', '90', '75', '90', '92', '90', '2016-07-29 16:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3858', '12', '90', '75', '90', '91', '90', '2016-07-29 16:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3859', '6', '90', '76', '90', '91', '90', '2016-07-29 16:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3860', '16', '90', '76', '90', '91', '90', '2016-07-29 16:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3861', '23', '90', '77', '90', '91', '90', '2016-07-29 16:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3862', '5', '90', '77', '90', '91', '90', '2016-07-29 16:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3863', '7', '90', '77', '90', '92', '90', '2016-07-29 16:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3864', '3', '90', '78', '90', '93', '90', '2016-07-29 16:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3865', '5', '90', '78', '90', '93', '90', '2016-07-29 16:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3866', '5', '90', '78', '90', '93', '90', '2016-07-29 16:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3867', '6', '90', '78', '90', '93', '90', '2016-07-29 16:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3868', '3', '90', '79', '90', '93', '90', '2016-07-29 16:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3869', '5', '90', '79', '90', '93', '90', '2016-07-29 16:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3870', '34', '90', '79', '90', '94', '90', '2016-07-29 16:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3871', '27', '90', '80', '90', '93', '90', '2016-07-29 16:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3872', '44', '90', '80', '90', '94', '90', '2016-07-29 16:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3873', '25', '90', '80', '90', '93', '90', '2016-07-29 16:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3874', '34', '90', '81', '90', '93', '90', '2016-07-29 16:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3875', '19', '90', '81', '90', '92', '90', '2016-07-29 16:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3876', '26', '90', '81', '90', '92', '90', '2016-07-29 16:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3877', '25', '90', '81', '90', '93', '90', '2016-07-29 16:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3878', '24', '90', '82', '90', '92', '90', '2016-07-29 16:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3879', '33', '90', '82', '90', '94', '90', '2016-07-29 16:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3880', '32', '90', '82', '90', '93', '90', '2016-07-29 16:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3881', '25', '90', '82', '90', '94', '90', '2016-07-29 16:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3882', '33', '90', '82', '90', '94', '90', '2016-07-29 16:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3883', '16', '90', '83', '90', '94', '90', '2016-07-29 16:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3884', '53', '90', '83', '90', '96', '90', '2016-07-29 16:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3885', '67', '90', '83', '90', '95', '90', '2016-07-29 16:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3886', '12', '90', '84', '90', '91', '90', '2016-07-29 16:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3887', '24', '90', '85', '90', '93', '90', '2016-07-29 16:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3888', '11', '90', '85', '90', '93', '90', '2016-07-29 16:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3889', '2', '90', '85', '90', '92', '90', '2016-07-29 16:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3890', '16', '90', '85', '90', '91', '90', '2016-07-29 16:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3891', '2', '90', '86', '90', '91', '90', '2016-07-29 16:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3892', '16', '90', '86', '90', '91', '90', '2016-07-29 16:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3893', '16', '90', '86', '90', '93', '90', '2016-07-29 16:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3894', '10', '90', '87', '90', '93', '90', '2016-07-29 16:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3895', '6', '90', '87', '90', '95', '90', '2016-07-29 16:47:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3896', '9', '90', '87', '90', '95', '90', '2016-07-29 16:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3897', '14', '90', '87', '90', '94', '90', '2016-07-29 16:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3898', '21', '90', '88', '90', '94', '90', '2016-07-29 16:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3899', '9', '90', '61', '90', '95', '90', '2016-07-29 16:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3900', '64', '90', '61', '90', '95', '90', '2016-07-29 16:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3901', '7', '90', '61', '90', '95', '90', '2016-07-29 16:53:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3902', '2', '90', '61', '90', '95', '90', '2016-07-29 16:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3903', '7', '90', '61', '90', '95', '90', '2016-07-29 16:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3904', '2', '90', '62', '90', '94', '90', '2016-07-29 16:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3905', '5', '90', '62', '90', '95', '90', '2016-07-29 16:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3906', '5', '90', '62', '90', '92', '90', '2016-07-29 20:29:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3907', '53', '90', '77', '90', '92', '90', '2016-07-29 20:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3908', '6', '90', '72', '90', '91', '90', '2016-07-29 20:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3909', '10', '90', '78', '90', '92', '90', '2016-07-29 20:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3910', '7', '90', '78', '90', '92', '90', '2016-07-29 20:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3911', '16', '90', '79', '90', '93', '90', '2016-07-29 20:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3912', '17', '90', '79', '90', '93', '90', '2016-07-29 20:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3913', '2', '90', '79', '90', '94', '90', '2016-07-29 20:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3914', '16', '90', '80', '90', '95', '90', '2016-07-29 20:38:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3915', '9', '90', '80', '90', '94', '90', '2016-07-29 20:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3916', '2', '90', '80', '90', '95', '90', '2016-07-29 20:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3917', '62', '90', '80', '90', '95', '90', '2016-07-29 20:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3918', '14', '90', '57', '90', '95', '90', '2016-07-29 20:43:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3919', '9', '90', '64', '90', '94', '90', '2016-07-29 20:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3920', '4', '90', '78', '90', '92', '90', '2016-07-29 20:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3921', '8', '90', '78', '90', '96', '90', '2016-07-31 15:21:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3922', '6', '90', '86', '90', '97', '90', '2016-07-31 15:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3923', '1', '90', '86', '90', '96', '90', '2016-07-31 15:23:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3924', '5', '90', '60', '90', '96', '90', '2016-07-31 15:24:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3925', '9', '90', '67', '90', '96', '90', '2016-07-31 15:25:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3926', '2', '90', '67', '90', '96', '90', '2016-07-31 15:26:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3927', '2', '90', '67', '90', '96', '90', '2016-07-31 15:27:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3928', '13', '90', '68', '90', '96', '90', '2016-07-31 15:28:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3929', '2', '90', '68', '90', '97', '90', '2016-07-31 15:29:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3930', '10', '90', '68', '90', '97', '90', '2016-07-31 15:30:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3931', '8', '90', '70', '90', '92', '90', '2016-07-31 15:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3932', '5', '90', '72', '90', '92', '90', '2016-07-31 15:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3933', '23', '90', '64', '90', '92', '90', '2016-07-31 15:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3934', '1', '90', '63', '90', '93', '90', '2016-07-31 15:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3935', '4', '90', '63', '90', '93', '90', '2016-07-31 15:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3936', '3', '90', '70', '90', '93', '90', '2016-07-31 15:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3937', '4', '90', '70', '90', '93', '90', '2016-07-31 15:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3938', '5', '90', '71', '90', '92', '90', '2016-07-31 15:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3939', '2', '90', '71', '90', '92', '90', '2016-07-31 15:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3940', '2', '90', '71', '90', '92', '90', '2016-07-31 15:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3941', '5', '90', '72', '90', '92', '90', '2016-07-31 15:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3942', '4', '90', '72', '90', '92', '90', '2016-07-31 15:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3943', '12', '90', '72', '90', '92', '90', '2016-07-31 15:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3944', '3', '90', '72', '90', '93', '90', '2016-07-31 15:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3945', '1', '90', '72', '90', '93', '90', '2016-07-31 15:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3946', '6', '90', '73', '90', '93', '90', '2016-07-31 15:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3947', '2', '90', '73', '90', '93', '90', '2016-07-31 15:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3948', '6', '90', '74', '90', '93', '90', '2016-07-31 15:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3949', '5', '90', '74', '90', '94', '90', '2016-07-31 15:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3950', '2', '90', '74', '90', '94', '90', '2016-07-31 15:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3951', '2', '90', '75', '90', '94', '90', '2016-07-31 15:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3952', '4', '90', '75', '90', '94', '90', '2016-07-31 15:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3953', '2', '90', '75', '90', '94', '90', '2016-07-31 15:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3954', '3', '90', '75', '90', '94', '90', '2016-07-31 16:00:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3955', '2', '90', '76', '90', '94', '90', '2016-07-31 16:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3956', '2', '90', '76', '90', '94', '90', '2016-07-31 16:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3957', '2', '90', '76', '90', '94', '90', '2016-07-31 16:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3958', '2', '90', '76', '90', '94', '90', '2016-07-31 16:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3959', '2', '90', '77', '90', '94', '90', '2016-07-31 16:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3960', '2', '90', '77', '90', '94', '90', '2016-07-31 16:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3961', '5', '90', '77', '90', '94', '90', '2016-07-31 16:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3962', '4', '90', '78', '90', '94', '90', '2016-07-31 16:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3963', '2', '90', '78', '90', '94', '90', '2016-07-31 16:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3964', '5', '90', '78', '90', '94', '90', '2016-07-31 16:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3965', '2', '90', '79', '90', '94', '90', '2016-07-31 16:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3966', '5', '90', '79', '90', '94', '90', '2016-07-31 16:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3967', '2', '90', '79', '90', '95', '90', '2016-07-31 16:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3968', '5', '90', '79', '90', '95', '90', '2016-07-31 16:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3969', '6', '90', '79', '90', '94', '90', '2016-07-31 16:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3970', '2', '90', '80', '90', '94', '90', '2016-07-31 16:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3971', '2', '90', '80', '90', '94', '90', '2016-07-31 16:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3972', '2', '90', '80', '90', '94', '90', '2016-07-31 16:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3973', '4', '90', '81', '90', '98', '90', '2016-07-31 16:26:16', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3974', '25', '90', '81', '90', '97', '90', '2016-07-31 16:27:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3975', '7', '90', '63', '90', '91', '90', '2016-08-05 10:38:02', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3976', '2', '90', '70', '90', '94', '90', '2016-08-05 10:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3977', '2', '90', '71', '90', '92', '90', '2016-08-05 10:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3978', '3', '90', '71', '90', '92', '90', '2016-08-05 10:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3979', '13', '90', '72', '90', '92', '90', '2016-08-05 10:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3980', '6', '90', '72', '90', '92', '90', '2016-08-05 10:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3981', '4', '90', '72', '90', '92', '90', '2016-08-05 10:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3982', '6', '90', '72', '90', '93', '90', '2016-08-05 10:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3983', '16', '90', '73', '90', '93', '90', '2016-08-05 10:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3984', '3', '90', '51', '90', '91', '90', '2016-08-05 10:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3985', '30', '90', '51', '90', '94', '90', '2016-08-05 10:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3986', '12', '90', '51', '90', '93', '90', '2016-08-05 10:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3987', '5', '90', '52', '90', '93', '90', '2016-08-05 10:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3988', '12', '90', '53', '90', '92', '90', '2016-08-05 10:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3989', '17', '90', '53', '90', '92', '90', '2016-08-05 10:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3990', '6', '90', '53', '90', '93', '90', '2016-08-05 10:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3991', '8', '90', '54', '90', '94', '90', '2016-08-05 10:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3992', '9', '90', '54', '90', '96', '90', '2016-08-05 10:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3993', '2', '90', '54', '90', '94', '90', '2016-08-05 10:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3994', '3', '90', '54', '90', '94', '90', '2016-08-05 10:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3995', '9', '90', '54', '90', '94', '90', '2016-08-05 10:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3996', '16', '90', '55', '90', '94', '90', '2016-08-05 11:00:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3997', '5', '90', '55', '90', '96', '90', '2016-08-05 11:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3998', '70', '90', '55', '90', '95', '90', '2016-08-05 11:02:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('3999', '25', '90', '52', '90', '93', '90', '2016-08-05 11:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4000', '9', '90', '59', '90', '92', '90', '2016-08-05 11:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4001', '37', '90', '61', '90', '93', '90', '2016-08-05 11:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4002', '8', '90', '71', '90', '94', '90', '2016-08-05 11:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4003', '10', '90', '74', '90', '92', '90', '2016-08-05 11:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4004', '16', '90', '74', '90', '92', '90', '2016-08-05 11:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4005', '5', '90', '76', '90', '94', '90', '2016-08-05 11:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4006', '7', '90', '77', '90', '96', '90', '2016-08-05 11:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4007', '23', '90', '77', '90', '96', '90', '2016-08-05 11:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4008', '5', '90', '78', '90', '96', '90', '2016-08-05 11:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4009', '13', '90', '78', '90', '91', '90', '2016-08-05 11:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4010', '8', '90', '79', '90', '92', '90', '2016-08-05 11:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4011', '5', '90', '79', '90', '95', '90', '2016-08-05 11:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4012', '13', '90', '79', '90', '91', '90', '2016-08-05 11:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4013', '5', '90', '81', '90', '94', '90', '2016-08-05 11:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4014', '22', '90', '81', '90', '96', '90', '2016-08-05 11:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4015', '23', '90', '82', '90', '91', '90', '2016-08-05 11:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4016', '47', '90', '83', '90', '98', '90', '2016-08-05 11:50:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4017', '24', '90', '83', '90', '98', '90', '2016-08-05 11:51:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4018', '5', '90', '66', '90', '92', '90', '2016-08-05 11:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4019', '2', '90', '73', '90', '91', '90', '2016-08-05 11:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4020', '5', '90', '74', '90', '91', '90', '2016-08-05 11:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4021', '7', '90', '72', '90', '92', '90', '2016-08-05 11:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4022', '10', '90', '80', '90', '93', '90', '2016-08-05 11:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4023', '41', '90', '80', '90', '93', '90', '2016-08-05 11:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4024', '68', '90', '83', '90', '94', '90', '2016-08-05 12:36:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4025', '81', '90', '86', '90', '93', '90', '2016-08-05 12:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4026', '89', '90', '86', '90', '93', '90', '2016-08-05 12:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4027', '89', '90', '87', '90', '94', '90', '2016-08-05 12:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4028', '91', '90', '87', '90', '94', '90', '2016-08-05 12:40:00', '<font color=\"red\">CPU当前：91%,超出预设值  90%<br>内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4029', '2', '90', '89', '90', '91', '90', '2016-08-05 12:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4030', '42', '90', '64', '90', '93', '90', '2016-08-05 13:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4031', '55', '90', '64', '90', '95', '90', '2016-08-05 13:05:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4032', '56', '90', '64', '90', '95', '90', '2016-08-05 13:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4033', '56', '90', '65', '90', '95', '90', '2016-08-05 13:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4034', '63', '90', '65', '90', '97', '90', '2016-08-05 13:08:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4035', '1', '90', '65', '90', '92', '90', '2016-08-05 13:09:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4036', '14', '90', '66', '90', '91', '90', '2016-08-05 13:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4037', '2', '90', '66', '90', '91', '90', '2016-08-05 13:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4038', '2', '90', '66', '90', '91', '90', '2016-08-05 13:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4039', '1', '90', '67', '90', '91', '90', '2016-08-05 13:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4040', '2', '90', '67', '90', '91', '90', '2016-08-05 13:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4041', '2', '90', '67', '90', '91', '90', '2016-08-05 13:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4042', '2', '90', '67', '90', '91', '90', '2016-08-05 13:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4043', '18', '90', '68', '90', '92', '90', '2016-08-05 13:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4044', '46', '90', '68', '90', '96', '90', '2016-08-05 13:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4045', '0', '90', '68', '90', '91', '90', '2016-08-05 13:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4046', '1', '90', '69', '90', '93', '90', '2016-08-05 13:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4047', '7', '90', '69', '90', '94', '90', '2016-08-05 13:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4048', '4', '90', '69', '90', '94', '90', '2016-08-05 13:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4049', '7', '90', '69', '90', '94', '90', '2016-08-05 13:23:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4050', '2', '90', '70', '90', '94', '90', '2016-08-05 13:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4051', '2', '90', '70', '90', '94', '90', '2016-08-05 13:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4052', '2', '90', '70', '90', '94', '90', '2016-08-05 13:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4053', '20', '90', '70', '90', '94', '90', '2016-08-05 13:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4054', '2', '90', '71', '90', '93', '90', '2016-08-05 13:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4055', '2', '90', '71', '90', '94', '90', '2016-08-05 13:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4056', '6', '90', '71', '90', '94', '90', '2016-08-05 13:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4057', '2', '90', '72', '90', '93', '90', '2016-08-05 13:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4058', '1', '90', '72', '90', '93', '90', '2016-08-05 13:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4059', '3', '90', '72', '90', '93', '90', '2016-08-05 13:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4060', '6', '90', '73', '90', '94', '90', '2016-08-05 13:34:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4061', '15', '90', '73', '90', '94', '90', '2016-08-05 13:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4062', '16', '90', '73', '90', '94', '90', '2016-08-05 13:36:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4063', '5', '90', '79', '90', '92', '90', '2016-08-05 14:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4064', '18', '90', '79', '90', '91', '90', '2016-08-05 14:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4065', '20', '90', '80', '90', '91', '90', '2016-08-05 14:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4066', '5', '90', '80', '90', '91', '90', '2016-08-05 14:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4067', '4', '90', '80', '90', '91', '90', '2016-08-05 14:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4068', '7', '90', '81', '90', '91', '90', '2016-08-05 14:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4069', '27', '90', '81', '90', '91', '90', '2016-08-05 14:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4070', '6', '90', '82', '90', '91', '90', '2016-08-05 14:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4071', '6', '90', '82', '90', '91', '90', '2016-08-05 14:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4072', '7', '90', '83', '90', '91', '90', '2016-08-05 14:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4073', '11', '90', '83', '90', '91', '90', '2016-08-05 14:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4074', '5', '90', '83', '90', '91', '90', '2016-08-05 14:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4075', '11', '90', '84', '90', '91', '90', '2016-08-05 14:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4076', '4', '90', '84', '90', '91', '90', '2016-08-05 14:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4077', '2', '90', '84', '90', '91', '90', '2016-08-05 14:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4078', '3', '90', '84', '90', '91', '90', '2016-08-05 14:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4079', '5', '90', '85', '90', '91', '90', '2016-08-05 14:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4080', '10', '90', '85', '90', '91', '90', '2016-08-05 14:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4081', '8', '90', '86', '90', '92', '90', '2016-08-05 14:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4082', '3', '90', '86', '90', '92', '90', '2016-08-05 14:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4083', '3', '90', '86', '90', '92', '90', '2016-08-05 14:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4084', '9', '90', '86', '90', '91', '90', '2016-08-05 14:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4085', '20', '90', '87', '90', '92', '90', '2016-08-05 14:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4086', '15', '90', '87', '90', '92', '90', '2016-08-05 14:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4087', '8', '90', '87', '90', '93', '90', '2016-08-05 14:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4088', '10', '90', '87', '90', '93', '90', '2016-08-05 14:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4089', '13', '90', '88', '90', '93', '90', '2016-08-05 14:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4090', '18', '90', '88', '90', '95', '90', '2016-08-05 14:42:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4091', '14', '90', '88', '90', '95', '90', '2016-08-05 14:43:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4092', '13', '90', '89', '90', '95', '90', '2016-08-05 14:44:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4093', '17', '90', '89', '90', '94', '90', '2016-08-05 14:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4094', '6', '90', '89', '90', '94', '90', '2016-08-05 14:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4095', '18', '90', '62', '90', '94', '90', '2016-08-05 14:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4096', '35', '90', '62', '90', '93', '90', '2016-08-05 14:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4097', '21', '90', '65', '90', '91', '90', '2016-08-05 15:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4098', '17', '90', '66', '90', '91', '90', '2016-08-05 15:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4099', '20', '90', '67', '90', '91', '90', '2016-08-05 15:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4100', '18', '90', '67', '90', '91', '90', '2016-08-05 15:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4101', '13', '90', '68', '90', '91', '90', '2016-08-05 15:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4102', '15', '90', '68', '90', '91', '90', '2016-08-05 15:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4103', '18', '90', '68', '90', '91', '90', '2016-08-05 15:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4104', '13', '90', '69', '90', '91', '90', '2016-08-05 15:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4105', '17', '90', '69', '90', '91', '90', '2016-08-05 15:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4106', '18', '90', '69', '90', '91', '90', '2016-08-05 15:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4107', '11', '90', '69', '90', '91', '90', '2016-08-05 15:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4108', '14', '90', '70', '90', '91', '90', '2016-08-05 15:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4109', '15', '90', '70', '90', '91', '90', '2016-08-05 15:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4110', '9', '90', '70', '90', '91', '90', '2016-08-05 15:26:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4111', '5', '90', '71', '90', '92', '90', '2016-08-05 15:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4112', '12', '90', '72', '90', '91', '90', '2016-08-05 15:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4113', '11', '90', '74', '90', '93', '90', '2016-08-05 15:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4114', '12', '90', '77', '90', '93', '90', '2016-08-05 15:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4115', '17', '90', '77', '90', '95', '90', '2016-08-05 15:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4116', '14', '90', '77', '90', '94', '90', '2016-08-05 15:36:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4117', '12', '90', '77', '90', '95', '90', '2016-08-05 15:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4118', '14', '90', '78', '90', '96', '90', '2016-08-05 15:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4119', '14', '90', '78', '90', '95', '90', '2016-08-05 15:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4120', '17', '90', '78', '90', '95', '90', '2016-08-05 15:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4121', '13', '90', '79', '90', '95', '90', '2016-08-05 15:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4122', '45', '90', '79', '90', '96', '90', '2016-08-05 15:42:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4123', '14', '90', '79', '90', '95', '90', '2016-08-05 15:43:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4124', '12', '90', '80', '90', '96', '90', '2016-08-05 15:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4125', '7', '90', '80', '90', '96', '90', '2016-08-05 15:45:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4126', '2', '90', '80', '90', '96', '90', '2016-08-05 15:46:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4127', '13', '90', '80', '90', '96', '90', '2016-08-05 15:47:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4128', '6', '90', '81', '90', '96', '90', '2016-08-05 15:48:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4129', '11', '90', '81', '90', '96', '90', '2016-08-05 15:49:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4130', '9', '90', '81', '90', '96', '90', '2016-08-05 15:50:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4131', '24', '90', '81', '90', '95', '90', '2016-08-05 15:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4132', '5', '90', '85', '90', '92', '90', '2016-08-05 15:53:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4133', '13', '90', '70', '90', '91', '90', '2016-08-05 15:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4134', '11', '90', '70', '90', '91', '90', '2016-08-05 16:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4135', '4', '90', '70', '90', '92', '90', '2016-08-05 16:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4136', '4', '90', '71', '90', '92', '90', '2016-08-05 16:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4137', '27', '90', '71', '90', '92', '90', '2016-08-05 16:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4138', '11', '90', '71', '90', '93', '90', '2016-08-05 16:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4139', '9', '90', '72', '90', '93', '90', '2016-08-05 16:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4140', '8', '90', '72', '90', '92', '90', '2016-08-05 16:06:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4141', '13', '90', '72', '90', '94', '90', '2016-08-05 16:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4142', '10', '90', '73', '90', '93', '90', '2016-08-05 16:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4143', '39', '90', '73', '90', '93', '90', '2016-08-05 16:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4144', '13', '90', '73', '90', '94', '90', '2016-08-05 16:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4145', '16', '90', '74', '90', '91', '90', '2016-08-05 16:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4146', '10', '90', '74', '90', '94', '90', '2016-08-05 16:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4147', '11', '90', '74', '90', '95', '90', '2016-08-05 16:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4148', '17', '90', '75', '90', '96', '90', '2016-08-05 16:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4149', '20', '90', '59', '90', '91', '90', '2016-08-05 16:15:03', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4150', '13', '90', '70', '90', '91', '90', '2016-08-05 16:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4151', '15', '90', '70', '90', '91', '90', '2016-08-05 16:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4152', '16', '90', '70', '90', '91', '90', '2016-08-05 16:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4153', '5', '90', '71', '90', '92', '90', '2016-08-05 16:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4154', '9', '90', '71', '90', '92', '90', '2016-08-05 16:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4155', '4', '90', '84', '90', '92', '90', '2016-08-05 17:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4156', '1', '90', '86', '90', '91', '90', '2016-08-05 17:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4157', '5', '90', '65', '90', '94', '90', '2016-08-05 17:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4158', '4', '90', '70', '90', '94', '90', '2016-08-05 17:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4159', '10', '90', '71', '90', '94', '90', '2016-08-05 17:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4160', '2', '90', '74', '90', '93', '90', '2016-08-05 17:08:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4161', '2', '90', '75', '90', '93', '90', '2016-08-05 17:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4162', '5', '90', '75', '90', '93', '90', '2016-08-05 17:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4163', '5', '90', '75', '90', '93', '90', '2016-08-05 17:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4164', '12', '90', '76', '90', '94', '90', '2016-08-05 17:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4165', '15', '90', '76', '90', '94', '90', '2016-08-05 17:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4166', '2', '90', '77', '90', '93', '90', '2016-08-05 17:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4167', '2', '90', '77', '90', '93', '90', '2016-08-05 17:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4168', '2', '90', '77', '90', '93', '90', '2016-08-05 17:16:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4169', '5', '90', '77', '90', '93', '90', '2016-08-05 17:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4170', '2', '90', '78', '90', '93', '90', '2016-08-05 17:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4171', '2', '90', '78', '90', '93', '90', '2016-08-05 17:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4172', '6', '90', '78', '90', '93', '90', '2016-08-05 17:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4173', '4', '90', '79', '90', '93', '90', '2016-08-05 17:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4174', '2', '90', '79', '90', '93', '90', '2016-08-05 17:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4175', '2', '90', '79', '90', '93', '90', '2016-08-05 17:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4176', '2', '90', '80', '90', '93', '90', '2016-08-05 17:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4177', '2', '90', '80', '90', '93', '90', '2016-08-05 17:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4178', '3', '90', '80', '90', '93', '90', '2016-08-05 17:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4179', '6', '90', '80', '90', '93', '90', '2016-08-05 17:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4180', '4', '90', '81', '90', '93', '90', '2016-08-05 17:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4181', '5', '90', '81', '90', '94', '90', '2016-08-05 17:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4182', '16', '90', '81', '90', '96', '90', '2016-08-05 17:30:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4183', '16', '90', '82', '90', '95', '90', '2016-08-05 17:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4184', '17', '90', '82', '90', '95', '90', '2016-08-05 17:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4185', '18', '90', '82', '90', '96', '90', '2016-08-05 17:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4186', '30', '90', '82', '90', '96', '90', '2016-08-05 17:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4187', '10', '90', '83', '90', '95', '90', '2016-08-05 17:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4188', '17', '90', '83', '90', '96', '90', '2016-08-05 17:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4189', '12', '90', '83', '90', '95', '90', '2016-08-05 17:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4190', '24', '90', '84', '90', '96', '90', '2016-08-05 17:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4191', '16', '90', '84', '90', '96', '90', '2016-08-05 17:39:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4192', '21', '90', '84', '90', '95', '90', '2016-08-05 17:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4193', '21', '90', '85', '90', '95', '90', '2016-08-05 17:41:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4194', '21', '90', '85', '90', '95', '90', '2016-08-05 17:53:24', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4195', '7', '90', '73', '90', '94', '90', '2016-08-05 19:00:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4196', '86', '90', '76', '90', '93', '90', '2016-08-05 19:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4197', '24', '90', '76', '90', '93', '90', '2016-08-05 19:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4198', '11', '90', '76', '90', '91', '90', '2016-08-05 19:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4199', '26', '90', '51', '90', '94', '90', '2016-08-05 19:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4200', '10', '90', '52', '90', '99', '90', '2016-08-05 19:05:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4201', '16', '90', '53', '90', '96', '90', '2016-08-05 19:07:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4202', '22', '90', '61', '90', '91', '90', '2016-08-05 19:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4203', '21', '90', '73', '90', '91', '90', '2016-08-05 19:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4204', '76', '90', '74', '90', '96', '90', '2016-08-05 19:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4205', '65', '90', '74', '90', '96', '90', '2016-08-05 19:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4206', '75', '90', '74', '90', '97', '90', '2016-08-05 19:23:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4207', '52', '90', '75', '90', '98', '90', '2016-08-05 19:24:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4208', '75', '90', '75', '90', '96', '90', '2016-08-05 19:25:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4209', '70', '90', '75', '90', '97', '90', '2016-08-05 19:26:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4210', '74', '90', '75', '90', '98', '90', '2016-08-05 19:27:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4211', '69', '90', '76', '90', '96', '90', '2016-08-05 19:28:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4212', '70', '90', '76', '90', '97', '90', '2016-08-05 19:29:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4213', '58', '90', '77', '90', '97', '90', '2016-08-05 19:30:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4214', '72', '90', '77', '90', '98', '90', '2016-08-05 19:31:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4215', '52', '90', '77', '90', '99', '90', '2016-08-05 19:32:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4216', '73', '90', '77', '90', '95', '90', '2016-08-05 19:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4217', '57', '90', '78', '90', '96', '90', '2016-08-05 19:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4218', '32', '90', '78', '90', '96', '90', '2016-08-05 19:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4219', '60', '90', '78', '90', '98', '90', '2016-08-05 19:36:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4220', '65', '90', '79', '90', '99', '90', '2016-08-05 19:37:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4221', '74', '90', '79', '90', '91', '90', '2016-08-05 19:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4222', '46', '90', '79', '90', '92', '90', '2016-08-05 19:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4223', '77', '90', '79', '90', '93', '90', '2016-08-05 19:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4224', '76', '90', '80', '90', '94', '90', '2016-08-05 19:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4225', '31', '90', '80', '90', '95', '90', '2016-08-05 19:42:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4226', '66', '90', '81', '90', '91', '90', '2016-08-05 19:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4227', '70', '90', '82', '90', '92', '90', '2016-08-05 19:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4228', '71', '90', '82', '90', '93', '90', '2016-08-05 19:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4229', '18', '90', '82', '90', '94', '90', '2016-08-05 19:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4230', '10', '90', '83', '90', '94', '90', '2016-08-05 19:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4231', '11', '90', '83', '90', '94', '90', '2016-08-05 19:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4232', '33', '90', '84', '90', '92', '90', '2016-08-05 19:57:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4233', '45', '90', '84', '90', '93', '90', '2016-08-05 19:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4234', '77', '90', '84', '90', '94', '90', '2016-08-05 19:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4235', '71', '90', '85', '90', '95', '90', '2016-08-05 20:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4236', '36', '90', '85', '90', '96', '90', '2016-08-05 20:01:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4237', '31', '90', '85', '90', '96', '90', '2016-08-05 20:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4238', '9', '90', '85', '90', '96', '90', '2016-08-05 20:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4239', '36', '90', '86', '90', '91', '90', '2016-08-05 20:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4240', '68', '90', '86', '90', '92', '90', '2016-08-05 20:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4241', '29', '90', '86', '90', '93', '90', '2016-08-05 20:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4242', '61', '90', '87', '90', '95', '90', '2016-08-05 20:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4243', '31', '90', '87', '90', '95', '90', '2016-08-05 20:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4244', '34', '90', '87', '90', '95', '90', '2016-08-05 20:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4245', '35', '90', '61', '90', '95', '90', '2016-08-05 20:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4246', '32', '90', '62', '90', '95', '90', '2016-08-05 20:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4247', '65', '90', '62', '90', '97', '90', '2016-08-05 20:12:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4248', '67', '90', '62', '90', '97', '90', '2016-08-05 20:13:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4249', '2', '90', '62', '90', '95', '90', '2016-08-05 20:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4250', '26', '90', '63', '90', '98', '90', '2016-08-05 20:15:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4251', '28', '90', '63', '90', '91', '90', '2016-08-05 20:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4252', '30', '90', '64', '90', '93', '90', '2016-08-05 20:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4253', '12', '90', '65', '90', '91', '90', '2016-08-06 10:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4254', '17', '90', '63', '90', '91', '90', '2016-08-06 11:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4255', '1', '90', '69', '90', '91', '90', '2016-08-06 11:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4256', '28', '90', '71', '90', '92', '90', '2016-08-06 11:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4257', '5', '90', '72', '90', '91', '90', '2016-08-06 11:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4258', '15', '90', '72', '90', '96', '90', '2016-08-06 11:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4259', '2', '90', '61', '90', '93', '90', '2016-08-06 11:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4260', '1', '90', '63', '90', '92', '90', '2016-08-06 11:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4261', '2', '90', '63', '90', '92', '90', '2016-08-06 11:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4262', '27', '90', '64', '90', '92', '90', '2016-08-06 11:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4263', '7', '90', '64', '90', '92', '90', '2016-08-06 11:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4264', '12', '90', '64', '90', '92', '90', '2016-08-06 11:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4265', '17', '90', '64', '90', '91', '90', '2016-08-06 11:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4266', '23', '90', '65', '90', '92', '90', '2016-08-06 11:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4267', '23', '90', '65', '90', '91', '90', '2016-08-06 11:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4268', '9', '90', '65', '90', '92', '90', '2016-08-06 11:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4269', '4', '90', '65', '90', '91', '90', '2016-08-06 11:31:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4270', '12', '90', '66', '90', '95', '90', '2016-08-06 11:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4271', '6', '90', '66', '90', '96', '90', '2016-08-06 11:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4272', '21', '90', '66', '90', '97', '90', '2016-08-06 11:34:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4273', '18', '90', '66', '90', '96', '90', '2016-08-06 11:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4274', '24', '90', '67', '90', '96', '90', '2016-08-06 11:36:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4275', '6', '90', '67', '90', '95', '90', '2016-08-06 11:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4276', '7', '90', '67', '90', '96', '90', '2016-08-06 11:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4277', '6', '90', '67', '90', '96', '90', '2016-08-06 11:39:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4278', '6', '90', '68', '90', '96', '90', '2016-08-06 11:40:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4279', '7', '90', '68', '90', '96', '90', '2016-08-06 11:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4280', '31', '90', '68', '90', '97', '90', '2016-08-06 11:42:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4281', '8', '90', '78', '90', '91', '90', '2016-08-06 11:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4282', '2', '90', '81', '90', '92', '90', '2016-08-06 11:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4283', '24', '90', '81', '90', '91', '90', '2016-08-06 12:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4284', '9', '90', '81', '90', '92', '90', '2016-08-06 12:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4285', '2', '90', '81', '90', '92', '90', '2016-08-06 12:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4286', '0', '90', '82', '90', '93', '90', '2016-08-06 12:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4287', '2', '90', '82', '90', '94', '90', '2016-08-06 12:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4288', '13', '90', '85', '90', '99', '90', '2016-08-06 12:22:21', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4289', '14', '90', '62', '90', '93', '90', '2016-08-06 12:47:01', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4290', '23', '90', '63', '90', '91', '90', '2016-08-06 12:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4291', '22', '90', '63', '90', '92', '90', '2016-08-06 12:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4292', '27', '90', '63', '90', '94', '90', '2016-08-06 12:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4293', '50', '90', '64', '90', '98', '90', '2016-08-06 12:52:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4294', '21', '90', '64', '90', '97', '90', '2016-08-06 12:53:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4295', '21', '90', '64', '90', '98', '90', '2016-08-06 12:54:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4296', '26', '90', '65', '90', '98', '90', '2016-08-06 12:55:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4297', '51', '90', '74', '90', '91', '90', '2016-08-06 13:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4298', '34', '90', '74', '90', '93', '90', '2016-08-06 13:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4299', '67', '90', '75', '90', '93', '90', '2016-08-06 13:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4300', '77', '90', '75', '90', '94', '90', '2016-08-06 13:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4301', '70', '90', '75', '90', '96', '90', '2016-08-06 13:53:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4302', '36', '90', '76', '90', '96', '90', '2016-08-06 13:54:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4303', '56', '90', '76', '90', '97', '90', '2016-08-06 13:55:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4304', '83', '90', '76', '90', '96', '90', '2016-08-06 13:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4305', '45', '90', '76', '90', '98', '90', '2016-08-06 13:57:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4306', '62', '90', '77', '90', '98', '90', '2016-08-06 13:58:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4307', '38', '90', '77', '90', '99', '90', '2016-08-06 13:59:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4308', '84', '90', '77', '90', '98', '90', '2016-08-06 14:00:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4309', '71', '90', '78', '90', '99', '90', '2016-08-06 14:01:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4310', '66', '90', '78', '90', '96', '90', '2016-08-06 14:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4311', '40', '90', '78', '90', '96', '90', '2016-08-06 14:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4312', '58', '90', '78', '90', '97', '90', '2016-08-06 14:04:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4313', '71', '90', '79', '90', '97', '90', '2016-08-06 14:05:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4314', '77', '90', '79', '90', '98', '90', '2016-08-06 14:06:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4315', '75', '90', '79', '90', '99', '90', '2016-08-06 14:07:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4316', '75', '90', '79', '90', '95', '90', '2016-08-06 14:08:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4317', '69', '90', '80', '90', '93', '90', '2016-08-06 14:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4318', '48', '90', '80', '90', '94', '90', '2016-08-06 14:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4319', '79', '90', '80', '90', '94', '90', '2016-08-06 14:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4320', '76', '90', '81', '90', '95', '90', '2016-08-06 14:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4321', '54', '90', '81', '90', '96', '90', '2016-08-06 14:13:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4322', '72', '90', '81', '90', '97', '90', '2016-08-06 14:14:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4323', '51', '90', '81', '90', '98', '90', '2016-08-06 14:15:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4324', '65', '90', '82', '90', '98', '90', '2016-08-06 14:16:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4325', '48', '90', '82', '90', '99', '90', '2016-08-06 14:17:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4326', '61', '90', '82', '90', '95', '90', '2016-08-06 14:18:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4327', '69', '90', '83', '90', '94', '90', '2016-08-06 14:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4328', '31', '90', '83', '90', '93', '90', '2016-08-06 14:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4329', '9', '90', '81', '90', '96', '90', '2016-08-07 14:50:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4330', '20', '90', '72', '90', '93', '90', '2016-08-14 18:13:06', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4331', '8', '90', '58', '90', '93', '90', '2016-08-14 18:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4332', '7', '90', '56', '90', '96', '90', '2016-08-16 14:14:01', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4333', '8', '90', '64', '90', '94', '90', '2016-08-17 10:33:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4334', '6', '90', '72', '90', '95', '90', '2016-08-17 10:34:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4335', '7', '90', '72', '90', '94', '90', '2016-08-17 10:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4336', '6', '90', '72', '90', '93', '90', '2016-08-17 10:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4337', '5', '90', '72', '90', '94', '90', '2016-08-17 10:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4338', '10', '90', '73', '90', '93', '90', '2016-08-17 10:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4339', '28', '90', '73', '90', '93', '90', '2016-08-17 10:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4340', '24', '90', '73', '90', '93', '90', '2016-08-17 10:40:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4341', '3', '90', '73', '90', '92', '90', '2016-08-17 10:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4342', '8', '90', '74', '90', '92', '90', '2016-08-17 10:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4343', '12', '90', '74', '90', '92', '90', '2016-08-17 10:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4344', '2', '90', '74', '90', '92', '90', '2016-08-17 10:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4345', '21', '90', '75', '90', '92', '90', '2016-08-17 10:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4346', '3', '90', '76', '90', '93', '90', '2016-08-17 10:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4347', '5', '90', '77', '90', '93', '90', '2016-08-17 10:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4348', '9', '90', '51', '90', '92', '90', '2016-08-17 10:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4349', '17', '90', '51', '90', '92', '90', '2016-08-17 10:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4350', '4', '90', '51', '90', '92', '90', '2016-08-17 10:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4351', '6', '90', '51', '90', '92', '90', '2016-08-17 10:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4352', '36', '90', '51', '90', '93', '90', '2016-08-17 10:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4353', '4', '90', '52', '90', '93', '90', '2016-08-17 10:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4354', '2', '90', '52', '90', '93', '90', '2016-08-17 10:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4355', '6', '90', '52', '90', '95', '90', '2016-08-17 10:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4356', '35', '90', '52', '90', '98', '90', '2016-08-17 10:56:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4357', '9', '90', '53', '90', '95', '90', '2016-08-17 10:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4358', '16', '90', '53', '90', '96', '90', '2016-08-17 10:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4359', '21', '90', '53', '90', '94', '90', '2016-08-17 10:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4360', '5', '90', '53', '90', '94', '90', '2016-08-17 11:00:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4361', '4', '90', '53', '90', '94', '90', '2016-08-17 11:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4362', '2', '90', '54', '90', '93', '90', '2016-08-17 11:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4363', '2', '90', '54', '90', '93', '90', '2016-08-17 11:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4364', '2', '90', '54', '90', '93', '90', '2016-08-17 11:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4365', '17', '90', '68', '90', '97', '90', '2016-08-17 12:11:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4366', '12', '90', '68', '90', '96', '90', '2016-08-17 12:12:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4367', '5', '90', '69', '90', '97', '90', '2016-08-17 12:13:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4368', '2', '90', '69', '90', '96', '90', '2016-08-17 12:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4369', '1', '90', '69', '90', '96', '90', '2016-08-17 12:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4370', '4', '90', '69', '90', '96', '90', '2016-08-17 12:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4371', '1', '90', '70', '90', '96', '90', '2016-08-17 12:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4372', '4', '90', '70', '90', '96', '90', '2016-08-17 12:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4373', '2', '90', '70', '90', '96', '90', '2016-08-17 12:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4374', '1', '90', '70', '90', '92', '90', '2016-08-17 12:20:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4375', '16', '90', '71', '90', '97', '90', '2016-08-17 12:21:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4376', '24', '90', '71', '90', '97', '90', '2016-08-17 12:22:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4377', '17', '90', '72', '90', '93', '90', '2016-08-17 12:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4378', '21', '90', '73', '90', '91', '90', '2016-08-17 12:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4379', '21', '90', '73', '90', '91', '90', '2016-08-17 12:35:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4380', '25', '90', '51', '90', '91', '90', '2016-08-17 13:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4381', '38', '90', '51', '90', '92', '90', '2016-08-17 13:13:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4382', '27', '90', '51', '90', '92', '90', '2016-08-17 13:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4383', '34', '90', '51', '90', '93', '90', '2016-08-17 13:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4384', '15', '90', '52', '90', '94', '90', '2016-08-17 13:16:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4385', '45', '90', '52', '90', '92', '90', '2016-08-17 13:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4386', '26', '90', '52', '90', '93', '90', '2016-08-17 13:18:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4387', '33', '90', '52', '90', '95', '90', '2016-08-17 13:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4388', '34', '90', '53', '90', '96', '90', '2016-08-17 13:20:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4389', '34', '90', '53', '90', '96', '90', '2016-08-17 13:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4390', '26', '90', '53', '90', '92', '90', '2016-08-17 13:22:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4391', '18', '90', '53', '90', '92', '90', '2016-08-17 13:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4392', '43', '90', '53', '90', '92', '90', '2016-08-17 13:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4393', '26', '90', '54', '90', '93', '90', '2016-08-17 13:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4394', '5', '90', '54', '90', '91', '90', '2016-08-17 13:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4395', '20', '90', '56', '90', '93', '90', '2016-08-17 13:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4396', '10', '90', '56', '90', '92', '90', '2016-08-17 13:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4397', '12', '90', '56', '90', '91', '90', '2016-08-17 13:37:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4398', '41', '90', '56', '90', '91', '90', '2016-08-17 13:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4399', '11', '90', '51', '90', '94', '90', '2016-08-17 16:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4400', '27', '90', '56', '90', '91', '90', '2016-08-17 16:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4401', '14', '90', '57', '90', '91', '90', '2016-08-17 16:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4402', '22', '90', '57', '90', '91', '90', '2016-08-17 16:49:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4403', '24', '90', '57', '90', '91', '90', '2016-08-17 16:50:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4404', '18', '90', '57', '90', '91', '90', '2016-08-17 16:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4405', '21', '90', '58', '90', '91', '90', '2016-08-17 16:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4406', '16', '90', '58', '90', '91', '90', '2016-08-17 16:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4407', '26', '90', '58', '90', '91', '90', '2016-08-17 16:54:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4408', '28', '90', '58', '90', '91', '90', '2016-08-17 16:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4409', '21', '90', '58', '90', '91', '90', '2016-08-17 16:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4410', '38', '90', '59', '90', '93', '90', '2016-08-17 16:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4411', '35', '90', '59', '90', '97', '90', '2016-08-17 16:59:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4412', '34', '90', '59', '90', '97', '90', '2016-08-17 17:00:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4413', '30', '90', '59', '90', '97', '90', '2016-08-17 17:01:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4414', '21', '90', '60', '90', '97', '90', '2016-08-17 17:02:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4415', '24', '90', '60', '90', '96', '90', '2016-08-17 17:03:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4416', '30', '90', '60', '90', '97', '90', '2016-08-17 17:04:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4417', '16', '90', '60', '90', '93', '90', '2016-08-17 17:05:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4418', '6', '90', '59', '90', '92', '90', '2016-08-24 17:47:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4419', '7', '90', '64', '90', '92', '90', '2016-08-24 17:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4420', '10', '90', '64', '90', '92', '90', '2016-08-24 17:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4421', '13', '90', '64', '90', '92', '90', '2016-08-24 17:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4422', '5', '90', '85', '90', '91', '90', '2016-08-24 17:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4423', '23', '90', '66', '90', '91', '90', '2016-08-24 18:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4424', '2', '90', '82', '90', '91', '90', '2016-08-24 18:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4425', '2', '90', '82', '90', '91', '90', '2016-08-24 18:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4426', '5', '90', '82', '90', '91', '90', '2016-08-24 18:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4427', '3', '90', '83', '90', '91', '90', '2016-08-24 18:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4428', '3', '90', '83', '90', '91', '90', '2016-08-24 18:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4429', '2', '90', '84', '90', '91', '90', '2016-08-24 18:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4430', '1', '90', '84', '90', '91', '90', '2016-08-24 18:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4431', '8', '90', '84', '90', '91', '90', '2016-08-24 18:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4432', '2', '90', '86', '90', '91', '90', '2016-08-24 18:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4433', '43', '90', '87', '90', '97', '90', '2016-08-24 18:23:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4434', '17', '90', '87', '90', '94', '90', '2016-08-24 18:24:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4435', '12', '90', '87', '90', '94', '90', '2016-08-24 18:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4436', '11', '90', '88', '90', '94', '90', '2016-08-24 18:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4437', '11', '90', '88', '90', '94', '90', '2016-08-24 18:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4438', '12', '90', '88', '90', '94', '90', '2016-08-24 18:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4439', '20', '90', '89', '90', '94', '90', '2016-08-24 18:29:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4440', '26', '90', '61', '90', '94', '90', '2016-08-24 18:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4441', '12', '90', '62', '90', '94', '90', '2016-08-24 18:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4442', '17', '90', '62', '90', '94', '90', '2016-08-24 18:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4443', '10', '90', '62', '90', '92', '90', '2016-08-24 18:33:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4444', '16', '90', '62', '90', '92', '90', '2016-08-24 18:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4445', '22', '90', '63', '90', '92', '90', '2016-08-24 18:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4446', '16', '90', '63', '90', '92', '90', '2016-08-24 18:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4447', '13', '90', '63', '90', '92', '90', '2016-08-24 18:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4448', '15', '90', '63', '90', '92', '90', '2016-08-24 18:38:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4449', '21', '90', '64', '90', '92', '90', '2016-08-24 18:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4450', '22', '90', '64', '90', '92', '90', '2016-08-24 18:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4451', '13', '90', '64', '90', '92', '90', '2016-08-24 18:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4452', '23', '90', '64', '90', '92', '90', '2016-08-24 18:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4453', '21', '90', '65', '90', '94', '90', '2016-08-24 18:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4454', '12', '90', '65', '90', '95', '90', '2016-08-24 18:44:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4455', '12', '90', '65', '90', '95', '90', '2016-08-24 18:45:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4456', '11', '90', '65', '90', '95', '90', '2016-08-24 18:46:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4457', '14', '90', '66', '90', '95', '90', '2016-08-24 18:47:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4458', '10', '90', '66', '90', '95', '90', '2016-08-24 18:48:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4459', '12', '90', '66', '90', '95', '90', '2016-08-24 18:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4460', '5', '90', '66', '90', '95', '90', '2016-08-24 18:50:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4461', '12', '90', '67', '90', '95', '90', '2016-08-24 18:51:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4462', '11', '90', '67', '90', '95', '90', '2016-08-24 18:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4463', '7', '90', '67', '90', '95', '90', '2016-08-24 18:53:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4464', '23', '90', '68', '90', '95', '90', '2016-08-24 18:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4465', '13', '90', '68', '90', '95', '90', '2016-08-24 18:55:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4466', '41', '90', '69', '90', '91', '90', '2016-08-24 20:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4467', '4', '90', '63', '90', '92', '90', '2016-08-24 20:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4468', '4', '90', '77', '90', '91', '90', '2016-08-25 10:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4469', '6', '90', '80', '90', '91', '90', '2016-08-25 10:52:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4470', '14', '90', '61', '90', '92', '90', '2016-08-25 10:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4471', '2', '90', '65', '90', '91', '90', '2016-08-25 10:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4472', '2', '90', '65', '90', '91', '90', '2016-08-25 10:56:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4473', '2', '90', '66', '90', '91', '90', '2016-08-25 10:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4474', '25', '90', '68', '90', '91', '90', '2016-08-25 10:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4475', '2', '90', '87', '90', '91', '90', '2016-08-25 11:10:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4476', '9', '90', '62', '90', '93', '90', '2016-08-25 11:13:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4477', '5', '90', '63', '90', '93', '90', '2016-08-25 11:14:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4478', '49', '90', '63', '90', '97', '90', '2016-08-25 11:15:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4479', '25', '90', '63', '90', '95', '90', '2016-08-25 11:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4480', '4', '90', '64', '90', '96', '90', '2016-08-25 11:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4481', '2', '90', '64', '90', '94', '90', '2016-08-25 11:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4482', '12', '90', '66', '90', '93', '90', '2016-08-25 11:19:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4483', '30', '90', '74', '90', '91', '90', '2016-08-25 11:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4484', '5', '90', '74', '90', '93', '90', '2016-08-25 11:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4485', '2', '90', '82', '90', '94', '90', '2016-08-25 11:25:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4486', '4', '90', '82', '90', '92', '90', '2016-08-25 11:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4487', '11', '90', '83', '90', '94', '90', '2016-08-25 11:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4488', '14', '90', '83', '90', '95', '90', '2016-08-25 11:28:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4489', '2', '90', '85', '90', '95', '90', '2016-08-25 11:29:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4490', '3', '90', '75', '90', '91', '90', '2016-08-25 11:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4491', '24', '90', '66', '90', '94', '90', '2016-08-25 12:42:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4492', '20', '90', '70', '90', '92', '90', '2016-08-25 12:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4493', '48', '90', '70', '90', '93', '90', '2016-08-25 12:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4494', '32', '90', '70', '90', '97', '90', '2016-08-25 12:45:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4495', '26', '90', '70', '90', '97', '90', '2016-08-25 12:46:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4496', '21', '90', '71', '90', '98', '90', '2016-08-25 12:47:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4497', '20', '90', '71', '90', '96', '90', '2016-08-25 12:48:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4498', '23', '90', '71', '90', '98', '90', '2016-08-25 12:49:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4499', '15', '90', '76', '90', '93', '90', '2016-08-26 10:38:05', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4500', '5', '90', '67', '90', '93', '90', '2016-08-26 10:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4501', '12', '90', '68', '90', '92', '90', '2016-08-26 10:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4502', '6', '90', '68', '90', '93', '90', '2016-08-26 10:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4503', '52', '90', '63', '90', '92', '90', '2016-08-26 13:43:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4504', '4', '90', '66', '90', '91', '90', '2016-08-26 13:44:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4505', '10', '90', '66', '90', '91', '90', '2016-08-26 13:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4506', '12', '90', '77', '90', '94', '90', '2016-08-26 13:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4507', '15', '90', '83', '90', '94', '90', '2016-08-26 13:48:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4508', '8', '90', '64', '90', '94', '90', '2016-08-26 13:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4509', '2', '90', '73', '90', '93', '90', '2016-08-26 13:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4510', '2', '90', '91', '90', '90', '90', '2016-08-26 14:04:00', '<font color=\"red\">JVM当前：91%,超出预设值 90%<br></font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4511', '3', '90', '97', '90', '89', '90', '2016-08-26 14:05:00', '<font color=\"red\">JVM当前：97%,超出预设值 90%<br></font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4512', '8', '90', '98', '90', '90', '90', '2016-08-26 14:06:00', '<font color=\"red\">JVM当前：98%,超出预设值 90%<br></font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4513', '5', '90', '64', '90', '93', '90', '2016-08-26 14:10:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4514', '31', '90', '73', '90', '92', '90', '2016-08-26 14:11:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4515', '8', '90', '71', '90', '94', '90', '2016-08-26 14:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4516', '11', '90', '77', '90', '95', '90', '2016-08-26 14:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4517', '4', '90', '77', '90', '95', '90', '2016-08-26 14:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4518', '5', '90', '77', '90', '95', '90', '2016-08-26 14:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4519', '17', '90', '77', '90', '92', '90', '2016-08-26 14:16:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4520', '3', '90', '78', '90', '91', '90', '2016-08-26 14:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4521', '17', '90', '78', '90', '91', '90', '2016-08-26 14:18:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4522', '6', '90', '78', '90', '92', '90', '2016-08-26 14:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4523', '2', '90', '82', '90', '94', '90', '2016-08-26 14:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4524', '13', '90', '88', '90', '92', '90', '2016-08-29 16:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4525', '3', '90', '69', '90', '95', '90', '2016-08-29 16:30:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4526', '10', '90', '77', '90', '94', '90', '2016-08-29 16:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4527', '9', '90', '78', '90', '94', '90', '2016-08-29 16:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4528', '10', '90', '78', '90', '95', '90', '2016-08-29 16:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4529', '4', '90', '78', '90', '95', '90', '2016-08-29 16:34:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4530', '5', '90', '79', '90', '95', '90', '2016-08-29 16:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4531', '5', '90', '79', '90', '95', '90', '2016-08-29 16:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4532', '16', '90', '79', '90', '96', '90', '2016-08-29 16:37:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4533', '6', '90', '80', '90', '96', '90', '2016-08-29 16:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4534', '11', '90', '80', '90', '97', '90', '2016-08-29 16:39:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4535', '9', '90', '80', '90', '96', '90', '2016-08-29 16:40:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4536', '2', '90', '80', '90', '94', '90', '2016-08-29 16:41:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4537', '13', '90', '81', '90', '93', '90', '2016-08-29 16:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4538', '9', '90', '81', '90', '94', '90', '2016-08-29 16:43:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4539', '7', '90', '81', '90', '94', '90', '2016-08-29 16:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4540', '3', '90', '82', '90', '94', '90', '2016-08-29 16:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4541', '13', '90', '82', '90', '95', '90', '2016-08-29 16:46:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4542', '15', '90', '82', '90', '93', '90', '2016-08-29 16:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4543', '11', '90', '83', '90', '93', '90', '2016-08-29 16:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4544', '12', '90', '83', '90', '94', '90', '2016-08-29 16:49:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4545', '6', '90', '84', '90', '93', '90', '2016-08-29 16:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4546', '11', '90', '84', '90', '92', '90', '2016-08-29 16:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4547', '19', '90', '84', '90', '93', '90', '2016-08-29 16:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4548', '31', '90', '60', '90', '97', '90', '2016-08-30 10:22:01', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4549', '45', '90', '60', '90', '97', '90', '2016-08-30 10:23:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4550', '16', '90', '60', '90', '95', '90', '2016-08-30 10:24:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4551', '11', '90', '62', '90', '92', '90', '2016-08-30 10:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4552', '9', '90', '65', '90', '91', '90', '2016-08-30 10:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4553', '23', '90', '65', '90', '92', '90', '2016-08-30 10:30:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4554', '17', '90', '57', '90', '92', '90', '2016-08-30 10:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4555', '6', '90', '71', '90', '91', '90', '2016-08-30 11:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4556', '7', '90', '65', '90', '91', '90', '2016-08-30 11:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4557', '6', '90', '70', '90', '92', '90', '2016-08-30 11:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4558', '3', '90', '54', '90', '91', '90', '2016-08-30 11:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4559', '18', '90', '73', '90', '91', '90', '2016-08-30 11:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4560', '13', '90', '62', '90', '92', '90', '2016-08-30 11:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4561', '6', '90', '68', '90', '91', '90', '2016-08-30 11:28:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4562', '21', '90', '71', '90', '94', '90', '2016-08-30 15:42:04', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4563', '30', '90', '81', '90', '97', '90', '2016-08-30 15:43:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4564', '20', '90', '81', '90', '96', '90', '2016-08-30 15:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4565', '13', '90', '82', '90', '96', '90', '2016-08-30 15:45:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4566', '13', '90', '82', '90', '96', '90', '2016-08-30 15:46:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4567', '56', '90', '82', '90', '99', '90', '2016-08-30 15:47:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4568', '16', '90', '62', '90', '91', '90', '2016-08-30 15:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4569', '25', '90', '66', '90', '93', '90', '2016-08-30 15:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4570', '92', '90', '67', '90', '92', '90', '2016-08-30 15:53:00', '<font color=\"red\">CPU当前：92%,超出预设值  90%<br>内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4571', '13', '90', '67', '90', '95', '90', '2016-08-30 15:54:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4572', '82', '90', '67', '90', '94', '90', '2016-08-30 15:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4573', '15', '90', '51', '90', '95', '90', '2016-08-30 15:56:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4574', '18', '90', '54', '90', '93', '90', '2016-08-30 15:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4575', '9', '90', '54', '90', '93', '90', '2016-08-30 15:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4576', '17', '90', '54', '90', '92', '90', '2016-08-30 15:59:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4577', '12', '90', '54', '90', '93', '90', '2016-08-30 16:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4578', '35', '90', '55', '90', '93', '90', '2016-08-30 16:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4579', '33', '90', '59', '90', '94', '90', '2016-08-30 16:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4580', '22', '90', '57', '90', '91', '90', '2016-08-30 16:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4581', '19', '90', '60', '90', '97', '90', '2016-08-31 10:42:02', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4582', '6', '90', '67', '90', '95', '90', '2016-08-31 10:43:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4583', '12', '90', '71', '90', '93', '90', '2016-08-31 14:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4584', '17', '90', '69', '90', '96', '90', '2016-08-31 14:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4585', '21', '90', '86', '90', '94', '90', '2016-08-31 14:44:02', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4586', '6', '90', '73', '90', '97', '90', '2016-08-31 14:45:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4587', '14', '90', '73', '90', '96', '90', '2016-08-31 14:46:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4588', '95', '90', '74', '90', '95', '90', '2016-08-31 14:47:00', '<font color=\"red\">CPU当前：95%,超出预设值  90%<br>内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4589', '5', '90', '71', '90', '92', '90', '2016-08-31 14:49:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4590', '40', '90', '53', '90', '91', '90', '2016-08-31 14:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4591', '5', '90', '74', '90', '91', '90', '2016-08-31 14:59:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4592', '9', '90', '77', '90', '92', '90', '2016-08-31 15:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4593', '8', '90', '79', '90', '92', '90', '2016-08-31 15:08:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4594', '33', '90', '68', '90', '94', '90', '2016-08-31 15:10:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4595', '7', '90', '74', '90', '93', '90', '2016-08-31 15:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4596', '5', '90', '74', '90', '94', '90', '2016-08-31 15:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4597', '5', '90', '75', '90', '94', '90', '2016-08-31 15:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4598', '4', '90', '75', '90', '94', '90', '2016-08-31 15:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4599', '2', '90', '75', '90', '94', '90', '2016-08-31 15:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4600', '15', '90', '76', '90', '95', '90', '2016-08-31 15:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4601', '15', '90', '77', '90', '92', '90', '2016-08-31 15:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4602', '9', '90', '80', '90', '91', '90', '2016-08-31 15:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4603', '8', '90', '83', '90', '91', '90', '2016-08-31 15:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4604', '9', '90', '63', '90', '92', '90', '2016-08-31 15:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4605', '18', '90', '72', '90', '91', '90', '2016-08-31 15:51:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4606', '23', '90', '77', '90', '92', '90', '2016-08-31 16:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4607', '12', '90', '82', '90', '92', '90', '2016-08-31 16:21:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4608', '9', '90', '83', '90', '93', '90', '2016-08-31 16:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4609', '12', '90', '83', '90', '91', '90', '2016-08-31 16:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4610', '13', '90', '74', '90', '92', '90', '2016-08-31 16:25:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4611', '6', '90', '56', '90', '93', '90', '2016-08-31 16:26:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4612', '4', '90', '57', '90', '92', '90', '2016-08-31 16:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4613', '11', '90', '57', '90', '93', '90', '2016-08-31 16:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4614', '33', '90', '60', '90', '92', '90', '2016-08-31 16:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4615', '20', '90', '60', '90', '93', '90', '2016-08-31 16:30:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4616', '33', '90', '60', '90', '96', '90', '2016-08-31 16:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4617', '31', '90', '60', '90', '95', '90', '2016-08-31 16:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4618', '30', '90', '61', '90', '95', '90', '2016-08-31 16:34:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4619', '15', '90', '61', '90', '92', '90', '2016-08-31 16:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4620', '9', '90', '61', '90', '91', '90', '2016-08-31 16:36:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4621', '5', '90', '61', '90', '92', '90', '2016-08-31 16:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4622', '5', '90', '62', '90', '91', '90', '2016-08-31 16:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4623', '12', '90', '62', '90', '92', '90', '2016-08-31 16:39:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4624', '8', '90', '62', '90', '92', '90', '2016-08-31 16:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4625', '5', '90', '62', '90', '92', '90', '2016-08-31 16:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4626', '6', '90', '63', '90', '92', '90', '2016-08-31 16:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4627', '8', '90', '63', '90', '93', '90', '2016-08-31 16:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4628', '9', '90', '63', '90', '93', '90', '2016-08-31 16:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4629', '2', '90', '63', '90', '93', '90', '2016-08-31 16:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4630', '9', '90', '64', '90', '93', '90', '2016-08-31 16:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4631', '7', '90', '64', '90', '93', '90', '2016-08-31 16:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4632', '7', '90', '64', '90', '93', '90', '2016-08-31 16:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4633', '16', '90', '65', '90', '93', '90', '2016-08-31 16:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4634', '23', '90', '65', '90', '92', '90', '2016-08-31 16:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4635', '5', '90', '65', '90', '92', '90', '2016-08-31 16:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4636', '4', '90', '66', '90', '93', '90', '2016-08-31 16:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4637', '2', '90', '66', '90', '92', '90', '2016-08-31 16:53:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4638', '5', '90', '66', '90', '92', '90', '2016-08-31 16:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4639', '16', '90', '67', '90', '94', '90', '2016-08-31 16:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4640', '4', '90', '67', '90', '96', '90', '2016-08-31 16:56:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4641', '8', '90', '67', '90', '93', '90', '2016-08-31 16:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4642', '11', '90', '67', '90', '94', '90', '2016-08-31 16:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4643', '17', '90', '67', '90', '94', '90', '2016-08-31 16:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4644', '3', '90', '67', '90', '95', '90', '2016-08-31 17:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4645', '31', '90', '68', '90', '94', '90', '2016-08-31 17:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4646', '2', '90', '68', '90', '94', '90', '2016-08-31 17:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4647', '2', '90', '68', '90', '94', '90', '2016-08-31 17:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4648', '7', '90', '68', '90', '94', '90', '2016-08-31 17:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4649', '6', '90', '69', '90', '94', '90', '2016-08-31 17:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4650', '11', '90', '73', '90', '92', '90', '2016-08-31 17:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4651', '9', '90', '73', '90', '92', '90', '2016-08-31 17:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4652', '2', '90', '73', '90', '92', '90', '2016-08-31 17:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4653', '1', '90', '74', '90', '92', '90', '2016-08-31 17:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4654', '12', '90', '74', '90', '94', '90', '2016-08-31 17:45:04', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4655', '12', '90', '74', '90', '94', '90', '2016-08-31 17:46:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4656', '2', '90', '74', '90', '94', '90', '2016-08-31 17:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4657', '5', '90', '74', '90', '93', '90', '2016-08-31 17:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4658', '8', '90', '75', '90', '95', '90', '2016-08-31 17:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4659', '14', '90', '49', '90', '98', '90', '2016-08-31 19:05:02', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4660', '8', '90', '64', '90', '95', '90', '2016-08-31 19:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4661', '24', '90', '83', '90', '95', '90', '2016-08-31 19:07:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4662', '23', '90', '64', '90', '95', '90', '2016-08-31 19:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4663', '14', '90', '68', '90', '96', '90', '2016-08-31 19:09:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4664', '14', '90', '68', '90', '96', '90', '2016-08-31 19:10:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4665', '16', '90', '69', '90', '95', '90', '2016-08-31 19:11:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4666', '20', '90', '69', '90', '95', '90', '2016-08-31 19:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4667', '10', '90', '77', '90', '92', '90', '2016-08-31 19:14:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4668', '13', '90', '70', '90', '94', '90', '2016-08-31 19:15:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4669', '5', '90', '71', '90', '95', '90', '2016-08-31 19:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4670', '14', '90', '71', '90', '96', '90', '2016-08-31 19:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4671', '10', '90', '71', '90', '94', '90', '2016-08-31 19:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4672', '13', '90', '59', '90', '91', '90', '2016-08-31 19:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4673', '9', '90', '61', '90', '91', '90', '2016-08-31 19:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4674', '24', '90', '61', '90', '91', '90', '2016-08-31 19:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4675', '2', '90', '62', '90', '91', '90', '2016-08-31 19:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4676', '2', '90', '62', '90', '91', '90', '2016-08-31 19:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4677', '6', '90', '62', '90', '92', '90', '2016-08-31 19:48:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4678', '14', '90', '63', '90', '92', '90', '2016-08-31 19:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4679', '4', '90', '63', '90', '93', '90', '2016-08-31 19:50:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4680', '7', '90', '63', '90', '93', '90', '2016-08-31 19:51:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4681', '5', '90', '63', '90', '93', '90', '2016-08-31 19:52:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4682', '7', '90', '64', '90', '94', '90', '2016-08-31 19:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4683', '5', '90', '64', '90', '94', '90', '2016-08-31 19:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4684', '24', '90', '64', '90', '94', '90', '2016-08-31 19:55:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4685', '13', '90', '64', '90', '94', '90', '2016-08-31 19:56:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4686', '4', '90', '65', '90', '94', '90', '2016-08-31 19:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4687', '47', '90', '65', '90', '94', '90', '2016-08-31 19:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4688', '8', '90', '65', '90', '94', '90', '2016-08-31 19:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4689', '15', '90', '65', '90', '95', '90', '2016-08-31 20:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4690', '6', '90', '66', '90', '91', '90', '2016-08-31 20:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4691', '28', '90', '66', '90', '92', '90', '2016-08-31 20:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4692', '23', '90', '66', '90', '92', '90', '2016-08-31 20:03:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4693', '20', '90', '66', '90', '92', '90', '2016-08-31 20:04:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4694', '42', '90', '67', '90', '91', '90', '2016-08-31 20:05:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4695', '12', '90', '67', '90', '94', '90', '2016-08-31 20:07:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4696', '2', '90', '76', '90', '94', '90', '2016-08-31 20:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4697', '6', '90', '77', '90', '93', '90', '2016-08-31 20:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4698', '2', '90', '77', '90', '92', '90', '2016-08-31 20:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4699', '42', '90', '77', '90', '93', '90', '2016-08-31 20:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4700', '7', '90', '78', '90', '93', '90', '2016-08-31 20:12:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4701', '6', '90', '78', '90', '94', '90', '2016-08-31 20:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4702', '19', '90', '78', '90', '95', '90', '2016-08-31 20:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4703', '6', '90', '79', '90', '96', '90', '2016-08-31 20:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4704', '5', '90', '79', '90', '97', '90', '2016-08-31 20:16:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4705', '4', '90', '79', '90', '97', '90', '2016-08-31 20:17:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4706', '2', '90', '80', '90', '96', '90', '2016-08-31 20:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4707', '2', '90', '80', '90', '94', '90', '2016-08-31 20:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4708', '11', '90', '81', '90', '91', '90', '2016-08-31 20:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4709', '2', '90', '81', '90', '91', '90', '2016-08-31 20:23:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4710', '2', '90', '81', '90', '93', '90', '2016-08-31 20:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4711', '8', '90', '60', '90', '98', '90', '2016-09-06 16:35:04', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4712', '14', '90', '71', '90', '98', '90', '2016-09-06 16:36:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4713', '14', '90', '71', '90', '98', '90', '2016-09-06 16:37:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4714', '6', '90', '71', '90', '95', '90', '2016-09-06 16:38:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4715', '7', '90', '72', '90', '96', '90', '2016-09-06 16:39:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4716', '15', '90', '72', '90', '96', '90', '2016-09-06 16:40:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4717', '18', '90', '47', '90', '92', '90', '2016-09-06 16:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4718', '34', '90', '68', '90', '91', '90', '2016-09-06 16:53:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4719', '17', '90', '70', '90', '92', '90', '2016-09-06 16:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4720', '4', '90', '71', '90', '92', '90', '2016-09-06 16:55:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4721', '2', '90', '71', '90', '93', '90', '2016-09-06 16:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4722', '4', '90', '71', '90', '93', '90', '2016-09-06 16:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4723', '13', '90', '50', '90', '94', '90', '2016-09-06 16:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4724', '12', '90', '47', '90', '95', '90', '2016-09-06 16:59:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4725', '26', '90', '74', '90', '91', '90', '2016-09-07 15:19:01', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4726', '14', '90', '68', '90', '93', '90', '2016-09-07 15:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4727', '5', '90', '68', '90', '93', '90', '2016-09-07 15:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4728', '17', '90', '68', '90', '93', '90', '2016-09-07 15:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4729', '2', '90', '68', '90', '92', '90', '2016-09-07 15:23:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4730', '8', '90', '83', '90', '95', '90', '2016-09-07 16:51:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4731', '4', '90', '71', '90', '95', '90', '2016-09-07 16:52:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4732', '2', '90', '71', '90', '94', '90', '2016-09-07 16:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4733', '1', '90', '72', '90', '94', '90', '2016-09-07 16:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4734', '19', '90', '73', '90', '96', '90', '2016-09-07 16:55:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4735', '6', '90', '74', '90', '93', '90', '2016-09-07 16:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4736', '30', '90', '74', '90', '91', '90', '2016-09-07 16:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4737', '7', '90', '74', '90', '91', '90', '2016-09-07 16:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4738', '2', '90', '75', '90', '91', '90', '2016-09-07 17:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4739', '4', '90', '75', '90', '91', '90', '2016-09-07 17:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4740', '16', '90', '79', '90', '94', '90', '2016-09-08 11:30:01', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4741', '10', '90', '80', '90', '93', '90', '2016-09-08 11:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4742', '17', '90', '80', '90', '91', '90', '2016-09-08 11:32:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4743', '9', '90', '80', '90', '93', '90', '2016-09-08 11:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4744', '3', '90', '81', '90', '92', '90', '2016-09-08 11:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4745', '9', '90', '81', '90', '96', '90', '2016-09-08 11:35:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4746', '5', '90', '81', '90', '95', '90', '2016-09-08 11:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4747', '2', '90', '82', '90', '95', '90', '2016-09-08 11:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4748', '6', '90', '82', '90', '95', '90', '2016-09-08 11:38:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4749', '2', '90', '82', '90', '95', '90', '2016-09-08 11:39:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4750', '5', '90', '83', '90', '95', '90', '2016-09-08 11:40:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4751', '5', '90', '83', '90', '96', '90', '2016-09-08 11:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4752', '6', '90', '83', '90', '92', '90', '2016-09-08 11:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4753', '7', '90', '84', '90', '92', '90', '2016-09-08 11:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4754', '4', '90', '84', '90', '92', '90', '2016-09-08 11:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4755', '2', '90', '84', '90', '92', '90', '2016-09-08 11:45:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4756', '6', '90', '88', '90', '93', '90', '2016-09-08 11:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4757', '2', '90', '90', '90', '91', '90', '2016-09-08 11:48:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4758', '15', '90', '90', '90', '92', '90', '2016-09-08 11:49:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4759', '14', '90', '62', '90', '92', '90', '2016-09-08 11:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4760', '6', '90', '63', '90', '92', '90', '2016-09-08 11:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4761', '11', '90', '63', '90', '92', '90', '2016-09-08 11:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4762', '11', '90', '63', '90', '93', '90', '2016-09-08 11:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4763', '16', '90', '63', '90', '92', '90', '2016-09-08 11:54:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4764', '5', '90', '64', '90', '93', '90', '2016-09-08 11:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4765', '2', '90', '64', '90', '93', '90', '2016-09-08 11:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4766', '3', '90', '64', '90', '93', '90', '2016-09-08 11:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4767', '4', '90', '65', '90', '93', '90', '2016-09-08 11:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4768', '2', '90', '65', '90', '93', '90', '2016-09-08 11:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4769', '7', '90', '65', '90', '92', '90', '2016-09-08 12:00:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4770', '1', '90', '65', '90', '92', '90', '2016-09-08 12:01:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4771', '1', '90', '66', '90', '92', '90', '2016-09-08 12:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4772', '3', '90', '66', '90', '93', '90', '2016-09-08 12:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4773', '4', '90', '66', '90', '93', '90', '2016-09-08 12:04:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4774', '3', '90', '67', '90', '92', '90', '2016-09-08 12:05:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4775', '5', '90', '67', '90', '93', '90', '2016-09-08 12:06:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4776', '8', '90', '67', '90', '93', '90', '2016-09-08 12:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4777', '2', '90', '67', '90', '95', '90', '2016-09-08 12:08:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4778', '3', '90', '68', '90', '95', '90', '2016-09-08 12:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4779', '1', '90', '68', '90', '95', '90', '2016-09-08 12:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4780', '7', '90', '68', '90', '94', '90', '2016-09-08 12:11:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4781', '3', '90', '69', '90', '94', '90', '2016-09-08 12:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4782', '10', '90', '69', '90', '95', '90', '2016-09-08 12:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4783', '2', '90', '69', '90', '95', '90', '2016-09-08 12:14:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4784', '20', '90', '69', '90', '97', '90', '2016-09-08 12:15:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4785', '8', '90', '70', '90', '91', '90', '2016-09-08 12:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4786', '9', '90', '80', '90', '92', '90', '2016-09-08 13:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4787', '7', '90', '82', '90', '91', '90', '2016-09-08 13:29:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4788', '35', '90', '85', '90', '91', '90', '2016-09-08 13:43:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4789', '24', '90', '63', '90', '93', '90', '2016-09-08 13:57:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4790', '14', '90', '67', '90', '96', '90', '2016-09-08 13:58:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4791', '17', '90', '68', '90', '99', '90', '2016-09-08 13:59:00', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4792', '21', '90', '68', '90', '96', '90', '2016-09-08 14:00:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4793', '13', '90', '69', '90', '97', '90', '2016-09-08 14:01:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4794', '12', '90', '69', '90', '92', '90', '2016-09-08 14:02:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4795', '23', '90', '69', '90', '91', '90', '2016-09-08 14:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4796', '10', '90', '69', '90', '91', '90', '2016-09-08 14:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4797', '2', '90', '61', '90', '95', '90', '2016-09-11 11:47:01', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4798', '13', '90', '72', '90', '96', '90', '2016-09-11 11:48:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4799', '16', '90', '73', '90', '96', '90', '2016-09-11 11:49:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4800', '9', '90', '73', '90', '97', '90', '2016-09-11 11:50:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4801', '2', '90', '73', '90', '97', '90', '2016-09-11 11:51:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4802', '2', '90', '74', '90', '96', '90', '2016-09-11 11:52:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4803', '16', '90', '74', '90', '94', '90', '2016-09-11 11:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4804', '27', '90', '74', '90', '92', '90', '2016-09-11 12:42:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4805', '22', '90', '60', '90', '93', '90', '2016-09-11 12:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4806', '3', '90', '62', '90', '92', '90', '2016-09-11 12:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4807', '2', '90', '67', '90', '91', '90', '2016-09-11 12:45:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4808', '16', '90', '67', '90', '91', '90', '2016-09-11 12:46:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4809', '4', '90', '67', '90', '91', '90', '2016-09-11 12:47:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4810', '2', '90', '81', '90', '91', '90', '2016-09-12 10:27:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4811', '20', '90', '84', '90', '92', '90', '2016-09-12 10:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4812', '2', '90', '85', '90', '93', '90', '2016-09-12 10:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4813', '19', '90', '85', '90', '94', '90', '2016-09-12 10:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4814', '4', '90', '85', '90', '91', '90', '2016-09-12 10:34:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4815', '6', '90', '85', '90', '92', '90', '2016-09-12 10:35:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4816', '3', '90', '86', '90', '92', '90', '2016-09-12 10:36:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4817', '21', '90', '86', '90', '91', '90', '2016-09-12 10:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4818', '2', '90', '87', '90', '91', '90', '2016-09-12 10:39:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4819', '16', '90', '87', '90', '91', '90', '2016-09-12 10:40:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4820', '18', '90', '87', '90', '93', '90', '2016-09-12 10:42:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4821', '97', '90', '61', '90', '87', '90', '2016-09-12 10:52:00', '<font color=\"red\">CPU当前：97%,超出预设值  90%<br></font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4822', '3', '90', '62', '90', '91', '90', '2016-09-12 10:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4823', '12', '90', '62', '90', '93', '90', '2016-09-12 10:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4824', '44', '90', '62', '90', '95', '90', '2016-09-12 10:57:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4825', '8', '90', '65', '90', '94', '90', '2016-09-12 10:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4826', '1', '90', '70', '90', '95', '90', '2016-09-12 10:59:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4827', '34', '90', '70', '90', '95', '90', '2016-09-12 11:00:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4828', '11', '90', '70', '90', '95', '90', '2016-09-12 11:01:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4829', '6', '90', '71', '90', '96', '90', '2016-09-12 11:02:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4830', '8', '90', '71', '90', '95', '90', '2016-09-12 11:03:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4831', '24', '90', '71', '90', '96', '90', '2016-09-12 11:04:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4832', '1', '90', '72', '90', '96', '90', '2016-09-12 11:05:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4833', '6', '90', '72', '90', '95', '90', '2016-09-12 11:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4834', '6', '90', '72', '90', '93', '90', '2016-09-12 11:07:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4835', '2', '90', '72', '90', '94', '90', '2016-09-12 11:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4836', '2', '90', '73', '90', '93', '90', '2016-09-12 11:09:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4837', '9', '90', '73', '90', '94', '90', '2016-09-12 11:10:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4838', '18', '90', '73', '90', '93', '90', '2016-09-12 11:11:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4839', '68', '90', '73', '90', '94', '90', '2016-09-12 11:12:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4840', '22', '90', '63', '90', '91', '90', '2016-09-12 11:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4841', '15', '90', '66', '90', '94', '90', '2016-09-12 11:26:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4842', '52', '90', '67', '90', '92', '90', '2016-09-12 11:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4843', '23', '90', '67', '90', '92', '90', '2016-09-12 11:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4844', '5', '90', '67', '90', '94', '90', '2016-09-12 11:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4845', '28', '90', '68', '90', '93', '90', '2016-09-12 11:31:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4846', '2', '90', '68', '90', '93', '90', '2016-09-12 11:32:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4847', '3', '90', '69', '90', '92', '90', '2016-09-12 11:37:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4848', '15', '90', '74', '90', '91', '90', '2016-09-12 11:38:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4849', '68', '90', '74', '90', '91', '90', '2016-09-12 11:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4850', '13', '90', '75', '90', '91', '90', '2016-09-12 11:42:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4851', '11', '90', '54', '90', '93', '90', '2016-09-12 11:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4852', '18', '90', '54', '90', '93', '90', '2016-09-12 11:44:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4853', '11', '90', '54', '90', '94', '90', '2016-09-12 11:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4854', '15', '90', '54', '90', '93', '90', '2016-09-12 11:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4855', '26', '90', '55', '90', '95', '90', '2016-09-12 11:47:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4856', '11', '90', '55', '90', '93', '90', '2016-09-12 11:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4857', '10', '90', '56', '90', '93', '90', '2016-09-12 11:49:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4858', '9', '90', '56', '90', '94', '90', '2016-09-12 11:50:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4859', '12', '90', '56', '90', '94', '90', '2016-09-12 11:51:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4860', '13', '90', '56', '90', '94', '90', '2016-09-12 11:52:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4861', '7', '90', '57', '90', '94', '90', '2016-09-12 11:53:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4862', '6', '90', '57', '90', '94', '90', '2016-09-12 11:54:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4863', '12', '90', '57', '90', '91', '90', '2016-09-12 11:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4864', '8', '90', '60', '90', '91', '90', '2016-09-12 12:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4865', '12', '90', '60', '90', '98', '90', '2016-09-12 12:14:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4866', '24', '90', '60', '90', '93', '90', '2016-09-12 12:15:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4867', '21', '90', '61', '90', '95', '90', '2016-09-12 12:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4868', '33', '90', '61', '90', '94', '90', '2016-09-12 12:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4869', '39', '90', '61', '90', '95', '90', '2016-09-12 12:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4870', '38', '90', '61', '90', '95', '90', '2016-09-12 12:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4871', '41', '90', '62', '90', '96', '90', '2016-09-12 12:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4872', '29', '90', '62', '90', '97', '90', '2016-09-12 12:23:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4873', '21', '90', '62', '90', '91', '90', '2016-09-12 12:24:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4874', '34', '90', '63', '90', '93', '90', '2016-09-12 12:27:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4875', '37', '90', '63', '90', '92', '90', '2016-09-12 12:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4876', '40', '90', '63', '90', '93', '90', '2016-09-12 12:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4877', '29', '90', '63', '90', '94', '90', '2016-09-12 12:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4878', '27', '90', '64', '90', '95', '90', '2016-09-12 12:31:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4879', '42', '90', '64', '90', '94', '90', '2016-09-12 12:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4880', '31', '90', '64', '90', '94', '90', '2016-09-12 12:33:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4881', '32', '90', '64', '90', '95', '90', '2016-09-12 12:34:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4882', '27', '90', '65', '90', '94', '90', '2016-09-12 12:35:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4883', '43', '90', '65', '90', '95', '90', '2016-09-12 12:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4884', '39', '90', '65', '90', '95', '90', '2016-09-12 12:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4885', '41', '90', '65', '90', '96', '90', '2016-09-12 12:38:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4886', '42', '90', '66', '90', '96', '90', '2016-09-12 12:39:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4887', '38', '90', '66', '90', '96', '90', '2016-09-12 12:40:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4888', '42', '90', '66', '90', '96', '90', '2016-09-12 12:41:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4889', '45', '90', '66', '90', '97', '90', '2016-09-12 12:42:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4890', '41', '90', '67', '90', '96', '90', '2016-09-12 12:43:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4891', '38', '90', '67', '90', '96', '90', '2016-09-12 12:44:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4892', '40', '90', '67', '90', '97', '90', '2016-09-12 12:45:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4893', '24', '90', '67', '90', '92', '90', '2016-09-12 12:46:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4894', '27', '90', '77', '90', '91', '90', '2016-09-12 13:55:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4895', '39', '90', '77', '90', '91', '90', '2016-09-12 13:56:03', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4896', '34', '90', '49', '90', '91', '90', '2016-09-12 13:57:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4897', '39', '90', '50', '90', '91', '90', '2016-09-12 13:58:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4898', '32', '90', '50', '90', '91', '90', '2016-09-12 14:00:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4899', '28', '90', '50', '90', '91', '90', '2016-09-12 14:01:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4900', '29', '90', '50', '90', '91', '90', '2016-09-12 14:02:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4901', '29', '90', '51', '90', '91', '90', '2016-09-12 14:03:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4902', '27', '90', '51', '90', '91', '90', '2016-09-12 14:04:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4903', '30', '90', '51', '90', '91', '90', '2016-09-12 14:06:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4904', '34', '90', '52', '90', '91', '90', '2016-09-12 14:07:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4905', '34', '90', '52', '90', '91', '90', '2016-09-12 14:08:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4906', '42', '90', '52', '90', '91', '90', '2016-09-12 14:09:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4907', '31', '90', '52', '90', '92', '90', '2016-09-12 14:10:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4908', '29', '90', '52', '90', '91', '90', '2016-09-12 14:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4909', '33', '90', '53', '90', '91', '90', '2016-09-12 14:12:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4910', '39', '90', '53', '90', '91', '90', '2016-09-12 14:13:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4911', '36', '90', '53', '90', '91', '90', '2016-09-12 14:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4912', '35', '90', '53', '90', '91', '90', '2016-09-12 14:15:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4913', '35', '90', '53', '90', '91', '90', '2016-09-12 14:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4914', '30', '90', '54', '90', '92', '90', '2016-09-12 14:17:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4915', '27', '90', '54', '90', '92', '90', '2016-09-12 14:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4916', '28', '90', '54', '90', '91', '90', '2016-09-12 14:19:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4917', '24', '90', '54', '90', '91', '90', '2016-09-12 14:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4918', '48', '90', '55', '90', '91', '90', '2016-09-12 14:21:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4919', '30', '90', '55', '90', '91', '90', '2016-09-12 14:22:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4920', '29', '90', '55', '90', '93', '90', '2016-09-12 14:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4921', '31', '90', '55', '90', '92', '90', '2016-09-12 14:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4922', '25', '90', '55', '90', '92', '90', '2016-09-12 14:25:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4923', '35', '90', '56', '90', '92', '90', '2016-09-12 14:26:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4924', '38', '90', '56', '90', '92', '90', '2016-09-12 14:27:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4925', '29', '90', '56', '90', '92', '90', '2016-09-12 14:28:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4926', '37', '90', '56', '90', '92', '90', '2016-09-12 14:29:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4927', '27', '90', '57', '90', '91', '90', '2016-09-12 14:30:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4928', '32', '90', '57', '90', '92', '90', '2016-09-12 14:31:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4929', '30', '90', '57', '90', '92', '90', '2016-09-12 14:32:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4930', '29', '90', '57', '90', '91', '90', '2016-09-12 14:33:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4931', '42', '90', '58', '90', '92', '90', '2016-09-12 14:34:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4932', '33', '90', '58', '90', '93', '90', '2016-09-12 14:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4933', '30', '90', '58', '90', '93', '90', '2016-09-12 14:36:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4934', '37', '90', '58', '90', '93', '90', '2016-09-12 14:37:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4935', '32', '90', '59', '90', '93', '90', '2016-09-12 14:38:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4936', '32', '90', '59', '90', '93', '90', '2016-09-12 14:39:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4937', '27', '90', '59', '90', '92', '90', '2016-09-12 14:40:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4938', '40', '90', '59', '90', '92', '90', '2016-09-12 14:41:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4939', '31', '90', '59', '90', '92', '90', '2016-09-12 14:42:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4940', '43', '90', '60', '90', '92', '90', '2016-09-12 14:43:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4941', '33', '90', '60', '90', '92', '90', '2016-09-12 14:44:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4942', '35', '90', '60', '90', '93', '90', '2016-09-12 14:45:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4943', '27', '90', '60', '90', '93', '90', '2016-09-12 14:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4944', '41', '90', '61', '90', '93', '90', '2016-09-12 14:47:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4945', '30', '90', '61', '90', '93', '90', '2016-09-12 14:48:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4946', '44', '90', '61', '90', '95', '90', '2016-09-12 14:49:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4947', '30', '90', '61', '90', '92', '90', '2016-09-12 14:50:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4948', '28', '90', '62', '90', '92', '90', '2016-09-12 14:51:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4949', '35', '90', '62', '90', '92', '90', '2016-09-12 14:52:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4950', '33', '90', '62', '90', '93', '90', '2016-09-12 14:53:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4951', '34', '90', '62', '90', '93', '90', '2016-09-12 14:54:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4952', '37', '90', '62', '90', '93', '90', '2016-09-12 14:55:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4953', '36', '90', '63', '90', '93', '90', '2016-09-12 14:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4954', '36', '90', '63', '90', '94', '90', '2016-09-12 14:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4955', '27', '90', '63', '90', '93', '90', '2016-09-12 14:58:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4956', '30', '90', '63', '90', '93', '90', '2016-09-12 14:59:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4957', '28', '90', '64', '90', '93', '90', '2016-09-12 15:00:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4958', '27', '90', '64', '90', '93', '90', '2016-09-12 15:01:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4959', '37', '90', '64', '90', '93', '90', '2016-09-12 15:02:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4960', '41', '90', '64', '90', '93', '90', '2016-09-12 15:03:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4961', '39', '90', '64', '90', '95', '90', '2016-09-12 15:04:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4962', '26', '90', '65', '90', '94', '90', '2016-09-12 15:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4963', '30', '90', '65', '90', '94', '90', '2016-09-12 15:06:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4964', '36', '90', '65', '90', '94', '90', '2016-09-12 15:07:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4965', '39', '90', '65', '90', '94', '90', '2016-09-12 15:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4966', '38', '90', '66', '90', '94', '90', '2016-09-12 15:09:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4967', '27', '90', '66', '90', '95', '90', '2016-09-12 15:10:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4968', '34', '90', '66', '90', '96', '90', '2016-09-12 15:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4969', '19', '90', '66', '90', '97', '90', '2016-09-12 15:12:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4970', '29', '90', '67', '90', '94', '90', '2016-09-12 15:13:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4971', '50', '90', '67', '90', '94', '90', '2016-09-12 15:14:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4972', '37', '90', '67', '90', '95', '90', '2016-09-12 15:15:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4973', '45', '90', '67', '90', '95', '90', '2016-09-12 15:16:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4974', '36', '90', '67', '90', '95', '90', '2016-09-12 15:17:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4975', '41', '90', '68', '90', '95', '90', '2016-09-12 15:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4976', '43', '90', '68', '90', '95', '90', '2016-09-12 15:19:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4977', '37', '90', '68', '90', '95', '90', '2016-09-12 15:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4978', '35', '90', '68', '90', '95', '90', '2016-09-12 15:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4979', '46', '90', '69', '90', '96', '90', '2016-09-12 15:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4980', '48', '90', '69', '90', '96', '90', '2016-09-12 15:23:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4981', '8', '90', '63', '90', '91', '90', '2016-09-12 16:14:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4982', '11', '90', '66', '90', '92', '90', '2016-09-12 16:15:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4983', '6', '90', '66', '90', '91', '90', '2016-09-12 16:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4984', '8', '90', '67', '90', '93', '90', '2016-09-12 16:17:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4985', '11', '90', '68', '90', '94', '90', '2016-09-12 16:18:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4986', '15', '90', '68', '90', '94', '90', '2016-09-12 16:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4987', '9', '90', '68', '90', '95', '90', '2016-09-12 16:20:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4988', '16', '90', '69', '90', '95', '90', '2016-09-12 16:21:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4989', '10', '90', '69', '90', '94', '90', '2016-09-12 16:22:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4990', '27', '90', '69', '90', '98', '90', '2016-09-12 16:23:00', '<font color=\"red\">内存当前：98%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4991', '14', '90', '69', '90', '96', '90', '2016-09-12 16:24:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4992', '2', '90', '70', '90', '96', '90', '2016-09-12 16:25:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4993', '7', '90', '70', '90', '95', '90', '2016-09-12 16:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4994', '12', '90', '70', '90', '95', '90', '2016-09-12 16:27:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4995', '2', '90', '71', '90', '94', '90', '2016-09-12 16:28:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4996', '7', '90', '71', '90', '93', '90', '2016-09-12 16:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4997', '6', '90', '71', '90', '94', '90', '2016-09-12 16:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4998', '30', '90', '72', '90', '94', '90', '2016-09-12 16:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('4999', '11', '90', '72', '90', '95', '90', '2016-09-12 16:32:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5000', '6', '90', '72', '90', '95', '90', '2016-09-12 16:33:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5001', '5', '90', '72', '90', '96', '90', '2016-09-12 16:34:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5002', '3', '90', '73', '90', '95', '90', '2016-09-12 16:35:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5003', '9', '90', '73', '90', '95', '90', '2016-09-12 16:36:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5004', '48', '90', '73', '90', '95', '90', '2016-09-12 16:37:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5005', '12', '90', '79', '90', '91', '90', '2016-09-12 16:41:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5006', '11', '90', '83', '90', '94', '90', '2016-09-12 16:57:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5007', '9', '90', '83', '90', '94', '90', '2016-09-12 16:58:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5008', '7', '90', '84', '90', '94', '90', '2016-09-12 16:59:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5009', '6', '90', '84', '90', '94', '90', '2016-09-12 17:00:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5010', '10', '90', '84', '90', '94', '90', '2016-09-12 17:01:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5011', '25', '90', '85', '90', '94', '90', '2016-09-12 17:02:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5012', '10', '90', '85', '90', '94', '90', '2016-09-12 17:03:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5013', '10', '90', '85', '90', '94', '90', '2016-09-12 17:04:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5014', '14', '90', '85', '90', '94', '90', '2016-09-12 17:05:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5015', '16', '90', '86', '90', '95', '90', '2016-09-12 17:06:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5016', '13', '90', '86', '90', '95', '90', '2016-09-12 17:07:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5017', '13', '90', '86', '90', '94', '90', '2016-09-12 17:08:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5018', '9', '90', '87', '90', '95', '90', '2016-09-12 17:09:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5019', '16', '90', '87', '90', '96', '90', '2016-09-12 17:10:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5020', '19', '90', '87', '90', '96', '90', '2016-09-12 17:11:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5021', '16', '90', '87', '90', '95', '90', '2016-09-12 17:12:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5022', '11', '90', '88', '90', '95', '90', '2016-09-12 17:13:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5023', '12', '90', '88', '90', '96', '90', '2016-09-12 17:14:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5024', '12', '90', '88', '90', '96', '90', '2016-09-12 17:15:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5025', '7', '90', '89', '90', '96', '90', '2016-09-12 17:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5026', '15', '90', '61', '90', '96', '90', '2016-09-12 17:17:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5027', '13', '90', '61', '90', '96', '90', '2016-09-12 17:18:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5028', '17', '90', '61', '90', '96', '90', '2016-09-12 17:19:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5029', '22', '90', '62', '90', '97', '90', '2016-09-12 17:20:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5030', '3', '90', '62', '90', '96', '90', '2016-09-12 17:21:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5031', '14', '90', '62', '90', '96', '90', '2016-09-12 17:22:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5032', '18', '90', '62', '90', '96', '90', '2016-09-12 17:23:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5033', '18', '90', '63', '90', '96', '90', '2016-09-12 17:24:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5034', '10', '90', '63', '90', '96', '90', '2016-09-12 17:25:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5035', '5', '90', '63', '90', '95', '90', '2016-09-12 17:26:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5036', '11', '90', '63', '90', '96', '90', '2016-09-12 17:27:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5037', '10', '90', '64', '90', '96', '90', '2016-09-12 17:28:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5038', '8', '90', '64', '90', '96', '90', '2016-09-12 17:29:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5039', '12', '90', '64', '90', '96', '90', '2016-09-12 17:30:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5040', '5', '90', '64', '90', '96', '90', '2016-09-12 17:31:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5041', '5', '90', '65', '90', '96', '90', '2016-09-12 17:32:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5042', '7', '90', '65', '90', '96', '90', '2016-09-12 17:33:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5043', '2', '90', '65', '90', '97', '90', '2016-09-12 17:34:00', '<font color=\"red\">内存当前：97%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5044', '1', '90', '65', '90', '92', '90', '2016-09-12 17:54:58', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5045', '7', '90', '66', '90', '93', '90', '2016-09-12 17:56:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5046', '17', '90', '69', '90', '91', '90', '2016-09-12 18:16:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5047', '16', '90', '70', '90', '91', '90', '2016-09-12 18:17:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5048', '12', '90', '70', '90', '92', '90', '2016-09-12 18:18:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5049', '14', '90', '70', '90', '92', '90', '2016-09-12 18:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5050', '4', '90', '70', '90', '91', '90', '2016-09-12 18:20:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5051', '6', '90', '71', '90', '95', '90', '2016-09-13 09:15:33', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5052', '23', '90', '72', '90', '96', '90', '2016-09-13 09:16:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5053', '3', '90', '72', '90', '94', '90', '2016-09-13 09:17:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5054', '16', '90', '73', '90', '95', '90', '2016-09-13 09:18:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5055', '9', '90', '73', '90', '94', '90', '2016-09-13 09:19:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5056', '4', '90', '73', '90', '94', '90', '2016-09-13 09:20:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5057', '4', '90', '73', '90', '93', '90', '2016-09-13 09:21:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5058', '4', '90', '74', '90', '93', '90', '2016-09-13 09:22:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5059', '28', '90', '74', '90', '93', '90', '2016-09-13 09:23:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5060', '4', '90', '74', '90', '93', '90', '2016-09-13 09:24:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5061', '6', '90', '75', '90', '93', '90', '2016-09-13 09:25:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5062', '14', '90', '75', '90', '96', '90', '2016-09-13 09:26:00', '<font color=\"red\">内存当前：96%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5063', '3', '90', '75', '90', '94', '90', '2016-09-13 09:27:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5064', '8', '90', '75', '90', '93', '90', '2016-09-13 09:28:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5065', '4', '90', '76', '90', '93', '90', '2016-09-13 09:29:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5066', '2', '90', '76', '90', '94', '90', '2016-09-13 09:30:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5067', '2', '90', '76', '90', '94', '90', '2016-09-13 09:31:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5068', '2', '90', '76', '90', '94', '90', '2016-09-13 09:32:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5069', '14', '90', '77', '90', '93', '90', '2016-09-13 09:33:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5070', '10', '90', '77', '90', '93', '90', '2016-09-13 09:34:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5071', '6', '90', '77', '90', '93', '90', '2016-09-13 09:35:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5072', '13', '90', '77', '90', '94', '90', '2016-09-13 09:36:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5073', '26', '90', '78', '90', '94', '90', '2016-09-13 09:37:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5074', '11', '90', '78', '90', '94', '90', '2016-09-13 09:38:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5075', '15', '90', '78', '90', '94', '90', '2016-09-13 09:39:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5076', '23', '90', '79', '90', '94', '90', '2016-09-13 09:40:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5077', '14', '90', '79', '90', '93', '90', '2016-09-13 09:41:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5078', '11', '90', '79', '90', '94', '90', '2016-09-13 09:42:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5079', '12', '90', '79', '90', '93', '90', '2016-09-13 09:43:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5080', '16', '90', '80', '90', '94', '90', '2016-09-13 09:44:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5081', '13', '90', '80', '90', '94', '90', '2016-09-13 09:45:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5082', '14', '90', '80', '90', '93', '90', '2016-09-13 09:46:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5083', '17', '90', '81', '90', '94', '90', '2016-09-13 09:47:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5084', '7', '90', '81', '90', '94', '90', '2016-09-13 10:10:35', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5085', '34', '90', '81', '90', '91', '90', '2016-09-13 10:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5086', '40', '90', '83', '90', '92', '90', '2016-09-13 10:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5087', '32', '90', '83', '90', '93', '90', '2016-09-13 10:20:00', '<font color=\"red\">内存当前：93%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5088', '12', '90', '64', '90', '91', '90', '2016-09-13 11:11:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5089', '8', '90', '75', '90', '92', '90', '2016-09-13 12:18:01', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5090', '16', '90', '76', '90', '92', '90', '2016-09-13 12:19:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5091', '11', '90', '76', '90', '92', '90', '2016-09-13 12:20:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5092', '28', '90', '76', '90', '94', '90', '2016-09-13 12:21:00', '<font color=\"red\">内存当前：94%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5093', '5', '90', '76', '90', '99', '90', '2016-09-13 12:22:06', '<font color=\"red\">内存当前：99%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5094', '21', '90', '77', '90', '95', '90', '2016-09-13 12:23:00', '<font color=\"red\">内存当前：95%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5095', '28', '90', '77', '90', '92', '90', '2016-09-13 12:24:00', '<font color=\"red\">内存当前：92%,超出预设值  90%</font>', 'memmsc@163.com');
INSERT INTO `sys_server` VALUES ('5096', '57', '90', '77', '90', '91', '90', '2016-09-13 12:25:00', '<font color=\"red\">内存当前：91%,超出预设值  90%</font>', 'memmsc@163.com');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `UserId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `UserName` varchar(10) NOT NULL COMMENT '用户名',
  `Telephone` varchar(255) NOT NULL COMMENT '手机号',
  `Email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `PassWord` varchar(255) NOT NULL COMMENT '密码',
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `LastLoginDate` timestamp NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `UserStatus` enum('0','1') DEFAULT '1' COMMENT '用户状态',
  `UserHead` varchar(255) DEFAULT NULL COMMENT '头像',
  `Sex` enum('女生','男生') DEFAULT NULL COMMENT '性别',
  `InvitePeople` varchar(255) DEFAULT NULL COMMENT '邀请人',
  `IP` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `Information` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `CredentialsSalt` varchar(255) DEFAULT NULL COMMENT '验证凭证',
  `Birthday` date NOT NULL DEFAULT '1970-01-01' COMMENT '生日',
  PRIMARY KEY (`UserId`),
  KEY `UserID` (`UserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '15067171806', null, 'b6575327b0edad94c251360437f7eb04', '2016-09-11 12:24:36', null, '1', '/upload/image/userHead/201609/12114241j4m0.jpg', null, '', null, null, '91b2ccef09f74c28ba34b05fbbfedf4b', '1970-01-01');
INSERT INTO `sys_user` VALUES ('2', 'user', '13083963669', null, '88e966624f0ef82611ba0fc0b31af5ce', '2016-07-23 15:16:13', null, '1', null, null, null, null, null, 'c01ebee0672afa6c2e0b9b7907ec4083', '1970-01-01');

-- ----------------------------
-- Table structure for sys_user_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_resources`;
CREATE TABLE `sys_user_resources` (
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `ResourcesId` int(11) NOT NULL COMMENT '模块ID',
  PRIMARY KEY (`UserId`,`ResourcesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_resources
-- ----------------------------
INSERT INTO `sys_user_resources` VALUES ('1', '1');
INSERT INTO `sys_user_resources` VALUES ('1', '2');
INSERT INTO `sys_user_resources` VALUES ('1', '3');
INSERT INTO `sys_user_resources` VALUES ('1', '4');
INSERT INTO `sys_user_resources` VALUES ('1', '5');
INSERT INTO `sys_user_resources` VALUES ('1', '6');
INSERT INTO `sys_user_resources` VALUES ('1', '7');
INSERT INTO `sys_user_resources` VALUES ('1', '8');
INSERT INTO `sys_user_resources` VALUES ('1', '9');
INSERT INTO `sys_user_resources` VALUES ('1', '10');
INSERT INTO `sys_user_resources` VALUES ('1', '11');
INSERT INTO `sys_user_resources` VALUES ('1', '12');
INSERT INTO `sys_user_resources` VALUES ('1', '13');
INSERT INTO `sys_user_resources` VALUES ('1', '14');
INSERT INTO `sys_user_resources` VALUES ('1', '15');
INSERT INTO `sys_user_resources` VALUES ('1', '16');
INSERT INTO `sys_user_resources` VALUES ('1', '17');
INSERT INTO `sys_user_resources` VALUES ('1', '18');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `RoleId` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `RoleID` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '3');

-- ----------------------------
-- Table structure for wor_book
-- ----------------------------
DROP TABLE IF EXISTS `wor_book`;
CREATE TABLE `wor_book` (
  `BookId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小说ID',
  `UserId` bigint(11) unsigned NOT NULL COMMENT '用户ID',
  `BookName` varchar(255) DEFAULT NULL COMMENT '小说名称',
  `Partition` enum('少女','少年') NOT NULL DEFAULT '少年',
  `BookIntroduction` text COMMENT '作品简介',
  `BookUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `BookCoverImage` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `BookWordCount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小说字数',
  `BookStatus` enum('0','2','1') DEFAULT '0' COMMENT '小说状态',
  `BookHit` bigint(11) NOT NULL DEFAULT '0' COMMENT '点击率',
  `BookCollect` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `BookCopperCoins` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '青铜币数',
  `BookSilverCoins` bigint(11) NOT NULL DEFAULT '0' COMMENT '白银币数',
  PRIMARY KEY (`BookId`),
  KEY `BookID` (`BookId`) USING BTREE,
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_book
-- ----------------------------
INSERT INTO `wor_book` VALUES ('1', '1', '回到明朝当皇帝', '少年', '主人公一个玩游戏时发生了一件离奇的事件，突然穿越回到了北宋末与南宋初，机缘巧合之下结实了宋高宗，一段奇幻的经历从此开始，并改写了历史......', '2016-09-12 11:43:09', '/upload/image/userHead/201609/12114241j4m0.jpg', '0', '0', '0', '1', '0', '0');
INSERT INTO `wor_book` VALUES ('2', '1', '回到宋朝当皇帝', '少年', '主人公改写了历史......', '2016-09-12 11:43:13', '/upload/image/userHead/201609/12114241j4m0.jpg', '0', '0', '0', '2', '0', '0');

-- ----------------------------
-- Table structure for wor_bookcollect
-- ----------------------------
DROP TABLE IF EXISTS `wor_bookcollect`;
CREATE TABLE `wor_bookcollect` (
  `BookCollectId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小说收藏ID',
  `BookId` bigint(11) unsigned NOT NULL COMMENT '小说ID',
  `UserId` bigint(11) unsigned NOT NULL,
  `BookCollectDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`BookCollectId`),
  KEY `BookID` (`BookId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_bookcollect
-- ----------------------------
INSERT INTO `wor_bookcollect` VALUES ('3', '1', '1', '2016-07-14 16:24:30');
INSERT INTO `wor_bookcollect` VALUES ('5', '2', '2', '2016-07-14 16:53:37');
INSERT INTO `wor_bookcollect` VALUES ('6', '2', '1', '2016-07-14 16:57:43');

-- ----------------------------
-- Table structure for wor_bookcopper
-- ----------------------------
DROP TABLE IF EXISTS `wor_bookcopper`;
CREATE TABLE `wor_bookcopper` (
  `BookCopperId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小说青铜币ID',
  `BookId` int(11) unsigned NOT NULL COMMENT '小说ID',
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `BookCopperDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '打赏时间',
  `BookCopperCoins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '青铜币数',
  PRIMARY KEY (`BookCopperId`),
  KEY `BookID` (`BookId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_bookcopper
-- ----------------------------

-- ----------------------------
-- Table structure for wor_bookhit
-- ----------------------------
DROP TABLE IF EXISTS `wor_bookhit`;
CREATE TABLE `wor_bookhit` (
  `BookHitId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小说点击ID',
  `BookId` bigint(11) unsigned NOT NULL COMMENT '小说ID',
  `UserId` bigint(11) unsigned NOT NULL COMMENT '用户ID',
  `BookHitDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '点击时间',
  PRIMARY KEY (`BookHitId`),
  KEY `BookID` (`BookId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_bookhit
-- ----------------------------

-- ----------------------------
-- Table structure for wor_booksilver
-- ----------------------------
DROP TABLE IF EXISTS `wor_booksilver`;
CREATE TABLE `wor_booksilver` (
  `BookCopperId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小说白银币ID',
  `BookId` int(11) unsigned NOT NULL COMMENT '小说ID',
  `UserId` int(11) unsigned NOT NULL,
  `BookSilverDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '打赏时间',
  `BookSilverCoins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '白银币数',
  PRIMARY KEY (`BookCopperId`),
  KEY `BookID` (`BookId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_booksilver
-- ----------------------------

-- ----------------------------
-- Table structure for wor_booktype
-- ----------------------------
DROP TABLE IF EXISTS `wor_booktype`;
CREATE TABLE `wor_booktype` (
  `BookTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `BookTypeName` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `BookTypeDescription` varchar(255) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`BookTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_booktype
-- ----------------------------

-- ----------------------------
-- Table structure for wor_book_booktype
-- ----------------------------
DROP TABLE IF EXISTS `wor_book_booktype`;
CREATE TABLE `wor_book_booktype` (
  `BookId` int(11) unsigned NOT NULL COMMENT '小说ID',
  `BookTypeId` int(11) NOT NULL COMMENT '小说分类ID',
  PRIMARY KEY (`BookId`,`BookTypeId`),
  KEY `BookID` (`BookTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_book_booktype
-- ----------------------------

-- ----------------------------
-- Table structure for wor_chapter
-- ----------------------------
DROP TABLE IF EXISTS `wor_chapter`;
CREATE TABLE `wor_chapter` (
  `ChapterId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '章节ID',
  `VolumeId` bigint(11) unsigned NOT NULL COMMENT '分卷ID',
  `ChapterName` varchar(255) DEFAULT NULL COMMENT '章节标题',
  PRIMARY KEY (`ChapterId`),
  KEY `VolumeID` (`VolumeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_chapter
-- ----------------------------
INSERT INTO `wor_chapter` VALUES ('1', '1', '宅男的穿越');
INSERT INTO `wor_chapter` VALUES ('2', '1', '心中的困惑');
INSERT INTO `wor_chapter` VALUES ('3', '2', '猥琐的大叔');
INSERT INTO `wor_chapter` VALUES ('4', '2', '无聊的生活');

-- ----------------------------
-- Table structure for wor_content
-- ----------------------------
DROP TABLE IF EXISTS `wor_content`;
CREATE TABLE `wor_content` (
  `ContentId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `VolumeId` bigint(11) NOT NULL COMMENT '卷ID',
  `ContentTitle` varchar(255) DEFAULT NULL COMMENT '章节名称',
  `Content` longtext,
  `ContentWordCount` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '内容字数',
  `ContentUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `ContentStatus` enum('0','1','2') DEFAULT '0' COMMENT '内容状态',
  `ContentUrl` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`ContentId`),
  KEY `ChapterID` (`ContentTitle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_content
-- ----------------------------
INSERT INTO `wor_content` VALUES ('1', '1', '宅男的穿越', '<p>突然就穿越了<p>', '0', '2016-09-14 09:48:26', '0', null);
INSERT INTO `wor_content` VALUES ('2', '1', '心中的困惑', '<p>为什么呢？<p>', '0', '2016-09-14 09:48:46', '0', null);
INSERT INTO `wor_content` VALUES ('3', '2', '猥琐的大叔', '<p>哈哈哈<p>', '0', '2016-09-14 09:49:02', '0', null);
INSERT INTO `wor_content` VALUES ('4', '2', '无聊的生活', '<p>哎呀<p>', '0', '2016-09-14 09:49:31', '0', null);
INSERT INTO `wor_content` VALUES ('5', '2', '美好的一天', '<p>aa<p>', '0', '2016-09-14 18:58:49', '0', null);

-- ----------------------------
-- Table structure for wor_painting
-- ----------------------------
DROP TABLE IF EXISTS `wor_painting`;
CREATE TABLE `wor_painting` (
  `PaintingId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '画集ID',
  `PartitionId` int(11) NOT NULL COMMENT '分区ID',
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `PaintingName` varchar(255) DEFAULT NULL COMMENT '画集名',
  `PictureCount` int(11) NOT NULL DEFAULT '0' COMMENT '图片张数',
  `PaintingUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `PaintingCoverImage` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `PaintingHits` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击率',
  `PaintingCollections` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `PaintingCopperCoins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '青铜币数',
  `PaintingSilverCoins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '白银币数',
  `PaintingStatus` enum('0','1') DEFAULT '0' COMMENT '画集状态',
  `PaintingIntroduction` text COMMENT '画集简介',
  PRIMARY KEY (`PaintingId`),
  KEY `PaintingID` (`PaintingId`) USING BTREE,
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_painting
-- ----------------------------

-- ----------------------------
-- Table structure for wor_paintingcollect
-- ----------------------------
DROP TABLE IF EXISTS `wor_paintingcollect`;
CREATE TABLE `wor_paintingcollect` (
  `PaintingCollectId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '画集收藏ID',
  `PaintingId` int(11) unsigned NOT NULL COMMENT '画集ID',
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `PaintingCollectDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaintingCollectId`),
  KEY `PaintingID` (`PaintingId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_paintingcollect
-- ----------------------------

-- ----------------------------
-- Table structure for wor_paintingcopper
-- ----------------------------
DROP TABLE IF EXISTS `wor_paintingcopper`;
CREATE TABLE `wor_paintingcopper` (
  `PaintingCopperId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '画集青铜币ID',
  `PaintingId` int(11) unsigned NOT NULL COMMENT '画集ID',
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `PaintingCopperDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '打赏时间',
  `PaintingCopperCoins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '青铜币数',
  PRIMARY KEY (`PaintingCopperId`),
  KEY `PaintingID` (`PaintingId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_paintingcopper
-- ----------------------------

-- ----------------------------
-- Table structure for wor_paintinghits
-- ----------------------------
DROP TABLE IF EXISTS `wor_paintinghits`;
CREATE TABLE `wor_paintinghits` (
  `PaintingHitsId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '画集点击ID',
  `PaintingId` int(11) unsigned NOT NULL COMMENT '画集ID',
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `PaintingHitsDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '点击时间',
  PRIMARY KEY (`PaintingHitsId`),
  KEY `PaintingID` (`PaintingId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_paintinghits
-- ----------------------------

-- ----------------------------
-- Table structure for wor_paintingsilver
-- ----------------------------
DROP TABLE IF EXISTS `wor_paintingsilver`;
CREATE TABLE `wor_paintingsilver` (
  `PaintingSilverId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '画集白银币ID',
  `PaintingId` int(11) unsigned NOT NULL COMMENT '画集ID',
  `UserId` int(11) unsigned NOT NULL COMMENT '用户ID',
  `PaintingSilverDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '打赏时间',
  `PaintingSilverCoins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '白银币数',
  PRIMARY KEY (`PaintingSilverId`),
  KEY `PaintingID` (`PaintingId`),
  KEY `UserID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_paintingsilver
-- ----------------------------

-- ----------------------------
-- Table structure for wor_paintingtype
-- ----------------------------
DROP TABLE IF EXISTS `wor_paintingtype`;
CREATE TABLE `wor_paintingtype` (
  `PaintingTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `PaintingTypeName` varchar(10) DEFAULT NULL COMMENT '分类名称',
  `PaintingTypeDescription` varchar(255) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`PaintingTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_paintingtype
-- ----------------------------

-- ----------------------------
-- Table structure for wor_painting_paintingtype
-- ----------------------------
DROP TABLE IF EXISTS `wor_painting_paintingtype`;
CREATE TABLE `wor_painting_paintingtype` (
  `PaintingId` int(11) unsigned NOT NULL COMMENT '画集ID',
  `PaintingTypeId` int(11) NOT NULL COMMENT '画集分类ID',
  PRIMARY KEY (`PaintingId`,`PaintingTypeId`),
  KEY `PaintingID` (`PaintingTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_painting_paintingtype
-- ----------------------------

-- ----------------------------
-- Table structure for wor_partition
-- ----------------------------
DROP TABLE IF EXISTS `wor_partition`;
CREATE TABLE `wor_partition` (
  `PartitionId` int(11) NOT NULL AUTO_INCREMENT COMMENT '分区ID',
  `PartitionName` varchar(10) DEFAULT NULL COMMENT '分区名称',
  `PartitionDescription` varchar(255) DEFAULT NULL COMMENT '分区描述',
  PRIMARY KEY (`PartitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_partition
-- ----------------------------

-- ----------------------------
-- Table structure for wor_picture
-- ----------------------------
DROP TABLE IF EXISTS `wor_picture`;
CREATE TABLE `wor_picture` (
  `PictureId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `PaintingId` int(11) unsigned NOT NULL COMMENT '画集ID',
  `PictureName` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `Picture` varchar(255) DEFAULT NULL COMMENT '储存路径',
  PRIMARY KEY (`PictureId`),
  KEY `PaintingID` (`PaintingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_picture
-- ----------------------------

-- ----------------------------
-- Table structure for wor_volume
-- ----------------------------
DROP TABLE IF EXISTS `wor_volume`;
CREATE TABLE `wor_volume` (
  `VolumeId` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分卷ID',
  `BookId` bigint(11) unsigned NOT NULL COMMENT '小说ID',
  `VolumeName` varchar(255) DEFAULT NULL COMMENT '分卷标题',
  PRIMARY KEY (`VolumeId`),
  KEY `BookID` (`BookId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wor_volume
-- ----------------------------
INSERT INTO `wor_volume` VALUES ('1', '1', '第一卷');
INSERT INTO `wor_volume` VALUES ('2', '1', '第二卷');
DROP TRIGGER IF EXISTS `trigger1`;
DELIMITER ;;
CREATE TRIGGER `trigger1` AFTER INSERT ON `wor_bookcollect` FOR EACH ROW begin
  update wor_book 
  set BookCollect=BookCollect+1 
  where BookId=new.BookId;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger2`;
DELIMITER ;;
CREATE TRIGGER `trigger2` AFTER DELETE ON `wor_bookcollect` FOR EACH ROW begin
  update wor_book 
  set BookCollect=BookCollect-1 
  where BookId=old.BookId;
end
;;
DELIMITER ;
