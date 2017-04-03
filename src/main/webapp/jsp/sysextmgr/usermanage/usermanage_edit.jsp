<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<div id="usermanage_edit"  class="panel panel-fit">
  <form role="form" class="form-horizontal" id="usermanage_editform"   action="${baseURL}/usermanage/updateUser" method="post">

    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">账号：</label>
      <div class="col-md-7">
        <input type="text" name="account" readonly="readonly" placeholder="请输入账号" class="form-control" id="edit_account"/>
      </div>
    </div>
    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">用户名字：</label>
      <div class="col-md-7">
        <input type="text" name="name" check-type="required " maxlength="50" placeholder="请输入用户名字" class="form-control" id="edit_name"/>
      </div>
    </div>
    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">联系电话：</label>
      <div class="col-md-7">
        <input type="text" name="phone"  check-type="required " maxlength="15" placeholder="请输入联系电话" class="form-control" id="edit_phone"/>
      </div>
    </div>


    </form>
  </div>

  <script type="text/javascript">
    $(function(){
      $('#usermanage_editform').validation();
    });

  </script>