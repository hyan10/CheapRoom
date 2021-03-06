<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Include Required Prerequisites -->
<!-- <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<script type="text/javascript">	
	$(function(){
	    $('input[name="daterange"]').daterangepicker({
	    		locale: {
		    		format : 'YYYY-MM-DD',
		    		cancelLabel : '취소',
		    		applyLabel : '확인'
		    }
	    }, 
	    function(start, end, label) {
		    alert("예약 날짜 : " + start.format('YYYY-MM-DD') + '에서 ' + end.format('YYYY-MM-DD') + '까지 예약하시겠습니까?');
		});
	    $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});
	});
	
</script>
</head>
<body>
	<div class='col-md-5'>
		<div class='col-md-5'>
			<div class="form-group">
				<div class='input-group date'>
					<input name="daterange" type='text' class="form-control" /> 
					<span class="input-group-addon">
					<span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>