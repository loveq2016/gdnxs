<%@page pageEncoding="utf-8" %>
<script type="text/javascript">
  var baseURL = "${baseURL}";
  var imgUrl = "${imgUrl}";
  var _csrf = "${_csrf.parameterName}";
  var token = "${_csrf.token}";
  var communityId="${currentUser.communityId}";
  var picpostfix = ".jpg,.png,.gif,.jpeg,.bmp";
  var attachmentpostfix = ".pdf,.jpg,.png,.gif,.jpeg,.bmp,.xls,.xlsx,.doc,.docx";
</script>
<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
<!--[if lte IE 9]>
<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
<![endif]-->
<!--[if gt IE 9]>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/jquery/jquery.min.js"></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/jquery/jquery-migrate-1.2.1.min.js"></script>
<![endif]-->
<!--[if !IE]>-->
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/jquery/jquery.min.js"></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/jquery/jquery-migrate-1.2.1.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.extends.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.json.2.5.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap/js/bootstrap.min.js"></script>

<!--[if lte IE 9]>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert-ie/sweet-alert.min.js"></script>
<![endif]-->
<!--[if gt IE 9]>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert/sweetalert.min.js"></script>
<![endif]-->
<!--[if !IE]>-->
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert/sweetalert.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/notify/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/loading/fakeLoader.js"></script>


<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootbox/bootbox.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/bootstrap3-validation.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/icheck/icheck.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.bootbox.dialog.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.sweet.dialog.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/extensions/fixed-columns/bootstrap-table-fixed-columns.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/moment-with-locales.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/moment-locale_zh-CN.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/switch/js/bootstrap-switch.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/bootstrap-datetimepicker-ie8.min.js"></script>
<![endif]-->
<!--[if lte IE 9]>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<![endif]-->

<!--[if !IE]>-->
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.extenfd.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/bootstrap3-validation.js"></script>
<script type="text/javascript" src="${baseURL}/staticres/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${baseURL}/staticres/js/jquery-form.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/ztree/js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/checkbox-table/jquery.checkbox.table.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/common.js"></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/ladda/dist/spin.min.js" ></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/ladda/dist/ladda.min.js" ></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/layer/layer.js" ></script>

<script src="${baseURL}/staticres/js/extend/jquery.date.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.fn.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.string.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.validate.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.modal.extend.js" ></script>
<%--<script src="${baseURL}/staticres/js/jquery.aop.js" ></script>--%>
<%--<script src="${baseURL}/staticres/js/jquery.aop-compat.1.0.js" ></script>--%>
<%--<script src="${baseURL}/staticres/js/jquery.intercept.js" ></script>--%>


<script type="text/javascript" >
  $(function(){
    $(".container").append('<img onclick="return false;" src="${baseURL}/staticres/images/ceshi@3x.png" width="500" height="500" style="position: absolute;z-index: 10; top:50px; left:200px;pointer-events: none;" />');
    $.ajaxSetup({
      timeout:5000,
      //完成请求后触发
      dataFilter: function (data, type) {
//        debugger;
        layer.closeAll();
        return  data;
      },
      //发送请求前触发
      beforeSend: function (xhr) {
//        debugger;
        layer.load(0, {shade: false});
      }
    });
  });

</script>