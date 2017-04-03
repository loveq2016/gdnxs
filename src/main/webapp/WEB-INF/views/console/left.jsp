<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/commons/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单</title>
<link href="${baseURL}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseURL}/staticresjs/jquery.js"></script>
</head>

<body style="background:#f0f9fd;">
	<%--<div class="lefttop"><span></span>工作台</div>--%>

    <dl class="leftmenu" id="munu"> </dl>

    <%--<dd>--%>
    <%--<div class="title"  >--%>
    <%--<span><img src="${baseURL}/staticres/images/leftico01.png" /></span>管理信息--%>
    <%--</div>--%>
    	<%--<ul class="menuson">--%>
        <%--<li><cite><src/cite><a href="${baseURL}/index.html" target="rightFrame">首页模版</a><i></i></li>--%>
        <%--<li class="active"><cite></cite><a href="${baseURL}/right.html" target="rightFrame">数据列表</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/imgtable.html" target="rightFrame">图片数据表</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/form.html" target="rightFrame">添加编辑</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/imglist.html" target="rightFrame">图片列表</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/imglist1.html" target="rightFrame">自定义</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/tools.html" target="rightFrame">常用工具</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/filelist.html" target="rightFrame">信息管理</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/tab.html" target="rightFrame">Tab页</a><i></i></li>--%>
        <%--<li><cite></cite><a href="${baseURL}/error.html" target="rightFrame">404页面</a><i></i></li>--%>
        <%--</ul>--%>
    <%--</dd>--%>

    <%--<dd>--%>
    <%--<div class="title">--%>
    <%--<span><img src="${baseURL}/staticres/images/leftico02.png" /></span>其他设置--%>
    <%--</div>--%>
    <%--<ul class="menuson">--%>
        <%--<li><cite></cite><a href="#">编辑内容</a><i></i></li>--%>
        <%--<li><cite></cite><a href="#">发布信息</a><i></i></li>--%>
        <%--<li><cite></cite><a href="#">档案列表显示</a><i></i></li>--%>
        <%--</ul>--%>
    <%--</dd>--%>

        <%--<dd>--%>
            <%--<div class="title">--%>
                <%--<span><img src="${baseURL}/staticres/images/leftico02.png" /></span>测试看看--%>
            <%--</div>--%>
            <%--<ul class="menuson">--%>
                <%--<li><cite></cite><a href="#">测试用的</a><i></i></li>--%>
                <%--<li><cite></cite><a href="#">可以用吗</a><i></i></li>--%>
                <%--<li><cite></cite><a href="#">真的啊</a><i></i></li>--%>
            <%--</ul>--%>
        <%--</dd>--%>

    <%--</dl>--%>

</body>
<script type="text/javascript">
    /*$(function(){
     //导航切换
     $(".menuson li").click(function(){
     $(".menuson li.active").removeClass("active");
     $(this).addClass("active");
     });

     $('.title').click(function(){
     var $ul = $(this).next('ul');
     $('dd').find('ul').slideUp();
     if($ul.is(':visible')){
     $(this).next('ul').slideUp();
     }else{
     $(this).next('ul').slideDown();
     }
     });
     })*/


    $(document).ready(function() {
        $.ajax({
            type: "get",
            dataType: "json",
            url: baseURL + "/console/loadMenu.mvc",
            success: function (res) {
                if(res.code=="0"||res.code=="2"){
                    alert(res.desc);
                    return;
                }
                var data = res.data||res;
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $('#munu').append("<dd id='" + i + "'><div class='title' id="+data[i].id+"> <span></span>" + data[i].name + "</div>");
                        $('#munu').find('#' + i + '').append('<ul class="menuson">');
                        for (var j = 0; j < data[i].items.length; j++) {
                            if (data[i].items[j].href == "") {
                                $('#munu').find('#' + i + '').find("ul").append('<li><cite></cite><a>' + data[i].items[j].name + '</a><i></i></li>');
                            } else {
                                $('#munu').find('#' + i + '').find("ul").append('<li><cite></cite><a href="' + data[i].items[j].href + '"id="' + data[i].items[j].id + '" target="' + data[i].items[j].target + '">' + data[i].items[j].name + '</a><i></i></li>');
                            }
                        }
                        $('#munu').append("</dd>");
                    }
                }

                //导航切换
                $(".treeview_menu li").click(function () {
                    alert(12);
                    $(".treeview_menu li.active").removeClass("active");
                    $(this).addClass("active");
                });

                $('.title').unbind().click(function () {
                	var $ul = $(this).next('ul');
                    $('dd').find('ul').slideUp();
                    if ($ul.is(':visible')) {
                        $(this).next('ul').slideUp();
                    } else {
                        $(this).next('ul').slideDown();
                    }
                });
                
            }
        });
    });
</script>
</html>
