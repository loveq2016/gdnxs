<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动简介</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
    活动简介
    <br/>
${act}
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

<body>
<div class="details_page">
    <p class="details_page_title">${act.title}</p>
    <div class="activity_time_num clearfix">
        <span class="fl">活动时间：<fmt:parseDate value="${act.createdate}" var="createdate"></fmt:parseDate>
                        <fmt:formatDate value="${createdate}" pattern="yyyy-MM-dd"></fmt:formatDate> -
                    <fmt:parseDate value="${act.endTime}" var="endTime"></fmt:parseDate>
                        <fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
        <span class="fr"><i class="ico_activity_num"></i>${act.actmemberCount}人</span>
    </div>
    <div>
        ${act.activiyDesc}
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
