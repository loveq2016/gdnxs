<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="faqinfomgr_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                <div class="form-group">
            <label  for="view_faqinfomgr_id" class=" col-md-3 control-label">id：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_id"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_faqinfomgr_title" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_title"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_faqinfomgr_faqDesc" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_faqDesc"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_faqinfomgr_creatorid" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_creatorid"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_faqinfomgr_createdate" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_createdate"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_faqinfomgr_modifiedid" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_modifiedid"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_faqinfomgr_modifieddate" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_modifieddate"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_faqinfomgr_deletedflag" class=" col-md-3 control-label">：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_faqinfomgr_deletedflag"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
