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
        <form id="menu_search">
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">

                                        <tr class="query-row-1">

                                            <td width="80" height="30" align="right">菜单名称：</td>
                                            <td width="200"><input name="menu.menuName" id="menu_menuName" type="text"
                                                                   class="form-control btn-block" placeholder=""
                                                                   aria-describedby="basic-addon1"/></td>

                                            <td width="80" height="30" align="right">上级菜单：</td>
                                            <td width="200"><select name="menu.parentId" id="menu_parentId"
                                                                    data-src="${pageContext.servletContext.contextPath}/sysextmgr/menu/dirs.mvc"
                                                                    item-text="menuName" item-value="id" default-value=""
                                                                   class="form-control btn-block" placeholder=""
                                                                   aria-describedby="basic-addon1"/></td>

                                            <td colspan="3">
                                                &nbsp;&nbsp;
                                                <input class="btn btn-default " name="search" type="button" value="查 询"
                                                       onclick="javascript:page_moudel.menu_query();"/>
                                                &nbsp;<input class="btn btn-default" type="button" value="重 置"
                                                             onclick="$('#menu_search')[0].reset(),page_moudel.menu_query();">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
                                            </td>
                                 
                                            <td>
                                            	<a id="menu_add" href="javascript:void(0);" onclick="page_moudel.add_menu()">
                									<img src="${baseURL}/staticres/images/tianjia.png"> &nbsp;新增
            									</a>
            									&nbsp;&nbsp;
            									<a id="menu_remove" href="javascript:void(0);"  onclick="page_moudel.batchdel_menu();">
									                <img width="14" height="14" src="${baseURL}/staticres/images/shanchu.png"> &nbsp; 删除
									            </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

            </div>
        </form>
        <!--角色信息搜索表单 end-->
        <table id="menu_list_table"></table>
        <div id="menu_toolbar">
           <!-- 
            <button id="menu_remove" class="btn btn-danger" onclick="page_moudel.batchdel_menu();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button> -->
        </div>
    </div>
</div>

</body>
<%@include file="../../../jsp/common/js_common.jsp" %>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/sysextmgr/menu/menu.js"></script>
</html>

