/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : jeesite

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 11/12/2017 22:47:32 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `task_task`
-- ----------------------------
DROP TABLE IF EXISTS `task_task`;
CREATE TABLE `task_task` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) NOT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `level` varchar(32) NOT NULL COMMENT '任务级别',
  `state` char(1) DEFAULT NULL COMMENT '任务状态：0为初始状态；1为已完成；2为超时；3为废弃任务',
  `deadline` datetime DEFAULT NULL COMMENT '任务截止日期',
  `content` varchar(2000) DEFAULT NULL,
  `member_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_task_parent_id` (`parent_id`) USING BTREE,
  KEY `task_task_name` (`name`) USING BTREE,
  KEY `task_task_state` (`state`) USING BTREE,
  KEY `task_task_level` (`level`) USING BTREE,
  KEY `task_task_deadline` (`deadline`) USING BTREE,
  KEY `task_task_member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务表';

-- ----------------------------
--  Records of `task_task`
-- ----------------------------
BEGIN;
INSERT INTO `task_task` VALUES ('1', '0', '0', '1', null, null, null, null, null, null, null, '随便', null, null, null, null), ('2', '1', '0,1', '10', 'remarks', '系统管理员', '2017-11-12 21:39:54', null, null, '0', '任务组1', '一级', '0', '2017-11-16 21:40:33', '这个是任务组', null), ('3', '2', '0,1,2', '20', 'remarks', '系统管理员', '2017-11-09 21:42:29', null, null, '0', '任务1', '一级', '2', '2017-11-23 21:43:55', '这个是任务1', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
