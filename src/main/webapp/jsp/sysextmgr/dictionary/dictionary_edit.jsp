<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<html>
<head>
  <title></title>
</head>
<body>
<div id="dictionary_edit" class="panel panel-fit" >
  <form id="dictionary_editform" name="dictionary_editform" role="form" class="form-horizontal" action="${baseURL}/sysmgr/updateDictionary" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" name="id" id="edit_id">
    <input type="hidden" name="level" id="edit_level">
    <div class="form-group">
      <label for="edit_dictType" class="col-md-3 control-label">字典类型：</label>
      <div class="col-md-8">
        <input type="text" name="dictType" id="edit_dictType"     class="form-control" />
      </div>
    </div>

    <div class="form-group">
      <label for="edit_dictTypeDesc" class="col-md-3 control-label">字典描述：</label>
      <div class="col-md-8">
        <input type="text" name="dictTypeDesc" id="edit_dictTypeDesc"    class="form-control" />
      </div>
    </div>

    <div class="form-group">
      <label for="edit_itemCode" class="col-md-3 control-label">字典分类码：</label>
      <div class="col-md-8">
        <input type="text" name="itemCode" id="edit_itemCode"     class="form-control"/>
      </div>
    </div>

    <div class="form-group">
      <label for="edit_itemCodeDesc" class="col-md-3 control-label">字典分类描述：</label>
      <div class="col-md-8">
        <input type="text" name="itemCodeDesc" id="edit_itemCodeDesc" class="form-control" />
      </div>
    </div>

  </form>
</div>
</body>

<script type="text/javascript">
  $(function(){
    $('#dictionary_editform').validation();//初始化验证
  });
</script>

</html>
