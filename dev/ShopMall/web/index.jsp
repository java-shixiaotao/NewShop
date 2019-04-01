<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>脉米</title>
<!-- Stylesheets -->
<link href="res/css/bootstrap.css" rel="stylesheet">

<link href="res/css/style.css" rel="stylesheet">

<!-- FONT ICONS -->
<link rel="stylesheet" href="res/assets/elegant-icons/style.css">
<link rel="stylesheet" href="res/assets/et-line-font/style.css">
<!-- OWL CAROUSEL -->
 <link rel="stylesheet" href="res/css/owl.theme.css">
 <link rel="stylesheet" href="res/css/owl.carousel.css">

<!-- KENBURN SLIDE SHOW -->
<link rel="stylesheet" href="res/css/vegas.min.css">
<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link href="res/css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!--[if lt IE 9]><script src="res/js/respond.js"></script><![endif]-->
</head>

<body>
<div class="page-wrapper">

    <!-- Main Header -->
    <header class="main-header">
    	<div class="top-bar">
        	<div class="top-container">

            </div>
        </div>
    	<!-- Header Upper -->
    	<div class="header-upper">
        	<div class="auto-container clearfix">
            	<!-- Logo -->
                <div class="row logo col-md-8 col-sm-6 col-xs-6">
                    <a href="index.jsp"><img src="res/images/logo.jpg" alt="Ecology"></a>
                 </div>

                 <!--Nav Outer-->
                <div class="row nav-outer clearfix col-md-4 col-sm-6 col-xs-6">

                    <!-- Main Menu -->
                    <nav class="main-menu" style="width: 100%;">

                        <div >
                            <ul class="navigation" style="display:-webkit-box;">
                                <li><a href="index.jsp">主页</a></li>
                                <li><a href="about.jsp">关于我们</a></li>
                                <li><a href="contact.jsp">联系我们</a></li>
                            </ul>
                        </div>
                    </nav><!-- Main Menu End-->

                </div>

            </div>
        </div><!-- Header Top End -->

    </header><!--End Main Header -->




    <!--Main Slider-->
    <!-- KENBURN BG -->
    <section  class="home-section kenbarn" style="height: 360px;">
      <div class="image-wrap">
        <div class="kenburn-overlay">
          <div class="intro-section text-center">
            <h1 class="intro hs11-h1 text-white-5">RICE  MAIYIMI </h1>
          </div>
        </div>
      </div>
    </section>

            <%--<div class="sec-title text-center">--%>
                <%--<h2>五常大米是中国最好的大米</h2>--%>
                <%--<div class="text"></div>--%>
            <%--</div>--%>
    <!-- video -->
    <div class="jv-st-srv2">
        <div class="row">
            <div class="col-md-9">
                <!-- 五常大米生产基地实拍 -->
                <div class="videoText">五常脉米生产基地实拍</div>
                <div class="m">
                    <video id="my-video" class="video-js" controls preload="auto" style="width:100%;height: 100%;"
                           poster="res/video/video.png" data-setup="{}">
                        <source src="res/video/A.Bite.Of.China.II.03.mp4" type="video/mp4">
                        <p class="vjs-no-js"> To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a> </p>
                    </video>
                </div>
                <div class="m">
                    <video id="my-video2" class="video-js" controls preload="auto" style="width:100%;height: 100%;"
                           poster="res/video/video2.jpg" data-setup="{}">
                        <source src="res/video/20190218video2.mov" type="video/mp4">
                        <p class="vjs-no-js"> To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a> </p>
                    </video>
                </div>
                    <script src="res/js/video.min.js"></script>
                    <script type="text/javascript">
                        //设置中文
                        videojs.addLanguage('zh-CN', {
                            "Play": "播放",
                            "Pause": "暂停",
                            "Current Time": "当前时间",
                            "Duration": "时长",
                            "Remaining Time": "剩余时间",
                            "Stream Type": "媒体流类型",
                            "LIVE": "直播",
                            "Loaded": "加载完毕",
                            "Progress": "进度",
                            "Fullscreen": "全屏",
                            "Non-Fullscreen": "退出全屏",
                            "Mute": "静音",
                            "Unmute": "取消静音",
                            "Playback Rate": "播放速度",
                            "Subtitles": "字幕",
                            "subtitles off": "关闭字幕",
                            "Captions": "内嵌字幕",
                            "captions off": "关闭内嵌字幕",
                            "Chapters": "节目段落",
                            "Close Modal Dialog": "关闭弹窗",
                            "Descriptions": "描述",
                            "descriptions off": "关闭描述",
                            "Audio Track": "音轨",
                            "You aborted the media playback": "视频播放被终止",
                            "A network error caused the media download to fail part-way.": "网络错误导致视频下载中途失败。",
                            "The media could not be loaded, either because the server or network failed or because the format is not supported.": "视频因格式不支持或者服务器或网络的问题无法加载。",
                            "The media playback was aborted due to a corruption problem or because the media used features your browser did not support.": "由于视频文件损坏或是该视频使用了你的浏览器不支持的功能，播放终止。",
                            "No compatible source was found for this media.": "无法找到此视频兼容的源。",
                            "The media is encrypted and we do not have the keys to decrypt it.": "视频已加密，无法解密。",
                            "Play Video": "播放视频",
                            "Close": "关闭",
                            "Modal Window": "弹窗",
                            "This is a modal window": "这是一个弹窗",
                            "This modal can be closed by pressing the Escape key or activating the close button.": "可以按ESC按键或启用关闭按钮来关闭此弹窗。",
                            ", opens captions settings dialog": ", 开启标题设置弹窗",
                            ", opens subtitles settings dialog": ", 开启字幕设置弹窗",
                            ", opens descriptions settings dialog": ", 开启描述设置弹窗",
                            ", selected": ", 选择",
                            "captions settings": "字幕设定",
                            "Audio Player": "音频播放器",
                            "Video Player": "视频播放器",
                            "Replay": "重播",
                            "Progress Bar": "进度小节",
                            "Volume Level": "音量",
                            "subtitles settings": "字幕设定",
                            "descriptions settings": "描述设定",
                            "Text": "文字",
                            "White": "白",
                            "Black": "黑",
                            "Red": "红",
                            "Green": "绿",
                            "Blue": "蓝",
                            "Yellow": "黄",
                            "Magenta": "紫红",
                            "Cyan": "青",
                            "Background": "背景",
                            "Window": "视窗",
                            "Transparent": "透明",
                            "Semi-Transparent": "半透明",
                            "Opaque": "不透明",
                            "Font Size": "字体尺寸",
                            "Text Edge Style": "字体边缘样式",
                            "None": "无",
                            "Raised": "浮雕",
                            "Depressed": "压低",
                            "Uniform": "均匀",
                            "Dropshadow": "下阴影",
                            "Font Family": "字体库",
                            "Proportional Sans-Serif": "比例无细体",
                            "Monospace Sans-Serif": "单间隔无细体",
                            "Proportional Serif": "比例细体",
                            "Monospace Serif": "单间隔细体",
                            "Casual": "舒适",
                            "Script": "手写体",
                            "Small Caps": "小型大写字体",
                            "Reset": "重启",
                            "restore all settings to the default values": "恢复全部设定至预设值",
                            "Done": "完成",
                            "Caption Settings Dialog": "字幕设定视窗",
                            "Beginning of dialog window. Escape will cancel and close the window.": "开始对话视窗。离开会取消及关闭视窗",
                            "End of dialog window.": "结束对话视窗"
                        });
                        var myPlayer = videojs('my-video');
                        videojs("my-video").ready(function(){
                            var myPlayer = this;
                            myPlayer.play();
                        });
                        var myPlayer2 = videojs('my-video2');
                        videojs("my-video2").ready(function(){
                            var myPlayer2 = this;
                            myPlayer2.play();
                        });
                    </script>


            </div>
            <div class="col-md-3">
                <div class="text-center indexPic">
                    <a href="#"><img src="res/images/resource/4.png" alt=""></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="text-center indexPic">
                    <a href="#"><img src="res/images/resource/3.png" alt=""></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="text-center indexPic">
                    <a href="#"><img src="res/images/resource/2.png" alt=""></a>
                </div>
            </div>

            <div class="col-md-3">
                <div class=" text-center indexPic">
                    <a href="#"><img src="res/images/resource/1.png" alt=""></a>
                </div>
            </div>
        </div>
    </div>
    <!-- 地理标志-->
    <!--
    <div class="jv-st-srv">
        <div class="row">
            <div class="col-md-3">
                <div class="featured-item-2 text-center">
                    <a href="#"><img src="res/images/resource/4.png" alt=""></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="featured-item-2 text-center">
                    <a href="#"><img src="res/images/resource/3.png" alt=""></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="featured-item-2 text-center m-bot-40">
                    <a href="#"><img src="res/images/resource/2.png" alt=""></a>
                </div>
            </div>

            <div class="col-md-3">
                <div class="featured-item-2 text-center">
                    <a href="#"><img src="res/images/resource/1.png" alt=""></a>
                </div>
            </div>

        </div>

    </div>
-->


    <!--Main Footer-->
    <footer class="main-footer" style="background-image:url(res/images/background/footer-bg.jpg);">
        <!--Footer Bottom-->
    	<div class="footer-bottom">
            <div class="auto-container clearfix">
                <!--Copyright-->
                <div class="copyright text-center">Copyright &copy; 2019. wuchangmaimi.com  五常市天脉农业有限公司 <a href="http://wuchangmaimi.com/main/index.jsp" title="" target="_blank">后台管理</a></div>
            </div>
        </div>

    </footer>

</div>
<!--End pagewrapper-->


<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target=".main-header"><span class="fa fa-long-arrow-up"></span></div>

<script src="res/js/jquery.js"></script>
<script src="res/js/bootstrap.min.js"></script>
<script src="res/js/vegas.min.js"></script> <!-- Kenburn -->
<script src="res/js/kenburn.js"></script>
<script src="res/js/jquery.fancybox.pack.js"></script>
<script src="res/js/jquery.fancybox-media.js"></script>
<script src="res/js/owl.js"></script>
<script src="res/js/wow.js"></script>
<script src="res/js/owl.carousel.min.js"></script>
<script src="res/js/script.js"></script>
</body>
</html>
