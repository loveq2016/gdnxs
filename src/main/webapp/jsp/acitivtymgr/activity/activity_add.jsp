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
<div id="activity_addform_div" class="panel panel-fit">

    <form id="activity_addform" name="activity_addform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/acitivtymgr/activity/add.mvc?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                                                                         <div class="form-group">
                    <label  for="add_activity_title" class="col-md-3 control-label">标题：</label>
                    <div class="col-md-8">
                        <input type="text" name="activity.title" check-type="required"   class="form-control" id="add_activity_title"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_activity_homepagep" class="col-md-3 control-label">首页推荐图片：</label>
                    <div class="col-md-8">
                        <input type="hidden" name="member.avatar" id="add_activity_homepagep">
                        <span class="btn btn-success fileinput-button" style="position: absolute;">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span>选择图片</span>
                            <input type="file" class="form-control" name="upFile" id="add_activity_homepagep_inp" onchange="page_moudel.activity_upload('add_activity_homepagep')">
                        </span>
                    </div>

                     </div>

                    <div class="form-group">
                        <label   class="col-md-3 control-label"></label>
                        <div class="col-md-8" >
                            <img  src="" alt="" class="img-thumbnail" id="add_activity_homepagep_img" style="width:50%;height: 200px">
                        </div>
                    </div>
                                                                                         <div class="form-group">
                    <label  for="add_activity_endTime" class="col-md-3 control-label">活动结束时间：</label>
                    <div class="col-md-8">
                        <input type="text" name="activity.endTime" check-type="required" data-date-format="YYYY-MM-DD HH:mm:ss"   class="form-control" id="add_activity_endTime"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_activity_isPushHomepage" class="col-md-3 control-label">是否推送图片到首页：</label>
                    <div class="col-md-8">
                        <select type="text" name="activity.isPushHomepage" check-type="required" dict-type="YesOrNo"  class="form-control" id="add_activity_isPushHomepage"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_activity_activiyDesc" class="col-md-3 control-label">活动简介：</label>
                    <div class="col-md-8">
                        <textarea type="text" style="display: none" name="activity.activiyDesc"  check-type="required"   class="form-control" id="add_activity_activiyDesc"></textarea>
                        <script id="add_activity_activiyDesc_ue"  type="text/plain"></script>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_activity_astatus" class="col-md-3 control-label">活动状态：</label>
                    <div class="col-md-8">
                        <select type="text" name="activity.astatus" check-type="required" dict-type="ACTSTATUS"   class="form-control" id="add_activity_astatus"/>
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
        ue = UE.getEditor('add_activity_activiyDesc_ue');
        $("#add_activity_endTime").datetimepicker();
        $("#add_activity_endTime").val(getDateTimeStr(7))
        $("#add_activity_astatus").val("0")
        $('#activity_addform').validation();
    });
</script>

