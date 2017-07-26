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
								<img src="https://s3.ap-northeast-2.amazonaws.com/cheaproom/upload/hotel/${hotel.imgUrl}" alt="blog post">
							</a>
						</figure>
						
						<!-- 내용 -->
						<div class="post_content">
							<div class="post_meta">
								<h2>
									<a href="${pageContext.request.contextPath}/hotel/roomList.cr?hotelNo=${hotel.no}"> ${hotel.name}</a>
								</h2>
								<div class="metaInfo">
									<span><i class="fa fa-map-marker"></i><a href="#">${hotel.addr}</a> </span>
								</div>
							</div>
							<p>${hotel.description}</p>
							
							<!-- 오른쪽 하단 -->
							<div align="right">
								<h3>1박요금: <font color="red">${hotel.rooms[0].price}</font></h3>
								<br/>
								청결도 : ${hotel.review.cleanliness }
							편안함 : ${hotel.review.comfort }
							위치  : ${hotel.review.location }
							시설  : ${hotel.review.facilities }
							직원  : ${hotel.review.staff }
								<a class="btn btn-small btn-default" href="${pageContext.request.contextPath}/hotel/roomList.cr?hotelNo=${hotel.no}">객실 보기</a>
							</div>
						</div> <!-- 내용 끝 -->
							
						<!-- 찜하기 -->
						<div class="post_date" >
						<c:choose>
							<c:when test="${hotel.favorite == 'Y' }">
								<a>
									<span class="day"><i id="favorite" class="fa fa-heart"></i></span>
								</a>
							</c:when>
							<c:when test="${hotel.favorite == 'N' }">
								<a>
									<span class="day"><i id="favorite" class="fa fa-heart-o"></i></span>
								</a>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>

							<%-- 		<a href="${pageContext.request.contextPath}/user/favorite.cr?hotelNo=${hotel.no }"> --%>
				<!-- 			<a>
									<span class="day"><i id="favorite" class="fa fa-heart-o"></i></span>
							</a> -->
									<!-- </a> -->
									<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
									<script>
									    $('.day').click(function(){
									        $.ajax({
									            url:"${pageContext.request.contextPath}/user/favorite.cr",
									            type:'GET',
									            data:{hotelNo: ${hotel.no}
									            },
									            success:function(data){
									            	console.log(data);
									                if(data == 'N'){
									                	alert('찜취소');
										                $("#favorite").attr('class','fa fa-heart-o');
									                }else{
									                	alert('찜');
									                	$("#favorite").attr('class','fa fa-heart');
									                }
									                
									            }
									        });
									    });
									</script>
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