<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
  pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
//  StringBuffer url = request.getRequestURL();
  pageContext.setAttribute("imgUrl","http://yy.gzqinghui.com.cn");
/* pageContext.setAttribute("currentUser", AppContext.getCurrentUser()); */
%>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<%--<script type="text/javascript" src="${baseURL}/staticresjs/jquery.js"></script>--%>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<!--[if lt IE 9]>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap/css/bootstrap-ie7.css" rel="stylesheet" type="text/css"/>
<![endif]-->

<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/bootstrap-table/extensions/fixed-columns/bootstrap-table-fixed-columns.css" rel="stylesheet" type="text/css"/>
<!--[if lte IE 9]>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert-ie/sweet-alert.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert-ie/ie9.css" rel="stylesheet" type="text/css"/>
<![endif]-->
<!--[gt IE 9]>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
<![endif]-->
<!--[if !IE]>-->
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
<!--<![endif]-->
<%--<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>--%>
<link rel="stylesheet" href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/loading/fakeLoader.css" type="text/css">
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/switch/css/bootstrap-switch.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/icheck/skins/all.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/checkbox-table/all.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/staticres/css/base.css" rel="stylesheet" type="text/css"/>
<link href="${baseURL}/staticres/css/main.css" rel="stylesheet" type="text/css"/>
<%--<link href="${baseURL}/jsp/3rd-plug/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>--%>
<link rel="stylesheet" href="${baseURL}/jsp/3rd-plug/ztree/css/metroStyle/metroStyle.css" type="text/css">

<link rel="stylesheet" href="${baseURL}/jsp/3rd-plug/sbadmin2/bower_components/ladda/dist/ladda-themeless.css" />
<!--[if lt IE 9]>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/js/html5shiv.min.js"></script>
<script src="${baseURL}/jsp/3rd-plug/sbadmin2/js/respond.min.js"></script>

<script src="${baseURL}/jsp/3rd-plug/sbadmin2/js/ie8-compant.1.0.js"></script>
<script type="text/javascript" src="${baseURL}/jsp/3rd-plug/sbadmin2/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" >
$(function(){
$('input, textarea').placeholder();
});
</script>
<![endif]-->