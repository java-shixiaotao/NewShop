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
<title>意见反馈</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		用户兑换券查看 <a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<br>
	<div class="text-c">
				
			<input type="text"
					id="template_name"  class="input-text"
					style="width: 55%;" placeholder="请输入名称">
		
			<button type="button" onclick="search()"
				class="btn btn-success radius" id="b1" name="">
				<i class="Hui-iconfont">&#xe665;</i> 查询
			</button>
				
			
			<script type="text/javascript">
				function search() {
					var template_name =$('#template_name').val();
					window.location.href = 'templategiftList.html?templateName=' + encodeURIComponent(encodeURIComponent(template_name));
				}
			</script>
		</div>
	<div class="pd-20">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="templategiftAdd.html"
				class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;</i>
					添加兑换券
			</a></span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25px"><input type="checkbox" name="" value=""></th>
						<th width="10%">ID</th>
						<th width="20%">模板名称</th>
						<th width="25%">打印数量</th>
						<th width="25%">创建日期</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${templategs}" var="list" varStatus="s">
						<tr class="text-c">
							<td><input type="checkbox" value="1" name=""></td>
							<td>${s.count}</td>
							<td>${list.templateName}</td>
							<td>${list.num}</td>
							<td>${list.createTime}</td>
							<td>
								<a href="templategiftdetailListById.html?tgID=${list.tgID}">详情</a>&nbsp;&nbsp;

							    <a href="templategiftdetaildownload.html?tgID=${list.tgID}">下载</a>&nbsp;&nbsp;
							</td>					
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
	<script type="text/javascript">

    function download(tgID){
            $.ajax({
                url: 'templategiftdetaildownload.html',
                type: 'post',
				data:'tgID=' + tgID,
                success: function (rs) {
                }
            })
	}

	function del(template_id){
		var  b = confirm('确定删除？');
		if(!b){
		return ;
		}
		$.ajax({
			url:'templateUpstatus.html',
			type:'post',
			data:'template_id='+template_id,
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
	function is_recommend(goods_id,is_recommend){
		var  b;
		if(is_recommend==1){
		  b = confirm('设为本周推荐？');	
		}else{
		 b = confirm('取消本周推荐？');	
		}
		
		if(!b){
		return ;
		}
		$.ajax({
			url:'goodsUpisrec.html',
			type:'post',
			data:'goods_id='+goods_id+'&is_recommend='+is_recommend,
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
	var goods_name = '${goods_name}';
	var currentPage = '${currentPage}';
	var totalPage = '${totalPage}';
	function upPage() {
		if (currentPage > 1) {
			window.location.href = 'goodsList.html?currentPage='
					+ (parseInt(currentPage) - 1)+'&status=1&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name));
			return;
		}
	}
	function downPage() {
		if (parseInt(currentPage) < parseInt(totalPage)) {
			window.location.href = 'goodsList.html?currentPage='
					+ (parseInt(currentPage) + 1)+'&status=1&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name));
			return;
		}
	}
	function fpage() {
		window.location.href = 'goodsList.html?currentPage=1'+'&status=1&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name));
		return;
	}
	function epage() {
		window.location.href = 'goodsList.html?currentPage=' + totalPage+'&status=1&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name));
		return;
	}
	function spage() {
		var seastr =$('#seastr').val();
		if (parseInt(seastr)< parseInt(totalPage)||parseInt(seastr)== parseInt(totalPage)) {
		window.location.href = 'goodsList.html?currentPage=' + seastr+'&status=1&goods_name=' + encodeURIComponent(encodeURIComponent(goods_name));
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
				"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
				"bStateSave" : true,//状态保存
				"aoColumnDefs" : [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				{
					"orderable" : false,
					"aTargets" : [ 0, 2, 4 ]
				} // 制定列不参与排序
				]
			});
			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});
	</script>
</body>
</html>