<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="msginfo_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                <div class="form-group">
            <label  for="view_msginfo_id" class=" col-md-3 control-label">id：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_msginfo_id"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_msginfo_title" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_msginfo_title"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_msginfo_msgdesc" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_msginfo_msgdesc"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_msginfo_creatorid" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_msginfo_creatorid"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_msginfo_createdate" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_msginfo_createdate"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
