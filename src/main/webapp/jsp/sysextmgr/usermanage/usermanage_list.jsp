
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@include file="../../../jsp/common/css_common.jsp" %>
  <title>用户管理</title>
</head>
<body class="container">
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">&nbsp;</h3>
  </div>
  <div class="panel-body">

    <form action="" method="post" id="usermanage_search">
      <div class="searchDiv">
        <div class="panel panel-default">
          <div class="panel-body">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="searchLeft"></td>
                <td class="searchBg">
                  <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">

                          <tr>
                            <td width="100" height="30" align="right">账号：</td>
                            <td width="150"><input name="account" id="account" type="text" class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>

                            <td width="90" height="30" align="right">&nbsp;账号名称：</td>
                            <td width="150"><input name="name" id="name" type="text" class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>

                            <td width="80" height="30" align="right">&nbsp;状态：</td>
                            <td width="160">
                              <select class="form-control"  name="status" id="status">
                                <option value="">请选择</option>
                                <option value ="1">正常</option>
                                <option value ="0">禁止登陆</option>
                                <%--<option value="2">登陆失败超三次</option>--%>
                              </select>
                            </td>

                            <td>&nbsp;&nbsp;<input class="btn btn-default " name="search" type="button" value="搜索" onclick="javascript:usermanage_search();"/>

                              &nbsp;&nbsp;<input class="btn btn-default" type="button" value="重置" onclick="$('#usermanage_search')[0].reset(),usermanage_search();"/>
                           
                            	
     						</td>
     						<td>
     							<a id="add" href="javascript:void(0);"  onclick="agents_add()">
       								 <img src="${baseURL}/staticres/images/tianjia.png"> &nbsp;新增
     							 </a>
     						</td>
     						
                          </tr>



                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td class="searchRight"></td>
              </tr>
              <tr>
                <td class="searchButtomLeft"></td>
                <td class="searchButtom"></td>
                <td class="searchButtoRight"></td>
              </tr>
            </table>
          </div>
        </div>

      </div>
    </form>
    <table id="usermanage_list_table"></table>
    <!--权限信息搜索表单 end-->
    <div id="usermanage_toolbar">
      

      <%--<button  class="btn btn-danger" onclick="batchStatus();" >--%>
        <%--<i class=""></i> 禁用--%>
      <%--</button>--%>

      <%--<button  class="btn btn-success" onclick="batchCancelStatus();" >--%>
        <%--<i class=""></i> 启用--%>
      <%--</button>--%>

    </div>
  </div>
</div>

</body>

</html>
<%@include file="../../../jsp/common/js_common.jsp" %>
<script type="text/javascript" src="${baseURL}/jsp/sysextmgr/usermanage/usermanage.js"></script>

