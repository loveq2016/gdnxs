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
        <form  id="area_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="search_box row">
                                                                                                                                                                <label for="area_id" class="search_label">id：</label>
                                        <div class="col-xs-3">
                                         <input name="area.id" id="area_id" type="text"
                                                        class="form-control btn-block" placeholder="id" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="area_city" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="area.city" id="area_city" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="area_areatext" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="area.areatext" id="area_areatext" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-3">
                                                                                                                                                                                                        <label for="area_createdate" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="area.createdate" id="area_createdate" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                    </div>
                                                                               <div class="search_fn_box">

                                               <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.area_query();"/>&nbsp;
                                               <input class="btn btn-default" type="button" value="重 置"  onclick="$('#area_search')[0].reset(),page_moudel.area_query();">
                                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;
                                               <a href="javascript:void(0);"   onclick="page_moudel.add_area();">
                                               <i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a>
                                               <a href="javascript:void(0);" onclick="page_moudel.batchdel_area();">
                                               <i class="glyphicon glyphicon-remove"></i>&nbsp;删除
                                               </a>
                                               <a href="javascript:void(0);" onclick="page_moudel.generator_area()">
                                               <i class="glyphicon glyphicon-download-alt"></i>&nbsp;导出数据
                                </a>


                                </div>
                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="area_list_table"></table>

        <!--  工具栏 -->
        <div id="area_toolbar">

            <%--  <button id="area_add" class="btn btn-success" onclick="page_moudel.add_area()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="area_remove" class="btn btn-danger" onclick="page_moudel.batchdel_area();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="area_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.area_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/sysextmgr/area/area.js"></script>
</head>

