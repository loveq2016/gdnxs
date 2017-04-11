<%@ page import="java.net.URLDecoder" %>
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

<body  class="bg">
    <div class="pop_flexbg"></div>
    <div class="search_page">
        <input type="text" id="keyword" value="<%=URLDecoder.decode(request.getParameter("kw") == null ? "" : request.getParameter("kw"), "UTF-8")%>" placeholder="输入编号或者号码"/>
        <a href="javascript:;" onclick="doSearch()">搜索</a>
    </div>


    <%@include file="../../common/footer_common.jsp" %>
    <%@include file="../../common/footer_tip.jsp" %>
</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>

<script>
    if('${msg}'!=''){
        alert('${msg}')
    }
    function doSearch(){
        location.href="${baseURL}/mob/index/act/search.mvc?id=${param.id}&kw="+encodeURIComponent(encodeURIComponent($("#keyword").val()));
    }
</script>
