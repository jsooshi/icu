<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:choose>
	<c:when test="${clear eq 'clear'}">		
		<li class="contact">
			<div class="wrap">
			<div class="meta">
				<p class="preview">대화목록이 없습니다.</p>
			</div>
			</div>
		</li>
	</c:when>
	<c:otherwise>
			<c:forEach items="${list4 }" var="list">
			<c:forEach items="${list }" var="result">
					
						<li class="contact">
							<div class="wrap">
								<span class="contact-status online"></span>
								<img src="/porget/files/profile/${result.UPHOTO}" alt="" />
								<div class="meta">
									<p class="name">${result.CHATUSER}</p>
									<p class="preview">${result.SENDCONTENT}</p>
								</div>
							</div>
						</li>
				
					
					
			
					
			</c:forEach>	
			</c:forEach>	
	</c:otherwise>
	</c:choose>