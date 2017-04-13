<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="config_addform_div" class="panel panel-fit">

    <form id="config_addform" name="config_addform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/sysextmgr/config/add.mvc" method="post">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                                                                   <div class="form-group">
                    <label  for="add_config_configKey" class="col-md-3 control-label">配置键：</label>
                    <div class="col-md-8">
                        <input type="text" name="config.configKey" check-type="required"   class="form-control" id="add_config_configKey"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_config_configValue" class="col-md-3 control-label">配置值：</label>
                    <div class="col-md-8">
                        <input type="text" name="config.configValue" check-type="required"   class="form-control" id="add_config_configValue"/>
                    </div>
                 </div>
                                                                                         <div class="form-group">
                    <label  for="add_config_description" class="col-md-3 control-label">配置项功能描述：</label>
                    <div class="col-md-8">
                        <input type="text" name="config.description" check-type="required"   class="form-control" id="add_config_description"/>
                    </div>
                 </div>
              <%--                                                                           <div class="form-group">
                    <label  for="add_config_readOnly" class="col-md-3 control-label">运行时是否只读，0非只读；1只读：</label>
                    <div class="col-md-8">
                        <input type="text" name="config.readOnly" check-type="required"   class="form-control" id="add_config_readOnly"/>
                    </div>
                 </div>--%>
                          
    </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function(){
        $('#config_addform').validation();
    });
</script>

