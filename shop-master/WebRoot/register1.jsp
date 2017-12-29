<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>注册</title>
<link href="dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/register1.css">
<script src="js/jquery-3.2.1.js"></script>
<script src="dist/js/jquery.validate.js"></script>
<script src="dist/js/messages_zh.js"></script>
<script type="text/javascript" src="js/register1.js"></script>
</head>
<body style = "background:url(images/bg.png); background-repeat: repeat-x; background-size: 870px;">
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
<li><a href="login.jsp">登录</a></li>
<script type="text/javascript" src="js/register1.js"></script>
</ul>
</div>
</div>
</div>
</nav>
<div id="Context" >
<div class="hyzc">
<h2>|欢迎注册</h2>
</div>
<div id="zc">
<form class="cmxform" id="signupForm" method="post" action="user_register.action">
  <fieldset>
   <div class="divp">
    <p>
      <label for="username">用户名&nbsp;:&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input id="username" name="login" type="text">
      <br>
<c:choose>
<c:when test="${empty requestScope.result}">
</c:when>
<c:otherwise>
<span style="color:red;  ">用户已存在</span>
</c:otherwise>
</c:choose> 

    </p>
    </div>
     <div class="divp">
    <p>
      <label for="password">密码&nbsp;:&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input id="password" name="pass" type="password" >
    </p>
    </div>
     <div class="divp">
    <p>
      <label for="confirm_password">确认密码&nbsp;:&nbsp;</label>&nbsp;&nbsp;
      <input id="confirm_password" name="confirm_password" type="password">
    </p>
    </div>
   <!--  <p>
      <label for="email">Email&nbsp;:&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input id="email" name="email" type="email">
    </p> -->
     <div class="divp">
       <p>
      <div class="_check-code">
      <label for="yzm">验证码&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="verifycode"  id="input"/>
       <input type = "button" id="code" />  
      
     </div>
    </p>
    </div>
    <p>
<input type="submit" value="注册" id="check" class="submit"/>
    </p>
    
  </fieldset>
</form>
</div>
</div>
<div id="Footer" style="margin-top:180px;">
<hr style="border:0;background-color:#CCC;height:1px;">
<div class="footer3">
        <h5>
                <a href="#" target="0" title="">广告服务</a> |
                <a href="#" target="0" title="">社会公益</a> |
                <a href="#" target="0" title="">品牌授权</a> |
                <a href="#" target="0" title="">商务合作</a> |
                <a href="#" target="0" title="">媒体报道</a> |
                <a href="#" target="0" title="">销售联盟</a> |
                <a href="#" target="0" title="">营销中心</a> |
                <a href="#" target="1" title="">人才招聘</a> |
                <a href="#" target="1" title="">联系我们</a> |
                <a href="#" target="1" title="">关于我们</a> |
        </h5>
        <p class="footer2">陶毅开发小组有限公司 &nbsp;&nbsp;程序版本：5.1.121 &nbsp;&nbsp;版权所有：@2017, BrnMall.com Inc.</p>
</div>
</div>
</body>
</html>
