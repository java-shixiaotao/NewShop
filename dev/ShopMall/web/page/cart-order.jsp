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
    <link rel="stylesheet" type="text/css" href="css/iosSelect.css">
    <script type="text/javascript" src="js/iosSelect.js"></script>
    <script type="text/javascript" src="js/showTip.js"></script>
    <script type="text/javascript" src="js/area.js"></script>
    <script type="text/javascript">
        $(function () {
            showStr("province", "city", "area");
        });
    </script>

</head>

<body id="wrap">

<div class="sjsc-title2">
    <h3 class="sjsc-t2l">订单</h3>
    <a href="cartList.html" class="sjsc-t2r"><img src="images/back.png" alt=""
                                                  style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
</div>
<input type="hidden" value="${addr_id}" id='addr_id'>

<dl class="drdd-info6" onclick="window.location.href='addrList.html?cps_id=${cps_id}&addr_id=${addr_id}'">
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


<input type="hidden" value="${tnum}" id='tnum'>
<input type="hidden" value="${tprice}" id='tprice'>
<input type="hidden" value="${reduction}" id='reduction_hidden'>
<input type="hidden" value="${reductionPrice}" id='reductionPrice_hidden'>
<input type="hidden" value="${acturalPrice}" id='acturalPrice_hidden'>
<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    商品信息
</div>
<c:forEach items="${goods}" var="list" varStatus="s">
    <input type="hidden" value="${list.goods_id}" name='goods_id'>
    <input type="hidden" value="${list.goods_name}" name='goods_name'>
    <input type="hidden" value="${list.goods_img}" name='goods_img'>
    <input type="hidden" value="${list.goods_num}" name='goods_num'>
    <input type="hidden" value="${list.goods_price}" name='goods_price'>
    <input type="hidden" value="${list.goods_spe}" name='goods_spe'>


    <div class="drdd-info3">
        <div class="drdd-if3tu f-l">
            <a href="#"><img src="${list.goods_img}" style="width: 43px"></a>
        </div>
        <h3 class="drdd-h31 f-l"><a href="#">${list.goods_name} x${list.goods_num}</a></h3>
            <p class="drdd-p1 f-r">￥${list.goods_price}</p>
        <div style="clear:both;"></div>
    </div>
</c:forEach>

<!-- <c:if test="${tprice!=0}">
     <div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
  	  优惠券
    </div>
    <div class="drdd-info4" onclick="window.location.href='cartCoupons.html?addr_id=${addr_id}'" >
    	<p>优惠券</p>
        <a >
        <c:forEach items="${cps}" var="cps">
        <input type="hidden" value="${cps.cps_id}" id='cps_id'>
        <input type="hidden" value="${cps.cps_name}" id='cps_name' >
        <input type="hidden" value="${cps.cps_price}" id='cps_price'>
        ${cps.cps_name} ￥${cps.cps_price}
        </c:forEach>
        <c:if test="${empty cps}">
        	${cpsCount}张可使用优惠券
        </c:if>
        
         <span> ></span></a>
        <div style="clear:both;"></div>
    </div>
    </c:if> -->

<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    订单类型
</div>
<div  id="showOrderType" class="drdd-info4" style="text-align: right">
    <p style="float:right">订单类型></p>
    <a href="#"  >
        <%--<select id="order_type"  style="border: 0">--%>
            <%--<option value="-1">请选择</option>--%>
            <%--<option value="0">实物</option>--%>
            <%--<option value="1">电子券</option>--%>
            <%--&lt;%&ndash;<option value="${fgt_price}" style="">免费自提点&lt;%&ndash; ：<c:forEach items="${userList}" var="userList">${userList.area_name}--%>
            <%--<input type="hidden" value="${userList.area_name}" id="area_name">--%>
            <%--</c:forEach> &ndash;%&gt;--%>
            <%--&lt;%&ndash;</option>&ndash;%&gt;--%>
        <%--</select>--%>
        </a>
    <div style="clear:both;"></div>
</div>
<input type="hidden" name="order_type" id="order_type" value="">
<!--<div id='deliver_schemetext' style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
  	  配送方式
    </div>
     <div class="drdd-info4" id='deliver_scheme'>
    	<p>配送方式</p>
    	<a href="#">
    	<select id="fgt_price" onchange="fgt()" style="border: 0">
    	<option value="-2">请选择</option>
    	<option value="-1">快递：
    	<c:if test="${fgt_price==0}">免运费</c:if>
    	<c:if test="${fgt_price!=0}">${fgt_price}元</c:if>
    	 </option>
            <%--<option value="${fgt_price}" style="">免费自提点<%-- ：<c:forEach items="${userList}" var="userList">${userList.area_name}
            <input type="hidden" value="${userList.area_name}" id="area_name">
            </c:forEach> --%>
            <%--</option>--%>
    	</select>
        <span>></span></a>
        <div style="clear:both;"></div>
    </div>

     <div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E;display:none;" id="zitidian-str">
  	  选择自提点
    </div>
    <div class="drdd-info2" style="display:none" id="zitidian-choose" >
    <select id="area_area"  style="border: 0;width: 20%" onchange="choose_area()">
    <option value="-2">请选择区</option>
    <c:forEach items="${areaList}" var="areaList">
    <option value="${areaList.area_id }">${areaList.area_name }</option>
    </c:forEach>
    </select>
    <select id="area_addr"  style="border: 0;width:75%">
    <option value="-2">请选择自提点</option>
    </select>
    </div>-->

<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    备注
</div>
<div class="drdd-info4">
    <p>备注：</p>

    <input type="text" placeholder="选填，填写您对卖家的要求" id='note' style="width:80%;border:0px">

    <div style="clear:both;"></div>
