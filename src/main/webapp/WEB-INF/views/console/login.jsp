<%@page language="java" contentType="text/html; charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; UTF-8">
<title>登录</title>
	<%--<%@include file="../../../commons/common.jsp"%>--%>
	<%@include file="../../../jsp/common/css_common.jsp"%>
	<style type="text/css">
		a.btn_login:hover,a:visited,a:focus{text-decoration: none !important;}
	</style>
</head>
<style>
.login_box_bg {
	width: 360px;
	height: 310px;
	background: #000;
	opacity: .3;
	filter: alpha(opacity = 30);
	top: 50%;
	left: 50%;
	margin-top: -155px;
	margin-left: -180px;
	position: absolute;
	border-top: 4px solid #09c;
}

.login_box {
	width: 360px;
	height: 314px;
	top: 50%;
	left: 50%;
	margin-top: -155px;
	margin-left: -180px;
	position: absolute;
	z-index: 99;
}

.login_box_con {
	width: 290px;
	height: 210px;
	margin: 60px auto;
}

.login_item {
	width: 290px;
	height: 50px;
	background: #fff;
}

.login_item:nth-child(2) {
	margin-top: 20px;
}
.login_box_con>.login_item+.login_item{margin-top: 20px;}
.account_num {
	width: 50px;
	height: 50px;
	background: #c1c1c1 url(${baseURL}/staticres/images/account_num.png) 50% center
		no-repeat;
	float: left;
}

.cipher_code {
	width: 50px;
	height: 50px;
	background: #c1c1c1 url(${baseURL}/staticres/images/cipher_code.png) 50% center
		no-repeat;
	float: left;
}

.btn_login {
	width: 290px;
	height: 50px;
	background: #09c;
	border-radius: 5px;
	color: #fff;
	text-align: center;
	line-height: 50px;
	display: block;
	font-size: 20px;
	margin-top: 40px;
}

.login_input {
	width: 240px;
	height: 50px;
	text-indent: 5px;
	outline: none;line-height: 50px;
}
.bg{width:100%;height:100%;background: url(${baseURL}/staticres/images/bg_login.jpg) no-repeat;background-size: cover;filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/bg_login.jpg',sizingMethod='scale');}

</style>
<body>
<div class="bg">
	<div class="login_box_bg"></div>
	<form id="userform" action="${baseURL}/j_spring_security_check?csrf_token=${sessionScope.dqdp_csrf_token}"  method="post">
		<div class="login_box">
			<div class="login_box_con">
				<div class="login_item">
					<div class="account_num"></div>
					<input type="text" name="username" class="login_input" id="userName"
						   placeholder="请输入用户名">
				</div>
				<div class="login_item">
					<div class="cipher_code"></div>
					<input type="password" name="password" class="login_input" id="password"
						   placeholder="请输入密码">
				</div>
				<a href="javascript:;" class="btn_login">登 录</a>

				<%-- <div >
					<input type="hidden" name="csrf_token" value="${csrf_token} "/>
				</div> --%>



			</div>
		</div>
		<sec:csrfInput/>
	</form>

</div>


</body>
<%@include file="../../../jsp/common/js_common.jsp"%>
<script type="text/javascript" src="${baseURL}/staticres/js/login.js"></script>
<script type="text/javascript">
	/**跳出frameset**/
	try {
		if(window !=window.top)
		{
			window.top.location.reload();
		}
	}catch(e){}
</script>

<script type="text/javascript">
	var sStorage = window.sessionStorage;
	var user = {};
	$("#password").keydown(function(e){
		if(e.keyCode==13){//enter事件
			$('.btn_login').click();
		}
	});

	$('.btn_login')
			.on(
					"click",
					function() {
						var userName = $("#userName").val();
						var password = $("#password").val();
						if(!userName){
							$.msg.toast("请输入用户名");
							return;
						}
						if(!password){
							$.msg.toast("请输入密码");
							return;
						}

						$('#userform').submit();
					})
</script>
</html>


