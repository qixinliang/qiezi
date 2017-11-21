/**
 * 章节目录
 * @Author wzb 2017/4/12.
 */
// 列表分页获取
var autoready=1;
function chat_list_page(url,data){
    $(window).bind("scroll", function (event) {
        //滚动条到网页头部的 高度，兼容ie,ff,chrome
        var top = document.documentElement.scrollTop + document.body.scrollTop;
        var textheight = $(document).height();  //网页的高度
        // 网页高度-top-当前窗口高度
        if (textheight - top - $(window).height() <= 60){
            if(autoready==1) {
                autoready=0;
//              window.scrollTo(0,document.body.scrollHeight);
                // 请求分页数据
                chapList_data(url,data);
            }
        }
    });
}

// 章节目录请求分页数据
function chapList_data(url,data){
    AjaxJson(url,data,function(res){
        if(res.status*1 == 1){
            p++;
            data['p'] = p;
            autoready = 1;
            $('#html_box').append(res.data.html);
            $('#bh_chat_count').html(res.data.count);
            //to_page = parseInt(res.data.to_page)*1;
            //$('#bh_chat_page_to').html(p+"/"+to_page);
            //$('#page_num').val(p);

        }else{
            console.log(res.info)
            //bh_msg_tips(res.info);
        }
    })
}

// 上一页
function chat_prve_page(){
    p--;
    if(parseInt(p)<1){
        return;
    }
    var data = {bid:bid,sort:sort,cid:cid,p:p}
    chapList_data(url,data);
}

// 下一页
function chat_next_page(){
    p++;
    if(parseInt(p)>to_page){
        return;
    }
    var data = {bid:bid,sort:sort,cid:cid,p:p}
    chapList_data(url,data);
}
// 跳转
function page_bh_num(){
    p = $('#page_num').val();
    if(parseInt(p)<1){
        p = 1
    }
    if(parseInt(p)>to_page){
        p = to_page
    }
    var data = {bid:bid,sort:sort,cid:cid,p:p}
    chapList_data(url,data);
}

//正序
function chat_asc_list(obj){
    $("#sort_box a").removeClass("active");
    $(obj).addClass("active");
    p = 1;
    var data = {bid:bid,sort:1,cid:cid,p:1}
    chapList_data(url,data);
}
//倒序
function chat_desc_list(obj){
    $("#sort_box a").removeClass("active");
    $(obj).addClass("active");
    var data = {bid:bid,sort:0,cid:cid,p:1}
    chapList_data(url,data);
}
