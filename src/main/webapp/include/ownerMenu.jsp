<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<div class="col-sm-10">
	<nav id="navigation" class="menu">
		<ul id="">
			<li><a href="${ pageContext.request.contextPath }/owner/ownerPage.cr" class="border">내 사업정보</a>
			</li>
			<li><a href="${ pageContext.request.contextPath }/hotel/hotelRegister.cr">숙소 등록</a>
				
			</li>

			<li><a href="${ pageContext.request.contextPath }/owner/bookingList.cr">현재 예약 현황</a>
			
			</li>

			<li><a href="${ pageContext.request.contextPath }/owner/bookingHistoryList.cr">지난 예약 보기</a>
			
			</li>
			<li><a href="${ pageContext.request.contextPath }/owner/chart.cr">수입 통계</a>
			
			</li>
		</ul>
	</nav>
</div>