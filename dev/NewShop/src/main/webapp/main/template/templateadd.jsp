<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.admin.css" rel="stylesheet"
          type="text/css"/>
    <link href="lib/icheck/icheck.css" rel="stylesheet"
          type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css"
          rel="stylesheet" type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>

    <link rel="stylesheet" href="kindeditor/themes/default/default.css"/>
    <script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
    <script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
    <script>
        var editor;
        KindEditor.ready(function (K) {
            editor = K.create('textarea[name="content"]', {
                resizeType: 1,
                allowPreviewEmoticons: false,
                allowImageUpload: true,
                afterBlur: function () {
                    this.sync();
                },
                items: [
                    'source', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', '|', 'emoticons', 'image', 'multiimage', 'link', 'fullscreen']
            });
        });
    </script>
    <title>基本设置</title>

</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
    兑换券模板 <span class="c-gray en">&gt;</span>添加模板 <a
        class="btn btn-success radius r mr-20"
        style="line-height: 1.6em; margin-top: 3px"
        href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<br>
<div class="pd-20" style="width: 80%;border-bottom: solid 1px #ddd">

    <div class="row cl">
        <label class="form-label col-2" style="text-align: right;font-size:18px;"><strong>商品信息</strong></label>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-2" style="text-align: right">分类：</label>
        <div class="formControls col-10">
            <span style="font-size:20px;color:red;vertical-align:middle">*</span>
            <select id="fl_id" class="input-text" style="width: 80%" onclick="flselect()">
                <c:forEach items="${category}" var="ctg">
                    <c:if test="${list.ctg_id==ctg.ctg_id}">
                        <option value="${ctg.ctg_id}">${ctg.ctg_name }</option>
                    </c:if>
                </c:forEach>
                <c:forEach items="${category}" var="ctg">
                    <c:if test="${list.ctg_id!=ctg.ctg_id}">
                        <option value="${ctg.ctg_id}">${ctg.ctg_name }</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-2" style="text-align: right">商品：</label>
        <div class="formControls col-10">
            <span style="font-size:20px;color:red;vertical-align:middle">*</span>
            <select id="goods_id" class="input-text" style="width: 80%" onclick="goodsselect()">
                <option value="">请选择商品</option>
                <c:forEach items="${goods}" var="good">
                    <option img="${good.goods_img}" spe="${good.goods_spe}" price=" ${good.goods_price}"
                            value="${good.goods_id}">${good.goods_name }</option>
                </c:forEach>
            </select>
            <span  id='goods_namespan' style="font-size:14px;color:red;vertical-align:middle"></span>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-2" style="text-align: right">单价：</label>
        <div class="formControls col-10">
            <span style="font-size:20px;color:red;vertical-align:middle">*</span>
            <input type="text" id="goods_price"
                   placeholder="请填写价格" value="" class="input-text" style="width: 80%" onchange="goodspricechange()">
            <span  id='goods_pricespan' style="font-size:14px;color:red;vertical-align:middle"></span>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-2" style="text-align: right">数量：</label>
        <div class="formControls col-10">
            <span style="font-size:20px;color:red;vertical-align:middle">*</span>
            <input type="text" id="goods_number"
                   placeholder="商品数量" value="" class="input-text" style="width: 80%" onchange="goodsnumchange()">
            <span  id='goods_numberspan' style="font-size:14px;color:red;vertical-align:middle"></span>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-2" style="text-align: right">总金额：</label>
        <div class="formControls col-10">
            <span style="font-size:20px;color:red;vertical-align:middle">*</span>
            <input type="text" id="template_value"
                   placeholder="请填写总金额" value="" class="input-text" style="width: 80%" onchange="goodstemplatechange()">
            <span  id='template_valuespan' style="font-size:14px;color:red;vertical-align:middle"></span>
        </div>
    </div>
    <br>

    <div class="row cl">
        <div class="formControls col-4" style="text-align: right">
            <button onClick="addGoods()" id="butt"
                    class="btn btn-primary radius" type="button">
                <i class="Hui-iconfont">&#xe632;</i> 添加
            </button>
        </div>
        <div class="formControls col-4" style="text-align: center">
            <button onClick="history.go(-1);" class="btn btn-default radius"
                    type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;
            </button>
        </div>
    </div>

</div>
<div class="pd-20" style="width: 80%">

    <div class="row cl">
        <label class="form-label col-2" style="text-align: right;font-size:18px;"><strong>兑换券模板</strong></label>
    </div>
    <br>

    <div class="row cl">

        <label class="form-label col-2" style="text-align: right">名称：</label>
        <div class="formControls col-10">
            <span style="font-size:20px;color:red;vertical-align:middle">*</span>
            <input type="text" id="templateName"
                   placeholder="请填写名称" value="" class="input-text" style="width: 80%">
            <span  id='templateNamespan' style="font-size:14px;color:red;vertical-align:middle"></span>
        </div>
    </div>
    <br>
    <div class="mt-20">
        <table
                class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25px"><input type="checkbox" name="" value=""></th>
                <th width="15%">商品名称</th>
                <th width="15%">缩略图</th>
                <th width="10%">规格</th>
                <th width="15%">价格</th>
                <th width="10%">数量</th>
                <th width="15%">总金额</th>
                <th width="10%">操作</th>
            </tr>
            </thead>
            <tbody id="tabletbody">
            </tbody>
        </table>
    </div>
    <br>
    <div class="row cl">
        <div class="formControls col-4" style="text-align: right">
            <button onClick="modelAdd()" id="buttaction"
                    class="btn btn-primary radius" type="button">
                <i class="Hui-iconfont">&#xe632;</i> 提交
            </button>
        </div>
        <div class="formControls col-4" style="text-align: center">
            <button onClick="history.go(-1);" class="btn btn-default radius"
                    type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;
            </button>
        </div>
    </div>
</div>
<br><br>
<script type="text/javascript">

    //价格chenge事件
    function goodspricechange(){
        var price = $('#goods_price').val();
        var number = $('#goods_number').val();

        var regu = /^[0-9]\d*$/;
        var regup = /^\d+(\.{0,1}\d+){0,1}$/;
        if (price != "") {
            if (regup.test(price.trim())) {
                $('#goods_pricespan').text("");
            }else{
                $('#goods_pricespan').text("输入格式有误！");
                $('#template_value').val("");
                return;
            }
        }else{
            $('#goods_pricespan').text("必填");
            return;
        }

        if (number != "") {
            if (regu.test(number)) {
                var data=number * price;
                $('#template_value').val(data.toFixed(2));
                $('#goods_numberspan').text("");
                $('#template_valuespan').text("");
                return;
            }else{
                $('#goods_numberspan').text("输入格式有误！");
                $('#template_value').val("");
                return;
            }
        }
    }

    //数量触发chenge事件
    function goodsnumchange() {
        var price = $('#goods_price').val();
        var number = $('#goods_number').val();

        var regu = /^[0-9]\d*$/;
        var regup = /^\d+(\.{0,1}\d+){0,1}$/;

        if (number != "") {
            if (regu.test(number.trim())) {
                $('#goods_numberspan').text("");
            }else{
                $('#goods_numberspan').text("输入格式有误！");
                $('#template_value').val("");
                return;
            }
        }else{
            $('#goods_numberspan').text("必填");
            return;
        }
        if (number != "" && price != "") {
            if (regu.test(number.trim())&&regup.test(price.trim())) {
                var data=number * price;
                $('#template_value').val(data.toFixed(2));
                $('#goods_numberspan').text("");
                $('#template_valuespan').text("");
            }else{
                $('#goods_numberspan').text("输入格式有误！");
                $('#template_value').val("");
            }
        }
    }

    //总金额change事件
    function goodstemplatechange(){
        var regup = /^\d+(\.{0,1}\d+){0,1}$/;
        var template_value = $('#template_value').val();
        if (template_value != "") {
            if (regup.test(template_value.trim())) {
                $('#template_valuespan').text("");
            }else{
                $('#template_valuespan').text("输入格式有误！");
                $('#template_value').val("");
                return;
            }
        }else{
            $('#template_valuespan').text("必填");
            return;
        }
    }
    //商品点击触发事件
    function goodsselect() {
        var goodsid = $('#goods_id option:checked').attr("price");
        $('#goods_price').val(goodsid);
        $('#goods_namespan').text("");
        $('#goods_pricespan').text("");
        addGoodsClear()
    }

    //分类点击触发事件
    function flselect() {
        var fl_id = $('#fl_id').val();
        $('#goods_price').val("");
        $.ajax({
            url: 'goodsListByCtgid.html',
            type: 'post',
            dataType: "json",
            data: {'ctg_id': fl_id},
            success: function (rs) {
                var length = rs.goods.length
                $("#goods_id option").remove();
                $("#goods_id").append("<option value=''>请选择商品</option>");
                for (var i = 0; i < length; i++) {

                    $("#goods_id").append("<option spe='" + rs.goods[i].goods_spe + "' img='" + rs.goods[i].goods_img + "' price='" + rs.goods[i].goods_price + "' value='" + rs.goods[i].goods_id + "'>" + rs.goods[i].goods_name + "</option>");
                }
            }
        })
    }

    //提交事件
    function modelAdd() {
        var templateName = $('#templateName').val();
        var ln=$('#tabletbody tr').length;

        if(templateName== "undefined" || templateName == null || templateName == ""){
            $('#templateNamespan').text("必填");
        }else
        if(ln>0){
            var goods_id='';
            var goods_name='';
            var goods_spe='';
            var goods_img='';
            var goods_price='';
            var goods_num='';
            var goods_total_num=0;
            var goods_total=0;

            var ln=$('#tabletbody tr').length;
            var trs=$('#tabletbody tr');
            for(var i=0;i<ln;i++){
                var tbs=$(trs[i]).children();
                var goodsid=$(trs[i]).attr('id');
                var goodname=$(tbs[1]).text();
                var goodimg=$(tbs[2]).children().attr('src');
                var goodspe=$(tbs[3]).text();
                var goodprice=$(tbs[4]).text();
                var goodnum=$(tbs[5]).text();
                var goodtotal=$(tbs[6]).text();

                if(i==(ln-1)){
                    goods_id=goods_id+goodsid;
                    goods_name=goods_name+goodname;
                    goods_img=goods_img+goodimg;
                    goods_spe=goods_spe+goodspe;
                    goods_price=goods_price+goodprice;
                    goods_num=goods_num+goodnum;
                    goods_total_num=goods_total_num+parseInt(goodnum);
                    goods_total=goods_total+parseFloat(goodtotal);
                }else{
                    goods_id=goods_id+goodsid+",";
                    goods_name=goods_name+goodname+",";
                    goods_img=goods_img+goodimg+",";
                    goods_spe=goods_spe+goodspe+",";
                    goods_price=goods_price+goodprice+",";
                    goods_num=goods_num+goodnum+",";
                    goods_total_num=goods_total_num+parseInt(goodnum);
                    goods_total=goods_total+parseFloat(goodtotal);
                }
            }

            $.ajax({
                url: 'templateInsert.html',
                type: 'post',
                data: 'templateName=' + encodeURI(templateName) + '&goods_id='
                + goods_id + '&goods_name=' + goods_name + '&goods_img=' + goods_img
                + '&goods_num=' + goods_num+'&goods_spe='+goods_spe+'&goods_price='+goods_price
                +"&goods_total_num="+goods_total_num+"&goods_total="+goods_total,
                success: function (rs) {
                    if (rs == 1) {

                        alert("添加成功！");
                        window.location.href = document.referrer;
                    } else {

                        alert("添加失败！");
                    }
                }
            })
        }
    }

    //添加商品
    function addGoods() {
        var ln=$('#tabletbody tr').length;
        if(ln==1){
            alert("只能添加一种商品");
            return;
        }
        spanclear();
        var goods_name = $('#goods_id option:checked').text();
        var goods_price = $('#goods_price').val();
        var goods_id = $('#goods_id').val();
        var goods_img = $('#goods_id option:checked').attr("img");
        var goods_spe = $('#goods_id option:checked').attr("spe");
        var goods_number = $('#goods_number').val();
        var template_value = $('#template_value').val();

        if(goods_name== "请选择商品"){
            $('#goods_namespan').text("必填");
        }
        if(goods_price== "undefined" || goods_price == null || goods_price == ""){
            $('#goods_pricespan').text("必填");
        }
        if(goods_number== "undefined" || goods_number == null || goods_number == ""){
            $('#goods_numberspan').text("必填");
        }
        if(template_value== "undefined" || template_value == null || template_value == ""){
            $('#template_valuespan').text("必填");
        }
        if(goods_price!=""&&goods_number != ""&&template_value != ""){
            spanclear();
            $("#tabletbody").append("<tr id='"+goods_id+"' class='text-c'><td><input type='checkbox' value='1' name=''></td>" +
                "<td>" + goods_name + "</td>" +
                "<td><img alt='' src='" + goods_img + "' width='50' height='50'></td>" +
                "<td>" + goods_spe + "</td>" +
                "<td>" + goods_price + "</td>" +
                "<td>" + goods_number + "</td>" +
                "<td>" + (goods_price * goods_number).toFixed(2) + "</td>"+
                "<td> <button onClick='delgood("+goods_id+")' class='' type='button'>删除</button></td>"
            );
            addGoodsClear()
        }


    }

    //删除商品信息
    function delgood(goods_id){
        var  b = confirm('确定删除？');
        if(!b){
            return ;
        }
        $("#"+goods_id).remove();
    }

    //取消必填
    function spanclear(){
        $('#goods_namespan').text("");
        $('#goods_pricespan').text("");
        $('#goods_numberspan').text("");
        $('#template_valuespan').text("");
    }

    //清空数据
    function addGoodsClear(){
        var goods_number = $('#goods_number').val("");
        var template_value = $('#template_value').val("");
    }

</script>

</body>
</html>