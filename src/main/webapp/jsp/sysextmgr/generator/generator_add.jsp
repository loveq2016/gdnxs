<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="generator_addform_div" class="panel panel-fit">
    <div class="panel-body">
        <div style="height: 30px;">
            <div class="switch" style="float: left;width:36%;"
                 onColor="success"
                 offColor="warning"
                 onText="参与"
                 offText="不参与"
                 data-on="success"
                 data-off="warning">
                <input type="checkbox" name="create_jsp" checked />生成jsp
            </div>
            <div class="switch" style="float: left;width:36%;"
                 onColor="success"
                 offColor="warning"
                 onText="参与"
                 offText="不参与"
                 data-on="success"
                 data-off="warning">
                <input type="checkbox" name="create_vo" checked />生成vo
            </div>
            <div class="switch" style="float: left;width:28%;"
                 onColor="success"
                 offColor="warning"
                 onText="参与"
                 offText="不参与"
                 data-on="success"
                 data-off="warning">
                <input type="checkbox" name="create_po" checked />生成po
            </div>
            <br/>
            <br/>
            <br/>
            <div class="switch" style="float: left;width:36%;"
                 onColor="success"
                 offColor="warning"
                 onText="参与"
                 offText="不参与"
                 data-on="success"
                 data-off="warning">
                <input type="checkbox" name="create_sd" checked />生成服务层和dao层
            </div>
            <div class="switch" style="float: left;width:28%;"
                 onColor="success"
                 offColor="warning"
                 onText="参与"
                 offText="不参与"
                 data-on="success"
                 data-off="warning">
                <input type="checkbox" name="create_ctrl" checked />生成控制层
            </div>
        </div>
    </div>
    <form id="generator_addform" name="generator_addform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/sysextmgr/generator/add.mvc" method="post">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                                                                                                                             <div class="form-group">
                    <label  for="add_generator_rootPath" class="col-md-3 control-label">项目根路径：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.rootPath" check-type="required"   class="form-control" id="add_generator_rootPath"/>
                    </div>
                 </div>
                                                                                         <%--<div class="form-group">
                    <label  for="add_generator_srcRootPath" class="col-md-3 control-label">java代码路径：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.srcRootPath"    class="form-control" id="add_generator_srcRootPath"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_webRootPath" class="col-md-3 control-label">jsp页面路径：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.webRootPath"    class="form-control" id="add_generator_webRootPath"/>
                    </div>
                 </div>--%>
                                                                                         <div class="form-group">
                    <label  for="add_generator_tableName" class="col-md-3 control-label">表名：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.tableName" check-type="required"   class="form-control" id="add_generator_tableName"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_dbName" class="col-md-3 control-label">数据库：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.dbName" check-type="required"   class="form-control" id="add_generator_dbName"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_javaName" class="col-md-3 control-label">java文件前缀：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.javaName"    class="form-control" id="add_generator_javaName"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_componentName" class="col-md-3 control-label">组件包名：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.componentName" check-type="required"   class="form-control" id="add_generator_componentName"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_componentNamezhCn" class="col-md-3 control-label">组件中文名：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.componentNamezhCn" check-type="required"   class="form-control" id="add_generator_componentNamezhCn"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_moduelName" class="col-md-3 control-label">模块包名：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.moduelName" check-type="required"   class="form-control" id="add_generator_moduelName"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_moduelNameznCn" class="col-md-3 control-label">模块中文名称：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.moduelNameznCn" check-type="required"   class="form-control" id="add_generator_moduelNameznCn"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_voSql" class="col-md-3 control-label">生成vo的sql：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.voSql"    class="form-control" id="add_generator_voSql"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_generator_user" class="col-md-3 control-label">创建人：</label>
                    <div class="col-md-8">
                        <input type="text" name="sysGenerator.user"   class="form-control" id="add_generator_user" value="platform"/>
                    </div>
                 </div>

                          
    </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function(){
        $('#generator_addform').validation();
        $("div[class='switch']").each(function() {
            $this = $(this);
            var onColor = $this.attr("onColor");
            var offColor = $this.attr("offColor");
            var onText = $this.attr("onText");
            var offText = $this.attr("offText");
            var labelText = $this.attr("labelText");

            var $switch_input = $(" :only-child", $this);
            $switch_input.bootstrapSwitch({
                onColor : onColor,
                offColor : offColor,
                onText : onText,
                offText : offText,
                labelText : labelText
            });
        });
    });
</script>

