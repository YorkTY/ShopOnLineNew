<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style>
.step-order {
	width: 600px;
	margin-top: 20px;
	margin-right: 60px;
}

.step-order li {
	position: relative;
	border-top: 5px solid #cccccc;
	width: 140px;
	text-align: center;
	height: 40px;
	line-height: 40px;
	float: left;
	color: #ccc;
	list-style: none;
}

.step-order li s {
	width: 20px;
	height: 20px;
	background: #CCC;
	position: absolute;
	top: -13px;
	left: 50%;
	margin-left: -10px;
	font-weight: bold;
	color: #FFF;
	line-height: 20px;
	text-decoration: none;
	border-radius: 20px;
}

.step-order li.active {
	border-top: 5px solid #7abd54;
	color: #7abd54;
}

.step-order li.active s {
	background: #7abd54;
	width: 25px;
	height: 25px;
	line-height: 25px;
	border-radius: 25px;
	top: -16px;
}

.shop-cart {
	padding-top: 60px;
	padding-left: 60px;
	padding-right: 90px;
}

.sc-title {
	font-size: 16px;
	line-height: 2;
	font-weight: bold;
	color: #666;
	width: 150px;
	height: 35px;
}

.sc-header {
	color: #666;
	font-size: 12px;
	display: block;
	height: 32px;
	line-height: 32px;
	padding: 0px 10px;
	background: #f3f3f3;
	border: 1px solid #e9e9e9;
}

.sc-header .column {
	float: left;
}

.sc-header ._checkbox {
	height: 18px;
	line-height: 18px;
	width: 123px;
	padding-left: 20px;
	margin-top: 7px;
}

.sc-header ._img {
	width: 210px;
	height: 32px;
	padding-left: 40px;
}

.sc-header ._goods {
	width: 210px;
	height: 32px;
	padding-left: 150px;
}

/* .sc-header ._props {
	width: 140px;
	height: 32px;
	padding-left: 140px;
} */

.sc-header ._price {
	width: 210px;
	padding-left: 150px;
}

.sc-header ._quantity {
	width: 210px;
	padding-left: 150px;
}

.sc-header ._sum {
	width: 210px;
	padding-left: 150px;
	/* text-align: right; */
}

.sc-header ._action {
	width: 210px;
	padding-left: 150px;
}

.cart-checkbox {
	position: relative;
	float: right;
	margin-right: 30px;
	height: 1px;
}

.brn-checkbox {
	margin-right: 3px;
	width: 20px;
	margin-bottom: 2px;
}

.cart {
	margin-top: 15px;
	color: #666;
	font-size: 12px;
}

.cart .shop {
	height: 30px;
	padding-left: 11px;
	font-weight: bold;
	width: 150px;
}

.cart .item-list {
	border-style: solid;
	border-width: 2px 1px 1px;
	border-color: #aaa #f1f1f1 #f1f1f1;
	background: #fff;
}

.cart ._single {
	border-top: 1px solid #c5c5c5;
	color: #666;
	zoom: 1;
	position: relative;
	padding: 0 10px 1px 40px;
	line-height: 20px;
	_height: 116px;
	background: #fff;
}

.cart ._single:before, .cart ._single:after {
	content: "";
	display: table;
}

.cart ._single:after {
	clear: both;
}

.cart ._single:nth-child(1) {
	border: none;
}

.cart ._single a {
	color: #666;
}

.cart ._single ._checkbox {
	position: absolute;
	z-index: 3;
	left: 10px;
	top: 0;
	width: 30px;
	min-height: 10px;
}

.cart ._single ._cell {
	float: left;
	padding: 15px 0 10px;
}

.cart ._single .goods-item {
	zoom: 1;
}

.cart ._single .goods-item:before, .cart ._single .goods-item:after {
	content: "";
	display: table;
}

.cart ._single .goods-item:after {
	clear: both;
}

