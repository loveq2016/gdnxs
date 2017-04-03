<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="mvoice_editform_div" class="panel panel-fit">

  <form id="mvoice_editform" name="mvoice_editform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/sysextmgr/mvoice/update.mvc" method="post">

  <div class="form-group"></div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                        <input type="hidden" name="mvoice.id"    class="form-control" id="edit_mvoice_id"/>
                                                <div class="form-group">
            <label  for="edit_mvoice_keyName" class="col-md-3 control-label">键名：</label>
            <div class="col-md-8">
                <input type="text" name="mvoice.keyName" check-type="required"   class="form-control" id="edit_mvoice_keyName"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_mvoice_chinaName" class="col-md-3 control-label">中文名：</label>
            <div class="col-md-8">
                <input type="text" name="mvoice.chinaName" check-type="required"   class="form-control" id="edit_mvoice_chinaName"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_mvoice_englishName" class="col-md-3 control-label">英文名：</label>
            <div class="col-md-8">
                <input type="text" name="mvoice.englishName" check-type="required"   class="form-control" id="edit_mvoice_englishName"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_mvoice_status" class="col-md-3 control-label">状态：</label>
            <div class="col-md-8">
                <input type="text" name="mvoice.status" check-type="required"   class="form-control" id="edit_mvoice_status"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_mvoice_createPerson" class="col-md-3 control-label">创建人：</label>
            <div class="col-md-8">
                <input type="text" name="mvoice.createPerson" check-type="required"   class="form-control" id="edit_mvoice_createPerson"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_mvoice_createTime" class="col-md-3 control-label">创建时间：</label>
            <div class="col-md-8">
                <input type="text" name="mvoice.createTime" check-type="required"   class="form-control" id="edit_mvoice_createTime"/>
            </div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function(){
        $('#mvoice_editform').validation();
    });
</script>

