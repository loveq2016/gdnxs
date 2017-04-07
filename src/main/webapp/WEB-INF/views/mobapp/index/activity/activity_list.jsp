<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动列表</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
    活动列表
    <br/>
${actCarousel}
    <br/>
${actList}
<br/>
    <c:forEach items="${actList}" var="act">
        <a href="${baseURL}/mob/index/act/detail?id=${act.id}">${act.id}${act.title}</a><br/>
    </c:forEach>
<a href="${baseURL}/mob/index/act/history/list.mvc">历史活动</a>
</body>
</html>

<script>

</script>
