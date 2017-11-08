/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : qiezi

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 08/11/2017 18:31:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `pseudonym` varchar(32) NOT NULL COMMENT '笔名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of author
-- ----------------------------
BEGIN;
INSERT INTO `author` VALUES (1, '阿刀', 'adao@163.com', '111111', 'adao');
COMMIT;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `chapter_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `chapter` varchar(20) NOT NULL COMMENT '第几章',
  `title` varchar(100) NOT NULL COMMENT '章节名称',
  `content` text COMMENT '内容',
  `novel_id` int(11) NOT NULL COMMENT '小说编号',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `count` int(11) DEFAULT NULL COMMENT '字数',
  `time` int(11) NOT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------
BEGIN;
INSERT INTO `chapter` VALUES (2, '第二张', '骚年的帅', '风骚的夜晚开始了', 27, 0, NULL, 0);
INSERT INTO `chapter` VALUES (5508, '第一章', '少女的美好', '激情的夜晚开始了', 27, 0, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kind
-- ----------------------------
BEGIN;
INSERT INTO `kind` VALUES (1, '都市');
COMMIT;

-- ----------------------------
-- Table structure for novel
-- ----------------------------
DROP TABLE IF EXISTS `novel`;
CREATE TABLE `novel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小说id',
  `name` varchar(30) NOT NULL COMMENT '小说名',
  `kid` int(11) NOT NULL COMMENT '类型id',
  `aid` int(11) NOT NULL COMMENT '作者id',
  `keyword` varchar(30) DEFAULT NULL COMMENT '关键字',
  `intro` varchar(400) DEFAULT NULL COMMENT '小说简介',
  `surface` varchar(255) DEFAULT '' COMMENT '封面',
  `click` int(11) DEFAULT '0' COMMENT '//点击量',
  `count` int(11) DEFAULT '0' COMMENT '字数统计',
  `publish` varchar(4) DEFAULT NULL COMMENT '首发状态',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态',
  `is_carousel` int(11) unsigned DEFAULT '0' COMMENT '是否首页轮播',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel
-- ----------------------------
BEGIN;
INSERT INTO `novel` VALUES (3, '官梯', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/13/novel2017101359e01b15e33df.jpg', 0, 0, NULL, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (27, '白姐', 1, 1, '都市, 言情', '感谢青春，让我在一无所有的年纪，遇到了青春靓丽的你。', 'http://becold.cn/Public/attached/2017/09/16/novel2017091659bca10f40f91.jpg', 162798, 5000000, '0', 0, 0, 0, 0);
INSERT INTO `novel` VALUES (80, '柔美好娇妻', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/25/149571271729864.jpg', 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (86, '我是替身妻', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/25/1495712718744.jpg', 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (136, '猛男诞生记', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/09/30/novel2017093059cf0e6a63f53.jpg', 0, 0, NULL, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (312, '女总裁的特种保安', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/13/novel2017101359e01b4293d35.jpg', 0, 0, NULL, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (395, '末世之全能进化', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/06/03/14964622307711.jpg', 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (429, '凰权之天命帝妃', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/06/03/149646223779772.jpg', 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (483, '一吻成瘾', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/06/03/149646224831689.jpg', 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (859, '大猛男', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/14/novel2017101459e1718d800c9.jpg', 0, 0, NULL, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (932, '好色艳妇', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/19/novel2017101959e83f5af2fcd.jpg', 0, 0, NULL, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (1258, '谁与争锋之乱世枭雄', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/11/01/novel2017110159f98c2b93fc1.jpg', 0, 0, NULL, 0, 0, 0, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
