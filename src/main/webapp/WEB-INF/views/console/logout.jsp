<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%
  response.sendRedirect("${pageContext.servletContext.contextPath}/login.mvc");
%>
