<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Start Header-->

	<header id="header" class="clearfix"> <!-- Nav Bar -->
	<div id="nav-bar" class="clearfix">
		<div class="container">
			<div class="row">
				<!-- Logo / Mobile Menu -->
				<div class="col-sm-2">
					<div id="logo">
						<h1>
							<c:choose>
								<c:when test="${ not empty loginUser }">
									<a href="${ pageContext.request.contextPath }/user/search.cr"><img
									src="${pageContext.request.contextPath}/img/hotel.png"
									alt="League" /></a>
								</c:when>
								<c:otherwise>
									<a href="${ pageContext.request.contextPath }"><img
									src="${pageContext.request.contextPath}/img/hotel.png"
									alt="League" /></a>
								</c:otherwise>
							</c:choose>
							
						</h1>
					</div>
					<!-- end logo -->
				</div>
				<!-- end col-sm-2-1 -->
				<jsp:include page="/include/loginModal.jsp"/>
			 	<c:if test="${ empty loginUser}">
			 	
		        		<a href="#" class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#login-modal">로그인</a>                		
                </c:if>
				<c:if test="${ loginUser.type eq 'U' }">
					<jsp:include page="/include/userMenu.jsp" />
              		<font color="white">[${ loginUser.email}님 접속중]</font>
				<a href="${ pageContext.request.contextPath }/user/logout.cr"
						class="btn btn-primary btn-lg" role="button">로그아웃</a>
				</c:if>
				<c:if test="${ loginUser.type eq 'O' }">
					<jsp:include page="/include/ownerMenu.jsp" />
              		<font color="white">[${ loginUser.email} 사업자님 접속중]</font>
				<a href="${ pageContext.request.contextPath }/owner/logout.cr"
						class="btn btn-primary btn-lg" role="button">로그아웃</a>
				</c:if>
				<c:if test="${ loginUser.type eq 'S' }">
					<jsp:include page="/include/adminMenu.jsp" />
              		<font color="white">[${ loginUser.email} 관리자님 접속중]</font>
				<a href="${ pageContext.request.contextPath }/user/logout.cr"
						class="btn btn-primary btn-lg" role="button">로그아웃</a>
				</c:if>
				<c:if test="${ loginUser.type eq 'N' }">
					<jsp:include page="/include/ownerMenu.jsp" />
              		<font color="white">[${ loginUser.email} 사업자님 접속중]<br/>(관리자의 가입 승인이 필요합니다.)</font>
				<a href="${ pageContext.request.contextPath }/owner/logout.cr"
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
	<jsp:include page="/include/loginModal.jsp"/>