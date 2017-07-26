<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>예약</title>
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
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js" rel="stylesheet" id="bootstrap-css"></script>
   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
       <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->
    
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />


<!-- pay Vendor libraries -->
<meta name="robots" content="noindex, nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script> -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<link rel="/css/pay.css"/>

<!-- If you're using Stripe for payments -->
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
          window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
        });
</script>

<script type="text/javascript">
var $form = $('#payment-form');
$form.find('.subscribe').on('click', payWithStripe);
/* If you're using Stripe for payments */
function payWithStripe() {
	
	
	var cardNo = $form.find('[name=cardNumber]').val().replace(/\s/g,'');
	var cvc = $form.find('[name=cardCVC]').val();
	var expiry = $form.find('[name=cardExpiry]').payment('cardExpiryVal');
	
	console.log(cardNo);
	console.log(cvc);
	console.log(expiry);
	
	alert(cardNo);
   // e.preventDefault();
    
    /* Abort if invalid form data */
     if (!validator.form()) {
    	alert("입력이 잘못되었습니다. 다시 시도해주세요.");
        return;
    } 
    /* Visual feedback */
    /* $form.find('.subscribe').html('Validating <i class="fa fa-spinner fa-pulse"></i>').prop('disabled', true);
    var PublishableKey = 'pk_test_6pRNASCoBOKtIshFeQd4XMUh'; // Replace with your API publishable key
    Stripe.setPublishableKey(PublishableKey); */
     
    /* Create token */
/*      var expiry = $form.find('[name=cardExpiry]').payment('cardExpiryVal');
    var ccData = {
        number: $form.find('[name=cardNumber]').val().replace(/\s/g,''),
        cvc: $form.find('[name=cardCVC]').val(),
        exp_month: expiry.month, 
        exp_year: expiry.year
    };
     
    
      Stripe.card.createToken(ccData, function stripeResponseHandler(status, response) {
        if (response.error) {
            // Visual feedback
            $form.find('.subscribe').html('Try again').prop('disabled', false);
            // Show Stripe errors on the form 
            $form.find('.payment-errors').text(response.error.message);
            $form.find('.payment-errors').closest('.row').show();
        } else {
            // Visual feedback 
            $form.find('.subscribe').html('Processing <i class="fa fa-spinner fa-pulse"></i>');
            // Hide Stripe errors on the form
            $form.find('.payment-errors').closest('.row').hide();
            $form.find('.payment-errors').text("");
            // response contains id and card, which contains additional card details            
            console.log(response.id);
            console.log(response.card);
            var token = response.id;
            // AJAX - you would send 'token' to your server here.
            $.post('/account/stripe_card_token', {
                    token: token
                })
                // Assign handlers immediately after making the request,
                .done(function(data, textStatus, jqXHR) {
                    $form.find('.subscribe').html('Payment successful <i class="fa fa-check"></i>');
                })
                .fail(function(jqXHR, textStatus, errorThrown) {
                    $form.find('.subscribe').html('There was a problem').removeClass('success').addClass('error');
                    // Show Stripe errors on the form
                    $form.find('.payment-errors').text('Try refreshing the page and trying again.');
                    $form.find('.payment-errors').closest('.row').show();
                });
        } 
    }); */
}
	/* Fancy restrictive input formatting via jQuery.payment library*/
	$('input[name=cardNumber]').payment('formatCardNumber');
	$('input[name=cardCVC]').payment('formatCardCVC');
	$('input[name=cardExpiry').payment('formatCardExpiry');
	/* Form validation using Stripe client-side validation helpers */
	/*  jQuery.validator.addMethod("cardNumber", function(value, element) {
	    return this.optional(element) || Stripe.card.validateCardNumber(value);
	}, "Please specify a valid credit card number."); */
	/* jQuery.validator.addMethod("cardExpiry", function(value, element) {    
	    // Parsing month/year uses jQuery.payment library
	    value = $.payment.cardExpiryVal(value);
	    return this.optional(element) || Stripe.card.validateExpiry(value.month, value.year);
	}, "Invalid expiration date.");
	jQuery.validator.addMethod("cardCVC", function(value, element) {
	    return this.optional(element) || Stripe.card.validateCVC(value);
	}, "Invalid CVC."); */
	/* validator = $form.validate({
	    rules: {
	        cardNumber: {
	            required: true,
	            cardNumber: true            
	        },
	        cardExpiry: {
	            required: true,
	            cardExpiry: true
	        },
	        cardCVC: {
	            required: true,
	            cardCVC: true
	        }
	    },
	    highlight: function(element) {
	        $(element).closest('.form-control').removeClass('success').addClass('error');
	    },
	    unhighlight: function(element) {
	        $(element).closest('.form-control').removeClass('error').addClass('success');
	    },
	    errorPlacement: function(error, element) {
	        $(element).closest('.form-group').append(error);
	    }
	}); */
	paymentFormReady = function() {
	    if ($form.find('[name=cardNumber]').hasClass("success") &&
	        $form.find('[name=cardExpiry]').hasClass("success") &&
	        $form.find('[name=cardCVC]').val().length > 1) {
	        return true;
	    } else {
	        return false;
	    }
	}
	// $form.find('.subscribe').prop('disabled', true);
	var readyInterval = setInterval(function() {
	    if (paymentFormReady()) {
	        $form.find('.subscribe').prop('disabled', false);
	        clearInterval(readyInterval);
	    }
	}, 250); 
	
	
