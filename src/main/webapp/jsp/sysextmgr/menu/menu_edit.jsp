<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="menu_editform_div" class="panel panel-default">
    <form id="menu_editform" name="menu_editform" role="form" class="form-horizontal"
          action="${pageContext.servletContext.contextPath}/sysextmgr/menu/update.mvc" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="menu.id"  class="form-control" id="edit_menu_id"/>

        <div class="form-group">
            <label for="edit_menu_menuName" class="col-md-3 control-label">菜单名称：</label>
            <div class="col-md-8">
                <input type="text" name="menu.menuName" check-type="required" class="form-control"
                       id="edit_menu_menuName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_menu_menuType" class="col-md-3 control-label">菜单类型：</label>
            <div class="col-md-8">
                <select name="menu.menuType" check-type="required" class="form-control"
                        dict-type="menuType"
                       id="edit_menu_menuType"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_menu_menuLink" class="col-md-3 control-label">菜单地址：</label>
            <div class="col-md-8">
                <input type="text" name="menu.menuLink" class="form-control"
                       id="edit_menu_menuLink"/>
            </div>
        </div>

        <div class="form-group">
            <label for="edit_menu_menuPermission" class="col-md-3 control-label">菜单权限：</label>
            <div class="col-md-8">
                <input type="text" name="menu.menuPermission"  class="form-control"
                       id="edit_menu_menuPermission"/>
            </div>
        </div>

        <div class="form-group">
            <label for="edit_menu_orderNum" class="col-md-3 control-label">显示顺序：</label>
            <div class="col-md-8">
                <input type="text" name="menu.orderNum"  class="form-control"
                       id="edit_menu_orderNum"/>
            </div>
        </div>

        <div class="form-group">
            <label for="edit_menu_parentMenuName" class="col-md-3 control-label">上级菜单名称：</label>
            <div class="col-md-8">
                <select  name="menu.parentId"  class="form-control"
                         data-src="${pageContext.servletContext.contextPath}/sysextmgr/menu/dirs.mvc"
                         item-text="menuName" item-value="id"
                       id="edit_menu_parentMenuName"/>
            </div>
        </div>

        <div class="form-group">
            <label for="edit_menu_desc" class="col-md-3 control-label">备注：</label>
            <div class="col-md-8">
                 <textarea name="menu.desc"  class="form-control"
                           id="edit_menu_desc"></textarea>
            </div>
        </div>

    </form>
</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function () {
        $('#menu_editform').validation();
    });
</script>

