<%@page language="java" contentType="text/html; charset=UTF-8" %>
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
<div id="member_addform_div" class="panel panel-fit">

    <form id="member_addform" name="member_addform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/acitivtymgr/member/add.mvc?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

      <div class="form-group"></div>
        <div class="form-group">
            <label  for="add_member_gender" class="col-md-3 control-label">姓名：</label>
            <div class="col-md-8">
                <input type="text" name="member.name" check-type="required"   class="form-control" id="add_member_name"/>
            </div>
        </div>
                                                                                         <div class="form-group">
                    <label  for="add_member_gender" class="col-md-3 control-label">性别：</label>
                    <div class="col-md-8">
                        <select type="text" name="member.gender" check-type="required" dict-type="personSex"   class="form-control" id="add_member_gender"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_member_work" class="col-md-3 control-label">单位：</label>
                    <div class="col-md-8">
                        <input type="text" name="member.work" check-type="required"    class="form-control" id="add_member_work"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_member_concatPhone" class="col-md-3 control-label">联系号码：</label>
                    <div class="col-md-8">
                        <input type="text" name="member.concatPhone" check-type="required mobile"   class="form-control" id="add_member_concatPhone"/>
                    </div>
                 </div>
                <div class="form-group">

                    <label  for="add_member_avatar" class="col-md-3 control-label">头像：</label>
                    <div class="col-md-8">
                        <input type="hidden" name="member.avatar" id="add_member_avatar">
                        <span class="btn btn-success fileinput-button" style="position: absolute;">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span>选择图片</span>
                            <input type="file" class="form-control" name="upFile" id="add_member_avatar_inp" onchange="page_moudel.menmber_upload('add_member_avatar')">
                        </span>
                    </div>

                </div>

                <div class="form-group">
                    <label   class="col-md-3 control-label"></label>
                    <div class="col-md-8" >
                        <img  src="" alt="" class="img-thumbnail" id="add_member_avatar_img" style="width:50%;height: 200px">
                    </div>
                </div>
                                                                                         <div class="form-group">
                    <label  for="add_member_birthday" class="col-md-3 control-label">出生年月：</label>
                    <div class="col-md-8">
                        <input type="text" name="member.birthday" check-type="required" data-date-format="YYYY-MM-DD"  class="form-control" id="add_member_birthday"/>
                    </div>
                 </div>
        <div class="form-group">
            <label  for="add_member_mtype" class="col-md-3 control-label">类型：</label>
            <div class="col-md-8">
                <select type="text" name="member.mtype"  dict-type="MTYPE"  check-type="required"  class="form-control" id="add_member_mtype"/>
            </div>
        </div>
        <div class="form-group">
            <label  for="add_member_people" class="col-md-3 control-label">民族：</label>
            <div class="col-md-8">
                <select type="text" name="member.people"  dict-type="people"  check-type="required"  class="form-control" id="add_member_people"/>
            </div>
        </div>
                                                                                         <div class="form-group">
                    <label  for="add_member_area" class="col-md-3 control-label">区域：</label>
                    <div class="col-md-8">
                        <select  name="member.city"    class="form-control" style="width: 100px;display: inline-block" id="add_member_city" onchange="chageAreaCity('add_member_city','add_member_area')"/>
                        <select  name="member.area"    class="form-control"  style="width: 100px;display: inline-block" id="add_member_area"/>
                        <script>
                            initAreaCity('add_member_city')
                        </script>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_member_specialty" class="col-md-3 control-label">特长：</label>
                    <div class="col-md-8">
                        <textarea  name="member.specialty"    class="form-control" id="add_member_specialty"></textarea>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_member_selfdesc" class="col-md-3 control-label">自我介绍：</label>
                    <div class="col-md-8">
                        <textarea  name="member.selfdesc"    class="form-control" id="add_member_selfdesc"></textarea>
                    </div>
                 </div>

                                                                                         <div class="form-group">
                    <label  for="add_member_profile" class="col-md-3 control-label">个人简介：</label>
                    <div class="col-md-8">
                        <textarea type="text" style="display: none" name="member.profile"  check-type="required"   class="form-control" id="add_member_profile"></textarea>
                        <script id="add_member_profile_ue"  type="text/plain"></script>
                    </div>
                 </div>
    </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script type="text/javascript"
        src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<!-- 富文本 -->
<script type="text/javascript"
        src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/ueditor1_4_3-utf8-jsp/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"
        src='${pageContext.servletContext.contextPath}/jsp/3rd-plug/ueditor1_4_3-utf8-jsp/ueditor.all.js'></script>
<script type="text/javascript"
        src='${pageContext.servletContext.contextPath}/jsp/3rd-plug/ueditor1_4_3-utf8-jsp/ueditor.parse.min.js'></script>
<script type="text/javascript"
        src='${pageContext.servletContext.contextPath}/jsp/3rd-plug/ueditor1_4_3-utf8-jsp/lang/zh-cn/zh-cn.js'></script>
    <script>
    $(function(){
        ue = UE.getEditor('add_member_profile_ue');
        $("#add_member_birthday").datetimepicker();
        $('#member_addform').validation();
    });
</script>

