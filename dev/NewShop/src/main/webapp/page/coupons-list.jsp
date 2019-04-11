<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/shoujisc.css">
<script type="text/javascript" src="js/jquery.js"></script>

</head>

<body>
	
    <div class="sjsc-title2">
    	<h3 class="sjsc-t2l">我的优惠券</h3>
        <a href="javascript:history.back();" class="sjsc-t2r"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
        
    </div>
    
    <ul class="gwc-ul1" >
    <c:forEach items="${list}" var="list" varStatus="s">
    	<li>
        	
            <div class="gwc-md f-l">
            	<h3><a href="#">${list.cps_name}</a></h3>
                <p class="gwc-p1">&nbsp;</p>
                <p class="gwc-p1">券金额：<span>￥${list.cps_price}</span></p>
                <p class="gwc-p1">有效期：<span>${list.cps_time}</span></p>
            </div>
            <div style="clear:both;"></div>
        </li>
       </c:forEach> 
    </ul>
     <button class="drdd-btn" onclick="window.location.href='cpsAll.html'">兑换优惠券</button>
</body>
</html>
