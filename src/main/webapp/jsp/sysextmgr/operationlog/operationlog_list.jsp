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
        <form id="operationlog_search">
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">


                                        <tr class="query-row-3">
                                            <td width="60" height="40" align="right">操作用户：</td>
                                            <td width="150"><input name="operaLog.author" id="operationlog_author"
                                                                   type="text" class="form-control btn-block"
                                                                   placeholder="" aria-describedby="basic-addon1"/></td>
                                            <td width="60" height="40" align="right">IP地址：</td>
                                            <td width="150"><input name="operaLog.ip" id="operationlog_ip" type="text"
                                                                   class="form-control btn-block" placeholder=""
                                                                   aria-describedby="basic-addon1"/></td>

                                            <td width="60" height="40" align="right">操作模块：</td>
                                            <td width="150"><input name="operaLog.model" id="operationlog_model"
                                                                   type="text" class="form-control btn-block"
                                                                   placeholder="" aria-describedby="basic-addon1"/></td>

                                            <td width="60" height="40" align="right">操作动作：</td>
                                            <td width="150"><input name="operaLog.operation" id="operationlog_operation"
                                                                   type="text" class="form-control btn-block"
                                                                   placeholder="" aria-describedby="basic-addon1"/></td>
                                            </tr>

                                        <tr>
                                            <td width="80" height="40" align="right">操作时间：</td>
                                            <td width="150">
                                                <div class='input-group date' id='beginTime'>
                                                    <input name="operaLog.beginTime"
                                                           id="operationlog_beginTime" type="text"
                                                           class="form-control "
                                                           data-date-format="YYYY-MM-DD HH:mm"
                                                           placeholder=""
                                                           aria-describedby="basic-addon1"/>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                </div>
                                            </td>
                                            <td width="10" align="center">-</td>
                                            <td width="150">
                                                <div class='input-group date' id='endTime'>
                                                    <input name="operaLog.endTime"
                                                           id="operationlog_endTime" type="text"
                                                           class="form-control "
                                                           data-date-format="YYYY-MM-DD HH:mm"
                                                           placeholder=""
                                                           aria-describedby="basic-addon1"/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                </div>
                                            </td>
                                            <td colspan="3">&nbsp;&nbsp;
                                                <input class="btn btn-default " name="search" type="button" value="查 询"
                                                       onclick="javascript:page_moudel.operationlog_query();"/>
                                                &nbsp;<input class="btn btn-default" type="button" value="重 置"
                                                             onclick="$('#operationlog_search')[0].reset();">
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
        <!--角色信息搜索表单 end-->
        <table id="operationlog_list_table"></table>
        <div id="operationlog_toolbar">
            <%--<button id="operationlog_add" class="btn btn-success" onclick="page_moudel.add_operationlog()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>
            <button id="operationlog_remove" class="btn btn-danger" onclick="page_moudel.batchdel_operationlog();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>
            <button class="btn btn-success fileinput-button" id="operationlog_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span onclick="page_moudel.operationlog_exportExcel()">导出数据</span>
            </button>--%>
        </div>
    </div>
</div>

</body>
</html>
<%@include file="../../../jsp/common/js_common.jsp" %>
<script type="text/javascript" src="${baseURL}/jsp/sysextmgr/operationlog/operationlog.js"></script>