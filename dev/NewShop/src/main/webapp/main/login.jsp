<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  <meta name="applicable-device"content="pc,mobile"/>
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录 </title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />

<div class="loginWraper container">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="#" method="post">
      <div class="row cl "  id="textscreena" >
        <label class="form-label col-xs-3 col-sm-1 "><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8 col-sm-8 ">
          <input id="username" name="" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div id="textscreenp" class="row cl" >
        <label class="form-label col-xs-3 col-sm-1 col-md-1"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8 col-sm-8 col-md-8">
          <input id="password" name="" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
            </div>
      <div class="row cl">
        
      </div>
      <div class="row cl" id="btndq" >
        <div class="formControls col-xs-8 col-sm-8 col-xs-offset-3">
          <input name="" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;" onclick="add()">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright </div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript">

function add(){
	var username = $('#username').val();
	var password = $('#password').val();
	$.ajax({
		url:'../admin/isExist.html',
		type:'post',
		data:'username='+username+'&password='+password,
		success:function(rs){
			if(rs==1){
			window.location.href='main.html';
			}else{
				alert("失败！");
			}
		}
	})
}
</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>