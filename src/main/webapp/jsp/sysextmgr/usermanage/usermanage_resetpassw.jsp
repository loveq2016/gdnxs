<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<div id="usermanage_restpassw"  class="panel panel-fit">
  <form role="form" class="form-horizontal" id="usermanage_restpasswform"   action="${baseURL}/usermanage/updatePassword" method="post">

    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">新密码：</label>
      <div class="col-md-7">
        <input type="password" name="password" check-type="required " maxlength="50" placeholder="请输入新密码" class="form-control" id="view_password"/>
      </div>
    </div>
    <div class="form-group">
      <label for="view_account" class="col-md-4 control-label">确认密码：</label>
      <div class="col-md-7">
        <input type="password" check-type="required " maxlength="50" placeholder="请输入新密码" class="form-control" id="view_password2"/>
      </div>
    </div>


    </form>
  </div>

  <script type="text/javascript">
    $(function(){
      $('#usermanage_restpasswform').validation(
    		  function(obj,params){
  		        if (obj.id=='view_password' ){
  		            if(!$(obj).val()) {
  		                params.err = true;
  		                params.msg = "请填写密码";
  		            }else{
  	            		params.err = false;
  		            	$('#view_password2').blur();
  		            }
  		        }else if (obj.id=='view_password2' ){
  		            if(!$(obj).val()) {
  		                params.err = true;
  		                params.msg = "请确认密码";
  		            }else{
  		            	if($(obj).val() != $('#view_password').val() ){
  		            		params.err = true;
  			                params.msg = "请确认密码2次输入相同";
  		            	}else{
  		            		params.err = false;
  		            	}
  		            }
  		        }
    		  }
  		    ,{reqmark:true} //这个参数是设必填不要显示有星号，默认是有星号的
  		    );
    })

  </script>