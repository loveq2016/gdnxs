<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
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

</script>--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 适应移动端end -->
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>

<body class="bg">
<div class="ranking_title">常见问题</div>
<div class="validation_info_box">
    <c:forEach items="${faqlist}" var="faq" varStatus="index">
    <a href="${baseURL}/mob/usermain/faq/detail?id=${faq.id}" class="perfect_info_item bg_ico_right clearfix">
        <h3>${index.index+1}.${faq.title}</h3>
    </a>
    </c:forEach>
</div>
<div class="per_center_fill">
    <a href="javascript:;" class="perfect_info_item bg_ico_right clearfix">
        <i class="ico_service fl"></i>
        <h3 class="fl">客服热线</h3>
    </a>
</div>




</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
