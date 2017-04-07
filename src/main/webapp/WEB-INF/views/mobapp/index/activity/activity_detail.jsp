<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>活动明细</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
    活动明细
    <br/>
${act}
    <br/>
    <a href="${baseURL}/mob/index/act/desc?id=${act.id}">活动简介</a>
    <br/>
${actmemberlist}
<br/>
    <c:forEach items="${actmemberlist}" var="member">
        <a href="${baseURL}/mob/index/act/member/detail?id=${member.id}&actid=${act.id}">${member.no},${member.votenum}</a>
        <a href="#">投我一票</a>
        <br/>
    </c:forEach>

    ${actphotolist}
    <br/>
    <c:forEach items="${actphotolist}" var="photo">
        <img src="${baseURL}/${photo.purl}"> <br/>
    </c:forEach>
<a href="${baseURL}/mob/index/act/history/list.mvc">历史活动</a><br/>
    <a href="${baseURL}/mob/index/act/top.mvc?id=${act.id}">活动排行</a>
</body>
</html>

<script>

</script>
