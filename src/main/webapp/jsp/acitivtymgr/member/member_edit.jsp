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
<div id="member_editform_div" class="panel panel-fit">

  <form id="member_editform" name="member_editform"  role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/acitivtymgr/member/update.mvc?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

  <div class="form-group"></div>
                                                <div class="form-group">
            <label  for="edit_member_name" class="col-md-3 control-label">姓名：</label>
            <div class="col-md-8">
                <input type="text" name="member.name" check-type="required"   class="form-control" id="edit_member_name"/>
                <input type="hidden" name="member.id"   class="form-control" id="edit_member_id"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_member_gender" class="col-md-3 control-label">性别：</label>
            <div class="col-md-8">
                <input type="text" dictType="personSex" name="member.gender" check-type="required"   class="form-control" id="edit_member_gender"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_member_work" class="col-md-3 control-label">单位：</label>
            <div class="col-md-8">
                <input type="text" name="member.work" check-type="required"   class="form-control" id="edit_member_work"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_member_concatPhone" class="col-md-3 control-label">联系号码：</label>
            <div class="col-md-8">
                <input type="text" name="member.concatPhone" check-type="required mobile"   class="form-control" id="edit_member_concatPhone"/>
            </div>
        </div>

      <div class="form-group">

          <label  for="edit_member_avatar" class="col-md-3 control-label">头像：</label>
          <div class="col-md-8">
              <input type="hidden" name="member.avatar" id="edit_member_avatar">
                        <span class="btn btn-success fileinput-button" style="position: absolute;">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span>选择图片</span>
                            <input type="file" class="form-control" name="upFile" id="edit_member_avatar_inp" onchange="page_moudel.menmber_upload('edit_member_avatar')">
                        </span>
          </div>

      </div>

      <div class="form-group">
          <label   class="col-md-3 control-label"></label>
          <div class="col-md-8" >
              <img  src="" alt="" class="img-thumbnail" id="edit_member_avatar_img" style="width:50%;height: 200px">
          </div>
      </div>

                      <div class="form-group">
            <label  for="edit_member_birthday" class="col-md-3 control-label">出生年月：</label>
            <div class="col-md-8">
                <input type="text" name="member.birthday" check-type="required"  data-date-format="YYYY-MM-DD"  class="form-control" id="edit_member_birthday"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_member_area" class="col-md-3 control-label">区域：</label>
            <div class="col-md-8">
                <select type="text" name="member.area"  dict-type="area"  class="form-control" id="edit_member_area"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_member_specialty" class="col-md-3 control-label">特长：</label>
            <div class="col-md-8">
                <textarea type="text" name="member.specialty"   class="form-control" id="edit_member_specialty"></textarea>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_member_selfdesc" class="col-md-3 control-label">自我介绍：</label>
            <div class="col-md-8">
                <textarea type="text" name="member.selfdesc"    class="form-control" id="edit_member_selfdesc"></textarea>          </div>
        </div>
      <div class="form-group">
          <label  for="edit_member_profile" class="col-md-3 control-label">个人简介：</label>
          <div class="col-md-8">
              <textarea type="text" style="display: none" name="member.profile"  check-type="required"   class="form-control" id="edit_member_profile"></textarea>
              <script id="edit_member_profile_ue"  type="text/plain"></script>
          </div>
      </div>

                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
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
        ue = UE.getEditor('edit_member_profile_ue');
        ue.addListener("ready", function () {
            // editor准备好之后才可以使用
            ue.setContent($("#edit_member_profile").val());
        });
        $("#edit_member_birthday").datetimepicker();
        $('#member_editform').validation();
    });
</script>

