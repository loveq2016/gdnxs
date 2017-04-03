<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<div id="usermanage_add"  class="panel panel-fit">
  <form role="form" class="form-horizontal" id="usermanage_addform"   action="${baseURL}/usermanage/addUser" method="post">

    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">账号：</label>
      <div class="col-md-7">
        <input type="text" name="account" check-type="required " maxlength="50" placeholder="请输入账号" class="form-control" id="add_account"/>
      </div>
    </div>
    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">用户名字：</label>
      <div class="col-md-7">
        <input type="text" name="name" check-type="required " maxlength="50" placeholder="请输入用户名字" class="form-control" id="add_name"/>
      </div>
    </div>
    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">密码：</label>
      <div class="col-md-7">
        <input type="password" name="password" check-type="required " maxlength="50" placeholder="请输入密码" class="form-control" id="add_password"/>
      </div>
    </div>
    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">确认密码：</label>
      <div class="col-md-7">
        <input type="password" check-type="required " maxlength="50" placeholder="请确认密码" class="form-control" id="add_password2"/>
      </div>
    </div>
    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">联系电话：</label>
      <div class="col-md-7">
        <input type="text" name="phone"  check-type="required mobile" maxlength="15" placeholder="请输入联系电话" class="form-control" id="add_phone"/>
      </div>
    </div>


    </form>
  </div>

  <script type="text/javascript">
    $(function(){
      $('#usermanage_addform').validation(function(obj,params){
		        if (obj.id=='add_password' ){
		            if(!$(obj).val()) {
		                params.err = true;
		                params.msg = "请填写密码";
		            }else{
	            		params.err = false;
		            	$('#add_password2').blur();
		            }
		        }else if (obj.id=='add_password2' ){
		            if(!$(obj).val()) {
		                params.err = true;
		                params.msg = "请确认密码";
		            }else{
		            	if($(obj).val() != $('#add_password').val() ){
		            		params.err = true;
			                params.msg = "请确认密码2次输入相同";
		            	}else{
		            		params.err = false;
		            	}
		            }
		        }else if(obj.id=='add_account'){
		        	if(!$(obj).val()) {
		                params.err = true;
		                params.msg = "请填写用户账号"
		            }else{
		                $.post(baseURL+'/community/user/sysUserExist',{'_csrf':token ,'account':$('#add_account').val()},function(rec){
		                    if(rec){
		                    	if(rec.num>0){
		                    		params.err = true;
			                        if(params.err){
			                            params.msg = "用户账号已存在!";
			                        }
		                    	}else{
		                    		params.err = false;
		                    	}
		                        
		                    }else{
		                    	$.msg.fail("查询失败");
		                    }
		                },"json").error(function(){
		                	$.msg.fail("查询失败");
		                });
		            }
		        }
		        
		        
		    }
		    ,{reqmark:true} //这个参数是设必填不要显示有星号，默认是有星号的
		    );
		});

  </script>