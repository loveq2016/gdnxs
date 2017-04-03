<%@ page import="cn.com.gzqinghui.sysmgr.sysmgr.model.SysUserInfo" %>
<%@ page import="cn.com.gzqinghui.sysmgr.core.AppContext" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%
    SysUserInfo user = AppContext.getCurrentUser();
    pageContext.setAttribute("name", user.getName());
    pageContext.setAttribute("userId", user.getId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en">
    <meta charset="UTF-8">
    <title>首页</title>
    <%@include file="../../../jsp/common/css_common.jsp"%>
    <link rel="stylesheet" type="text/css" href="${baseURL}/staticres/css/jedate.css">
    <style type="text/css">
        .htmlModal {
            margin: 10px auto;
        }
    </style>

</head>
<body>
<div class="main_header">
    <div class="logo_wifi">
        <div class="wifi_bomb_box">
            <div class="wifi_bomb_list">

                <%-- <div class="wifi_bomb_box_con" onclick="openMenu('轨迹查询')">
                    <img src="${baseURL }/images/path_query.png">轨迹查询
                </div>
                <div class="wifi_bomb_box_con">
                    <img src="${baseURL }/images/cross_collision.png">交叉碰撞
                </div>
                <div class="wifi_bomb_box_con">
                    <img src="${baseURL }/images/total_collection.png">采集总量
                </div>
                <div class="wifi_bomb_box_con">
                    <img src="${baseURL }/images/concomitant_analysis.png">伴随分析
                </div> --%>
                <div style="clear: both;"></div>
            </div>
            <%-- <div class="add_function_con" onclick="loadHotKeyFunc(this)">
                <img src="${baseURL }/images/add_function.png">添加常用功能
                    <div class="add_function" style="display: none">
                        <ul>
                            <li><input type="checkbox">设备管理</li>
                            <li><input type="checkbox">场地管理</li>
                            <li><input type="checkbox">用户管理</li>
                            <li><input type="checkbox">菜单管理</li>
                            <li><input type="checkbox">功能管理</li>
                            <li><input type="checkbox">图标数据</li>
                            <li><input type="checkbox">列表数据</li>
                            <li><input type="checkbox">车牌白名单</li>
                            <li><input type="checkbox">布控事件</li>
                        </ul>
                        <a href="javascript:;" class="btn_confirm"
                            onclick="addHotkeyMenu()">确 认</a>
                    </div>
            </div> --%>
        </div>
    </div>
    <div class="content_tabs">
        <ul id="tabs">
        </ul>
    </div>

    <div class="login_account">${name}</div>
    <div class="quit_account">
        <div class="quit_account_con">您好：<span class="username">${name}</span></div>
        <div class="quit_login">
            <a href="javascript:;" onclick="modifyPassword()">修改密码</a>
        </div>
        <div class="quit_login">
            <a href="javascript:logout();" type="button">退出登录</a>
        </div>
    </div>
    <%-- <div class="info_alarm" onclick="showWarningList(this)"
        hf="${baseURL }/jsp/warning/warning_list.jsp" rel="10000">
        <i>报警消息</i><span id="index_warning_total"></span>
    </div> --%>
</div>
<div class="index_container">
    <div class="main_sidebar">

        <!-- <dl class="leftmenu" id="munu"> </dl>
        <ul class="sidebar_menu"> -->
        <ul class="sidebar_menu	" id="munu">
            <!-- <li class="treeview"><a href="javascript:;"> -->
            <%-- <img src="${baseURL}/staticres/images/ico_query.png">数据查询<s class="iGuide"></s></a>
                <ul class="treeview_menu">
                    <li><a href="javascript:;" rel="one">MAC查询</a></li>
                    <li><a href="javascript:;" rel="two">AP查询</a></li>
                    <li><a href="javascript:;" rel="three">虚拟身份查询</a></li>
                </ul></li>
            <li class="treeview"><a href="javascript:;"><img
                    src="${baseURL}/staticres/images/data_analysis.png">数据分析<s
                        class="iGuide"></s></a>
                <ul class="treeview_menu">
                    <li><a href="javascript:;" rel="four">轨迹查询</a></li>
                    <li><a href="javascript:;" rel="five">交叉碰撞</a></li>
                    <li><a href="javascript:;" rel="six">伴随分析</a></li>
                </ul></li>
            <li class="treeview"><a href="javascript:;"><img
                    src="${baseURL}/staticres/images/control_settings.png">布控设置<s
                        class="iGuide"></s></a>
                <ul class="treeview_menu">
                    <li><a href="javascript:;" rel="seven">布控事件</a></li>
                    <li><a href="javascript:;" rel="eight">特征白名单</a></li>
                    <li><a href="javascript:;" rel="nine">车牌白名单</a></li>
                </ul></li>
            <li class="treeview"><a href="javascript:;"><img
                    src="${baseURL}/staticres/images/place_equipment.png">场所设备<s
                        class="iGuide"></s></a>
                <ul class="treeview_menu">
                    <li><a href="javascript:;" rel="ten">场所管理</a></li>
                    <li><a href="javascript:;" rel="eleven">设备管理</a></li>
                </ul></li>
            <li class="treeview"><a href="javascript:;"><img
                    src="${baseURL}/staticres/images/info_statistics.png">信息统计<s
                        class="iGuide"></s></a>
                <ul class="treeview_menu">
                    <li><a href="javascript:;" rel="twelve">图表形式</a></li>
                    <li><a href="javascript:;" rel="thirteen">列表形式</a></li>
                </ul></li>
            <li class="treeview"><a href="javascript:;"><img
                    src="${baseURL}/staticres/images/info_statistics.png">系统管理<s
                        class="iGuide"></s></a>
                <ul class="treeview_menu">
                    <li><a href="javascript:;" rel="fourteen">用户管理</a></li>
                    <li><a href="javascript:;" rel="fifteen">功能管理</a></li>
                </ul>--%>
            <!-- </li> -->
        </ul>
        <%--<ul class="sidebar_menu" style="display: block;"><li class="treeview"><a href="javascript:;"><img src="/wifi/images/data_analysis.png">数据分析<s class="iGuide"></s></a><ul class="treeview_menu" style=""><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/analyse/follow.jsp" rel="00">伴随分析</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/analyse/maccrashtaskinfo.jsp" rel="01">交叉碰撞</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/analyse/trail.jsp" rel="02">轨迹查询</a></li></ul></li><li class="treeview"><a href="javascript:;"><img src="/wifi/images/control_settings.png">布控设置<s class="iGuide"></s></a><ul class="treeview_menu" style=""><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/event/event_list.jsp" rel="10">布控事件</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/netwhite/netwhite_list.jsp" rel="11">特征白名单</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/vehwhite/vehwhite_list.jsp" rel="12">车牌白名单</a></li></ul></li><li class="treeview"><a href="javascript:;"><img src="/wifi/images/place_equipment.png">场所设备<s class="iGuide"></s></a><ul class="treeview_menu" style=""><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/device/device_list.jsp" rel="20">设备管理</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/place/place_list.jsp" rel="21">场所管理</a></li></ul></li><li class="treeview"><a href="javascript:;"><img src="/wifi/images/info_statistics.png">信息统计<s class="iGuide"></s></a><ul class="treeview_menu" style=""><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/chart/chart_list.jsp" rel="30">图表形式</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/deviceList/deviceList_list.jsp" rel="31">列表形式</a></li></ul></li><li class="treeview"><a href="javascript:;"><img src="/wifi/images/info_statistics.png">系统管理<s class="iGuide iGuide_cur"></s></a><ul class="treeview_menu" style="display: block;"><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/menu/menu_list.jsp" rel="40">菜单管理</a></li><li style="background: rgb(0, 153, 204);"><a href="javascript:;" hf="/wifi/jsp/role/role_list.jsp" rel="41">角色管理</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/dept/dept_list.jsp" rel="42">单位管理</a></li><li style="background: rgb(41, 48, 56);"><a href="javascript:;" hf="/wifi/jsp/user/user_list.jsp" rel="43">用户管理</a></li></ul></li></ul>--%>
        <div class="sidebar_toggle"></div>
    </div>
    <div class="content_wrapper  ">
        <!-- 	<div class="home_page" >
            共<span id="index_sb_total">12580</span>台设备 <i class="normal_round"></i>正常
            <span id="index_sb_devicesNormal">12562</span>台 <i
                class="abnormal_round"></i>异常<span id="index_sb_devicesError">12</span>台
        </div> -->
        <div id="content" class=" "></div>
    </div>
</div>
</body>

</html>

<%@include file="../../../jsp/common/js_common.jsp"%>

<script type="text/javascript" defer>
    var page_global = {};//全局页面操作对象,请将常用数据挂载在这个对象
    function changeSrc(){
        $.ajax({
            url:'${baseURL}/sysextmgr/dict/listAll.mvc'
            ,method:"post"
            ,dataType:"json"
            ,data:{"${_csrf.parameterName}":"${_csrf.token}"}
            ,success:function(res){
                //console.info(res);
                if(!res||!res.data) return;
                page_global.dict_constants = res.data;
            }
        })
    }
    window.onload = changeSrc;
</script>
<script src="${baseURL}/staticres/js/geoconv.min.js" type="text/javascript"></script>
<script src="${baseURL}/staticres/js/main.js" type="text/javascript"></script>
<script src="${baseURL}/staticres/js/index.js" type="text/javascript"></script>

<script type="text/javascript">
    var userId="${userId}";
</script>




