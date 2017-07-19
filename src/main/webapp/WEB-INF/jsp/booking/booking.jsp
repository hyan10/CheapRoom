<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/list.css"/>
</head>
<body>

	[회원정보]<br/><br/>
	
	<form role="form" id="payment-form" method="POST"
		action="javascript:void(0);">
		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userName">예약자 성명</label>
						<input type="text" class="form-control" name="userName"
							placeholder="예약자 성명" required autofocus />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userEmail">예약자 이메일</label>
						<input type="text" class="form-control" name="userEmail"
						placeholder="email@cheaproom.com" required />
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userPhone">연락처</label>
					<input type="text" class="form-control" name="userPhone" />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-7 col-md-7">
				<button class="subscribe btn btn-success btn-lg btn-block"
					type="button">예약완료</button>
			</div>
		</div>
		<div class="row" style="display: none;">
			<div class="col-xs-7 col-md-7">
				<p class="payment-errors"></p>
			</div>
		</div>
	</form>
	
	<br/><br/>
	
	[예약정보]<br/><br/>
	
	<table class="table table-striped">
     <thead>
        <tr class="row-name">
           <!-- <th style="width:12%">Check/UnCheck</th> -->
           <th>숙소 이름</th>
           <th>방 이름</th>
           <th>체크인날짜</th>
           <th>체크아웃날짜</th>
           <th>인원</th>
           <th>요금</th>
        </tr>
     </thead>   
     <tbody>
     
     <!-- for문 -->
     <c:forEach var="booking" items="${bookingList}">
        <tr class="row-content">
           <td>${booking.hotelName}</td>
           <td>${booking.roomName}</td>
           <td>${booking.startDate}</td>
           <td>${booking.endDate}</td>
           <td>${booking.totalPerson }</td>
           <td>${booking.totalPrice }</td>
        </tr>
     </c:forEach>
     </tbody>
  </table>
	
	[결제정보]<br/><br/>
	<jsp:include page="/include/pay.jsp" />
</body>
</html>