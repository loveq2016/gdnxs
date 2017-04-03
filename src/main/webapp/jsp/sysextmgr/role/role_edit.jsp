<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<!-- 修改窗口 -->
<div class="panel panel-fit">
    <form action="${baseURL}/role/update.mvc"  role="form"  class="form-horizontal"  method="post" id="role_editform">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" id="edit_roleId" name="role.id">
        <div class="form-group">
            <label for="edit_roleName" class="col-md-2 control-label">角色名称：</label>
            <div class="col-md-8" >
                <input type="text"  name="role.roleName"  class="form-control" id="edit_roleName" maxlength="40"  check-type="required"/>
            </div>
        </div>

        <div class="form-group">
            <label for="edit_roleDesc" class="col-md-2 control-label">  角色描述：</label>
            <div class="col-md-8" >
                <textarea type="text"  name="role.roleDesc"   rows="5" class="form-control" id="edit_roleDesc" maxlength="300"/>
            </div>
        </div>
    <%--    <div class="form-group">
            <label class="col-md-2 control-label">  角色权限：</label>
            <div id="permission_list" class="col-md-9" ></div>
            <input type="hidden" name="role.permissionIds" id="edit_role_permissionIds"/>
            <input type="hidden" name="role.id" id="edit_roleId"/>
        </div>--%>
    </form>
</div>

<script type="text/javascript">
    $(document).ready(function () {
//        listPermission();
        $('#role_editform').validation();
    });


    <%--function listPermission() {--%>
        <%--$.ajax({--%>
            <%--url:'${baseURL}/permissionmgr/permissionmgr!listAllPermission.action',--%>
            <%--type:'post',--%>
            <%--dataType:'json',--%>
            <%--data:{},--%>
            <%--success:function (result) {--%>

            <%--},--%>
            <%--error:function () {--%>
                <%--window.parent.msg_alert("通讯错误");--%>
            <%--}--%>
        <%--});--%>

    <%--}--%>
</script>


</body>
</html>
