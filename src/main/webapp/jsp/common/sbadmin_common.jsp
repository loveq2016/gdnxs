<%@ page import="cn.com.gzqinghui.sysmgr.core.AppContext" %>
<%@page pageEncoding="utf-8" %>
<%
pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
StringBuffer url = request.getRequestURL();
pageContext.setAttribute("imgUrl","http://yy.gzqinghui.com.cn");
/* pageContext.setAttribute("currentUser", AppContext.getCurrentUser()); */
%>
<meta name="renderer" content="webkit">
<script type="text/javascript">
  var baseURL = "${baseURL}";
  var imgUrl = "${imgUrl}";
  var _csrf = "${_csrf.parameterName}";
  var token = "${_csrf.token}";
  var communityId="${currentUser.communityId}";
</script>
<%--<script type="text/javascript" src="${baseURL}/staticres/js/jquery.js"></script>--%>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/jquery/jquery.min.js"></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.extends.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.json.2.5.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap/js/bootstrap.min.js"></script>
<%--
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datatables-plugi1ns/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
--%>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/notify/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/loading/fakeLoader.js"></script>


<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootbox/bootbox.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/bootstrap3-validation.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/icheck/icheck.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.bootbox.dialog.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.sweet.dialog.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/moment-with-locales.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/moment-locale_zh-CN.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.extenfd.js"></script>

<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/loading/fakeLoader.css" type="text/css">
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/icheck/skins/all.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/checkbox-table/all.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/staticres/css/main.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/bootstrap3-validation.js"></script>
<script type="text/javascript" src="${baseURL}/staticres/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${baseURL}/staticres/js/jquery-form.js"></script>

<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/ztree/js/jquery.ztree.all-3.5.js"></script>
<%--<link href="${baseURL}/jsp/3rd-plug/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>--%>
<link rel="stylesheet" href="${baseURL}/jsp/3rd-plug/ztree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/checkbox-table/jquery.checkbox.table.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/common.js"></script>


<link rel="stylesheet" href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/ladda/dist/ladda-themeless.css" />
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/ladda/dist/spin.min.js" ></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/ladda/dist/ladda.min.js" ></script>

<%-- <script src="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap/js/bootstrap3-typeahead.min.js" ></script> --%>

<script src="${baseURL}/staticres/js/extend/jquery.date.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.fn.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.string.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.validate.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.modal.extend.js" ></script>
<script src="${baseURL}/staticres/js/extend/jquery.extend.js" ></script>

<script type="text/javascript" >

  $(function(){
    $(".container").append('<img onclick="return false;" src="${baseURL}/staticres/images/ceshi@3x.png" width="500" height="500" style="position: absolute;z-index: 10; top:50px; left:200px;pointer-events: none;" />');
  });

</script>