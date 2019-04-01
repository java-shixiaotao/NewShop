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
<title></title>
<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
<script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					urlType : 'domain',
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : true,
					afterBlur : function() {
						this.sync();
					},
					items : [
						'source','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image','multiimage', 'link','fullscreen']
				});
			});
		</script>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		回复事件 <span class="c-gray en"></span>  <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="pd-20" style="width: 80%">
	<input type="hidden" value="${clickText.type}" id="type">
			<div class="row cl">
						<label class="form-label col-2">关键词：</label>
						<div class="formControls col-10">
							<input type="text" id="ct_key"  value="${clickText.ct_key }" class="input-text" style="width: 80%;" readonly="readonly">
						</div>
					</div>
					<br>
				<c:if test="${clickText.type==1 }">
				<input type="hidden" value="${clickText.title}" id="title">
				<input type="hidden" value="${clickText.intro}" id="intro">
				<input type="hidden" value="${clickText.url}" id="url">
				<input type="hidden" value="${clickText.pic_url}" id="filepath">
				<div id="t1">
				<div class="row cl">
						<label class="form-label col-2">文本：</label>
						<div class="formControls col-10">
						<textarea name="content" id="content" style="width: 80%;height: 260px;">${clickText.content }</textarea>
						</div>
					</div>	
				<br>			
				</div>	
				</c:if>	
				<c:if test="${clickText.type==2}">
				<input type="hidden" value="${clickText.content}" id="content">
				<div class="row cl">
						<label class="form-label col-2">标题：</label>
						<div class="formControls col-10">
							<input type="text" id="title" name="title"  value="${clickText.title }" class="input-text" style="width: 80%">
						</div>
					</div>
				<br>
				<div class="row cl" >
						<label class="form-label col-2">简介：</label>
						<div class="formControls col-10">
							<input type="text" id="intro" name="intro" value="${clickText.intro }" class="input-text" style="width: 80%">
						</div>
					</div>
					<br>		
				<div class="row cl">
						<label class="form-label col-2">图片：</label>
						<div class="formControls col-10">
							<input type="file" id="file" name="file"  class="input-text" style="width: 80%" onchange="upload()">
						</div>
					</div>
					<br>	
				<div class="row cl">
						<label class="form-label col-2">链接：</label>
						<div class="formControls col-10">
							<input type="text" id="url" name="url" value="${clickText.url }" class="input-text" style="width: 80%">
						</div>
					</div>
				<br>	
				<div class="row cl">
						<label class="form-label col-2"> </label>
						<input id="filepath" type="hidden" value="${clickText.pic_url }">
						<div class="formControls col-10" id="img">
							<img alt="" src="${clickText.pic_url}" width="200" height="120">
						</div>
					</div>		
				</c:if>	
				
					<br><br>
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
	function sc(){
		var type = $('#type').val();
		if(type==1){
			$('#t1').show();
			$('#t2').hide();
		}else{
			$('#t1').hide();
			$('#t2').show();
		}
	}
	
	function add(){
		var ct_key = $('#ct_key').val();
		var type = $('#type').val();
		var content = $('#content').val();
		var title = $('#title').val();
		var intro = $('#intro').val();
		var pic_url = $('#filepath').val();
		var url = $('#url').val();
		
		$.ajax({
			url:'reply_update.html',
			type:'post',
			data:'ct_key='+ct_key +'&type='+type+'&content='+content+'&title='+title+'&intro='+intro+'&pic_url='+pic_url+'&url='+url,
			success:function(rs){
				var data = eval('('+rs+')');
				if(data.rs==1){
					alert("更新成功！");
					window.location.reload();
				}else{
					alert("更新失败！"+data.message);
				}
			}
		})
	}
	function upload() {

		var fp = document.getElementById("file").value;
		//为了避免转义反斜杠出问题，这里将对其进行转换

		var re = /(\\+)/g;
		var fn = fp.replace(re, "#");
		//对路径字符串进行剪切截取
		var one = fn.split("#");
		//获取数组中最后一个，即文件名
		var two = one[one.length - 1];
		//再对文件名进行截取，以取得后缀名
		var three = two.split(".");
		//获取截取的最后一个字符串，即为后缀名
		var last = three[three.length - 1];
		last = last.toLowerCase();

		if (last != 'png' && last != 'jpg' && last != 'gif'
				&& last != 'PNG' && last != 'JPG' && last != 'GIF') {
			alert("请上传png、jpg或者gif文件！");
			return;
		}
		$.ajaxFileUpload({
					url : 'upload.html', //需要链接到服务器地址  
					secureuri : false,
					fileElementId : "file", //文件选择框的id属性  
					dataType : 'text', //服务器返回的格式，可以是json  
					success : function(rs) //相当于java中try语句块的用法  
					{	
						if (rs != "") {
							$('#img').html("");
							$('#img').append("<img src='"+rs+"' width='100' height='100'>");
							$('#filepath').val(rs);
						} else {
							alert('失败');
							//document.getElementById("msg"+m[1]).value="失败"; 
						}
					},
					error : function(data, status, e) //相当于java中catch语句块的用法  
					{alert('失败');
						
					}
				});
	}

	</script>	
	
</body>
</html>