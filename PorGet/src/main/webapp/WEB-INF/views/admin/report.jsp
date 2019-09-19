<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table border="1">
	  <thead>
	  	<tr>
	  		<th>번호</th>
	  		<th>신고 내용</th>
	  		<th>신고</th>
	  		<th>신고 유형</th>
	  		<th>신고 날짜</th>
	  		<th>신고 처리 날짜</th>
	  		<th>신고자</th>
	  		<th>신고대상자</th>
	  		<th>신고 처리</th>
	  	</tr>
	  </thead>
	  <c:forEach items="${list }" var="report">
	  <tr>
	  		<td><c:out value="${report.reportNum }"></c:out> </td>
	  		<td><c:out value="${report.reportContext }"></c:out> </td>
	  		<td><c:out value="${report.reportPath }"></c:out> </td>
	  		<td><c:out value="${report.reportType }"></c:out> </td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${report.reportDate}" /></td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${report.reportResultDate}" /></td>
	  		<td><c:out value="${report.reporter }"></c:out> </td>
	  		<td><c:out value="${report.defendant }"></c:out> </td>
	  		<td><c:out value="${report.reportResult }"></c:out> </td>
	  		
	  </tr>
	  </c:forEach>
	  </table>
</body>
</html>