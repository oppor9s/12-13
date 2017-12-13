<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<title>jQuery实现购物车多物品数量的加减+总价计算</title> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script> 
<script> 
$(function(){ 
$(".add").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())+1) 
setTotal(); 
}) 
$(".min").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())-1) 
if(parseInt(t.val())<0){ 
t.val(0); 
} 
setTotal(); 
}) 
function setTotal(){ 
var ss=0; 
$("#tab").each(function(){ 
ss=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text()); 
});
$("#total").html(parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text()).toFixed(2)); 
 
} 
setTotal(); 

}) 
</script> 
</head> 
<body> 
<table id="tab">

 
<c:forEach begin="1" end="4">
<tr> 
<td> 
<script> function setTotal(); </script>
<span>单价:</span><span class="price">1.50</span> 
<input class="min" name="" type="button" value="-" /> 
<input class="text_box" name="" type="text" value="1" /> 
<input class="add" name="" type="button" value="+" /> 
<p>总价：<label id="total"></label></p> 
</td> 
</tr> 
</c:forEach>


<tr> 
<td> 
<span>单价:</span><span class="price">3.95</span> 
<input class="min" name="" type="button" value="-" /> 
<input class="text_box" name="" type="text" value="1" /> 
<input class="add" name="" type="button" value="+" /> 
</td> 
</tr> 
</table> 

<p>总价：<label id="total"></label></p> 
</body> 
</html> y>
</html>