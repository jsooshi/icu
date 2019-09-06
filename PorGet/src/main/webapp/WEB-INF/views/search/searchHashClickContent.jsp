<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                             <img src="/porget/files/profile/${result.UPHOTO }" class="rounded-circle" style="width: 50px; height:50px; display: inline;">
                             ${result.UNAME }
                         </p>
                         <p class="text-muted">조회 ${result.PFREAD }, 하트 ${result.JOA}, 댓글수 ${result.REPLYNUM } </p>
                     </div>
                 </a>
                </div>
            </div>
		</c:forEach>
