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
<link rel="stylesheet" type="text/css" href="css/showTip.css">
<script type="text/javascript" src="js/showTip.js"></script>
</head>

<body id="wrap">
	
    <div class="sjsc-title2">
    	<h3 class="sjsc-t2l">可领优惠券</h3>
        <a href="javascript:history.back();" class="sjsc-t2r"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
        
    </div>
    
    <ul class="gwc-ul1" >
    <c:forEach items="${list}" var="list" varStatus="s">
    	<li onclick="add('${list.cps_id }')">
            <div class="gwc-md f-l">
            	<h3><a href="javascript:;">${list.cps_name}</a></h3>
                <p class="gwc-p1">&nbsp;</p>
                <p class="gwc-p1">券金额：<span>￥${list.cps_price}</span></p>
                <p class="gwc-p1">有效期：<span>${list.cps_time}</span></p>
            </div>
            <div style="clear:both;"></div>
        </li>
       </c:forEach> 
    </ul>
    <script type="text/javascript">
	function add(cps_id){
		$.ajax({
			url:'cpsInsert.html',
			type:'post',
			data:'cps_id='+cps_id,
			success:function(rs){
				if(rs==1){
					showTip("兑换成功！");
					
				//	window.history.pushState({}, '', "www.baidu.com");
					setTimeout('window.location.href=document.referrer',2000);
				}
				else if(rs==-1){
					showTip('您已经兑换过此次优惠券啦！');
				}
				else if(rs==-5){
					showTip('兑换已过期！');
				}
				else{
					showTip("失败！");
				}
			}
		})
	}
	</script>
</body>
</html>
