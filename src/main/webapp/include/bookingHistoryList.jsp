<%@page import="kr.co.bit.cr.booking.BookingController"%>
<%@page import="kr.co.bit.cr.booking.BookingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싸다방</title>
<!-- <link rel="stylesheet" type="text/css" href="/css/list.css" /> -->
<link rel="shortcut icon"
	href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico" type="image/x-icon">
<link rel="icon" href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon-precomposed"
	href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-144x144-precomposed.png">
<link rel="alternate" type="application/rss+xml"
	title="Latest snippets from Bootsnipp.com"
	href="https://bootsnipp.com/feed.rss" />

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
<!--    <link rel="stylesheet" href="//d2d3qesrx8xj6s.cloudfront.net/dist/bootsnipp.min.css?ver=872ccd9c6dce18ce6ea4d5106540f089">-->
<!-- <link rel="stylesheet" href="/dist/bootsnipp.min.css"> -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/dist/star-rating.css">
<script src="${ pageContext.request.contextPath}/js/jquery.slim.min.js"></script>
<script src="${ pageContext.request.contextPath}/js/scale.fix.js"></script>
<script src="${ pageContext.request.contextPath}/dist/star-rating.min.js"></script>
<script type="text/javascript">
	function showModal(){
		var hotelNo = arguments[0];
		var userNo = arguments[1];
		alert("hotelNo : " + hotelNo + "    userNo : " + userNo);		
		//show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
		//얻어온 값을 이용하여, modal 에서 동적으로 바뀌어야 하는 값을 바꾸어 준다.. 
		$('input[name="hotelNo"]').val(hotelNo);
		$('input[name="userNo"]').val(userNo);
	    //$("#myModalLabel").val(hotelNo);
		//$("#modalHotelNo").val(hotelNo);
		//s$("#modalUserNo").val(userNo);
	    $("#review-modal").modal('show');
	}

</script>
</head>

<body>
	<table class="table table-striped" style="width: 80%; margin: auto">
		<thead>
			<tr class="row-name">
				<!-- <th style="width:12%">Check/UnCheck</th> -->
				<th style="width: 10%">상태</th>
				<th>숙소 이름</th>
				<th>방 이름</th>
				<th>체크인날짜</th>
				<th>체크아웃날짜</th>
				<th>인원</th>
				<th>요금</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<!-- for문 -->
			<c:forEach var="booking" items="${bookingList}">
				<tr class="row-content">
					<!-- <td class="check" "> <label><input type="checkbox" value=""></label></td> -->
					<td><span class="label label-default"> 
							<c:choose>
								<c:when test="${booking.type}=='N'">취소</c:when>
								<c:otherwise>완료<i class="fa fa-thumbs-up"></i>
								</c:otherwise>
							</c:choose>
					</span></td>
					<td>${booking.hotelName}</td>
					<td>${booking.roomName}</td>
					<td>${booking.startDate}</td>
					<td>${booking.endDate}</td>
					<td>${booking.totalPerson }</td>
					<td>${booking.totalPrice }</td>
					<td><button class="label label-default"
							onclick="javascript:location.href='${pageContext.request.contextPath}/booking/historyDetail.cr?bookingNo=${booking.no}'">내역
							보기</button></td>
				</tr>
			</c:forEach>
			<%-- <td><a href="#" class="btn btn-primary btn-lg" role="button" onclick="showModal(3, ${ loginUser.no});">후기 등록</a></td> --%>
				<!-- data-toggle="modal" data-target="#review-modal" -->
		</tbody>
	</table>
	<script>
		var cleanliness = new StarRating(document.getElementById('cleanliness'));
		var comfort = new StarRating(document.getElementById('comfort'));
		var location1 = new StarRating(document.getElementById('location1'));
		var facilities = new StarRating(document.getElementById('facilities'));
		var staff = new StarRating(document.getElementById('staff'));
		

	</script>
</body>
</html>