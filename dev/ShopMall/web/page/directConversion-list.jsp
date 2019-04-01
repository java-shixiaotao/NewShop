<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>订单</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/shoujisc.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

    <link rel="stylesheet" type="text/css" href="css/showTip.css">
    <script type="text/javascript" src="js/showTip.js"></script>
    <script type="text/javascript" src="js/area.js"></script>
    <script type="text/javascript">
        $(function () {
            showStr("province", "city", "area");
            <%--var result='${gift.gift_id}';--%>
            <%--$.ajax({--%>
                <%--url:'checkScanCode.html',--%>
                <%--type:'post',--%>
                <%--data:'scancode='+ result ,--%>
                <%--success:function(rs){--%>
                    <%--if(rs.flag == 'true'){--%>

                    <%--}else{--%>
                        <%--alert("券码不可用或者已经兑换！");--%>
                        <%--window.location.href="/page/index.html";--%>
                    <%--}--%>
                <%--}--%>
            <%--});--%>
        });
    </script>

</head>

<body id="wrap">

<div class="sjsc-title2">
    <h3 class="sjsc-t2l">兑换</h3>
    <a href="userGiftList.html?isAll=0" class="sjsc-t2r"><img src="images/back.png" alt=""
                                                  style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
</div>
<input type="hidden" value="${addr_id}" id='addr_id'>
<input type="hidden" id="order_type" value="${order_type}" >
<input type="hidden" id="gift_id" value="${gift.gift_id}" >
<dl class="drdd-info6" onclick="window.location.href='conversionAddressLst.html?gift_id=${gift.gift_id}'">
    <c:forEach items="${addr}" var="addr" begin="0" end="0">
        <input type="hidden" value="${addr.addr_user }" id='addr_user'>
        <input type="hidden" value="${addr.addr_tel}" id='addr_tel'>
        <input type="hidden" value="${addr.addr_name}" id='addr_name'>
        <dt>
            <p>
                <span class="f-l">收货人：${addr.addr_user }</span>
                <span class="f-r">联系电话：${addr.addr_tel }</span>
            <div style="clear:both;"></div>
            </p>
            <p>收货地址：<span id="province" lang="${addr.province }"></span>
                <span id="city" lang="${addr.city }"></span>
                <span id="area" lang="${addr.area }"></span>${addr.addr_name }
            </p>
        </dt>
    </c:forEach>
    <c:if test="${empty addr}">
        <dt style="padding-top:15px;margin-left:10px">
            <span class="f-l">点击添加收货地址</span>
        </dt>
    </c:if>
    <dd><a>></a></dd>
    <div style="clear:both;"></div>
</dl>


<input type="hidden" value="${gift.goods_num}" id='tnum'>
<input type="hidden" value="${gift.goods_total}" id='tprice'>
<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    商品信息
</div>

    <input type="hidden" value="${gift.goods_id}" name='goods_id'>
    <input type="hidden" value="${gift.goods_name}" name='goods_name'>
    <input type="hidden" value="${gift.goods_img}" name='goods_img'>
    <input type="hidden" value="${gift.goods_num}" name='goods_num'>
    <input type="hidden" value="${gift.goods_price}" name='goods_price'>
    <input type="hidden" value="${gift.goods_spe}" name='goods_spe'>
    <input type="hidden" value="${gift.spe_type}" name='spe_type'>


    <div class="drdd-info3">
        <div class="drdd-if3tu f-l">
            <a href="#"><img src="${gift.goods_img}" style="width: 43px"></a>
        </div>
        <h3 class="drdd-h31 f-l"><a href="#">${gift.goods_name} x ${gift.goods_num}</a></h3>
            <p class="drdd-p1 f-r">单价：￥${gift.goods_price}</p>
        <div style="clear:both;"></div>
    </div>

<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    备注
</div>
<div class="drdd-info4">
    <p>备注：</p>

    <input type="text" placeholder="选填，填写您对卖家的要求" id='note' style="width:80%;border:0px">

    <div style="clear:both;"></div>
</div>
<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    券价值
</div>
<div class="drdd-info2">
    <p class="p1 f-l">共<span id="tnumStr">${gift.goods_num }</span>件商品
    <p class="p2 f-r">总计：<span id="tpriceStr" style="color: #f60">￥${gift.goods_total}</span></p>
    <div style="clear:both;"></div>
