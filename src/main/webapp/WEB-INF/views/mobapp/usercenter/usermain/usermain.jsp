<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>个人中心</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
    个人中心
    <br/>
<a href="${baseURL}/mob/usermain/userinfo.mvc">个人资料</a><br/>
    <a href="${baseURL}/mob/usermain/notice/list">消息</a><br/>
    <a href="${baseURL}/mob/usermain/faq/list">联系客服</a><br/>
</body>
</html>--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 适应移动端end -->
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>

<body class="bg">
<a href="${baseURL}/mob/usermain/userinfo.mvc" class="unbound_portrait_box clearfix">
    <div class="clearfix">
        <div class="head_portrait fl">
            <img src="${baseURL}${_sysuserinfo.avatar}" alt="头像"/>
        </div>
        <div class="avatar_info fl clearfix">
            <h3 class="unbound">${_sysuserinfo.name}</h3>
            <p>${_sysuserinfo.work}</p>
        </div>
    </div>

</a>

<div class="per_center_fill">
    <a href="${baseURL}/mob/usermain/notice/list" class="perfect_info_item bg_ico_right clearfix">
        <i class="ico_info fl"></i>
        <h3 class="fl">消息</h3>

    </a>
    <a href="${baseURL}/mob/usermain/faq/list" class="perfect_info_item bg_ico_right clearfix">
        <div class="ico_service fl"></div>
        <h3 class="fl">联系客服</h3>

    </a>
</div>


</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>

