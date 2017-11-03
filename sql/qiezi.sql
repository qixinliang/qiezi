create database qiezi DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
grant all privileges on `qiezi`.* to 'root'@'localhost' identified by '123456';
flush privileges;

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) NOT NULL COMMENT '名称',
--  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '主类别编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `click` int(11) DEFAULT 0 COMMENT '//点击量',
  `count` int(11) DEFAULT 0 COMMENT '字数统计',
  `publish` varchar(4) DEFAULT NULL COMMENT '首发状态',
  `state` tinyint(1) DEFAULT 0 COMMENT '状态',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nid` int(11) NOT NULL COMMENT '小说编号',
  `chapter` varchar(20) NOT NULL COMMENT '第几章',
  `title` varchar(100) NOT NULL COMMENT '章节名称',
  `content` text COMMENT '内容',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `count` int(11) DEFAULT NULL COMMENT '字数',
  `time` int(11) NOT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;