</div>
<div style="font-size: 12px;padding-left:5px; margin-top:13px;color: #A09E9E">
    订单价格
</div>
<div class="drdd-info2">

    <p class="p1 f-l">商品原价</p>
    <p class="p2 f-r"><span >￥${price}</span></p>

    <br>
    <p class="p1 f-l">商品折扣</p>
    <p class="p2 f-r"><span id="reductionStr" style="color: #f60">${reduction}</span></p>
    <br>
    <p class="p1 f-l">商品折扣后价格</p>
    <p class="p2 f-r"><span id="reductionPriceStr" style="color: #f60">￥${reductionPrice}</span></p>
    <br>
    <p class="p1 f-l">物流费用</p>
    <p class="p2 f-r"><span id="wuliu">￥${fgt_price}</span></p>
    <br>

    <div style="border-bottom:1px solid #DED9D9;">
        <c:forEach items="${cps}" var="cps">
            <p class="p1 f-l">优惠券抵扣</p>
            <p class="p2 f-r"><span id="">￥${cps.cps_price}</span></p>
            <br></c:forEach>
    </div>
    <p class="p1 f-l">共<span id="tnumStr">${tnum }</span>件商品</p>
    <p class="p2 f-r" style="display:none">原价总计：<span id="tpriceStr" style="color: #f60">￥${tprice}</span></p>
    <p class="p2 f-r">实付总计：<span id="tpriceStr_reduction" style="color: #f60">￥${acturalPrice}</span></p>
    <div style="clear:both;"></div>
</div>
<button class="drdd-btn" onclick="add()">确认付款</button>
<script type="text/javascript">

    function wtc() {
        var waystoconvert = $('#waystoconvert').val();
        if (waystoconvert == -1) { //选择自提点
            $('#deliver_schemetext').show();
            $('#deliver_scheme').show();
        }
        else {
            $('#deliver_schemetext').hide();
            $('#deliver_scheme').hide();
        }
    }

    function fgt() {
        var wuliu = '${fgt_price}';

        var tprice = '${tprice}';
        var fgt_price = $('#fgt_price').val();
        if (fgt_price != -2 && fgt_price != -1) { //选择自提点
            $('#zitidian-str').show();
            $('#zitidian-choose').show();
            wuliu = 0;
        }
        else {
            $('#zitidian-str').hide();
            $('#zitidian-choose').hide();
            fgt_price = 0;
        }

        $('#wuliu').text('￥' + wuliu);
        //	tprice = tprice - fgt_price;
        tprice = (parseFloat(tprice) - parseFloat(fgt_price)).toFixed(2);

        $('#tpriceStr').text('￥' + tprice);
        $('#tprice').val(tprice);

    }
</script>
<script type="text/javascript">
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
        var goods_id = "";
        var goods_name = "";
        var goods_img = "";
        var goods_price = "";
        var goods_num = "";
        var goods_spe="";
        var order_type=$('#order_type').val();
//    	var fgt_price= $('#fgt_price').val();
//    	if(fgt_price==-2){
//    		showTip("请选择配送方式！");return;
//    	}
        if(order_type==""){
            showTip("请选择订单类型！");return;
        }
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
        //未打折总价
        var goods_total = $('#tprice').val();
        //折扣力度
        var goods_reduction = $('#reduction_hidden').val();
        //打折商品总价
        var goods_reductionPrice = $('#reductionPrice_hidden').val();
        //实际支付总价 = 折扣商品价 + 邮费
        var goods_acturalPrice =$('#acturalPrice_hidden').val();
        var goods_total_num = $('#tnum').val();
        var cps_id = $('#cps_id').val();
        var cps_name = $('#cps_name').val();
        var cps_price = $('#cps_price').val();
        if (typeof(cps_name) == 'undefined') {
            cps_id = 0;
            cps_name = '';
            cps_price = 0;
        }
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

//    	if(fgt_price!=-1){
//    		var area_area = $('#area_area').val();
//    		var area_addr = $('#area_addr').val();
//    		if(area_area==-2){
//    			showTip('请选择区域');
//        		return ;
//    		}
//			if(area_addr==-2){
//				showTip('请选择自提点');
//	    		return ;
//    		}
//    		receive=$('#area_area').find("option:selected").text()+area_addr;
//
//    	}
        var province = $('#province').text();
        var city = $('#city').text();
        var area = $('#area').text();
        //购买类型为实物才判断地址必填
        if(order_type==0){
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
            addr_name = addr_user + ' ' + addr_tel + ' ' + province + ' ' + city + ' ' + area + ' ' + addr_name;
        }

        var note = $('#note').val();
        $.ajax({
            url: 'orderInsert.html',
            type: 'post',
            data: 'goods_id=' + goods_id
            + '&goods_name=' + encodeURI(goods_name)
            + '&goods_spe=' + encodeURI(goods_spe)
            + '&goods_img=' + goods_img
            + '&goods_price=' + goods_price
            + '&goods_num=' + goods_num
            + '&goods_total=' + goods_total
            //新增折扣部分 起
            + '&goods_reductionPrice=' + goods_reductionPrice
            + '&goods_acturalPrice=' + goods_acturalPrice
            + '&goods_reduction=' + goods_reduction
            //新增折扣部分 止
            + '&goods_total_num=' + goods_total_num
            + '&cps_id=' + cps_id
            + '&cps_name=' + encodeURI(cps_name)
            + '&cps_price=' + cps_price
            + '&addr_name=' + encodeURI(addr_name)
            + '&receive=' + encodeURI(receive) + '&note=' + encodeURI(note)
            + '&order_type=' + order_type
            + '&isDeleteCart=1',
            success: function (rs) {
                window.location.href = 'payOrder.html?order_id=' + rs.order_id;
            }
        })

    }
</script>

</body>
</html>
