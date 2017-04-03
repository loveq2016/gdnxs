<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	
<%--	<%@ include file="sbadmin_common.jsp" %>--%>
	
	 <style>
		body {
		background-color: white;
		margin:10px;
		padding:0;
		text-align: center;
		border-top: 0px;
		}
		div, p, table, th, td {
			list-style:none;
			margin:0; padding:0;
			color:#333; font-size:12px;
			/*font-family:dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;*/
		}
		#testIframe {margin-left: 10px;}
		
		.modal-footer{
			 border-top: 0px;
		}
		  
	  </style>
	  
	  <script type="text/javascript">
	  
		var zTree;
		var demoIframe;
		
		var setting = {
				check:{
					enable:true,
					chkboxType:{ "Y" : "s", "N" : "s" }
				},
				view: {
					dblClickExpand: false,
					showLine: false,
					selectedMulti: true
				},
				data: {
					simpleData: {
						enable:true,
						idKey: "ID",
						pIdKey: "PARENT_AGENT_ID",
						rootPId: ""
					}
					,
					key:{
						checked: "isChecked"
					}
				},
				callback: {
					onClick : function(treeId, treeNode) {
				            
					}
				}
			};
		
		  $(function(){
			  
// 			   	$.ajax({
// 			   		url:"${baseURL}/sysmgr/getPermissionTree?${_csrf.parameterName}=${_csrf.token}" + "&permissionIds=" + roleTable.currentrow.PERMISSION_IDS,
// 			   		type:"post",
// 			   		dataType:"json",
// 			   		success:function(response){
			   			
// 			   			if(response && response.success == true) {
							
// 			   				var t = $("#tree");
// 			   				t = $.fn.zTree.init(t, setting, response.nodes);
			   				
// 			   				demoIframe = $("#testIframe");
// 			   				demoIframe.bind("load", loadReady);
			   				
// 			   				var zTree = $.fn.zTree.getZTreeObj("tree");
// 			   				zTree.selectNode(zTree.getNodeByParam("id", 101));
			   				
// 			   			} else {
// 			   				$.msg.fail(response.msg);
// 			   			}
			   			
// 			   		},error:function(e){
// 			   			$.msg.fail("获取数据失败,请重试！");
// 			   		}		
			
// 			   	});
			   	
		  });
	  
		function loadReady() {
			var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
			htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
			maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
			h = demoIframe.height() >= maxH ? minH:maxH ;
			if (h < 530) h = 530;
			demoIframe.height(h);
		}
		
	  </script>
  
  </head>
  
  <body>
		
		<!-- 用户的角色列表,回显用 
		<input type="hidden" id="roleIds" name="roleIds"  />-->
	
<!-- 		<table border=0 height=300px align=left > -->
<!-- 			<tr> -->
<!-- 				<td width=260px align=left valign=top style=""> -->
<!-- 					<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul> -->
<!-- 				</td> -->
<!-- 			</tr>	 -->
<!-- 		</table> -->
  		<div id="rolelistdiv"></div>
  </body>
  <script>
  		var checkboxs = $('#rolelistdiv').checkboxTable({
  			columns:3,//默认显示每行显示列数
            url:"${baseURL}/sysmgr/getPermissionTree?${_csrf.parameterName}=${_csrf.token}" ,//远程数据源
            method:"post",//请求方法
            params:{permissionIds:roleTable.currentrow.PERMISSION_IDS},//请求参数
            itemText:"NAME",//要显示的字段
            itemValue:"ID",//隐藏的字段
            groupKey:"MODUEL_NAME",//分组类别
            groupData:"item",//分组数据
            itemClass:"checkbox-table-item",//每一行的样式
            headerClass:"checkbox-table-header",//类别样式
            defaultValue:roleTable.currentrow.PERMISSION_IDS
  		})
  </script>
</html>
