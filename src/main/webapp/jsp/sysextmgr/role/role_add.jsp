<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
    pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增角色</title>
</head>

<body>
<div id="addroleform" class="panel panel-fit">
    <form action="${baseURL}/role/add.mvc" role="form" class="form-horizontal"  method="post" id="role_addform">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group">
            <label for="add_roleName" class="col-md-2 control-label">名称：</label>
            <div class="col-md-8">
                <input type="text" name="role.roleName" check-type="required" class="form-control" id="add_roleName"/>
            </div>
        </div>

        <div class="form-group">
            <label for="roleDesc" class="col-md-2 control-label">描述：</label>
            <div class="col-md-8">
                <textarea name="role.roleDesc" id="roleDesc"  class="form-control" cols="45" rows="5" ></textarea>
            </div>
        </div>
       <%-- <div class="form-group">
            <label for="permission_list" class="col-md-2 control-label">权限：</label>
            <div class="col-md-9" id="permission_list">
            </div><!-- check-type="required" required-message="请至少选择一项权限" -->
            <input type="hidden" name="role.permissionIds" id="add_role_permissionIds"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>--%>
    </form>
</div>

<!--工具栏 end-->

<script type="text/javascript">

    $(document).ready(function () {
        $('#role_addform').validation();
        //listPermission();
    });

    //加载权限
    function listPermission() {
        $.ajax({
            url:baseURL+'/permissionmgr/permissionmgr!listAllPermission.action',
            type:'post',
            dataType:'json',
            data:{'dqdp_csrf_token': dqdp_csrf_token},
            success:function (result) {

            },
            error:function(){
                window.parent.msg_alert("通讯错误");
            }
        });
    }
</script>

</body>
</html>
