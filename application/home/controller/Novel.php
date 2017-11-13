<?php
/*
 * 小说控制器
 */
namespace app\home\controller;
use \think\Request;
use app\home\model\Novel as NovelModel;
use app\home\model\Kind as KindModel;
use app\home\model\Author as AuthorModel;
use app\home\model\Chapter as ChapterModel;

class Novel{
	public function novelinfo(){
		$request = Request::instance();
		$p = $request->param();
		if(!isset($p['id']) || empty($p['id'])){
			return json([
				'error_code' => -1,	
				'error_msg'  => '请求参数错误'
			]);
		}
		$id = (int)$p['id'];
		$row = NovelModel::get($id);
		if(!isset($row) || empty($row)){
			return json([
				'error_code' => -1,	
				'error_msg'  => '未获取到小说数据'
			]);
		}

		//分类
		$kid = isset($row->kid)? $row->kid : 1;
		$k = KindModel::get($kid);
		$kind = isset($k->name)? $k->name : '';

		//作者
		$aid = isset($row->aid)? $row->aid : 1;
		$a = AuthorModel::get($aid); 
		$author = isset($a->name)? $a->name : '';

		//状态,默认0-已完结，1-连载中
		$state = '已完结';
		if($row->state == 1){
			$state = '连载中';
		}

		$data = [
			'id'		=> isset($row->id)? $row->id : 1,				//小说id
			'name'		=> isset($row->name)? $row->name : '',			//小说名
			'intro'		=> isset($row->intro)? $row->intro : '',		//小说简介
			'surface'	=> isset($row->surface)? $row->surface : '',	//小说封面图
			'click'		=> isset($row->click)? $row->click : '',		//小说点击量
			'kind'		=> $kind,										//分类
			'author'	=> $author,										//作者
			'state'		=> $state,										//状态
		];
		return view('novelinfo',['data' => $data]);
	}

	public function show(){
		/*
		 * 请求参数 novel_id
		 */
		$request = Request::instance();
		$p = $request->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return json([
				'error_code' => -1,	
				'error_msg'  => '请求参数错误'
			]);
		}
		$novelId = (int)$p['novel_id'];
		if(!isset($p['id']) || empty($p['id']) || $p['id'] == 'undefined'){
			$id = 5508;	
		}else{
			$id = (int)$p['id'];	
		}
		var_dump($id);
		$row = NovelModel::get($novelId);
		if(!isset($row) || empty($row)){
			return -1;
		}

		//书籍部分
		$novel = (isset($row) && !empty($row))? $row : NULL;

		//获取最近一次阅读,并更新缓存
		//此处可以参考sql目录中的bookrack，也就是阅读记录表。

