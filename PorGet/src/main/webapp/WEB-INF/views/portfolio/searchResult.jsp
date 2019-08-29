<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>
	<h3>검색결과입니다.</h3>
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
</body>
</html>