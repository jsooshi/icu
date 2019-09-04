<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
