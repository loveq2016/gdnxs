<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
  pageContext.setAttribute("baseURL", pageContext.getServletContext().getContextPath());
//  StringBuffer url = request.getRequestURL();
  pageContext.setAttribute("imgUrl","http://yy.gzqinghui.com.cn");
/* pageContext.setAttribute("currentUser", AppContext.getCurrentUser()); */
%>