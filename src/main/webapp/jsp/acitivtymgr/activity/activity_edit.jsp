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
<div id="activity_editform_div" class="panel panel-fit">

  <form id="activity_editform" name="activity_editform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/acitivtymgr/activity/update.mvc?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

  <div class="form-group"></div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

      <div class="form-group">
          <label  for="edit_activity_title" class="col-md-3 control-label">标题：</label>
          <div class="col-md-8">
              <input type="text" name="activity.title" check-type="required"   class="form-control" id="edit_activity_title"/>
              <input type="hidden" name="activity.id"   class="form-control" id="edit_activity_id"/>
          </div>
      </div>
      <div class="form-group">
          <label  for="edit_activity_homepagep" class="col-md-3 control-label">首页推荐图片：</label>
          <div class="col-md-8">
              <input type="hidden" name="member.avatar" id="edit_activity_homepagep">
                        <span class="btn btn-success fileinput-button" style="position: absolute;">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span>选择图片</span>
                            <input type="file" class="form-control" name="upFile" id="edit_activity_homepagep_inp" onchange="page_moudel.activity_upload('edit_activity_homepagep')">
                        </span>
          </div>

      </div>

      <div class="form-group">
          <label   class="col-md-3 control-label"></label>
          <div class="col-md-8" >
              <img  src="" alt="" class="img-thumbnail" id="edit_activity_homepagep_img" style="width:50%;height: 200px">
          </div>
      </div>
      <div class="form-group">
          <label  for="edit_activity_endTime" class="col-md-3 control-label">活动结束时间：</label>
          <div class="col-md-8">
              <input type="text" name="activity.endTime" check-type="required" data-date-format="YYYY-MM-DD HH:mm:ss"   class="form-control" id="edit_activity_endTime"/>
          </div>
      </div>
      <div class="form-group">
          <label  for="edit_activity_isPushHomepage" class="col-md-3 control-label">是否推送图片到首页：</label>
          <div class="col-md-8">
              <select type="text" name="activity.isPushHomepage" check-type="required" dict-type="YesOrNo"  class="form-control" id="edit_activity_isPushHomepage"/>
          </div>
      </div>
      <div class="form-group">
          <label  for="edit_activity_activiyDesc" class="col-md-3 control-label">活动简介：</label>
          <div class="col-md-8">
              <textarea type="text" style="display: none" name="activity.activiyDesc"  check-type="required"   class="form-control" id="edit_activity_activiyDesc"></textarea>
              <script id="edit_activity_activiyDesc_ue"  type="text/plain"></script>
          </div>
      </div>
      <div class="form-group">
          <label  for="edit_activity_astatus" class="col-md-3 control-label">活动状态：</label>
          <div class="col-md-8">
              <select type="text" name="activity.astatus" check-type="required" dict-type="ACTSTATUS"   class="form-control" id="edit_activity_astatus"/>
          </div>
      </div>

  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
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
        ue = UE.getEditor('edit_activity_activiyDesc_ue');
        ue.addListener("ready", function () {
            // editor准备好之后才可以使用
            ue.setContent($("#edit_activity_activiyDesc").val());
        });
        $("#edit_activity_endTime").datetimepicker();
        $('#activity_editform').validation();
    });
</script>

