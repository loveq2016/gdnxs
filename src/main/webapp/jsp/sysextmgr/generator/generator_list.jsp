<%@page language="java" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../../jsp/common/css_common.jsp" %>
    <style>
        .default-bootbox-modal .modal-dialog{width: 70%;}
    </style>
</head>
<body class="container">
<div class="panel panel-default">

    <div class="panel-heading">
        <h3 class="panel-title">&nbsp;</h3>
    </div>

    <div class="panel-body">

        <!-- 搜索表单 -->
        <form  id="generator_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="search_box row">
                                                                                                                                                                <label for="generator_id" class="search_label">id：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.id" id="generator_id" type="text"
                                                        class="form-control btn-block" placeholder="id" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_rootPath" class="search_label">项目根路径：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.rootPath" id="generator_rootPath" type="text"
                                                        class="form-control btn-block" placeholder="项目根路径" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_srcRootPath" class="search_label">java代码路径：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.srcRootPath" id="generator_srcRootPath" type="text"
                                                        class="form-control btn-block" placeholder="java代码路径" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-3">
                                                                                                                                                                                                        <label for="generator_webRootPath" class="search_label">jsp页面路径：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.webRootPath" id="generator_webRootPath" type="text"
                                                        class="form-control btn-block" placeholder="jsp页面路径" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_tableName" class="search_label">表名：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.tableName" id="generator_tableName" type="text"
                                                        class="form-control btn-block" placeholder="表名" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_dbName" class="search_label">数据库：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.dbName" id="generator_dbName" type="text"
                                                        class="form-control btn-block" placeholder="数据库" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-6">
                                                                                                                                                                                                        <label for="generator_javaName" class="search_label">java文件前缀：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.javaName" id="generator_javaName" type="text"
                                                        class="form-control btn-block" placeholder="java文件前缀" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_componentName" class="search_label">组件包名：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.componentName" id="generator_componentName" type="text"
                                                        class="form-control btn-block" placeholder="组件包名" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_componentNamezhCn" class="search_label">组件中文名：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.componentNamezhCn" id="generator_componentNamezhCn" type="text"
                                                        class="form-control btn-block" placeholder="组件中文名" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-9">
                                                                                                                                                                                                        <label for="generator_moduelName" class="search_label">模块包名：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.moduelName" id="generator_moduelName" type="text"
                                                        class="form-control btn-block" placeholder="模块包名" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_moduelNameznCn" class="search_label">模块中文名称：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.moduelNameznCn" id="generator_moduelNameznCn" type="text"
                                                        class="form-control btn-block" placeholder="模块中文名称" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_voSql" class="search_label">生成vo的sql：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.voSql" id="generator_voSql" type="text"
                                                        class="form-control btn-block" placeholder="生成vo的sql" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-12">
                                                                                                                                                                                                        <label for="generator_user" class="search_label">创建人：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.user" id="generator_user" type="text"
                                                        class="form-control btn-block" placeholder="创建人" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="generator_time" class="search_label">创建时间：</label>
                                        <div class="col-xs-3">
                                         <input name="sysGenerator.time" id="generator_time" type="text"
                                                        class="form-control btn-block" placeholder="创建时间" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                    </div>
                                                                               <div class="search_fn_box">

                                               <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.generator_query();"/>&nbsp;
                                               <input class="btn btn-default" type="button" value="重 置"  onclick="$('#generator_search')[0].reset(),page_moudel.generator_query();">
                                               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;
                                               <a href="javascript:void(0);"   onclick="page_moudel.add_generator();">
                                               <i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a>
                                               <a href="javascript:void(0);" onclick="page_moudel.batchdel_generator();">
                                               <i class="glyphicon glyphicon-remove"></i>&nbsp;删除
                                               </a>
                                               <a href="javascript:void(0);" onclick="page_moudel.generator_generator()">
                                               <i class="glyphicon glyphicon-download-alt"></i>&nbsp;导出数据
                                </a>


                                </div>
                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="generator_list_table"></table>

        <!--  工具栏 -->
        <div id="generator_toolbar">
           <%-- <button id="generator_add" class="btn btn-success" onclick="page_moudel.create_vo()">
                <i class="glyphicon glyphicon-plus"></i> 生成vo
            </button>--%>
            <%--  <button id="generator_add" class="btn btn-success" onclick="page_moudel.add_generator()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="generator_remove" class="btn btn-danger" onclick="page_moudel.batchdel_generator();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="generator_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.generator_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/sysextmgr/generator/generator.js"></script>
</head>

