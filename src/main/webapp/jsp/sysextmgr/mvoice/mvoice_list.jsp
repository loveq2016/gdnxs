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
        <form  id="mvoice_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="search_box row">
                                                                                                                                                                <label for="mvoice_id" class="search_label">id：</label>
                                        <div class="col-xs-3">
                                         <input name="mvoice.id" id="mvoice_id" type="text"
                                                        class="form-control btn-block" placeholder="id" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="mvoice_keyName" class="search_label">键名：</label>
                                        <div class="col-xs-3">
                                         <input name="mvoice.keyName" id="mvoice_keyName" type="text"
                                                        class="form-control btn-block" placeholder="键名" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="mvoice_chinaName" class="search_label">中文名：</label>
                                        <div class="col-xs-3">
                                         <input name="mvoice.chinaName" id="mvoice_chinaName" type="text"
                                                        class="form-control btn-block" placeholder="中文名" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-3">
                                                                                                                                                                                                        <label for="mvoice_englishName" class="search_label">英文名：</label>
                                        <div class="col-xs-3">
                                         <input name="mvoice.englishName" id="mvoice_englishName" type="text"
                                                        class="form-control btn-block" placeholder="英文名" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="mvoice_status" class="search_label">状态：</label>
                                        <div class="col-xs-3">
                                         <input name="mvoice.status" id="mvoice_status" type="text"
                                                        class="form-control btn-block" placeholder="状态" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="mvoice_createPerson" class="search_label">创建人：</label>
                                        <div class="col-xs-3">
                                         <input name="mvoice.createPerson" id="mvoice_createPerson" type="text"
                                                        class="form-control btn-block" placeholder="创建人" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-6">
                                                                                                                                                                                                        <label for="mvoice_createTime" class="search_label">创建时间：</label>
                                        <div class="col-xs-3">
                                         <input name="mvoice.createTime" id="mvoice_createTime" type="text"
                                                        class="form-control btn-block" placeholder="创建时间" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                    </div>
                                                                               <div class="search_fn_box">

                                               <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.mvoice_query();"/>&nbsp;
                                               <input class="btn btn-default" type="button" value="重 置"  onclick="$('#mvoice_search')[0].reset(),page_moudel.mvoice_query();">
                                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;
                                               <a href="javascript:void(0);"   onclick="page_moudel.add_mvoice();">
                                               <i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a>
                                               <a href="javascript:void(0);" onclick="page_moudel.batchdel_mvoice();">
                                               <i class="glyphicon glyphicon-remove"></i>&nbsp;删除
                                               </a>
                                               <a href="javascript:void(0);" onclick="page_moudel.generator_mvoice()">
                                               <i class="glyphicon glyphicon-download-alt"></i>&nbsp;导出数据
                                </a>


                                </div>
                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="mvoice_list_table"></table>

        <!--  工具栏 -->
        <div id="mvoice_toolbar">

            <%--  <button id="mvoice_add" class="btn btn-success" onclick="page_moudel.add_mvoice()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="mvoice_remove" class="btn btn-danger" onclick="page_moudel.batchdel_mvoice();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="mvoice_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.mvoice_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/sysextmgr/mvoice/mvoice.js"></script>
</head>

