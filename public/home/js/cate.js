// 分类却换显示所有分类
function show_cate_all(obj){
    var c_show = $(obj).attr("isshow");
    if(c_show == 1){
        $(obj).attr("isshow","2");
        $(obj).html("收起<i class='icon-retract'></i>");
        $("#cate_box").addClass("classifying");
        $("#cate_box li").show();
    }else{
        $(obj).attr("isshow","1");
        $(obj).html("展开<i class='icon-open'></i>");
        $("#cate_box").addClass("classifying");
        $("#cate_box li").hide();
        $("#cate_box li").eq(0).show();
        $("#cate_box li").eq(1).show();
        $("#cate_box li").eq(2).show();
        $("#cate_box li").eq(3).show();
    }
}

$(function () {
    // 滚动到底部获取新的分页
    var url = "/Category/ajaxGetNovelList";
    console.log(url);
    var data = {tid:tid,vip:vip,end:end,p:p}
    if(p == 1){
        get_page_data(url,data);
    }
    list_page(url,data);
    // 选择分类显示
    $("#cate_option .entry li a").click(function(){
        var p_entry = $(this).parents('.entry');
        p_entry.find("li a").removeClass("active");
        $(this).addClass("active");
        var c_type = $(this).attr('type');
        var c_val = $(this).attr('val');
        if(c_type == 'tid'){
            tid = c_val;
        }
        if(c_type == 'vip'){
            vip = c_val;
        }
        if(c_type == 'end'){
            end = c_val;
        }
        p = 1;
        $("#html_box").empty();
        data['p'] = p;
        data['end'] = end;
        data['vip'] = vip;
        data['tid'] = tid;
        console.log(data);
        get_page_data(url,data);
        //var href_url = "/Book/book_cate?tid="+tid+"&vip="+vip+"&end="+end;
        //window.location.href = href_url;
    });
});