</div>
<div class="drdd-info2">
    <p class="p2 f-r">实付：<span id="tpriceStr0" style="color: #f60">￥0.0</span></p>
    <div style="clear:both;"></div>
</div>
<button class="drdd-btn" onclick="add()">立即兑换</button>
<script type="text/javascript">
    function add() {
        var goods_id = "";
        var goods_name = "";
        var goods_img = "";
        var goods_price = "";
        var goods_num = "";
        var goods_spe = "";
        var spe_type='';
        var order_type=$('#order_type').val();
        var gift_id=$('#gift_id').val();
        var goods_ids = $("input[name='goods_id']");

        for (var i = 0; i < goods_ids.length; i++) {
            if (i == 0) {
                goods_id += goods_ids[i].value;
            } else {
                goods_id += ",-=" + goods_ids[i].value;
            }
        }

        var goods_spes = $("input[name='goods_spe']");
        for (var i = 0; i < goods_spes.length; i++) {
            if (i == 0) {
                goods_spe += goods_spes[i].value;
            } else {
                goods_spe += ",-=" + goods_spes[i].value;
            }
        }

        var spe_types = $("input[name='spe_type']");
        for (var i = 0; i < spe_types.length; i++) {
            if (i == 0) {
                spe_type += spe_types[i].value;
            } else {
                spe_type += ",-=" + goods_spes[i].value;
            }
        }

        var goods_names = $("input[name='goods_name']");
        for (var i = 0; i < goods_names.length; i++) {
            if (i == 0) {
                goods_name += goods_names[i].value;
            } else {
                goods_name += ",-=" + goods_names[i].value;
            }
        }
        var goods_imgs = $("input[name='goods_img']");
        for (var i = 0; i < goods_imgs.length; i++) {
            if (i == 0) {
                goods_img += goods_imgs[i].value;
            } else {
                goods_img += ",-=" + goods_imgs[i].value;
            }
        }
        var goods_prices = $("input[name='goods_price']");
        for (var i = 0; i < goods_prices.length; i++) {
            if (i == 0) {
                goods_price += goods_prices[i].value;
            } else {
                goods_price += ",-=" + goods_prices[i].value;
            }
        }
        var goods_nums = $("input[name='goods_num']");
        for (var i = 0; i < goods_nums.length; i++) {
            if (i == 0) {
                goods_num += goods_nums[i].value;
            } else {
                goods_num += ",-=" + goods_nums[i].value;
            }
        }
        var goods_total = $('#tprice').val();
        var goods_total_num = $('#tnum').val();

        var receive = "";
        var addr_user = $('#addr_user').val();
        var addr_tel = $('#addr_tel').val();
        var addr_name = $('#addr_name').val();

        if (typeof(addr_user) == 'undefined') {
            addr_user = '';
        }
        if (typeof(addr_tel) == 'undefined') {
            addr_tel = '';
        }
        if (typeof(addr_name) == 'undefined') {
            addr_name = '';
        }

        if (addr_user == '' || addr_tel == '' || addr_name == '') {
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

        var note = $('#note').val();
        addr_name = addr_user + ' ' + addr_tel + ' ' + province + ' ' + city + ' ' + area + ' ' + addr_name;

        $.ajax({
            url: 'direct_conversion.html',
            type: 'post',
            data: 'goods_id=' + goods_id
            + '&goods_name=' + encodeURI(goods_name)
            + '&goods_img=' + goods_img
            + '&goods_price=' + goods_price
            + '&goods_spe=' + goods_spe
            + '&goods_num=' + goods_num
            + '&goods_total=' + goods_total
            + '&addr_name=' + encodeURI(addr_name)
             + '&note=' + encodeURI(note)
            + '&order_type=' + order_type
            + '&spe_type=' + spe_type
            + '&gift_id='+ gift_id,
            success: function (rs) {
                if (rs.result=="兑换成功") {
                    showTip(rs.result);
                    window.location.href = 'orderList.html';
                } else {
                    alert(rs.result);
                    window.location.href="/page/index.html";
                }
            }
        })

    }
</script>

</body>
</html>
