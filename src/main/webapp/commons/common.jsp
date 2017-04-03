<%@page language="java"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:set var="baseURL" value="${pageContext.servletContext.contextPath}" scope="page"/>
<script type="text/javascript">
	var baseURL = "${baseURL}";	
	var csrf_token = "${sessionScope.dqdp_csrf_token}";
</script>