<%@page language="java" contentType="text/html; charset=UTF-8" %>
<div id="msginfo_editform_div" class="panel panel-fit">

  <form id="msginfo_editform" name="msginfo_editform" role="form" class="form-horizontal"  onsubmit="return false;"  autocomplete="off" action="${pageContext.servletContext.contextPath}/messagemgr/msginfo/update.mvc" method="post">

  <div class="form-group"></div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <div class="form-group">
            <label  for="edit_msginfo_id" class="col-md-3 control-label">id：</label>
            <div class="col-md-8">
                <input type="text" name="msginfo.id" check-type="required"   class="form-control" id="edit_msginfo_id"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_msginfo_title" class="col-md-3 control-label">：</label>
            <div class="col-md-8">
                <input type="text" name="msginfo.title" check-type="required"   class="form-control" id="edit_msginfo_title"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_msginfo_msgdesc" class="col-md-3 control-label">：</label>
            <div class="col-md-8">
                <input type="text" name="msginfo.msgdesc" check-type="required"   class="form-control" id="edit_msginfo_msgdesc"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_msginfo_creatorid" class="col-md-3 control-label">：</label>
            <div class="col-md-8">
                <input type="text" name="msginfo.creatorid" check-type="required"   class="form-control" id="edit_msginfo_creatorid"/>
            </div>
        </div>
                                                <div class="form-group">
            <label  for="edit_msginfo_createdate" class="col-md-3 control-label">：</label>
            <div class="col-md-8">
                <input type="text" name="msginfo.createdate" check-type="required"   class="form-control" id="edit_msginfo_createdate"/>
            </div>
        </div>
                  </form>

</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jsp/3rd-plug/sbadmin2/js/html-render.v1.0.js"></script>
<script>
    $(function(){
        $('#msginfo_editform').validation();
    });
</script>

