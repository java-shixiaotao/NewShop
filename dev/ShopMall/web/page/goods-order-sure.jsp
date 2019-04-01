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
    <link rel="stylesheet" type="text/css" href="css/showTip.css">
    <link rel="stylesheet" type="text/css" href="css/iosSelect.css">
    <script type="text/javascript" src="js/iosSelect.js"></script>
    <script type="text/javascript" src="js/showTip.js"></script>
    <script type="text/javascript" src="js/area.js"></script>
    <script type="text/javascript" src="js/caculator.js"></script>
    <!-- weui -->
    <link rel="stylesheet" href="../weui/lib/weui.min.css">
    <link rel="stylesheet" href="../weui/css/jquery-weui.css">
    <script src="../weui/lib/jquery-2.1.4.js"></script>
    <script src="../weui/lib/fastclick.js"></script>
    <script src="../weui/js/jquery-weui.js"></script>
    <!-- 修改样式 -->
    <style>
        .gwc-ul1{padding-bottom:0px;}
        .gwc-ul1 li{ padding:8px 5px; border-bottom:1px solid #eee; background:#fff; }
        .gwc-ul1 li .hwc-tu{ width:130px; height:130px; /* border:1px solid #EFEFEF; */ text-align:center; margin-right:5px;}
        .hwc-tu img{ display:inline-block; height:100%;}
        .gwc-ul1 li .gwc-md{
            width:50%;
            text-align: center;
        }
        .gwc-md h3{ font-weight:normal;white-space:nowrap; text-overflow:ellipsis; overflow:hidden; line-height:18px;}
        .gwc-md h3 a{ font-size:14px; color:#4A4A4A;}
        .gwc-md .gwc-p1{font-size:16px; color:#4A4A4A; line-height:18px;}
        .gwc-p1 span{ color:#7F7F7F;}
        .gwc-md .gwc-p2{ font-size:12px; color:#6F6F6F;white-space:nowrap; text-overflow:ellipsis; overflow:hidden; line-height:18px;}
        .gwc-ul1 li .gwc-del{ margin-top:0px;}
        .gwc-del img{ width:15px;}
    </style>
</head>

<body id="wrap">

<div class="sjsc-title2">
    <h3 class="sjsc-t2l">商品下单</h3>
    <a href="index.html" class="sjsc-t2r"><img src="images/back.png" alt=""
                                                  style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
</div>
<!--商品开始-->
<ul class="gwc-ul1">
        <li>
            <input type="hidden" name="goods_id" id="goods_id" value="${goods.goods_id}">
            <div class="hwc-tu f-l"><a href="#"><img src="${goods.goods_img}" style="width: 130px"></a></div>
            <div class="gwc-md f-l">
                <h2><a href="#">${goods.goods_name}</a></h2>
                <p class="gwc-p1">&nbsp;</p>
                <p class="gwc-p1">规格：<span>${goods.goods_spe}</span></p>
                <p class="gwc-p1">&nbsp;</p>
                <p class="gwc-p1">单价：<span>￥${goods.goods_price}</span></p>
                <p class="gwc-p1">&nbsp;</p>
                <p class="gwc-p1">
                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="40%" style="text-align: right;height: 10px"><a href="javascript:;" onclick="plus('${goods.goods_id}','${goods.goods_price}','1')" class="gwc-del f-r"><img src="images/11.png" style="width: 28px;height: 25px"></a></td>
                            <td width="20%" style="text-align: center"><a href="#" class="gwc-del" id="goods_num" style="padding-top:4px;width: 16px">1</a></td>
                            <td  width="40%" style="text-align: left;height: 10px"><a href="javascript:;" onclick="min('${goods.goods_id}','${goods.goods_price}','1')" class="gwc-del f-l"><img src="images/22.png" style="width: 28px;height: 25px"></a></td>
                        </tr>
                    </table>
                </p>
            </div>
            <div style="clear:both;"></div>
        </li>
</ul>
<!--商品结束-->

<!-- 订单类型 开始 -->.
<div style="font-size: 12px;padding-left:5px;color: #A09E9E;margin-top:-10px;">
    订单类型
</div>
<div  id="showOrderType" class="drdd-info4" style="text-align: right">
    <p style="float:right">订单类型></p>
    <a href="#"  >
    </a>
    <div style="clear:both;"></div>
</div>
<input type="hidden" name="order_type" id="order_type" value="">
<!-- 订单类型结束 -->
<!-- 收货人地址 -->
<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    收货地址
</div>
<input type="hidden" value="${addr_id}" id='addr_id'>
<!-- 直接购买下单页面选择地址链接需要调整，addrList.html 是购物车结算下单页面，需要重新建一个 directBuyAddrList -->
<dl class="drdd-info6" onclick="window.location.href='directBuyAddrList.html?&addr_id=${addr_id}&goods_id=${goods.goods_id}&member_code=${member_code}&goods_price=${goods.goods_price}'">
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
<!-- 收货人地址 结束 -->
<!-- 备注开始 -->
<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    备注
</div>
<div class="drdd-info4">
    <p>备注：</p>

    <input type="text" placeholder="选填，填写您对卖家的要求" id='note' style="width:80%;border:0px">

    <div style="clear:both;"></div>
</div>
<!-- 备注结束-->
<!--订单价格开始-->
<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    订单价格
</div>
<div class="drdd-info2">
    <p class="p1 f-l">共<span id="tnum">1</span>件商品</p>
    <p class="p2 f-r">总计：￥<span id="tprice" style="color: #f60">${goods.goods_price}</span></p>
    <div style="clear:both;"></div>
</div>
<!--订单价格 结束-->
<button class="drdd-btn" style="margin-top: 5px" onclick="add()">下单购买</button>
<script type="text/javascript">
    $(function () {
        showStr("province", "city", "area");
        var showOrderTypeDom = document.querySelector('#showOrderType');
        var orderTypeIdDom = document.querySelector('#order_type');
        var orderTypeList = [{ "id": "0", "value": "实物" }, { "id": "1", "value": "电子券" }];
        showOrderTypeDom.addEventListener('click', function () {
            var orderTypeId = showOrderTypeDom.dataset['id'];
            var orderTypeName = showOrderTypeDom.dataset['value'];
            var orderTypeSelect = new IosSelect(1,
                [orderTypeList],
                {
                    container: '.container',
                    title: '订单类型选择',
                    itemHeight: 50,
                    itemShowCount: 3,
                    oneLevelId: orderTypeId,
                    callback: function (selectOneObj) {
                        orderTypeIdDom.value = selectOneObj.id;
                        showOrderTypeDom.innerHTML = selectOneObj.value;
                        showOrderTypeDom.dataset['id'] = selectOneObj.id;
                        showOrderTypeDom.dataset['value'] = selectOneObj.value;
                    }
                });
        });
    });
    //增加或减少商品数量 开始
    function plus(goods_id,goods_price,sort){
        //点击之前选择的购买数量
        var goods_num1=$('#goods_num').text();
        //点击之后购买的数量
        var goods_num = parseInt(goods_num1)+1;
        //修改点击之后的数量的数量
        $('#goods_num').text(goods_num);
        //总价
        var goods_total  = floatObj.multiply(parseFloat(goods_num),parseFloat(goods_price));
        //修改数量
        //	var tprice = (parseFloat(tprice1)+parseFloat(goods_price)).toFixed(1);
        $('#tnum').text(goods_num);
        $('#tprice').text(goods_total);
    }
    function min(goods_id,goods_price,sort){
        var goods_num1=$('#goods_num').text();
        if(goods_num1==0){
            $.toast("至少购买一件商品！","text")
            return;
        }
        var goods_num=parseInt(goods_num1)-1;
        var goods_total  = floatObj.multiply(parseFloat(goods_num),parseFloat(goods_price));
        $('#goods_num').text(goods_num);
        $('#tnum').text(goods_num);
        $('#tprice').text(goods_total);
    }
    //增加或减少商品数量 结束
    function choose_area() {
        var area = $('#area_area').val();
        $.ajax({
            url: 'areaJson.html',
            type: 'post',
            data: 'level=' + area,
            success: function (rs) {
                $('#area_addr').html("");
                $('#area_addr').append('<option value="-2">请选择自提点</option>');
                var data = eval(rs);
                $.each(data, function (i, item) {
                    $('#area_addr').append('<option value=' + data[i].area_name + '>' + data[i].area_name + '</option>');
                })
            }
        });
    }
    function add() {
        //至少购买一件
        var goods_num = $('#tnum').text();
        if(parseInt(goods_num)==0){
            $.toast("至少购买一件商品！","text");
            return;
        }
        //（箱0，罐1）
        var order_type=$('#order_type').val();
        if(order_type==""){
            showTip("请选择订单类型！");return;
        }
        var goods_id = '${goods.goods_id}';
        var goods_spe = '${goods.goods_spe}';
        var spe_type = '${goods.spe_type}';
        var goods_name = '${goods.goods_name}';
        var goods_img = '${goods.goods_img}';
        var goods_price = '${goods.goods_price}';
        var goods_total = $('#tprice').text();
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
        var province = $('#province').text();
        var city = $('#city').text();
        var area = $('#area').text();
        //购买类型为实物才判断地址必填
        if(order_type==0) {
            if (addr_user == '' || addr_tel == '' || addr_name == '') {
                showTip('请填写有效的收货地址');
                return;
            }
            if (province == '') {
                showTip("收货地址填写有误，请重新编辑！");
                return;
            }
            if (city == '') {
                showTip("收货地址填写有误，请重新编辑！");
                return;
            }
            if (area == '') {
                showTip("收货地址填写有误，请重新编辑！");
                return;
            }
        }
        //备注
        var note = $('#note').val();
        if(order_type == 0){
            addr_name = addr_user + ' ' + addr_tel + ' ' + province + ' ' + city + ' ' + area + ' ' + addr_name;
        }else{
            addr_name = "";
        }
        $.ajax({
            url: 'orderInsert.html',
            type: 'get',
            data: 'goods_id=' + goods_id
            + '&goods_name=' + encodeURI(goods_name)
            + '&goods_spe=' + encodeURI(goods_spe)
            + '&spe_type=' +  spe_type
            + '&goods_img=' + goods_img
            + '&goods_price=' + goods_price
            + '&goods_num=' + goods_num
            + '&goods_total=' + goods_total
            + '&addr_name=' + encodeURI(addr_name)
            + '&memberCode=${member_code}'
            + '&note=' + encodeURI(note)
            + '&type=' + order_type,
            success: function (rs) {
                window.location.href = 'payOrder.html?order_id=' + rs.order_id;
            }
        })

    }
</script>

</body>
</html>
