<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="faqinfomgr_addform_div" class="panel panel-fit">

    <form id="faqinfomgr_addform" name="faqinfomgr_addform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/faqinfomgr/faqinfomgr/add.mvc" method="post">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                                                                         <div class="form-group">
                    <label  for="add_faqinfomgr_title" class="col-md-3 control-label">标题：</label>
                    <div class="col-md-8">
                        <input type="text" name="faq.title" check-type="required"   class="form-control" id="add_faqinfomgr_title"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_faqinfomgr_faqDesc" class="col-md-3 control-label">回答：</label>
                    <div class="col-md-8">
                        <input type="hidden" name="faq.faqDesc" check-type="required"   class="form-control" id="add_faqinfomgr_faqDesc"/>
                        <script id="add_faqinfomgr_faqDesc_ue"  type="text/plain"></script>
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
        ue = UE.getEditor('add_faqinfomgr_faqDesc_ue');
        $('#faqinfomgr_addform').validation();
    });
</script>

