<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动排行</title>
    <%@include file="../../common/app_common.jsp" %>



</head>

<body>
    <br/>
${acttoplist}
    <br/>
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


<div class="ranking_title">排行</div>
<c:forEach items="${acttoplist}" var="member">
<div class="ranking_info clearfix">
    <div class="serial_num fl">1</div>
    <div class="ranking_img fl">
        <img src="${baseURL}${member.avatar}" alt=""/>
    </div>
    <div class="ranking_per fl">
        <h3>${member.name}</h3>
        <p>${member.no}号</p>
    </div>
    <span class="poll_num fr">${member.votenum}</span>
</div>
</c:forEach>
<%@include file="../../common/footer_common.jsp" %>
<%@include file="../../common/footer_tip.jsp" %>
</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>

