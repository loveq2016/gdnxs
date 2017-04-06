<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="activity_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                <div class="form-group">
            <label  for="view_activity_id" class=" col-md-3 control-label">id：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_id"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_activity_title" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_title"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_activity_homepagep" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_homepagep"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_activity_endTime" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_endTime"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_activity_isPushHomepage" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_isPushHomepage"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_activity_activiyDesc" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_activiyDesc"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_activity_astatus" class=" col-md-3 control-label">活动状态：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_astatus"></div>
        </div>
                                

                <div class="form-group">
            <label  for="view_activity_createdate" class=" col-md-3 control-label">创建时间：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_activity_createdate"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
