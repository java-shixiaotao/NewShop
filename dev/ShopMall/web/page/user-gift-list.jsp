<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title></title>
    <link rel="stylesheet" href="../weui/lib/weui.min.css">
    <link rel="stylesheet" href="../weui/css/jquery-weui.css">
    <script src="../weui/lib/jquery-2.1.4.js"></script>
    <script src="../weui/lib/fastclick.js"></script>
    <script src="../weui/js/jquery-weui.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/shoujisc.css">
    <!-- 微信jssdk -->
    <script src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <script type="text/javascript" src="js/woxiangyao.js"></script>
    <style>
        body, html {
            height: 100%;
            -webkit-tap-highlight-color: transparent;
        }
        .weui-tabbar__label{
            font-size:18px;
            padding:5px;
        }
        .quanbu-title3 li{ float:left; width:25%; height:30px; line-height:30px; text-align:center;}
        /* weui */
        #weoverlay {
            background-image:url(images/weshare.png); background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;
            /*opacity: 0.5;  !* 透明度 *!*/
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            z-index: 100000; /* 此处的图层要大于页面 */
            display:none;
        }
        #allShareButtonDiv{
            display: flex;
            position: absolute;
        }
        #yesShareButtonDiv{
            display: flex;
            position: absolute;
        }
        #weShareButtonDiv{
            display: flex;
            position: absolute;
        }
        .weui-footer__links{
            width:100%;
            text-align: center
        }
    </style>
</head>

