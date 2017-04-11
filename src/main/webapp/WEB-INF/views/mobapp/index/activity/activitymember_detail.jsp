<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>个人简介</title>
    <%@include file="../../common/app_common.jsp" %>



</head>

<body>
个人简介
    <br/>
${act}
    <br/>
${member}
<br/>
<select dict-type="personSex"></select>
<br/>
<a href="${baseURL}/mob/index/act/member/poster?id=${member.id}&actid=${act.id}">拉票海报</a>
</body>
</html>--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 适应移动端end -->
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>
<body>

<div class="per_profile">
    <div class="player_name">${member.no}号 ${member.name}</div>
    <p>个人简介</p>
    <div>
        ${member.profile}
    </div>
    <div class="player_pic">
        <img src="${baseURL}${member.avatar}">
    </div>

</div>
<div style="height: 40px;"></div>
<div class="player_votes_box clearfix">
    <a href="${baseURL}/mob/index/act/member/poster?id=${member.id}&actid=${act.id}" class="votes_num fl">拉票海报</a>
    <a href="javascript:;" class="vote_him fl" openid="${member.openid}" mid="${member.id}" onclick="actVote(this)"><i class="ico_vote_him"></i>为ta投票</a>

</div>
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