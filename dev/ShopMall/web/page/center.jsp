<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html class="mdd-page">
<head>
    <title></title>
    <meta name="charset" content="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <title></title>
	<meta http-equiv="Cache-Control" content="must-revalidate,no-cache">
	<link rel="stylesheet" type="text/css" href="css/shoujisc.css">
	<link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/app_user.css">
    <script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <!-- weui -->
    <link rel="stylesheet" href="../weui/lib/weui.min.css">
    <link rel="stylesheet" href="../weui/css/jquery-weui.css">
    <script src="../weui/lib/jquery-2.1.4.js"></script>
    <script src="../weui/lib/fastclick.js"></script>
    <script src="../weui/js/jquery-weui.js"></script>
    <%--按钮大小--%>
    <style>
        .weui-tabbar__label{
            font-size:18px;
            padding:5px;
        }
    </style>
</head>
<body id="wrap">
<div class="weui-tab">
    <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
            <section class="content">
                <header class="user-info" style="background-color: #ABD13E;">
                    <section class="user-basic" style="height: 120px">
                        <c:forEach items="${user}" var="list">
                            <img src="${list.head_img}">
                            <div class="user-name">${list.realname}</div>
                        </c:forEach>
                    </section>
                </header>
                <div style="background-color: #F3F3F3;height: 5px"></div>
                <section class="f-section" style="line-height: 30px">

                    <a class="slide-link" href="orderList.html">
                        <img src="images/wd-012-1.png">
                        全部订单
                    </a>
                </section>
                <div style="background-color: #F3F3F3;height: 5px"></div>
                <section class="f-section" style="line-height: 30px">

                    <a class="slide-link" href="addressList.html">
                        <img src="images/wd-012-03.png">
                        收货地址        </a>
                </section>
                <div style="background-color: #F3F3F3;height: 5px"></div>
                <section class="f-section">
                    <a class="slide-link" href="tel:请填写客服电话">
                        <img src="images/wd-012-08.png">
                        客服反馈        <em>请填写客服电话</em>  </a>
                </section>

                <div style="background-color: #F3F3F3;height: 5px"></div>
                <section class="f-section">
                    <a class="slide-link" href="userGiftList.html">
                        <img src="images/wd-012-02.png">
                        我的电子券        </a>
                </section>
                <div style="background-color: #F3F3F3;height: 5px"></div>
                <section class="f-section">
                    <a class="slide-link" href="#" id="scanQRCode">
                        <img src="images/saomiao.png">
                        扫码兑换        </a>
                </section>
                <div style="background-color: #F3F3F3;height: 5px"></div>
                <section class="f-section">
                    <a class="slide-link" href="#" id="myJxs" onclick="myJxs()">
                        <img src="images/huiyuan.png">
                        我的经销商</a>
                </section>
                <%--<div style="background-color: #F3F3F3;height: 5px"></div>--%>
                <%--<section class="f-section">--%>
                <%--<a class="slide-link" href="membershipindex.html" id="membership">--%>
                <%--<img src="images/huiyuan.png">--%>
                <%--会员中心        </a>--%>
                <%--</section>--%>
            </section>
        </div>
    </div>
    <div class="weui-tabbar" style="padding-bottom:10px">
        <!-- 底部菜单 -->
        <a  id="openGoumaiP" onclick="window.location.href='index.html?showGoumai=true'"  href="#" class="weui-tabbar__item">
            <%--<div class="weui-tabbar__icon">--%>
            <%--<img src="images/sjsc-02.gif" alt="">--%>
            <%--</div>--%>
            <p class="weui-tabbar__label" style="border-right:1px solid grey">
                购&nbsp;买
            </p>
        </a>
        <a href="center.html" onclick="openMine()" class="weui-tabbar__item weui-bar__item--on">
            <%--<div class="weui-tabbar__icon">--%>
            <%--<img src="images/sjsc-18.png" alt="">--%>
            <%--</div>--%>
            <p class="weui-tabbar__label">我&nbsp;的</p>
        </a>
    </div>
</div>

</body>
<script type="text/javascript">
    $.ajax({
        url: 'jsSignIn.html',
        type: 'post',
        data: 'url=' + window.location.href.split("#")[0],
        success: function (rs) {
            var appId = rs.appid;
            var timestamp = rs.timestamp;
            var nonceStr = rs.nonceStr;
            var signature = rs.signature;
            var linkTitle = rs.linkTitle;
            wx.config({
                // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                debug: false,
                // 必填，公众号的唯一标识
                appId: appId,
                // 必填，生成签名的时间戳
                timestamp: timestamp,
                // 必填，生成签名的随机串
                nonceStr: nonceStr,
                // 必填，签名
                signature: signature,
                // 必填，需要使用的JS接口列表
                jsApiList: ['checkJsApi', 'scanQRCode']
            });
            wx.error(function (res) {
//                alert("请稍后扫描：" + res.errMsg);//这个地方的好处就是wx.config配置错误，会弹出窗口哪里错误，然后根据微信文档查询即可。
                alert("页面正在加载，请稍后扫描：" + res.errMsg);//这个地方的好处就是wx.config配置错误，会弹出窗口哪里错误，然后根据微信文档查询即可。
            });

            wx.ready(function () {
                wx.checkJsApi({
                    jsApiList: ['scanQRCode'],
                    success: function (res) {
        //                alert("可以扫描");
                    }
                });
                //点击按钮扫描二维码
                document.querySelector('#scanQRCode').onclick = function () {
                    wx.scanQRCode({
                        needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
                        scanType: ["qrCode"], // 可以指定扫二维码还是一维码，默认二者都有
                        success: function (res) {
                            var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
                            //判断扫到的码是否是未经使用的
                            $.ajax({
                                url:'checkScanCode.html',
                                type:'post',
                                data:'scancode='+ result ,
                                success:function(rs){
                                    if(rs.flag == 'true'){
//                                        showTip("券码可用");
                                        window.location.href="conversionList.html?share_id="+result;
                                    }else{
                                        $.toast("券码不可用或者已经兑换！","text");
                                    }
                                }
                            });
                        }
                    });
                };
            });
        }
    });
    //经销商
    var member_code_init = '${member_code}';
    function myJxs() {
        //查询我的经销商
        $.prompt({
            title: '经销商代码',
            //text: '经销商代码',
            input: member_code_init,
            empty: false, // 是否允许为空
            onOK: function (input) {
                $.ajax({
                    url: 'isMemberCodeExit.html',
                    type: 'get',
                    data: 'memberCode=' + input,
                    success: function (rs) {
                        if(rs.result=='success'){
                            //点击确认
                            $.ajax({
                                url: 'updateMemberCode.html',
                                type: 'get',
                                data: 'member_code=' + input,
                                success: function (rs) {
                                    if(rs.result=='success'){
                                        //若正确，跳转到下单页面
                                        member_code_init= input;
                                        $.toast("经销商码修改成功！","text");
                                    }
                                }
                            });
                        }else{
                            $.toast("经销商码输入错误！","text");
                        }
                    }
                });
            },
            onCancel: function () {
            }
        });
    }
</script>

</html>