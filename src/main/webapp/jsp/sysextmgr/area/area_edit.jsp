<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="area_editform_div" class="panel panel-fit">

  <form id="area_editform" name="area_editform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/sysextmgr/area/update.mvc" method="post">

  <div class="form-group"></div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <div class="form-group">
            <label  for="edit_area_id" class="col-md-3 control-label">id：</label>
            <div class="col-md-8">
                <input type="text" name="area.id" check-type="required"   class="form-control" id="edit_area_id"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_area_city" class="col-md-3 control-label">：</label>
            <div class="col-md-8">
                <input type="text" name="area.city" check-type="required"   class="form-control" id="edit_area_city"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_area_areatext" class="col-md-3 control-label">：</label>
            <div class="col-md-8">
                <input type="text" name="area.areatext" check-type="required"   class="form-control" id="edit_area_areatext"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_area_createdate" class="col-md-3 control-label">：</label>
            <div class="col-md-8">
                <input type="text" name="area.createdate" check-type="required"   class="form-control" id="edit_area_createdate"/>
            </div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function(){
        $('#area_editform').validation();
    });
</script>