.cart ._single .goods-item ._img {
	float: left;
	margin-left: 40px;
	padding-top: 100px;
}

.cart ._single .goods-item ._info {
	overflow: hidden;
	height: 40px;
	line-height: 20px;
}

.cart ._single ._goods {
	width: 300px;
}

.cart ._single ._props {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	cursor: default;
	width: 160px;
	padding: 15px 10px 0;
}

.cart ._single ._price {
	width: 120px;
	padding-right: 10px;
	font-family: verdana;
	text-align: right;
}

.cart ._single ._quantity {
	width: 80px;
}

.cart ._single ._sum {
	width: 100px;
	padding-right: 40px;
	text-align: right;
	font-family: verdana;
}

.cart ._single ._action {
	width: 75px;
}

.cart ._single ._action a {
	display: block;
}

.cart ._single {
	border-top: 1px solid #c5c5c5;
	color: #333;
	zoom: 1;
	position: relative;
	padding: 0 10px 1px 40px;
	line-height: 20px;
	_height: 116px;
	background: #fff;
}

.cart ._single:before, .cart ._single:after {
	content: "";
	display: table;
}

.cart ._single:after {
	clear: both;
}

.cart ._single:nth-child(1) {
	border: none;
}

.cart ._single a {
	color: #333;
}

.cart ._single ._checkbox {
	position: absolute;
	z-index: 3;
	left: 120px;
	top: 0;
	width: 30px;
	min-height: 10px;
}

.cart ._single ._cell {
	float: left;
	padding: 15px 0 10px;
}

.cart ._single .goods-item {
	zoom: 1;
}

.cart ._single .goods-item:before, .cart ._single .goods-item:after {
	content: "";
	display: table;
}

.cart ._single .goods-item:after {
	clear: both;
}

.cart ._single .goods-item ._img {
	float: left;
	margin-top: -80px;
	margin-left: 5px;
}

.cart ._single .goods-item ._info {
	overflow: hidden;
	line-height: 20px;
	padding-left: 275px;
}

.cart ._single .goods-item ._props {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	width: 200px;
	padding-left: 275px;
}

.cart ._single .goods-item ._price {
	width: 120px;
	margin-bottom: 22px;
	padding-left: 175px;
}

.cart ._single .goods-item ._quantity {
	margin-top: -2px;
	width: 170px;
	padding-left: 200px;
}

.cart ._single .goods-item ._quantity _form {
	height: 10px;
}

.cart ._single .goods-item ._sum {
	width: 20px;
	margin-left: -30px;
	margin-top: 18px;
	padding-left: 200px;
}

.cart ._single .goods-item ._action {
	margin-top: 20px;
	width: 300px;
	padding-left: 170px;
}

.cart ._single .goods-item ._action a {
	display: block;
}

.shop-cart-bar {
	border: 1px solid #dbdbdb;
	margin-top: 50px;
	width: 1500px;
}

.shop-cart-bar ._check {
	line-height: 50px;
	padding-left: 15px;
}

.shop-cart-bar ._detail {
	color: #999;
	font-size: 12px;
	margin-right: -20px;
}

.shop-cart-bar ._detail strong {
	color: #f7325d;
}

.shop-cart-bar ._total-num {
	float: left;
	padding-top: 10px;
}

.shop-cart-bar ._total-price {
	float: left;
	margin: 0 10px;
	padding-top: 10px;
	text-align: right;
}

.shop-cart-bar ._submit {
	float: left;
	background: #f7325d;
	color: #FFF;
	height: 50px;
	line-height: 50px;
	padding: 0 20px;
	font-size: 18p;
}

