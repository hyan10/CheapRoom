<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/search.css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/js/moment.min.js"></script>         
<script src="/js/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="/css/daterangepicker.css" />
<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->
<script type="text/javascript" src="http://cdn.mxpnl.com/libs/mixpanel-2.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="well-searchbox">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-md-4 control-label">Keyword</label>
				<div class="col-md-8">
					<input type="text" class="form-control" placeholder="Keyword">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">Date</label>
				<div class="col-md-8">		
					<input type="text" class="form-control" placeholder="Date" name="datefilter" value="" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">Country</label>
				<div class="col-md-8">
					<select class="form-control" placeholder="Country">
						<option value="">All</option>
						<option value="">Country 1</option>
						<option value="">Country 2</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">Province</label>
				<div class="col-md-8">
					<select class="form-control" placeholder="Province">
						<option value="">All</option>
						<option value="">Province 1</option>
						<option value="">Province 2</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">City</label>
				<div class="col-md-8">
					<select class="form-control" placeholder="City">
						<option value="">All</option>
						<option value="">City 1</option>
						<option value="">City 2</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">Category</label>
				<div class="col-md-8">
					<select class="form-control" placeholder="Category">
						<option value="">All</option>
						<option value="">Category 1</option>
						<option value="">Category 2</option>
					</select>
				</div>
			</div>
			<div class="col-sm-offset-4 col-sm-5">
				<button type="submit" class="btn btn-success">Search</button>
			</div>
		</form>
	</div>
</body>
</html>