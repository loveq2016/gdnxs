<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
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
</html>

<script>

</script>
