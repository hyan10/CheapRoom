<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<!-- 	<form name="paymentForm" role="form" id="payment-form" method="POST"
							action="javascript:void(0);"> -->
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label for="cardNumber">CARD NUMBER</label>
										<div class="input-group">
											<input type="tel" class="form-control" name="cardNo"
												placeholder="Valid Card Number" autocomplete="cc-number"
												required autofocus />
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
											class="form-control" name="cardDate" placeholder="MM / YY"
											autocomplete="cc-exp" required />
									</div>
								</div>
								<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cardCVC">Card Type</label> <input type="text"
											class="form-control" name="cardType" placeholder="cardType"
											autocomplete="cc-csc" required />
									</div>
								</div>
							</div>
							<!-- <div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label for="couponCode">COUPON CODE</label> <input type="text"
											class="form-control" name="couponCode" />
									</div>
								</div>
							</div> -->
							<div class="row">
								<div class="col-xs-12">
									<input id="payBtn" class="subscribe btn btn-success btn-lg btn-block"
										type="button" value="결제 요청" onclick="clickPay()">
								</div>
							</div>
							<div class="row" style="display: none;">
								<div class="col-xs-12">
									<p class="payment-errors"></p>
								</div>
							</div>
						<!-- </form> -->
					</div>
				</div>
				<!-- CREDIT CARD FORM ENDS HERE -->


			</div>

		</div>
	</div>