<body>
<div class="weui-tab">
    <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
            <div class="sjsc-title2">
                <h3 class="sjsc-t2l">我的电子券</h3>
                <a href="center.html" class="sjsc-t2r"><img src="images/back.png" alt=""
                                                            style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
            </div>
            <ul class="quanbu-title3">
                <c:if test="${map['isAll'] == 1}">
                    <li style="display: inline;"><a href="JavaScript:;">全部</a></li>
                    <li style="display: inline;"><a href="JavaScript:;">可兑换</a></li>
                    <li style="display: inline;"><a href="JavaScript:;">已兑换</a></li>
                    <li class="current" style="display: inline;"><a href="JavaScript:;">已分享</a></li>
                </c:if>
                <c:if test="${map['isAll'] != 1}">
                    <li class="current" style="display: inline;"><a href="JavaScript:;">全部</a></li>
                    <li style="display: inline;"><a href="JavaScript:;">可兑换</a></li>
                    <li style="display: inline;"><a href="JavaScript:;">已兑换</a></li>
                    <li style="display: inline;"><a href="JavaScript:;">已分享</a></li>
                </c:if>
                <div style="clear:both;"></div>
            </ul>
            <div class="my-dd">
                <div id="allPanel" class="my-info"
                    <c:if test="${map['isAll'] == 1}">
                        style = "display:none"
                    </c:if>
                    <c:if test="${map['isAll'] != 1}">
                        style = "display:block"
                    </c:if>
                >
                    <c:forEach items="${map['list']}" var="gift" varStatus="s">
                        <table style="width: 100%" id="swfAll_table_${gift.gift_id}">
                            <tr>
                                <c:if test="${gift.status==0 }">
                                    <td width="3%" style="text-align: center">
                                        <div>
                                            <input type="checkbox"  name="inputCheckbox_all" id="all_${gift.gift_id}_${s.index}"  />
                                        </div>
                                    </td>
                                </c:if>
                                <c:if test="${gift.status==1 }">
                                </c:if>
                                <td width="*">
                                    <c:set value="ord${s.index}" var="ord"></c:set>
                                    <div class="my-k1">
                                        <ul class="my-p1">
                                            <li class="my-spl f-l">${gift.create_time}</li>
                                            <li class="my-spr f-r">
                                                <c:if test="${gift.status==0 }">可兑换</c:if>
                                                <c:if test="${gift.status==1 }">已兑换</c:if>
                                                <c:if test="${gift.status==2 }">已分享</c:if>
                                            </li>
                                            <div style="clear:both;"></div>
                                        </ul>
                                        <dl class="my-dl1">
                                            <dt><a href="#"><img src="${gift.goods_img}" style="width: 68px"></a></dt>
                                            <dd>
                                                <h3><a href="#" class="all_goods_${gift.gift_id}_${s.index}" >${gift.goods_name}</a></h3>
                                                <p class="my-dp1">价格：<span>￥${gift.goods_price}</span></p>
                                                <div class="my-jdt">
                                                    <p class="jdt-p1 f-l">数量：</p>
                                                    <p class="jdt-shuzi f-l">${gift.goods_num}</p>
                                                    <div style="clear:both;"></div>
                                                </div>
                                                <div class="my-jdt">
                                                    <p class="jdt-p1 f-l">规格：</p>
                                                    <p id="all_goods_spe_${gift.gift_id}" class="jdt-shuzi f-l">${gift.goods_spe}</p>
                                                    <div style="clear:both;"></div>
                                                </div>
                                            </dd>
                                            <div style="clear:both;"></div>
                                        </dl>

                                        <div class="my-p2">
                                            <span class="my-sp3 f-l">券号：<span id="swfAll_value_${s.index}">${gift.gift_id}</span></span>
                                            <c:if test="${gift.status==0 }">
                                                <button class="my-btn1 f-r"
                                                        onclick="window.location.href='direct_conversionList.html?share_id=${gift.gift_id}'">
                                                    兑&nbsp;换
                                                </button>
                                            </c:if>
                                            <div style="clear:both;"></div>
                                        </div>
                                    </div>
                                </td></tr>
                        </table>
                    </c:forEach>
                    <!-- 分享打包按钮 -->
                    <div class="weui-footer weui-footer_fixed-bottom" id="allShareButtonDiv" style="width:100%">
                        <table width="100%">
                            <tr>
                                <td width="20%" >

                                </td>
                                <td width="*" style="text-align: center">
                                    <a href="#" onclick="javascript:directShare('all');" style="margin:0 auto;" class="weui-btn weui-btn_mini weui-btn_primary">批量兑换</a>
                                    <a href="#" onclick="javascript:sharePackage('all');" style="margin:0 auto;" class="weui-btn weui-btn_mini weui-btn_primary">打包分享</a>
                                </td>
                                <td width="20%" >
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="yesPanel" class="my-info" style="display:none;">
                    <c:forEach items="${map['list0']}" var="gift" varStatus="s">
                        <table style="width: 100%" id="swfYes_table_${gift.gift_id}">
                            <tr>
                                <td width="3%" style="text-align: center">
                                    <div>
                                        <input type="checkbox"  name="inputCheckbox_yes" id="yes_${gift.gift_id}_${s.index}" />
                                    </div>
                                </td>
                                <td width="*">
                                    <c:set value="ord0${s.index}" var="ord"></c:set>
                                    <div class="my-k1">
                                        <ul class="my-p1">
                                            <li class="my-spl f-l">${gift.create_time}</li>
                                            <li class="my-spr f-r">
                                                可兑换
                                            </li>
                                            <div style="clear:both;"></div>
                                        </ul>

                                        <dl class="my-dl1">
                                            <dt><a href="#"><img src="${gift.goods_img}" style="width: 68px"></a></dt>
                                            <dd>
                                                <h3><a href="#" class="yes_goods_${gift.gift_id}_${s.index}" >${gift.goods_name}</a></h3>
                                                <p class="my-dp1">价格：<span>￥${gift.goods_price}</span></p>
                                                <div class="my-jdt">
                                                    <p class="jdt-p1 f-l">数量：</p>
                                                    <p class="jdt-shuzi f-l">${gift.goods_num}</p>
                                                    <div style="clear:both;"></div>
                                                </div>
                                                <div class="my-jdt">
                                                    <p class="jdt-p1 f-l">规格：</p>
                                                    <p class="jdt-shuzi f-l">${gift.goods_spe}</p>
                                                    <div style="clear:both;"></div>
                                                </div>
                                            </dd>
                                            <div style="clear:both;"></div>
                                        </dl>

                                        <div class="my-p2">
                                            <span class="my-sp3 f-l">券号：<span id="swfYes_value_${s.index}">${gift.gift_id}</span></span>
                                            <button class="my-btn1 f-r"
                                                    onclick="window.location.href='direct_conversionList.html?share_id=${gift.gift_id}'">
                                                兑&nbsp;换
                                            </button>
                                            <div style="clear:both;"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </c:forEach>
                    <!-- 分享打包按钮 -->
                    <div id="yesShareButtonDiv" class="weui-footer weui-footer_fixed-bottom">
                        <table width="100%">
                            <tr>
                                <td width="20%" >

                                </td>
                                <td width="*" style="text-align: center">
                                    <a href="#" onclick="javascript:directShare('yes');" style="margin:0 auto;" class="weui-btn weui-btn_mini weui-btn_primary">批量兑换</a>
                                    <a href="#" onclick="javascript:sharePackage('yes');" style="margin:0 auto;" class="weui-btn weui-btn_mini weui-btn_primary">打包分享</a>
                                </td>
                                <td width="20%" >
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="noPanel" class="my-info" style="display:none;">
                    <c:forEach items="${map['list1']}" var="gift" varStatus="s">
                        <c:set value="ord1${s.index}" var="ord"></c:set>
                        <div class="my-k1">
                            <ul class="my-p1">
                                <li class="my-spl f-l">${gift.create_time}</li>
                                <li class="my-spr f-r">
                                    已兑换
                                </li>
                                <div style="clear:both;"></div>
                            </ul>

                            <dl class="my-dl1">
                                <dt><a href="#"><img src="${gift.goods_img}" style="width: 68px"></a></dt>
                                <dd>
                                    <h3><a href="#">${gift.goods_name}</a></h3>
                                    <p class="my-dp1">价格：<span>￥${gift.goods_price}</span></p>
                                    <div class="my-jdt">
                                        <p class="jdt-p1 f-l">数量：</p>
                                        <p class="jdt-shuzi f-l">${gift.goods_num}</p>
                                        <div style="clear:both;"></div>
                                    </div>
                                    <div class="my-jdt">
                                        <p class="jdt-p1 f-l">规格：</p>
                                        <p class="jdt-shuzi f-l">${gift.goods_spe}</p>
                                        <div style="clear:both;"></div>
                                    </div>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>

                            <div class="my-p2">
                                <span class="my-sp3 f-l">券号：${gift.gift_id}</span>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div id="packagePanel" class="my-info"
                        <c:if test="${map['isAll'] != 1}">
                            style = "display:none"
                        </c:if>
                        <c:if test="${map['isAll'] == 1}">
                            style = "display:block"
                        </c:if>
                >
                    <c:forEach items="${map['list2']}" var="gift" varStatus="s">
                        <table style="width: 100%" id="package_table_${gift.gift_id}">
                            <tr>
                                <c:if test="${gift.is_exchange==0 }">
                                    <td width="3%" style="text-align: center">
                                        <div>
                                            <input onclick="shareWithFriendsWe()" type="radio"  name="inputRadio" id="package_radio_${gift.gift_id}"  />
                                        </div>
                                    </td>
                                </c:if>
                                <td width="*">
                                    <div class="my-k1">
                                        <ul class="my-p1">
                                            <li class="my-spl f-l">${gift.create_time}</li>
                                            <li class="my-spr f-r">
                                                <c:if test="${gift.is_exchange==0 &&  gift.is_validate ==1}">未兑换</c:if>
                                                <c:if test="${gift.is_exchange==1 }">已兑换</c:if>
                                                <c:if test="${gift.is_validate ==0}">已撤销</c:if>
                                            </li>
                                            <div style="clear:both;"></div>
                                        </ul>
                                        <dl class="my-dl1">
                                            <dt><a href="#"><img id="package_goods_img_${gift.gift_id}" src="${gift.goods_img}" style="width: 68px"></a></dt>
                                            <dd>
                                                <h3><a href="#" id="package_goods_name_${gift.gift_id}" >${gift.goods_name}</a></h3>
                                                <div class="my-jdt">
                                                    <p class="jdt-p1 f-l">数量：</p>
                                                    <p id="package_goods_num_${gift.gift_id}" class="jdt-shuzi f-l">${gift.goods_num}</p>
                                                    <div style="clear:both;"></div>
                                                </div>
                                                <div class="my-jdt">
                                                    <p class="jdt-p1 f-l">规格：</p>
                                                    <p id="package_goods_spe_${gift.gift_id}" class="jdt-shuzi f-l">${gift.goods_spe}</p>
                                                    <div style="clear:both;"></div>
                                                </div>
                                            </dd>
                                            <div style="clear:both;"></div>
                                        </dl>
                                        <div class="my-p2">
                                            <%--<span class="my-sp3 f-l">券号：<span id="package_cps_${s.index}">${gift.gift_id}</span></span>--%>
                                                <c:if test="${gift.is_exchange==0 &&  gift.is_validate ==1}">
                                                    <button class="my-btn1 f-r"
                                                            onclick="cancelGiftPackage('${gift.gift_id}')">
                                                        &nbsp;撤销分享&nbsp;
                                                    </button>
                                                </c:if>
                                            <div style="clear:both;"></div>
                                        </div>
                                    </div>
                                </td></tr>
                        </table>
                    </c:forEach>
                    <!-- 分享打包按钮 -->
                    <div class="weui-footer weui-footer_fixed-bottom" id="weShareButtonDiv">
                        <p class="weui-footer__links">
                            <a href="#" onclick="javascript:shareWithFriendsWeBackground();" class="weui-btn weui-btn_primary" style="width:90%">微信好友分享</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<div id="footerWeui" class="weui-tabbar" style="padding-bottom:10px">--%>
        <%--<!-- 底部菜单 -->--%>
        <%--<a  id="openGoumaiP" onclick="window.location.href='index.html?showGoumai=true'"  href="#" class="weui-tabbar__item">--%>
            <%--&lt;%&ndash;<div class="weui-tabbar__icon">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<img src="images/sjsc-02.gif" alt="">&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--<p class="weui-tabbar__label" style="border-right:1px solid grey">--%>
                <%--购&nbsp;买--%>
            <%--</p>--%>
        <%--</a>--%>
        <%--<a href="center.html" class="weui-tabbar__item weui-bar__item--on">--%>
            <%--&lt;%&ndash;<div class="weui-tabbar__icon">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<img src="images/sjsc-18.png" alt="">&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--<p class="weui-tabbar__label">我&nbsp;的</p>--%>
        <%--</a>--%>
    <%--</div>--%>
