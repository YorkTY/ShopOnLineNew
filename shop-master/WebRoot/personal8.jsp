<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>商品评价</title>
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/personal5.css">
<link rel="stylesheet" type="text/css" href="css/personal7.css">
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

<%-- <form action="${shop}/product_getSearchProduct.action" method="post">
                        	<input id="name" name="name" size="50" placeholder="请输入商品名称" type="text" 
                        		onKeyup="getMoreContents()" onBlur="keywordBlur()"
                        		onFocus="getMoreContents()" AutoComplete="off"/>
                       		<button type="submit"></button>
                       	</form> --%>


		<div class="logo container pull-left">
			<a href="#"><img src="images/taoyi.jpg" /></a>
			<form class="navbar-form navbar-right" role="search" action="product_getSearchProduct.action?min_price=1&max_price=100000" method="post">
				<div class="form-group">
					<!-- <input type="text" id="search" class="form-control"
						placeholder="请输入关键字"> -->
							<input id="name" name="name" class="form-control" size="50" placeholder="请输入商品名称" type="text" 
                        		onKeyup="getMoreContents()" onBlur="keywordBlur()"
                        		onFocus="getMoreContents()" AutoComplete="off"/>
					<button type="submit" class="btn btn-danger btn-lg">搜索</button>
				</div>
			</form>
		</div>
	</div>
<div id="Context">

  
	<div class="menu">
		<nav role="navigation" class="topp">
        <div class="all-sort" onMouseOver="mOver()" onMouseOut="mOut()"><a href="#">全部商品分类</a></div>
        
			<ul class="nav nav-pills clearfix">

				<li role="presentation"><a href="index0.jsp">首页</a></li>

				<li role="presentation"><a href="/shop/category_listProduct.action?id=3&min_price=1&max_price=100000">生鲜水果</a></li>

				<li role="presentation"><a href="/shop/category_listProduct.action?id=4&min_price=1&max_price=100000">珠宝首饰</a></li>

				<li role="presentation"><a href="/shop/category_listProduct.action?id=9&min_price=1&max_price=100000">电脑</a></li>

				<li role="presentation"><a href="/shop/category_listProduct.action?id=10&min_price=1&max_price=100000">电器</a></li>

				<li role="presentation"><a href="/shop/category_listProduct.action?id=11&min_price=1&max_price=100000">鞋子</a></li>

				<li role="presentation"><a href="/shop/category_listProduct.action?id=12&min_price=1&max_price=100000">书</a></li>
			</ul>

		</nav>

	</div>
     <div id="box">
<div class="testbox clearfix" id="testbox" onMouseOver="mOver()" onMouseOut="mOut()">
    <ul>
 <li>
 <a href="#">服饰&nbsp;/&nbsp; 首饰&nbsp; /&nbsp; 珠宝</a>

 <div class=" container boxshow clearfix">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 </div>
 </li>

 <li>

 <a href="#">水果&nbsp;/&nbsp;食品&nbsp;/&nbsp;饮料</a>

 <div class="boxshow">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 
 </div>

 </li>

 <li>

 <a href="#">家居&nbsp;/&nbsp;建材&nbsp;/&nbsp;装修</a>
 <div class="boxshow">
<div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div> 
 
 </div>
 </li>

 <li>

 <a href="#">手机&nbsp;/&nbsp;数码&nbsp;/&nbsp;影音</a>
 <div class="boxshow">
