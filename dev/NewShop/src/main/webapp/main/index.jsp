<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script type="text/javascript">
var username ='${username}';
if(username==''){
	window.location.href='login.jsp';
}
</script>
<title>米城-后台管理</title>
</head>
<body>
<header class="Hui-header cl"> <a class="Hui-logo l" title="H-ui.admin v2.3" href="main">&nbsp;&nbsp;&nbsp;米城</a> <a style="width:60px" class="Hui-logo-m l" href="#" title="H-ui.admin">${admin.username }</a> <a class="Hui-logo-m l" href="login.jsp" title="H-ui.admin">退出</a> <span class="Hui-subtitle l">V1.1</span>

	<ul class="Hui-userbar">

		<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">${admin.username } <i class="Hui-iconfont"></i></a>
						<ul class="dropDown-menu menu radius box-shadow">

							<li class=""><a href="login.jsp">退出</a></li>
				</ul>
			</li>
		<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
				<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
				<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
				<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
				<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
				<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
			</ul>
		</li>
	</ul>
	<%--<a aria-hidden="false" class="Hui-nav-toggle" href="#"><span style="color:white">菜单</span></a>--%>
	<a aria-hidden="false" class="Hui-nav-toggle" href="#"><img src="images/caidan.png" style="height:26px"/></a>

</header>

<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		<c:if test="${admin.admin_id==1}">
		<%--<dl id="menu-article">--%>
			<%--<dt><i class="Hui-iconfont">&#xe616;</i> 自提点管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
			<%--<dd>--%>
				<%--<ul>--%>
					<%--<li><a _href="areaList?status=1&level=0" href="javascript:void(0)">自提点管理</a></li>--%>
				<%--</ul>--%>
			<%--</dd>--%>
		<%--</dl>--%>
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i> 商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<%--<li><a _href="ctgList?status=1" href="javascript:void(0)">分类查看</a></li>--%>
					<li><a _href="goodsList?status=1" href="javascript:void(0)">商品查看</a></li>
				</ul>
			</dd>
		</dl>
		<!-- <dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 菜单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="menuList?status=1" href="javascript:void(0)"> 菜单查看</a></li>
				</ul>
			</dd>
		</dl> -->
		<%--<dl id="menu-product">--%>
			<%--<dt><i class="Hui-iconfont">&#xe620;</i> 轮图管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
			<%--<dd>--%>
				<%--<ul>--%>
					<%--<li><a _href="banList?status=1" href="javascript:void(0)"> 轮图查看</a></li>--%>
				<%--</ul>--%>
			<%--</dd>--%>
		<%--</dl>--%>
		<%--<dl id="menu-comments">--%>
			<%--<dt><i class="Hui-iconfont">&#xe622;</i> 搜索管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
			<%--<dd>--%>
				<%--<ul>--%>
					<%--<li><a _href="secList?status=1" href="javascript:;">搜索查看</a></li>--%>
				<%--</ul>--%>
			<%--</dd>--%>
		<%--</dl>--%>
		<%--<dl id="menu-comments">--%>
			<%--<dt><i class="Hui-iconfont">&#xe622;</i> 运费管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
			<%--<dd>--%>
				<%--<ul>--%>
					<%--<li><a _href="fgtList" href="javascript:;">运费查看</a></li>--%>
				<%--</ul>--%>
			<%--</dd>--%>
		<%--</dl>--%>
		<%--<dl id="menu-comments">--%>
			<%--<dt><i class="Hui-iconfont">&#xe622;</i> 优惠券管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
			<%--<dd>--%>
				<%--<ul>--%>
					<%--<li><a _href="cpsList" href="javascript:;">优惠券查看</a></li>--%>
				<%--</ul>--%>
			<%--</dd>--%>
		<%--</dl>--%>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 兑换券管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="templateList" href="javascript:;">兑换券模板</a></li>
				</ul>
				<ul>
					<li><a _href="templategiftList" href="javascript:;">兑换券查看</a></li>
				</ul>
			</dd>
		</dl>
		</c:if>
		
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="orderList" href="javascript:;">订单查看</a></li>
				</ul>
			</dd>
		</dl>
		<c:if test="${admin.admin_id==1}">
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 快递管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="exp_list" href="javascript:;">快递查看</a></li>
				</ul>
			</dd>
		</dl>
			<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="userList" href="javascript:;">会员查看</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 公众平台<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="buttonList" href="javascript:void(0)">菜单管理</a></li>
					<li><a _href="wxSettingList" href="javascript:void(0)">参数设置</a></li>
					<li><a _href="replyById?ct_key=subscribe" href="javascript:void(0)">关注回复</a></li>
					<li><a _href="reply_list" href="javascript:void(0)">回复事件</a></li>
				</ul>
			</dd>
		</dl>
		</c:if>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="repwd.jsp" href="javascript:;">密码修改</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="米城" data-href="#">米城</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.jsp"></iframe>
		</div>
	</div>
</section>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script> 
<script type="text/javascript">
/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script> 
<script type="text/javascript">
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s)})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
//document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>