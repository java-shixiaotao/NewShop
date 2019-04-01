<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/shoujisc.css">
<script type="text/javascript" src="js/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="css/showTip.css">
<script type="text/javascript" src="js/showTip.js"></script>
</head>

<body id="wrap">
	
    <div class="sjsc-title2">
    	<h3 class="sjsc-t2l">购物车</h3>
        <a href="javascript:history.back();" class="sjsc-t2r"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
    </div>
    
    <ul class="gwc-ul1">
    <c:forEach items="${goods}" var="list" varStatus="s">
    	<li>
        	<div class="hwc-tu f-l"><a href="#"><img src="${list.goods_img}" style="width: 68px"></a></div>
            <div class="gwc-md f-l">
            	<h3><a href="#">${list.goods_name}</a></h3>
                
                <p class="gwc-p1" style="line-height: 30px;margin-top:-9px"><span style="font-size: 9px;">${list.goods_spe}200g份</span></p>
                <p class="gwc-p1"><span style="color: #f60">￥${list.goods_price}</span></p>
            </div>
            <%-- <c:if test="${list.goods_price!=0}"> --%>
            <a href="javascript:;" onclick="plus('${list.goods_id}','${list.goods_price}','${s.count}')" class="gwc-del f-r"><img src="images/11.png" style="width: 25px;height: 25px"></a>
            <a href="#" class="gwc-del f-r" id="goods_num${s.count}" style="padding-top:4px;width: 16px"> ${list.goods_num}</a>
            <a href="javascript:;" onclick="min('${list.goods_id}','${list.goods_price}','${s.count}')" class="gwc-del f-r"><img src="images/22.png" style="width: 25px;height: 25px"></a>
            <%-- </c:if>
            <c:if test="${list.goods_price==0}">
            <a href="javascript:;" onclick="del('${list.goods_id}')" class="gwc-del f-r"><img src="images/sjsc-10.gif"></a>
            </c:if> --%>
            <div style="clear:both;"></div>
        </li>
       </c:forEach> 
    </ul>
    <input type="hidden" value="${tnum}" id='tnum1'>
    <input type="hidden" value="${tprice}" id='tprice1'>
    <div class="gwc-ft">
    	<p id="tnum">共${tnum}件商品，总计：<span style="color: #f60">￥${tprice }</span></p>
    	<c:if test="${tnum==0}">
        <button onclick="showTip('请添加商品到购物车！')">结算</button>
        </c:if>
        <c:if test="${tnum!=0}">
        <button onclick="check()">结算</button>
        </c:if>
        <div style="clear:both;"></div>
    </div>
    <jsp:include page="footer3.jsp"></jsp:include>
    <script type="text/javascript">
    function check() {
        <%--var cart_num="<%=request.getSession().getAttribute("cart_num")%>";--%>
        <%--alert(cart_num);--%>
        <%--if(cart_num>0){--%>
            <%--window.location.href='cartOrderList.html'--%>
        <%--}else{--%>
            <%--showTip("请添加商品");--%>
            <%--window.location.href='cartList.html.html'--%>
        <%--}--%>
        $.ajax({
            url:'getCartNum.html',
    		type:'post',
            success:function (rs) {
                if(rs.cart_num>0){
                    window.location.href='cartOrderList.html'
                }else{
                    alert("您的订单已生成，购物车为空，请重新添加商品")
                    window.location.href='cartList.html'
                }
            }
        });
    }
    function plus(goods_id,goods_price,sort){
    	var goods_num1=$('#goods_num'+sort).text();
    	var goods_num=parseInt(goods_num1)+1;
    	var goods_total  = goods_num*goods_price;
    	var tnum1 = $('#tnum1').val();
    	var tprice1 = $('#tprice1').val();
    	var tnum = parseInt(tnum1)+1;
    	cart_num = parseInt(cart_num)+1;
    	var tprice = (parseFloat(tprice1)+parseFloat(goods_price)).toFixed(1);
    	$.ajax({
    		url:'cartUpdate.html',
    		type:'post',
    		data:'goods_id='+goods_id+'&goods_price='+goods_price+'&goods_num='+goods_num+'&s=1',
    		success:function(rs){
    				var data = eval('('+rs+')');
    				if(data.rs_code==1){
    				$('#cart_num').text(data.cart_num);
    				
    				$('#tnum1').val(tnum);
    		    	$('#tprice1').val(tprice);
    		    	$('#goods_num'+sort).text(goods_num);
    		    	$('#tnum').html("共"+tnum+"件商品，总计：<span style='color: #f60'>￥"+tprice+"</span>");
    			}else if(data.rs_code==1005){
					showTip("登录已失效，重新登录中，请稍后...");
					setTimeout('window.location.href=history.go(-1)',2000);
				}
    		}
    	})
    }
    function min(goods_id,goods_price,sort){
    	var goods_num1=$('#goods_num'+sort).text();
    	if(goods_num1==1||goods_num1<1){
//    		var sign=0;
 //           new $.flavr(
//				{
//					content : '确定删除此商品吗?',
//					dialog : 'confirm',
//					onConfirm : function() {
//						sign=1;
//						alert(sign);
//					},
//					onCancel : function() {
						
//					}
//			});
    		var  b = confirm('确定删除此商品吗？');
    		if(!b){
    		return ;
    		}
    	}
    	var goods_num=parseInt(goods_num1)-1;
    	var goods_total  = goods_num*goods_price;
    	var tnum1 = $('#tnum1').val();
    	var tprice1 = $('#tprice1').val();
    	var tnum = parseInt(tnum1)-1;
    	var tprice = (parseFloat(tprice1)-parseFloat(goods_price)).toFixed(1);
    	$('#tnum1').val(tnum);
    	$('#tprice1').val(tprice);
    	$('#goods_num'+sort).text(goods_num);
    	$('#tnum').html("共"+tnum+"件商品，总计：<span>￥"+tprice+"</span>");
    	cart_num = parseInt(cart_num)-1;
    	$.ajax({
    		url:'cartUpdate.html',
    		type:'post',
    		data:'goods_id='+goods_id+'&goods_price='+goods_price+'&goods_num='+goods_num+'&cart_num='+cart_num+'&s=0',
    		success:function(rs){
    			var data = eval('('+rs+')');
				if(data.rs_code==1){
				$('#cart_num').text(data.cart_num);
    				if(goods_num<1){
    					location.reload();
    				}
    				$('#tnum1').val(tnum);
    		    	$('#tprice1').val(tprice);
    		    	$('#goods_num'+sort).text(goods_num);
    		    	$('#tnum').html("共"+tnum+"件商品，总计：<span>￥"+tprice+"</span>");
    			}else if(data.rs_code==1005){
					showTip("登录已失效，重新登录中，请稍后...");
					setTimeout('window.location.href=history.go(-1)',2000);
				}
    		}
    	})
    }
    
    function del(goods_id){
    	cart_num = parseInt(cart_num)-1;
    	$.ajax({
    		url:'cartDel.html',
    		type:'post',
    		data:'goods_id='+goods_id,
    		success:function(rs){
    			var data = eval('('+rs+')');
				if(data.rs_code==1){
				$('#cart_num').text(data.cart_num);
    				location.reload();
    			}
				else if(data.rs_code==1005){
					showTip("登录已失效，重新登录中，请稍后...");
					setTimeout('window.location.href=history.go(-1)',2000);
				}else{
    				showTip('系统故障');
    			}
    		}
    	})
    }
    </script>
</body>
</html>
