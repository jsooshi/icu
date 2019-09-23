<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			<c:forEach items="${list4 }" var="list">
			<c:forEach items="${list }" var="result">
			
			
				<c:choose>
					<c:when test="${uname eq result.SENDERUNAME}">
						<li class="replies"><img src="/porget/files/profile/${uphoto}" alt="" /><p>${result.CHATCONTEXT}</p><div>${result.SENDDATE}&nbsp;&nbsp;</div></li>
					</c:when>
				
					<c:otherwise>
				
						<li class="sent"><img src="/porget/files/profile/${toUphoto}" alt="" /><p>${result.CHATCONTEXT}</p>&nbsp;&nbsp;${result.SENDDATE}</li>
				
					</c:otherwise>
				
				</c:choose>
			</c:forEach>	
			</c:forEach>	
