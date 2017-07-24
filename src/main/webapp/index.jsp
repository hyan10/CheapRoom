<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>싸다방</title>
	<meta name="description" content="">
	<link rel="stylesheet" href="css/search.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- CSS FILES -->
	<link rel="stylesheet" type="text/css" href="css/vendor/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="css/style-fraction.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="css/fractionslider.css">
    <link rel="stylesheet" type="text/css" href="css/switcher.css" media="screen" />
	
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     
	<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
	 
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/searchDate.js"></script>	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script>
		function changeFormAction(checkbox){
		    document.getElementById("login-form").action = checkbox.value;
		    alert('changed action url');
		}
		
	</script>
</head>

<body>
<!--Start Header-->
<header id="header" class="clearfix">
    <!-- Nav Bar -->
    <div id="nav-bar" class="clearfix">
        <div class="container">
            <div class="row">
                <!-- Logo / Mobile Menu -->
				<div class="col-sm-2">
					<div id="logo">
						<h1>
							<a href="index.jsp"><img src="img/logo.png" alt="League" /></a>
						</h1>
					</div>
				</div>
		
				<!-- Navigation
                ================================================== -->
                <!-- Nav menu -->
                <jsp:include page="/include/loginModal.jsp"/>
                
                <c:choose>
	                <c:when test="${ empty loginUser}">
		                <a href="#" class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#login-modal">로그인</a>                		
	                </c:when>
					<c:otherwise>
						<c:if test="${ loginUser.type eq 'U' }">
							<jsp:include page="/include/userMenu.jsp"/>
			                		[${ loginUser.email}님 접속중]
								<a href="${ pageContext.request.contextPath }/user/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
		                </c:if>
						<c:if test="${ loginUser.type eq 'S' }">
						<jsp:include page="/include/adminMenu.jsp"/>
		                		[${ loginUser.email} 관리자님 접속중]
							<a href="${ pageContext.request.contextPath }/user/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
		                </c:if>
		                <c:if test="${ loginUser.type eq 'O' }">
		               		   <jsp:include page="/include/ownerMenu.jsp"/>
		                		[${ loginUser.email} 사업자님 접속중]
							<a href="${ pageContext.request.contextPath }/owner/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
		                </c:if>
					</c:otherwise>                
                </c:choose>
                </div>
            </div>
        </div>
    <!-- End Nav Bar -->
