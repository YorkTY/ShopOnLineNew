<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>核对订单页</title>
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/pay2.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){
    	$("#buy").click(function(){
    		if(parseFloat($("#money").text()) >= parseFloat($("#orderAmount").text())){
    			return confirm("当前应付金额为: $"+$("#orderAmount").text()+" !    是否确认购买？");
    		}else{
    			alert("你的余额不足,购买失败");
    			return false;
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
						<li style="float:left;margin-top:15px;margin-right:15px;"><a href="#">余额￥<span id="money" style="color:green;">${sessionScope.user.money }</span></a></li>
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
								<a href="/shop/register1.jsp"><font ">注册</font></a>
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
                <li  class="active"><s>2</s>2.填写核对订单信息</li>
                <li><s>3</s>3.成功提交订单</li>
            </ul>
        </div>
</div>
<div class="checkout-box container">
        <div class="checkout-header">填写并核对订单信息</div>
        <div class="checkout-body">
        
        
                
            <!-- <div class="checkout-title"><h3>收货人信息</h3><a href="javascript:addShipAddress()" class="checkout-more pull-right">新增收货地址</a></div>
            
            <div class="checkout-content checkout-address">
                <div class="_list" id="shipAddressList">
                        <div class="_null"><a href="javascript:addShipAddress()" class="btn"><i class="iconfont">&#xe618;</i> 添加收货地址</a></div>
                </div>
                <a href="javascript:getShipAddressList()" class="_more"><span class="_slide-down">更多地址</span><span class="_slide-up">收起地址</span><b></b></a>
            </div>  -->





            <div class="checkout-title"><h3>支付方式</h3></div>
            <div class="checkout-content checkout-payment">
                <ul class="_list" id="payModeList">
                    <li   class="active" value="0"><a href="javascript:selectPayMode(0)" style="text-decoration:none;">在线支付</a></li>
                    
                </ul>
            </div>

            <div class="checkout-title"><h3>送货清单</h3><a href="pay01.jsp" class="checkout-more">返回修改购物车</a></div>
            <c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
            <div class="checkout-goods checkout-content">
                        <div class="goods-title">商家：鲜果时间</div>
                                <div class="goods-item">
                                    <div class="_img">
                                        <a href="#"><img src="images/${sorder.product.pic}" width="60" height="60"></a>
                                    </div>
                                    <div class="_info">
                                        <a href="/78.html">${sorder.name} </a>
                                    </div>
                                    <div class="_price">
                                        <strong>￥ ${sorder.price*sorder.number}</strong>
                                          <small>小计</small>
                                    </div>
                                    <div class="_num">x${sorder.number}</div>
                                </div>
            </div>
</c:forEach>
            <div class="checkout-title">
                <h3 onclick="showPreferential()">使用优惠券/金币抵用 <i class="iconfont">&#xe605;</i></h3>
                <div class="tag-box checkout-preferential checkout-content hide">
                    <ul class="tag-header clear">
                        <li class="tag active" onclick="changeTag(0)"><a href="javascript:;">优惠券</a></li>
                        <li class="tag" onclick="changeTag(1)"><a href="javascript:;">金币</a></li>
                    </ul>
                    <div class="tag-body coupon-list clear" style="display:block;" id="couponList" value="0"></div>
                    <div class="tag-body integral-box">
                        <p>
                            账户共8个金币 本次使用抵扣
                            <input type="text" id="payCredits" name="payCredits" onblur="usePayCredits(8,8,1)" value="0" />
                            <em id="payCreditMoney" value="0">￥0.00</em>
                        </p>
                    </div>
                    <div class="tag-footer">金额抵用<strong id="cpMoney">￥0.00</strong></div>
                </div>
            </div>

        </div>
    </div>

    <div class="order-summary container">
        <div class="pull-right">
            <dl><dt>商品总金额：</dt><dd id="productAmount" value="40.00">￥${forder.total}</dd></dl>
            <dl><dt>运费：</dt><dd id="shipFee" value="0">￥0</dd></dl>
            <dl><dt>返现：</dt><dd id="fullCut" value="0">￥0</dd></dl>
        </div>
    </div>

    <div class="container order-trade">
        <div class="_body">
            <div class="_total">
                <small>应付总额： </small>
                <strong>￥</strong><strong id="orderAmount">${forder.total}</strong>
            </div>
        </div>
        <input type="hidden" id="selectedCartItemKeyList" value="0_78_0"/>
            <input type="hidden" id="saId" value="0"/>
        <input type="hidden" id="payMode" value="0"/>
        <input type="hidden" id="couponIdList" value=""/>
        
        
         <!-- 订购人确认 -->
                <form action="forder_save.action" method="post">
	                <div class="person-check check">
	                    <h1>订购人信息</h1>
	                    <div class="person-checkinner">
	                        <div>
	                        	<label>配送姓名:</label>
	                        	<input type="text" name="name" value="${sessionScope.user.name }"/>
	                        </div>
	                        <div>
	                        	<label>联系方式:</label>
	                        	<input type="text" name="phone" value="${sessionScope.user.phone }" />
	                        </div>
	                        <div>
	                        	<label>区域邮编:</label>
	                        	<input type="text" name="post" value="4325232"/>
	                        </div>
	                        <div>
	                        	<label>配送地址:</label>
	                        	<input type="text" name="address" value="广州从化"/>
	                        </div>
	                    </div>
	                </div>
	                <!-- 给卖家留言 -->
	                <div class="person-check check">
	               		<h1>给卖家留言</h1>
	                	<textarea style="margin: 5px;" name="remark" cols="120" rows="2" placeholder="输入留言信息"></textarea>
		                <div class="submit">
		                   	<input id="buy" type="submit" class="sub-logo fr" class="_footer"  value="确认无误,购买" />
		                </div>
	                </div>
                </form>
        
        <!-- style="margin: 0px;padding: 0px; border: 0px;" -->
        
        <!-- <div class="_footer"><a href="javascript:submitOrder()">提交订单</a></div> -->
    </div>

    <div class="modal">
        <div class="modal-header">收货地址</div>
        <div class="modal-body">
            <form name="shipAddressForm">
                <input type="hidden" name="saId" />
                <div class="address-form">
                    <dl>
                        <dt><span style="color:red;">*</span> 收货人：</dt>
                        <dd><input type="text" name="consignee" /></dd>
                    </dl>
                    <dl>
                        <dt><span style="color:red;">*</span> 所在地区：</dt>
                        <dd>
                            <select id="provinceId" name="provinceId" class="address-options">
                                <option selected="selected" value="-1">请选择</option>
                            </select>
                            <select id="cityId" name="cityId" class="address-options">
                                <option selected="selected" value="-1">请选择</option>
                            </select>
                            <select id="regionId" name="regionId" class="address-options">
                                <option selected="selected" value="-1">请选择</option>
                            </select>
                        </dd>
                    </dl>
                    <dl>
                        <dt><span style="color:red;">*</span> 详细地址：</dt>
                        <dd><input type="text" name="address" /></dd>
                    </dl>
                    <dl>
                        <dt><span style="color:red;">*</span> 手机号码：</dt>
                        <dd><input type="text" name="mobile" /></dd>
                    </dl>
                    <dl>
                        <dt> 邮箱：</dt>
                        <dd><input type="text" name="email" /></dd>
                    </dl>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <a href="javascript:submitShipAddress()" class="_ok" style="text-decoration:none">确定</a>
            <a href="javascript:hideShipAddressModal()" class="_cancel" style="text-decoration:none">取消</a>
        </div>
        <a class="modal-close iconfont" href="javascript:hideShipAddressModal()">&#xe60a;</a>
    </div>
    <div class="modal-shadow"></div>
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
