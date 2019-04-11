<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title></title>
    <link rel="stylesheet" href="../weui/lib/weui.min.css">
    <link rel="stylesheet" href="../weui/css/jquery-weui.css">
    <script src="../weui/lib/jquery-2.1.4.js"></script>
    <script src="../weui/lib/fastclick.js"></script>
    <script src="../weui/js/jquery-weui.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/shoujisc.css">
<script type="text/javascript" src="js/woxiangyao.js"></script>
</head>

<body id="wrap">

    <div class="sjsc-title2">
    	<h3 class="sjsc-t2l">确认付款</h3>
        <a href="javascript:window.location.href='orderList.html'" class="sjsc-t2r"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
    </div>
    <input type="hidden" value="${order.order_type}" id='order_type'>
    <input type="hidden" value="${order.order_id}" id='order_id'>
    <!-- 订单样式 -->
    <div class="my-dd">
    	<div class="my-info">
        	<div class="my-k1">
            	<ul class="my-p1">
                	<li class="my-spl f-l">订单号：${order.order_id}</li>
                	<li class="my-spr f-r">${order.add_time}</li>
                    <div style="clear:both;"></div>
                </ul>
                <dl class="my-dl1">
                	<dt><a href="#"><img src="${order.goods_img}" style="width:70px"></a></dt>
                    <dd>
                    	<h3><a href="#">${order.goods_name}</a></h3>
                        <p class="my-dp1">价格：<span>￥${order.goods_total}</span></p>
                        <div class="my-jdt">
                        	<p class="jdt-p1 f-l">数量：</p>
                           
                            <p class="jdt-shuzi f-l">${order.goods_num}</p>
                    		<div style="clear:both;"></div>
                        </div>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <c:if test="${!empty order.addr_name}">
                <div class="drdd-info2">
                    <p class="p1 f-l">地址：<span >${order.addr_name}</span></p>
                    <div style="clear:both;"></div>
                </div>
                </c:if>
                <c:if test="${!empty order.note}">
                <div class="drdd-info2">
                    <p class="p1 f-l">备注：<span >${order.note}</span></p>
                    <div style="clear:both;"></div>
                </div>
                </c:if>
                                <div class="my-p2">
                                    <span class="my-sp3 f-l">共${order.goods_num}件商品</span>
                                   <p class="my-sp3 f-r">总计：<span style="">￥${order.goods_total}</span></p>
                                    <div style="clear:both;"></div>
                                </div>
            </div>
        </div>
        <button class="drdd-btn" onclick="callpay()">微信支付</button>
    </div>
    	<script type="text/javascript">
            $(document).ready(function() {
                $.toast.prototype.defaults.duration = 500;
            });
  	    function callpay(){
		 WeixinJSBridge.invoke('getBrandWCPayRequest',{
			 "appId" : "<%=request.getAttribute("appId")%>","timeStamp" : "<%=request.getAttribute("timeStamp")%>", "nonceStr" : "<%=request.getAttribute("nonceStr")%>", "package" : "<%=request.getAttribute("package")%>","signType" : "MD5", "paySign" : "<%=request.getAttribute("paySign")%>" 
   			},function(res){
				WeixinJSBridge.log(res.err_msg);

// 				alert(res.err_code + res.err_desc + res.err_msg);
	            if(res.err_msg == "get_brand_wcpay_request:ok"){
                    $.toast("支付成功","text");
                    var order_type = $("#order_type").val();
//                    alert(order_type);
                    var order_id = $("#order_id").val();
//                    alert(order_id);
                    $.ajax({
                        url: 'updateOrderStatusAndGiftAndInventory.html',
                        type: 'post',
                        data: 'order_id=' + order_id,
                        success: function (rs) {
                            window.location.href='orderList.html';
                        }
                    });
	            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){
                    $.toast("用户取消支付","text");
	            }else{
                    $.toast("支付失败","text");
	            }  
			})
		}
  </script>
</body>
</html>
