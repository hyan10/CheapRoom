<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>싸다방</title>
<meta name="description" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- CSS FILES -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" media="screen" data-name="skins">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-fraction.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fractionslider.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/switcher.css" media="screen" />


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
	
	<!-- 통계 -->
<!-- <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script> -->
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
window.onload = function () {
	
	var data = ${chartList};
	var barDataPoints=[];
	var lineDataPoints_count=[];
	var lineDataPoints_person=[];

	
	console.log(data);
	console.log(data.length);
		
	  for(var i=0; i<data.length ; i++){
		 barDataPoints.push({ y: data[i].profit,
							label: data[i].month+"월"});	
		 lineDataPoints_count.push({x: data[i].month,
			 						y: data[i].count});		 
		 lineDataPoints_person.push({x: data[i].month,
			 						y: data[i].totalPerson});
	 }
	
	  console.log(lineDataPoints_count);
	  console.log(lineDataPoints_person);
	
	// 금액 그래프
    var barChart = new CanvasJS.Chart("barChartContainer",
    {
      title:{
        text: "월별 수익"  
      },
      animationEnabled: true,
     /*  axisY: {
        title: "Reserves(MMbbl)"
      }, */
      legend: {
        verticalAlign: "bottom",
        horizontalAlign: "center"
      },
      theme: "theme2",
      data: [

      {        
        type: "column",  
        showInLegend: true, 
        legendMarkerColor: "grey",
        /* legendText: "MMbbl = one million barrels", */
        dataPoints: barDataPoints
      }   
      ]
    });

    barChart.render();
    
    // 건수 그래프
    var lineChart = new CanvasJS.Chart("lineChartContainer",
    		{
    			title:{
    				text: "월 별 예약 건수, 방문객 수"
    				/* ,fontSize: 30 */
    			},
                            animationEnabled: true,
    			axisX:{

    				gridColor: "Silver",
    				tickColor: "silver"
    				/* ,valueFormatString: "DD/MMM" */

    			},                        
                            toolTip:{
                              shared:true
                            },
    			theme: "theme2",
    			axisY: {
    				gridColor: "Silver",
    				tickColor: "silver"
    			},
    			legend:{
    				verticalAlign: "center",
    				horizontalAlign: "right"
    			},
    			data: [
    			{        
    				type: "line",
    				showInLegend: true,
    				lineThickness: 2,
    				name: "예약 건수",
    				color: "#F08080",
    				dataPoints: lineDataPoints_count
    			},
    			{        
    				type: "line",
    				showInLegend: true,
    				name: "방문객 수",
    				markerType: "square",
    				color: "#20B2AA",
    				lineThickness: 2,
    				dataPoints: lineDataPoints_person
    			}
    			],
              legend:{
                cursor:"pointer",
                itemclick:function(e){
                  if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                  	e.dataSeries.visible = false;
                  }
                  else{
                    e.dataSeries.visible = true;
                  }
                  lineChart.render();
                }
              }
    		});

    lineChart.render();
  }
