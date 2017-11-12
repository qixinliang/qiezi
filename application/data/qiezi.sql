/*
 Navicat Premium Data Transfer

 Source Server         : 本机数据库
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : qiezi

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 12/11/2017 21:39:19
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of author
-- ----------------------------
BEGIN;
INSERT INTO `author` VALUES (1, '阿刀', 'adao@163.com', '111111', 'adao');
INSERT INTO `author` VALUES (2, '夏日晨曦', 'cx@163.com', '111111', 'cx');
INSERT INTO `author` VALUES (3, '冷面邪少', 'xs@163.com', '111111', 'xs');
INSERT INTO `author` VALUES (4, '夕阳云烟', 'xyyy@163.com', '111111', 'xyyy');
INSERT INTO `author` VALUES (5, '夏之夜', 'xzy@163.com', '111111', 'xzy');
INSERT INTO `author` VALUES (6, '未央几寒', 'jh@163.com', '111111', 'jh');
INSERT INTO `author` VALUES (7, '寒江醉友', 'zy@163.com', '111111', 'zy');
INSERT INTO `author` VALUES (8, '小脚丫', 'aaa@163.com', '111111', 'aaa');
INSERT INTO `author` VALUES (9, '纯情小处男', 'xcn@63.com', '111111', 'xcn');
INSERT INTO `author` VALUES (10, '裳初', '1@163.com', '111111', '1');
INSERT INTO `author` VALUES (11, '喝杯浓茶', '2@163.com', '111111', '2');
INSERT INTO `author` VALUES (12, '囚你于无期', '3@163.com', '111111', '3');
INSERT INTO `author` VALUES (13, '笑笑星儿', '4@163.com', '111111', '4');
INSERT INTO `author` VALUES (14, '狂饮莫醉', '5@163.com', '111111', '5');
INSERT INTO `author` VALUES (15, '莫雅', '6@163.com', '111111', '6');
INSERT INTO `author` VALUES (16, '清酒半壶', '7@163.com', '111111', '7');
INSERT INTO `author` VALUES (17, '逸尘', '8@163.com', '111111', '8');
INSERT INTO `author` VALUES (18, '问白', '9@163.com', '111111', '9');
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
) ENGINE=InnoDB AUTO_INCREMENT=5509 DEFAULT CHARSET=utf8;

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
  `is_recommend` int(11) unsigned DEFAULT '0' COMMENT '是否主编推荐，0-未推荐、1-推荐',
  `is_hot` int(11) unsigned DEFAULT '0' COMMENT '是否热门',
  `is_new` int(11) unsigned DEFAULT '0' COMMENT '是否新书',
  `is_popular` int(11) unsigned DEFAULT '0' COMMENT '是否畅销书',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel
-- ----------------------------
BEGIN;
INSERT INTO `novel` VALUES (3, '官梯', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/13/novel2017101359e01b15e33df.jpg', 0, 0, NULL, 0, 1, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (5, '透视神眼', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/13/149466364612115.jpg', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (6, '花容月貌', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/13/149466364680136.jpg', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (7, '透视系统', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/13/149466364730322.jpg', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (8, '我和女神在荒岛的日子', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/13/149466364717800.jpg', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (9, '风流岁月之活色生香', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/13/149466364826409.jpg', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (27, '白姐', 1, 1, '都市, 言情', '感谢青春，让我在一无所有的年纪，遇到了青春靓丽的你。', 'http://becold.cn/Public/attached/2017/09/16/novel2017091659bca10f40f91.jpg', 162798, 5000000, '0', 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (47, '画地为牢：我的老公是无赖', 1, 15, NULL, '一纸婚约把他们绑在一起，他年少气盛，厌恶被人安排，冷落她三年，最后变成了折磨她\n。 他想,就这样互相折磨到永远吧。 七年后…… 一张尿布摔在他的脸上，他欲哭无泪。 “霍霖云，还不快去洗尿片！” 她大声地吼着，他想说什么，还是没有说，妻子大于天啊， 她得意地笑着，谁叫你当初那样虐我，就让宝宝虐死你！ 是谁说的，就这样被你征服，不对不对，就这样折磨他到永远', 'http://becold.cn/Public/attached/2017/09/16/novel2017091659bcaab01442a.jpg', 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `novel` VALUES (50, '绝宠千金归来', 1, 2, NULL, '初恋，让她伤的体无完肤，遁入地狱之门时，她誓言：今生今世绝情绝欲。 阴差阳错，让她与他相遇，从此，她成了他致命的弱点，而他成了她的毒药——恋上就无可自拔！！！！！', 'http://becold.cn/Public/attached/2017/05/13/149466367091232.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (57, '山野刁民', 1, 3, NULL, '陈二娃是十里八乡唯一的赤脚大夫，还会耍点功夫，自然混得风生水起。但他的身世却一直是一谜，并且困扰着他。看一个陈二娃，这个孤儿少年，如何在找寻自己身世中，实现其大地王者的伟大梦想。', 'http://becold.cn/Public/attached/2017/05/17/149498794755273.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (58, '透视村医', 1, 8, NULL, '透视之眼，看遍天下美女！妙手村医，专治各种不服！小农民偶获异术，从此踏上逆\n袭之路……', 'http://becold.cn/Public/attached/2017/09/26/novel2017092659ca29048a4fc.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (80, '柔美好娇妻', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/25/149571271729864.jpg', 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (86, '我是替身妻', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/25/1495712718744.jpg', 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (102, '我的总裁女友', 1, 12, NULL, '国际杀手之王张铁根金盆洗手，回老家凤凰村种地当农民，无意中救了白富美柳如烟\n和柳晴春，结果暴露行踪。于…', 'http://becold.cn/Public/attached/2017/05/25/149571272011828.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (136, '猛男诞生记', 1, 10, NULL, '罗军是一名光荣的小保安，也是最牛的小保安，没有之一！繁华都市里，罗军以超强\n的身手和非凡的智慧如鱼得水…', 'http://becold.cn/Public/attached/2017/09/30/novel2017093059cf0e6a63f53.jpg', 0, 0, NULL, 0, 1, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (162, '超级兵王在花都', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/05/25/149571272918920.jpg', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (234, '升迁之路', 1, 6, NULL, '小人物马英杰策划了一场上位上司太太的好戏，结果在阴错阳差之中，误惹了上司夫\n人，满以为恶运来临，却被上司夫人带进更大的商海，从此，青云直上，步步高升。', 'http://becold.cn/Public/attached/2017/05/25/149571273939892.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (250, '阴阳先生', 1, 5, NULL, '我看见成妍的肩膀那儿，多了一个狐狸脑袋……', 'http://becold.cn/Public/attached/2017/05/25/1495712742195.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (312, '女总裁的特种保安', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/13/novel2017101359e01b4293d35.jpg', 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (319, '贴身兵王', 1, 13, NULL, '身份神秘的雇佣兵王来到都市，且看他如何纵横在这繁华都市，制定属于自己的规则', 'http://becold.cn/Public/attached/2017/06/03/149646221354510.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (395, '末世之全能进化', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/06/03/14964622307711.jpg', 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (408, '斩龙', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/06/03/149646223342425.jpg', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (429, '凰权之天命帝妃', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/06/03/149646223779772.jpg', 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (483, '一吻成瘾', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/06/03/149646224831689.jpg', 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (796, '寡嫂', 1, 11, NULL, '我活着就为守护嫂子，为了她我可以杀人，嫂子是我的一切，跟她在一起的日子，生\n活才精彩', 'http://becold.cn/Public/attached/2017/06/19/149787520112534.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (800, '色即是攻', 1, 4, NULL, '天有天色，地有颜色，人有气色。\n天之色主阴晴圆缺，地之色主春夏秋冬，人之色主吉凶祸福。\n乡村少年谢二拿，偶得神秘相书，以色为攻，预知祸福，逆天改命，从此，乡村寡妇，邻家妹子，萝莉御姐，花信少妇>，尽皆锁定谢二拿，蠢蠢欲动，或威逼，或利诱，或以身为饵，诱其入瓮……\n敬告诸君：《乡野村情》已经完本，这是本人本年度第二部乡村题材小说，精彩纷呈，情趣无限，不疯魔不完本，请放心阅读', 'http://becold.cn/Public/attached/2017/07/08/149950260242004.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (859, '大猛男', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/14/novel2017101459e1718d800c9.jpg', 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (890, '桃色乡村', 1, 16, NULL, NULL, '', 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (893, '和后妈同居的日子', 1, 18, NULL, NULL, '', 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (900, '那手，我下针', 1, 17, NULL, NULL, '', 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (932, '好色艳妇', 1, 9, NULL, '你们这群好色女人，哥已经纯洁的感天动地了，你们何苦非逼着我XXOO', 'http://becold.cn/Public/attached/2017/10/19/novel2017101959e83f5af2fcd.jpg', 0, 0, NULL, 0, 1, 0, 1, 0, 1, 0, 0);
INSERT INTO `novel` VALUES (934, '乡艳：狂野美人沟', 1, 7, NULL, '山村青年周二狗胸无大志，他青春萌动时就满村子的调戏女人，终于在山上的茅草丛\n推倒了留守活寡王香妹，付出了自己的第一次…………\n    野性难羁的山里妹子，美艳的乡村小寡妇，支教年轻美女教师，大学生美女村官，通通扑面而来……花色撩人，幸福的生活……', 'http://becold.cn/Public/attached/2017/10/12/novel2017101259df01b6c59d4.jpg', 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `novel` VALUES (943, '流氓战神', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/27/novel2017102759f28e934ce18.jpg', 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `novel` VALUES (944, '玲珑偷心', 1, 14, NULL, '世间本没有路，走的人多了，便有了路。世间也没有神，当你拥有了诸般能力，你便成了人们心中的神。自古以来，人类为了追求长生，著出各种丹法秘籍，企图达到长生不死的目的。更有一些智者创造了一些秘法，将人和动物相结合，创造出各种异形，也拥有了诸般异能，这些异形最后被人类尊为神明，比如人蛇合体的上古之神--女娲。水玲珑，一个远古神族的分解之体，二十一世纪的一个普通异能者，且看她如何历尽磨难，层层蜕变成就远古真神时代的异形的完美异形。期间，有阴谋诡计，尔虞我诈。有悲欢离合，生死相许。有真挚的友情，有凄美的爱情！一次次的死亡，一次次的重生，最后她能否和挚爱携手归隐，尽在玲珑偷心……', 'http://becold.cn/Public/attached/2017/10/27/novel2017102759f2a3780ad0e.jpg', 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `novel` VALUES (945, '罪恶青春', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/27/novel2017102759f2a497638a6.jpg', 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `novel` VALUES (1190, '王在相爱', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/10/30/novel2017103059f6c660b80ac.jpg', 0, 0, NULL, 0, 0, 1, 0, 1, 0, 0, 0);
INSERT INTO `novel` VALUES (1258, '谁与争锋之乱世枭雄', 1, 1, NULL, NULL, 'http://becold.cn/Public/attached/2017/11/01/novel2017110159f98c2b93fc1.jpg', 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
