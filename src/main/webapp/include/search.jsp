<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="well-searchbox">
		<form class="form-horizontal" role="form">
			
			<div class="form-group">
				<label class="col-md-4 control-label">지역</label>
				<div class="col-md-8">
					<select class="form-control" placeholder="City">
						<option value="">서울특별시</option>
						<option value="">인천광역시</option>
						<option value="">경기도</option>
						<option value="">충청북도</option>
						<option value="">충청남도</option>
						<option value="">강원도</option>
						<option value="">전라북도</option>
						<option value="">전라남도</option>
						<option value="">경상남도</option>
						<option value="">경상북도</option>
						<option value="">대전광역시</option>
						<option value="">대구광역시</option>
						<option value="">울산광역시</option>
						<option value="">광주광역시</option>
						<option value="">제주특별자치도</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">예약날짜 선택</label>
				<div class='col-md-8'>
					<div class='input-group date'>
						<input name="daterange" value="검색 날짜 선택" type='text' class="form-control" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">인원 선택</label>
				<div class="col-md-8">
					<input type="text" class="form-control" placeholder="인원 선택">
				</div>
			</div>
			<!-- <div class="form-group">
				<label class="col-md-4 control-label">인원 선택</label>
				<div class="col-md-8">
					<select class="form-control" placeholder="Category">
						<option value="">인원 선택</option>
						<option value="">1</option>
						<option value="">2</option>
						<option value="">3</option>
						<option value="">4</option>
						<option value="">5</option>
						<option value="">6</option>
						<option value="">7</option>
						<option value="">8</option>
						<option value="">9</option>
						<option value="">10</option>
					</select>
				</div>
			</div> -->
			<div class="col-sm-offset-4 col-sm-5">
				<button type="submit" class="btn btn-success">검색</button>
			</div>
		</form>
	</div>
