<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>我的订单</title>
    <link rel="stylesheet" href="../weui/lib/weui.min.css">
    <link rel="stylesheet" href="../weui/css/jquery-weui.css">
    <script src="../weui/lib/jquery-2.1.4.js"></script>
    <script src="../weui/lib/fastclick.js"></script>
    <script src="../weui/js/jquery-weui.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/shoujisc.css">
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
    </style>
</head>

<body>
<div class="weui-tab">
    <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
            <div class="sjsc-title2">
                <h3 class="sjsc-t2l">我的订单</h3>
                <a href="center.html" class="sjsc-t2r"><img src="images/back.png" alt=""
                                                            style="width:20px;height: 20px;padding-top: 11px;padding-left: 5px"/></a>
            </div>
            <ul class="quanbu-title2">
                <li class="current" style="display: inline;"><a href="JavaScript:;">全部</a></li>
                <li style="display: inline;"><a href="JavaScript:;">待支付</a></li>
                <li style="display: inline;"><a href="JavaScript:;">待发货</a></li>
                <li style="display: inline;"><a href="JavaScript:;">已发货</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div class="my-dd">
                <div class="my-info">
                    <c:forEach items="${map['list']}" var="list" varStatus="s">
                        <div class="my-k1">
                            <ul class="my-p1">
                                <li class="my-spl f-l">${list.add_time}</li>
                                <li style="float: left;margin: 0 10px;color:#979797">
                                    订单类型:
                                    <c:if test="${list.order_type==1 || list.order_type==3 || list.order_type==5  || list.order_type==9  }">电子券</c:if>
                                    <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4|| list.order_type==6||list.order_type==7||list.order_type==8  }">实物</c:if>
                                </li>
                                <li class="my-spr f-r">
                                    <c:if test="${list.status==0 }">待支付</c:if>
                                    <c:if test="${list.status==1 }">待发货</c:if>
                                    <c:if test="${list.status==2 }">已发货</c:if>
                                    <c:if test="${list.status==-5 }">退款中</c:if>
                                    <c:if test="${list.status==-6 }">已关闭</c:if>
                                </li>
                                <div style="clear:both;"></div>
                            </ul>
                            <dl class="my-dl1">
                                <dt><a href="#"><img src="${list.goods_img}" style="width: 68px"></a></dt>
                                <dd>
                                    <h3><a href="#">${list.goods_name}</a></h3>

                                    <p class="my-dp1">价格：<span>￥${list.goods_total}</span></p>
                                    <div class="my-jdt">
                                        <p class="jdt-p1 f-l">数量：</p>
                                        <p class="jdt-shuzi f-l">
                                            <c:if test="${list.goods_num == ''}">
                                                1
                                            </c:if>
                                            <c:if test="${list.goods_num != ''}">
                                                ${list.goods_num}
                                            </c:if>
                                        </p>
                                        <div style="clear:both;"></div>
                                    </div>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <!-- 地址-->
                            <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4||list.order_type==7||list.order_type==8  }">
                            <div class="my-p2">
                                <span class="my-sp3 f-l">地址：${list.addr_name}</span>
                                <div style="clear:both;"></div>
                            </div>
                            </c:if>
                            <c:if test="${list.status==2 && list.order_type!=1 && list.order_type!=3 && list.order_type!=5 && list.order_type!=6 && list.order_type!=9 }">
                                <div class="my-p2">
                                    <span class="my-sp3 f-l">快递单号：${list.express_hm}</span>
                                    <span class="my-sp3 f-r">快递名称：${list.express_name}</span>
                                    <div style="clear:both;"></div>
                                </div>
                            </c:if>
                            <div class="my-p2">
                                <span class="my-sp3 f-l">订单号：${list.order_id}</span>
                                <c:if test="${list.status==0 }">
                                    <button class="my-btn1 f-r"
                                            onclick="window.location.href='payOrder.html?order_id=${list.order_id}'">
                                        &nbsp;支&nbsp;付&nbsp;<%--：￥${list.goods_total}--%>    </button>
                                </c:if>
                                <c:if test="${list.order_type!=4 && list.order_type!=5 && list.order_type!=6 && list.order_type!=7}">
                                    <button class="my-btn1 f-r">实付：￥${list.goods_total}</button>
                                </c:if>
                                <c:if test="${list.order_type ==4 || list.order_type==5 || list.order_type==6 || list.order_type==7}">
                                    <button class="my-btn1 f-r">实付：￥0</button>
                                </c:if>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="my-info" style="display:none;">
                    <c:forEach items="${map['list0']}" var="list" varStatus="s">
                        <div class="my-k1">
                            <ul class="my-p1">
                                <li class="my-spl f-l">${list.add_time}</li>
                                <li style="float: left;margin: 0 10px;color:#979797">
                                    订单类型:
                                    <c:if test="${list.order_type==1 || list.order_type==3 || list.order_type==5  || list.order_type==9  }">电子券</c:if>
                                    <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4|| list.order_type==6||list.order_type==7||list.order_type==8  }">实物</c:if>
                                </li>
                                <li class="my-spr f-r">
                                    <c:if test="${list.status==0 }">待支付</c:if>
                                    <c:if test="${list.status==1 }">待发货</c:if>
                                    <c:if test="${list.status==2 }">已发货</c:if>
                                </li>
                                <div style="clear:both;"></div>
                            </ul>
                            <dl class="my-dl1">
                                <dt><a href="#"><img src="${list.goods_img}" style="width: 68px"></a></dt>
                                <dd>
                                    <h3><a href="#">${list.goods_name}</a></h3>
                                    <p class="my-dp1">价格：<span>￥${list.goods_total}</span></p>
                                    <div class="my-jdt">
                                        <p class="jdt-p1 f-l">数量：</p>

                                        <p class="jdt-shuzi f-l">1</p>
                                        <div style="clear:both;"></div>
                                    </div>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <!-- 地址-->
                            <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4||list.order_type==7||list.order_type==8  }">
                                <div class="my-p2">
                                    <span class="my-sp3 f-l">地址：${list.addr_name}</span>
                                    <div style="clear:both;"></div>
                                </div>
                            </c:if>
                            <div class="my-p2">
                                <span class="my-sp3 f-l">订单号：${list.order_id}</span>
                                <button class="my-btn1 f-r"
                                        onclick="window.location.href='payOrder.html?order_id=${list.order_id}'">
                                    &nbsp;支&nbsp;付&nbsp;<%--：￥${list.goods_total}--%></button>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
                <div class="my-info" style="display:none;">
                    <c:forEach items="${map['list1']}" var="list" varStatus="s">
                        <div class="my-k1">
                            <ul class="my-p1">
                                <li class="my-spl f-l">${list.add_time}</li>
                                <li style="float: left;margin: 0 10px;color:#979797">
                                    订单类型:
                                    <c:if test="${list.order_type==1 || list.order_type==3 || list.order_type==5  || list.order_type==9  }">电子券</c:if>
                                    <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4|| list.order_type==6||list.order_type==7||list.order_type==8  }">实物</c:if>
                                </li>
                                <li class="my-spr f-r">
                                    <c:if test="${list.status==0 }">待支付</c:if>
                                    <c:if test="${list.status==1 }">待发货</c:if>
                                    <c:if test="${list.status==2 }">已发货</c:if>
                                </li>
                                <div style="clear:both;"></div>
                            </ul>
                            <dl class="my-dl1">
                                <dt><a href="#"><img src="${list.goods_img}" style="width: 68px"></a></dt>
                                <dd>
                                    <h3><a href="#">${list.goods_name}</a></h3>
                                    <p class="my-dp1">价格：<span>￥${list.goods_total}</span></p>
                                    <div class="my-jdt">
                                        <p class="jdt-p1 f-l">数量：</p>

                                        <p class="jdt-shuzi f-l">1</p>
                                        <div style="clear:both;"></div>
                                    </div>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <!-- 地址-->
                            <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4||list.order_type==7||list.order_type==8  }">
                                <div class="my-p2">
                                    <span class="my-sp3 f-l">地址：${list.addr_name}</span>
                                    <div style="clear:both;"></div>
                                </div>
                            </c:if>
                            <div class="my-p2">
                                <span class="my-sp3 f-l">订单号：${list.order_id}</span>
                                <c:if test="${list.order_type!=4 && list.order_type!=5 && list.order_type!=6 && list.order_type!=7}">
                                    <button class="my-btn1 f-r">实付：￥${list.goods_total}</button>
                                </c:if>
                                <c:if test="${list.order_type ==4 || list.order_type==5 || list.order_type==6 || list.order_type==7}">
                                    <button class="my-btn1 f-r">实付：￥0</button>
                                </c:if>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="my-info" style="display:none;">
                    <c:forEach items="${map['list2']}" var="list" varStatus="s">
                        <div class="my-k1">
                            <ul class="my-p1">
                                <li class="my-spl f-l">${list.add_time}</li>
                                <li style="float: left;margin: 0 10px;color:#979797">
                                    订单类型:
                                    <c:if test="${list.order_type==1 || list.order_type==3 || list.order_type==5  || list.order_type==9  }">电子券</c:if>
                                    <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4|| list.order_type==6||list.order_type==7||list.order_type==8  }">实物</c:if>
                                </li>
                                <li class="my-spr f-r">
                                    <c:if test="${list.status==0 }">待支付</c:if>
                                    <c:if test="${list.status==1 }">待发货</c:if>
                                    <c:if test="${list.status==2 }">已发货</c:if>
                                </li>
                                <div style="clear:both;"></div>
                            </ul>
                            <dl class="my-dl1">
                                <dt><a href="#"><img src="${list.goods_img}" style="width: 68px"></a></dt>
                                <dd>
                                    <h3><a href="#">${list.goods_name}</a></h3>
                                    <p class="my-dp1">价格：<span>￥${list.goods_total}</span></p>
                                    <div class="my-jdt">
                                        <p class="jdt-p1 f-l">数量：</p>

                                        <p class="jdt-shuzi f-l">${list.goods_num}</p>
                                        <div style="clear:both;"></div>
                                    </div>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <!-- 地址-->
                            <c:if test="${list.order_type==0 || list.order_type==2 ||list.order_type==4||list.order_type==7||list.order_type==8  }">
                                <div class="my-p2">
                                    <span class="my-sp3 f-l">地址：${list.addr_name}</span>
                                    <div style="clear:both;"></div>
                                </div>
                            </c:if>
                            <c:if test="${list.status==2 && list.order_type!=1 && list.order_type!=3 && list.order_type!=5 && list.order_type!=6 && list.order_type!=9}">
                                <div class="my-p2">
                                    <span class="my-sp3 f-l">快递单号：${list.express_hm}</span>
                                    <span class="my-sp3 f-r">快递名称：${list.express_name}</span>
                                    <div style="clear:both;"></div>
                                </div>
                            </c:if>
                            <div class="my-p2">
                                <span class="my-sp3 f-l">订单号：${list.order_id}</span>
                                <c:if test="${list.order_type!=4 && list.order_type!=5 && list.order_type!=6 && list.order_type!=7}">
                                    <button class="my-btn1 f-r">实付：￥${list.goods_total}</button>
                                </c:if>
                                <c:if test="${list.order_type ==4 || list.order_type==5 || list.order_type==6 || list.order_type==7}">
                                    <button class="my-btn1 f-r">实付：￥0</button>
                                </c:if>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
    <%--<div class="weui-tabbar" style="padding-bottom:10px">--%>
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



<script type="text/javascript">
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
                    window.location.reload();
                } else {
                    alert("失败，请联系客服！");
                }
            }
        })
    }
</script>
</body>
</html>
