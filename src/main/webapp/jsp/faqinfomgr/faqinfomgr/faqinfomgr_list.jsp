<%@page language="java" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../../jsp/common/css_common.jsp" %>
    <style>
        .default-bootbox-modal .modal-dialog{
            width: 60%;
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
        <form  id="faqinfomgr_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="search_box row">
                                                 <label for="faqinfomgr_title" class="search_label">标题：</label>
                                        <div class="col-xs-3">
                                         <input name="faq.title" id="faqinfomgr_title" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                    </div>
                                                                               <div class="search_fn_box">

                                               <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.faqinfomgr_query();"/>&nbsp;
                                               <input class="btn btn-default" type="button" value="重 置"  onclick="$('#faqinfomgr_search')[0].reset(),page_moudel.faqinfomgr_query();">
                                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;
                                               <a href="javascript:void(0);"   onclick="page_moudel.add_faqinfomgr();">
                                               <i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a>
                                               <a href="javascript:void(0);" onclick="page_moudel.batchdel_faqinfomgr();">
                                               <i class="glyphicon glyphicon-remove"></i>&nbsp;删除
                                               </a>
                                </a>


                                </div>
                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="faqinfomgr_list_table"></table>

        <!--  工具栏 -->
        <div id="faqinfomgr_toolbar">

            <%--  <button id="faqinfomgr_add" class="btn btn-success" onclick="page_moudel.add_faqinfomgr()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="faqinfomgr_remove" class="btn btn-danger" onclick="page_moudel.batchdel_faqinfomgr();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="faqinfomgr_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.faqinfomgr_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/faqinfomgr/faqinfomgr/faqinfomgr.js"></script>
</head>

