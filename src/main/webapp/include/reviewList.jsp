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

</head>
<%-- <jsp:include page="/include/reviewModal.jsp" /> --%>
<body>
	<table class="table table-striped" style="width: 80%; margin: auto">
		<thead>
			<tr class="row-name">
				<!-- <th style="width:12%">Check/UnCheck</th> -->
				<th style="width: 10%">호텔 이름</th>
				<th>후기 내용</th>
				<th>후기 등록 날짜</th>
			</tr>
		</thead>
		<tbody>
			<!-- for문 -->
			<c:forEach var="review" items="${reviewList}">
				<tr class="row-content">
					<td>${review.hotelName}</td>
					<td>청결도는
					<c:choose>
						<c:when test="${review.cleanliness lt 3}">너무 별로에요.</c:when>
						<c:when test="${review.cleanliness eq 3}">그냥 그래요.</c:when>
						<c:otherwise>너무 좋아요!</c:otherwise>
					</c:choose><br/>
					편안함은
					<c:choose>
						<c:when test="${review.comfort lt 3}">너무 별로에요.</c:when>
						<c:when test="${review.comfort eq 3}">그냥 그래요.</c:when>
						<c:otherwise>너무 좋아요!</c:otherwise>
					</c:choose><br/>
					호텔 접근성은
					<c:choose>
						<c:when test="${review.location lt 3}">너무 별로에요.</c:when>
						<c:when test="${review.location eq 3}">그냥 그래요.</c:when>
						<c:otherwise>너무 좋아요!</c:otherwise>
					</c:choose><br/>
					부대시설은
					<c:choose>
						<c:when test="${review.facilities lt 3}">너무 별로에요.</c:when>
						<c:when test="${review.facilities eq 3}">그냥 그래요.</c:when>
						<c:otherwise>너무 좋아요!</c:otherwise>
					</c:choose><br/>
					직원 친절도는
					<c:choose>
						<c:when test="${review.facilities lt 3}">너무 별로에요.</c:when>
						<c:when test="${review.facilities eq 3}">그냥 그래요.</c:when>
						<c:otherwise>너무 좋아요!</c:otherwise>
					</c:choose>
					</td>
					<td>${review.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>