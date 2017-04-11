<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
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
        <a href="">${act.id}${act.title}</a><br/>
    </c:forEach>
<a href="${baseURL}/mob/index/act/history/list.mvc">历史活动</a>
</body>
</html>

<script>

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
        <li class="this_tab" onclick="location.href='${baseURL}/mob/index/act/list.mvc'">进行中</li>
        <li onclick="location.href='${baseURL}/mob/index/act/history/list.mvc'">历史活动</li>
    </ul>
</div>
<div class="activity_box">
    <c:forEach items="${actList}" var="act">
        <div class="rating_info" onclick="location.href='${baseURL}/mob/index/act/detail?id=${act.id}'">
            <div class="activity_dev clearfix"><span class="activity_name fl">${act.title}</span><span class="active_state fr">活动进行中</span></div>
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
    /*$('.activity_box').siblings('.activity_box').eq(0).show().siblings('.activity_box').hide();
    $(".rating_tab ul li").click(function(){
        var index = $(".rating_tab ul li").index(this);
        $(".activity_box").eq(index).show().siblings('.activity_box').hide();
        $(this).addClass('this_tab').siblings('li').removeClass('this_tab');
    })*/
</script>
