<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

 <jsp:include page="/include/loginModal.jsp"/>

<div class="col-sm-8">
	<nav id="navigation" class="menu">
		<ul id="">				
			<li><a href="${ pageContext.request.contextPath }/user/info.cr" class="border">내 정보</a>
			</li>

			<li><a href="${ pageContext.request.contextPath}/user/bookingList.cr">예약 보기</a>
			</li>

			<li><a href="${ pageContext.request.contextPath}/user/bookingHistoryList.cr">지난 예약보기</a>
			</li>

			<li><a href="${ pageContext.request.contextPath}/user/reviewList.cr">내 후기</a>
			</li>
			<li><a href="${pageContext.request.contextPath }/user/favoriteList.cr">찜목록</a>

			</li>

			<!-- <li><a href="#">Blog</a>
				<ul>
					<li><a href="blog-large-image.html">Large Image</a></li>
					<li><a href="blog-medium-image.html">Medium Image</a></li>
					<li><a href="blog-post.html">Single Post</a></li>
				</ul></li>
			<li><a href="contact.html">Contact</a></li> -->

		</ul>
	</nav>
</div>
