<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <!--<![endif]-->
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>싸다방</title>
	<meta name="description" content="">
		<%-- <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/search.css" /> --%>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- CSS FILES -->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/vendor/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style-fraction.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/fractionslider.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/switcher.css" media="screen" />
	
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
     
	<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/searchDate.js"></script>

	
	<script type="text/javascript">
		var j = jQuery.noConflict();
		j(function(){
		    j('input[name="dateRange"]').daterangepicker({
		    		locale: {
			    		format : 'YYYY-MM-DD',
			    		cancelLabel : '취소',
			    		applyLabel : '확인'
			    }			    
		    }, 
		    function(start, end, label) {
			  //  alert("예약 날짜 : " + start.format('YYYY-MM-DD') + '에서 ' + end.format('YYYY-MM-DD') + '까지 예약하시겠습니까?');
			});
		    j('input[name="dateRange"]').on('cancel.daterangepicker', function(ev, picker) {
				$(this).val('');
			});
		});
		function changeFormAction(checkbox){
		    document.getElementById("login-form").action = checkbox.value;
		}
	</script>
    
</head>
<body>
	<header id="header" class="clearfix">
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
                <jsp:include page="/include/loginModal.jsp"/>
                
                <c:choose>
	                <c:when test="${ empty loginUser}">
		                <a href="#" class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#login-modal">로그인</a>                		
	                </c:when>
					<c:otherwise>
						<c:if test="${ loginUser.type eq 'U' }">
							<jsp:include page="/include/userMenu.jsp"/>
			                		[${ loginUser.email}님 접속중]
								<a href="${ pageContext.request.contextPath }/user/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
		                </c:if>
						<c:if test="${ loginUser.type eq 'S' }">
						<jsp:include page="/include/adminMenu.jsp"/>
		                		[${ loginUser.email} 관리자님 접속중]
							<a href="${ pageContext.request.contextPath }/user/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
		                </c:if>
		                <c:if test="${ loginUser.type eq 'O' }">
		               		   <jsp:include page="/include/ownerMenu.jsp"/>
		                		[${ loginUser.email} 사업자님 접속중]
							<a href="${ pageContext.request.contextPath }/owner/logout.cr" class="btn btn-primary btn-lg" role="button">로그아웃</a>
		                </c:if>
					</c:otherwise>                
                </c:choose>
                </div>
            </div>
        </div>
    </div>
    <!-- End Nav Bar -->
