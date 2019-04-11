<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html class="mdd-page">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <meta name="charset" content="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title></title>
	<meta http-equiv="Cache-Control" content="must-revalidate,no-cache">
    <link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/shoujisc.css">
	<link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/app_user.css">
    <link rel="stylesheet" type="text/css" href="css/showTip.css">
    <script type="text/javascript" src="js/showTip.js"></script>
    <script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js "></script>
    <script src="js/jquery.js"></script>
</head>
<body id="wrap">
<section class="content">
    <div class="user-info" style="background-color: #FF4444;">
        <div class="user-basic" style="vertical-align: center;height: 220px;">
        <c:forEach items="${membership}" var="list">
            <table style="padding:5px 5px 5px 5px">
                <tr>
                    <td width="30%" >
                        <div  style="vertical-align: center;">
                            <img href="#" onclick="modifyMembership(${list.addr_id})" src="${list.head_img}">
                            <div class="user-name">昵称：${list.realname}</div>
                        </div>
                    </td>
                    <td  width="*">
                        <div>
                            <p style="text-align: left">
                                    姓名：${list.username}
                            </p>
                            <p style="text-align: left">
                                    会员编号：${list.user_id}
                            </p>
                            <p style="text-align: left">
                                    加入时间：${list.add_time}
                            </p>
                            <p style="text-align: left">
                                    身份证：${list.idcardno}
                            </p>
                            <p style="text-align: left">
                                    手机号：${list.phone}
                            </p>
                            <p style="text-align: left">
                                    生日：${list.birthday}
                            </p>
                            <p style="text-align: left">
                                    邮箱：${list.email}
                            </p>
                            <p style="text-align: left">
                                    地址：${list.addr_name}
                            </p>
                            <p style="text-align: left">
                                    邀请人编号：${list.referee}
                            </p>
                        </div>
                    </td>
                </tr>

            </table>

         </c:forEach>
        </div>
    </div>
</section>
<jsp:include page="footer4.jsp"></jsp:include>
</body>
<script type="text/javascript">
    function modifyMembership(addr_id) {
        if (typeof(addr_id) == 'undefined') {
            addr_id = "";
        }
        window.location.href='modifyMembership.html?addr_id='+addr_id;
    }

</script>

</html>