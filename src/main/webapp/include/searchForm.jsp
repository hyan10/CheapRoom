<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 -->
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

Optional theme
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous"> -->

<!-- <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<!-- <script src="/js/moment.min.js"></script>         
<script src="/js/daterangepicker.js"></script> -->


<!-- <link rel="stylesheet" type="text/css" href="/css/daterangepicker.css" /> -->
<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 -->

	<div class="well-searchbox" style="float: left;">
		<form class="form-horizontal" role="form" method="get" onsubmit="return checkDateForm()" action="${ pageContext.request.contextPath }/hotel/hotelList.cr">
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
