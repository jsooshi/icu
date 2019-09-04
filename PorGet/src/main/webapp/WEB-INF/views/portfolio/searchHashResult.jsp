<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:forEach items="${listSet }" var="list">
		<c:forEach items="${list }" var="result">
		<div class="card col-md-4">
			<a href="portfolio/view?pfnum=${result.PFNUM }&uname=${sessionScope.uname}" class="btn"> <img
				src="/porget/img/${result.PFTHUMB }"
				class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">${result.PFNAME }</h5>
					<p class="card-text">
						<img src="http://placehold.it/200" class="rounded-circle"
							style="width: 20%; display: inline;"> ${result.UNAME }
					</p>
					<p class="text-muted">조회 ${result.PFREAD } 하트 ${result.JOA }, 댓글수${result.REPLYNUM }</p>
				</div>
			</a>
		</div>
		</c:forEach>
	</c:forEach>	 
