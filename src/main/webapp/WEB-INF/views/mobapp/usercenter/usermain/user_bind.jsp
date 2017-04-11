<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>绑定页面</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

    绑定页面
    <br/>
<form action="${baseURL}/mob/usermain/user/bind.mvc" method="post" id="bindf">
姓名：<input type="text" name="name"><br/>
出生年月:<input type="text" name="birthday"><br/>

    <a href="javascript:;" onclick="bindUser()">绑定</a>

</form>
</body>
</html>

<script>
        function bindUser(){
            $.post($("#bindf").attr("action"), $("#bindf").serialize(), function (rec) {
                if (rec.code == "1") {
                    alert("绑定成功")
                } else {
                    alert(rec.desc);
                }
            }, "json").error(function () {
                alert("绑定失败");
            });
        }
</script>
--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 适应移动端end -->
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>

<body class="bg">
<form action="${baseURL}/mob/usermain/user/bind.mvc" method="post" id="bindf">
    <div class="validation_info_box">
        <dl class="validation_info_item clearfix">
            <dt>姓名</dt>
            <dd><input type="text" name="name" placeholder="请输入姓名"/></dd>
        </dl>
        <dl class="validation_info_item clearfix">
            <dt>出生年月</dt>
            <dd>
                <div class="birth_box">
                    <input type="date" name="birthday" placeholder="请输入出生年月"/>
                </div>
            </dd>
        </dl>
    </div>
    <a href="javascript:;" class="btn_submit" onclick="bindUser()">提交</a>
</form>
<%@include file="../../common/footer_tip.jsp" %>
</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
<script>
    function bindUser(){
        $.post($("#bindf").attr("action"), $("#bindf").serialize(), function (rec) {
            if (rec.code == "1") {
                tip("绑定成功",function(){
                    location.href='${baseURL}/mob/usermain/userinfo.mvc'
                })
            } else {
                alert(rec.desc);
            }
        }, "json").error(function () {
            tip("绑定失败");
        });
    }
</script>