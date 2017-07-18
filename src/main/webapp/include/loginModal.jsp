<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" data-backdrop="false" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" align="center">
				<img class="img-circle" id="img_logo" src="img/cheapRoom_logo.png"
					width="30%" height="30%">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</button>
			</div>

			<!-- Begin # DIV Form -->
			<div id="div-forms">
				<!-- Begin # Login Form -->
				<form id="login-form" method="post" action="${ pageContext.request.contextPath }/user/login.cr">
					<div class="modal-body">
						<div id="div-login-msg">
							<div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
							<span id="text-login-msg">이메일과 비밀번호를 입력하세요.</span>
						</div>
						<input id="email" name="email" class="form-control" type="text" placeholder="이메일" required> 
						<input id="password" name="password" class="form-control" type="password" placeholder="비밀번호" required>
						<label>사업자 로그인 <input name="loginType" onclick="changeFormAction(this)" type="checkbox" value="${ pageContext.request.contextPath }/owner/login.cr"/></label>
						<!-- <div class="checkbox">
							<label> <input type="checkbox"> 아이디 저장
							</label>
						</div> -->
					</div>
					<div class="modal-footer">
						<div> 
							<Button type="submit" class="btn btn-primary btn-lg btn-block">로그인</Button>
						</div>
						<div>
							<button id="login_register_btn" type="button" class="btn btn-link">일반 사용자 가입</button>
							<button id="login_owner_btn" type="button" class="btn btn-link">사업자 회원등록</button>
						</div>
					</div>
				</form>
				<!-- End # Login Form -->

				<!-- Begin | Lost Password Form -->
				<!-- <form id="lost-form" style="display: none;">
					<div class="modal-body">
						<div id="div-lost-msg">
							<div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right"></div>
							<span id="text-lost-msg">Type your e-mail.</span>
						</div>
						<input id="lost_email" class="form-control" type="text"
							placeholder="E-Mail (type ERROR for error effect)" required>
					</div>
					<div class="modal-footer">
						<div>
							<button type="submit" class="btn btn-primary btn-lg btn-block">Send</button>
						</div>
						<div>
							<button id="lost_login_btn" type="button" class="btn btn-link">Log
								In</button>
							<button id="lost_register_btn" type="button" class="btn btn-link">Register</button>
						</div>
					</div>
				</form> -->
				<!-- End | Lost Password Form -->
				<!-- Begin | Register Owner Form -->
				<form id="register-owner-form" style="display: none;" method="post" action="${ pageContext.request.contextPath }/owner/join.cr" >
					<div class="modal-body">
						<div id="div-register-msg">
							<div id="icon-register-msg"
								class="glyphicon glyphicon-chevron-right"></div>
							<span id="text-register-msg">사업자 회원가입</span>
						</div>
						<div class="form-group">
							<label for="InputEmail">이메일 주소(ID)</label>
							<input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소" required>
						</div>
						<div class="form-group">
							<label for="InputPassword1">비밀번호</label> 
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
						</div>
					
						<div class="form-group">
							<label for="username">이름</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요" required>
						</div>
						<div class="form-group">
							<label for="phone">휴대전화 번호</label> 
							<input type="text" class="form-control" id="phone" name="phone" placeholder="- 없이 입력해 주세요" required>
						</div>
						<div class="form-group">
							<label for="crn">사업자 등록번호</label> 
							<input type="text" class="form-control" id="crn" name="crn" placeholder="사업자 번호를 - 없이 입력해 주세요" required>
						</div>
						<!-- <input id="register_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
                            <input id="register_email" class="form-control" type="text" placeholder="E-Mail" required>
                            <input id="register_password" class="form-control" type="password" placeholder="Password" required> -->
					</div>
					<div class="modal-footer">
						<div class="form-group text-center">
							<button type="submit" class="btn btn-info">
								회원가입<i class="fa fa-check spaceLeft"></i>
							</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal">
								가입취소<i class="fa fa-times spaceLeft"></i>
							</button>
						</div>
						<!-- <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
                            </div> -->
						<div>
							<button id="owner_login_btn" type="button" class="btn btn-link">로그인</button>
						</div>
					</div>
				</form>
				<!-- End | Register Owner Form -->
				<!-- Begin | Register User Form -->
				<form id="register-user-form" style="display: none;" method="post" action="${ pageContext.request.contextPath }/user/join.cr" >
					<div class="modal-body">
						<div id="div-register-msg">
							<div id="icon-register-msg"
								class="glyphicon glyphicon-chevron-right"></div>
							<span id="text-register-msg">${ pageContext.request.contextPath }일반 사용자 회원가입</span>
						</div>
						<div class="form-group">
							<label for="InputEmail">이메일 주소(ID)</label>
							<input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소" required>
						</div>
						<div class="form-group">
							<label for="InputPassword1">비밀번호</label> 
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
						</div>
					
						<div class="form-group">
							<label for="username">이름</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요" required>
						</div>
						<div class="form-group">
							<label for="phone">휴대전화 번호</label> 
							<input type="text" class="form-control" id="phone" name="phone" placeholder="- 없이 입력해 주세요" required>
						</div>
						<!-- <input id="register_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
                            <input id="register_email" class="form-control" type="text" placeholder="E-Mail" required>
                            <input id="register_password" class="form-control" type="password" placeholder="Password" required> -->
					</div>
					<div class="modal-footer">
						<div class="form-group text-center">
							<button type="submit" class="btn btn-info">
								회원가입<i class="fa fa-check spaceLeft"></i>
							</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal">
								가입취소<i class="fa fa-times spaceLeft"></i>
							</button>
						</div>
						<!-- <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
                            </div> -->
						<div>
							<button id="register_login_btn" type="button"
								class="btn btn-link">로그인</button>
						<!-- 	<button id="register_lost_btn" type="button" class="btn btn-link">Lost
								Password?</button> -->
						</div>
					</div>
				</form>
				<!-- End | Register Form -->

			</div>
			<!-- End # DIV Form -->

		</div>
	</div>
</div>
<!-- END # MODAL LOGIN -->