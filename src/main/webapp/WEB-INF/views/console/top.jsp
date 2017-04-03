<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/commons/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="height:50px">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<sec:csrfMetaTags />
<title>无标题文档</title>
<link href="${baseURL}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${baseURL}/css/main.css" rel="stylesheet" type="text/css" />
<link href="${baseURL}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseURL}/staticresjs/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//顶部导航切换
		$(".nav li a").click(function() {
			$(".nav li a.selected").removeClass("selected");
			$(this).addClass("selected");
		})
	})
</script>


</head>

<body>

	<div class="main_header">
		<div class="logo_wifi"></div>
		<div class="content_tabs">
			<ul id="tabs">
			</ul>
		</div>

		<div class="login_account">您好：admin</div>
		<div class="info_alarm">
			<i>报警消息</i><span>907</span>
		</div>
	</div>
</body>

<script type="application/javascript">
	
	
	
	
function logout() {
    var name = $("meta[name='_csrf_parameter']").attr("content");
    var token = $("meta[name='" + name + "']").attr("content");
    var data = eval("({'" + name + "':'" + token + "'})");
    $.ajax({
        type:"POST",
        url:'${baseURL}/j_spring_security_logout',
        data: data,
        success: function(msg) {
            parent.window.location.replace("${baseURL}/")
        }
    });
}




</script>
</html>
