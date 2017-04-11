<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<!DOCTYPE html>
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
--%>
<!DOCTYPE html>
<html>
<head lang="en">
    <!-- 适应移动端end -->
    <title>广东农信社</title>
    <%@include file="../../common/app_common.jsp" %>
</head>

<body class="bg">
<form action="${baseURL}/mob/usermain/userinfo.mvc" method="post" id="userinfof">
        <a href="javascript:;" class="head_portrait_box clearfix">
            <span class="fl">头像</span>
            <div class="fr clearfix">
                <div class="head_portrait fl">
                    <input type="hidden" name="id" value="${_sysuserinfo.id}">
                    <img src="${baseURL}${_sysuserinfo.avatar}" id="avatarimg" onclick="selectimg()" alt="头像"/>
                    <input type="file" id="avatar" style="display: none" onchange="uploadAvatar(this)">
                </div>
                <i class="ico_right_head fl"></i>
            </div>
        </a>
        <div class="per_center_fill">
            <div class="perfect_info_item clearfix"><h3 class="fl">姓名</h3><span class="fill_con fr">${_sysuserinfo.name}</span></div>
            <div class="perfect_info_item clearfix"><h3 class="fl">单位</h3><span class="fill_con fr">${_sysuserinfo.work}</span></div>
            <div class="perfect_info_item clearfix"><h3 class="fl">联系号码</h3><span class="fill_con fr">${_sysuserinfo.concatPhone}</span></div>
        </div>
        <div class="per_center_fill">
            <a href="javascript:;" class="per_center_item clearfix">
                <h3 class="fl">出生年月</h3>
                <input type="date" value="1993-08-19" readonly/>
                <i class="ico_right"></i>
            </a>
            <a href="javascript:;" class="per_center_item select_sex clearfix">
                <h3 class="fl">性别</h3>
                <div style="text-align: right">
                    <select name="gender" id="gender" dict-type="personSex"></select>
                    <script>
                        initAreaCity('city')
                    </script>
                </div>
            </a>
            <a href="javascript:;" class="per_center_item clearfix" >
                <h3 class="fl">所属团队区域</h3>
                <div style="text-align: right">
                    <select  name="city"  id="city" onchange="chageAreaCity('city','area')"></select>
                    <select  name="area"  id="area"   ></select>
                    <script>
                        initAreaCity('city')
                    </script>
                </div>
            </a>
            <a href="javascript:;" class="per_center_item clearfix">
                <h3 class="fl">特长</h3>
                <input type="text" name="specialty" value="${_sysuserinfo.specialty}" placeholder="特长" class="specialty"/>
                <i class="ico_right"></i>
            </a>
            <a href="javascript:;" class="per_center_item clearfix">
                <h3 class="fl">备注</h3>
                <input type="text" name="selfdesc" value="${_sysuserinfo.selfdesc}" placeholder="备注"/>
                <i class="ico_right"></i>
            </a>

        </div>
</form>
<a href="javascript:;" class="btn_submit" onclick="editUser()">提交</a>
<%--<a href="${baseURL}/mob/usermain/" class="btn_submit" onclick="editUser()">个人中心</a>--%>
<%@include file="../../common/footer_tip.jsp" %>
</body>
</html>
<script type="text/javascript" src="${baseURL}/staticres/mobapp/js/main.js"></script>
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
                tip("修改成功",function(){
                    location.href='${baseURL}/mob/usermain/'
                });
            } else {
                alert(rec.desc);
            }
        }, "json").error(function () {
            tip("修改失败");
        });
    }

    function selectimg(){
        $("#avatar").trigger("click")
    }

    function uploadAvatar(a){
        if(!$(a).val()){
            tip("请选择文件上传！");
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
                    tip("上传成功",function(){
                        location.reload()
                    })
                } else {
                    tip("上传失败");
                }
            }
        });
    }
</script>
<script src="${baseURL}/staticres/mobapp/js/mobapphtml-render.v1.0.js"></script>


