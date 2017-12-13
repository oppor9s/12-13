<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8" />
		<title>后台管理中心</title>
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
					<a class="login_btn">登录</a>
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
				<a href="shop_car.html"><i class="iconfont">&#xe600;</i><span>1</span></a>
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
		<div class="personal">
			<p class="title">我的商店<span>您好，管理员:${name1 }</span></p>
			<ul class="per_nav">
				<li class="active">查看订单</li>
				<li>增加商品</li>
				<li>删除商品</li>
				<li>查看用户</li>
				<li>*****</li>
				
			</ul>
			<p class="title"><span>
			<form action="${ctx }/admin/findorder" method="post">
			<input type="text" name="findorder" placeholder="请输入要查询的用户名或商品名">
			<input type="submit" style="border:0;background:#FFFFFF;width:40px; height:30px; " value=">>">
			</form>
			</span></p>
			<p class="title"><span>&nbsp;</span></p>
			<ul class="per_nav2">
				<li class="active">订单</li>
				<li>信息</li>
				<li>优惠卷</li>
				<li>留言</li>
			</ul>
			
			<!-- 查看订单 -->
			<div class="per_box">
				<ul class="per_navul">
					<li style="width: 50px;margin-left: 0px;">
						</li>
					<li style="width: 100px;text-align: left;">买家姓名</li>
					<li style="width: 350px;text-align: left;">地址</li>	
					
					<li>合计</li>
					<li style="width: 200px;text-align: left;">下单时间</li>
					<li>查看</li>
					<li>状态</li>
					<li>操作</li>
				</ul>
				<c:forEach items="${order }" var="pt" varStatus="sta">							
					<ul class="per_listul">
						<li style="width: 50px;margin-left: 0px;">
						</li>
						<li style="width: 100px;text-align: left;">${pt.userName }</li>
						<li style="width: 350px;text-align: left;">${pt.address }</li>
						
						<li>￥${pt.sumprice }</li>
						<li style="width: 200px;text-align: left;">${pt.time }</li>
						<li><a href="${ctx }/admin/ordermessage?name=${pt.userName } ">详情</a></li>
						<li><a href="${ctx }/admin/jiedan?id=${pt.id } ">${pt.state }</a></li>
						<li><a href="${ctx }/admin/deleteorder?id=${pt.id}">删除</a></li>
						<p>送货地址：${pt.address }</p>
					</ul>
				</c:forEach>
			</div>
			
			<!-- 增加商品 -->
			<div class="per_box per_info" style="display: none;">
				<form action="${ctx }/admin/addproduct" method="post" enctype="multipart/form-data">
					<p>
						<span>产品类别</span><span>&nbsp;&nbsp;</span>
							<select name="type">
								<c:forEach items="${type }" var="pt">
									<option value="${pt.name }">${pt.name }</option>
								</c:forEach>
					 		</select>
					</p>
					<p>
						<span>产品名称</span>
						<input type="text" name="name"/>
					</p>
					<p>
						<span>产品价格</span>
						<input type="text" name="price"/>
					</p>
					<p>
						<span>产品图片</span>
						<input type="file"  name="file"   style="width:200px;height:25px;text-align: left" />
						
					</p>
					<p style="width:200px;height:35px;text-align:center;">
						<input type="submit"  class="per_info_btn" value="保存"/>
					</p>
				</form>
			</div>
			<div class="per_box per_coupon" style="display: none;">
				<ul class="per_couponul">
					<li class="active">巨大型de</li>
					<li>巨小型de</li>
					<li>中型de</li>
				</ul>
				<div class="per_coupon_box">
					<c:forEach items="${list1 }" var="p1">
						<div class="per_coupon_list">
							<p>名称：${p1.name }</p>
							<p>单价：${p1.price }</p>
							<p>~~~~~~~~~~~</p>
							<p align="right"><a href="${ctx }/admin/deleteproduct?id=${p1.id}">删除</a></p>
						</div>
					</c:forEach>
					
				</div>
				<div class="per_coupon_box" style="display: none;">
					<c:forEach items="${list2 }" var="p2">
						<div class="per_coupon_list">
							<p>名称：${p2.name }</p>
							<p>单价${p2.price }</p>
							<p>~~~~~~~~~~~</p>
							<p align="right"><a href="${ctx }/admin/deleteproduct?id=${p2.id}">删除</a></p>
						</div>
					</c:forEach>
				</div>
				<div class="per_coupon_box" style="display: none;">
					<c:forEach items="${list3 }" var="p3">
						<div class="per_coupon_list">
							<p>名称：${p3.name }</p>
							<p>单价${p3.price }</p>
							<p>~~~~~~~~~~~</p>
							<p align="right"><a href="${ctx }/admin/deleteproduct?id=${p3.id}">删除</a></p>
						</div>
					</c:forEach>
				</div>
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
			<div class="per_box" style="display: none;">
			<ul class="per_navul">
					
					<li style="width: 100px;text-align: left;">买家姓名</li>
					<li style="width: 300px;text-align: left;">收货地址</li>	
					
					<li style="width: 200px;text-align: left;">手机号</li>
					<li style="width: 200px;text-align: left;">邮箱地址</li>
					<li style="width: 200px;text-align: center;">操作</li>
			</ul>
			<c:forEach items="${alluser }" var="pt">							
					<ul class="per_listul">
						
						<li style="width: 100px;text-align: left;">${pt.name }</li>
						<li style="width: 300px;text-align: left;">${pt.address }</li>
						
						<li style="width: 200px;text-align: left;">￥${pt.phone }</li>
						<li style="width: 200px;text-align: left;">${pt.email }</li>
						<li style="width: 200px;text-align: center;"><a href="${ctx }/admin/deleteuser?name=${pt.name }">删除该用户</a></li>
						<p>送货地址：${pt.address }</p>
					</ul>
				</c:forEach>
			
			</div>
			<div class="per_box per_info" style="display: none;">
				<form action="" method="post">
					<p>
						<span>旧密码</span>
						<input type="password"/>
					</p>
					<p>
						<span>新密码</span>
						<input type="password"/>
					</p>
					<p>
						<span>确认新密码</span>
						<input type="password"/>
					</p>
					<p class="per_info_btn">保存</p>
				</form>
			</div>
		</div>
		<script>
			$(function(){
				$(".per_couponul li").click(function(){
					$(".per_couponul li").removeClass("active");
					$(this).addClass("active");
					$(".per_coupon_box").hide();
					$(".per_coupon_box").eq($(".per_couponul li").index(this)).fadeIn();
				});
				$(".per_nav li").click(function(){
					$(".per_nav li").removeClass("active");
					$(this).addClass("active");
					$(".per_box").hide();
					$(".per_box").eq($(".per_nav li").index(this)).fadeIn();
				});
				$(".per_nav2 li").click(function(){
					$(".per_nav2 li").removeClass("active");
					$(this).addClass("active");
					$(".per_box").hide();
					$(".per_box").eq($(".per_nav2 li").index(this)).fadeIn();
				});
			});
				</script>
				
				
		<div class="login_bg">
			<div class="login">
				<img src="/BigHomewoke/img/close.png" class="close"/>
				<img src="/BigHomewoke/img/login.png" style="margin: 25px 0px;"/>
				<form action="${ctx }/admin/login" method="post">
					<p class="list">
						<img src="/BigHomewoke/img/login_pic2.png"/>
						<input type="text" name="name" placeholder="请输入注册时的邮箱/手机号"/>
					</p>
					<p class="list">
						<img src="/BigHomewoke/img/login_pic3.png"/>
						<input type="password" name="password" placeholder="请输入注册时的邮箱/手机号"/>
					</p>
					<a href="find.html">忘记密码?</a>
					<p>
						<a href="register.html">注册</a>
						<a href=""><input type="submit" value="登录" style="width:115px;height:35px;"/></a>
					</p>
				</form>
			</div>
		</div>


		
		
		<script type="text/javascript">
			$(function(){
				$(".close").click(function(){
					$(".login_bg").fadeOut();
				});
				$(".login_btn").click(function(){
					$(".login_bg").slideDown();
					$(".meau_box").slideUp();
				});
			});
		</script>
		
		<script type="text/javascript">
			$(function(){
				$(".close").click(function(){
					$(".login_bg1").fadeOut();
				});
				$(".login_btn1").click(function(){
					$(".login_bg1").slideDown();
					$(".meau_box").slideUp();
				});
			});
		</script>
		
		
		<script type="text/javascript">
			$(function(){
				$(".res_nav").children("li").click(function(){
					$(".res_nav").children("li").stop().removeClass("active");
					$(this).stop().addClass("active");
					$(".res_form").stop().slideUp();
					$(".res_form").eq($(".res_nav").children("li").index(this)).stop().slideDown();
				});
			});
		</script>
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