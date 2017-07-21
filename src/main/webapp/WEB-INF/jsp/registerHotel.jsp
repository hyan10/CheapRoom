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

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/search.css" />
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
							<a href="${ pageContext.request.contextPath }"><img
								src="${ pageContext.request.contextPath }/img/logo.png"
								alt="League" /></a>
						</h1>
					</div>
				</div>

				<!-- Navigation
                ================================================== -->
				<!-- Nav menu -->

				<c:if test="${ loginUser.type eq 'O' }">
					<jsp:include page="/include/ownerMenu.jsp" />
               		[${ loginUser.email} 사업자님 접속중]
				<a href="${ pageContext.request.contextPath }/owner/logout.cr"
						class="btn btn-primary btn-lg" role="button">로그아웃</a>
				</c:if>

			</div>
		</div>
	</div>
	</div>
	<!-- End Nav Bar --> </header>
	<!--End Header-->
	<!--Start Slider-->
	<!-- <div class="slider-wrapper"> -->
		
		<div class="container" style="margin: 10px;">
			<div class="row">
				<h2>호텔 등록</h2>
				<hr>
			</div>
 
			<form role="form" action="${pageContext.request.contextPath}/owner/hotelRegister.cr" method="post">
					<div class="form-group">
						<div class="row">
							<label for="firstname" class="col-md-2"> 호텔 이름 </label>
							<div class="col-md-5">
								<input type="text" class="form-control" name="name"
									placeholder="호텔 이름 입력">
							</div>
						</div>
					</div>

				<div class="form-group">
					<div class="row">
						<label for="lastname" class="col-md-2">지역/주소</label>
						<div class="col-md-3">
							<select class="form-control" name="cityNo" placeholder="여행지역 선택">
								<option value="1">서울특별시</option>
								<option value="2">인천광역시</option>
								<option value="3">경기도</option>
								<option value="4">충청북도</option>
								<option value="5">충청남도</option>
								<option value="6">강원도</option>
								<option value="7">전라북도</option>
								<option value="8">전라남도</option>
								<option value="9">경상북도</option>
								<option value="10">경상남도</option>
								<option value="11">대전광역시</option>
								<option value="12">대구광역시</option>
								<option value="13">울산광역시</option>
								<option value="14">부산광역시</option>
								<option value="15">광주광역시</option>
								<option value="16">제주도</option>
							</select>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" name="addr" placeholder="세부 주소 입력">
						</div>
					</div>
				</div>
					
				<div class="form-group">
					<div class="row">
						<label for="emailaddress" class="col-md-2"> 이메일 주소
						</label>
						<div class="col-md-7">
							<input type="email" class="form-control" id="emailaddress"
								placeholder="Enter email address">
							<p class="help-block">@ 포함하여 입력</p>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="phonenumber" class="col-md-2"> 연락처
						</label>
						<div class="col-md-3">
							<input type="tel" class="form-control" id=tel placeholder="전화번호 입력">
							<p class="help-block">- 제외한 숫자만 입력</p>
						</div>
						<label for="phonenumber" class="col-md-2"> 부대시설
						</label>
						<div class="checkbox col-md-6">
							<label class="checkbox-inline"><input type="checkbox" name="parking">주차 시설</label>
							<label class="checkbox-inline"><input type="checkbox" name="wifi">Wi-Fi</label>
							<label class="checkbox-inline"><input type="checkbox" name="smoking">흡연구역</label>
							<label class="checkbox-inline"><input type="checkbox" name="pool">수영장</label>
							<label class="checkbox-inline"><input type="checkbox" name="BBQ">BBQ 시설</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="description" class="col-md-2"> 호텔 소개 </label>
						<textarea class="form-control col-md-3" name="description" rows="5"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="row">
						<label for="uploadimage" class="col-md-2"> 호텔 사진첨부 </label>
						<div class="col-md-10">
							<input type="file" name="imgurl" id="imgurl">
							<p class="help-block">(업로드 가능한 포맷 jpeg, jpg, gif, png)</p>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-10">
						<button type="submit" class="btn btn-info">다음</button>
					</div>
				</div>
			</form>
		</div>
		<%-- <img src="${pageContext.request.contextPath}/img/fraction-slider/base-1.png" width="1920" height="450"> --%>
	<!-- </div> -->

</body>
</html>
