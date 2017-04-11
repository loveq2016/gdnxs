<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>联系客服</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
联系客服
<br/>
<c:forEach items="${faqlist}" var="faq">
    <a href="${baseURL}/mob/usermain/faq/detail?id=${faq.id}">${faq.title}</a><br/>
</c:forEach>

    <br/>
</body>
</html>

<script>

</script>
