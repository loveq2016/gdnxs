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
<div id="notice_addform_div" class="panel panel-fit">

    <form id="notice_addform" name="notice_addform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/messagemgr/notice/add.mvc?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                                                                         <div class="form-group">
                    <label  for="add_notice_title" class="col-md-3 control-label">标题：</label>
                    <div class="col-md-8">
                        <input type="text" name="notice.title" check-type="required"   class="form-control" id="add_notice_title"/>
                    </div>
                 </div>
                    <div class="form-group">

                        <label  for="add_notice_purl" class="col-md-3 control-label">通知图片：</label>
                        <div class="col-md-8">
                            <input type="hidden" name="notice.purl" id="add_notice_purl">
                                    <span class="btn btn-success fileinput-button" style="position: absolute;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                        <span>选择图片</span>
                                        <input type="file" class="form-control" name="upFile" id="add_notice_purl_inp" onchange="page_moudel.noticep_upload('add_notice_purl')">
                                    </span>
                        </div>

                    </div>

                    <div class="form-group">
                        <label   class="col-md-3 control-label"></label>
                        <div class="col-md-8" >
                            <img  src="" alt="" class="img-thumbnail" id="add_notice_purl_img" style="width:50%;height: 200px">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  for="add_notice_city" class="col-md-3 control-label">通知区域：</label>
                        <div class="col-md-8">
                            <select  name="notice.city"    class="form-control" style="width: 100px;display: inline-block" id="add_notice_city" onchange="chageAreaCity('add_notice_city','add_notice_area')"/>
                            <select  name="notice.area"    class="form-control"  style="width: 100px;display: inline-block" id="add_notice_area"/>
                            <script>
                                initAreaCity('add_notice_city')
                            </script>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  for="add_notice_attachment" class="col-md-3 control-label">附件上传：</label>
                        <div class="col-md-8">
                            <input type="hidden" name="notice.attachment" id="add_notice_attachment">
                                    <span class="btn btn-success fileinput-button" style="position: absolute;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                        <span>选择附件</span>
                                        <input type="file" class="form-control" name="acctupFile" id="add_notice_attachment_inp" onchange="page_moudel.noticeacc_upload('add_notice_attachment')">
                                    </span>

                        </div>
                    </div>

                    <div class="form-group">
                        <label  for="add_notice_area" class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <a href="#" target="_blank" id="add_notice_attachment_a"></a>
                            <input type="hidden" name="notice.attachmentname" id="notice_attachmentname">
                        </div>
                    </div>                                                               <div class="form-group">
                    <label  for="add_notice_ndesc" class="col-md-3 control-label">通知详情：</label>
                    <div class="col-md-8">
                        <input type="hidden" name="notice.ndesc" check-type="required"   class="form-control" id="add_notice_ndesc"/>
                        <script id="add_notice_ndesc_ue"  type="text/plain"></script>
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
        ue = UE.getEditor('add_notice_ndesc_ue');
        $('#notice_addform').validation();
    });
</script>

