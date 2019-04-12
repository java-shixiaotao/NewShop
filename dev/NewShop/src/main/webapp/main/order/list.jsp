<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,member-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->

<link rel="stylesheet" href="css/person.css">
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script> 
<title>意见反馈</title>
</head>
<body style="/* width: 1720px */">
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		查看 <a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<br>
	<div class="text-c">
				<input type="text" value="${start_time}" 
					id="start_time"  class="input-text" onfocus="WdatePicker()"
					style="width:15%;" placeholder="请选择开始时间"> 
			<input type="text" value="${end_time}"  onfocus="WdatePicker()"
					id="end_time"  class="input-text"
					style="width: 15%;" placeholder="请选择结束时间"> 		
			<input type="text" value="${ctg_name}"
					id="ctg_name"  class="input-text"
					style="width: 15%;display: none" placeholder="请输入分类名称">
			<input type="text" value="${goods_name}" 
					id="goods_name"  class="input-text"
					style="width: 15%;" placeholder="请输入商品名称">
			<input type="text" value="${addr_name}" 
					id="addr_name"  class="input-text"
					style="width: 15%;" placeholder="请输入收货人姓名">	
			<button type="button" onclick="search()"
				class="btn btn-success radius" id="b1" name="">
				<i class="Hui-iconfont">&#xe665;</i> 查询
			</button>
				
			
			<script type="text/javascript">
				function search() {
					var status = '${status}';
					var start_time =$('#start_time').val();
					var end_time =$('#end_time').val();
					var ctg_name =$('#ctg_name').val();
					var goods_name =$('#goods_name').val();
					var addr_name =$('#addr_name').val();
					window.location.href = 'orderList?start_time=' + encodeURIComponent(encodeURIComponent(start_time))
					+ '&end_time=' + encodeURIComponent(encodeURIComponent(end_time))+ '&ctg_name=' + encodeURIComponent(encodeURIComponent(ctg_name))
					+ '&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name))+ '&addr_name=' + encodeURIComponent(encodeURIComponent(addr_name))
					+ '&status=' + status;
				}
			</script>
		</div>
	<div class="pd-20">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="orderList"
				class="btn btn-primary radius"> <i class="Hui-iconfont"></i>
					全部
			</a>
			<a href="orderList?status=1"
				class="btn btn-primary radius"> <i class="Hui-iconfont"></i>
					待发货
			</a>
			<a href="orderList?status=2"
				class="btn btn-primary radius"> <i class="Hui-iconfont"></i>
					已发货
			</a>
			<a href="orderList?status=-5"
				class="btn btn-primary radius"> <i class="Hui-iconfont"></i>
					待退款
			</a>
			<a href="orderList?status=-6"
				class="btn btn-primary radius"> <i class="Hui-iconfont"></i>
					已关闭
			</a>
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="5%">订单号</th>
						<th width="20%">商品</th>
						<th width="10%">商品类型</th>
						<%--<th width="10%">优惠券</th>--%>
						<th width="6%">支付金额</th>
						<!-- <th width="8%">微信昵称</th> -->
						<th width="15%">收货地址</th>
						<th width="10%">备注</th>
						<th width="5%">状态</th>
						<th width="8%">订单日期</th>
						<th width="6%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${map['list']}" var="list" varStatus="s">
					<c:set value="ord${s.index}" var="ord"></c:set>
						<tr>
							<td>${list.order_id}</td>
							<td align="left"><c:forEach items="${map[ord]}" var="ordList">
							<img alt="" src="${ordList.goods_img}" width="50" height="50">${ordList.goods_name}
							￥${ordList.goods_price} *${ordList.goods_num}<br>
							</c:forEach>
							</td>
							<td class="text-c">
								<c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4||list.order_type==7||list.order_type==8  }"><font color="#1e90ff">实物</font></c:if>
								<c:if test="${list.order_type==1 || list.order_type==3 ||list.order_type==5||list.order_type==6||list.order_type==9  }">电子券</c:if>
							</td>
							<%--<td class="text-c">--%>
							<%--<c:if test="${list.cps_id ne null}">--%>
							<%--${list.cps_name}|${list.cps_price}</c:if></td>--%>
							<td class="text-c"<%--  id="tprice${s.index}" --%>>
							<input type="text"  <c:if test="${list.status==0 }">onblur="tp('${list.order_id}','total${s.index}')" </c:if><c:if test="${list.status!=0 }"> readonly="readonly" </c:if> id="total${s.index}" class="input-text" value="${list.goods_total}" style="border: 0px solid #fff">
							
							
							</td>
							<%-- <td class="text-c">${list.realname}${list.cps_id}</td> --%>
							<td>${list.addr_name}</td>
							<td>${list.note}</td>
							<td class="text-c"><c:if test="${list.status==0 }">待支付</c:if>
							<c:if test="${list.status==1 }"><font color="#1e90ff"> 待发货</font></c:if>
							<c:if test="${list.status==2 }">已发货</c:if>
							<%--<c:if test="${list.status==-5}"><font color="red">待退款</font></c:if>--%>
							<%--<c:if test="${list.status==-6}">已关闭</c:if>--%>
							
							</td>
							<td class="text-c">${list.add_time}</td>
							<%-- <td class="text-c">
							<c:if test="${list.status==1 }"><a href="javascript:;" onclick="send('${list.order_id}')">发货</a><br></c:if>
							<c:if test="${list.status!=1 }"><a href="javascript:;" onclick="alert('未支付或已发货！')">发货</a><br></c:if>

							<c:if test="${list.status==-5 }"><a href="javascript:;" onclick="refund('${list.order_id}')">退款</a><br></c:if>

							<a href="javascript:;" onclick="del('${list.order_id}')">删除</a>
							</td>					 --%>
							
							<td class="text-c">
							<c:if test="${list.status==1||list.status==2 }">
							<a href="exp_choose?order_id=${list.order_id}" >发货</a><br>
							</c:if>
							<c:if test="${list.status!=1 &&list.status!=2 }">
							<a href="javascript:;" onclick="alert('未支付或已发货！')">发货</a>
							</c:if>
							
							<%-- <c:if test="${list.status==1 }"><a href="exp_choose?order_id=${list.order_id}" >发货</a><br></c:if>
							<c:if test="${list.status!=1 }"><a href="javascript:;" onclick="alert('未支付或已发货！')">发货</a><br></c:if> --%>
							
							<c:if test="${list.status==-5 }"><a href="javascript:;" onclick="refund('${list.order_id}')">退款</a><br></c:if>
							
							<a href="javascript:;" onclick="del('${list.order_id}')">删除</a>
							</td>		
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<!--<div class="panel-foot text-center">
				<ul class="pagination">
					<li><a href="javascript:;">共${total}条</a></li>
				</ul>
				<ul class="pagination">
					<li><a href="javascript:;">当前第${currentPage}页</a></li>
				</ul>

				<ul class="pagination">
					<li><a href="javascript:;" onclick="fpage()">首页</a></li>
				</ul>
				<ul class="pagination">
					<li><a href="javascript:;" onclick="upPage()">上一页</a></li>
				</ul>

				<ul class="pagination">
					<li><a href="javascript:;" onclick="downPage()">下一页</a></li>
				</ul>
				<ul class="pagination">
					<li><a href="javascript:;" onclick="epage()">末页</a></li>
				</ul>
				<ul class="pagination" style="width:4%;">
					<li><input type="tel" class="input-text" id="seastr" > </li>
				</ul>
				<ul class="pagination">
					<li> <a href="javascript:;" onclick="spage()">go</a></li>
				</ul>
				
			</div> -->
		</div>
	</div>
	<script type="text/javascript">
	
	function tp(order_id,index){
		var total = $('#'+index).val();
		$.ajax({
			url:'orderprice',
			type:'post',
			data:'order_id='+order_id+'&goods_total='+total,
			success:function(rs){
				if(rs==1){
					alert("成功！");
					location.reload();
				}else{
					alert("失败！");
				}
			}
		})
	}
	</script>
	<script type="text/javascript">
	function del(order_id){
		var  b = confirm('确定删除？');
		if(!b){
		return ;
		}
		$.ajax({
			url:'orderDel',
			type:'post',
			data:'order_id='+order_id,
			success:function(rs){
				if(rs==1){
					alert("成功！");
					location.reload();
				}else{
					alert("失败！");
				}
			}
		})
	}
	function refund(order_id){
		var  b = confirm('确定退款吗？');
		if(!b){
		return ;
		}
		$.ajax({
			url:'orderUpstatus',
			type:'post',
			data:'order_id='+order_id+'&status=-6',
			success:function(rs){
				if(rs==1){
					alert("提交成功，请及时到微信商户平台给客户退款！");
                    window.location.reload();
				}else{
					alert("失败，请联系技术人员！");
				}
			}
		})
	}
	function send(order_id){
		
		$.ajax({
			url:'orderUpstatus',
			type:'post',
			data:'order_id='+order_id+'&status=2',
			success:function(rs){
				if(rs==1){
					alert("成功！");
					window.location.reload();
				}else{
					alert("失败！");
				}
			}
		})
	}
	var start_time = '${start_time}';
	var end_time = '${end_time}';
	var ctg_name = '';
	var goods_name = '${goods_name}';
	var addr_name = '${addr_name}';
	var currentPage = '${currentPage}';
	var totalPage = '${totalPage}';
	var status = '${status}';
	function upPage() {
		if (currentPage > 1) {
			window.location.href = 'orderList?currentPage='
					+ (parseInt(currentPage) - 1)+'&status='+status+'&start_time=' + encodeURIComponent(encodeURIComponent(start_time))
						+ '&end_time=' + encodeURIComponent(encodeURIComponent(end_time))+ '&ctg_name=' + encodeURIComponent(encodeURIComponent(ctg_name))
						+ '&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name))+ '&addr_name=' + encodeURIComponent(encodeURIComponent(addr_name));
			return;
		}
	}
	function downPage() {
		if (parseInt(currentPage) < parseInt(totalPage)) {
			window.location.href = 'orderList?currentPage='
					+ (parseInt(currentPage) + 1)+'&status='+status+'&start_time=' + encodeURIComponent(encodeURIComponent(start_time))
					+ '&end_time=' + encodeURIComponent(encodeURIComponent(end_time))+ '&ctg_name=' + encodeURIComponent(encodeURIComponent(ctg_name))
					+ '&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name))+ '&addr_name=' + encodeURIComponent(encodeURIComponent(addr_name));;
			return;
		}
	}
	function fpage() {
		window.location.href = 'orderList?currentPage=1'+'&status='+status+'&start_time=' + encodeURIComponent(encodeURIComponent(start_time))
		+ '&end_time=' + encodeURIComponent(encodeURIComponent(end_time))+ '&ctg_name=' + encodeURIComponent(encodeURIComponent(ctg_name))
		+ '&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name))+ '&addr_name=' + encodeURIComponent(encodeURIComponent(addr_name));
		return;
	}
	function epage() {
		window.location.href = 'orderList?currentPage=' + totalPage+'&status='+status+'&start_time=' + encodeURIComponent(encodeURIComponent(start_time))
		+ '&end_time=' + encodeURIComponent(encodeURIComponent(end_time))+ '&ctg_name=' + encodeURIComponent(encodeURIComponent(ctg_name))
		+ '&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name))+ '&addr_name=' + encodeURIComponent(encodeURIComponent(addr_name));
		return;
	}
	function spage() {
		var seastr =$('#seastr').val();
		if (parseInt(seastr)< parseInt(totalPage)||parseInt(seastr)== parseInt(totalPage)) {
		window.location.href = 'orderList?currentPage=' + seastr+'&status='+status+'&start_time=' + encodeURIComponent(encodeURIComponent(start_time))
		+ '&end_time=' + encodeURIComponent(encodeURIComponent(end_time))+ '&ctg_name=' + encodeURIComponent(encodeURIComponent(ctg_name))
		+ '&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name))+ '&addr_name=' + encodeURIComponent(encodeURIComponent(addr_name));
		}
		return;
	}
	</script>

	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script>
	<script type="text/javascript" src="lib/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.table-sort').dataTable({
				"aaSorting" : [ [ ] ],//默认第几个排序
				"bStateSave" : true,//状态保存
				"aoColumnDefs" : [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				{
					"orderable" : false,
					"aTargets" : [ 0, 1, 2, 3, 4, 5, 6, 7 ]
				} // 制定列不参与排序
				]
			});
			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});
	</script>
</body>
</html>