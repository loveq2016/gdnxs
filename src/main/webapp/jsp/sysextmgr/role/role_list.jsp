<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

	<%@include file="../../../jsp/common/css_common.jsp" %>
  <title>角色列表</title>
</head>
<body class="container">
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">角色管理</h3>
  </div>
  <div class="panel-body">
  
    <!-- 角色信息搜索表单    -->
    <form action="" method="post" id="role_search" >
    
      <div class="searchDiv" >
      
        <div class="panel panel-default">
          <div class="panel-body"> 

                  <table class="search" width="100%"  brole="0" cellspacing="0"  cellpadding="0"  >

					  <tr>
						  <td width="100" height="30" align="right">角色名称：</td>
						  <td width="140">
							  <input type="text" class="form-control" name="role.roleName" id="roleName">
						  </td>
						  <td width="100" height="30" align="right">角色描述：</td>
						  <td width="140">
							  <input type="text" class="form-control" name="role.roleDesc" id="roleDesc">
							  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						  </td>
						  <td>&nbsp;&nbsp;<input class="btn btn-default " name="search" type="button" value="搜索" onclick="javascript:role_search();"/>
							  &nbsp;&nbsp;<input class="btn btn-default" type="button" value="重置" onclick="javascript:document.getElementById('role_search').reset();"/>
						  </td>
						  <td>
						  	<a id="add"  href="javascript:void(0);" onclick="addRole()">
								<img src="${baseURL}/staticres/images/tianjia.png"> &nbsp;新增
							</a>
							&nbsp;&nbsp;
							<a id="remove" href="javascript:void(0);" onclick="delRole()">
									<img width="14" height="14" src="${baseURL}/staticres/images/shanchu.png"> &nbsp;删除
								</a>
						  </td>
						  
					  </tr>

				  </table>

          </div>
        </div>

      </div>
    </form>
    
    <!--权限信息搜索表单 end-->
    <table id="role_list_table" >
    	
    </table>
    
    <!-- 工具栏 -->
    <div id="role_toolbar">

		
<!-- 
		<button id="remove" class="btn btn-danger" onclick="delRole()">
			<i class="glyphicon glyphicon-remove"></i> 删除
		</button> -->
    </div>
    
  </div>
</div>

</body>
</html>
<%@include file="../../../jsp/common/js_common.jsp" %>
<script type="text/javascript" src="role.js"></script>