#footer {
	background: #E0E0E0;
	margin-top: 20px;
}
</style>
<script type="text/javascript">
	var goods = document.getElementsByName("good");
	function selectAll1() {
		if (document.getElementsByName("selectAll")[0].checked == true) {
			for (var i = 0; i < goods.length; i++) {
				goods[i].checked = true;
				document.getElementsByName("selectAll")[1].checked = true;
			}
		} else {
			for (var i = 0; i < goods.length; i++) {
				goods[i].checked = false;
				document.getElementsByName("selectAll")[1].checked = false;
			}
		}
	}

	function selectAll2() {
		if (document.getElementsByName("selectAll")[1].checked == true) {
			for (var i = 0; i < goods.length; i++) {
				goods[i].checked = true;
				document.getElementsByName("selectAll")[0].checked = true;
			}
		} else {
			for (var i = 0; i < goods.length; i++) {
				goods[i].checked = false;
				document.getElementsByName("selectAll")[0].checked = false;
			}
		}
	}
	
	$(function(){
		$(".text").change(function(){
			//验证数据有效性，必须是自然数
			var number = this.value;
			if(!isNaN(number) && parseInt(number)==number && number>0){
				$(this).attr("lang",number);
				var pid = $(this).parents("tr:first").attr("lang");
				//发送ajax请求，传输当前的数量与商品的id，返回的是总价格
				$.post("sorder_updateSorder.action",{number:number,'product.id':pid},function(total){
					$("#total").html(total);
				},"text");
				//保留两位小数
				//var price = (($(this).parent().prev().html())*number).toFixed(2);
				var price = $("._single ._price").text();
				alert((($(this).parent().prev().html())*number).toFixed(2));
				//更新单个商品小计
				//$(this).parent().next().html(price);
				$("#sum").text(""+(price*number)+"");
			}else{
				this.value=$(this).attr("lang");
			}
		});
	});
