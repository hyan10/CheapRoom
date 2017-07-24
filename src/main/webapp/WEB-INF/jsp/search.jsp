<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>싸다방</title>
	<meta name="description" content="">
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/search.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- CSS FILES -->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/vendor/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style-fraction.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/fractionslider.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/switcher.css" media="screen" />
	
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
     
	<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/searchDate.js"></script>
	<!-- <script type="text/javascript">
		var j = jQuery.noConflict();
		var cookieStartDate = '${ cookie.startDate.value }';
		var cookieEndDate = '${ cookie.endDate.value }';
		var cookieCityNo = '${ cookie.cityNo.value }';
		//$("#selectBox option:eq(2)").attr("selected", "selected");
		
		if(cookieStartDate == "" && cookieEndDate == ""){
			cookieStartDate = new Date();
			cookieEndDate = new Date();
		} 
		j(function(){
			if(cookieCityNo != ""){
				alert("cityNo : "+cookieCityNo);
				$("#selectBox option:eq(cookieCityNo)").attr("selected", "selected");
			}
		    j('input[name="dateRange"]').daterangepicker({
		    		locale: {
			    		format : 'YYYY-MM-DD',
			    		cancelLabel : '취소',
			    		applyLabel : '확인'
			    },	
		   		startDate: new Date(), endDate: new Date()
		    }, 
		    function(start, end, label) {
			    /* alert("예약 날짜 : " + start.format('YYYY-MM-DD') + '에서 ' + end.format('YYYY-MM-DD') + '까지 예약하시겠습니까?'); */
			})
		    j('input[name="dateRange"]').on('cancel.daterangepicker', function(ev, picker) {
				$(this).val('');
			});
		    //j('input[name="dateRange"]').daterangepicker().setDateRange('2017-07-21', '2017-07-23');
		});
		function changeFormAction(checkbox){
		    document.getElementById("login-form").action = checkbox.value;
		    //alert('changed action url');
		}
	</script> -->
		    
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
							<a href="${ pageContext.request.contextPath }"><img src="${ pageContext.request.contextPath }/img/logo.png" alt="League" /></a>
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
	<!-- <footer class="footer">
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
	end footer

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
	</section> -->
</body>
</html>
