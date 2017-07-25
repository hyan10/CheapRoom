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
						<h2>찜 목록</h2>
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
	<section style="width:80%; margin-top:30px; margin-left:auto; margin-right:auto; margin-bottom:100px">

		<div class="dividerHeading">
			<h4><span>[찜 목록]</span></h4>
		</div>
		<br/>
		
		<section style="margin-bottom:50px">
			<table class="table table-striped" style="width:80%; margin:auto">
	 
		      <jsp:include page="/include/favoriteList.jsp"/>

		  	</table>
		 </section>
		
		<div class="row" style="display: none;">
			<div class="col-xs-7 col-md-7">
				<p class="payment-errors"></p>
			</div>
		</div>

	
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

</body>
</html>