<%@page import="kr.co.bit.cr.booking.BookingController"%>
<%@page import="kr.co.bit.cr.booking.BookingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
           <th>숙소 이름</th>
           <th>전화번호</th>
           <th>체크인시간</th>
           <th>체크아웃시간</th>
           <th>주소</th>
          
        </tr>
     </thead>   
     <tbody>
     <!-- for문 -->
     <c:forEach var="hotel" items="${hotelList }">
        <tr class="row-content">
           <!-- <td class="check" "> <label><input type="checkbox" value=""></label></td> -->
           <td>${hotel.name}</td>
           <td>${hotel.tel}</td>
           <td>${hotel.checkin}</td>
           <td>${hotel.checkout}</td>
           <td>${hotel.addr }</td>
           <td>
              <a class="btn btn-danger edit" href="${pageContext.request.contextPath}/user/cancle.cr?hotelNo=${hotel.no}" aria-label="Settings">
                <i class="fa fa-trash" aria-hidden="true"></i>
              </a>
           </td>
        </tr>
     </c:forEach>
     </tbody>
  </table>
</body>
</html>