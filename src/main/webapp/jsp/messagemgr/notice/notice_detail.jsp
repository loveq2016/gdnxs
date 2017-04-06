<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="notice_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                <div class="form-group">
            <label  for="view_notice_id" class=" col-md-3 control-label">id：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_id"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_title" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_title"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_purl" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_purl"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_ndesc" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_ndesc"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_area" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_area"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_attachmentname" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_attachmentname"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_attachment" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_attachment"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_creatorid" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_creatorid"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_createdate" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_createdate"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_modifiedid" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_modifiedid"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_modifieddate" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_modifieddate"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_notice_deletedflag" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_notice_deletedflag"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