</script>
</head>
<body>
	<header>
		 <!-- Nav Bar -->
	    <div id="nav-bar" class="clearfix">
	        <div class="container">
	            <div class="row">
	                <!-- Logo / Mobile Menu -->
					<div class="col-sm-2">
						<div id="logo">
							<h1>
								<a href="${ pageContext.request.contextPath }"><img src="${ pageContext.request.contextPath }/img/logo.png" alt="League" /></a>
							</h1>
						</div>
					</div>
			
					<!-- Navigation
	                ================================================== -->
	                <!-- Nav menu -->
	                
	                <c:if test="${ loginUser.type eq 'S' }">
	              		   <jsp:include page="/include/adminMenu.jsp"/>
	               		[${ loginUser.email} 관리자님 접속중]
						<a href="${ pageContext.request.contextPath }/user/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
	               </c:if>
	               
	            </div> <!-- end row -->
	        </div> <!-- end container  -->
	    </div> <!-- end nav-bar -->
	    <!-- End Nav Bar -->
	</header>
	<!--End Header-->
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>통계</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="index.html">Home</a></li>
								<li><a href="index.html">Blog</a></li>
								<li>Blog Medium Images</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
	</section>  <!-- end wrapper -->
		
		<!-- 통계 영역 -->
		<section class="content blog">
			<div class="container">
			

				<div class="row" style="margin-bottom:50px;" align="center">
			<%-- 	<form name="monthForm" action="${pageContext.request.contextPath}/booking/testChart.cr" method="get">
					<div class="col-md-8">		
						월 선택: <select class="form-control col-lg-3" name="month">
							<c:forEach var="i" begin="1" end="${maxMonth}">
								<option value="${i}" 
									<c:if test="${i eq month}">
										selected="selected"
									</c:if>
								>${i}월</option>								
							</c:forEach>						
						</select>						
						<input type="submit" value="통계 보기"/>
					</div>
				</form> --%>
			
				<!-- 설명할거 있으면 여기에 -->
				<div class="project_description">
					<div class="widget_title dividerHeading">
					<!-- ${chartList[0].year} -->
					<!-- ${param.year} -->
						<h4><span><b>2017년 통계 리스트</b></span></h4>
					</div>
						<p>Lorem ipsum dolor sit amet, consectetur adip, sed do eiusmod tempor incididunt ut aut reiciendise voluptat maiores alias aut et perferendis doloribus asperiores ut labore.</p>
						<p> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				</div> <!-- end description -->
				
				<!-- 금액 그래프 -->
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8" style="margin-bottom:50px;">
					<div id="barChartContainer" style="height: 300px; width: 100%;"></div>
				</div>
				
				<!-- 건수 그래프 -->
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
					<div id="lineChartContainer" style="height:300px; width:100%;"></div>
				</div>
			</div> <!-- end row -->
				
				
				<div class="row">
				<!--Sidebar Widget--> <!-- 월별 리스트 -->
					<div>  <!-- class="col-xs-12 col-md-4 col-lg-4 col-sm-4"> -->
						<div class="sidebar">
	
							<!-- for문 -->
							<c:forEach var="chart" items="${chartList}">
								<!-- <div class="row sub_content"> -->
									
									<div class="col-lg-4 col-md-4 col-sm-4">	
										<!-- 통계 자료 내용 -->						
										<div class="project_details">
											<div class="widget_title">
												<h4><span><b>${chart.month}월</b></span></h4>
											</div>
											<ul class="details">
												<li><span>총 예약 건수 :</span>${chart.count}</li>
												<li><span>총 예약 인원 :</span>${chart.totalPerson}</li>
												<li><span>예약 총액 :</span>${chart.profit}</li>
												<!-- <li><span>Date :</span> 03 March 2014</li>
												<li><span>Project URL :</span> <a href="#">www.bestjquery.com</a></li> -->
											</ul>
										</div> <!-- end detail -->
										
									</div> 
								<!-- </div> --> <!-- row_sub_content 끝 한줄씩 나옴, 지우면 옆으로 쭉쭉 -->
							</c:forEach>
							<!-- for문 끝 -->
	
						</div> <!-- end class=sidebar -->
					 </div> <!-- end class col-xs/md/sm --> <!-- 좌측 내용 끝 -->
					<!-- end Sidebar -->
				</div> <!-- end row -->
			</div> <!-- end container -->
		</section>
		
	<!--start footer-->
	<footer class="footer">
		<jsp:include page="/include/footer.jsp" />
	</footer>
	<!--end footer-->

	<section class="footer_bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<p class="copyright">&copy; Copyright 2014 League | Powered by  <a href="http://www.jqueryrain.com/">jQuery Rain</a></p>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="footer_social">
						<ul class="footbot_social">
							<li><a class="fb" href="#." data-placement="top" data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
							<li><a class="twtr" href="#." data-placement="top" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a class="dribbble" href="#." data-placement="top" data-toggle="tooltip" title="Dribbble"><i class="fa fa-dribbble"></i></a></li>
							<li><a class="skype" href="#." data-placement="top" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
							<li><a class="rss" href="#." data-placement="top" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendor/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/retina-1.1.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script> <!-- jQuery cookie -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/styleswitch.js"></script> <!-- Style Colors Switcher -->
    <script src="${pageContext.request.contextPath}/js/jquery.fractionslider.js" type="text/javascript" charset="utf-8"></script>

    <script src="${pageContext.request.contextPath}/js/jquery.superfish.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jcarousel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jflickrfeed.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/swipe.js"></script>

	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	
	
</body>
</html>