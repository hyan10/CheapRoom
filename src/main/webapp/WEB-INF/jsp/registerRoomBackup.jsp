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
<script>
var count = 0;
function addForm(){
    var addedFormDiv = document.getElementById("addRoomForm");
   
    var str = "";
    str+="<div class='form-group'>"
		+ "<div class='row'>"
		+ "<label for='roomName' class='col-md-2'> 객실 이름 </label>"
		+ "<div class='col-md-5'>"
		+ "<input type='text' class='form-control' name='name' placeholder='객실 이름 입력'>"
		+ "</div>"
		+ "</div>"
		+ "</div>"
		+ "<div class='form-group'>"
		+ "<div class='row'>"
		+ "<label for='roomPrice' class='col-md-2'> 객실 가격 </label>"
		+ "<div class='col-md-5'>"
		+ "<input type='text' class='form-control' name='price' placeholder='객실 가격 입력'>"
		+ "</div>"
		+ "</div>"
		+ "</div>"
		+ "<div class='form-group'>"
		+ "<div class='row'>"
		+ "<label for='roomPrice' class='col-md-2'> 객실 최소인원 </label>"
		+ "<div class='col-md-2'>"
		+ "<input type='text' class='form-control' name='minPerson' placeholder='객실 최소인원 입력'>"
		+ "</div>"
		+ "<label for='roomPrice' class='col-md-2'> 객실 최대인원 </label>"
		+ "<div class='col-md-2'>"
		+ "<input type='text' class='form-control' name='maxPerson' placeholder='객실 최대인원 입력'>"
		+ "</div>"
		+ "</div>"
		+ "</div>"
		+ "<div class='form-group'>"
		+ "<div class='row'>"
		+ "<label for='emailaddress' class='col-md-2'> 추가인원 요금"
		+ "</label>"
		+ "<div class='col-md-2'>"
		+ "<input type='text' class='form-control' id='addPersonPrice' placeholder='추가인원 요금 입력'>"
		+ "<p class='help-block'>1인당 추가 요금 입력</p>"
		+ "</div>"
		+ "<label for='phonenumber' class='col-md-2'> 객실 옵션"
		+ "</label>"
		+ "<div class='checkbox col-md-6'>"
		+ "<label class='checkbox-inline'><input type='checkbox' name='cooking'>취사</label>"
		+ "<label class='checkbox-inline'><input type='checkbox' name='tv'>TV</label>"
		+ "<label class='checkbox-inline'><input type='checkbox' name='ac'>에어컨</label>"
		+ "</div>"
		+ "</div>"
		+ "</div>"
		+ "<div class='form-group'>"
		+ "<div class='row'>"
		+ "<label for='uploadimage' class='col-lg-2'> 객실 사진첨부 </label>"
		+ "<div class='col-md-10'>"
		+ "<input type='file' name='imgurl' id='imgurl' multiple>"
		+ "<p class='help-block'>(업로드 가능한 포맷 jpeg, jpg, gif, png)</p>"
		+ "</div>"
		+ "</div>"
		+ "</div>"
		+ "<div class='row'>"
		+ "<div class='col-md-2'></div>"
		+ "<div class='col-md-10'>"
		+ "<button type='submit' class='btn btn-info btn-lg'>객실 등록</button>"
		+ "</div>"
		+ "</div>";
    
    var addedDiv = document.createElement("div"); // 폼 생성
    addedDiv.id = "added_"+count; // 폼 Div에 ID 부여 (삭제를 위해)
    addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입
    addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입

    count++;
    document.baseForm.count.value=count;
    // 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
}

</script>
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
	<!-- End Nav Bar --> </header>
	<!--End Header-->
	<!--Start Slider-->
	<!-- <div class="slider-wrapper"> -->
		
		<div class="container" style="margin: 10px;">
			<div class="row">
				<div class="col-md-2">
					<h2>호텔 방 등록</h2>
				</div><br/>
				<div class="col-md-6">
				</div>
			
				<button type="button" name="addRoomForm" class="btn btn-success btn-lg" onclick="addForm()">
         			<span class="glyphicon glyphicon-plus"></span> 객실 추가
        			</button>
			</div>
 			<hr>
			<form role="form" name="addRoomForm" action="${pageContext.request.contextPath}/hotel/roomRegister.cr" method="post">
				<div class="addedFormDiv">
				<div class="form-group">
					<div class="row">
						<label for="roomName" class="col-md-2"> 객실 이름 </label>
						<div class="col-md-5">
							<input type="text" class="form-control" name="name" placeholder="객실 이름 입력">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="roomPrice" class="col-md-2"> 객실 가격 </label>
						<div class="col-md-5">
							<input type="text" class="form-control" name="price" placeholder="객실 가격 입력">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="roomPrice" class="col-md-2"> 객실 최소인원 </label>
						<div class="col-md-2">
							<input type="text" class="form-control" name="minPerson" placeholder="객실 최소인원 입력">
						</div>
						<label for="roomPrice" class="col-md-2"> 객실 최대인원 </label>
						<div class="col-md-2">
							<input type="text" class="form-control" name="maxPerson" placeholder="객실 최대인원 입력">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="emailaddress" class="col-md-2"> 추가인원 요금
						</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="addPersonPrice" placeholder="추가인원 요금 입력">
							<p class="help-block">1인당 추가 요금 입력</p>
						</div>
						<label for="phonenumber" class="col-md-2"> 객실 옵션
						</label>
						<div class="checkbox col-md-6">
							<label class="checkbox-inline"><input type="checkbox" name="cooking">취사</label>
							<label class="checkbox-inline"><input type="checkbox" name="tv">TV</label>
							<label class="checkbox-inline"><input type="checkbox" name="ac">에어컨</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="uploadimage" class="col-lg-2"> 객실 사진첨부 </label>
						<div class="col-md-10">
							<input type="file" name="imgurl" id="imgurl" multiple>
							<p class="help-block">(업로드 가능한 포맷 jpeg, jpg, gif, png)</p>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-10">
						<button type="submit" class="btn btn-info btn-lg">객실 등록</button>
					</div>
				</div>
			</div>
			</form>
		</div>
		<%-- <img src="${pageContext.request.contextPath}/img/fraction-slider/base-1.png" width="1920" height="450"> --%>
	<!-- </div> -->

</body>
</html>
