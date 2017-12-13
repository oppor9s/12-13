<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title>叮咚有礼--购买</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
		<link rel="stylesheet" href="/BigHomewoke/css/demo.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/style.css" />
		<link rel="stylesheet" href="/BigHomewoke/css/fen.css" />
		<link rel="stylesheet" type="text/css" href="/BigHomewoke/css/swiper.min.css" />
		<script type="text/javascript" src="/BigHomewoke/js/jquery-2.2.0.min.js"></script>
		<script type="text/javascript" src="/BigHomewoke/js/swiper.min.js"></script>
	</head>

	<body>
		<div class="header">
			<div class="hea_nav">
				<a href="index.html"><img src="/BigHomewoke/img/logo.png" class="logo" /></a>
				<ul>
					<a href="${ctx}/index2.jsp"><li>首页</li></a>
					<a href="${ctx }/findproduct/findByPage?pagenum=1"><li>叮咚一下</li></a>
					<a href="${ctx }/adduser/usermessage"><li>个人中心</li></a>
					<a href="${ctx }/findproduct/findByUserName"><li>购物车</li></a>
				</ul>
			</div>
			<div class="hea_right">
				<p>
					<a href="register.html">注册</a>|
					<a class="login_btn">登录</a>
				</p>
				<a href="shop_car.html">
					<p class="head-shopcart">
						<i class="iconfont">&#xe600;</i>
						<span>0件</span>
					</p>
				</a>

			</div>
		</div>
		<div class="header2">
			<img src="/BigHomewoke/img/phone_meau.png" class="meau" />
			<img src="/BigHomewoke/img/logo.png" class="logo" />
			<a href="shop_car.html"><i class="iconfont">&#xe600;</i></a>
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
		<div class="buy">
			<p class="crumb">
				<a>Home</a>>
				<a>All products</a>>${list.name }</p>
			<div class="buy_info">
				<div class="buy_img">
					<div class="page">
						<div class="middle_img">
							<img src="/BigHomewoke/img/${list.img }" style="display: block;">
							<img src="/BigHomewoke/img/${list.img }">
							<img src="/BigHomewoke/img/${list.img }">
							<img src="/BigHomewoke/img/${list.img }">
						</div>
						<div class="small_img">
							<img src="/BigHomewoke/img/${list.img }" class="active">
							<img src="/BigHomewoke/img/${list.img }">
							<img src="/BigHomewoke/img/${list.img }">
							<img src="/BigHomewoke/img/${list.img }">
						</div>
					</div>
				</div>
				<form action="${ctx }/addProcut/add?pagenum=1" method="post">
				<div class="buy_right">
					<p class="p1">本周特推|${list.name }</p>
					<p class="p2">订购价：￥
						<font style="font-size: 23px;">${list.price }</font>
						<input type="hidden" name="name" value="${list.name }">
						<input type="hidden" name="price" value="${list.price }">
						<input type="hidden" name="type" value="${list.type }">
					</p>
					<p class="p3">规格：${list.type }</p>
					<p class="p4 buy_p4">
						尺码：
						<span class="active">不好意思，尺码都一样</span>
>
					</p>
					<p class="p3">花束数量：</p>
					<p class="p5">
						<td>&nbsp;&nbsp;</td>
						<span class="jian">-</span></td><td>&nbsp;&nbsp;</td>
						<input type="text" name="count" value="1" style="width:30px;height:30px;" class="num" ><td>&nbsp;&nbsp;</td>
						<td align="right"><span class="add">+</span></td>
					</p>
					<span>花束设计</span>
					<p class="p6">
						<img src="/BigHomewoke/img/like1.png" class="like"/>
						<span>999人喜欢</span>
					</p>
					<p class="p7">
						<input type="submit" class="btn-buy" style="
																	color: #595959;
																	font-size: 14px;
																	display: inline-block;
																	width: 185px;
																	height: 50px;
																	background: #A10000;
																	color: #fff;
																	line-height: 50px;
																	text-align: center;
																	border-radius: 5px;
																	font-size: 18px;
																	margin-right:5px;
																	cursor: pointer;" value="加入礼单">
					</p>
				</div>
				</form>
			</div>
			<img src="/BigHomewoke/img/info.jpg" class="info_img" />
		</div>
		<script>
		
		
		$(document).ready(function(){
			//加的效果
			$(".add").click(function(){
			var n=$(this).prev().val();
			var num=parseInt(n)+1;
			if(num==0){ return;}
			$(this).prev().val(num);
			});
			//减的效果
			$(".jian").click(function(){
			var n=$(this).next().val();
			var num=parseInt(n)-1;
			if(num==0){ return}
			$(this).next().val(num);
			});
		})
		
			$('.btn-buy').bind('click',function(){
				var img = $(".middle_img").find('img');
				var flyElm = img.clone().css('opacity', 0.75);
				$('body').append(flyElm);
				flyElm.css({
					'z-index': 9000,
					'display': 'block',
					'position': 'absolute',
					'top': img.offset().top +'px',
					'left': img.offset().left +'px',
					'width': img.width() +'px',
					'height': img.height() +'px'
				});
				flyElm.animate({
					top: $('.head-shopcart').offset().top,
					left: $('.head-shopcart').offset().left,
					width: 20,
					height: 32
				}, 'slow', function() {
					flyElm.remove();
				});
			}); 
			</script>
		<div class="big_img">
			<img src="/BigHomewoke/img/close2.png" class="close" />
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><span><img src="/BigHomewoke/img/buy_img.jpg"></span></div>
					<div class="swiper-slide"><span><img src="/BigHomewoke/img/buy_img.jpg"></span></div>
					<div class="swiper-slide"><span><img src="/BigHomewoke/img/buy_img.jpg"></span></div>
					<div class="swiper-slide"><span><img src="/BigHomewoke/img/buy_img.jpg"></span></div>
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
		<script type="text/javascript">
			var swiper = new Swiper(".swiper-container", {
				paginationClickable: true,
				nextButton: '.swiper-button-next',
				prevButton: '.swiper-button-prev',
				autoHeight: true, //enable auto height
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
		<script>
			$(function() {
				var bool=true;
				$(".like").click(function(){
					if(bool){
						$(this).attr("src","img/like2.png");
						bool=false;
					}else{
						$(this).attr("src","img/like1.png");
						bool=true;
					}
				});
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
				$(".small_img").children("img").click(function() {
					$(".small_img").children("img").removeClass("active");
					$(this).addClass("active");
					$(".middle_img").children("img").hide();
					$(".middle_img").children("img").eq($(".small_img").children("img").index(this)).fadeIn();
				});
				$(".buy_p4 span").click(function() {
					$(".buy_p4 span").removeClass("active");
					$(this).addClass("active");
				});
				$(".big_img").hide();
				$(".middle_img").children("img").click(function() {
					$(".big_img").css("display", "block");
				});
				$(".close").click(function() {
					$(".big_img").fadeOut();
				});
			});
		</script>
	</body>

</html>