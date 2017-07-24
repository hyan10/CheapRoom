<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Start Header-->
	<header id="header" class="clearfix"> <!-- Nav Bar -->
	<div id="nav-bar" class="clearfix">
		<div class="container">
			<div class="row">
				<!-- Logo / Mobile Menu -->
				<div class="col-sm-2">
					<div id="logo">
						<h1>
							<a href="index.jsp"><img
								src="${pageContext.request.contextPath}/img/logo.png"
								alt="League" /></a>
						</h1>
					</div>
					<!-- end logo -->
				</div>
				<!-- end col-sm-2-1 -->
				<c:if test="${ loginUser.type eq 'U' }">
					<jsp:include page="/include/userMenu.jsp" />
              		[${ loginUser.email}님 접속중]
				<a href="${ pageContext.request.contextPath }/user/logout.cr"
						class="btn btn-primary btn-lg" role="button">로그아웃</a>
				</c:if>
				<!-- end col-sm-2-2 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container  -->
	</div>
	<!-- end nav-bar --> <!-- End Nav Bar --> </header>
	<!--End Header-->