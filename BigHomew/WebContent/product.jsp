<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title>叮咚有礼--叮咚一下</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
		<link rel="stylesheet" href="/BigHomewoke/css/demo.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/style.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/fen.css" />
		<script type="text/javascript" src="/BigHomewoke/js/jquery-2.2.0.min.js"></script>
	</head>
	<body>
	<div>
		<div class="header">
			<div class="hea_nav">
				<a href="index.html"><img src="/BigHomewoke/img/logo.png" class="logo"/></a>
				<ul>
					<a href="${ctx}/index2.jsp"><li>首页</li></a>
					<a href="${ctx }/findproduct/findByPage?pagenum=1"><li>叮咚一下</li></a>
					<a href="blog.html"><li>BLOG</li></a>
					<a href="${ctx }/adduser/usermessage"><li>个人中心</li></a>
					<a href="${ctx }/findproduct/findByUserName"><li>购物车</li></a>
					<a href="message.html"><li>留言板</li></a>
					
				</ul>
			</div>
			<div class="hea_right">
				<p>
					<a href="register.html">注册</a>|<a class="login_btn">登录</a>
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
		
		</div>
			<div style="margin-top:100px;text-align:center;">
			<tr>
				<td><a href="${ctx }/findproduct/findByPage?pagenum=1">所有商品</a></td>
				<td><a href="${ctx }/findproduct/findBytype1?pagenum=1&id=1">巨小型</a></td>
				<td><a href="${ctx }/findproduct/findBytype1?pagenum=1&id=2">巨大型</a></td>
				<td><a href="${ctx }/findproduct/findBytype1?pagenum=1&id=3">中型</a></td>
			</tr>
		</div>
		
		<div class="product">
			<div>
			<ul>
			<c:forEach items="${list }" var="p">
				<a href="${ctx }/findproduct/findById?id=${p.id} ">
				<li>
					<img src="/BigHomewoke/img/${p.img }" />
					<div class="proli_bg">
						<div class="proli_bg_box">
							<div class="proli_top">
								<p>${p.name }</p>
								<p>${p.name }</p>
							</div>
							<p>${p.price }</p>
						</div>
					</div>
				</li></a>
				</c:forEach>
			</ul>
			</div>
		</div>
	
			
		
		<div class="login_bg">
			<div class="login">
				<img src="/BigHomewoke/img/close.png" class="close"/>
				<img src="/BigHomewoke/img/login.png" style="margin: 25px 0px;"/>
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
						<a href="${ctx }/regster.jsp">注册</a>
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
		</div>
			<div style="margin-top:1020px;text-align:center;">
			<tr>
				<td><a href="${ctx }/findproduct/findByPage?pagenum=1">首页</a></td>
				<td><a href="${ctx }/findproduct/findByPage?pagenum=${prenum}">上一页</a></td>
				<td><a href="${ctx }/findproduct/findByPage?pagenum=${nextnum}">下一页</a></td>
			</tr>
		</div>
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