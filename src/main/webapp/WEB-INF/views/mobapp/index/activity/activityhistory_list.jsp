<%@ page import="java.net.URLDecoder" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<input>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>历史活动</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

    历史活动
<br/>
    ${actCarousel}
<br/>
    ${actList}
<br/>
<input type="text" value="<%=URLDecoder.decode(request.getParameter("kw")==null?"":request.getParameter("kw"), "UTF-8")%>" id="keword"> <button style="width: 20px;height: 20px;"  value="搜索" onclick="doSearch()"/>

</body>
</html>

<script>
    function doSearch(){
        location.href="${baseURL}/mob/index/act/history/list.mvc?kw="+encodeURIComponent(encodeURIComponent($("#keword").val()));
    }
</script>
