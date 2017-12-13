<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title>叮咚有礼</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
		<link rel="stylesheet" href="/BigHomewoke/css/demo.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/style.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/fen.css" />
		<script type="text/javascript" src="/BigHomewoke/js/jquery-2.2.0.min.js"></script>
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
		<div class="box1">
			<div class="header">
				<div class="hea_nav">
					<a href="index.html"><img src="/BigHomewoke/img/logo.png" class="logo" /></a>
					<ul>
						<a href="index.html">
							<li>首页</li>
						</a>
						<a href="product.html">
							<li>叮咚一下</li>
						</a>
						<a href="blog.html">
							<li>BLOG</li>
						</a>
					</ul>
				</div>
				<div class="hea_right">
					<p>
						<a href="/BigHomewoke/regster.jsp">注册</a>|
						<a class="login_btn">登录</a>
					</p>
					<a href="shop_car.html">
						<p>
							<i class="iconfont">&#xe600;</i>
							<span>0件</span>
						</p>
					</a>

				</div>
			</div>
			<div class="header2">
				<img src="/BigHomewoke/img/phone_meau.png" class="meau" />
				<img src="/BigHomewoke/img/logo3.png" class="logo" />
				<a href="shop_car.html"><i class="iconfont">&#xe600;</i><span>1</span></a>
				<ul class="meau_box">
					<a href="index.html">
						<li>首页</li>
					</a>
					<a href="product.html">
						<li>叮咚一下</li>
					</a>
					<a href="blog.html">
						<li>BLOG</li>
					</a>
					<a href="personal.html">
						<li>个人中心</li>
					</a>
					<a href="message.html">
						<li>留言板</li>
					</a>
					<p style="border-right:1px #fff solid;" class="login_btn">登录</p>
					<a href="register.html">
						<p>注册</p>
					</a>
				</ul>
			</div>
			<img src="/BigHomewoke/img/PC_h.jpg" class="pc_h" />
			<img src="/BigHomewoke/img/mobile_h.jpg" class="mobile_h" />
			<!--定位1-->
			<div class="ding"></div>
		</div>
		<div class="conpou">
			<div class="conpou_box">
				<img src="/BigHomewoke/img/close.png" class="gb"/>
				<img src="/BigHomewoke/img/code_pic.png" />
				<input type="text" placeholder="请输入专属吗码,例：CC520"/>
				<a href="message.html">查看模版案例>></a>
				<p>确定</p>
			</div>
		</div>
		
		<div class="/BigHomewoke/img_box">
			<img src="/BigHomewoke/img/PC.jpg" class="pc" />
			<img src="/BigHomewoke/img/mobile.jpg" class="mobile" />
			<!--定位2-->
			<a href="product.html">
				<div class="ding2"></div>
			</a>
		</div>

		<div class="login_bg">
			<div class="login">
				<img src="/BigHomewoke/img/close.png" class="close" />
				<img src="/BigHomewoke/img/login.png" style="margin: 25px 0px;" />
				<form action="${ctx }/adduser/login" method="post">
					<p class="list">
						<img src="/BigHomewoke/img/login_pic2.png" />
						<input type="text" name="name" placeholder="请输入注册时的邮箱/手机号" />
					</p>
					<p class="list">
						<img src="/BigHomewoke/img/login_pic3.png" />
						<input type="password" name="password" placeholder="请输入注册时的邮箱/手机号" />
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
			$(function() {
				$(".ding").click(function() {
					$(".conpou").fadeIn();
				});
				$(".gb").click(function() {
					$(".conpou").fadeOut();
				});
				$(".close").click(function() {
					$(".login_bg").fadeOut();
				});
				$(".login_btn").click(function() {
					$(".login_bg").slideDown();
					$(".meau_box").slideUp();
				});
				$(".meau").on("click", function(e) {
					$(".meau_box").slideToggle();
					$(document).one("click", function() {
						$(".meau_box").fadeOut();
					});
					e.stopPropagation();
				});
				$(".meau").on("click", function(e) {
					e.stopPropagation();
				});
			});
		</script>
	</body>

</html>