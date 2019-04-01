<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
        <script type="text/javascript" src="js/jquery.js"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/liebiaoye.css" />
        <link rel="stylesheet" type="text/css" href="css/shoujisc.css" />
        <script type="text/javascript" src="js/jquery.js"></script><link rel="stylesheet" type="text/css" href="css/showTip.css">
<script type="text/javascript" src="js/showTip.js"></script>
        <style type="text/css">
          
    html,body
{ 
width:100%; 
height:94%; 

} </style>

<script type="text/javascript">
    window.onload=function(){
        document.body.addEventListener('touchmove',function(e){
            e.stopPropagation();
            e.preventDefault();
        });
    }

</script>
    </head>
 
    <body id="wrap">
    <div class="title" style="border-bottom:1px solid rgba(204, 204, 204, 0.15);text-align:center;">
   		<span>分类</span>
        <div class="title-left"><a href="index.html"><img src="images/back.png" alt="" /></a></div>
        <div class="title-right"><a href="secList.html"><img src="images/sjsc-13.png" alt="" /></a></div>
    </div>

    <div class="con" style="width:100%;height: 100%;overflow:hidden" >
        <ul class="con-left" id="con-left" style="overflow-y:scroll">
        	<c:forEach items="${ctgList }" var="ctgList">
            <li class="con-left-txt" ><a href="category.html?ctg_id=${ctgList.ctg_id}">
            <c:if test="${ctgList.ctg_id==ctg_id}">
                <p class="food2">
               ${ctgList.ctg_name }
                </p>
                </c:if>
                <c:if test="${ctgList.ctg_id!=ctg_id}">
                  <p class="food">
               ${ctgList.ctg_name }
                </p>
                </c:if>
                </a>
               </li>
               
               
                </c:forEach>
              </ul> 
                <ul class="con-right" style="/* margin-bottom: 49px; */overflow-y:scroll">
                	<c:forEach items="${goodsList }" var="goodsList">
                    <li class="con-right-con">
                        <div class="right-con-img">
                        <a href="goodsListById.html?goods_id=${goodsList.goods_id}">
                        <img src="${goodsList.goods_img}" /></a></div>
                        <div class="right-con-p">
                      
                            <p class="p1 p-txt" onclick="window.location.href='goodsListById.html?goods_id=${goodsList.goods_id}'"><a>${goodsList.goods_name}</a></p>
                            <p class="p2 p-txt" onclick="window.location.href='goodsListById.html?goods_id=${goodsList.goods_id}'"><span class="price-1">${goodsList.goods_spe}</span></p>
                            <p class="p3 p-txt" style="float: left;" onclick="window.location.href='goodsListById.html?goods_id=${goodsList.goods_id}'"><span class="price-1" style="font-size: 18px">&yen;${goodsList.goods_price}</span></p>
                          <p style="float: right;margin-top: 10px"> <a href="javascript:;" onclick="add('${goodsList.goods_id}','${goodsList.goods_name}','${goodsList.goods_img}','${goodsList.goods_spe}','${goodsList.goods_price}')"><img src="images/sjsc-09.gif" style="width: 25px;height: 25px"></a>
                  			 </p>
                        </div>    
                    </li>
                    
                    </c:forEach>
                    <br><br>
                </ul>
       
    </div>
    <jsp:include page="footer2.jsp"></jsp:include>
    <!-- <script type="text/javascript">
    	function stCtg(){
    		var title ='....';
    		var query='baidu';
    		history.pushState({ title: title }, title, location.href.split("?")[0] + "?" + query);
    	}
    </script> -->
    <script type="text/javascript">
	function add(goods_id,goods_name,goods_img,goods_spe,goods_price){
		
		$.ajax({
			url:'cartInsert.html',
			type:'post',
			data:'goods_id='+goods_id+'&goods_name='+goods_name+'&goods_img='+goods_img+'&goods_price='+goods_price+'&goods_num=1'+'&goods_spe='+goods_spe,
			success:function(rs){
				var data = eval('('+rs+')');
				if(data.rs_code==1){
					$('#cart_num').text(data.cart_num);
					showTip("已加入购物车！");
//					location.reload();
				}else if(data.rs_code==1005){
					showTip("登录已失效，重新登录中，请稍后...");
					setTimeout('window.location.href=history.go(-1)',2000);
				}else{
					showTip("加入购物车失败！");
				}
			}
		})
	}
	
	</script>
    </body>
</html>