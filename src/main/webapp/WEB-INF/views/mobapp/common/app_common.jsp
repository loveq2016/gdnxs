<%@ page import="cn.com.gzqinghui.common.util.AreaUtil" %>
<%@ page import="cn.com.gzqinghui.common.util.DictUtil" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String   baseURL   =   request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
    pageContext.setAttribute("baseURL", baseURL);
%>
<script>
    var baseURL = "${baseURL}";
    var picpostfix = ".jpg,.png,.gif,.jpeg,.bmp";
    var attachmentpostfix = ".pdf,.jpg,.png,.gif,.jpeg,.bmp,.xls,.xlsx,.doc,.docx";
    var areaJson = eval("(" + '<%=AreaUtil.getInstance().getAreaListJson()%>' + ")");
</script>
<script src="${baseURL}/staticres/js/jquery-1.8.3.min.js"></script>
<script src="${baseURL}/staticres/mobapp/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="${baseURL}/staticres/mobapp/css/base.css" />
<link rel="stylesheet" type="text/css" href="${baseURL}/staticres/mobapp/css/main.css" />
<meta charset="UTF-8">
<!-- 视口标签 -->
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- 删除苹果默认的工具栏和菜单栏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 设置苹果工具栏颜色 -->
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!-- 忽略页面中的数字识别为电话，忽略email识别 -->
<meta name="format-detection" content="telphone=no, email=no" />
<!-- 启用360浏览器的极速模式(webkit) -->
<meta name="renderer" content="webkit">
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
<meta name="HandheldFriendly" content="true">
<!-- 微软的老式浏览器 -->
<meta name="MobileOptimized" content="320">
<!-- uc强制竖屏 -->
<meta name="screen-orientation" content="portrait">
<!-- QQ强制竖屏 -->
<meta name="x5-orientation" content="portrait">
<!-- UC强制全屏 -->
<meta name="full-screen" content="yes">
<!-- QQ强制全屏 -->
<meta name="x5-fullscreen" content="true">
<!-- UC应用模式 -->
<meta name="browsermode" content="application">
<!-- QQ应用模式 -->
<meta name="x5-page-mode" content="app">
<!-- windows phone 点击无高光 -->
<meta name="msapplication-tap-highlight" content="no">
<!-- 适应移动端end -->

