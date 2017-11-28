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

 Date: 28/11/2017 17:40:08
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
INSERT INTO `author` VALUES (19, '雨上寒烟', 'xxx@163.com', '111111', 'xxx');
COMMIT;

-- ----------------------------
-- Table structure for bookrack
-- ----------------------------
DROP TABLE IF EXISTS `bookrack`;
CREATE TABLE `bookrack` (
  `bid` int(11) NOT NULL COMMENT '//书号',
  `rid` int(11) NOT NULL COMMENT '//读者编号',
  `cid` int(11) NOT NULL COMMENT '//章节号',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '//记录日期',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '//更新日期',
  PRIMARY KEY (`bid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookrack
-- ----------------------------
BEGIN;
INSERT INTO `bookrack` VALUES (8, 1, 113, 1511349536, 1511778881);
INSERT INTO `bookrack` VALUES (3735, 1, 208421, 1511169428, 1511174503);
COMMIT;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `chapter_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `chapter_no` varchar(20) NOT NULL DEFAULT '0' COMMENT '第多少章',
  `chapter_name` varchar(100) NOT NULL COMMENT '章节标题',
  `novel_id` int(11) NOT NULL COMMENT '小说编号',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `count` int(11) DEFAULT NULL COMMENT '字数',
  `pre_chapter_id` int(11) DEFAULT '0',
  `next_chapter_id` int(11) DEFAULT '0',
  `is_free` int(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否免费',
  `cost` int(11) unsigned DEFAULT '0' COMMENT '收费章节收费多少书币',
  `add_time` int(11) unsigned NOT NULL COMMENT '更新时间戳',
  `content` text COMMENT '内容',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208423 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------
BEGIN;
INSERT INTO `chapter` VALUES (111, '第一章', '茶茶茶', 8, 0, NULL, -1, 112, 1, 0, 0, '<p>发科</p>');
INSERT INTO `chapter` VALUES (112, '第二章', '哈哈哈', 8, 0, NULL, 111, 113, 1, 0, 0, '发动发动时发生');
INSERT INTO `chapter` VALUES (113, '第三章', 'piapiapia', 8, 0, NULL, 112, -99, 0, 10, 0, 'papaappapaaaappaapa');
INSERT INTO `chapter` VALUES (208419, '第一章', '骚年的帅', 3735, 0, NULL, -1, 208420, 1, 0, 0, '风骚的夜晚开始了');
INSERT INTO `chapter` VALUES (208420, '第二章', '龙腾动手了', 3735, 0, NULL, 208419, 208421, 1, 0, 0, '<p>开着车，放着轻音乐，初升的太阳在远方，露出迷人的微笑。</p><p></p><p>白姐坐在副驾驶上，一会儿涂唇膏，一会儿画睫毛，还总是皱着眉头说：“哎哟，怎么越看越难看啊？小志，你说姐是不是变丑了啊？！”</p><p></p><p>我看着她，她就用那种似笑非笑的眼神看我；我知道，她这是想吸引我的注意，让我看她美不美，顺便再夸她两句。</p><p></p><p>她可真够可以的，虚荣心可不是一般的小哦！我就说：“哪里丑啊？怎么看怎么美；还有，你不要画那么多妆，都快不认识你了；你说咱俩登了记，回头阿川他们，要是对着结婚证一看，问我这女的是谁，那不就尴尬了？不知道的，还以为我跟二奶结婚了呢！”</p><p></p><p>听我这样说，她简直被气死了，伸手就掐我，咬着白牙就说：“你怎么这么坏？！姐画的妆有那么浓嘛？！”她拿着小镜子，一个劲儿地左右照，眉头皱着，可爱死了；我其实就是跟她开玩笑而已，没想到她还认真了。</p><p></p><p>我就说：“逗你呢，傻瓜！现在挺漂亮的，不化妆更漂亮。”</p><p></p><p>被我一夸，她有些脸红地底下头，扭扭捏捏说：“哪里漂亮啊？都要奔三了，老了，你看姐眼角，都开始有皱纹了呢！”</p><p></p><p>其实哪儿有啊，她皮肤好，而且会保养，不知道的，都以为她比我还小呢！我知道她故意要这么说，就是想让我跟她说点儿好听的。</p><p></p><p>女人真是一种奇怪的动物，就喜欢别人夸她美、夸她漂亮，喜欢听好话，再肉麻都能接受。我不知道其他女人是不是这样，但白姐就是这样的！</p><p></p><p>我就故意说：“是哦，确实有皱纹了，额头也有，下巴也有；姐，看来你真的老了……”</p><p></p><p>一听这个，她顿时就急了，她抬手掐着我胳膊，咬牙切齿地说：“哪里有皱纹？姐怎么没看到？你敢说姐老了，你个小坏蛋，你是不是故意这么说的？！”</p><p></p><p>正跟她闹着，我电话就响了；白姐帮我掏出来，看了一下说：“是秦总打的。”</p><p></p><p>我接过来，放到耳边说：“秦总，怎么了？大早上就来电话。”</p><p></p><p>电话那头，秦总语气急切地说：“小志，你快来公司，可能要出大事！”</p><p></p><p>“什么？！”我浑身一紧，放慢车速说，“老哥，到底怎么了？好好的能出什么大事？！”</p><p></p><p>秦总深吸了一口气说：“封虎那边动手了，龙腾也动手了，他们下了一盘大棋，大到令人震惊！你赶快回公司，咱们商量对策；倘若真有一步走错，后果不堪设想啊！”</p><p></p><p>我知道，秦总这人，从不开玩笑；他说要出大事，那肯定就是天大的事！龙腾集团到底做了什么，能让秦总这个纵横铝业多年的人，如此慌张？！</p><p></p><p>皱着眉，我咬咬牙说：“嗯，秦总，我一会儿就到公司。”</p><p></p><p>秦总赶紧嘱咐我说：“一定要抓紧，现在的时间，比任何时候都紧迫！”</p><p></p><p>挂掉电话，我心脏都跟着“砰砰”直跳；白姐看我脸色不好，赶紧问我说：“小志，怎么了？是不是出什么事了？”</p><p></p><p>我摇摇头，忍着心里的惊恐和疑惑，勉强挤出一丝微笑说：“没什么大事，咱们先去登记，完了以后回公司，秦总那边有事要找我商量。”</p><p></p><p>白姐就说：“要不…要不咱们先去公司吧，登记什么时候都行的；人家民政局又跑不了，姐…姐也跑不了，干嘛要这么着急啊？！”</p><p></p><p>我长舒了一口气说：“姐，我特别着急，恨不得现在就把你娶进门，知道吗？咱们之间，我再也承受不起任何伤害了，我要牢牢抓住你，咱们在一起，真正组建一个家庭，这是我这些年来，日思夜想都渴望的！”</p><p></p><p>“可是秦总那边……”白姐有些犹豫地说。</p><p></p><p>“没事，生意上的事，也不在乎这一会儿。”拍着她的手，我安慰她说。</p><p></p><p>到民政局的时候，还不到九点，人家还没上班；我和白姐站在外面的台阶上，她不知道公司发生了什么事，仍旧挺开心的；还拿手机，在民政局门口拍了张照片，然后传到空间里，发了条评论说：等了好久终于等到今天，梦了好久终于把梦实现……</p><p></p><p>我看着她的手机屏幕，她还挺有才的，引用了一首刘德华的歌词，然后再配上民政局的照片，竟然完美地把我们这份，几经挫折换来的爱情，表达的感人肺腑。</p><p></p><p>可我却没有心情，再去跟她开玩笑了；抽着烟，我眯着眼睛苦思冥想，就是想不出来，龙腾和封虎，他们究竟干了什么，能让秦总如此惊慌！</p><p></p><p>我们在白城，手里有那么多矿，还有小路他们这个，数一数二的产品设计团队；我和宋市长之间的事，还没有人知道；除了公司规模和资金，我觉得我不比龙腾差多少；有这么多硬实力在手，我就不相信，龙腾他还能吃了我！</p><p></p><p>九点钟的时候，民政局的门开了；但某些部门的办事效率，真的不敢恭维；他们又是要开电脑，又是要打扫卫生，又是要换工装；整整拖了半个小时，都还没有正式工作。</p><p></p><p>我简直被急死了，这些杂活，他们就不能早来半小时干吗？</p><p></p><p>今天是登记的日子，我不想发火，就很有礼貌地问工作人员说：“我们什么时候可以登记？”</p><p></p><p>那女的理了下头发说：“哦，过来登记的啊？！随时都可以。”说完，她拿抹布擦擦手，直接去了柜台前。</p><p></p><p>我：……</p><p></p><p>你特么随时都可以，干嘛不说一声？害得老子在这里，火急火燎等了大半天！</p><p></p><p>白姐就拉着我的手，朝我摇摇头，示意我不要上火；“赶紧登记吧，秦总还在公司等着呢。”</p><p></p><p>我长舒了一口浊气，在心里默默地告诉自己：今天是个好日子，一定要高兴，高兴……</p><p></p><p>拉着白姐，我们坐到了柜台前的椅子上，把户口本和身份证递了过去。</p><p></p><p>办事员接过证件，对着电脑敲了两下，突然一皱眉头说：“对不起王小志先生，您现在不能登记结婚……”</p>');
INSERT INTO `chapter` VALUES (208421, '第三章', '美女房客', 3735, 0, NULL, 208420, 208422, 1, 0, 0, '    <p>面试完后，简池正式成为ZY广告公司创意部旗下的一名员工，月薪3500。因为是刚面试完的缘故，可以不用立马上班，所以简池决定先回家，将自己的大房子租出两间，用来补贴自己的生活。</p>\n    <p></p>\n    <p>毕竟他从神秘组织退出之后，便不能再像往日过得那样潇洒，只能自己挣钱养活自己，因而钱能多一分就是一分，他是绝不会嫌少的！</p>\n    <p></p>\n    <p>离开ZY之后，简池去附近的地铁站，搭乘1号线，坐了一个小时的地铁之后，回到了自己位于蓝湾区的家。这里距离市中心并不是多远，而且周围环境不错，所以这里小区非常多，很多人都喜欢在这里租房住。</p>\n    <p></p>\n    <p>简池的家处在一个叫做香榭水岸的高档小区，面积有点大，220平，是一栋复式小别墅，是简池以前冒着危险偷偷做了几单大生意后，用佣金买下的，平常没人住，偶尔才有保姆去做保洁。</p>\n    <p></p>\n    <p>他从神秘组织退出以后，就扎根在这里，在这里开始新的生活！</p>\n    <p></p>\n    <p>去小区旁边的复印店打印出来几张写了必要信息的广告后，简池便将其贴在了小区的公告栏上，然后就回家睡大觉了。</p>\n    <p></p>\n    <p>当他脱下衣服正要睡觉的时候，没想到兜里的电话却响了起来，他拿出电话，按下接通键，电话那头传来一个十分好听的声音，请问是简先生么？</p>\n    <p></p>\n    <p>是，请问有什么事情么？简池问道。</p>\n    <p></p>\n    <p>那个我看见了你贴在公告栏上的广告，你是要出租房子么？电话那头的女生轻言细语地说道。</p>\n    <p></p>\n    <p>是的，你要租房子么？简池没想到这么快就有人来租房子了，心说哥也要当上了一个坐着收租的房东了！</p>\n    <p></p>\n    <p>嗯，请问我现在能来看看么？</p>\n    <p></p>\n    <p>当然可以啊，我这里的地址是32#！</p>\n    <p></p>\n    <p>好的！对面说完挂到了电话，手机传出一阵嘟嘟的忙音。</p>\n    <p></p>\n    <p>简池拿着手机，心想声音这么好听，一定是很漂亮的妹子，要是长得太对不起群众，说什么也不能租给她！</p>\n    <p></p>\n    <p>没过多久，门铃响了起来，简池走到玄关，打开了房门，一个穿着白衬衣搭配牛仔，长发披肩身材高挑戴着一副黑框眼镜的素颜女子落入简池的视线，第一眼映像并没有多么地惊艳，但是非常耐看，绝对是个70+的女生。</p>\n    <p></p>\n    <p>对方很有礼貌地和简池打了个招呼，然后自我介绍说叫李念奴，目前在一家杂志社做美食编辑。</p>\n    <p></p>\n    <p>你好，我叫简池！简池笑着说道，替对方拿出一双拖鞋，接着伸出手做了个请的动作。</p>\n    <p></p>\n    <p>李念奴换上拖鞋后，走进客厅，她望着宽大的巴洛克式客厅，不禁感叹了一句：真大啊，你一个住着不觉得空荡荡的么？</p>\n    <p></p>\n    <p>正因为觉得空荡荡的，所以才决定出租几间啊，反正楼上楼下一共有六间房子，我自己是用不完的！简池当然不会将他出租房子的真正理由说出来，那样只会让对方误会，你一个能买得起这么大房子的人，还能缺钱？</p>\n    <p></p>\n    <p>简池带着李念奴上了二楼慢悠悠地逛着，向她介绍着每个房间的用途，介绍完之后，简池看着她问道：怎么样？</p>\n    <p></p>\n    <p>李念奴点头，说了声不错，然后就问了在她心里憋了很久的问题，房租多少？</p>\n    <p></p>\n    <p>3000。简池思考了一下，说出了一个不高不低的租金。但是见对方听了价格后，犹豫不决的样子，于是开启了异能，偷听对方心里的想法。</p>\n    <p></p>\n    <p>一个月工资7000，生活费2000，存款1000，寄回家2000，就只剩下2000了，不够，哎，还是算了吧！</p>\n    <p></p>\n    <p>原来李念奴心里盘算着自己是否能够接受3000快的月租，简池想了一会儿，看在对方是一个既有孝心然后又长得不错的情况下，主动将价钱降到了两千，这样使得李念奴对他好感大增！</p>\n    <p></p>\n    <p>反正空着也是空着，多一个人住就多一分人气，而且我第一次租房子，就当是交个朋友吧！简池豪爽地说道。</p>\n    <p></p>\n    <p>那就先谢谢你了，待会签好合同，我就搬过来住！李念奴虽说对简池的印象不坏，但是该签的合同还是必须签的，不然对方到时候反悔，自己可就没地儿哭去了！</p>\n    <p></p>\n    <p>好的！简池去书房里找到纸和笔，稍稍思考后，便将一封合同书写好，随后两人都在上面签了名字。</p>\n    <p></p>\n    <p>签完合同后，李念奴输出一沓毛爷爷交给简池，然后大大方方地伸出手和他行了个握手礼，很高兴认识你！</p>\n    <p></p>\n    <p>我也很高兴认识你！简池笑着说道：你的东西多么，需要帮忙么？</p>\n    <p></p>\n    <p>不用了，我也没多少东西，我自己就行的！李念奴回答道。</p>\n    <p></p>\n    <p>说完，她就急匆匆地离开了这里，不知道去哪里搬行李了。</p>\n    <p></p>\n    <p>两个小时后，门铃声响起，正在看书的简池放下手中的武侠小说，走到玄关打开了房门，然后就被门外堆着的一对玩偶吓了一跳！他还从来没有见过一个人如此的喜欢玩偶呢，于是连忙搭手帮李念奴将十多个玩偶和行李搬进家里。</p>\n    <p></p>\n    <p>等将东西都搬进来之后，简池对李念奴说道：除了楼上的中间的房间，其余的房间你都可以住！</p>\n    <p></p>\n    <p>李念奴想了想，便要了2楼靠右的那间有阳台的房间，她喜欢晒太阳，所以就选了这间房。选好房间后，自然又是一番劳动，简池力气很大，没费多少工夫便将东西搬完，让李念奴在一边看得目瞪口呆！</p>\n    <p></p>\n    <p>你是做什么的啊？这么厉害！李念奴问道。</p>\n    <p></p>\n    <p>以前当过兵，现在在一家广告公司上班简池含糊其辞地回答道。</p>\n    <p></p>\n    <p>李念奴噢了一声，便自顾地整理起自己的小房间来，简池也识趣地离开了这个房间，去厨房里随便寻了点吃的填饱肚子过后，便回到自己的房间准备睡觉，他忽然想起得给李念奴一把钥匙，于是在抽屉里找到一把备用钥匙，走到李念奴的房间，推开门却发现对方正在脱自己的衬衫，露出紫色的Bra和一对盈盈一握的娇胸！</p>\n    <p></p>\n    <p>啊，不好意思，我是来送钥匙的！简池赶紧闭上眼，重新合上了门，心中懊悔自己为什么不先敲敲门在进去呢！这下可好了，对方肯定会认为自己是个大色狼！</p>\n    <p></p>\n    <p>过了一会儿，门打开了一条缝，李念奴伸出柔嫩的手示意简池将钥匙递过去。</p>\n    <p></p>\n    <p>简池将钥匙递到她手中过后，不小心碰到了李念奴的手，对方触电似的嗖地一下将手缩了回去，砰地一声将门也关上了。简池无奈地摊了摊手，悻悻地回到了自己的房间！</p>');
INSERT INTO `chapter` VALUES (208422, '第四章', '大完结', 3735, 0, NULL, 208421, -99, 1, 0, 0, '哈哈，完结了');
COMMIT;

-- ----------------------------
-- Table structure for free
-- ----------------------------
DROP TABLE IF EXISTS `free`;
CREATE TABLE `free` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `novel_id` int(11) unsigned NOT NULL COMMENT '书籍id，对应novel表的主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of free
-- ----------------------------
BEGIN;
INSERT INTO `free` VALUES (1, 3);
INSERT INTO `free` VALUES (2, 5);
INSERT INTO `free` VALUES (3, 6);
INSERT INTO `free` VALUES (4, 7);
INSERT INTO `free` VALUES (5, 8);
INSERT INTO `free` VALUES (6, 9);
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
) ENGINE=InnoDB AUTO_INCREMENT=3736 DEFAULT CHARSET=utf8;

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
INSERT INTO `novel` VALUES (3735, '近身特工', 1, 19, NULL, '简池打量着怀中的尤物，精致的五官，如丝的媚眼半睁半闭着，透出些许地迷离。简池伸出手，轻轻抚摸着怀里尤物的短发，然后一路向下，捏住尤物颈下的耸起，如同捏海绵一样捏出各种形状，他低下头准备轻吻怀中的女人，却意外地发现白色的床单上盛开着一朵鲜红的花，整个人顿时愣在了那里！', 'https://p.qirexiaoshuo.com/uploads/image/20160720/578eda0731826.jpg', 593828, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for purchase_log
-- ----------------------------
DROP TABLE IF EXISTS `purchase_log`;
CREATE TABLE `purchase_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '读者id',
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '书籍id',
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '章节id',
  `cost` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '花费',
  `ticket_before` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消费前书币',
  `ticket_after` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消费后书币',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_log
-- ----------------------------
BEGIN;
INSERT INTO `purchase_log` VALUES (3, 1, 8, 113, 10, 60, 50, 1511779493);
COMMIT;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL COMMENT '读者或用户id',
  `book_ticket` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '书币余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------
BEGIN;
INSERT INTO `ticket` VALUES (1, 200);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openid` varchar(32) NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '1', '亮', 'http://wx.qlogo.cn/mmopen/IJdPq631CVGeYWKp6jzCfJViabuYiaAKFITwDcL2icHum3l8HhJofYdeCOEnYgibWdWglfxpzibzom8XFxmoPMpsP70ZXrnu8qSeH/0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
