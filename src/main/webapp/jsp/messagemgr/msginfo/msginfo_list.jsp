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
        <form  id="msginfo_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="search_box row">
                                        <label for="msginfo_title" class="search_label">消息标题：</label>
                                        <div class="col-xs-3">
                                         <input name="queryParams['title']" id="msginfo_title" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                       <label for="name" class="search_label">消息接受者：</label>
                                       <div class="col-xs-3">
                                           <input name="queryParams['name']" id="name" type="text"
                                                  class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                       </div>
                                       <label for="phone" class="search_label">接受者手机：</label>
                                       <div class="col-xs-3">
                                           <input name="queryParams['phone']" id="phone" type="text"
                                                  class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                       </div>
                                         <%--<label for="msginfo_msgdesc" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="msginfo.msgdesc" id="msginfo_msgdesc" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>--%>
                                                                                                                                                                    </div>
                                                                               <div class="search_fn_box">

                                               <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.msginfo_query();"/>&nbsp;
                                               <input class="btn btn-default" type="button" value="重 置"  onclick="$('#msginfo_search')[0].reset(),page_moudel.msginfo_query();">
                                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;


                                </div>
                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="msginfo_list_table"></table>

        <!--  工具栏 -->
        <div id="msginfo_toolbar">

            <%--  <button id="msginfo_add" class="btn btn-success" onclick="page_moudel.add_msginfo()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="msginfo_remove" class="btn btn-danger" onclick="page_moudel.batchdel_msginfo();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="msginfo_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.msginfo_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/messagemgr/msginfo/msginfo.js"></script>
</head>

