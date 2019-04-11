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
    	<h3 class="sjsc-t2l">商品下单</h3>
        <a href="javascript:history.back();" class="sjsc-t2r"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
    </div>
    
    <ul class="gwc-ul1">
    <c:forEach items="${goods}" var="list" varStatus="s">
    <input type="hidden" value="${list.goods_num}" id='tnum1'>
    <input type="hidden" value="${list.goods_price}" id='tprice1'>
    	<li>
        	<div class="hwc-tu f-l"><a href="#"><img src="${list.goods_img}" style="width: 68px"></a></div>
            <div class="gwc-md f-l">
            	<h3><a href="#">${list.goods_name}</a></h3>
                <p class="gwc-p1">&nbsp;</p>
                <p class="gwc-p1">规格：<span>${list.goods_spe}</span></p>
                <p class="gwc-p1">商城价：<span>￥${list.goods_price}</span></p>
            </div>
            <c:if test="${list.goods_price!=0}">
            <a href="javascript:;" onclick="plus('${list.goods_id}','${list.goods_price}','${s.count}')" class="gwc-del f-r"><img src="images/11.png" style="width: 28px;height: 25px"></a>
            <a href="#" class="gwc-del f-r" id="goods_num" style="padding-top:4px;width: 16px">${list.goods_num}</a>
            <a href="javascript:;" onclick="min('${list.goods_id}','${list.goods_price}','${s.count}')" class="gwc-del f-r"><img src="images/22.png" style="width: 28px;height: 25px"></a>
            </c:if>
            <c:if test="${list.goods_price==0}">
            <a href="javascript:;" onclick="del('${list.goods_id}')" class="gwc-del f-r"><img src="images/sjsc-10.gif"></a>
            </c:if>
            <div style="clear:both;"></div>
        </li>
       </c:forEach> 
    </ul>
    
    <div class="gwc-ft">
    <c:forEach items="${goods}" var="list">
    	<p id="tnum">共1件商品，总计：<span>￥${list.goods_price }</span></p>
    </c:forEach>   
        <button onclick="buy()">提交</button>
       
        <div style="clear:both;"></div>
    </div>
    <script type="text/javascript">
    function plus(goods_id,goods_price,sort){
    	var goods_num1=$('#goods_num').text();
    	var goods_num = parseInt(goods_num1)+1;
    	$('#goods_num').text(goods_num);
    	var goods_total  = goods_num * goods_price;
  
    	var tnum1 = $('#tnum1').val();
 	 // 	var tprice1 = $('#tprice1').val();
    	var tnum = parseInt(tnum1)+1;
    //	var tprice = (parseFloat(tprice1)+parseFloat(goods_price)).toFixed(1);
		$('#tnum1').val(tnum);
    	$('#tprice1').val(goods_total);
    	$('#goods_num').text(goods_num);
    	$('#tnum').html("共"+tnum+"件商品，总计：<span>￥"+goods_total+"</span>");
    }
    function min(goods_id,goods_price,sort){
    	var goods_num1=$('#goods_num').text();
    	if(goods_num1==1||goods_num1<1){
    		window.history.go(-1);
    	}
    	var goods_num=parseInt(goods_num1)-1;
    	var goods_total  = goods_num*goods_price;
    	var tnum1 = $('#tnum1').val();
  //  	var tprice1 = $('#tprice1').val();
    	var tnum = parseInt(tnum1)-1;
  //  	var tprice = (parseFloat(tprice1)-parseFloat(goods_price)).toFixed(1);
    	$('#tnum1').val(tnum);
    	$('#tprice1').val(goods_total);
    	$('#goods_num').text(goods_num);

    	$('#tnum').html("共"+tnum+"件商品，总计：<span>￥"+goods_total+"</span>");

    }
   	function buy(){
   		var goods_num = $('#tnum1').val();
    	var goods_id = '${goods_id}';
    	window.location.href='goodsOrderSure.html?goods_id='+goods_id+'&goods_num='+goods_num;
   	}
    </script>
</body>
</html>
