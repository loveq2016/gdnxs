
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="agents_view"  class="panel panel-fit">
  <form role="form" class="form-horizontal">

    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">账号：</label>
      <div class="col-md-7">
        <input type="text" name="account" check-type="required " maxlength="50"  class="form-control" id="view_account" disabled/>
      </div>
    </div>

    <div class="form-group">
    <label for="view_name" class="col-md-4 control-label">账号名称：</label>
    <div class="col-md-7">
      <input type="text" name="name" check-type="required " maxlength="50"  class="form-control" id="view_name" disabled/>
    </div>
  </div>

    <div class="form-group">
      <label for="view_password" class="col-md-4 control-label">密码：</label>
      <div class="col-md-7">
        <input type="password" name="password"   class="form-control" id="view_password" disabled/>
      </div>
    </div>

    <div class="form-group">
      <label for="view_status" class="col-md-4 control-label">状态：</label>
      <div class="col-md-7">
        <input type="text" name="status" check-type="required " maxlength="50"  class="form-control" id="view_status" disabled/>
      </div>
    </div>

    <div class="form-group">
      <label for="view_lastTimeLoginTime" class="col-md-4 control-label">拥有角色：</label>
      <div class="col-md-7">
        <input type="text" name="lastTimeLoginTime" check-type="required " maxlength="50"  class="form-control" id="view_role_list" disabled/>
      </div>
    </div>
    
    <div class="form-group">
      <label for="view_lastTimeLoginTime" class="col-md-4 control-label">上一次登陆时间：</label>
      <div class="col-md-7">
        <input type="text" name="lastTimeLoginTime" check-type="required " maxlength="50"  class="form-control" id="view_lastTimeLoginTime" disabled/>
      </div>
    </div>

    <div class="form-group">
      <label for="view_lastTimeLoginIp" class="col-md-4 control-label">上一次登陆IP：</label>
      <div class="col-md-7">
        <input type="text" name="lastTimeLoginIp" check-type="required " maxlength="50"  class="form-control" id="view_lastTimeLoginIp" disabled/>
      </div>
    </div>

    <div class="form-group">
      <label for="view_createTime" class="col-md-4 control-label">注册时间：</label>
      <div class="col-md-7">
        <input type="text" name="createTime" check-type="required " maxlength="50"  class="form-control" id="view_createTime" disabled/>
      </div>
    </div>

    <div class="form-group">
      <label for="view_createByUsr" class="col-md-4 control-label">创建人：</label>
      <div class="col-md-7">
        <input type="text" name="createByUsr" check-type="required " maxlength="50"  class="form-control" id="view_createByUsr" disabled/>
      </div>
    </div>



  </form>
  </div>
