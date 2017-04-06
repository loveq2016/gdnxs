<%@page language="java" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../../jsp/common/css_common.jsp" %>
    <style>
        .default-bootbox-modal .modal-dialog{
            width: 60%;
        }
        .my_modal .modal-dialog{
            width: 90%;
        }

    </style>
</head>
<body class="container">
<div class="panel panel-default">

    <div class="panel-heading">
        <h3 class="panel-title">&nbsp;</h3>
    </div>

    <div class="panel-body">

        <!-- 搜索表单 -->
        <form  id="activity_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">

                    <div class="panel-body">
                       <div class="search_box row">
                             <label for="activity_title" class="search_label">标题：</label>
                            <div class="col-xs-3">
                             <input name="activity.title" id="activity_title" type="text"
                                            class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                            </div>

                           <label for="activity_astatus" class="search_label">活动状态：</label>
                           <div class="col-xs-3">
                               <select name="activity.astatus" id="activity_astatus"
                                      class="form-control btn-block" placeholder="" dict-type="ACTSTATUS" aria-describedby="basic-addon1"></select>
                           </div>
                           </div>

                        <div class="search_fn_box" style="float: right">

                            <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.activity_query();"/>&nbsp;
                            <input class="btn btn-default" type="button" value="重 置"  onclick="$('#activity_search')[0].reset(),page_moudel.activity_query();">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;
                            <a href="javascript:void(0);"   onclick="page_moudel.add_activity();">
                                <i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a>
                            <a href="javascript:void(0);" onclick="page_moudel.batchdel_activity();">
                                <i class="glyphicon glyphicon-remove"></i>&nbsp;删除
                            </a>


                        </div>

                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="activity_list_table"></table>

        <!--  工具栏 -->
        <div id="activity_toolbar">

            <%--  <button id="activity_add" class="btn btn-success" onclick="page_moudel.add_activity()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="activity_remove" class="btn btn-danger" onclick="page_moudel.batchdel_activity();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="activity_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.activity_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/acitivtymgr/activity/activity.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
</head>

