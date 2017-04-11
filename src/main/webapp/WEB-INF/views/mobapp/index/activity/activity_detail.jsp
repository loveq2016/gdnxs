<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
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
        <a href="${baseURL}/mob/index/act/member/detail?id=${member.id}&actid=${act.id}">${member.name}.${member.no},${member.votenum}</a>
        <a href="javascript:;" >投我一票</a>
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


</script>--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 适应移动端end -->
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>
<body class="bg">
<!--轮播-->
<div class="carousel_figure">
    <ul class="img">
        <c:forEach items="${actphotolist}" var="photo">
            <li><a href="javascript:;"><img src="images/home_page_img.png" alt="第1张图片"></a></li>
        </c:forEach>
    </ul>
    <ul class="num"></ul>
</div>
<!--轮播结束-->
<div class="discuss_elect_title">${act.title}</div>
<a href="javascript:;" class="discuss_elect clearfix">
    <div class="elect_img_con">
        <img src="${baseURL}${act.homepagep}">
    </div>
    <div class="elect_right" onclick="location.href='${baseURL}/mob/index/act/desc?id=${act.id}'">
        <div class="elect_txt">
            <p class="elect_introduce">${act.title}活动简介、评比条件，投票规则</p>
            <p class="elect_time"><i class="ico_clock"></i><fmt:parseDate value="${act.endTime}" pattern="yyyy-MM-dd HH:mm:ss" var="endTime"></fmt:parseDate>
                <fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
        </div>
        <i class="link_indication"></i>
    </div>

</a>
<div class="voting_area">
    <ul class="clearfix">
        <c:forEach items="${actmemberlist}" var="member">
        <li>
            <div class="voting_box">
                <img src="${baseURL}${member.avatar}" onclick="location.href='${baseURL}/mob/index/act/member/detail?id=${member.id}&actid=${act.id}'" alt="选手"/>
                <div class="votes_player_name">${member.no}号 ${member.name}</div>
                <div class="btn_votes_box clearfix">
                    <a href="javascript:;" class="votes_num fl">${member.votenum}票</a>
                    <a href="javascript:;" class="vote_him fl" openid="${member.openid}" mid="${member.id}" onclick="actVote(this)"><i class="ico_vote_him"></i>为ta投票</a>
                </div>
            </div>
        </li>
        </c:forEach>
    </ul>

</div>
<c:set var="aid" value="${act.id}"></c:set>
<%@include file="../../common/footer_common.jsp" %>
<%@include file="../../common/footer_tip.jsp" %>
</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
<script type="text/javascript">
    function actVote(a){
        if($(a).attr("openid") == '${_userinfo.openid}'){
            tip("不能投自己！")
            return;
        }
        $.post(baseURL + '/mob/index/act/vote.mvc?', {"id":($(a).attr("mid")),"actid":'${act.id}'}, function (rec) {
            if (rec.code == "1") {
                tip("投票成功",function(){
                    location.reload();
                })
            } else {
                tip(rec.desc);
            }
        }, "json").error(function () {
            tip("操作失败");
        });
    }
</script>
