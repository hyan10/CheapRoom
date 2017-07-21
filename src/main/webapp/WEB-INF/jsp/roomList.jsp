<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>싸다방</title>
<meta name="description" content="">

<%-- <link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/search.css" /> --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!-- CSS FILES -->
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/vendor/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/style.css"
	media="screen" data-name="skins">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/style-fraction.css"
	type="text/css" charset="utf-8" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/fractionslider.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/switcher.css"
	media="screen" />

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
<!-- Include Date Range Picker -->
<script type="text/javascript"
	src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<script type="text/javascript">
	var j = jQuery.noConflict();
	j(function() {
		j('input[name="daterange"]').daterangepicker(
				{
					locale : {
						format : 'YYYY-MM-DD',
						cancelLabel : '취소',
						applyLabel : '확인'
					}
				},
				function(start, end, label) {
					alert("예약 날짜 : " + start.format('YYYY-MM-DD') + '에서 '
							+ end.format('YYYY-MM-DD') + '까지 예약하시겠습니까?');
				});
		j('input[name="daterange"]').on('cancel.daterangepicker',
				function(ev, picker) {
					$(this).val('');
				});
	});
	function changeFormAction(checkbox) {
		document.getElementById("login-form").action = checkbox.value;
	}
	$(document).ready(function() {		
		$('#myCarousel').carousel({
			interval : 500
		});
	
		// handles the carousel thumbnails
		$('[id^=carousel-selector-]').click(function() {
			var id_selector = $(this).attr("id");
			var id = id_selector.substr(id_selector.length - 1);
			id = parseInt(id);
			$('#myCarousel').carousel(id);
			$('[id^=carousel-selector-]').removeClass('selected');
			$(this).addClass('selected');
		});
	
		// when the carousel slides, auto update
		$('#myCarousel').on('slid', function(e) {
			var id = $('.item.active').data('slide-number');
			id = parseInt(id);
			$('[id^=carousel-selector-]').removeClass('selected');
			$('[id=carousel-selector-' + id + ']').addClass('selected');
		});
	});
</script>

</head>

<body>
	<!--Start Header-->
	<header id="header" class="clearfix"> <!-- Nav Bar -->
	<div id="nav-bar" class="clearfix">
		<div class="container">
			<div class="row">
				<!-- Logo / Mobile Menu -->
				<div class="col-sm-2">
					<div id="logo">
						<h1>
							
							<a href="${ pageContext.request.contextPath }">
							<img src="${ pageContext.request.contextPath }/img/logo.png" alt="League" /></a>
						</h1>
					</div>
				</div>

				<!-- Navigation
                ================================================== -->
				<!-- Nav menu -->

				<c:if test="${ loginUser.type eq 'U' }">
					<jsp:include page="/include/userMenu.jsp" />
               		[${ loginUser.email}님 접속중]
				<a href="${ pageContext.request.contextPath }/user/logout.cr"
						class="btn btn-primary btn-lg" role="button">로그아웃</a>
				</c:if>

			</div>
		</div>
	</div>
	<!-- End Nav Bar --> </header>
	<!--End Header-->
	<!--Start Slider-->
	<!--start wrapper-->

	<section class="page_head">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<h2> 방 예약 진행 </h2>
			</div>
		</div>
	</div>
	</section> 
	<section class="content blog">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-4 col-lg-4 col-sm-4">
				<jsp:include page="/include/searchForm.jsp"/>
			</div>
			<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
			<table class="table table-striped">
				<thead>
					<tr class="row-name">
						<!-- <th style="width:12%">Check/UnCheck</th> -->
						<th style="width: 10%">사진</th>
						<th>방 이름(옵션)</th>
						<th>가격</th>
						<th>최소 / 최대 인원</th>
						<th>추가 요금</th>
					</tr>
				</thead>
				<tbody>
					<!-- for문 -->
					<c:forEach var="room" items="${roomList}">
						<tr class="row-content">
							<!-- <td class="check" "> <label><input type="checkbox" value=""></label></td> -->
							<td><span class="label label-default"> New <i
									class="fa fa-thumbs-up"></i></span></td>
							<td>
								<div class="col-md-7" id="slider">
									<div class="col-md-7" id="carousel-bounding-box">
										<div id="myCarousel" class="carousel slide">
											<!-- main slider carousel items -->
											<div class="carousel-inner">
												<c:forEach var="image" items="${room.images}" varStatus="status">
												<div class="active item" data-slide-number="${status.index}">
													<!-- <img src="http://placehold.it/630x320&amp;text=one" class="img-responsive"> -->
													<img src="${image.url}" class="img-responsive">													
												</div>
												</c:forEach>
											</div>
											<!-- main slider carousel nav controls -->
											<a class="carousel-control left" href="#myCarousel"
												data-slide="prev">‹</a> <a class="carousel-control right"
												href="#myCarousel" data-slide="next">›</a>
										</div>
									</div>
								</div>
							</td>
							<td>${room.name}<br>(${room.cooking }, ${room.tv }, ${room.ac }</td>
							<td>${room.price}</td>
							<td>${room.minPerson} / ${room.maxPerson}</td>
							<td>${room.addPrice }</td>
							<td>
							<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								<%-- <c:set var="bookig" value="${room.booking}"/>
								<c:if test="${booking}=='N' || ${booking}=='Y'"> --%>
									<a href="${pageContext.request.contextPath}/booking/book.cr?roomNo=${ room.no }">
									<button type="submit" class="btn btn-info">
									예약하기<i class="fa fa-check spaceLeft"></i>
									</button></a>
								<%-- </c:if> --%>
							<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<!--Sidebar Widget-->
		<!-- <div class="col-xs-12 col-md-4 col-lg-4 col-sm-4">
			<div class="sidebar">
				<div class="widget widget_search">
					<div class="site-search-area">
						<form method="get" id="site-searchform" action="#">
							<div>
								<input class="input-text" name="s" id="s"
									placeholder="Enter Search keywords..." type="text" /> <input
									id="searchsubmit" value="Search" type="submit" />
							</div>
						</form>
					</div>
					end site search
				</div>
			</div>
		</div> -->
	</div>
	</section>
	<!--/.row--> <!--/.container--> 
	<!--end wrapper-->
</body>
</html>
