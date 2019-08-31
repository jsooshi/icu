<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h3>해시태그로 검색한 결과입니다.</h3>
	<c:forEach items="${list4 }" var="list">
		<c:forEach items="${list }" var="result">
		${result.UNAME },
		${result.PFNAME },
		${result.REPLYNUM },
		${result.PFTHUMB },
		${result.PFREAD },
		${result.UPHOTO },
		${result.JOA }<br>
		</c:forEach>
	</c:forEach>	 


</body>
</html>