<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="mvoice_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        
                                
                <div class="form-group">
            <label  for="view_mvoice_keyName" class=" col-md-3 control-label">键名：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_mvoice_keyName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_mvoice_chinaName" class=" col-md-3 control-label">中文名：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_mvoice_chinaName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_mvoice_englishName" class=" col-md-3 control-label">英文名：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_mvoice_englishName"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_mvoice_status" class=" col-md-3 control-label">状态：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_mvoice_status"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_mvoice_createPerson" class=" col-md-3 control-label">创建人：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_mvoice_createPerson"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_mvoice_createTime" class=" col-md-3 control-label">创建时间：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_mvoice_createTime"></div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
