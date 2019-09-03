<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${list }" var="p">
            <div class="col-md-4">
                <div class="card">
                    <a href="portfolio/view?pfnum=${p.PFNUM }" class="btn text-left custom-card">
                        <div class="img-hover-zoom">
                            <img src="${p.PFTHUMB }" class="card-img-top" alt="${p.PFNAME }">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${p.PFNAME }</h5>
                            <p class="card-text">
                                <img src="/porget/files/profile/${p.UPHOTO}" class="rounded-circle" style="width: 50px; height:50px; display: inline;">
                                ${p.UNAME }
                            </p>
                            <p class="text-muted">조회 ${p.PFREAD }, 하트 ${p.JOA}, 댓글수 ${p.REPLYNUM } </p>
                        </div>
                    </a>
                </div>
            </div>
</c:forEach>