</script>
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
		<a href="#" class="brand"><img src="images/taoyi.jpg" width="220" 
			height="70"></a>
		<div class="step-order pull-right">
			<ul>
				<li class="active"><s>1</s>1.我的购物车</li>
				<li><s>2</s>2.填写核对订单信息</li>
				<li><s>3</s>3.成功提交订单</li>
			</ul>
		</div>
	</div>
	<div id="cartBody">
		<div class="shop-cart">
			<div class="sc-title">全部商品</div>
			<div class="sc-header">

				<table>
					<tr>
					    <th class="column _img">商品图片</th>
						<th class="column _goods">商品名称</th>
						<th class="column  _price">单价</th>
						<th class="column _quantity">数量</th>
						<th class="column _sum">小计</th>
						<th class="column _action">操作</th>
					</tr>
				</table>
			</div>
			<div class="cart" >
				<!--<div class="shop"><div class="cart-checkbox"><input type="checkbox" id="storeCartCheckbox3" class="brn-checkbox" /></div>鲜果时间</div>-->


				<div class="_single">

					<table >
						<!-- <tr>
							<th class="column _goods">商品名称</th>
							<th class="column _props"></th>
							<th class="column  _price">单价</th>
							<th class="column _quantity">数量</th>
							<th class="column _sum">小计</th>
							<th class="column _action">操作</th>
						</tr> -->
						<c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
							<tr id="tr" class="goods-item" lang="${sorder.product.id }" >
								<td class="_img"><a href="/79.html"><img
										src="images/${sorder.product.pic}" width="60" height="60"></a>
								</td>
								<td class="_info"><a href="/79.html">${sorder.product.name}</a>
								</td>
								<td id="price" class="_cell _price" >${sorder.product.price}</td>
								<td class="_quantity">
									<div class="form">
										<a class="_q-btn decrement disabled">-</a> 
										<%-- <input type="text"class="itxt" value="${sorder.number}" lang="${sorder.number} style="width: 40px;" />  --%>
								<input class="text" style="height: 20px;" value="${sorder.number}" lang="${sorder.number}">	
											<a class="_q-btn increment">+</a>
									</div>
								</td>

								<td id="sum" class="_cell _sum">${sorder.price*sorder.number }</td>
								<td class="_cell _action"><a href="product_deleteById.action?id=${sorder.product.id}"
									onclick="return window.confirm('确认删除此商品吗?')">删除</a>
									</td>
									
							</tr>
						</c:forEach>
					</table>



				</div>
			</div>
			<div class="shop-cart-bar container">

				<div class="_detail pull-right">
					<!-- <div class="_total-num">
						已选择<strong></strong>件商品
					</div> -->
					
					
						<c:choose>
							<c:when test="${empty sessionScope.forder.sorderSet }">
							<div class="_total-price">
						总价：<strong id="total">0.00</strong><br>已节省： -¥0
					</div>
								<a href="#" onclick="goConfirmOrder()"	
						class="_submit">去结算</a>
							</c:when>
							<c:otherwise>
							<div class="_total-price">
						总价：<strong id="total">${sessionScope.forder.total}</strong><br>已节省： -¥0
					</div>
								<a href="pay02.jsp" onclick="goConfirmOrder()"
						class="_submit">去结算</a>
							</c:otherwise>
						</c:choose>
					
					
				</div>
			</div>
		</div>

		<div id="footer">
			<div class="container">
				<div class="row footer1">
					<div class="col-lg-3 col-md-3 ">
						<img src="images/b.png" width="64" height="64"><font
							size="4" color="#000000">品类齐全，轻松购物</font>
					</div>
					<div class="col-lg-3  col-md-3 ">
						<img src="images/c.png" width="64" height="64"><font
							size="4" color="#000000">多仓直发，极速配送</font>
					</div>
					<div class="col-lg-3  col-md-3 ">
						<img src="images/d.png" width="64" height="64"><font
							size="4" color="#000000">正品行货，精致服务</font>
					</div>
					<div class="col-lg-3  col-md-3 ">
						<img src="images/a.png" width="64" height="64"><font
							size="4" color="#000000">天天低价，畅选无忧</font>
					</div>
				</div>
				<hr style="border: 0; background-color: #CCC; height: 1px;">
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
						<h5>
							已向全国2661个区县提供自营配送服务，支持货到付款、POS机刷卡和售后上门服务。 <a href="#">查看详情&gt;
							</a>
						</h5>
					</div>
				</div>
				<hr style="border: 0; background-color: #CCC; height: 1px;">
			</div>
			<div class="footer3">
				<h5>
					<a href="/" target="0" title="">广告服务</a> | <a href="/" target="0"
						title="">社会公益</a> | <a href="/" target="0" title="">品牌授权</a> | <a
						href="/" target="0" title="">商务合作</a> | <a href="/" target="0"
						title="">媒体报道</a> | <a href="/" target="0" title="">销售联盟</a> | <a
						href="/" target="0" title="">营销中心</a> | <a href="/" target="1"
						title="">人才招聘</a> | <a href="/" target="1" title="">联系我们</a> | <a
						href="/" target="1" title="">关于我们</a> |
				</h5>
				<p class="footer2">陶毅开发小组有限公司 &nbsp;&nbsp;程序版本：5.1.121
					&nbsp;&nbsp;版权所有：@2017, BrnMall.com Inc.</p>
				<div class="row">

					<div class="col-lg-2 col-lg-push-1">
						<a href=""><img src="images/gs.jpg">经营性网站</a>
					</div>
					<div class="col-lg-2 col-lg-push-1">
						<a href=""><img src="images/jc.jpg">网络警察提醒您</a>
					</div>
					<div class="col-lg-2 col-lg-push-1">
						<a href=""><img src="images/cxx.png">诚信网站</a>
					</div>
					<div class="col-lg-2 col-lg-push-1">
						<a href=""><img src="images/hlw.jpg">中国互联网举报中心</a>
					</div>
					<div class="col-lg-2 col-lg-push-1">
						<a href=""><img src="images/xz.png">网络举报App下载</a>
					</div>




				</div>

			</div>
		</div>
	</div>
</body>
</html>
