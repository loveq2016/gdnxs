<%@page language="java" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../../jsp/common/css_common.jsp" %>


</head>

<body class="container">
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">&nbsp;</h3>
    </div>
    <div class="panel-body">
        <!-- 信息搜索表单 -->
        <form id="permission_search">
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">

                                        <tr class="query-row-1">

                                            <td width="80" height="30" align="right">权限代码：</td>
                                            <td width="200"><input name="permission.permissionCode"
                                                                   id="permission_permissionCode" type="text"
                                                                   class="form-control btn-block" placeholder=""
                                                                   aria-describedby="basic-addon1"/></td>
                                            <td width="80" height="30" align="right">权限名称：</td>
                                            <td width="200"><input name="permission.name" id="permission_name"
                                                                   type="text" class="form-control btn-block"
                                                                   placeholder="" aria-describedby="basic-addon1"/></td>

                                            <td>
                                                &nbsp;&nbsp;
                                                <input class="btn btn-default " name="search" type="button" value="查 询"
                                                       onclick="javascript:page_moudel.permission_query();"/>
                                                &nbsp;<input class="btn btn-default" type="button" value="重 置"
                                                             onclick="$('#permission_search')[0].reset(),page_moudel.permission_query();">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
                                            </td>
				                            <td>
											  	<a id="add"  href="javascript:void(0);" onclick="page_moudel.add_permission()">
													<img src="${baseURL}/staticres/images/tianjia.png"> &nbsp;新增
												</a>
												&nbsp;&nbsp;
												<a id="remove" href="javascript:void(0);" onclick="page_moudel.batchdel_permission();">
														<img width="14" height="14" src="${baseURL}/staticres/images/shanchu.png"> &nbsp;删除
												</a>
						  					</td>

                                        </tr>

                                         <%--<tr><td colspan="4">&nbsp;</td></tr>--%>
                                         <%--<tr class="query-row-3">--%>
                                             <%--<td width="30" height="30" align="right">模块代码：</td>--%>
                                             <%--<td width="140"><input name="permission.moduelCode"--%>
                                                                    <%--id="permission_moduelCode" type="text"--%>
                                                                    <%--class="form-control btn-block" placeholder=""--%>
                                                                    <%--aria-describedby="basic-addon1"/></td>--%>
                                             <%--<td width="30" height="30" align="right">模块名称：</td>--%>
                                             <%--<td width="140"><input name="permission.moduelName"--%>
                                                                    <%--id="permission_moduelName" type="text"--%>
                                                                    <%--class="form-control btn-block" placeholder=""--%>
                                                                    <%--aria-describedby="basic-addon1"/></td>--%>

                                         <%--</tr>--%>

                                        <%--  <tr>
                                              <td>&nbsp;</td>
                                              <td colspan="3">
                                                  <br/>
                                                  <input class="btn btn-default " name="search" type="button" value="查 询"
                                                         onclick="javascript:page_moudel.permission_query();"/>
                                                  &nbsp;<input class="btn btn-default" type="button" value="重 置"
                                                               onclick="$('#permission_search')[0].reset(),page_moudel.permission_query();">
                                                  <input type="hidden" name="${_csrf.parameterName}"
                                                         value="${_csrf.token}"/>
                                              </td>
                                          </tr>--%>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

            </div>
        </form>
        <!--角色信息搜索表单 end-->
        <table id="permission_list_table"></table>
        <%-- <div id="permission_toolbar">
            <button id="permission_add" class="btn btn-default" onclick="page_moudel.add_permission()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>
            <button id="permission_remove" class="btn btn-default" onclick="page_moudel.batchdel_permission();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>
           <button class="btn btn-success fileinput-button" id="permission_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span onclick="page_moudel.permission_exportExcel()">导出数据</span>
            </button>
        </div> --%>
    </div>
</div>

</body>
</html>
<%@include file="../../../jsp/common/js_common.jsp" %>
<script type="text/javascript" src="${baseURL}/jsp/sysextmgr/permission/permission.js"></script>
