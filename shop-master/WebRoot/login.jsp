<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>登录</title>
<link href="dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/login1.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script src="dist/js/jquery.validate.js"></script>
<script src="dist/js/messages_zh.js"></script>	
<script type="text/javascript" src="js/register1.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">

		<div class="navbar-header">
			<div class="show" id="brand">
				<!--<img src="logo.jpg" width="316" height="49" />-->
				<a href="#" class="navbar-brand">陶毅商城</a>
			</div>
		</div>

		<div id="navbar" class="collapse navbar-collapse">
			<div id="navigation" class="show">
				<ul class="nav navbar-nav">
					<li><a href="index0.jsp">商城首页</a></li>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<li class="active"><a href="login.jsp">登录</a></li>
					<li><a href="register1.jsp">注册</a></li>
				</ul>
			</div>
		</div>
	</div>
	</nav>
	<div class="banner">
		<div class="login-form ">
		<h4>| 欢迎登陆</h4>
			<form class="cmxform" id="signupForm" method="post"
				action="user_login.action">
				<fieldset>
				<div class="divp">
					<p>
						<label for="username">用户名&nbsp;:&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="username" name="login" type="text">
					</p>
					</div>
					<div class="divp">
					<p>
						<label for="password">密码&nbsp;:&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="pass" name="pass" type="password">
					</p>
					</div>
					<div class="divp">
					<p>
					<div class="_check-code">
						<label for="yzm">验证码:&nbsp;&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="verifycode" id="input" /> <input
							type="button" id="code" />
					</div>
					</p>
					</div>
					<p>
					<div>
						<span style="color: #FF0000;"> ${sessionScope.error} </span>
					</div>
					</p>
					<p>
						<input type="submit" value="登录" id="check" class="submit" />
					</p>
					<p>
					<div class="login-options">
						<div class="auto-login pull-left">
							<input type="checkbox" name="isRemember" id="autoLogin" /> <label
								for="autoLogin" class="zddl">自动登录</label>
						</div>
						<a href="#" class="pull-right">忘记密码</a>
					</div>
					</p>
				<!-- 	<p>
					<div class="ljzc">
						<a href="register1.jsp" class="pull-right"><img
							src="images/right.png" style="padding-bottom: 2px;" width="16"
							height="16" />立即注册</a>
					</div>
					</p> -->
				</fieldset>
			</form>
		</div>
	</div>
	<div class="account-footer">
		<br />
		<div class="_list">
			<h5>
				<a href="" target="0" title="">广告服务</a> | <a href="" target="0"
					title="">社会公益</a> | <a href="" target="0" title="">品牌授权</a> | <a
					href="" target="0" title="">商务合作</a> | <a href="" target="0"
					title="">媒体报道</a> | <a href="" target="0" title="">销售联盟</a> | <a
					href="" target="0" title="">营销中心</a> | <a href="" target="1"
					title="">人才招聘</a> | <a href="" target="1" title="">联系我们</a> | <a
					href="" target="1" title="">关于我们</a> |
			</h5>
		</div>
		<br />
		<p class="_copyright">陶毅开发小组 &nbsp;&nbsp;程序版本：5.1.121
			&nbsp;&nbsp;版权所有：@2017, BrnMall.com Inc.</p>
	</div>
</body>
</html>
