$(function() {
	
/*************我想要手机商城我的订单 js*********************/
	$(".quanbu-title2 li").click(function(event) {
		var index1 = $(this).index();
		$(this).addClass('current').siblings().removeClass('current');
		$(".my-dd .my-info").eq(index1).show().siblings().hide();
	});

    $(".quanbu-title3 li").click(function(event) {
        var index1 = $(this).index();
        $(this).addClass('current').siblings().removeClass('current');
        $(".my-dd .my-info").eq(index1).show().siblings().hide();
    });

/*************我想要手机商城我的订单 js END*********************/

/*首页  切换*/
	$(".sy-ul1 li").click(function(event) {
		var index1 = $(this).index();
		$(this).addClass('current').siblings().removeClass('current');
		$(".sy-qie .sy-qieul").eq(index1).show().siblings().hide();
	});

/*首页  切换 END*/

/*页面滑动显示返回顶部 js*/
	$(window).scroll(function(event) {
		var tou=$(document).scrollTop();
		if(tou>"200")
		{
			$(".sy-fanhui").show();
		}
		else
		{
			$(".sy-fanhui").hide();
		}
	});
/*页面滑动显示返回顶部 js END*/

/*首页点击返回顶部 js*/
	$(".sy-fanhui").click(function(event) {
		$("body,html").stop().animate({"scrollTop":0},1000);
	});
/*首页点击返回顶部 js END*/

/*我想要手机商品详情 js*/
$(".spxq-ul2 li").click(function(event) {
	var index2 = $(this).index();
	$(this).addClass('current').siblings().removeClass('current');
	$(".spxq-box .spxq-k").eq(index2).show().siblings().hide();
});

/*我想要手机商品详情 js END*/

	/*上传头像  js*/
		$(".img1").change(function(){
			if($(this).val()){
				var objUrl = getObjectURL(this.files[0]);
				console.log("objUrl = "+objUrl);
				var objUrl = getObjectURL(this.files[0]);
				$(this).parent().before('<li><img src='+objUrl+' /></li>');
			}
		})
		function getObjectURL(file){
			var url = null; 
			if (window.createObjectURL!=undefined){ // basic
				url = window.createObjectURL(file);
			} else if (window.URL!=undefined){ // mozilla(firefox)
				url = window.URL.createObjectURL(file);
			} else if (window.webkitURL!=undefined){ // webkit or chrome
				url = window.webkitURL.createObjectURL(file);
			}
			return url;
		}
	/*上传头像  js END*/
	
	
	$(".tit-lid").click(function(){
		$(".tit-ul1").slideToggle(300);
	});
	
	
	/*我想要手机商城帮助反馈 js*/
	$(".bzfk-a1").click(function(event) {
		$(".bzft-tc").show();
	});
	$(".tc-yy1").click(function(event) {
		$(".bzft-tc").hide();
	});
	/*我想要手机商城帮助反馈 js END*/
	

	/*我想要手机商城我的订单详情 js*/
	$(".ddxx-zs").click(function(event) {
		var arr = $(this).text();
		if(arr=="展开"){
			$(this).text("收起");
			$(".ddxx-tab22").removeClass('ddxx-tab21');
		}else if(arr=="收起"){
			$(this).text("展开");
			$(".ddxx-tab22").addClass('ddxx-tab21');
		}
	});
	/*我想要手机商城我的订单详情 js END*/

});