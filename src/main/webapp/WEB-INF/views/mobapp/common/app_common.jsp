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