</script>
<!-- pay end -->

</head>
<body>

	<jsp:include page="/include/header.jsp"/>		
		
	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>예약 진행</h2>
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
	</section>  <!-- end header -->


	<!-- Start content -->
	<section style="width:80%; margin-top:70px; margin-left:auto; margin-right:auto; margin-bottom:50px">
	
	
	<form name="bookingForm" role="form" id="payment-form" method="POST"
		action="${pageContext.request.contextPath}/booking/book.cr" onsubmit="return checkForm()">
	<div class="dividerHeading">
		<h4><span>[회원정보]</span></h4>
	</div>
	<br/>
	
		<section style="margin-left:30px; margin-bottom:30px">
		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userName"><i class="fa fa-user"></i> 예약자 성명</label>
						<input type="text" class="form-control" name="userName" value="${loginUser.name}"
							placeholder="예약자 성명" required autofocus />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userEmail"><i class="fa fa-envelope"></i> 예약자 이메일</label>
						<input type="text" class="form-control" name="userEmail" value="${loginUser.email}"
						placeholder="email@cheaproom.com" required />
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-7 col-md-7">
				<div class="form-group">
					<label for="userPhone"><i class="fa fa-phone"></i> 예약자 연락처</label>
					<input type="text" class="form-control" name="userPhone" value="${loginUser.phone}"/>
				</div>
			</div>
		</div>
		
		</section>
		
		<div class="dividerHeading">
			<h4><span>[예약정보]</span></h4>
		</div>
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
		  	<input type="hidden" name="hotelNo" value="${booking.hotelNo}"/>
		  	<input type="hidden" name="roomNo" value="${booking.roomNo}"/>
		  	<input type="hidden" name="startDate" value="${booking.startDate}"/>
		  	<input type="hidden" name="endDate" value="${booking.endDate}"/>
		  	<input type="hidden" name="totalPerson" value="${booking.totalPerson}"/>
		  	<input type="hidden" name="totalPrice" value="${booking.totalPrice}"/>
		  	
		 </section>
		
		<div class="row" style="display: none;">
			<div class="col-xs-7 col-md-7">
				<p class="payment-errors"></p>
			</div>
		</div>
	<!-- </form> -->
	
		<div class="dividerHeading">
			<h4><span>[결제정보]</span></h4>
		</div>
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
			<jsp:include page="/include/pay.jsp" />
		</div>
		
		<!-- 예약 완료 버튼 -->
		<div class="row">
			<span class="col-xs-2 col-md-2" style="float:right; margin-right:10px" >
				<button class="subscribe btn btn-success btn-lg btn-block" onclick="goBack()"
					type="button">취소</button>
			</span>
			<span class="col-xs-3 col-md-3" style="float:right; margin-right:10px" >
				<input class="subscribe btn btn-success btn-lg btn-block"
					type="submit" value="예약완료"/>
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
	
	function clickPay(){
		if(checkPayForm()){
			alert("결제 요청이 완료되었습니다.");
			var btn = document.getElementById("payBtn");
			btn.disabled = "disabled";
			btn.value="결제 완료";
		}else {
			// alert("결제 요청이 실패했습니다.\n 다시 시도해주세요.");
		}
	}
	
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
		
		function checkPayForm(){
			var result = false;
			var cardNo = document.bookingForm.cardNo.value;
			var cardType = document.bookingForm.cardType.value;
			var cardDate = document.bookingForm.cardDate.value;
			if(cardNo==""){
				alert("카드번호를 입력해주세요.");
				console.log(cardNo);
			}else {	
				if(cardType==""){
					alert("카드 타입을 입력해주세요.");
					console.log(cardType);
				}else {
					if(cardDate==""){
						alert("카드 날짜를 입력해주세요.");
						console.log(cardDate);
					}else {
						result = true;
					}
				}
			}
			console.log("pay: "+result);
			return result;
		}
		
		function checkForm(){
			if(checkUserForm()){
				document.bookingForm.submit;
			}else {
				alert("모든 정보를 정확히 입력해주세요.");
			}
		}
		
		function goBack(){
			location.href = "${pageContext.request.contextPath}/roomList.cr?hotelNo=${param.hotelNo}";
		}
	</script>
</body>
</html>