<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@include file="../../../jsp/common/attr_common.jsp" %>
<style>
    input[type=file]{
        position:absolute;
        left:0;
        top:0;
        width:100%;
        height:100%;
        z-index:999;
        cursor:pointer;
        opacity:0;
        filter: alpha(opacity=0);
    }
</style>
<div  class="panel panel-fit">
    <div style="margin-bottom: 10px;">
        <form id="activityphoto_addform" name="activityphoto_addform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/acitivtymgr/activity//actphoto/add.mvc?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${param.id}">
            <span class="btn btn-success fileinput-button" style="position: absolute;">
                                <i class="glyphicon glyphicon-plus"></i>
                                <span>选择图片</span>
                                <input type="file" class="form-control" name="upFile"  onchange="page_moudel.activity_addphoto(this)">
             </span>
        </form>
    </div>
    <div style="margin-top: 50px"></div>
    <div id="actphotodiv">
        <c:forEach items="${activityphotos}" var="photo" varStatus="status">
            <div id="photo_${status.index}">
                <img src="${baseURL}${photo.purl}" style="width: 300px;height: 300px;">
                <input class="btn btn-default " name="search" type="button" value="删除图片" onclick="javascript:page_moudel.del_actphoto('${photo.id}',${status.index});"/>
            </div>

        </c:forEach>
    </div>

</div>
<script>

    page_moudel.del_actphoto = function(){

    }

    page_moudel.activity_addphoto=
            function(a){
                if(!$(a).val()){
                    $.msg.fail("请选择图片上传！");
                    return;
                }
                var suffix = $(a).val().substring($(a).val().lastIndexOf("."))
                if(picpostfix.toUpperCase().indexOf(suffix.toUpperCase())<0){
                    $.msg.fail("上传格式不正确，允许上传文件的后缀格式为："+picpostfix)
                    return;
                }

                $('#activityphoto_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {
                        if ("1" == result.code) {
                            $.msg.success('新增图片成功');
                            renderPhotoHtml(result.data)
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail("新增图片失败");
                        return false;
                    }

                });


            }
    var index = 100;
    function renderPhotoHtml(a){
        index++;
        var html = ''
        html+='  <div id="photo_'+ index+'">'
        html+='     <img src="'+baseURL+a.vo.purl+'" style="width: 300px;height: 300px;">'
        html+='      <input class="btn btn-default " name="search" type="button" value="删除图片" onclick="javascript:page_moudel.del_actphoto(\''+ a.vo.id+'\','+index+');"/>'
        html+='      </div>'

        $("#actphotodiv").append(html)
    }

    page_moudel.del_actphoto  = function(a,b){
        $.msg.confirm(function () {
            $.post(baseURL + '/acitivtymgr/activity/actphoto/delete.mvc?'+_csrf+"=" + token, {"ids": "'"+a+"'"}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    $("#photo_"+b).remove()
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })

    }




</script>

