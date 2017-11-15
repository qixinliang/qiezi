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

 Date: 15/11/2017 17:30:19
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
  `chapter_name` varchar(100) NOT NULL COMMENT '章节名称',
  `content` text COMMENT '内容',
  `novel_id` int(11) NOT NULL COMMENT '小说编号',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `count` int(11) DEFAULT NULL COMMENT '字数',
  `pre_chapter_id` int(11) unsigned NOT NULL DEFAULT '0',
  `next_chapter_id` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5509 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------
BEGIN;
INSERT INTO `chapter` VALUES (2, '第二张', '骚年的帅', '风骚的夜晚开始了', 27, 0, NULL, 0, 0, 0);
INSERT INTO `chapter` VALUES (5508, '第310章', '龙腾动手了', '<p>开着车，放着轻音乐，初升的太阳在远方，露出迷人的微笑。</p><p></p><p>白姐坐在副驾驶上，一会儿涂唇膏，一会儿画睫毛，还总是皱着眉头说：“哎哟，怎么越看越难看啊？小志，你说姐是不是变丑了啊？！”</p><p></p><p>我看着她，她就用那种似笑非笑的眼神看我；我知道，她这是想吸引我的注意，让我看她美不美，顺便再夸她两句。</p><p></p><p>她可真够可以的，虚荣心可不是一般的小哦！我就说：“哪里丑啊？怎么看怎么美；还有，你不要画那么多妆，都快不认识你了；你说咱俩登了记，回头阿川他们，要是对着结婚证一看，问我这女的是谁，那不就尴尬了？不知道的，还以为我跟二奶结婚了呢！”</p><p></p><p>听我这样说，她简直被气死了，伸手就掐我，咬着白牙就说：“你怎么这么坏？！姐画的妆有那么浓嘛？！”她拿着小镜子，一个劲儿地左右照，眉头皱着，可爱死了；我其实就是跟她开玩笑而已，没想到她还认真了。</p><p></p><p>我就说：“逗你呢，傻瓜！现在挺漂亮的，不化妆更漂亮。”</p><p></p><p>被我一夸，她有些脸红地底下头，扭扭捏捏说：“哪里漂亮啊？都要奔三了，老了，你看姐眼角，都开始有皱纹了呢！”</p><p></p><p>其实哪儿有啊，她皮肤好，而且会保养，不知道的，都以为她比我还小呢！我知道她故意要这么说，就是想让我跟她说点儿好听的。</p><p></p><p>女人真是一种奇怪的动物，就喜欢别人夸她美、夸她漂亮，喜欢听好话，再肉麻都能接受。我不知道其他女人是不是这样，但白姐就是这样的！</p><p></p><p>我就故意说：“是哦，确实有皱纹了，额头也有，下巴也有；姐，看来你真的老了……”</p><p></p><p>一听这个，她顿时就急了，她抬手掐着我胳膊，咬牙切齿地说：“哪里有皱纹？姐怎么没看到？你敢说姐老了，你个小坏蛋，你是不是故意这么说的？！”</p><p></p><p>正跟她闹着，我电话就响了；白姐帮我掏出来，看了一下说：“是秦总打的。”</p><p></p><p>我接过来，放到耳边说：“秦总，怎么了？大早上就来电话。”</p><p></p><p>电话那头，秦总语气急切地说：“小志，你快来公司，可能要出大事！”</p><p></p><p>“什么？！”我浑身一紧，放慢车速说，“老哥，到底怎么了？好好的能出什么大事？！”</p><p></p><p>秦总深吸了一口气说：“封虎那边动手了，龙腾也动手了，他们下了一盘大棋，大到令人震惊！你赶快回公司，咱们商量对策；倘若真有一步走错，后果不堪设想啊！”</p><p></p><p>我知道，秦总这人，从不开玩笑；他说要出大事，那肯定就是天大的事！龙腾集团到底做了什么，能让秦总这个纵横铝业多年的人，如此慌张？！</p><p></p><p>皱着眉，我咬咬牙说：“嗯，秦总，我一会儿就到公司。”</p><p></p><p>秦总赶紧嘱咐我说：“一定要抓紧，现在的时间，比任何时候都紧迫！”</p><p></p><p>挂掉电话，我心脏都跟着“砰砰”直跳；白姐看我脸色不好，赶紧问我说：“小志，怎么了？是不是出什么事了？”</p><p></p><p>我摇摇头，忍着心里的惊恐和疑惑，勉强挤出一丝微笑说：“没什么大事，咱们先去登记，完了以后回公司，秦总那边有事要找我商量。”</p><p></p><p>白姐就说：“要不…要不咱们先去公司吧，登记什么时候都行的；人家民政局又跑不了，姐…姐也跑不了，干嘛要这么着急啊？！”</p><p></p><p>我长舒了一口气说：“姐，我特别着急，恨不得现在就把你娶进门，知道吗？咱们之间，我再也承受不起任何伤害了，我要牢牢抓住你，咱们在一起，真正组建一个家庭，这是我这些年来，日思夜想都渴望的！”</p><p></p><p>“可是秦总那边……”白姐有些犹豫地说。</p><p></p><p>“没事，生意上的事，也不在乎这一会儿。”拍着她的手，我安慰她说。</p><p></p><p>到民政局的时候，还不到九点，人家还没上班；我和白姐站在外面的台阶上，她不知道公司发生了什么事，仍旧挺开心的；还拿手机，在民政局门口拍了张照片，然后传到空间里，发了条评论说：等了好久终于等到今天，梦了好久终于把梦实现……</p><p></p><p>我看着她的手机屏幕，她还挺有才的，引用了一首刘德华的歌词，然后再配上民政局的照片，竟然完美地把我们这份，几经挫折换来的爱情，表达的感人肺腑。</p><p></p><p>可我却没有心情，再去跟她开玩笑了；抽着烟，我眯着眼睛苦思冥想，就是想不出来，龙腾和封虎，他们究竟干了什么，能让秦总如此惊慌！</p><p></p><p>我们在白城，手里有那么多矿，还有小路他们这个，数一数二的产品设计团队；我和宋市长之间的事，还没有人知道；除了公司规模和资金，我觉得我不比龙腾差多少；有这么多硬实力在手，我就不相信，龙腾他还能吃了我！</p><p></p><p>九点钟的时候，民政局的门开了；但某些部门的办事效率，真的不敢恭维；他们又是要开电脑，又是要打扫卫生，又是要换工装；整整拖了半个小时，都还没有正式工作。</p><p></p><p>我简直被急死了，这些杂活，他们就不能早来半小时干吗？</p><p></p><p>今天是登记的日子，我不想发火，就很有礼貌地问工作人员说：“我们什么时候可以登记？”</p><p></p><p>那女的理了下头发说：“哦，过来登记的啊？！随时都可以。”说完，她拿抹布擦擦手，直接去了柜台前。</p><p></p><p>我：……</p><p></p><p>你特么随时都可以，干嘛不说一声？害得老子在这里，火急火燎等了大半天！</p><p></p><p>白姐就拉着我的手，朝我摇摇头，示意我不要上火；“赶紧登记吧，秦总还在公司等着呢。”</p><p></p><p>我长舒了一口浊气，在心里默默地告诉自己：今天是个好日子，一定要高兴，高兴……</p><p></p><p>拉着白姐，我们坐到了柜台前的椅子上，把户口本和身份证递了过去。</p><p></p><p>办事员接过证件，对着电脑敲了两下，突然一皱眉头说：“对不起王小志先生，您现在不能登记结婚……”</p>', 27, 0, NULL, 5507, 5509, 0);
COMMIT;

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kind
-- ----------------------------
BEGIN;
INSERT INTO `kind` VALUES (1, '都市');
INSERT INTO `kind` VALUES (2, '现言');
INSERT INTO `kind` VALUES (3, '古言');
INSERT INTO `kind` VALUES (4, '总裁');
INSERT INTO `kind` VALUES (5, '穿越');
INSERT INTO `kind` VALUES (6, '灵异');
INSERT INTO `kind` VALUES (7, '玄幻');
INSERT INTO `kind` VALUES (8, '异能');
INSERT INTO `kind` VALUES (9, '科幻');
INSERT INTO `kind` VALUES (10, '仙侠');
INSERT INTO `kind` VALUES (11, '幻想');
INSERT INTO `kind` VALUES (12, '历史');
INSERT INTO `kind` VALUES (13, '军事');
INSERT INTO `kind` VALUES (14, '校园');
INSERT INTO `kind` VALUES (15, '武侠');
INSERT INTO `kind` VALUES (16, '游戏');
INSERT INTO `kind` VALUES (17, '耽美');
INSERT INTO `kind` VALUES (18, '奇幻');
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
