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
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/shoujisc.css">
    <link rel="stylesheet" type="text/css" href="css/showTip.css">
    <script type="text/javascript" src="js/showTip.js"></script>
    <script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js "></script>
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="/chihaodian/main/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <title>基本设置</title>

</head>
<body id="wrap">
        <button id="scanQRCode" class="drdd-btn" onclick="scan()">扫&nbsp;&nbsp;码</button>


<script type="text/javascript">

    var appId = '${signMap.appid}';
//    alert("appId:"+appId);
    var timestamp = '${signMap.timestamp}';
//    alert("timestamp:"+timestamp);
    var nonceStr = '${signMap.nonceStr}';
//    alert("nonceStr:"+nonceStr);
    var signature = '${signMap.signature}';
//    alert("signature:"+signature);
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
        alert("出错了：" + res.errMsg);//这个地方的好处就是wx.config配置错误，会弹出窗口哪里错误，然后根据微信文档查询即可。
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
                                showTip("券码可用");
                            }else{
                                showTip("券码不可用，请重新扫码！");
                            }
                        }
                    });
                }
            });
        };
    });

</script>

</body>
</html>