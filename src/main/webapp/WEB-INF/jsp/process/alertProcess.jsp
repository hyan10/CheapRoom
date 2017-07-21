<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${msg}'!=null || '${msg}'!=''){
		alert('${msg}');
	}
	
	location.href = '${pageContext.request.contextPath}${url}';
</script>