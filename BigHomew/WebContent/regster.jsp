<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<title>叮咚有礼--注册</title>
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
					<a href="${ctx }/findproduct/findByPage?pagenum=1"><li>叮咚一下</li></a>
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
		<div class="register">
			<p class="res_title">用户注册</p>
			<div class="res_box">
				<ul class="res_nav">
					<li class="active">
						<i class="iconfont">&#xe602;</i>
						<span>手机注册</span>
					</li>
					<li>
						<i class="iconfont">&#xe603;</i>
						<span>邮箱注册</span>
					</li>
					<li>
						<i class="iconfont">&#xe604;</i>
						<span>用户名注册</span>
					</li>
				</ul>
				<div class="res_form">
					<form action="" method="post">
						<p class="res_list">
							<span>手机号码</span>
							<input type="tel" />
						</p>
						<p class="tip">仅支持中国大陆地区手机号码！</p>
						<p class="res_list" style="margin-top: 0px;">
							<span>手机验证码</span>
							<input type="text" style="width: 70px;"/>
							<span class="yan_code">获取验证码</span>
						</p>
						<p class="res_list">
							<span>设置密码</span>
							<input type="password" />
						</p>
						<p class="res_list">
							<span>确认密码</span>
							<input type="password" />
						</p>
						<p class="res_btn">注册</p>
					</form>
					<p>已有账号？请<a style="color: #AE191B;" class="login_btn">直接登录</a></p>
				</div>
				<div class="res_form" style="padding-top: 40px;display: none;">
					<form action="" method="post">
						<p class="res_list">
							<span>邮箱地址</span>
							<input type="email" />
						</p>
						<p class="res_list">
							<span>设置密码</span>
							<input type="tel" />
						</p>
						<p class="res_list">
							<span>确认密码</span>
							<input type="tel" />
						</p>
						<p class="res_btn">注册</p>
					</form>
					<p>已有账号？请<a style="color: #AE191B;" class="login_btn">直接登录</a></p>
				</div>
				<div class="res_form" style="padding-top: 20px;display: none;">
					<form action="${ctx}/adduser/add " method="post">
						<p class="res_list">
							<span>用户名</span>
							<input type="text" name="name"  onkeyup="showHint(this.value)"/>
						</p>
						<p class="tip" id="txtHint">输入用户名</p>
						
						<p class="res_list">
							<span>设置密码</span>
							<input type="password" id="pwd1" name="password"/>
						</p>
						<p class="res_list">
							<span>确认密码</span>
							<input type="password" id="pwd2" name="password1" onkeyup="validate()"><span class="tip" id="erro"></span>
						
						</p>
						<input type="submit" class="res_btn"  id="btnShow" value="注册">
					</form>
					<p>已有账号？请<a style="color: #AE191B;" class="login_btn">直接登录</a></p>
				</div>
			</div>
		</div>
		<div class="login_bg">
			<div class="login">
				<img src="/BigHomewoke/img/close.png" class="close"/>
				<img src="/BigHomewoke/img/login.png" style="margin: 25px 0px;"/>
				<form action="${ctx }/adduser/login" method="post">
					<p class="list">
						<img src="/BigHomewoke/img/login_pic2.png"/>
						<input type="text"  name="name" onMouseOut="checkname(this.value)"/>
					</p>
					<p class="list">
						<img src="/BigHomewoke/img/login_pic3.png"/>
						<input type="password" name="password" onMouseOut="checkpassword(this.value)"/>
						
					</p>
					<a href="fill_order.html">忘记密码?</a>
					<p>
						
						<a><input type="submit" id="btn" value="登录" style="width:115px;height:35px;"/></a>
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
		//验证登陆信息
			//验证用户名
			function checkname(str)
			{
			  var xmlhttp;
			  if (window.XMLHttpRequest)
			  {
			    xmlhttp=new XMLHttpRequest();
			  }
			  else
			  {
			    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			  xmlhttp.onreadystatechange=function()
			  {
			    if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    var n =xmlhttp.responseText;
			    if(n=="noexist"){
			    	alert("用户名不存在");
			    	document.getElementById("btn").disabled=true;
			    }else{
			    	document.getElementById("btn").disabled=false;
			    }
			    }
			  }
			  xmlhttp.open("GET","${ctx}/adduser/loginname?q="+str,true);
			  xmlhttp.send();
			}
			//验证密码
			function checkpassword(str)
			{
			  var xmlhttp;
			  if (window.XMLHttpRequest)
			  {
			    xmlhttp=new XMLHttpRequest();
			  }
			  else
			  {
			    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			  xmlhttp.onreadystatechange=function()
			  {
			    if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    var n =xmlhttp.responseText;
			    if(n=="noexist"){
			    	alert("密码不正确");
			    	document.getElementById("btn").disabled=true;
			    }else{
			    	document.getElementById("btn").disabled=false;
			    }
			    }
			  }
			  xmlhttp.open("GET","${ctx}/adduser/loginpassword?q="+str,true);
			  xmlhttp.send();
			}
		
		
		//验证用户名是否可用	
			function showHint(str)
			{
			  var xmlhttp;
			  if (window.XMLHttpRequest)
			  {
			    xmlhttp=new XMLHttpRequest();
			  }
			  else
			  {
			    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			  xmlhttp.onreadystatechange=function()
			  {
			    if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    var n =xmlhttp.responseText;
			    if(n=="yes"){
			    	document.getElementById("txtHint").innerHTML="<font color='red'>抱歉，此用户名已经被使用!!!</font>";
			    	document.getElementById("btnShow").disabled=true;
			    }
			    else{
			    	document.getElementById("txtHint").innerHTML="<font color='green'>此用户名可以被使用</font>";
			    	document.getElementById("btnShow").disabled=false;
			    }
			    }
			  }
			  xmlhttp.open("GET","${ctx}/adduser/check?q="+str,true);
			  xmlhttp.send();
			}
		
	
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
		<script>
		//验证两次输入密码是否一致	
		function validate(){
			if( pwd1.value == pwd2.value){
				document.getElementById("erro").innerHTML="<font color='green'>密码输入一致</font>"
				document.getElementById("btnShow").disabled = false;
			}else{
				document.getElementById("erro").innerHTML="<font color='red'>密码输入不一致</font>"
				document.getElementById("btnShow").disabled = true;			
			}
		}
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
			<!--$(function(){
			$("#sub").click(
				function(){
					$.ajax({
						type:'POST',
						datatype:"text",
						url:"${ctx }/adduser/login",
						data:$('#formid').serialize(),
						success:function(data){							
		                   if(data=="qq"){
		                	   alert("1");	
		                	   //window.location.href='${ctx }/index2.jsp';		
		                   }
		                   else {
		                	   alert("密码错误");	
		                   }
						}
					})
				}		
			)
		})  -->
	</body>

</html>


