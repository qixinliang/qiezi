/**
 * 书架js
 * @author wzb 2017/4/11.
 */
//显示删除
function show_shelf_edit(){
    //$(".book_shelf_box .item a").attr('')
    $('.edit_shelf').show();
    $('.hide_edit_shelf').hide();
}
//隐藏删除
function hide_shelf_edit(){
    $('.hide_edit_shelf').show();
    $('.edit_shelf').hide();
    hide_delete_lay();
}

//显示删除提示框
function show_delete_lay(cur_ids){
    $('.delete_msg').show();
    if(parseInt(cur_ids)*1>0){
        $('.delete_msg .delte').attr("ids",cur_ids);
    }
}
//隐藏删除提示框
function hide_delete_lay(){
    $('.delete_msg').hide();
}

// 选中删除书籍提示确认
function delete_shelf(obj){
    var cur_ids = $(obj).attr("ids") || 0;
    if(parseInt(cur_ids)*1<1){
        return false;
    }
    show_delete_lay(cur_ids);
}

// 确定移除书籍
function delete_shelf_do(obj){
    var ids = [];
    var cur_ids = $(obj).attr("ids") || 0;
    if(parseInt(cur_ids)*1<1){
        return false;
    }
    ids.push(cur_ids);//将选中的值添加到数组chk_value中
    ids = JSON.stringify(ids);
    var url = "/Book/ajax_del_book_shelf";
    var data = {ids:ids}
    AjaxJson(url,data,function(res){
        hide_delete_lay();
        if(res.status*1 == 1){
            $("#shelf"+cur_ids).remove();
        }else{
            bh_msg_tips(res.info);
        }
    })
}
// 最近阅读加入书架并跳转到阅读页
function recent_read_addshelf(obj,bid,cid){
    if( bid<1){
        return false;
    }
    var userbookurl = "/Comment/add_user_book_shelf";
    var userbookdata = {bid:bid,cid:cid,sort:0}
    AjaxJson(userbookurl,userbookdata,function(res){
        if(res.status == 1){
            $(obj).addClass('active');
            $(obj).html('已追书');
            $(obj).attr('onclick','javascript:;');
        }else{
            bh_msg_tips('加入书架失败');
        }
    })
}
