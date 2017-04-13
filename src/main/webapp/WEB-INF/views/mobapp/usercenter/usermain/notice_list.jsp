<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
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
</html>--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 适应移动端end -->
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>

<body class="bg">

<div class="rating_tab clearfix">
    <ul class="clearfix">
        <li onclick="location.href='${baseURL}/mob/usermain/notice/list'" class="this_tab">通知</li>
        <li onclick="location.href='${baseURL}/mob/usermain/msg/list'">消息</li>
    </ul>
</div>
<div class="info_centre_box">
    <div class="info_centre">
        <ul>
            <c:forEach items="${noticelist}" var="notice">
                <li onclick="location.href='${baseURL}/mob/usermain/notice/detail?id=${notice.id}'">
                    <h3>${notice.title}</h3>
                    <p><fmt:parseDate value="${notice.createdate}" pattern="yyyy-MM-dd HH:mm:ss" var="createdate"></fmt:parseDate>
                        <fmt:formatDate value="${createdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="info_centre_box"></div>


</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
