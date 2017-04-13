<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>通知详情</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
通知详情
<br/>
${notice}
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

<body>
<div class="details_page">
    <p class="details_page_title">${notice.title}</p>
    <div class="activity_time_num clearfix">
        <span class="fl">发布时间：<fmt:parseDate value="${notice.createdate}" var="createdate"></fmt:parseDate>
                        <fmt:formatDate value="${createdate}" pattern="yyyy-MM-dd"></fmt:formatDate>
        <%--<span class="fr"><i class="ico_activity_num"></i>${act.actmemberCount}人</span>--%>
    </div>
    <div>
        ${notice.ndesc}
    </div>
    <c:if test="${!empty notice.attachmentname}">
        <div>
            <p>附件信息：</p>
            <p><a href="${baseURL}${notice.attachment}">${notice.attachmentname}</a></p>
        </div>
    </c:if>
</div>

</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
