<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="operationlog_addform_div" class="panel panel-default">
<form id="operationlog_addform" name="operationlog_addform" role="form" class="form-horizontal" action="${pageContext.servletContext.contextPath}/sysextmgr/operationlog/add.mvc" method="post">
 <div class="form-group"></div>
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                                                                 <div class="form-group">
            <label  for="add_operationlog_authorId" class="col-md-3 control-label">操作用户ID：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.authorId" check-type="required"   class="form-control" id="add_operationlog_authorId"/>
            </div>
         </div>
                                                             <div class="form-group">
            <label  for="add_operationlog_author" class="col-md-3 control-label">操作用户名称：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.author" check-type="required"   class="form-control" id="add_operationlog_author"/>
            </div>
         </div>
                                                             <div class="form-group">
            <label  for="add_operationlog_ip" class="col-md-3 control-label">IP地址：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.ip" check-type="required"   class="form-control" id="add_operationlog_ip"/>
            </div>
         </div>
                                                             <div class="form-group">
            <label  for="add_operationlog_model" class="col-md-3 control-label">操作：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.model" check-type="required"   class="form-control" id="add_operationlog_model"/>
            </div>
         </div>
                                                             <div class="form-group">
            <label  for="add_operationlog_operation" class="col-md-3 control-label">操作：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.operation" check-type="required"   class="form-control" id="add_operationlog_operation"/>
            </div>
         </div>
                                                             <div class="form-group">
            <label  for="add_operationlog_description" class="col-md-3 control-label">详细说明：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.description" check-type="required"   class="form-control" id="add_operationlog_description"/>
            </div>
         </div>
                                                             <div class="form-group">
            <label  for="add_operationlog_createTime" class="col-md-3 control-label">创建时间：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.createTime" check-type="required"   class="form-control" id="add_operationlog_createTime"/>
            </div>
         </div>
                                                             <div class="form-group">
            <label  for="add_operationlog_status" class="col-md-3 control-label">类型，0失败；1成功：</label>
            <div class="col-md-8">
                <input type="text" name="operaLog.status" check-type="required"   class="form-control" id="add_operationlog_status"/>
            </div>
         </div>
                  

    </form>
</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function(){
        $('#operationlog_addform').validation();
    });
</script>

