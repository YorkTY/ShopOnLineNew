<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>提交订单成功页</title>
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/pay3.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
</head>

<body>
<div id="header">
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
						<li class="active"><a href="index0.jsp">商城首页</a></li>
						<c:choose>
							<c:when test="${empty sessionScope.user }">							
							</c:when>
							<c:otherwise>
						<li><a href="pay01.jsp">购物车</a></li>
						</c:otherwise>
						</c:choose>
						<!-- <li><a href="#">收藏</a></li> -->
						<li><a href="aindex.action">后台管理入口</a></li>
						<li>					
						<c:choose>
						
							<c:when test="${empty sessionScope.user }">
								<a href="/shop/login.jsp"><font style="color:red;">亲 , 请登录</font></a>
							</c:when>
							<c:otherwise>
							
						<ul >	
					<li style="float:left;margin-top:15px;margin-right:15px;margin-left:450px;"><a href="user_detail.action">用户名:${sessionScope.user.name }</a></li>
						<li style="float:left;margin-top:15px;margin-right:15px;"><a href="#">余额<span id="money" style="color:green;">￥${sessionScope.user.money }</span></a></li>
					<li style="float:left;margin-top:15px;"><a href="user_quit.action" style="color:red;">退出登录</a>	</li>				
							</ul>	
								
							</c:otherwise>
						</c:choose>
						</li>
					</ul>
										
					<ul class="nav navbar-nav pull-right">
						<li><c:choose>
							<c:when test="${empty sessionScope.user }">
								<a href="/shop/login.jsp"><font ">登录</font></a>
							</c:when>
							<c:otherwise>
	
							</c:otherwise>
						</c:choose></li>
						<li><c:choose>
							<c:when test="${empty sessionScope.user }">
								<a href="/shop/login.jsp"><font ">注册</font></a>
							</c:when>
							<c:otherwise>
	
							</c:otherwise>
						</c:choose></li>
						
					</ul>
				</div>
			</div>
			
			<div id="input" class="hidden" align="center">
				<form class="navbar-form" role="search" >
					<div class="form-group">
						 <input type="text" id="search" class="form-control input1"> 
					
					</div>
					<button type="submit" class="btn btn-danger btn-lg">搜索</button>
				</form>
			</div>
		</div>
		</nav>
	</div>
<div class="container header">
  <a href="#" class="brand"><img src="images/taoyi.jpg" width="220" height="50"></a>
        <div class="step-order pull-right">
            <ul>
                <li><s>1</s>1.我的购物车</li>
                <li><s>2</s>2.填写核对订单信息</li>
                <li class="active"><s>3</s>3.成功提交订单</li>
            </ul>
        </div>
</div>
<div class="order-success container">
        <h2><i class="iconfont">&#xe614;</i> 订单提交成功！</h2>
        <div class="_link">
            <a href="/ucenter/orderlist" class="btn">查看订单</a>
        </div>
        <div class="_info">
            <p>订单号：${sessionScope.oldForder.id}</p>
            <p class="_price">应付金额: <strong>￥${sessionScope.oldForder.total}</strong></p>
        </div>
        <div class="_tips">
            <i class="iconfont"></i> 您的订单正在处理中，订单内容会显示承运人联系方式，如有必要可以联系对方。
        </div>
    </div>
<div id="footer">
<div class="container">
<div class="row footer1">
<div class="col-lg-3 col-md-3 "><img src="images/b.png" width="64" height="64"><font size="4" color="#000000">品类齐全，轻松购物</font></div>
<div class="col-lg-3  col-md-3 "><img src="images/c.png" width="64" height="64"><font size="4" color="#000000">多仓直发，极速配送</font></div>
<div class="col-lg-3  col-md-3 "><img src="images/d.png" width="64" height="64"><font size="4" color="#000000">正品行货，精致服务</font></div>
<div class="col-lg-3  col-md-3 "><img src="images/a.png" width="64" height="64"><font size="4" color="#000000">天天低价，畅选无忧</font></div>
</div>
<hr style="border:0;background-color:#CCC;height:1px;">
<div class="row footer4">
<div class="col-lg-2 col-lg-pull-1">
<ul>
<li><h5>购物指南</h5></li>
<li><a href="#">购物流程</a></li>
<li><a href="#">会员介绍</a></li>
</ul>
</div>
<div class="col-lg-2 col-lg-pull-1 ">
<ul>
<li><h5>配送方式</h5></li>
<li><a href="#">上门自取</a></li>
<li><a href="#">211限时达</a></li>
</ul>
</div>
<div class="col-lg-2 col-lg-pull-1 ">
<ul>
<li><h5>支付方式</h5></li>
<li><a href="#">货到付款</a></li>
<li><a href="#">在线支付</a></li>
</ul>
</div>
<div class="col-lg-2 col-lg-pull-1 ">
<ul>
<li><h5>售后服务</h5></li>
<li><a href="#">售后政策</a></li>
<li><a href="#">取消订单</a></li>
</ul>
</div>
<div class="col-lg-2 col-lg-pull-1 ">
<ul>
<li><h5>促销说明</h5></li>
<li><a href="#">优惠券</a></li>
<li><a href="#">促销活动</a></li>
</ul>
</div>
<div class="col-lg-2">
<h5>自营覆盖区县</h5>
<h5>已向全国2661个区县提供自营配送服务，支持货到付款、POS机刷卡和售后上门服务。
<a href="#">查看详情&gt; </a></h5>
</div>
</div>
<hr style="border:0;background-color:#CCC;height:1px;">
</div>
 <div class="footer3">
        <h5>
                <a href="/" target="0" title="">广告服务</a> |
                <a href="/" target="0" title="">社会公益</a> |
                <a href="/" target="0" title="">品牌授权</a> |
                <a href="/" target="0" title="">商务合作</a> |
                <a href="/" target="0" title="">媒体报道</a> |
                <a href="/" target="0" title="">销售联盟</a> |
                <a href="/" target="0" title="">营销中心</a> |
                <a href="/" target="1" title="">人才招聘</a> |
                <a href="/" target="1" title="">联系我们</a> |
                <a href="/" target="1" title="">关于我们</a> |
        </h5>
        <p class="footer2">陶毅开发小组有限公司 &nbsp;&nbsp;程序版本：5.1.121 &nbsp;&nbsp;版权所有：@2017, BrnMall.com Inc.</p>
        <div class="row">
              
                  <div class="col-lg-2 col-lg-push-1"> <a href="" ><img  src="images/gs.jpg">经营性网站</a></div>
                       <div class="col-lg-2 col-lg-push-1"><a href="" ><img src="images/jc.jpg">网络警察提醒您</a></div>
                       <div class="col-lg-2 col-lg-push-1"><a href="" ><img src="images/cxx.png">诚信网站</a></div>
                         <div class="col-lg-2 col-lg-push-1"><a href="" ><img  src="images/hlw.jpg">中国互联网举报中心</a></div>
                         <div class="col-lg-2 col-lg-push-1"><a href="" ><img src="images/xz.png">网络举报App下载</a></div>
                        

                        
                         
        </div>
       
    </div>
</div>
</div>
</body>
</html>