</header>
	<!--End Header-->
	<!--Start Slider-->
        <div class="slider-wrapper">       	
              <!-- <div class="col-sm-10">
              </div> -->
           	 <div class="col-md-6">
           	 	<jsp:include page="/include/searchForm.jsp"/>
           	 </div>
           	 <img src="img/fraction-slider/base-1.png" width="1920" height="450">
        </div>      
               

	<!--start footer-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4><span>About Us</span></h4>

					</div>
					<div class="widget_content">
						<p>Donec earum rerum hic tenetur ans sapiente delectus, ut aut reiciendise voluptat maiores alias consequaturs aut perferendis doloribus asperiores.</p>
						<ul class="contact-details-alt">
							<li><i class="fa fa-map-marker"></i> <p><strong>Address</strong>: #2021. Lorem Ipsum.</p></li>
							<li><i class="fa fa-user"></i> <p><strong>Phone</strong>: (123) 456-789-101</p></li>
							<li><i class="fa fa-envelope"></i> <p><strong>Email</strong>: <a href="#">mail@example.com</a></p></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4><span>Recent Posts</span></h4>
					</div>
					<div class="widget_content">
						<ul class="links">
							<li><i class="fa fa-caret-right"></i> <a href="#">Aenean commodo ligula eget dolor<span>November 07, 2014</span></a></li>
							<li><i class="fa fa-caret-right"></i> <a href="#">Temporibus autem quibusdam <span>November 05, 2014</span></a></li>
							<li><i class="fa fa-caret-right"></i> <a href="#">Debitis aut rerum saepe <span>November 03, 2014</span></a></li>
							<li><i class="fa fa-caret-right"></i> <a href="#">Et voluptates repudiandae <span>November 02, 2014</span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4><span>Twitter</span></h4>

					</div>
					<div class="widget_content">
						<ul class="tweet_list">
                            <li class="tweet_content item">
                                <i class="fa fa-twitter"></i>
                                <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
                                <span class="time">29 September 2013</span>
                            </li>
                            <li class="tweet_content item">
                                <i class="fa fa-twitter"></i>
                                <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
                                <span class="time">29 September 2013</span>
                            </li>
                            <li class="tweet_content item">
                                <i class="fa fa-twitter"></i>
                                <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
                                <span class="time">29 September 2013</span>
                            </li>
                        </ul>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4><span>Flickr Gallery</span></h4>

					</div>
					<div class="widget_content">
						<div class="flickr">
							<ul id="flickrFeed" class="flickr-feed"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--end footer-->

	<section class="footer_bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<p class="copyright">&copy; Copyright 2014 League | Powered by  <a href="http://www.jqueryrain.com/">jQuery Rain</a></p>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="footer_social">
						<ul class="footbot_social">
							<li><a class="fb" href="#." data-placement="top" data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
							<li><a class="twtr" href="#." data-placement="top" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a class="dribbble" href="#." data-placement="top" data-toggle="tooltip" title="Dribbble"><i class="fa fa-dribbble"></i></a></li>
							<li><a class="skype" href="#." data-placement="top" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
							<li><a class="rss" href="#." data-placement="top" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script type="text/javascript" src="js/vendor/jquery-1.10.2.min.js"></script>
	<script src="js/vendor/bootstrap.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/retina-1.1.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script> jQuery cookie
	<script type="text/javascript" src="js/styleswitch.js"></script> Style Colors Switcher
    <script src="js/jquery.fractionslider.js" type="text/javascript" charset="utf-8"></script>

    <script src="js/jquery.superfish.js"></script>
	<script src="js/jquery.meanmenu.js"></script>

	<script type="text/javascript" src="js/jquery.jcarousel.js"></script>
	<script type="text/javascript" src="js/jflickrfeed.js"></script>

	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/swipe.js"></script>

	<script src="js/main.js"></script>

	<!-- Start Style Switcher
	<div class="switcher"></div> -->
	<!-- End Style Switcher -->
    <script type="text/javascript"> /*-- Fraction Slider Parameters --*/
    $(window).load(function(){
    	
        $('.slider').fractionSlider({
            'fullWidth': 			true,
            'controls': 			true,
            'responsive': 			true,
            'dimensions': 			"1920,450",
            'increase': 			true,
            'pauseOnHover': 		true,
            'slideEndAnimation': 	true,
            'autoChange':           true
        });
        $(function() {         
            var $formLogin = $('#login-form');
            var $formOwnerRegister = $('#register-owner-form');
            var $formRegister = $('#register-user-form');
            var $divForms = $('#div-forms');
            var $modalAnimateTime = 300;
            var $msgAnimateTime = 150;
            var $msgShowTime = 2000;

            $("form").submit(function () {
                switch(this.id) {
                    case "login-form":
                        /* var $lg_username=$('#login_username').val();
                        var $lg_password=$('#login_password').val();
                        if ($lg_username == "ERROR") {
                            msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
                        } else {
                            msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
                        } */
                        return true;
                        break;
                    case "lost-form":
                        var $ls_email=$('#lost_email').val();
                        if ($ls_email == "ERROR") {
                            msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "error", "glyphicon-remove", "Send error");
                        } else {
                            msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "success", "glyphicon-ok", "Send OK");
                        }
                        return false;
                        break;
                    case "register-user-form":
                        var $rg_username=$('#register_username').val();
                        var $rg_email=$('#register_email').val();
                        var $rg_password=$('#register_password').val();
                        var $rg_phone=$('#register_phone').val();
                       	alert($rg_phone + " " + $rf_username);
                        /* if ($rg_username == "ERROR") {
                            msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "error", "glyphicon-remove", "Register error");
                        } else {
                            msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "success", "glyphicon-ok", "Register OK");
                        } */
                        return false;
                        break;
                    case "register-owner-form":
                        var $rg_username=$('#register_username').val();
                        var $rg_email=$('#register_email').val();
                        var $rg_password=$('#register_password').val();
                        var $rg_phone=$('#register_phone').val();
                       	alert($rg_phone + " " + $rf_username);
                        /* if ($rg_username == "ERROR") {
                            msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "error", "glyphicon-remove", "Register error");
                        } else {
                            msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "success", "glyphicon-ok", "Register OK");
                        } */
                        return false;
                        break;
                    default:
                        return false;
                }
                return false;
            });
            
            $('#login_register_btn').click( function () { modalAnimate($formLogin, $formRegister) });
            $('#login_owner_btn').click( function () { modalAnimate($formLogin, $formOwnerRegister); });
            $('#register_login_btn').click( function () { modalAnimate($formRegister, $formLogin); });
            $('#owner_login_btn').click( function () { modalAnimate($formOwnerRegister, $formLogin); });
            $('#lost_register_btn').click( function () { modalAnimate($formOwnerRegister, $formRegister); });
            $('#register_lost_btn').click( function () { modalAnimate($formRegister, $formOwnerRegister); });
            
            function modalAnimate ($oldForm, $newForm) {
                var $oldH = $oldForm.height();
                var $newH = $newForm.height();
                $divForms.css("height",$oldH);
                $oldForm.fadeToggle($modalAnimateTime, function(){
                    $divForms.animate({height: $newH}, $modalAnimateTime, function(){
                        $newForm.fadeToggle($modalAnimateTime);
                    });
                });
            }
            
            function msgFade ($msgId, $msgText) {
                $msgId.fadeOut($msgAnimateTime, function() {
                    $(this).text($msgText).fadeIn($msgAnimateTime);
                });
            }
            
            function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
                var $msgOld = $divTag.text();
                msgFade($textTag, $msgText);
                $divTag.addClass($divClass);
                $iconTag.removeClass("glyphicon-chevron-right");
                $iconTag.addClass($iconClass + " " + $divClass);
                setTimeout(function() {
                    msgFade($textTag, $msgOld);
                    $divTag.removeClass($divClass);
                    $iconTag.addClass("glyphicon-chevron-right");
                    $iconTag.removeClass($iconClass + " " + $divClass);
          		}, $msgShowTime);
            }
        });
    });
    </script>
</body>
</html>
