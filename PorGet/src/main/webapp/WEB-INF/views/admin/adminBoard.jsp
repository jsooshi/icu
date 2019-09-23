<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />

<style>
.card {
	width: 1000px;
}
</style>
<script src="/porget/js/adminMember.js"></script>

<div class="col-9">

	<h2>게시글 관리</h2><hr>
	출력 갯수: <select id="amount"></select>
	<button class="changeAmount btn btn-light">변경</button>
	
	<div class="memberTable">
		<table class="table table-spriped">
			<thead>
				<tr>
					<th>번호</th>
					<th>닉네임</th>
					<th>제목</th>
					<th>등록일</th>
					<th>태그명</th>
					<th>정보</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.pfnum}</td>
						<td>${list.uname}</td>
						<td>${list.pfname}</td>
						<td>${list.pfdate}</td>
						<td>${list.tagname}</td>
						<td><a href="/porget/portfolio/view?pfnum=${list.pfnum}" class="info btn-sm btn btn-light">info</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<form id="pageForm" action="/porget/admin/member" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</div>
	
	<form id="searchForm" action="/porget/admin/member" method="get">
		<select name="type">
			<option value="N" <c:out value="${pageMaker.cri.type eq'N' ?'selected':''}"/>>닉네임</option>
			<option value="E" <c:out value="${pageMaker.cri.type eq'E'? 'selected':''}"/>>이메일</option>
			<option value="C" <c:out value="${pageMaker.cri.type eq'C'? 'selected':''}"/>>회원등급</option>
		</select> 
		<input type="text" name="keyword"> 
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="submit" class="btn btn-primary" value="검색">
	</form>
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword2" value="${pageMaker.cri.keyword}"> 
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.startPage-1 }">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="num">
					<li
						class="page-item ${pageMaker.cri.pageNum == num ? 'active':'' }">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.endPage+1 }">다음</a></li>
				</c:if>
			</ul>
		</nav>
</div>



<jsp:include page="/WEB-INF/views/include/adminFooter.jsp" />