<div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div> 
 
 </div>
 </li>
 <li>

 <a href="#">电脑&nbsp;/&nbsp;办公设备</a>
 <div class="boxshow">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 
 </div>
 </li>
 <li>

 <a href="#">电器&nbsp;/&nbsp;五金设备</a>
 <div class="boxshow">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 </div>
 </li>
 <li>
  
 <a href="#">手机&nbsp;/&nbsp;运营商&nbsp;/&nbsp;数码</a>
 <div class="boxshow">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 
 </div>
 </li>
 <li>

 <a href="#">男鞋&nbsp;/&nbsp;运动&nbsp;/&nbsp;户外</a>
 <div class="boxshow">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 
 </div>
 </li>
 <li>

 <a href="#">图书&nbsp;/&nbsp;音像&nbsp;/&nbsp;电子书</a>
 <div class="boxshow">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 </div>
 </li>
  <li>

 <a href="#">家居&nbsp;/&nbsp;家具&nbsp;/&nbsp;家装</a>
 <div class="boxshow">
 <div class="row">
 <div class="col-lg-2 "><a href="#">男装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10  col-lg-pull-1"><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a> <a href="#">休闲裤</a> <a href="#">衬衫</a> <a href="#">西服套装</a> <a href="#">夹克</a> <a href="#">羊毛衫</a> <a href="#">西服</a> <a href="#">西裤</a> <a href="#">运动裤</a><a href="#">大码男装</a> <a href="#">马甲/背心</a>
 </div>
 </div>
  <div class="row">
 <div class="col-lg-2"><a href="#">女装<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"> <a href="#">皮衣</a> <a href="#">礼服</a><a href="#">羊毛衫</a> <a href="#">当季热卖</a> <a href="#">正装裤</a> <a href="#">短裤</a><a href="#">2017新款</a><a href="#">商城同款</a><a href="#">T恤</a><a href="#">牛仔裤</a><a href="#">羽绒服</a><a href="#">卫衣</a><a href="#">毛衣</a> <a href="#">大码女装</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">首饰<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#">周大福</a><a href="#"> 六福珠宝</a><a href="#">通灵</a><a href="#">潮宏基</a><a href="#">中国黄金</a><a href="#">enzo</a> <a href="#">周六福</a> <a href="#">明牌珠宝</a> <a href="#">佐卡伊</a> <a href="#">金大生</a> <a href="#">米莱</a> <a href="#">吉盟</a> <a href="#">曼卡龙</a> <a href="#">相石缘</a> <a href="#">洪晶珠宝</a> <a href="#">玉柱擎天</a> <a href="#">天饰</a>
 </div>
 </div>
   <div class="row">
 <div class="col-lg-2"><a href="#">珠宝<i class="iconfont">&#xe602;</i></a></div>
 <div class="col-lg-10 col-lg-pull-1"><a href="#"> 珍珠</a><a href="#">时尚潮饰</a><a href="#">K金饰品</a><a href="#">琥珀蜜蜡</a><a href="#">木手串</a>
 <a href="#">彩宝</a> <a href="#">银饰</a> <a href="#">坦桑石</a> <a href="#">世嘉</a> <a href="#">一搏千金</a> <a href="#">荔尚</a> <a href="#">金大生</a> <a href="#">黛米</a> <a href="#">IDEAL</a><a href="#">念玉珠宝</a> <a href="#">七彩云南</a><a href="#">玉礼</a>
 </div>
 </div>
 
 </div>
 </li>
 </ul>
 </div>
  <div class="ucenter container-fluid clear">
        <div class="container">
            <div class="ucenter-menu">
    <h2 class="_header">个人中心</h2>
    <div class="_body">
        <ul class="_menu">
           <li><a href="personal1.jsp"  class="hot"  ><s>&gt;</s>账户信息</a></li>
           
             <li><a href="forder_getForder.action" ><s>&gt;</s>我的订单</a></li>
            <li><a href="personal3.jsp" ><s>&gt;</s>收货地址</a></li>
            <li><a href="personal4.jsp" ><s>&gt;</s>收藏商品</a></li>
          
            <li><a href="personal5.jsp" ><s>&gt;</s>我的金币</a></li>
            <li><a href="personal6.jsp"><s>&gt;</s>优惠劵</a></li>
            <li><a href="personal7.jsp" ><s>&gt;</s>购买咨询</a></li>
            <li><a href="personal8.jsp" ><s>&gt;</s>商品评价</a></li>
            <li><a href="personal9.jsp" ><s>&gt;</s>售后服务</a></li>
        </ul>
    </div>
    </div>
   <div class="ucenter-content">
                <h2 class="ucenter-title">商品评券</h2>
                <div class="favP">
                    <div class="list-goods">
                    <!--   <ul class="clear">
                                <li class="_item" id="favoriteProduct86">
                                    <div class="_inner">
                                        <div class="_img">
                                            <a href="/86.html"><img src="../img/g2.jpg" width="230" height="230"></a>
                                        </div>
                                        <div class="_price">
                                            <strong><small>¥</small><i>130.00</i></strong>
                                        </div>
                                        <div class="_name">
                                            <a href="/86.html">临朐大棚樱桃大樱桃车厘子新鲜水果红灯</a>
                                        </div>
                                        <div class="_commit">
                                            <div class="_message"><i class="iconfont">&#xe617;</i> 176503人评价</div>
                                            <div class="_click"><i class="iconfont">&#xe61e;</i> 96%</div>
                                        </div>
                                    </div>
                                </li>
                        </ul>-->
                    </div>
                </div>
              <!--  <div class="ucenter-pager">
                        <a href="javascript:;">上一页</a>
                                            <a href="javascript:;">下一页</a>
                </div>-->
</div>
</div>
<div id="Footer">
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
       
                  <div class="col-lg-2 col-lg-push-1"> <a href="" ><img src="images/gs.jpg" width="37" height="42">经营性网站</a></div>
                       <div class="col-lg-2 col-lg-push-1"><a href="" ><img src="images/jc.jpg" width="38" height="38">网络警察提醒您</a></div>
                       <div class="col-lg-2 col-lg-push-1"><a href="" ><img src="images/cxx.png" width="32" height="32">诚信网站</a></div>
                         <div class="col-lg-2 col-lg-push-1"><a href="" ><img src="images/hlw.jpg" width="50" height="41">中国互联网举报中心</a></div>
                         <div class="col-lg-2 col-lg-push-1"><a href="" ><img src="images/xz.png" width="32" height="32">网络举报App下载</a></div>
                        
                         
        </div>
       
    </div>
</div>
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
          
 
           
</body>
</html>
