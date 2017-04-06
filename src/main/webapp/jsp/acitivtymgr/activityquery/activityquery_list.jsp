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

        <!-- 搜索表单 -->
        <form  id="activityquery_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="search_box row">
                           <label for="title" class="search_label">标题：</label>
                           <div class="col-xs-3">
                               <input name="queryParams['title']" id="title" type="text"
                                      class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                           </div>
                           <label for="name" class="search_label">姓名：</label>
                           <div class="col-xs-3">
                               <input name="queryParams['name']" id="name" type="text"
                                      class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                           </div>
                           <label for="phone" class="search_label">联系号码：</label>
                           <div class="col-xs-3">
                               <input name="queryParams['phone']" id="phone" type="text"
                                      class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                           </div>
                                      </div>
                                        <div class="search_box row row-9">
                                                                                                                                                               <div class="search_fn_box">

                                               <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.activityquery_query();"/>&nbsp;
                                               <input class="btn btn-default" type="button" value="重 置"  onclick="$('#activityquery_search')[0].reset(),page_moudel.activityquery_query();">
                                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;
                                               <a href="javascript:void(0);" onclick="page_moudel.activityquery_export()">
                                               <i class="glyphicon glyphicon-download-alt"></i>&nbsp;导出数据
                                </a>


                                </div>
                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="activityquery_list_table"></table>

        <!--  工具栏 -->
        <div id="activityquery_toolbar">

            <%--  <button id="activityquery_add" class="btn btn-success" onclick="page_moudel.add_activityquery()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="activityquery_remove" class="btn btn-danger" onclick="page_moudel.batchdel_activityquery();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="activityquery_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.activityquery_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/acitivtymgr/activityquery/activityquery.js"></script>
</head>

