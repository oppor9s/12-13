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
		<link href="/BigHomewoke/css/public.css" type="text/css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="/BigHomewoke/css/buyConfirm.css" />
		<script type="text/javascript" src="/BigHomewoke/js/jquery-2.2.0.min.js"></script>
	</head>

	<body>
		<div class="header">
			<div class="hea_nav">
				<a href="index.html"><img src="/BigHomewoke/img/logo.png" class="logo"/></a>
				<ul>
					<a href="${ctx}/index2.jsp"><li>首页</li></a>
					<a href="${ctx }/findproduct/findByPage?pagenum=1"><li>叮咚一下</li></a>
					<a href="${ctx }/adduser/usermessage"><li>个人中心</li></a>
					<a href="${ctx }/findproduct/findByUserName"><li>购物车</li></a>
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
	
	
		<div class="personal">
			
		
	
		   <div class="order-info">
                <div class="msg">
                    <h3>您的订单已提交成功！马上发货哟～</h3>
                    <p></p>
                    
                    <p class="post-date">成功订单付款后，7天发货</p>
                </div>
                <div class="info">
                    <p>
                     	   金额：<span class="pay-total">${order.sumprice }元</span>
                    </p>
                   
                    <p>订单：1150505740045173 </p>
                    <p>
                   	   	  收货人：${order.userName }  
                        <span class="line">/</span>
                  		 地址 
                  		 <span class="line">：</span>
                                 	${order.address }
                		 <span class="line">/</span>
                                    	   不限送货时间
                  		 <span class="line">/</span>
                                 		   个人电子发票
                    </p>
                    <p><a href="${ctx }/findproduct/findByPage?pagenum=1">继续购物</a></p>
                </div>
                <div class="icon-box">
                    <i class="iconfont"><img src="/BigHomewoke/img/yes_ok.png"></i>
                </div>
            </div>
			

			
			
	
			
		
		</div>
	
		<div class="footer">
			<div class="footer_con">
				<p style="height:35px;">享有 | enjoy</p>
				<img src="/BigHomewoke/img/footer.png" />
			</div>
			<div class="footer_con2">
				<p>© 2015 dingdongyouli.com All rights reserved.</p>
				<img src="/BigHomewoke/img/footer_p2.jpg" />
			</div>
		</div>
	</body>

</html>

