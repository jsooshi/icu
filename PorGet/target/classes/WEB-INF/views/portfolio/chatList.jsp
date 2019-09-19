<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			<c:forEach items="${list4 }" var="list">
			<c:forEach items="${list }" var="result">
			
			
				<c:choose>
					<c:when test="${uname eq result.SENDERUNAME}">
						<li class="replies"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>${result.CHATCONTEXT}</p></li>
					</c:when>
				
					<c:otherwise>
				
						<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>${result.CHATCONTEXT}</p></li>
				
					</c:otherwise>
				
				</c:choose>
			</c:forEach>	
			</c:forEach>	
