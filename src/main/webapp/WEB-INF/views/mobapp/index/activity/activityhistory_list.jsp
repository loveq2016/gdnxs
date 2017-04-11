<%@ page import="java.net.URLDecoder" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<input type="text" value="<%=URLDecoder.decode(request.getParameter("kw")==null?"":request.getParameter("kw"), "UTF-8")%>" id="keword"> <button style="width: 20px;height: 20px;"  value="搜索" onclick="doSearch()"/>

</body>
</html>

<script>
    function doSearch(){
        location.href="${baseURL}/mob/index/act/history/list.mvc?kw="+encodeURIComponent(encodeURIComponent($("#keword").val()));
    }
</script>--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>
<body class="bg">
<!--轮播-->
<div class="carousel_figure">
    <ul class="img">
        <c:forEach items="${actCarousel}" var="carousel">
            <li><a href="javascript:;"><img src="${baseURL}${carousel.homepagep}"></a></li>
        </c:forEach>
    </ul>
    <ul class="num"></ul>
</div>
<!--轮播结束-->
<div class="rating_tab clearfix">
    <ul>
        <ul>
            <li  onclick="location.href='${baseURL}/mob/index/act/list.mvc'">进行中</li>
            <li class="this_tab" onclick="location.href='${baseURL}/mob/index/act/history/list.mvc'">历史活动</li>
        </ul>
    </ul>
</div>

<div class="activity_box">
    <div class="search_box">
        <input type="text" class="input_search" id="keword" value="<%=URLDecoder.decode(request.getParameter("kw")==null?"":request.getParameter("kw"), "UTF-8")%>" placeholder="输入文字" onkeyup="doSearch(event)"/>
    </div>

    <c:forEach items="${actList}" var="act">
        <div class="rating_info" onclick="location.href='${baseURL}/mob/index/act/desc?id=${act.id}'">
            <div class="activity_dev clearfix"><span class="activity_name fl">${act.title}</span><span class="active_state fr">活动已结束</span></div>
            <p class="activity_explain">${act.title}评选开始啦，快来你的小伙伴投票吧</p>
            <div class="activity_img">
                <img src="${baseURL}${act.homepagep}">
            </div>
            <div class="activity_time_num clearfix">
                <span class="fl">活动时间：
                    <fmt:parseDate value="${act.createdate}" var="createdate"></fmt:parseDate>
                        <fmt:formatDate value="${createdate}" pattern="yyyy-MM-dd"></fmt:formatDate> -
                    <fmt:parseDate value="${act.endTime}" var="endTime"></fmt:parseDate>
                        <fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                </span>
                <span class="fr"><i class="ico_activity_num"></i>${act.actmemberCount}人</span>
            </div>

        </div>
    </c:forEach>
</div>





</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
<script type="text/javascript">
    function doSearch(e){
        if(e.keyCode==13){
            location.href="${baseURL}/mob/index/act/history/list.mvc?kw="+encodeURIComponent(encodeURIComponent($("#keword").val()));
        }

    }
</script>

