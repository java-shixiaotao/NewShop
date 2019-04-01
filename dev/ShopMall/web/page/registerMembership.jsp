<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/shoujisc.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="css/showTip.css">
	<script type="text/javascript" src="js/showTip.js"></script>
	<link rel="stylesheet" type="text/css" href="css/iosSelect.css">
	<script type="text/javascript" src="js/iosSelect.js"></script>
	<script type="text/javascript" src="js/area.js"></script>
	<script type="text/javascript">
        $(function () {
            showStr("province", "city", "area");
        });
	</script>
</head>

<body id="wrap">

<div class="sjsc-title1" style="border-bottom:1px solid #ABD13E">
	<h3 class="sjsc-t1l f-l"><a href="membershipindex.html"><img src="images/back.png" alt="" style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a></h3>
	<div style="clear:both;"></div>
</div>


<ul class="xzdz-ul1">
	<li>
		<div style="height: 70px;padding-top: 10px">
			<img src="${membership.head_img}" style="width:60px;height:60px;margin: 0 auto"   id="head_img" />
		</div>
	</li>
	<li>
		<p class="xzdz-p1 f-l">昵称</p>
		<input type="text" readonly = "readonly" class="xzdz-ipt1 f-l"  style="text-align: right" id="realname" value="${membership.realname}"/>
		<div style="clear:both;"></div>
	</li>
	<li>
		<p class="xzdz-p1 f-l">手机号<span style="color:red">*</span></p>
		<input type="text" placeholder="请输入手机号" class="xzdz-ipt1 f-l" style="text-align: right" id="phone" value="${membership.phone}"/>
		<div style="clear:both;"></div>
	</li>
	<li>
		<p class="xzdz-p1 f-l">邮箱<span style="color:red">*</span></p>
		<input type="text" placeholder="请输入邮箱" class="xzdz-ipt1 f-l"  style="text-align: right" id="email" value="${membership.email}"/>
		<div style="clear:both;"></div>
	</li>
	<li>
		<p class="xzdz-p1 f-l">姓名<span style="color:red">*</span></p>
		<input type="text" placeholder="请输入姓名" class="xzdz-ipt1 f-l"  style="text-align: right" id="username" value="${membership.username}"/>
		<div style="clear:both;"></div>
	</li>
	<li>
		<p class="xzdz-p1 f-l">身份证<span style="color:red">*</span></p>
		<input type="text" placeholder="请输入身份证" class="xzdz-ipt1 f-l"  style="text-align: right" id="idcardno" value="${membership.idcardno}"/>
		<div style="clear:both;"></div>
	</li>
	<li>
		<p class="xzdz-p1 f-l">邀请人编号</p>
		<input type="text" placeholder="请输入邀请人会员编号" class="xzdz-ipt1 f-l"  style="text-align: right"
				<c:if test="${insertFlag==0}">
					readonly="readonly"
				</c:if>
			   id="referee" value="${membership.referee}"/>
		<div style="clear:both;"></div>
	</li>
	<li style="padding-left: 2px">
		<c:if test="${insertFlag==1}">
			<dl class="drdd-info6" onclick="window.location.href='membershipAddrList.html?addr_id=${addr_id}'" >
		</c:if>
		<c:if test="${insertFlag!=1}">
			<dl class="drdd-info6" onclick="window.location.href='modifyMembershipAddrList.html?addr_id=${addr_id}'" >
		</c:if>
			<c:forEach items="${addr}" var="addr" begin="0" end="0">
				<input type="hidden" value="${addr.addr_name}" id='addr_name'>
				<input type="hidden" value="${addr.addr_id}" id='now_addr_id'>
				<dt>
					<p style="font-size: 14px">地址管理：<span id="province" lang="${addr.province }"></span>
						<span id="city" lang="${addr.city }"></span>
						<span id="area" lang="${addr.area }"></span>${addr.addr_name }
					</p>
				</dt>
			</c:forEach>
			<c:if test="${empty addr}">
				<dt style="padding-top:15px;margin-left:10px;font-size:12px">
					<span class="f-l">点击添加地址</span>
				</dt>
			</c:if>
			<dd><a>></a></dd>
			<div style="clear:both;"></div>
		</dl>
	</li>
	<li>
		<p class="xzdz-p1 f-l">生日</p>
		<div class="form-item item-line" id="selectDate"  style="text-align: right">
			<div class="pc-box">
				<span style="font-size:12px;color:#A9A9A9;margin-right: 15px" data-year="" data-month="" data-date="" id="showDate">请选择生日</span>
			</div>
		</div>
		<div style="clear:both;"></div>
	</li>
	<c:if test="${insertFlag!=1}">
	<li>
		<p class="xzdz-p1 f-l">会员编号</p>
		<input type="text" placeholder="系统自动生成无需填写"  readonly = "readonly" class="xzdz-ipt1 f-l"  style="text-align: right" id="user_id" value="${membership.user_id}"/>
		<div style="clear:both;"></div>
	</li>
	</c:if>
	<li>
		<p class="xzdz-p1 f-l">加入时间</p>
		<input type="text" placeholder=""  readonly = "readonly" class="xzdz-ipt1 f-l"  style="text-align: right" id="add_time" value="${membership.add_time}" />
		<div style="clear:both;"></div>
	</li>
	<li>
		<div style="height: 70px;padding-top: 10px;text-align: center">
			<c:if test="${insertFlag==1}">
				<button style="width: 70px;height:30px" class="sjsc-btn1" onclick="add()">注册会员</button>
			</c:if>
			<c:if test="${insertFlag!=1}">
				<button style="width: 70px;height:30px" class="sjsc-btn1" onclick="modify()">修改信息</button>
			</c:if>
		</div>
	</li>
