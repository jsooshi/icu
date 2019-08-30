<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${list }" var="p">
		<div class="card col-md-4">
			<a href="portfolio/view?pfnum=${p.PFNUM }&uname=${sessionScope.uname}" class="btn"> <img
				src="/porget/img/${p.PFTHUMB }"
				class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">${p.PFNAME }</h5>
					<p class="card-text">
						<img src="http://placehold.it/200" class="rounded-circle"
							style="width: 20%; display: inline;"> ${p.UNAME }
					</p>
					<p class="text-muted">조회 ${p.PFREAD } 하트 ${p.JOA }, 댓글수${p.REPLYNUM }</p>
				</div>
			</a>
		</div>
</c:forEach>
