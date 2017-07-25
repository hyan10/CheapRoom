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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- CSS FILES -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-fraction.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fractionslider.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/switcher.css" media="screen" />
	
	
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
</head>
<body>

	<jsp:include page="/include/header.jsp"/>
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>통계</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="index.html">Home</a></li>
								<li><a href="index.html">Blog</a></li>
								<li>Blog Medium Images</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
	</section>  <!-- end wrapper -->
		
		<!-- 통계 영역 -->
		<section class="content portfolio_single">
			<div class="container">

				<!-- 월 선택 -->	
				<form name="monthForm" action="${pageContext.request.contextPath}/admin/bookingHistoryList.cr" method="get">
					<div style="width:100%; margin-bottom:50px">		
						월 선택: <select class="form-control" name="month" style="display:inline-block !important; width:20% !important">
							<c:forEach var="i" begin="1" end="${maxMonth}">
								<option value="${i}" 
									<c:if test="${i eq month}">
										selected="selected"
									</c:if>
								>${i}월</option>								
							</c:forEach>						
						</select>						
						<input type="submit" value="검색"/>
					</div>
				</form>
			
				<!-- 설명할거 있으면 여기에 -->
				<div class="project_description">
					<div class="widget_title dividerHeading">
					<!-- ${chartList[0].year} -->
					<!-- ${param.year} -->
						<h4><span><b>2017년 ${month}월 호텔 별 통계</b></span></h4>
					</div>
						<p>Lorem ipsum dolor sit amet, consectetur adip, sed do eiusmod tempor incididunt ut aut reiciendise voluptat maiores alias aut et perferendis doloribus asperiores ut labore.</p>
						<p> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				</div> <!-- end description -->
						
				<!-- for문 -->
				<c:forEach var="chart" items="${chartList}">
					<div class="row sub_content">
						<!-- 좌측 내용 -->
						<div class="col-lg-4 col-md-4 col-sm-4">	
							<!-- 통계 자료 내용 -->
							<div class="project_details">
								<div class="widget_title">
									<h4><span><b>${chart.hotelName}</b></span></h4>
								</div>
								<ul class="details">
									<li><span>총 예약 건수 :</span>${chart.count}건</li>
									<li><span>총 예약 인원 :</span>${chart.totalPerson}명</li>
									<li><span>예약 총액 :</span>${chart.profit}원</li>
									<!-- <li><span>Date :</span> 03 March 2014</li>
									<li><span>Project URL :</span> <a href="#">www.bestjquery.com</a></li> -->
								</ul>
							</div> <!-- end detail -->
							
						</div> <!-- 좌측 내용 끝 -->
						
						<!-- 이미지 -->
						<div class="col-lg-8 col-md-8 col-sm-8">
							<!--Project Details Page-->
							<div class="porDetCarousel">
								<div class="carousel-content">
									<jsp:include page="/include/bookingHistoryList.jsp"/>
								</div>
							</div>
						</div> <!-- 이미지 끝 -->
						
					</div> <!-- row_sub_content 끝 -->
				</c:forEach>
				<!-- for문 끝 -->
			</div> <!-- end container -->
		</section>
		
	<!--start footer-->
	<footer class="footer">
		<jsp:include page="/include/footer.jsp" />
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


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendor/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/retina-1.1.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script> <!-- jQuery cookie -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/styleswitch.js"></script> <!-- Style Colors Switcher -->
    <script src="${pageContext.request.contextPath}/js/jquery.fractionslider.js" type="text/javascript" charset="utf-8"></script>

    <script src="${pageContext.request.contextPath}/js/jquery.superfish.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jcarousel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jflickrfeed.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/swipe.js"></script>

	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	
	
</body>
</html>