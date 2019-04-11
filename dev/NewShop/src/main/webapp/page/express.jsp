<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
		<title></title>
		<style>
			body{font-size: 12px;margin: 0 5px 0 0}
			ul li{list-style: none;}
			.track-rcol{width: 100%;}
			.track-list{/* margin: 20px; padding-left: 5px;  */position: relative;}
			.track-list li{position: relative; padding: 0 0 0 9px; line-height: 18px; border-left: 1px solid #d9d9d9; color: #999;}
			.track-list li.first{color: red; padding-top: 0; border-left-color: #fff;}
			.track-list li .node-icon{position: absolute; left: -6px; top: 50%; width: 11px; height: 11px; background: url(images/order-icons.png)  -21px -72px no-repeat;}
			.track-list li.first .node-icon{background-position:0 -72px;}
			.track-list li .time{margin-right: 20px; position: relative; top: 4px; display: inline-block; vertical-align: middle;}
			.track-list li .txt{max-width: 600px; position: relative; top: 4px; display: inline-block; vertical-align: middle;}
			.track-list li.first .time{margin-right: 20px; }
			.track-list li.first .txt{max-width: 600px; }
		</style>
		<script type="text/javascript" src="js/jquery.js"></script>
	</head>
	<body>
	 <div class="sjsc-title2" style="border-bottom: 1px solid #ff3c00;padding-bottom: 5px">
        <a href="javascript:;" onclick="history.back()" class="sjsc-t2r"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
    </div>
		<div class="track-rcol">
		
			<div class="track-list">
			<c:forEach items="${order}" var="order">
			<input type="hidden" value="${order.express_name }" id="express_name">
			<input type="hidden" value="${order.express_dm }" id="express_dm">
			<input type="hidden" value="${order.express_hm }" id="express_hm"> 
			<p style="margin-left: 20px">
			产品名称：${order.goods_name }<br>
			订单号码：${order.order_id }<br>
			订单日期：${order.add_time }</p>
			</c:forEach>
			<p style="margin-left: 20px">物流信息</p>
				<ul id="show" style="margin-left: -20px">
					
					
				</ul>
			</div>
		</div>
		
		
	</body>
	<script type="text/javascript">
	
	var express_dm  =$('#express_dm').val();
	var express_hm  = $('#express_hm').val();
	var express_name  =$('#express_name').val();
	$.ajax({
		url:'../main/exp_show.html',
		type:'post',
		data:'express_dm='+express_dm+'&express_hm='+express_hm,
		success:function(rs){
			var data = eval('('+rs+')');
			
			if(data.Success){
				if(typeof(data.Reason) == "undefined"){
					$('#show').append('<li><i class="node-icon"></i><span class="time">'+express_name+':'+express_hm+' </span></li>');
					$.each(data.Traces, function() {
						$('#show').append('<li><i class="node-icon"></i><span class="time">'+this.AcceptTime+'</span><span class="txt">'+this.AcceptStation+'</span></li>');
						
					});
				}else{
					$('#show').append('<li><i class="node-icon"></i><span class="time">'+data.Reason+'</span>');
				}
				
			}else{
				$('#show').append('<li><i class="node-icon"></i><span class="time">查询失败</span>');
			}
		}
	})
	</script>
</html>
