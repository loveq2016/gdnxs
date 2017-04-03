<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="generator_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                                
                <div class="form-group">
            <label  for="view_generator_rootPath" class=" col-md-3 control-label">项目根路径：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_rootPath"></div>
        </div>
                                
        <%--        <div class="form-group">
            <label  for="view_generator_srcRootPath" class=" col-md-3 control-label">java代码路径：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_srcRootPath"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_webRootPath" class=" col-md-3 control-label">jsp页面路径：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_webRootPath"></div>
        </div>--%>
                                
                <div class="form-group">
            <label  for="view_generator_tableName" class=" col-md-3 control-label">表明：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_tableName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_dbName" class=" col-md-3 control-label">数据库：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_dbName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_javaName" class=" col-md-3 control-label">java文件前缀：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_javaName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_componentName" class=" col-md-3 control-label">组件包名：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_componentName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_componentNamezhCn" class=" col-md-3 control-label">组件中文名：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_componentNamezhCn"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_moduelName" class=" col-md-3 control-label">模块包名：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_moduelName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_moduelNameznCn" class=" col-md-3 control-label">模块中文名称：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_moduelNameznCn"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_voSql" class=" col-md-3 control-label">生成vo的sql：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_voSql"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_user" class=" col-md-3 control-label">创建人：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_user"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_generator_time" class=" col-md-3 control-label">创建时间：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_generator_time"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
