<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="operationlog_editform_div" class="panel panel-default">
  <form id="operationlog_editform" name="operationlog_editform" role="form" class="form-horizontal" action="${pageContext.servletContext.contextPath}/sysextmgr/operationlog/update.mvc" method="post">
  <div class="form-group"></div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="operaLog.id" check-type="required"   class="form-control" id="edit_operationlog_id"/>
                                                <div class="form-group">
            <label  for="edit_operationlog_authorId" class="col-md-2 control-label">操作用户ID：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.authorId" check-type="required"   class="form-control" id="edit_operationlog_authorId"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_operationlog_author" class="col-md-2 control-label">操作用户名称：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.author" check-type="required"   class="form-control" id="edit_operationlog_author"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_operationlog_ip" class="col-md-2 control-label">IP地址：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.ip" check-type="required"   class="form-control" id="edit_operationlog_ip"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_operationlog_model" class="col-md-2 control-label">操作：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.model" check-type="required"   class="form-control" id="edit_operationlog_model"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_operationlog_operation" class="col-md-2 control-label">操作：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.operation" check-type="required"   class="form-control" id="edit_operationlog_operation"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_operationlog_description" class="col-md-2 control-label">详细说明：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.description" check-type="required"   class="form-control" id="edit_operationlog_description"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_operationlog_createTime" class="col-md-2 control-label">创建时间：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.createTime" check-type="required"   class="form-control" id="edit_operationlog_createTime"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_operationlog_status" class="col-md-2 control-label">类型，0失败；1成功：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.status" check-type="required"   class="form-control" id="edit_operationlog_status"/>
            </div>
        </div>
                
  </form>
</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function(){
        $('#operationlog_editform').validation();
    });
</script>