</div>




<input type="hidden" id="appId" />
<input type="hidden" id="timestamp" />
<input type="hidden" id="nonceStr" />
<input type="hidden" id="signature" />
<input type="hidden" id="linkTitle" />
<div id="weoverlay" onclick="closeWeBackground()"></div>

<script type="text/javascript">
    $(document).ready(function(){
        $.toast.prototype.defaults.duration = 800;
        //微信分享接口准备
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
                $("#appId").val(appId);
                $("#timestamp").val(timestamp);
                $("#nonceStr").val(nonceStr);
                $("#signature").val(signature);
                $("#linkTitle").val(linkTitle);
            }
        });
        //打包按钮样式准备
//        var footerWeuiHeight = parseInt($("#footerWeui").css("height").replace("px","")) ;
//        $("#allShareButtonDiv").css({
//                    bottom: footerWeuiHeight +"px"
//                });
//        $("#yesShareButtonDiv").css({
//                    bottom: footerWeuiHeight +"px"
//                });
//        $("#weShareButtonDiv").css({
//                    bottom: footerWeuiHeight +"px"
//                });
        //各个内容内容padding-bottom
//        $("#allPanel").css({
//            "padding-bottom": (footerWeuiHeight) +"px"
//        });
//        $("#yesPanel").css({
//            "padding-bottom": (footerWeuiHeight) +"px"
//        });
//        $("#packagePanel").css({
//            "padding-bottom": (footerWeuiHeight) +"px"
//        });
    })

    function send(order_id) {
        var b = confirm('确定退款吗？');
        if (!b) {
            return;
        }
        $.ajax({
            url: 'orderUpdate.html',
            type: 'post',
            data: 'order_id=' + order_id + '&status=-5',
            success: function (rs) {
                if (rs == 1) {
                    alert("提交成功，我们将3个工作日内给您退款！");
                    location.reload();
                } else {
                    alert("失败，请联系客服！");
                }
            }
        })
    }

    //微信分享部分
    function shareWithFriendsWe() {
        //分享包码
        var gift_id = "";
        var tempImgUrl = "";
        //商品描述
        var tempDesc = "";
        $("input:radio[name='inputRadio']").each(function(i){
             var tempStatus = $(this).is(':checked');
             if(tempStatus == true){
                 gift_id = $(this).attr("id").split("_")[2];
                 tempDesc = $("#package_goods_name_"+gift_id).text()+":"+ $("#package_goods_num_"+gift_id).text()+$("#package_goods_spe_"+gift_id).text();
                 tempImgUrl = $("#package_goods_img_"+gift_id).attr("src");
                 return false;
             }
        });
        if(gift_id==""){
            $.toast("请选择一项进行分享！","text");
            return;
        }
        var appId = $("#appId").val();
        var timestamp = $("#timestamp").val();
        var nonceStr = $("#nonceStr").val();
        var linkTitle = $("#linkTitle").val();
        var signature = $("#signature").val();
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
            jsApiList: ['updateAppMessageShareData','updateTimelineShareData','onMenuShareAppMessage','onMenuShareTimeline' //分享给好友
             ]
        });
        wx.error(function (res) {
//            alert("出错了：" + res.errMsg);//这个地方的好处就是wx.config配置错误，会弹出窗口哪里错误，然后根据微信文档查询即可。
            alert("页面正在加载，请稍后重新选择！");
            $("input:radio[name='inputRadio']").each(function(i){
                        $(this).attr("checked",false);
            });
        });
        wx.ready(function () {
            var tempLink = linkTitle+"/page/conversionList.html?share_id="+gift_id;
            var shareData = {
                title: '商品电子券',  //标题
                desc: tempDesc,//简介，这里请特别注意是要去除html
                link: tempLink ,
                imgUrl: linkTitle+tempImgUrl,
                success: function () {
                    // 用户确认分享后执行的回调函数
//                    $.toast("分享成功","text");
                    closeWeBackground();
                }
//                imgUrl: 'http://p.nanrenwo.net/uploads/allimg/181130/8504-1Q130153204.png'
            };
//            wx.updateAppMessageShareData(shareData);
//            wx.updateTimelineShareData(shareData);
            wx.onMenuShareAppMessage(shareData);
            wx.onMenuShareTimeline(shareData);
//                wx.updateAppMessageShareData({
//                    title: '米城公众号', // 商品名
//                    desc: '请关注米城公众号', // 描述
//                    link: '', // 商品购买地址
//                    imgUrl: ''
//
//                },function(res) {
//                    //这里是回调函数
//                });
//            wx.onMenuShareAppMessage({
//                title: '米城公众号', // 分享标题
//                desc: '请关注米城公众号', // 分享描述
//                link: '70895472.800.si/reply.html', // 分享链接
//                imgUrl: '', // 分享图标
//                type: 'link', // 分享类型,music、video或link，不填默认为link
//                dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
//                success: function () {
//                    // 用户确认分享后执行的回调函数
//                    alert("分享成功");
//                },
//                cancel: function () {
//                    // 用户取消分享后执行的回调函数
//                }
//            });
        });
    }
    //分享打包
    function sharePackage(type) {
        //取出所有选中的checkbox，并读取giftid，组成串传给后台，生成打包数据
        //只能选择试吃或者正式装打包，不能混合打包
        var gift_id = "";
        var spe_first = "";
        var spe_flag = true;
        if(type=="all"){
            $("input:checkbox[name='inputCheckbox_all']").each(function(i){
                var tempStatus = $(this).is(':checked');
                if(tempStatus==true){
                    var tempId = $(this).attr("id").split("_")[1];
                    var tempSpe = $("#all_goods_spe_"+tempId).text();
                    gift_id += tempId + ",";
                    if(spe_first==""){
                        spe_first = tempSpe;
                    }else{
                        if(spe_first != tempSpe){
                            spe_flag= false;
                        }
                    }
                }
            });
        }else{
            $("input:checkbox[name='inputCheckbox_yes']").each(function(i){
                var tempStatus = $(this).is(':checked');
                if(tempStatus==true){
                    var tempId = $(this).attr("id").split("_")[1];
                    var tempSpe = $("#all_goods_spe_"+tempId).text();
                    gift_id += tempId + ",";
                    if(spe_first==""){
                        spe_first = tempSpe;
                    }else{
                        if(spe_first != tempSpe){
                            spe_flag= false;
                        }
                    }
                }
            });
        }
        gift_id = gift_id.substr(0, gift_id.length - 1);
        if(gift_id==""){
            $.toast("请选择需要打包的电子券！","text");
            return;
        }
        if(spe_flag== false){
            $.toast("只能选择正式装或者试吃装一种类型进行打包！","text");
            return;
        }
        $.ajax({
            url: 'giftPackage.html',
            type: 'get',
            data: 'gift_ids=' + gift_id,
            success: function (rs) {
                //已打包的div添加内容
                $.toast("打包成功","text");
                window.location.href = "userGiftList.html?isAll=1";
            }
        });
    }
    //点击微信分享好友遮罩层
    function shareWithFriendsWeBackground(){
        $("#weoverlay").show();
    }
    function closeWeBackground(){
        $("#weoverlay").hide();
    }
    //撤销分享
    function cancelGiftPackage(share_id){
        $.ajax({
            url: 'cancelGiftPackage.html',
            type: 'get',
            data: 'shareID=' + share_id,
            success: function (rs) {
                //已打包的div添加内容
                if(rs.code == 'success'){
                    $.toast(rs.msg,"text");
                    window.location.href = "userGiftList.html?isAll=1";
                }else{
                    $.toast(rs.msg,"text");
                }
            }
        });
    }
    function directShare(type){
        var gift_id = "";
        var spe_first = "";
        var spe_flag = true;
        if(type=="all"){
            $("input:checkbox[name='inputCheckbox_all']").each(function(i){
                var tempStatus = $(this).is(':checked');
                if(tempStatus==true){
                    var tempId = $(this).attr("id").split("_")[1];
                    var tempSpe = $("#all_goods_spe_"+tempId).text();
                    gift_id += tempId + ",";
                    if(spe_first==""){
                        spe_first = tempSpe;
                    }else{
                        if(spe_first != tempSpe){
                            spe_flag= false;
                        }
                    }
                }
            });
        }else{
            $("input:checkbox[name='inputCheckbox_yes']").each(function(i){
                var tempStatus = $(this).is(':checked');
                if(tempStatus==true){
                    var tempId = $(this).attr("id").split("_")[1];
                    var tempSpe = $("#all_goods_spe_"+tempId).text();
                    gift_id += tempId + ",";
                    if(spe_first==""){
                        spe_first = tempSpe;
                    }else{
                        if(spe_first != tempSpe){
                            spe_flag= false;
                        }
                    }
                }
            });
        }
        gift_id = gift_id.substr(0, gift_id.length - 1);
        if(gift_id==""){
            $.toast("请选择需要打包的电子券！","text");
            return;
        }
        if(spe_flag== false){
            $.toast("只能选择正式装或者试吃装一种类型进行打包！","text");
            return;
        }
        window.location.href = "direct_conversionList.html?share_id=" + gift_id;
    }
</script>
</body>
</html>
