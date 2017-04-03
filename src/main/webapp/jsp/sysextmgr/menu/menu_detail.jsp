<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="menu_view_div" class="panel panel-default">
    <form role="form" class="form-horizontal">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group">
            <label for="view_menu_menuName" class=" col-md-3 control-label">菜单名称：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_menu_menuName"></div>
        </div>
        <div class="form-group">
            <label for="view_menu_menuType" class=" col-md-3 control-label">菜单类型：</label>
            <div class="col-md-7" style="margin-top: 7px;"  id="view_menu_menuType"></div>
        </div>
        <div class="form-group">
            <label for="view_menu_menuLink" class=" col-md-3 control-label">菜单地址：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_menu_menuLink"></div>
        </div>
        <div class="form-group">
            <label for="view_menu_menuPermission" class=" col-md-3 control-label">菜单权限：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_menu_menuPermission"></div>
        </div>

        <div class="form-group">
            <label for="view_menu_orderNum" class=" col-md-3 control-label">显示顺序：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_menu_orderNum"></div>
        </div>

        <div class="form-group">
            <label for="view_menu_parentMenuName" class=" col-md-3 control-label">上级菜单名称：</label>
            <div class="col-md-7" style="margin-top: 7px;" id="view_menu_parentMenuName">

            </div>
        </div>

        <div class="form-group">
            <label for="view_menu_desc" class=" col-md-3 control-label">备注：</label>
            <div class="col-md-7" style="margin-top: 7px; overflow: auto;" id="view_menu_desc" ></div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
