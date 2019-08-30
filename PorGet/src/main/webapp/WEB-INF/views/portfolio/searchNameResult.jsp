<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${input }제목으로 검색한 결과입니다.</h3>
<div>
<c:forEach items="${list }" var="l">
	${l.UNAME },
	${l.PFNAME },
	${l.REPLYNUM },
	${l.PFTHUMB },
	${l.PFREAD },
	${l.UPHOTO },
	${l.JOA }<br>
</c:forEach>
</div>
	

</body>
</html>