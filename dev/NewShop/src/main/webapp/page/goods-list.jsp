<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/shoujisc.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/woxiangyao.js"></script>
<link rel="stylesheet" type="text/css" href="css/showTip.css">
<script type="text/javascript" src="js/showTip.js"></script>
</head>

<body id='wrap'>
	
    <div class="quanbu-top">
    	<a href="javascript:history.go(-1)" class="qb-tleft f-l"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
        <div class="qb-tright f-r">
        	<a href="secList.html"><img src="images/sjsc-13.png"></a>
        
        </div>
        <div style="clear:both;"></div>
    </div>
   
    <div class="ssjg">
    	
        <ul class="ssjg-ul1">
        <c:forEach items="${goods}" var="goodsList">
        	<li>
            	<div class="ssjg-tu">
                	<a href="goodsListById.html?goods_id=${goodsList.goods_id}"><img src="${goodsList.goods_img}"></a>
                </div>
                <h3><a href="goodsListById.html?goods_id=${goodsList.goods_id}">${goodsList.goods_name}</a></h3>
                 <p class="ssjg-p2" style="font-size: 9px;padding-left: 5px"><span>${goodsList.goods_spe}</span></p>
                <dl class="ssjg-dl1">
                	<dt>
                    	<p class="ssjg-p1" style="margin-top:10px;"><span>${goodsList.goods_price}</span></p>
                    </dt>
                    <dd><a href="javascript:;" onclick="add('${goodsList.goods_id}','${goodsList.goods_name}','${goodsList.goods_img}','${goodsList.goods_spe}','${goodsList.goods_price}')"><img src="images/sjsc-09.gif" style="width: 25px;height: 25px"></a></dd>
                    <div style="clear:both;"></div>
                </dl>
            </li>
            </c:forEach>
        	
            <div style="clear:both;"></div>
        </ul><br><br>
    </div>
     <jsp:include page="footer1.jsp"></jsp:include>
    
    <script type="text/javascript">
	function add(goods_id,goods_name,goods_img,goods_spe,goods_price){
		$.ajax({
			url:'cartInsert.html',
			type:'post',
			data:'goods_id='+goods_id+'&goods_name='+encodeURI(goods_name)+'&goods_img='+goods_img+'&goods_price='+goods_price+'&goods_num=1'+'&goods_spe='+encodeURI(goods_spe),
			success:function(rs){
				var data = eval('('+rs+')');
				if(data.rs_code==1){
				$('#cart_num').text(data.cart_num);
					showTip("已加入购物车！");
//					location.reload();
				}
				else if(data.rs_code==1005){
					showTip("登录已失效，重新登录中，请稍后...");
					setTimeout('window.location.href=history.go(-1)',2000);
				}
				else{
					showTip("加入购物车失败！");
				}
			}
		})
	}
	
	</script>
</body>
</html>
