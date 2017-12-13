<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<title>叮咚有礼--订单</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
		<link rel="stylesheet" href="/BigHomewoke/css/demo.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/style.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/fen.css" />
		<script type="text/javascript" src="/BigHomewoke/js/jquery-2.2.0.min.js"></script>
	</head>

	<body>
		<div class="header">
			<div class="hea_nav">
				<a href="index.html"><img src="/BigHomewoke/img/logo.png" class="logo"/></a>
				<ul>
					<a href="index.html"><li>首页</li></a>
					<a href="product.html"><li>叮咚一下</li></a>
					<a href="blog.html"><li>BLOG</li></a>
					<a href="personal.html"><li>个人中心</li></a>
					<a href="message.html"><li>留言板</li></a>
				</ul>
			</div>
			<div class="hea_right">
				<p>
					<a href="register.html">注册</a>|<a>登录</a>
				</p>
				<a href="shop_car.html"><p>
						<i class="iconfont">&#xe600;</i>
						<span>0件</span>
					</p>
				</a>
			</div>
		</div>
		<div class="header2">
				<img src="/BigHomewoke/img/phone_meau.png" class="meau"/>
				<a href="index.html"><img src="/BigHomewoke/img/logo.png" class="logo"/></a>
				<a href="shop_car.html"><i class="iconfont">&#xe600;</i></a>
				<ul class="meau_box">
					<a href="index.html"><li>首页</li></a>
					<a href="product.html"><li>叮咚一下</li></a>
					<a href="blog.html"><li>BLOG</li></a>
					<a href="personal.html"><li>个人中心</li></a>
					<a href="message.html"><li>留言板</li></a>
					<p style="border-right:1px #fff solid;" class="login_btn">登录</p>
					<a href="register.html"><p>注册</p></a>
				</ul>
			</div>
			<script>
				$(function(){
					$(".meau").on("click", function(e) {
					$(".meau_box").slideToggle();
					$(document).one("click", function() {
						$(".meau_box").slideUp();
					});
					e.stopPropagation();
				});
				$(".meau").on("click", function(e) {
					e.stopPropagation();
				});
				});
			</script>
		<div class="order">
			<p class="p1">填写并确认订单</p>
			<form action="${ctx }/order/makeorder" method="post">
			<div class="order_b1">
				<p class="title">选取收货地址（点击按钮进行选择）</p>
			<div class="old_add">
					<c:forEach items="${list3 }" var="pt">
					<div class="info">
					<input type="checkbox" name="tempString" value="${pt.id }"/>
						<p>${pt.name }</p>
						<p>${pt.address }</p>
						<p>15281082255</p>
					</div>
					</c:forEach>
			</div>
			<div class="order_b1">
				<p class="title">对TA说</p>
				<!--没有保存的-->
				<div class="say">
					<a href="message2.html"><div class="say_box">
						<img src="/BigHomewoke/img/order_p3.jpg" />
						<img src="/BigHomewoke/img/order_p1.png" class="img2" />
					</div></a>
					<a href="message.html"><p class="say_btn">在线预览</p></a>
				</div>
				<!--没有保存的-->
				<!--保存之后出现二维码-->
				<div class="say" style="display: none;">
					<div class="" style="float: left;">
						<a href="message2.html">
							<div class="say_box" style="float: none;">
								<img src="/BigHomewoke/img/order_p3.jpg" />
								<img src="/BigHomewoke/img/order_p1.png" class="img2" />
							</div>
						</a>
						<a href="message.html">
							<p class="say_btn" style="float: none;margin-left: 12px;margin-top: 18px;">在线预览</p>
						</a>
					</div>
					<p style="float: right;">
						<img src="/BigHomewoke/img/erwei.png" style="height: 109px;"/>
						<span style="display: block;margin-top: 15px;">专属码：cc520</span>
					</p>
				</div>
				<!--保存之后出现二维码-->
				<p class="say_info">文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明</p>
			</div>
			
			<div class="order_b1">
				<p class="title">支付方式</p>
				<div class="pay active">
					<img src="/BigHomewoke/img/pay_way1.png" style="margin-top: 3px;"/>
					<img src="/BigHomewoke/img/order_p1.png" class="img2" style="display:block;"/>
				</div>
				<div class="pay">
					<img src="/BigHomewoke/img/pay_way2.png" style="margin-top: 10px;"/>
					<img src="/BigHomewoke/img/order_p1.png" class="img2" />
				</div>
			</div>
			<script>
					$(function(){
						$("#add").click(function(){
							$(".old_add").hide();
							$(".new_add").fadeIn();
						});
						$(".add_btn").click(function(){
							$(".new_add").hide();
							$(".old_add").fadeIn();
						});
						$(".close").click(function(){
							$(".new_add").hide();
							$(".old_add").fadeIn();
						});
						$(".pay").click(function(){
							$(".pay").removeClass("active");
							$(".pay").find(".img2").hide();
							$(this).addClass("active");
							$(this).find(".img2").show();
						});
					});
				</script>
				
			<div class="order_b1">
				<p class="title">商品与配送方式<a href="shop_car.html" style="color:#474747;">[返回购物车]</a></p>
				
			<c:forEach items="${list }" var="p">	
				<table >
					<td name="tab">
				<div class="song">
					<p class="pic"><img src="/BigHomewoke/img/order_pic5.jpg"/></p>
					<p class="name">${p.name }</p>
					<p class="num"><font color="#3CA5F1">￥${p.price }</font>*${p.count }</p>
					<p class="totle">￥<span class="price">${p.count*p.price} </span></p>
				</div>
					</td>
				</table>
			</c:forEach>
			</div>
			
			<div class="order_b1">
				<p class="title">使用优惠券</p>
				<p class="conpou1">可用优惠券(5)</p>
				<!--没有可用优惠券-->
				<!--<p class="conpou2">无可用优惠券</p>-->
				<!--没有可用优惠券-->
				<p class="can">
					<span class="dq">50元优惠卷</span>
					<img src="img/yhq.png"/>
					<span class="more">30元优惠卷</span>
					<span class="more">40元优惠卷</span>
					<span class="more">60元优惠卷</span>
					<span class="more">20元优惠卷</span>
				</p>
			</div>
			<script type="text/javascript">
				$(function(){
					var bool=true;
					$(".dq").click(function(){
						if(bool){
							$(this).parent(".can").children(".more").fadeIn().css("display","block");
							$(this).parent(".can").children("img").css("transform","rotate(90deg)");
							bool=false;
							var bb=true;
							$(this).parent(".can").children(".more").click(function(){
								if(bb){
									$(this).css("border","#000000 1px solid");
								    bb=false;
								}else{
									$(this).css("border","none");
									bb=true;
								}
								
							});
						}else{
							$(this).parent(".can").children(".more").fadeOut();
							$(this).parent(".can").children("img").css("transform","rotate(0deg)");
							bool=true;
						}
						
					});
				});
				
				//计算价格
				$(function(){ 
				
				function setTotal(){ 
				// 计算价格
					var s=0; var ss=0; 
					$("td[name='tab']").each(function(index){  
					s+=parseFloat($(this).find('span[class*=price]').text()); 
		     		ss+=parseFloat($(this).find('span[class*=price]').text()); 
				}); 
					$("#totall").html(ss.toFixed(2));
					$("#total").html(s.toFixed(2));
				}
					setTotal(); 
				}) 
				
			</script>
			<div class="order_b2">
				<p>1件商品，共计： 	￥<label id="total"></p>
				<p>总运费： 	￥0</p>
				<p>优惠共计：	-￥0</p>
			</div>
			<p class="order_b3">
				<span>订单总计：<font color="#de0000" style="font-size: 28px;">￥<label id="totall"></font></span>
			</p>
			
				<p class="order_b3">
					<span><input type="submit" value="提交订单"></span>
				</p>
			
		</div>
		</form>
		<div class="footer">
			<div class="footer_con">
				<p>享有 | enjoy</p>
				<img src="/BigHomewoke/img/footer.png" />
			</div>
			<div class="footer_con2">
				<p>© 2015 dingdongyouli.com All rights reserved.</p>
				<img src="/BigHomewoke/img/footer_p2.jpg" />
			</div>

		</div>
	</body>

</html>