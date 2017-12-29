<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String result = (String) request.getAttribute("result");
		if (result.equals("login-success")) {
	%>
	<h1>登陆成功，1秒后自动跳转到主页面。</h1>
	<meta http-equiv="refresh" content="1;url=index0.jsp" />
	<%
		} else if (result.equals("login-false")) {
	%>
	<h1>登陆失败，1秒后将重新返回登录页面。</h1>
	<meta http-equiv="refresh" content="1;url=login.jsp" />
	<%
		} else if(result.equals("register-false")){
	%>
	<h1>用户名被占用，1秒后自动跳转到注册页面。</h1>
	<meta http-equiv="refresh" content="1;url=register1.jsp" />
	<%
		}else if(result.equals("register-success")){
	%>
	<h1>注册成功，1秒后跳转登陆页面</h1>
	<meta http-equiv="refresh" content="1;url=login.jsp" />
	<%
		}
	%>
	
</body>
</html>