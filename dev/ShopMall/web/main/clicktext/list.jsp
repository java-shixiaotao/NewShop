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
<title></title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		回复事件 <a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<br>
	<div class="pd-20">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="reply_add.html"
				class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;</i>
					添加记录
			</a></span>
			
		</div>

		
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25px"><input type="checkbox" name="" value=""></th>
						<th width="30px">序号</th>
						<th width="65%">关键词</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list" varStatus="s">
					<%-- <c:if test="${list.ct_key ne 'subscribe' }"> --%>
						<tr class="text-c">
							<td><input type="checkbox" value="1" name=""></td>
							<td>${s.count}</td>
							<td>${list.ct_key}</td>
							<td>
							<a href="reply_byId.html?ct_key=${list.ct_key}">编辑</a>&nbsp;&nbsp;
							<a href="javascript:;" onclick="del('${list.ct_key}')">删除</a></td>					
						</tr>
					<%-- </c:if>	 --%>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	function del(ct_key){
		var  b = confirm('确定删除？');
		if(!b){
		return ;
		}
		$.ajax({
			url:'reply_delete.html',
			type:'post',
			data:'ct_key='+ct_key,
			success:function(rs){
				var data = eval('('+rs+')');
				if(data.rs==1){
					alert("删除成功！");
					window.location.reload();
				}else{
					alert("删除失败！"+data.message);
				}
			}
		})
	}
	function sort(id,sort){
		var str = $('#'+sort).val();
		$.ajax({
			url:'banSort.html',
			type:'post',
			data:'sort='+str+'&ban_id='+id,
			success:function(rs){
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
					"aTargets" : [ 0, 2, 3 ]
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