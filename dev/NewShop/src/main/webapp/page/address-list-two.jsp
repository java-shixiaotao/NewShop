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
    	<h3 class="sjsc-t2l">收货地址</h3>
        <a href="goodsOrderSure.html?addr_id=${addr_id}&cps_id=${cps_id}&goods_id=${goods_id }&goods_num=${goods_num}" class="sjsc-t2r"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
    </div>
    <c:forEach items="${list }" var="list" varStatus="s">
    <dl class="drdd-info7">
    <a href="goodsOrderSure.html?addr_id=${list.addr_id}&cps_id=${cps_id}&goods_id=${goods_id }&goods_num=${goods_num}">
    	<dt>
        	<p>
            	<span class="f-l">${list.addr_user }</span>
            	<span class="f-r">${list.addr_tel }</span>
                <div style="clear:both;"></div>
            </p>
        	<p><c:if test="${s.count==1}">
            	<a href="JavaScript:;" class="a1">[默认]</a></c:if>${list.addr_name}
            </p>
        </dt>
        </a>
        <dd><a href="#">></a></dd>
        <div style="clear:both;"></div>
    </dl>
    </c:forEach>
    
    <button class="drdd-btn" onclick="window.location.href='addrAddjsp.html'">新增收货地址</button>
    
</body>
</html>
