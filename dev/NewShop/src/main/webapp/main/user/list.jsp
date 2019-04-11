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
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>意见反馈</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		查看 <a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav><br>
	<div class="text-c">
				<input type="text" value="${realname}" 
					id="realname"  class="input-text"
					style="width: 50%;" placeholder="请输入微信昵称"> 
				<button type="button" onclick="search()"
					class="btn btn-success radius" id="b1" name="">
					<i class="Hui-iconfont">&#xe665;</i> 查询
				</button>
				
			<script type="text/javascript">
				function search() {
					var realname =$('#realname').val();
					
					window.location.href = 'userList.html?realname=' +realname;
				}
			</script>
		</div>
	<div class="pd-20">
		
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25px"><input type="checkbox" name="" value=""></th>
						<th width="30px">ID</th>
						<th width="20%">昵称</th>
						<th width="20%">头像</th>
						<th width="10%">添加时间</th>
						<th width="20%">自提点</th>
						<th width="15%">会员卡时效</th>
						<th width="15%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list" varStatus="s">
						<tr class="text-c">
							<td><input type="checkbox" value="1" name=""></td>
							<td>${s.count}</td>
							<td>${list.realname}</td>
							<td><img alt="" src="${list.head_img}" width="50" height="50"> </td>
							<td>${list.add_time}</td>
							<td>${list.area_name}</td>
							<td><input type="text" id="member_time${s.count}" onfocus="WdatePicker()" 
								placeholder="请填写有效时间" value="${list.member_time}" class="input-text" > </td>
							<td>
						 <a href="javascript:;" onclick="upmbertime('${s.count}','${list.oppen_id}')">设置会员</a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="panel-foot text-center">
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
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	var currentPage = '${currentPage}';
	var totalPage = '${totalPage}';
	function upPage() {
		if (currentPage > 1) {
			window.location.href = 'userList.html?currentPage='
					+ (parseInt(currentPage) - 1)+'&status=1';
			return;
		}
	}
	function downPage() {
		if (parseInt(currentPage) < parseInt(totalPage)) {
			window.location.href = 'userList.html?currentPage='
					+ (parseInt(currentPage) + 1)+'&status=1';
			return;
		}
	}
	function fpage() {
		window.location.href = 'userList.html?currentPage=1'+'&status=1';
		return;
	}
	function epage() {
		window.location.href = 'userList.html?currentPage=' + totalPage+'&status=1';
		return;
	}
	function spage() {
		var seastr =$('#seastr').val();
		if (parseInt(seastr)< parseInt(totalPage)||parseInt(seastr)== parseInt(totalPage)) {
		window.location.href = 'userList.html?currentPage=' + seastr+'&status=1';
		}
		return;
	}
	
	function upmbertime(id,oppen_id){
		var member_time = $('#member_time'+id).val();
		$.ajax({
			url:'userUpmbertime.html',
			type:'post',
			data:'member_time='+member_time+'&oppen_id='+oppen_id,
			success:function(rs){
				if(rs==1){
				//	showTip("已加入购物车！");
					location.reload();
				}else{
					showTip("失败！");
				}
			}
		})
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