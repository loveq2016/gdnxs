<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>完善资料</title>
    <%@include file="../../common/app_common.jsp" %>

</head>

<body>
    完善资料
    <br/>
<img src="${baseURL}${_sysuserinfo.avatar}" id="avatar"><br/>
<form action="${baseURL}/mob/usercenter/userinfo.mvc" method="post" id="userinfof">
   生日: <input type="text" name="birthday" value="${_sysuserinfo.birthday}"><br/>
    性别: <select type="text" name="gender" id="gender" dict-type="personSex"></select><br/>
    所属团队区域: <select  name="city"    class="form-control"  id="city" onchange="chageAreaCity('city','area')"></select>
    <select  name="city"  id="area"  class="form-control"   ></select>
    <script>
        initAreaCity('city')
    </script>
    <br/>
    特长:<input type="text" name="specialty"><br/>
    备注:<input type="text" name="selfdesc"><br/>

    <a href="javascript:;">提交</a>

</form>
</body>
</html>
<script>
    var dictJson = eval("(" + '<%=DictUtil.getDictJson()%>' + ")");
    $(function(){
        $("#city").val('${_sysuserinfo.city}')
        $("#area").val('${_sysuserinfo.area}')

        $("#specialty").val('${_sysuserinfo.specialty}')
        $("#selfdesc").val('${_sysuserinfo.selfdesc}')
        setTimeout(function(){
            $("#gender").val('${_sysuserinfo.gender}')
        },"500")
    })
</script>
<script src="${baseURL}/staticres/mobapp/js/mobapphtml-render.v1.0.js"></script>
