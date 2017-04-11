<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>通知</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
通知
<br/>
<c:forEach items="${noticelist}" var="notice">
    <a href="${baseURL}/mob/usermain/notice/detail?id=${notice.id}">${notice.title}</a><br/>
</c:forEach>

    <br/>
    <a href="${baseURL}/mob/usermain/msg/list">消息</a><br/>
</body>
</html>

<script>

</script>
