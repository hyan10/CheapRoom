<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
			<div class="blog_medium">
			
			<!-- hotel List -->
				<c:forEach var="hotel" items="${hotelList}">
					<article class="post">
					
						<!-- 이미지 -->
						<figure class="post_img">
							<a href="#">
								<img src="${hotel.imgUrl}" alt="blog post">
							</a>
						</figure>
						
						<!-- 내용 -->
						<div class="post_content">
							<div class="post_meta">
								<h2>
									<a href="{pageContext.request.contextPath}/hotel/roomList.cr?hotelNo={${hotel.no}}""> ${hotel.name}</a>
								</h2>
								<div class="metaInfo">
									<span><i class="fa fa-user"></i><a href="#">${hotel.addr}</a> </span>
								</div>
							</div>
							<p>${hotel.description}</p>
							
							<!-- 오른쪽 하단 -->
							<div align="right">
								<h3>1박요금: <font color="red">${hotel.rooms[0].price}</font></h3>
								<br/>
								<a class="btn btn-small btn-default" href="${pageContext.request.contextPath}/hotel/roomList.cr?hotelNo=${hotel.no}">객실 보기</a>
							</div>
						</div> <!-- 내용 끝 -->
							
						<!-- 찜하기 -->
						<div class="post_date">
							<c:choose>
								<c:when test="false">
									<a href="#">
										<span class="day"><i class="fa fa-heart"></i></span>
										<span class="month">취소</span>
									</a>
								</c:when>
								<c:otherwise>
									<a href="#">
										<span class="day"><i class="fa fa-heart-o"></i></span>
										<span class="month">찜</span>
									</a>
								</c:otherwise>
							</c:choose>
						</div> <!-- 찜하기 끝 -->
					</article>
				</c:forEach>
			</div>
			
			<!-- 페이징 -->
			<div class="col-lg-12 col-md-12 col-sm-12">
				<ul class="pagination pull-right mrgt-0">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>