<%@page language="java" contentType="text/html; charset=UTF-8" %>
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
