
$(function(){

//焦点图                 手机是兼容的  只是在pc上面不兼容IE8
TouchSlide({ 
	slideCell:"#ban1",   /*给最大的盒子取id名  要改的 */
	mainCell:".sy-ul",    /* 只是图片  要改的 */
	titCell:".sy-ol",   /*只是点点  要改的  */
	effect:"leftLoop",     /*这是方向  只向左  */
	interTime:5000,    /*时间*/
	autoPage:true,     //自动分页
	autoPlay:true      //自动播放
});

TouchSlide({ 
	slideCell:"#ban11",   /*给最大的盒子取id名  要改的 */
	mainCell:".sy-ul1",    /* 只是图片  要改的 */
	titCell:".sy-ol1",   /*只是点点  要改的  */
	effect:"leftLoop",     /*这是方向  只向左  */
	interTime:5000,    /*时间*/
	autoPage:true,     //自动分页
	autoPlay:true      //自动播放
});


});

