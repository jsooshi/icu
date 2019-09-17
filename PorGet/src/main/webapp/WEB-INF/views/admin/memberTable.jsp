<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.card{
		width: 1000px;
	}
</style>


<div class="card">
	<div class="card-header">
		<strong class="card-title">회원 관리</strong>
	</div>
	<div class="card-body">
		<table class="table table-spriped">
			<thead>
				<tr>
					<th>이름</th>
					<th>이메일</th>
					<th>회원등급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.uname }</td>
						<td>${list.uemail }</td>
						<td>${list.ucheck }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="card-footer">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  	<c:if test="${pageMaker.prev }">
	    <li class="page-item"><a class="page-link" href="#">이전</a></li>
	    </c:if>
	  	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"  var="num">
	    <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
		</c:forEach>
		<c:if test="${pageMaker.next }">
	    <li class="page-item"><a class="page-link" href="#">다음</a></li>
	  	</c:if>
	  </ul>
	</nav>
	<form id="pageForm" action="admin/member">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
	
	
	
		<select>
			<option value="uname">이름</option>
			<option value="uemail">이메일</option>
			<option value="ucheck">회원등급</option>
		</select>
		<input type="text" name="search">
		<input type="button" class="btn btn-primary" value="검색">
	</div>
</div>
<script>
	$(document).ready(function(){
		
		var pageForm = $("#pageForm");
		
		$(".pagination a").on("click",function(e){
			e.preventDefault();
			console.log(pageForm.find("input[name='pageNum']").val());
			pageForm.find("input[name='pageNum']").val($(this).attr("href"));
			
		});	
		
	})
	
</script>