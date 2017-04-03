<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="config_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                <div class="form-group">
            <label  for="view_config_configKey" class=" col-md-3 control-label">configKey：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_config_configKey"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_config_configValue" class=" col-md-3 control-label">配置值：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_config_configValue"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_config_description" class=" col-md-3 control-label">配置项功能描述：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_config_description"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_config_readOnly" class=" col-md-3 control-label">运行时是否只读，0非只读；1只读：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_config_readOnly"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
