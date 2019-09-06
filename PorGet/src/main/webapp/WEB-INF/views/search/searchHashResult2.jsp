<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="content">
		<br>
		<h3> #${HashTag }</h3>
		<hr>
			<div id="divContent" class="row">
			<c:forEach items="${list }" var="result">
           <div class="col-md-4">
             <div class="card">
                 <a href="portfolio/view?pfnum=${result.PFNUM }" class="btn text-left custom-card">
                     <div class="img-hover-zoom">
                         <img src="/porget/files/${result.PFTHUMB }" class="card-img-top" alt="${result.PFNAME }">
                     </div>
                     <div class="card-body">
                         <h5 class="card-title">${result.PFNAME }</h5>
                         <p class="card-text">
                             <img src="http://placehold.it/200" class="rounded-circle" style="width: 50px; height:50px; display: inline;">
                             ${result.UNAME }
                         </p>
                         <p class="text-muted">조회 ${result.PFREAD }, 하트 ${result.JOA}, 댓글수 ${result.REPLYNUM } </p>
                     </div>
                 </a>
                </div>
            </div>
		</c:forEach>
		</div>
			</div>
		</div> 
	
		<!-- 모달창 -->
		<div class="modal" id="myModal"></div>


	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
