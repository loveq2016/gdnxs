<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="area_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                <div class="form-group">
            <label  for="view_area_id" class=" col-md-3 control-label">id：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_area_id"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_area_city" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_area_city"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_area_areatext" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_area_areatext"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_area_createdate" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_area_createdate"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
