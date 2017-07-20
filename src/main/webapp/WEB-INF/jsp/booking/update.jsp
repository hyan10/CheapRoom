<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>예약 수정</title>
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
								<a href="index.jsp"><img src="${ pageContext.request.contextPath }/img/logo.png" alt="League" /></a>
							</h1>
						</div> <!-- end logo -->
					</div> <!-- end col-sm-2-1 -->
			
					<!-- Navigation
	                ================================================== -->
	                <!-- Nav menu -->     
					<jsp:include page="/include/userMenu.jsp"/>              
	                <!-- Nav menu end -->
	                
	                <div class="col-sm-2">
							<c:if test="${ not empty user }">
			                		[${ user.email}님 접속중]
								<a href="${ pageContext.request.contextPath }/user/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
			                </c:if>
	                </div> <!-- end col-sm-2-2 -->
	            </div> <!-- end row -->
	        </div> <!-- end container  -->
	    </div> <!-- end nav-bar -->
	    <!-- End Nav Bar -->
	</header>
		<!--End Header-->


	<!-- Start content -->
	<section style="width:80%; margin-top:70px; margin-left:auto; margin-right:auto; margin-bottom:50px">
	
	
	<form name="bookingForm" role="form" id="payment-form" method="POST"
		action="${pageContext.request.contextPath}/booking/book.cr" onclick="checkForm()">
	<h3>[회원정보]</h3>
	<br/>
	
		<section style="margin-left:30px; margin-bottom:30px">
		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userName">예약자 성명</label>
						<input type="text" class="form-control" name="userName" value="${booking.userName}"
							placeholder="예약자 성명" required autofocus />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userEmail">예약자 이메일</label>
						<input type="text" class="form-control" name="userEmail" value="${booking.userEmail}"
						placeholder="email@cheaproom.com" required />
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userPhone">예약자 연락처</label>
					<input type="text" class="form-control" name="userPhone" value="${booking.userPhone}" />
				</div>
			</div>
		</div>
		
		</section>
		
		<h3>[예약정보]</h3>
		<br/>
		
		<section style="margin-bottom:50px">
			<table class="table table-striped" style="width:80%; margin:auto">
		     <thead>
		        <tr class="row-name">
		           <!-- <th style="width:12%">Check/UnCheck</th> -->
		           <th>숙소 이름</th>
		           <th>방 이름</th>
		           <th>체크인날짜</th>
		           <th>체크아웃날짜</th>
		           <th>인원</th>
		           <th>총 요금</th>
		        </tr>
		     </thead>  
		      
		     <!-- 예약 리스트 -->
		     <tbody>
		    <%--  <c:forEach var="booking" items="${bookingList}"> --%>
		        <tr class="row-content">
		           <td><b>${booking.hotelName}</b></td>
		           <td>${booking.roomName}</td>
		           <td>${booking.startDate}</td>
		           <td>${booking.endDate}</td>
		           <td>${booking.totalPerson }</td>
		           <td><b><font color="red">${booking.totalPrice}</font>원</b></td>
		        </tr>
		    <%--  </c:forEach> --%>
		     </tbody>
		  </table>
		 </section>
		
		<div class="row" style="display: none;">
			<div class="col-xs-7 col-md-7">
				<p class="payment-errors"></p>
			</div>
		</div>
	<!-- </form> -->
	
		<h3>[결제정보]</h3>
		<br/>
		
		<!-- 총 결제 금액 -->
		<table class="table table-striped" style="width:34%; margin-bottom:30px; margin-left:15px">
	     <thead>
	        <tr class="row-name">
	           <th>총 결제 금액</th>
	        </tr>
	     </thead>   
	     <tbody>
	     	<tr>
	           <td align="right"><b><font color="red" size="5">${booking.totalPrice}</font>원</b></td>
	        </tr>
	     </tbody>
	  	</table>
		
		<!-- 결제 창 -->
		<div style="margin:auto;">
			<div class="container">
				<div class="row">
					<!-- You can make it whatever width you want. I'm making it full width
		             on <= small devices and 4/12 page width on >= medium devices -->
					<div class="col-xs-12 col-md-4">
		
						<!-- CREDIT CARD FORM STARTS HERE -->
						<div class="panel panel-default credit-card-box">
							<div class="panel-heading display-table">
								<div class="row display-tr">
									<!-- <h3 class="panel-title display-td">Payment Details</h3> -->
									<div class="display-td">
										<img class="img-responsive pull-right"
											src="http://i76.imgup.net/accepted_c22e0.png">
									</div>
								</div>
							</div>
							<div class="panel-body">
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<label for="cardNumber">CARD NUMBER</label>
												<div class="input-group">
													<input type="tel" class="form-control" name="cardNumber"
														placeholder="Valid Card Number" autocomplete="cc-number" readonly="readonly"
														required autofocus value="${booking.cardNo }"/>
													<span class="input-group-addon"><i
														class="fa fa-credit-card"></i></span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-7 col-md-7">
											<div class="form-group">
												<label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span
													class="visible-xs-inline">EXP</span> DATE</label> <input type="tel"
													class="form-control" name="cardExpiry" placeholder="MM / YY"  readonly="readonly"
													autocomplete="cc-exp" required value="${booking.cardDate }"/>
											</div>
										</div>
										<div class="col-xs-5 col-md-5 pull-right">
											<div class="form-group">
												<label for="cardCVC">Card Type</label> <input type="text"
													class="form-control" name="cardType" readonly="readonly"
													autocomplete="cc-csc" required value="${booking.cardType }"/>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<button disabled="disabled" class="subscribe btn btn-success btn-lg btn-block"
												type="button">결제 완료</button>
										</div>
									</div>
									<div class="row" style="display: none;">
										<div class="col-xs-12">
											<p class="payment-errors"></p>
										</div>
									</div>
							</div>
						</div>
						<!-- CREDIT CARD FORM ENDS HERE -->
		
		
					</div>
		
				</div>
			</div>
		</div>
		
		<!-- 수정 버튼 -->
		<div class="row">
			<span class="col-xs-2 col-md-2" style="float:right; margin-right:10px" >
				<button class="subscribe btn btn-success btn-lg btn-block" onclick="goBack()"
					type="button">취소</button>
			</span>
			<span class="col-xs-2 col-md-2" style="float:right; margin-right:10px" >
				<button class="subscribe btn btn-success btn-lg btn-block"
					type="submit">수정</button>
			</span>
		</div>
		
		</form>
	</section>
	<!-- End content -->
	
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
	
	<script>
		function checkUserForm(){
			var result = false;
			var name = document.bookingForm.userName.value;
			var email = document.bookingForm.userEmail.value;
			var phone = document.bookingForm.userPhone.value;
			
			if(name==""){
				alert("예약자 성명을 입력해주세요.");
			}else{
				if(email==""){
					alert("예약자 이메일을 입력해주세요.");
				}else {
					if(phone=""){
						alert("예약자 연락처를 입력해주세요.");
					}else {  // 정상적인 입력
						result = true;
					}
				}
			}
			
			return result;		
		}
		
		function checkForm(){
			if(checkUserForm()){
				console.log('true');
			}
		}
		
		function goBack(){
			location.href = "${pageContext.request.contextPath}/booking/test.cr";
		}
	</script>
</body>
</html>