		$lastRead = NULL;
		$data = [
			'last_read' => $lastRead,	
			'novel'     => $novel,
			'id'		=> $id //章节id
		];
		return view('show',['data' => $data]);
	}

	//根据小说id获取它所有的章节列表
	public function ajaxgetchapterlist(){
		$r = Request::instance();	
		$p = $r->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return -1;	
		}
		$nid = (int)$p['novel_id'];

		$rows = ChapterModel::all(['novel_id' => $nid]);
		return json_encode($rows);
	}

	//根据小说id，章节id获取具体的章节信息
	public function ajaxgetchapter(){
		$r = Request::instance();	
		$p = $r->param();
		if(!isset($p['novel_id']) || empty($p['novel_id'])){
			return json([
				'error_code' => -1,
				'error_msg'  => '请求参数错误'
			]);	
		}
		$nid = (int)$p['novel_id'];
		$cid = (int)$p['chapter_id'];
		
		/*
		$row = ChapterModel::get([
			'chapter_id'  => $cid,
			'novel_id' => $nid
		]);
		return json($row);
		*/
		$data = [
			'chapter_id' => 5508,
			'novel_id' => 27,
			'title' => '第310章 .龙腾动手了',
			'next_chapter_id' => 5509,
			'pre_chapter_id' => 5507,
			'order_set' => 310,
			'result' => 1,
			'chapter_name' => '.龙腾动手了',
			'chapter' => '第310章',
			'add_time' => '2017-10-31 21:48:44',
			'is_show' => 0,
			'workimg' => "http://becold.cn/Public/attached/2017/09/26/novel2017092659ca29048a4fc.jpg",
			'workname' => '透视村医',
			'workcontent' => '透视之眼，看遍天下美女！妙手村医，专治各种不服！小农民偶获异术，从此踏上逆袭之路……',
			'workurl' => "/Home/Novel/novelinfo/id/58",
			'content' => "p>开着车，放着轻音乐，初升的太阳在远方，露出迷人的微笑。</p><p></p><p>白姐坐在副驾驶上，一会儿涂唇膏，一会儿画睫毛，还总是皱着眉头说：“哎哟，怎么越看越难看啊？小志，你说姐是不是变丑了啊？！”</p><p></p><p>我看着她，她就用那种似笑非笑的眼神看我；我知道，她这是想吸引我的注意，让我看她美不美，顺便再夸她两句。</p><p></p><p>她可真够可以的，虚荣心可不是一般的小哦！我就说：“哪里丑啊？怎么看怎么美；还有，你不要画那么多妆，都快不认识你了；你说咱俩登了记，回头阿川他们，要是对着结婚证一看，问我这女的是谁，那不就尴尬了？不知道的，还以为我跟二奶结婚了呢！”</p><p></p><p>听我这样说，她简直被气死了，伸手就掐我，咬着白牙就说：“你怎么这么坏？！姐画的妆有那么浓嘛？！”她拿着小镜子，一个劲儿地左右照，眉头皱着，可爱死了；我其实就是跟她开玩笑而已，没想到她还认真了。</p><p></p><p>我就说：“逗你呢，傻瓜！现在挺漂亮的，不化妆更漂亮。”</p><p></p><p>被我一夸，她有些脸红地底下头，扭扭捏捏说：“哪里漂亮啊？都要奔三了，老了，你看姐眼角，都开始有皱纹了呢！”</p><p></p><p>其实哪儿有啊，她皮肤好，而且会保养，不知道的，都以为她比我还小呢！我知道她故意要这么说，就是想让我跟她说点儿好听的。</p><p></p><p>女人真是一种奇怪的动物，就喜欢别人夸她美、夸她漂亮，喜欢听好话，再肉麻都能接受。我不知道其他女人是不是这样，但白姐就是这样的！</p><p></p><p>我就故意说：“是哦，确实有皱纹了，额头也有，下巴也有；姐，看来你真的老了……”</p><p></p><p>一听这个，她顿时就急了，她抬手掐着我胳膊，咬牙切齿地说：“哪里有皱纹？姐怎么没看到？你敢说姐老了，你个小坏蛋，你是不是故意这么说的？！”</p><p></p><p>正跟她闹着，我电话就响了；白姐帮我掏出来，看了一下说：“是秦总打的。”</p><p></p><p>我接过来，放到耳边说：“秦总，怎么了？大早上就来电话。”</p><p></p><p>电话那头，秦总语气急切地说：“小志，你快来公司，可能要出大事！”</p><p></p><p>“什么？！”我浑身一紧，放慢车速说，“老哥，到底怎么了？好好的能出什么大事？！”</p><p></p><p>秦总深吸了一口气说：“封虎那边动手了，龙腾也动手了，他们下了一盘大棋，大到令人震惊！你赶快回公司，咱们商量对策；倘若真有一步走错，后果不堪设想啊！”</p><p></p><p>我知道，秦总这人，从不开玩笑；他说要出大事，那肯定就是天大的事！龙腾集团到底做了什么，能让秦总这个纵横铝业多年的人，如此慌张？！</p><p></p><p>皱着眉，我咬咬牙说：“嗯，秦总，我一会儿就到公司。”</p><p></p><p>秦总赶紧嘱咐我说：“一定要抓紧，现在的时间，比任何时候都紧迫！”</p><p></p><p>挂掉电话，我心脏都跟着“砰砰”直跳；白姐看我脸色不好，赶紧问我说：“小志，怎么了？是不是出什么事了？”</p><p></p><p>我摇摇头，忍着心里的惊恐和疑惑，勉强挤出一丝微笑说：“没什么大事，咱们先去登记，完了以后回公司，秦总那边有事要找我商量。”</p><p></p><p>白姐就说：“要不…要不咱们先去公司吧，登记什么时候都行的；人家民政局又跑不了，姐…姐也跑不了，干嘛要这么着急啊？！”</p><p></p><p>我长舒了一口气说：“姐，我特别着急，恨不得现在就把你娶进门，知道吗？咱们之间，我再也承受不起任何伤害了，我要牢牢抓住你，咱们在一起，真正组建一个家庭，这是我这些年来，日思夜想都渴望的！”</p><p></p><p>“可是秦总那边……”白姐有些犹豫地说。</p><p></p><p>“没事，生意上的事，也不在乎这一会儿。”拍着她的手，我安慰她说。</p><p></p><p>到民政局的时候，还不到九点，人家还没上班；我和白姐站在外面的台阶上，她不知道公司发生了什么事，仍旧挺开心的；还拿手机，在民政局门口拍了张照片，然后传到空间里，发了条评论说：等了好久终于等到今天，梦了好久终于把梦实现……</p><p></p><p>我看着她的手机屏幕，她还挺有才的，引用了一首刘德华的歌词，然后再配上民政局的照片，竟然完美地把我们这份，几经挫折换来的爱情，表达的感人肺腑。</p><p></p><p>可我却没有心情，再去跟她开玩笑了；抽着烟，我眯着眼睛苦思冥想，就是想不出来，龙腾和封虎，他们究竟干了什么，能让秦总如此惊慌！</p><p></p><p>我们在白城，手里有那么多矿，还有小路他们这个，数一数二的产品设计团队；我和宋市长之间的事，还没有人知道；除了公司规模和资金，我觉得我不比龙腾差多少；有这么多硬实力在手，我就不相信，龙腾他还能吃了我！</p><p></p><p>九点钟的时候，民政局的门开了；但某些部门的办事效率，真的不敢恭维；他们又是要开电脑，又是要打扫卫生，又是要换工装；整整拖了半个小时，都还没有正式工作。</p><p></p><p>我简直被急死了，这些杂活，他们就不能早来半小时干吗？</p><p></p><p>今天是登记的日子，我不想发火，就很有礼貌地问工作人员说：“我们什么时候可以登记？”</p><p></p><p>那女的理了下头发说：“哦，过来登记的啊？！随时都可以。”说完，她拿抹布擦擦手，直接去了柜台前。</p><p></p><p>我：……</p><p></p><p>你特么随时都可以，干嘛不说一声？害得老子在这里，火急火燎等了大半天！</p><p></p><p>白姐就拉着我的手，朝我摇摇头，示意我不要上火；“赶紧登记吧，秦总还在公司等着呢。”</p><p></p><p>我长舒了一口浊气，在心里默默地告诉自己：今天是个好日子，一定要高兴，高兴……</p><p></p><p>拉着白姐，我们坐到了柜台前的椅子上，把户口本和身份证递了过去。</p><p></p><p>办事员接过证件，对着电脑敲了两下，突然一皱眉头说：“对不起王小志先生，您现在不能登记结婚……"
		];
		return json($data);
	}
}