</ul>
<script type="text/javascript">
    function add(area_id,area_name) {
        var addr_phone =$('#phone').val();
        if(addr_phone==""){
            showTip("请填写手机号码");return;
        }else{
            if(!(/^1[34578]\d{9}$/.test(addr_phone))){
                alert("手机号码格式有误，请重填");
                return;
            }
        }
        var addr_email =$('#email').val();
        if(addr_email==""){
            showTip("请填写邮箱");
            return;
        }
        var addr_username =$('#username').val();
        if(addr_username==""){
            showTip("请填写姓名");return;
        }
        var addr_idcardno =$('#idcardno').val();
        if(addr_idcardno==""){
            showTip("请填写身份证号码");
            return;
        }
        var showDateDom = $('#showDate');
        var yearLevelId = showDateDom.attr('data-year');
        var monLevelId = showDateDom.attr('data-month');
        var dayLevelId = showDateDom.attr('data-date');
//        alert("生日年："+yearLevelId);
//        alert("生日月："+monLevelId);
//        alert("生日日："+dayLevelId);
        if(parseInt(monLevelId)<10){
            monLevelId = "0"+monLevelId
		}
        if(parseInt(dayLevelId)<10){
            dayLevelId = "0"+ dayLevelId
		}
        var birthday = yearLevelId +"-"+ monLevelId +"-" + dayLevelId;
        var add_time_add = $('#add_time').val();
        //地址id
        var addr_add = $('#now_addr_id').val();
//        alert("地址id："+addr_add);
        var addr_user = $('#addr_user').val();
        var addr_tel = $('#addr_tel').val();
        var addr_name = $('#addr_name').val();

        if (typeof(addr_name) == 'undefined') {
            addr_name = '';
        }
        if ( addr_name == '') {
            showTip('请填写有效的收货地址');
            return;
        }
        var province = $('#province').text();
        if (province == '') {
            showTip("收货地址填写有误，请重新编辑！");
            return;
        }
        var city = $('#city').text();
        if (city == '') {
            showTip("收货地址填写有误，请重新编辑！");
            return;
        }
        var area = $('#area').text();
        if (area == '') {
            showTip("收货地址填写有误，请重新编辑！");
            return;
        }
        var addressDetail = province + ' ' + city + ' ' + area + ' ' + addr_name;
        var referee = $('#referee').val();
        var refereeTest = /^[0-9]+$/ ;
        var refereeflag = "0";
        if(referee!=''){
            if(!refereeTest.test(referee)){
                showTip("邀请人编号必须是数字！");
                return;
            }
            $.ajax({
                url : 'membershipModifyCheckReferee.html',
                type : 'post',
                data : '&referee=' + referee,
                async: false,
                success : function(rs) {
                    refereeflag = rs;
                }
            });
            if(refereeflag == "0"){
                showTip("邀请人编号填写有误，查无此人！");
                return;
            }
        }
        $.ajax({
//            url : 'addrInsert.html',
            url : 'membershipInsert.html',
            type : 'post',
            data : 'addr_phone=' + addr_phone + '&addr_email=' + addr_email
            + '&addr_username=' + addr_username+ '&addr_idcardno=' + addr_idcardno+ '&birthday=' + birthday + '&add_time_add=' + add_time_add+ '&addr_add=' + addr_add+ '&addressDetail=' + encodeURI(addressDetail)
            + '&referee=' + referee,
            success : function(rs) {
                if (rs == 1) {
                    showTip("注册成功");
					window.location.href="membershipindex.html";
                } else {
                    showTip("不能重复注册！");
                }
            }
        })
    }


    function modify(area_id,area_name) {
        var addr_phone =$('#phone').val();
        if(addr_phone==""){
            showTip("请填写手机号码");return;
        }else{
            if(!(/^1[34578]\d{9}$/.test(addr_phone))){
                alert("手机号码格式有误，请重填");
                return;
            }
        }
        var addr_email =$('#email').val();
        if(addr_email==""){
            showTip("请填写邮箱");
            return;
        }
        var addr_username =$('#username').val();
        if(addr_username==""){
            showTip("请填写姓名");return;
        }
        var addr_idcardno =$('#idcardno').val();
        if(addr_idcardno==""){
            showTip("请填写身份证号码");
            return;
        }
        var showDateDom = $('#showDate');
        var yearLevelId = showDateDom.attr('data-year');
        var monLevelId = showDateDom.attr('data-month');
        var dayLevelId = showDateDom.attr('data-date');
        if(parseInt(monLevelId)<10){
            monLevelId = "0"+monLevelId
        }
        if(parseInt(dayLevelId)<10){
            dayLevelId = "0"+ dayLevelId
        }
        var birthday = yearLevelId +"-"+ monLevelId +"-" + dayLevelId;
        var add_time_add = $('#add_time').val();
        //地址id
        var addr_add = $('#now_addr_id').val();
        var addr_name = $('#addr_name').val();
        if (typeof(addr_name) == 'undefined') {
            addr_name = '';
        }
        if ( addr_name == '') {
            showTip('请填写有效的地址');
            return;
        }
        var province = $('#province').text();
        if (province == '') {
            showTip("地址填写有误，请重新编辑！");
            return;
        }
        var city = $('#city').text();
        if (city == '') {
            showTip("地址填写有误，请重新编辑！");
            return;
        }
        var area = $('#area').text();
        if (area == '') {
            showTip("地址填写有误，请重新编辑！");
            return;
        }
        var addressDetail = province + ' ' + city + ' ' + area + ' ' + addr_name;
//        var referee = $('#referee').val();
//        var refereeTest = /^[0-9]+$/ ;
//        if(!refereeTest.test(referee)){
//            showTip("邀请人编号必须是数字！");
//            return;
//		}
//		var user_id_My = $('#user_id').val();
//        if(user_id_My != '' && typeof(user_id_My)!=undefined){
//            if(parseInt(referee) == parseInt(user_id_My)){
//                showTip("不能填写自己的账号！");
//                return;
//            }
//		}
//		var refereeflag = "0";
//        if(referee!=''){
//            $.ajax({
//                url : 'membershipModifyCheckReferee.html',
//                type : 'post',
//                data : '&referee=' + referee,
//                async: false,
//                success : function(rs) {
//                    refereeflag = rs;
//                }
//            });
//		}
//        if(refereeflag == "0"){
//            showTip("邀请人编号填写有误，查无此人！");
//            return;
//		}
        $.ajax({
            url : 'membershipModify.html',
            type : 'post',
            data : 'addr_phone=' + addr_phone + '&addr_email=' + addr_email
            + '&addr_username=' + addr_username+ '&addr_idcardno=' + addr_idcardno+ '&birthday=' + birthday + '&add_time_add=' + add_time_add+ '&addr_add=' + addr_add+ '&addressDetail=' + encodeURI(addressDetail)
            + '&referee=' + referee,
            success : function(rs) {
                showTip("修改成功");
                window.location.href="membershipindex.html";
            }
        })
    }









    $(document).ready(function(){
		var selectDateDom = $('#selectDate');
		var showDateDom = $('#showDate');
		// 初始化时间
		var now = new Date();
		var nowYear = now.getFullYear();
		var nowMonth = now.getMonth() + 1;
		var nowDate = now.getDate();
    var yearData = function(callback) {
        // settimeout只是模拟异步请求，真实情况可以去掉
        // setTimeout(function() {
        callback(formatYear(nowYear))
        // }, 2000)
    }
    var monthData = function (year, callback) {
        // settimeout只是模拟异步请求，真实情况可以去掉
        // setTimeout(function() {
        callback(formatMonth());
        // }, 2000);
    };
    var dateData = function (year, month, callback) {
        // settimeout只是模拟异步请求，真实情况可以去掉
        // setTimeout(function() {
        if (/^(1|3|5|7|8|10|12)$/.test(month)) {
            callback(formatDate(31));
        }
        else if (/^(4|6|9|11)$/.test(month)) {
            callback(formatDate(30));
        }
        else if (/^2$/.test(month)) {
            if (year % 4 === 0 && year % 100 !==0 || year % 400 === 0) {
                callback(formatDate(29));
            }
            else {
                callback(formatDate(28));
            }
        }
        else {
            throw new Error('month is illegal');
        }
        // }, 2000);
        // ajax请求可以这样写
        /*
        $.ajax({
            type: 'get',
            url: '/example',
            success: function(data) {
                callback(data);
            }
        });
        */
    };
		selectDateDom.bind('click', function () {
			var oneLevelId = showDateDom.attr('data-year');
			var twoLevelId = showDateDom.attr('data-month');
			var threeLevelId = showDateDom.attr('data-date');
			var iosSelect = new IosSelect(3,
				[yearData, monthData, dateData],
				{
					title: '生日选择',
					itemHeight: 35,
					oneLevelId: oneLevelId,
					twoLevelId: twoLevelId,
					threeLevelId: threeLevelId,
					showLoading: true,
					callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
						showDateDom.attr('data-year', selectOneObj.id);
						showDateDom.attr('data-month', selectTwoObj.id);
						showDateDom.attr('data-date', selectThreeObj.id);
						showDateDom.html(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
					}
				});
		})

        var tempDateStr = '${membership.birthday}';
//        alert("tempDateStr:"+tempDateStr);
        if(tempDateStr !='' && tempDateStr!='null'){
            var tempDate = new Date(tempDateStr);
//            alert("初始化生日："+tempDate.getFullYear() +"-"+ (tempDate.getMonth() + 1)+"-" + tempDate.getDate());
            showDateDom.attr('data-year', tempDate.getFullYear());
            showDateDom.attr('data-month', tempDate.getMonth() + 1);
            showDateDom.attr('data-date', tempDate.getDate());
            showDateDom.html( tempDate.getFullYear() + '年' + (tempDate.getMonth() + 1) + '月' + tempDate.getDate()+"日");
        }else{
//            alert("不初始化时间空间："+nowYear);
            showDateDom.attr('data-year', nowYear);
            showDateDom.attr('data-month', nowMonth);
            showDateDom.attr('data-date', nowDate);
        }

    });

    // 数据初始化
    function formatYear (nowYear) {
        var arr = [];
        for (var i = nowYear - 70; i <= nowYear + 70; i++) {
            arr.push({
                id: i + '',
                value: i + '年'
            });
        }
        return arr;
    }
    function formatMonth () {
        var arr = [];
        for (var i = 1; i <= 12; i++) {
            arr.push({
                id: i + '',
                value: i + '月'
            });
        }
        return arr;
    }
    function formatDate (count) {
        var arr = [];
        for (var i = 1; i <= count; i++) {
            arr.push({
                id: i + '',
                value: i + '日'
            });
        }
        return arr;
    }
</script>
</body>
</html>
