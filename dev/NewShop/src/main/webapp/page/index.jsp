<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title>商城</title>
    <link rel="stylesheet" href="../weui/lib/weui.min.css">
    <link rel="stylesheet" href="../weui/css/jquery-weui.css">
    <script src="../weui/lib/jquery-2.1.4.js"></script>
    <script src="../weui/lib/fastclick.js"></script>
    <script src="../weui/js/jquery-weui.js"></script>
    <!-- 结合mui -->
    <link rel="stylesheet" href="../mui/css/mui.min.css">
    <script src="../mui/js/mui.min.js"></script>
    <!--轮播--><!-- Kenburn -->
    <link href="../res/css/bootstrap.css" rel="stylesheet">
    <link href="../res/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../res/css/vegas.min.css">
    <script src="../res/js/vegas.min.js"></script>
    <!-- 业务 -->
    <script src="js/price.js"></script>
    <style>
        body, html {
            height: 100%;
            -webkit-tap-highlight-color: transparent;
        }
        #goumai_popover{
            height: 100px;
            width:20%;
            padding: 5px;
        }
        .mui-table-view-cell{
            width:100%;
        }
        .weui-tabbar__label{
            font-size:18px;
            padding:5px;
        }
        .mui-backdrop {
            position: fixed;
            z-index: -998;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: rgba(0,0,0,0);
        }
    </style>
</head>

<body>
        <div class="weui-tab">
            <div class="weui-tab__bd">
                <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
                    <!-- 轮播图片 -->
                    <!-- KENBURN BG -->
                    <section  class="home-section kenbarn" style="height: 100%;">
                        <div class="image-wrap" style="height: 100%;">
                            <div class="kenburn-overlay">
                                <div class="intro-section text-center">
                                    <h1 class="intro hs11-h1 text-white-5">RICE  MAIYIMI </h1>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
                <!-- mui弹出菜单 -->
                <div id="goumai_popover" class="mui-popover">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell"><a href="#" onclick="buyAll()">整箱</a></li>
                        <li class="mui-table-view-cell"><a href="#" onclick="buySc()">试吃</a></li>
                    </ul>
                </div>
            <div class="weui-tabbar">
                <!-- 底部菜单 -->
                <a  id="openGoumaiP" onclick="openGoumaiItems()"  href="#" class="weui-tabbar__item weui-bar__item--on">
                    <%--<div class="weui-tabbar__icon">--%>
                        <%--<img src="images/sjsc-02.gif" alt="">--%>
                    <%--</div>--%>
                    <p class="weui-tabbar__label" style="border-right:1px solid grey">
                        购&nbsp;买
                    </p>
                </a>
                <a href="center.html" onclick="openMine()" class="weui-tabbar__item">
                    <%--<div class="weui-tabbar__icon">--%>
                        <%--<img src="images/sjsc-18.png" alt="">--%>
                    <%--</div>--%>
                    <p class="weui-tabbar__label">我&nbsp;的</p>
                </a>
            </div>
        </div>

<script>
    $(document).ready(function(){
        $.toast.prototype.defaults.duration = 500;
        //是否需要弹窗
        if("true"=='${showGoumai}'){
            mui('#goumai_popover').popover('toggle',document.getElementById("openGoumaiP"));
        }
        //轮图
        $('.kenbarn').vegas({
            overlay: true,
            transition: 'fade',
            transitionDuration: 4000,
            delay: 10000,
            animation: 'random',
            animationDuration: 20000,
            slides: [
                { src: '../res/images/slider/kenburn-1.jpg' },
                { src: '../res/images/slider/kenburn-2.jpg' },
                { src: '../res/images/slider/kenburn-3.jpg' },
                { src: '../res/images/slider/kenburn-4.jpg' },
                { src: '../res/images/slider/kenburn-5.jpg' },
                { src: '../res/images/slider/kenburn-6.jpg' },
                { src: '../res/images/slider/kenburn-7.jpg' },
                /*{ src: 'images/slider/kenburn-4.jpg' }*/
            ]
        });
    });
    //点击“购买”按钮
    function openGoumaiItems() {
        setTimeout( function(){
            //add your code
            mui('#goumai_popover').popover('toggle',document.getElementById("openGoumaiP"));
        }, 0.3 * 1000 );//延迟300毫米
    }
    //购买整箱
    function buyAll() {
        //关闭菜单按钮
        mui('#goumai_popover').popover('toggle',document.getElementById("openGoumaiP"));
        $.modal({
            title: '提示',
            text: '是否有经销商',
            buttons: [

                { text: "否", className: "default", onClick: function(){
                    //没有经销商
                    window.location.href="goodsOrderSure.html?goods_id="+ goods_zhengshizhuang +"&member_code=";
                } },
                { text: "是", onClick: function(){

                    //点击确认
                    $.prompt({
                        title: '经销商代码',
                        //text: '经销商代码',
                        input: '${member_code}',
                        empty: false, // 是否允许为空
                        onOK: function (input) {
                            //点击确认
                            //判断经销商码填写是否正确
                            $.ajax({
                                url: 'isMemberCodeExit.html',
                                type: 'get',
                                data: 'memberCode=' + input,
                                success: function (rs) {
                                    if(rs.result=='success'){
                                        //若正确，跳转到下单页面
                                        $.ajax({
                                            url: 'updateMemberCode.html',
                                            type: 'get',
                                            data: 'member_code=' + input,
                                            success: function (rs) {
                                                if(rs.result=='success'){
                                                    //成功更新
                                                    window.location.href="goodsOrderSure.html?goods_id="+ goods_zhengshizhuang +"&member_code="+input;
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
                            //点击取消
                        }
                    });
                } },
            ]
        });
    }
    //购买试吃
    function buySc() {
        //关闭菜单按钮
        mui('#goumai_popover').popover('toggle',document.getElementById("openGoumaiP"));
        $.modal({
            title: '提示',
            text: '是否有经销商',
            buttons: [
                { text: "否", className: "default", onClick: function(){
                    //点击取消
                    window.location.href="goodsOrderSure.html?goods_id="+ goods_shiyongzhuang  +"&member_code=";
                } },
                {
                    text: "是", onClick: function () {
                        //点击确认
                        $.prompt({
                            title: '经销商代码',
                            //text: '经销商代码',
                            input: '${member_code}',
                            empty: false, // 是否允许为空
                            onOK: function (input) {
                                //点击确认
                                //判断经销商码填写是否正确
                                $.ajax({
                                    url: 'isMemberCodeExit.html',
                                    type: 'get',
                                    data: 'memberCode=' + input,
                                    success: function (rs) {
                                        if(rs.result=='success'){
                                            //若正确，跳转到下单页面
                                            $.ajax({
                                                url: 'updateMemberCode.html',
                                                type: 'get',
                                                data: 'member_code=' + input,
                                                success: function (rs) {
                                                    if(rs.result=='success'){
                                                        //成功更新
                                                        window.location.href = "goodsOrderSure.html?goods_id=" + goods_shiyongzhuang + "&member_code=" + input;
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
                                //取消经销商码录入操作
                            }
                        });
                    }
                }
            ]

        });
    }
    //点击我的
    function openMine(){
        window.location.href = "center.html";
    }
</script>
</body>
</html>
