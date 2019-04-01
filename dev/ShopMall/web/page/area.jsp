<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE-9">
<meta name="apple-mobile-web-app-capable" content="no">
<meta name="mobile-web-app-capable" content="no">
<meta name="renderer" content="webkit">
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<!-- Bootstrap -->
<link type="text/css" href="css/dl.css" rel="stylesheet">
<link type="text/css" href="css/shoujisc.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>

</head>
<body style="padding-bottom: 47px;">


	<nav class="navbar navbar-default navbar-fixed-top m-component-nav"
		role="navigation">
		<div class="container-fluid">
			<div class="navbar-header text-center clearfix">
				<a class="navbar-func pull-left" href="javascript:history.go(-1)"> <span
					class="le"> < </span></a> <span
					class="pull-right navbar-func"> <a href="hyzx.html"
					class="navbar-login"></a>
				</span> <span class="navbar-title">选择自提点</span>
			</div>
		</div>
	</nav>

	<div style="min-height: 646px;" class="cart-body">
		<section id="m-region" class="m-component-region">

			<c:forEach items="${map['areaList']}" var="areaList" varStatus="s">
			<c:set value="addr${s.index}" var="al"/>
			<h5>${areaList.area_name}</h5>
			<div class="m-regionlist" style="">
				<ul id="region-ul" class="list-unstyled">
					<c:forEach items="${map[al]}" var="addr">
					<li data-name="%E4%B8%8A%E6%B5%B7" data-id="106092" onclick="add('${addr.area_id}','${addr.area_name}')">${addr.area_name}</li>
					</c:forEach>
				</ul>
			</div>
			</c:forEach>
		</section>
		<script type="text/javascript">
			function add(area_id,area_name) {
				var oppen_id ='${oppen_id}';
				$.ajax({
					url : 'userUparea.html',
					type : 'post',
					data : 'area_id=' + area_id + '&area_name=' + area_name
							+ '&oppen_id=' + oppen_id,
					success : function(rs) {
						if (rs == 1) {
							window.location.href ='index.html' ;
						} else {
							alert("系统故障！");
						}
					}
				})
			}
		</script>
	</div>
</body>
</html>