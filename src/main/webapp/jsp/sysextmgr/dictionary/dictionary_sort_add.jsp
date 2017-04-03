<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/2/22
  Time: 22:16
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
  <form id="dictionary_sort_addform" name="dictionary_sort_addform" role="form" class="form-horizontal" action="${baseURL}/sysmgr/addDictionarySort" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="add_id" name="parentId" />
    <input type="hidden" id="add_level" name="level" />
    <input type="hidden" id="add_dictType" name="dictType" />
    <input type="hidden" id="add_dictTypeDesc" name="dictTypeDesc" />

    <div class="form-group">
      <label for="add_itemCode" class="col-md-3 control-label">字典分类码：</label>
      <div class="col-md-8">
        <input type="text" name="itemCode" check-type="required"  placeholder="请输入分类码"  class="form-control" id="add_itemCode"/>
      </div>
    </div>

    <div class="form-group">
      <label for="add_itemCodeDesc" class="col-md-3 control-label">字典分类描述：</label>
      <div class="col-md-8">
        <input type="text" name="itemCodeDesc" check-type="required"  placeholder="请输入分类描述"  class="form-control" id="add_itemCodeDesc"/>
      </div>
    </div>

  </form>
</div>
</body>

<script type="text/javascript">
  $(function(){
    $('#dictionary_sort_addform').validation();//初始化验证
  });
</script>

</html>
