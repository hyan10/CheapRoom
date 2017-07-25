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
	
	<script type="text/javascript">
		function changeFormAction(checkbox){
		    document.getElementById("login-form").action = checkbox.value;
		}
	</script>
</head>

<body>
<jsp:include page="/include/header.jsp"/>

	<!-- <div class="slider-wrapper"> -->
		<div class="container">
			<div class="row">
				<div class="col-md-9  toppad  pull-right col-md-offset-3 ">
					<br/>
				</div>
				<div
					class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">사업자 가입정보</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class=" col-md-12 col-lg-12 ">
									<table class="table table-user-information">
										<tbody>
											<tr>
												<td>회원 아이디</td>
												<td>${loginUser.email}</td>
											</tr>
											<tr>
												<td>이름</td>
												<td>${loginUser.name}</td>
											</tr>
											<tr>
												<td>전화번호</td>
												<c:choose>
													<c:when test="${not empty loginUser.phone}">
														<td>${loginUser.phone}</td>
													</c:when>
													<c:otherwise>
														<td>전화번호를 등록하세요
														<td />
													</c:otherwise>
												</c:choose>
											</tr>

											<tr>
												<td>이메일</td>
												<td>${loginUser.email}</td>
											</tr>
											<tr>
												<td>사업자번호</td>
												<td>${loginUser.crn}</td>
											</tr>
											<tr>
												<td>가입일</td>
												<td>${loginUser.regDate}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- 사업정보 -->
						<div class="panel-heading">
							<h3 class="panel-title">호텔 정보</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class=" col-md-12 col-lg-12 ">
									<table class="table table-user-information">
										<tbody>
											<c:forEach var="hotel" items="${hotelList}">
												<tr>
													<th colspan=3>[${ hotel.name }]</th>
												</tr>
												<c:if test="${ not empty hotel.rooms }">												
													<tr>
														<td>방 이름</td>
														<td>최소/최대 인원</td>
														<td>가격</td>
														<td>추가 요금</td>
														<td>수정하기</td>
													</tr>
													<c:forEach var="room" items="${hotel.rooms}">
														<tr>
															<td>${ room.name }</td>
															<td>${ room.minPerson } / ${ room.maxPerson }명</td>
															<td>${ room.price }</td>
															<td>${ room.addPrice }</td>
															<td>
																<a href="#" data-original-title="Edit this user" data-toggle="tooltip"
																	type="button" class="btn btn-sm btn-warning">
																	<i class="glyphicon glyphicon-edit"></i></a> 
															</td>
														</tr>
													</c:forEach>
												</c:if>
												
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<a data-original-title="Broadcast Message" data-toggle="tooltip"
								type="button" class="btn btn-sm btn-primary"><i
								class="glyphicon glyphicon-envelope"></i></a> <span
								class="pull-right"> <a href="edit.html"
								data-original-title="Edit this user" data-toggle="tooltip"
								type="button" class="btn btn-sm btn-warning"><i
									class="glyphicon glyphicon-edit"></i></a> 
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<!-- </div> -->

</body>
</html>
