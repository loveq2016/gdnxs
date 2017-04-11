<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>拉票海报</title>
    <%@include file="../../common/app_common.jsp" %>



</head>

<body>
拉票海报
    <br/>
${member.poster}
    <br/>
<img src="${baseURL}/mob/index/act/member/poster/qrcode?id=${param.id}&actid=${param.actid}">
<br/>
<a onclick="location.href='${baseURL}/mob/index/act/member/poster?id=${member.id}&actid=${act.id}'">拉票海报</a>
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
    <div class="share_explain">
        <p>1.长按图片，保存到手机</p>
        <p>2.将保存到手机的图片分享到朋友圈</p>
    </div>
    <div class="qr_code">
        <img src="${baseURL}/${member.avatar}">
    </div>
    <p class="participant">编号：${member.no}</p>
    <p class="participant">姓名：${member.name}</p>
    <div class="qr_code">
        <img src="${baseURL}/mob/index/act/member/poster/qrcode?id=${param.id}&actid=${param.actid}">
    </div>


</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
