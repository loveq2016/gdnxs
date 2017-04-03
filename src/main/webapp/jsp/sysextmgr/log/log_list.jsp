<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<%@include file="../../../jsp/common/css_common.jsp" %>
  <title>日志</title>
</head>
<body class="container">
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">&nbsp;</h3>
  </div>
  <div class="panel-body">
    <div class="searchMsg panel panel-default">
    	<form action="" method="post" id="logForm">
    		<div class="panel-body">
	    		<table cellspacing="0" cellpadding="0" border="0" width="100%">
	    			<tr>
	    				<td width="100" align="right">综合查询&nbsp;&nbsp;</td>
	    				<td width="140"><input name="" id="logModel" placeholder="类型" type="text" class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
	    				<td width="100" align="right">时间范围&nbsp;&nbsp;</td>
	    				<td width="140">
	    					<div class='input-group date' id='startTime'>
			                    <input type='text' class="form-control" data-date-format="YYYY-MM-DD HH:mm"/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
			            </td>
			            <td width="10" align="center">-</td>
			            <td width="140">
			                <div class='input-group date' id='endTime'>
			                    <input type='text' class="form-control" data-date-format="YYYY-MM-DD HH:mm"/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
			            </td>
			            <td>&nbsp;&nbsp;<input class="btn btn-default " name="search" type="button" value="搜索" onclick="searchLog();"  /></td>
	    			</tr>
	    		</table>
    		</div>
    	</form>
    </div>
    <table id="log_list_table" >
    </table>
    
  </div>
</div>

<!-- hide -->
<div class="modal fade" id ="myModal" tabindex="-1" role="dialog" 
   aria-labelledby = "myModalLabel" aria-hidden="true">
   <div class = "modal-dialog">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
               ×
            </button>
            
            <h4 class="modal-title" id="myModalLabel">
               查看日志
            </h4>
         </div>
         
         <div class="modal-body" id="modal-body">
            <table class="table">
            	<tr>
            		<td width="100" class="text-right">操作时间:</td>
            		<td id="createTime">2015</td>
            	</tr>
            	<tr>
            		<td width="100" class="text-right">操作人员:</td>
            		<td id="author">admin</td>
            	</tr>
            	<tr>
            		<td width="100" class="text-right">IP:</td>
            		<td id="ip">admin</td>
            	</tr>
            	<tr>
            		<td width="100" class="text-right">操作模块:</td>
            		<td id="model">登陆</td>
            	</tr>
            	<tr>
            		<td width="100" class="text-right">操作结果:</td>
            		<td id="status">成功</td>
            	</tr>
            	<tr>
            		<td width="100" class="text-right">操作说明:</td>
            		<td id="description" style="word-wrap:break-word;word-break:break-all;">说明</td>
            	</tr>
            </table>
         </div>
         
         <div class = "modal-footer">
            <button type = "button" class = "btn btn-default" data-dismiss = "modal">
               关闭
            </button>
         </div>
         
      </div>
   </div>
</div>
<!-- hide end -->
</body>
<%@include file="../../../jsp/common/js_common.jsp" %>
<script type="text/javascript" src="${baseURL}/staticres/log/log.js"></script>
</html>

