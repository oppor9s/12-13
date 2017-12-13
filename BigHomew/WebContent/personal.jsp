<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8" />
		<title>叮咚有礼--个人中心</title>
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
					<a>你好，八月</a>|<a>退出</a>
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
			<p class="title">我的账户<span>您好，kore.倩</span></p>
			<ul class="per_nav">
				<li class="active">我的订单</li>
				<li>完善或修改信息</li>
				<li>我的收货地址</li>
				<li>我的留言</li>
				<li>密码修改</li>
			</ul>
			<ul class="per_nav2">
				<li class="active">订单</li>
				<li>信息</li>
				<li>优惠卷</li>
				<li>留言</li>
			</ul>
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
				<c:forEach items="${list2 }" var="pt">
				<ul class="per_listul">
					<li style="width: 50px;margin-left: 0px;">
						</li>
						<li style="width: 100px;text-align: left;">${pt.userName }</li>
						<li style="width: 350px;text-align: left;">${pt.address }</li>
						
						<li>￥${pt.sumprice }</li>
						<li style="width: 200px;text-align: left;">${pt.time }</li>
						<li><a href="${ctx }/admin/ordermessage?name=${pt.userName } ">详情</a></li>
						<li><a href="${ctx }/order/findorder1?id=${pt.id}">
							<c:choose>
								<c:when test="${pt.guanli==1 }">已下单</c:when>
								<c:when test="${pt.guanli==0 }">可修改</c:when>
							
							</c:choose>
						</a>
						</li>
						<li><a href="${ctx }/order/deleteorder88?id=${pt.id}">删除</a></li>
						<p>送货地址：${pt.address }</p>
				</ul>
				</c:forEach>
			</div>
			<div class="per_box per_info" style="display: none;">
			
				<form:form commandName="user" action="${ctx }/changemessage/change" method="post">
					<p>
						<span>昵称</span>
						<form:input path="name"/>
						
					</p>
					<p>
						<span>邮箱地址</span>
						<form:input path="email"/>
						
					</p>
					<p>
						<span>手机号码</span>
						<form:input path="phone" />
						<form:hidden path="password"/>
						<form:hidden path="id"/>
						<form:hidden path="address"/>
					<p style="width:200px;height:35px;text-align:center;">
						<input type="submit"  class="per_info_btn" value="保存"/>
					</p>
				</form:form>
				
			</div>
			<div class="per_box per_coupon" style="display: none;">
				<ul class="per_couponul">
					<li class="active">我的地址</li>
					<li>修改地址</li>
					<li>新增地址</li>
				</ul>
				
				<div class="per_coupon_box">
					<c:forEach items="${list3 }" var="p">
					<div class="per_coupon_list per_coupon_old">
						<p>${p.name }</p>
						<p>${p.address }</p>
						<p><a href="${ctx }/adduser/delete?id=${p.id }">删除此地址</a></p>
					</div>
					</c:forEach>
				</div>
				<div class="per_coupon_box" style="display: none;">
					<c:forEach items="${list3 }" var="p">
					<form action="${ctx }/adduser/change" method="post">
					<div class="per_coupon_list per_coupon_old">
						<p><input type="hidden" name="name" value="${p.name }"/></p>
						<p><input type="text" name="address" value="${p.address }"/></p>
						<p><input type="submit" value="保存此地址"/></p>
						<input type="hidden" name="id" value="${p.id }"/>
					</div>
					</form>
					</c:forEach>
				</div>
				<div class="per_coupon_box" style="display: none;">
					<form action="${ctx }/adduser/addAddress" method="post">
					<div class="per_coupon_list per_coupon_old">
						<p><input type="hidden" name="name" value="${name1 }"/></p>
						<p><input type="text" name="address"/></p>
						<p><input type="submit" value="保存此地址"/></p>
					</div>
					</form>
				</div>
			</div>
			<div class="per_box" style="display: none;">
				我的留言
			</div>
			<div class="per_box per_info" style="display: none;">
					
				<form:form commandName="user" action="${ctx }/changemessage/change" method="post">
					<p>
						<span>修改密码</span>
						<form:input path="password"/>
					</p>
					<p>
						<span>确认密码</span>
						<form:input path=""/>
					</p>
					<p>
						<form:hidden path="id"/>
						<form:hidden path="name"/>
						<form:hidden path="address"/>
						<form:hidden path="phone"/>
						<form:hidden path="email"/>
					</p>
					<p style="width:200px;height:35px;text-align:center;">
						<input type="submit"  class="per_info_btn" value="保存"/>
					</p>
				</form:form>
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
				<form action="" method="post">
					<p class="list">
						<img src="/BigHomewoke/img/login_pic2.png"/>
						<input type="text" placeholder="请输入注册时的邮箱/手机号"/>
					</p>
					<p class="list">
						<img src="/BigHomewoke/img/login_pic3.png"/>
						<input type="password" placeholder="请输入注册时的邮箱/手机号"/>
					</p>
					<a href="find.html">忘记密码?</a>
					<p>
						<a href="register.html">注册</a>
						<a>登录</a>
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