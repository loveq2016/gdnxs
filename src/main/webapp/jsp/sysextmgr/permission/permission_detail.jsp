<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="permission_view_div" class="panel panel-default">
    <form role="form" class="form-horizontal">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="form-group">
            <label for="view_permission_permissionCode" class=" col-md-3 control-label">权限代码：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_permission_permissionCode"></div>
        </div>
        <div class="form-group">
            <label for="view_permission_name" class=" col-md-3 control-label">权限名称：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_permission_name"></div>
        </div>
        <div class="form-group">
            <label for="view_permission_moduelName" class=" col-md-3 control-label">模块名称：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_permission_moduelName"></div>
        </div>
        <div class="form-group">
            <label for="view_permission_moduelCode" class=" col-md-3 control-label">模块代码：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_permission_moduelCode"></div>
        </div>

    </form>
</div>
