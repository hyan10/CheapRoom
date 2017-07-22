<%@page import="kr.co.bit.cr.booking.BookingController"%>
<%@page import="kr.co.bit.cr.booking.BookingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/list.css"/>
<link rel="shortcut icon" href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico" type="image/x-icon">
<link rel="icon" href="//d2d3qesrx8xj6s.cloudfront.net/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="//d2d3qesrx8xj6s.cloudfront.net/apple-touch-icon-144x144-precomposed.png">
<link rel="alternate" type="application/rss+xml" title="Latest snippets from Bootsnipp.com" href="https://bootsnipp.com/feed.rss" />

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
<!--    <link rel="stylesheet" href="//d2d3qesrx8xj6s.cloudfront.net/dist/bootsnipp.min.css?ver=872ccd9c6dce18ce6ea4d5106540f089">-->
<link rel="stylesheet" href="/dist/bootsnipp.min.css">
</head>
<body>
	<table class="table table-striped sub_content" style="width:80%; margin:auto">
     <thead>
        <tr class="row-name">
           <!-- <th style="width:12%">Check/UnCheck</th> -->
           <th>사업자 이름</th>
           <th>이메일</th>
           <th>phone</th>
           <th>가입날</th>
           <td>사업자등록번호</th>
           <th>승인/거부</th>
           <th></th>
        </tr>
     </thead>   
     <tbody>
     <!-- for문 -->
     <c:forEach var="owner" items="${ownerList }">
        <tr class="row-content">
           <!-- <td class="check" "> <label><input type="checkbox" value=""></label></td> -->
           <td>${owner.name}</td>
           <td>${owner.email}</td>
           <td>${owner.phone}</td>
           <td>${owner.regDate}</td>
           <td>${owner.crn }</td>
           <td>
              <a class="btn btn-info edit" href="${pageContext.request.contextPath}/admin/admission.cr?ownerNo=${owner.no}" aria-label="Settings">
                <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
              </a> 
         <%--      <a class="btn btn-danger edit" href="${pageContext.request.contextPath}/admin/admission.cr" aria-label="Settings">
                <i class="fa fa-times" aria-hidden="true"></i>
              </a> --%>
              <form:form method="delete" action="${pageContext.request.contextPath}/admin/admission.cr?ownerNo=${owner.no }">
     			<p class="submit"><input type="submit" value="a"/></p>
			  </form:form>
              &nbsp 
           </td>
        </tr>
     </c:forEach>
     </tbody>
  </table>
  
  
</body>
</html>