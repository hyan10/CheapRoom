<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="well-searchbox" style="float: left;">
		<form class="form-horizontal" role="form" method="get" onsubmit="return checkDateForm();" action="${ pageContext.request.contextPath }/hotel/hotelList.cr">
			<div class="form-group">
				<label class="col-md-4 control-label">지역</label>
				<div class="col-md-8">
					<select id="selectBox" class="form-control" name="cityNo">
						<option value="1" selected="selected">서울특별시</option>
						<option value="2">인천광역시</option>
						<option value="3">경기도</option>
						<option value="4">충청북도</option>
						<option value="5">충청남도</option>
						<option value="6">강원도</option>
						<option value="7">전라북도</option>
						<option value="8">전라남도</option>
						<option value="9">경상북도</option>
						<option value="10">경상남도</option>
						<option value="11">대전광역시</option>
						<option value="12">대구광역시</option>
						<option value="13">울산광역시</option>
						<option value="14">부산광역시</option>
						<option value="15">광주광역시</option>
						<option value="16">제주도</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">예약날짜 선택</label>
				<div class='col-md-8'>
					<div class='input-group date'>
								<input name="dateRange" value="" type='text' class="form-control" /> 
								<span class="input-group-addon"> 
								<span class="glyphicon glyphicon-calendar"></span>
								</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">인원 선택</label>
				<div class="col-md-8">
					<input type="number" id="personNo" name="personNo" class="form-control" value="2" placeholder="인원 선택">
				</div>
			</div>
			<div class="col-sm-offset-4 col-sm-5">
				<input type="submit" class="btn btn-info"  value="검색"/>
				<%-- <a href="${ pageContext.request.contextPath }/hotel/hotelList.cr">검색</a> --%>
				
			</div>
		</form>
	</div>
