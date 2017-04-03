<%@page language="java" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../../jsp/common/sbadmin_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/sysextmgr/config/config.js"></script>
</head>

<body class="container">
<div class="panel panel-default">

    <div class="panel-heading">
        <h3 class="panel-title">&nbsp;</h3>
    </div>

    <div class="panel-body">

        <!-- 搜索表单 -->
        <form  id="config_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">

                                        <tr class="query-row-1">
                                            <td width="80" height="30" align="right">配置值：</td>
                                            <td width="140"><input name="config.configValue" id="config_configValue"
                                                                   type="text" class="form-control btn-block"
                                                                   placeholder="" aria-describedby="basic-addon1"/></td>
                                            <td width="80" height="30" align="right">描述：</td>
                                            <td width="140"><input name="config.description" id="config_description"
                                                                   type="text" class="form-control btn-block"
                                                                   placeholder="" aria-describedby="basic-addon1"/></td>
                                            <td>&nbsp;</td>
                                            <td colspan="3">
                                                <input class="btn btn-default " name="search" type="button" value="查 询"
                                                       onclick="javascript:page_moudel.config_query();"/>&nbsp;
                                                <input class="btn btn-default" type="button" value="重 置"
                                                       onclick="$('#config_search')[0].reset(),page_moudel.config_query();">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
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

        <!--  表格 -->
        <table id="config_list_table"></table>

        <!--  工具栏 -->
        <div id="config_toolbar">

            <%--<button id="config_add" class="btn btn-success" onclick="page_moudel.add_config()">--%>
                <%--<i class="glyphicon glyphicon-plus"></i> 新增--%>
            <%--</button>--%>

            <%--<button id="config_remove" class="btn btn-danger" onclick="page_moudel.batchdel_config();">--%>
                <%--<i class="glyphicon glyphicon-remove"></i> 删除--%>
            <%--</button>--%>

           <%--<button class="btn btn-success fileinput-button" id="config_export">--%>
                <%--<i class="glyphicon glyphicon-download-alt"></i>--%>
                <%--<span  onclick="page_moudel.config_exportExcel()">导出数据</span>--%>
			<%--</button>--%>

        </div>

    </div>
</div>

</body>
</html>
