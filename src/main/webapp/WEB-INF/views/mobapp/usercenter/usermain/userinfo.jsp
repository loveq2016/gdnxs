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
<img src="${baseURL}${_sysuserinfo.avatar}" id="avatarimg" onclick="selectimg()"><br/>
    <input type="file" id="avatar" style="display: none" onchange="uploadAvatar(this)">
<form action="${baseURL}/mob/usermain/userinfo.mvc" method="post" id="userinfof">
    <input type="hidden" name="id" value="${_sysuserinfo.id}">
    生日: <input type="text" name="birthday" value="${_sysuserinfo.birthday}"><br/>
    性别: <select type="text" name="gender" id="gender" dict-type="personSex"></select><br/>
    所属团队区域: <select  name="city"    class="form-control"  id="city" onchange="chageAreaCity('city','area')"></select>
    <select  name="area"  id="area"  class="form-control"   ></select>
    <script>
        initAreaCity('city')
    </script>
    <br/>
    特长:<input type="text" name="specialty" value="${_sysuserinfo.specialty}"><br/>
    备注:<input type="text" name="selfdesc" value="${_sysuserinfo.selfdesc}"><br/>

    <a href="javascript:;" onclick="editUser()">提交</a>

</form>
</body>
</html>
<script>
    var picpostfix = ".jpg,.png,.gif,.jpeg,.bmp";
    var dictJson = eval("(" + '<%=DictUtil.getDictJson()%>' + ")");
    $(function(){

        setTimeout(function(){
            $("#gender").val('${_sysuserinfo.gender}')
            $("#city").val('${_sysuserinfo.city}')
            $("#area").val('${_sysuserinfo.area}')
        },"500")
    })

    function editUser(){
        $.post($("#userinfof").attr("action"), $("#userinfof").serialize(), function (rec) {
            if (rec.code == "1") {
                alert("修改成功");
                location.reload()
            } else {
                alert(rec.desc);
            }
        }, "json").error(function () {
            alert("修改失败");
        });
    }

    function selectimg(){
        $("#avatar").trigger("click")
    }

    function uploadAvatar(a){
        if(!$(a).val()){
            alert("请选择文件上传！");
            return;
        }
        var suffix = $(a).val().substring($(a).val().lastIndexOf("."))
        if(picpostfix.toUpperCase().indexOf(suffix.toUpperCase())<0){
            alert("上传格式不正确，允许上传文件的后缀格式为："+picpostfix)
            return;
        }

        var formData = new FormData();
        formData.append('upFile', $(a)[0].files[0]);

        $.ajax({
            data: formData,
            type: "POST",
            url: baseURL+'/mob/usermain/uploadAvatar?folder=avatar',
            cache: false,
            contentType: false,
            processData: false,
            dataType:"json",
            success:function (rec) {
                if (rec.code == "1") {
                    alert("上传成功")
                    location.reload()
                } else {
                    alert("上传失败");
                }
            }
        });
    }
</script>
<script src="${baseURL}/staticres/mobapp/js/mobapphtml-render.v1.0.js"></script>
