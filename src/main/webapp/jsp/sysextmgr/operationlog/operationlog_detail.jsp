<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="operationlog_view_div" class="panel panel-default">
    <form role="form" class="form-horizontal">
        <div class="form-group"></div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


        <div class="form-group">
            <label for="view_operationlog_author" class=" col-md-3 control-label">操作用户：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_operationlog_author"></div>
        </div>

        <div class="form-group">
            <label for="view_operationlog_ip" class=" col-md-3 control-label">IP地址：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_operationlog_ip"></div>
        </div>

        <div class="form-group">
            <label for="view_operationlog_model" class=" col-md-3 control-label">操作模块：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_operationlog_model"></div>
        </div>

        <div class="form-group">
            <label for="view_operationlog_operation" class=" col-md-3 control-label">操作动作：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_operationlog_operation"></div>
        </div>

        <div class="form-group">
            <label for="view_operationlog_description" class=" col-md-3 control-label">详细说明：</label>
            <div class="col-md-7" style="margin-top: 7px;overflow: auto" id="view_operationlog_description"></div>
        </div>

        <div class="form-group">
            <label for="view_operationlog_createTime" class=" col-md-3 control-label">操作时间：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_operationlog_createTime"></div>
        </div>

        <div class="form-group">
            <label for="view_operationlog_status" class=" col-md-3 control-label">操作结果：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_operationlog_status"></div>
        </div>
    </form>
</div>
<script type="text/javascript"
        src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
