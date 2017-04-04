<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="member_view_div"  class="panel panel-fit">

  <form role="form" class="form-horizontal">

      <div class="form-group"></div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


                <div class="form-group">
            <label  for="view_member_name" class=" col-md-3 control-label">姓名：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_name"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_member_gender" class=" col-md-3 control-label">性别：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_gender"></div>
        </div>

      <div class="form-group">
          <label  for="view_member_avatar" class=" col-md-3 control-label">头像：</label>
          <div class="col-md-8"  style="margin-top: 7px;" id="view_member_avatar"></div>
      </div>

      <div class="form-group">
            <label  for="view_member_work" class=" col-md-3 control-label">单位：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_work"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_member_concatPhone" class=" col-md-3 control-label">联系号码：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_concatPhone"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_member_birthday" class=" col-md-3 control-label">出生年月：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_birthday"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_member_area" class=" col-md-3 control-label">区域：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_area"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_member_specialty" class=" col-md-3 control-label">特长：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_specialty"></div>
        </div>
                                
                <div class="form-group">
            <label  for="view_member_selfdesc" class=" col-md-3 control-label">自我介绍：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_selfdesc"></div>
        </div>

                <div class="form-group">
            <label  for="view_member_profile" class=" col-md-3 control-label">个人简介：</label>
            <div class="col-md-8"  style="margin-top: 7px;" id="view_member_profile"></div>
        </div>


                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
