<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="generator_editform_div" class="panel panel-fit">

    <form id="generator_editform" name="generator_editform" role="form" class="form-horizontal" onsubmit="return false;"
          autocomplete="off" action="${pageContext.servletContext.contextPath}/sysextmgr/generator/update.mvc"
          method="post">

        <div class="panel-body">
            <div style="height: 30px;">
                <div class="switch" style="float: left;width:36%;"
                     onColor="success"
                     offColor="warning"
                     onText="参与"
                     offText="不参与"
                     data-on="success"
                     data-off="warning">
                    <input type="checkbox" name="create_jsp"   />生成jsp
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
                    <input type="checkbox" name="create_sd"  />生成服务层和dao层
                </div>
                <div class="switch" style="float: left;width:28%;"
                     onColor="success"
                     offColor="warning"
                     onText="参与"
                     offText="不参与"
                     data-on="success"
                     data-off="warning">
                    <input type="checkbox" name="create_ctrl"  />生成控制层
                </div>
            </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <input type="hidden" name="sysGenerator.id"  class="form-control" id="edit_generator_id"/>
        <div class="form-group">
            <label for="edit_generator_rootPath" class="col-md-3 control-label">项目根路径：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.rootPath"  class="form-control"
                       id="edit_generator_rootPath"/>
            </div>
        </div>
       <%-- <div class="form-group">
            <label for="edit_generator_srcRootPath" class="col-md-3 control-label">java代码路径：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.srcRootPath"  class="form-control"
                       id="edit_generator_srcRootPath"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_webRootPath" class="col-md-3 control-label">jsp页面路径：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.webRootPath"  class="form-control"
                       id="edit_generator_webRootPath"/>
            </div>
        </div>--%>
        <div class="form-group">
            <label for="edit_generator_tableName" class="col-md-3 control-label">表名：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.tableName"  class="form-control"
                       id="edit_generator_tableName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_dbName" class="col-md-3 control-label">数据库：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.dbName"  class="form-control"
                       id="edit_generator_dbName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_javaName" class="col-md-3 control-label">java文件前缀：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.javaName"  class="form-control"
                       id="edit_generator_javaName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_componentName" class="col-md-3 control-label">组件包名：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.componentName"  class="form-control"
                       id="edit_generator_componentName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_componentNamezhCn" class="col-md-3 control-label">组件中文名：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.componentNamezhCn"  class="form-control"
                       id="edit_generator_componentNamezhCn"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_moduelName" class="col-md-3 control-label">模块包名：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.moduelName"  class="form-control"
                       id="edit_generator_moduelName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_moduelNameznCn" class="col-md-3 control-label">模块中文名称：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.moduelNameznCn"  class="form-control"
                       id="edit_generator_moduelNameznCn"/>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_voSql" class="col-md-3 control-label">生成vo的sql：</label>
            <div class="col-md-8">
                <textarea  name="sysGenerator.voSql"  class="form-control" cols="45" rows="8"
                       id="edit_generator_voSql"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="edit_generator_user" class="col-md-3 control-label">创建人：</label>
            <div class="col-md-8">
                <input type="text" name="sysGenerator.user"  class="form-control"
                       id="edit_generator_user"/>
            </div>
        </div>

    </form>

</div>
<script type="text/javascript"
        src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function () {
        $('#generator_editform').validation();
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
                labelText : labelText,
                onSwitchChange:function(evt,flag){
//                    console.info(arguments);
                    evt.target.value = flag;
                }
            });
        });
    });
</script>

