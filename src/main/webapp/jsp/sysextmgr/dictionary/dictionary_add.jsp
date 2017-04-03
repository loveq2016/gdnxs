<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/10/21
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<html>
<head>
    <title></title>
</head>
<body>
<div id="dictionary_add" class="panel panel-fit" >

  <form id="dictionary_addform" name="dictionary_addform" role="form" class="form-horizontal" action="${baseURL}/sysmgr/addDictionary" method="post">

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    <div class="form-group">
      <label for="" class="col-md-3 control-label">字典类型：</label>
      <div class="col-md-8">
        <input type="text" name="dictType" check-type="required"  placeholder="请输入字典类型"  class="form-control" id=""/>
      </div>
    </div>

    <div class="form-group">
      <label for="" class="col-md-3 control-label">字典描述：</label>
      <div class="col-md-8">
        <input type="text" name="dictTypeDesc" check-type="required"  placeholder="请输入字典描述"  class="form-control" id=""/>
      </div>
    </div>

    </form>
  </div>
</body>

<script type="text/javascript">
  $(function(){

    $('#dictionary_addform').validation();//初始化验证

  });
</script>

</html>
