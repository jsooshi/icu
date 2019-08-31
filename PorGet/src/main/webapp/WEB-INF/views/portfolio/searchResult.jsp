<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var input = <%= request.getParameter("input") %>;
	console.log('input>>'+input);
	$(document).ready(function() {
		$.ajax({
			url : "/porget/portfolio/searchName",
			data : input,
			success : function(data) {
				$('#divContent').append(data);
			}
		});
	})
</script>
</head>
<body>
<% 
	if(request.getAttribute("tagOrName").equals("tag")){
%>
	<h3>태그 검색결과입니다.</h3>
<c:forEach items="${list4 }" var="list">
	<c:forEach items="${list }" var="result">
	<div style="background-color: yello"> 
	${result.UNAME },
	${result.PFNAME },
	${result.REPLYNUM },
	${result.PFTHUMB },
	${result.PFREAD },
	${result.UPHOTO },
	${result.JOA }
	</div>
	</c:forEach>
</c:forEach>	
<%}else{ %>
	
 	<div class="content">
 	</div>


<%} %>





</body>
</html>