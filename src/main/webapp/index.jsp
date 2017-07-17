<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>싸다방</title>
	<meta name="description" content="">

	<!-- CSS FILES -->
	<link rel="stylesheet" type="text/css" href="css/vendor/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="css/style-fraction.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="css/fractionslider.css">

    <link rel="stylesheet" type="text/css" href="css/switcher.css" media="screen" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--Start Header-->
<header id="header" class="clearfix">
    <h3>ㅎ</h3>
    <!-- Nav Bar -->
    <div id="nav-bar" class="clearfix">
        <div class="container">
            <div class="row">
                <!-- Logo / Mobile Menu -->
                <div class="col-sm-2">
                                            <div id="logo">
                        <h1><a href="index.html"><img src="img/logo.png" alt="League" /></a></h1>
                    </div>
                </div>

                <!-- Navigation
                ================================================== -->
                <!-- Nav menu -->
                <jsp:include page="/include/userMenu.jsp"/>
                <!-- Nav menu end -->
            </div>
        </div>
    </div>
    <!-- End Nav Bar -->
</header>
	<!--End Header-->
	<!--Start Slider-->
        <div class="slider-wrapper">
        	
            <div class="slider">
                <div class="fs_loader"></div>
                <div class="slide">
                    <img src="img/fraction-slider/NEW-6.png" data-in="fade" data-delay="20" data-out="fade" width="1920" height="450">       <!--1- slide background-->
                </div>
                 <div class="col-sm-7">
                	 <jsp:include page="/include/search.jsp"/>
                 </div>
            	
                
            <!--     <div class="slide">
                    <img src="img/fraction-slider/fraction_2.png" data-in="fade" data-delay="" data-out="fade" width="1920" height="450">     2- slide background

                    <img src="img/fraction-slider/slider-boy.png" width="600" height="600" data-position="8,1240" data-in="bottomLeft" data-delay="500" data-out="fade" style="width:auto; height:auto">

                    <p 	class="claim light-pink" data-position="40,230" data-in="top"  data-out="left" data-delay="1800" data-ease-in="easeOutBounce">the Rain template design</p>

                    <p 	class="teaser turky small" 	data-position="150,230" data-in="left" data-out="left" data-delay="5500">unlimited elements</p>

                    <p 	class="teaser turky small" 	data-position="210,230"  data-in="left" data-out="left" data-delay="6500">many transitions</p>

                    <p 	class="teaser turky small" 	data-position="270,230" data-in="left" data-out="left" data-delay="8000">unlimited elements</p>

                    <p 	class="teaser turky small" 	data-position="150,670" data-in="right" data-out="right" data-delay="5500">unlimited slides</p>

                    <p 	class="teaser turky small" 	data-position="210,670" data-in="right" data-out="right" data-delay="6500">background animation</p>

                    <p 	class="teaser turky small" 	data-position="270,670" data-in="right" data-out="right" data-delay="8000">unlimited slides</p>

                    <a href=""	class="slider-read" data-position="350,230" data-in="bottom" data-out="Right" data-delay="9500">
                        Download Now
                    </a>
                </div>
                <div class="slide">
                    <img src="img/fraction-slider/build.png" data-in="fade" width="100%" height="450"/>                                     3- slide background

                    <p 	class="claim light-pink" data-position="30,250" data-in="top" data-out="top" data-ease-in="easeOutBounce" data-delay="1500">Easy Responsive Design</p>

                    <p 	class="claim  theme-colored" data-position="110,250" data-in="left" data-out="Right" data-delay="2500">Easy customization</p>

                    <img src="img/fraction-slider/gadgets/laptop.png" width="456" height="272" data-position="103,1180" data-in="bottom" data-out="bottom" data-delay="400">

                    <img src="img/fraction-slider/gadgets/mack.png" width="357" height="313" data-position="60,1040" data-in="top" data-out="bottom" data-delay="200">

                    <img src="img/fraction-slider/gadgets/ipad.png" width="120" height="170" data-position="230,1030" data-in="left" data-delay="300" data-out="left">

                    <img src="img/fraction-slider/gadgets/smartphone.png" width="70" height="140" data-position="270,1320" data-in="right" data-delay="300" data-out="right">

                    <div class="para-2"	data-position="200,250" data-in="left" data-out="right" data-delay="3000">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, aspernatur consequatur consequuntur debitis
                        delectus nostrum quam quod reiciendis sit!
                    </div>

                    <a href=""	class="slider-read" data-position="360,250" data-in="bottom"  data-out="Right" data-delay="3500">
                        Free Download
                    </a>
                </div>
                <div class="slide">
                    <img src="img/fraction-slider/fraction_6.png" data-in="fade" data-delay="20" data-out="fade" width="100%" height="450">         4- slide background

                    <p class="claim light-pink" data-position="50,1020" data-in="top"  data-out="top" data-ease-in="jswing">We Design Creative Websites</p>

                    <p class="teaser turky" data-position="120,1180" data-in="left" data-delay="1500">animate multiple elements</p>

                    <p class="teaser turky" data-position="170,1180" data-in="left"  data-delay="3000">full control over each element</p>

                    <p class="teaser turky" data-position="220,1180" data-in="left"  data-delay="4500" data-out="none">opensource and free</p>

                    <p class="teaser turky" data-position="270,1180" data-in="left" data-delay="5500" data-out="none">Download free</p>

                    <img src="img/fraction-slider/slider-girl.png" width="480" height="480" data-position="-20,250" data-in="right" data-delay="500" data-out="fade" style="width:auto; height:auto">

                    <a href=""	class="slider-read" data-position="340,1390" data-in="bottom" data-out="top" data-delay="6500">
                        download Now
                    </a>
                </div> -->
            </div>
        </div>
		<!--End Slider-->
	<!-- <section class="promo_box">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-md-9 col-lg-9">
					<div class="promo_content no-padd">
						<h3>League is awesome responsive template, with clean design.</h3>
						<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean commodo ligula eget dolor. </p>
					</div>
				</div>
				<div class="col-sm-3 col-md-3 col-lg-3">
					<a class="btn btn-lg btn-default" href="#fakelink">
						<i class="fa fa-shopping-cart"></i>
						Download Now
					</a>
				</div>
			</div>
		</div>
	</section> -->

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
	<script type="text/javascript" src="js/jquery.cookie.js"></script> <!-- jQuery cookie -->
	<script type="text/javascript" src="js/styleswitch.js"></script> <!-- Style Colors Switcher -->
    <script src="js/jquery.fractionslider.js" type="text/javascript" charset="utf-8"></script>

    <script src="js/jquery.superfish.js"></script>
	<script src="js/jquery.meanmenu.js"></script>

	<script type="text/javascript" src="js/jquery.jcarousel.js"></script>
	<script type="text/javascript" src="js/jflickrfeed.js"></script>

	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/swipe.js"></script>

	<script src="js/main.js"></script>

	<!-- Start Style Switcher -->
	<div class="switcher"></div>
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

    });
    </script>
</body>
</html>