<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="permission_editform_div" class="panel panel-default">
    <form id="permission_editform" name="permission_editform" role="form" class="form-horizontal"
          action="${pageContext.servletContext.contextPath}/sysextmgr/permission/update.mvc" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="permission.id" class="form-control"
               id="edit_permission_id"/>
        <div class="form-group">
            <label for="edit_permission_permissionCode" class="col-md-2 control-label">权限代码：</label>
            <div class="col-md-8">
                <input type="text" name="permission.permissionCode" check-type="required" class="form-control"
                       id="edit_permission_permissionCode"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_permission_name" class="col-md-2 control-label">权限名称：</label>
            <div class="col-md-8">
                <input type="text" name="permission.name" check-type="required" class="form-control"
                       id="edit_permission_name"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_permission_moduelName" class="col-md-2 control-label">模块名称：</label>
            <div class="col-md-8">
                <input type="text" name="permission.moduelName" check-type="required" class="form-control"
                       id="edit_permission_moduelName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_permission_moduelCode" class="col-md-2 control-label">模块代码：</label>
            <div class="col-md-8">
                <input type="text" name="permission.moduelCode" check-type="required" class="form-control"
                       id="edit_permission_moduelCode"/>
            </div>
        </div>
      <%--  <div class="form-group">
            <label for="edit_permission_permissionType" class="col-md-2 control-label">权限类型：</label>
            <div class="col-md-8">
                <input type="text" name="permission.permissionType" check-type="required" class="form-control"
                       id="edit_permission_permissionType"/>
            </div>
        </div>--%>

    </form>
</div>

<script>
    $(function () {
        $('#permission_editform').validation();
    });
</script>

