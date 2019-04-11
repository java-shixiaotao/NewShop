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
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet"
	type="text/css" />
<link href="lib/icheck/icheck.css" rel="stylesheet"
	type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<title>基本设置</title>

</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		添加菜单 <span class="c-gray en">&gt;</span>  <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<br><br><br><br>
	<div class="pd-20" style="width: 80%">
			
			<div class="row cl">
						<label class="form-label col-2">类型：</label>
						<div class="formControls col-10">
						<select id="level" class="input-text" style="width: 80%" onchange="mainbtn()">
						<option value="1">一级菜单</option>
						<option value="2">二级菜单</option>
						</select>
						</div>
			</div>
			<br>
			<div class="row cl" id="sub_btn" style="display: none;">
						<label class="form-label col-2">所属一级菜单：</label>
						<div class="formControls col-10">
						<select id="super_id" class="input-text" style="width: 80%">
						<c:forEach items="${list }" var="list">
						<option value="${list.id }">${list.name }</option>
						</c:forEach>
						</select>
						</div>
			</div>
			<br>
			<div class="row cl">
						<label class="form-label col-2">名称：</label>
						<div class="formControls col-10">
							<input type="text" id="name"  value="" class="input-text" style="width: 80%">
						</div>
			</div>
			<br>		
			<div class="row cl">
						<label class="form-label col-2">链接：</label>
						<div class="formControls col-10">
							<input type="text" id="value"  value="" class="input-text" style="width: 80%">
						</div>
					</div>		
					<br>
					
					
				<div class="col-10 col-offset-2">
				
						<button onClick="add()" id="butt"
						class="btn btn-primary radius" type="button">
						<i class="Hui-iconfont">&#xe632;</i> 提交
					</button>
					<button onClick="history.go(-1);" class="btn btn-default radius"
						type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
				</div>
			</div>

	<script type="text/javascript">
	function mainbtn(){
		var level=$('#level').val();
		if(level==1){
			$('#sub_btn').hide();
		}
		else{
			$('#sub_btn').show();
		}
	}
	function add(){
		var level=$('#level').val();
		var super_id=$('#super_id').val();
		var name=$('#name').val();
		var value=$('#value').val();
		var type = 'view';
		$.ajax({
			url:'buttonInsert.html',
			type:'post',
			data:'level='+level+'&super_id='+super_id+'&type='+type+'&name='+name+'&value='+value,
			success:function(rs){
				var data = eval('('+rs+')');
				
				if(data.rs==1){
					alert("添加成功！");
					window.location.href = document.referrer;
				}else{
					
					alert("添加失败！"+data.message);
				}
			}
		})
	}
	
	</script>
</body>
</html>