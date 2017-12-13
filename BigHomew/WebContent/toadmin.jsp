<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>    

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
					<a href="${ctx }/index2.jsp"><li>首页</li></a>
					<a href="${ctx }/findproduct/findByPage?pagenum=1"><li>叮咚一下</li></a>
					<a href="blog.html"><li>BLOG</li></a>
				</ul>
			</div>
			<div class="hea_right">
				<p>
					后台管理
				</p>				
			</div>
		</div>
		
		
		<div class="personal">
			<p class="title">我的商店<span>您好，管理员:${name1 }</span></p>
		</div>	

			<div style="width: 430px;height:330px;background: #FFFFFF;text-align: center;margin-left:36%;">
				
				<img src="/BigHomewoke/img/login.png" style="margin: 25px 0px;"/>
				<form action="${ctx }/admin/login" method="post">
					<p class="list">
						<img src="/BigHomewoke/img/login_pic2.png"/>&nbsp;
						<input type="text" name="name" placeholder="请输入管理员账号"/>
					</p>
					<p>&nbsp;</p>
					<p class="list">
						<img src="/BigHomewoke/img/login_pic3.png"/>&nbsp;
						<input type="password" name="password" placeholder="请输入密码"/>
					</p>
					<p>&nbsp;</p>
					<p>
						<a href=""><input type="submit" value="登录" style="width:115px;height:35px;"/></a>
					</p>
				</form>
			</div>
		
			
		
		
		
		<div class="footer" >
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