</header>
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>숙소 검색</h2>
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
		</section>  <!-- end wrapper -->
		
		
		<section class="content blog">
			<div class="container">
			
				<div class="row">
					
					<!--Sidebar Widget-->
					<div class="col-xs-12 col-md-4 col-lg-4 col-sm-4">
						<div class="sidebar">
							<!-- 검색창 -->
							<div style="margin-bottom:30px">
								<jsp:include page="/include/searchForm.jsp"/>
							</div>
							
							<!-- category -->
							<div class="widget widget_categories">
								<div class="widget_title">
									<h4><span>Categories</span></h4>
								</div>
								<ul class="arrows_list">
									<li><a href="#"><i class="fa fa-angle-right"></i> Graphic Design (10)</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> Web Design & Development (25)</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> Photography (29)</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> Custom Illustrations (19)</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> Wordpress Themes(38)</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> Videography (33)</a></li>
								</ul>
							</div>
							
							<!-- 글씨부분 -->
							<div class="widget widget_about">
								<div class="widget_title">
									<h4><span>Basic Text Widget</span></h4>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adip, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							</div>
							
						<!-- 탭 -->
                          <div class="widget widget_tab">
                              <ul id="myTab" class="nav nav-tabs">
                                  <li class="active"><a href="#Popular" data-toggle="tab">Popular</a></li>
                                  <li class=""><a href="#Recent" data-toggle="tab">Recent</a></li>
                                  <li class="last-tab"><a href="#Recent-Comment" data-toggle="tab"><i class="fa fa-comments-o"></i></a></li>
                              </ul>
                              <div id="myTabContent" class="tab-content clearfix">
                                  <div class="tab-pane fade active in" id="Popular">
                                      <ul class="recent_tab_list">
                                          <li>
                                              <span><a href="#"><img src="${pageContext.request.contextPath}/img/content/recent_1.png" alt="" /></a></span>
                                              <a href="#">Publishing packag esanse web page editos</a>
                                              <i>June 03, 2014</i>
                                          </li>
                                          <li>
                                              <span><a href="#"><img src="${pageContext.request.contextPath}/img/content/recent_2.png" alt="" /></a></span>
                                              <a href="#">Sublishing packag esanse web page editos</a>
                                              <i>June 02, 2014</i>
                                          </li>
                                          <li class="last-tab">
                                              <span><a href="#"><img src="${pageContext.request.contextPath}/img/content/recent_3.png" alt="" /></a></span>
                                              <a href="#">Mublishing packag esanse web page editos</a>
                                              <i>June 01, 2014</i>
                                          </li>
                                      </ul>
                                  </div>
                                  <div class="tab-pane fade" id="Recent">
                                      <ul class="recent_tab_list">
                                          <li>
                                              <span><a href="#"><img src="${pageContext.request.contextPath}/img/content/recent_4.png" alt="" /></a></span>
                                              <a href="#">Various versions has evolved over the years</a>
                                              <i>July 03, 2014</i>
                                          </li>
                                          <li>
                                              <span><a href="#"><img src="${pageContext.request.contextPath}/img/content/recent_5.png" alt="" /></a></span>
                                              <a href="#">Rarious versions has evolve over the years</a>
                                              <i>July 02, 2014</i>
                                          </li>
                                          <li class="last-tab">
                                              <span><a href="#"><img src="${pageContext.request.contextPath}/img/content/recent_6.png" alt="" /></a></span>
                                              <a href="#">Marious versions has evolven over the years</a>
                                              <i>July 01, 2014</i>
                                          </li>
                                      </ul>
                                  </div>
                                  <div class="tab-pane fade" id="Recent-Comment">
                                      <ul class="comments">
                                          <li class="comments_list">
                                              <a class="post-thumbnail" href="#"><img width="60" height="60" src="${pageContext.request.contextPath}/img/content/recent_3.png" alt="#"></a>
                                              <p><strong><a href="#">LaraDut</a> <i>says: </i> </strong> Morbi augue velit, tempus mattis dignissim nec, porta sed risus. Donec eget magna eu lorem tristique pellentesque eget eu dui. Fusce lacinia tempor malesuada.</p>
                                          </li>
                                          <li class="comments_list">
                                              <a class="post-thumbnail" href="#"><img width="60" height="60" src="${pageContext.request.contextPath}/img/content/recent_1.png" alt="#"></a>
                                              <p><strong><a href="#">Ronny</a> <i>says: </i> </strong> Tempus mattis dignissim nec, porta sed risus. Donec eget magna eu lorem tristique pellentesque eget eu dui. Fusce lacinia tempor malesuada.</p>
                                          </li>
                                          <li class="comments_list">
                                              <a class="post-thumbnail" href="#"><img width="60" height="60" src="${pageContext.request.contextPath}/img/content/recent_2.png" alt="#"></a>
                                              <p><strong><a href="#">Steve</a> <i>says: </i> </strong> Donec convallis, metus nec tempus aliquet, nunc metus adipiscing leo, a lobortis nisi dui ut odio. Nullam ultrices, eros accumsan vulputate faucibus, turpis tortor.</p>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                          
                          <!-- 태그 -->
							<div class="widget widget_tags">
								<div class="widget_title">
									<h4><span>Tags Widget</span></h4>
								</div>
								<ul class="tags">
									<li><a href="#"><b>business</b></a></li>
									<li><a href="#">corporate</a></li>
									<li><a href="#">css3</a></li>
									<li><a href="#"><b>html5</b></a></li>
									<li><a href="#">javascript</a></li>
									<li><a href="#"><b>jquery</b></a></li>
									<li><a href="#">multipurpose</a></li>
									<li><a href="#"><b>mysql</b></a></li>
									<li><a href="#">portfolio</a></li>
									<li><a href="#">premium</a></li>
									<li><a href="#">responsive</a></li>
									<li><a href="#"><b>theme</b></a></li>
									<li><a href="#"><b>jqueryrain</b></a></li>
								</ul>
							</div>
							<div class="widget widget_archives">
								<div class="widget_title">
									<h4><span>Archives</span></h4>
								</div>
								<ul class="archives_list">
									<li><a href="#"><i class="fa fa-angle-right"></i> July 2014</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> June 2014</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> May 2014</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> April 2014</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> March 2014</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> February 2014</a></li>
									<li><a href="#"><i class="fa fa-angle-right"></i> January 2014</a></li>
								</ul>
							</div>
						</div> <!-- end class=sidebar -->
					</div> <!-- end class col-xs/md/sm -->
					<!-- end Sidebar -->
					
					<jsp:include page="/include/hotelList.jsp"/>
					
					
				</div><!--/.row-->
			</div> <!--/.container-->
		</section>
	</section>
	<!--end wrapper-->

		<!--start footer-->
	<footer class="footer">
		<jsp:include page="/include/footer.jsp" />
	</footer>
	<!--end footer-->
	
	<section class="footer_bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<p class="copyright">&copy; Copyright 2014 League | Powered by  <a href="http://www.jqueryrain.com//">jQuery Rain</a></p>
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
	
	
	
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/vendor/jquery-1.10.2.min.js"></script>
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
 --%>	
	<!-- Start Style Switcher -->
	<div class="switcher"></div>
	<!-- End Style Switcher -->
</body>
</html>
