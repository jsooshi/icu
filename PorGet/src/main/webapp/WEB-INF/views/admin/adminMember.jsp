<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />

<style>
.card {
	width: 1000px;
}
</style>
<script>
	$(document).ready(function() {

		for (var i = 1; i <= 5; i++) {
			var option = $("<option value="+i*10+">" + i * 10
					+ "</option>");
			$("#amount").append(option);
		}

		var pageForm = $("#pageForm");

		$(".page-item a").on(
				"click",
				function(e) {
					e.preventDefault();
					pageForm.find("input[name='pageNum']").val($(this).attr("href"));
					pageForm.find("input[name='amount']").val($("#amount option:selected").text());
					pageForm.submit();
				});
		
		$('#amount').on('change',function(e){
			console.log("sdf");
			var pageNum = $("input[name='pageNum']").val();
			var amount = $("#amount option:selected").text();

			$.ajax({
				url : "/porget/admin/member",
				data : {
					"pageNum" : pageNum,
					"amount" : amount
				},
				success : function(result) {
					$('.memberTable').html($(result).find('.memberTable'));
				}
			});
		})
		
	})
</script>

<div class="col-9">
	<h2>회원 관리</h2>
	<hr>
	출력 갯수: <select id="amount"></select>
	<div class="memberTable">
		<table class="table table-spriped">
			<thead>
				<tr>
					<th>이름</th>
					<th>이메일</th>
					<th>회원등급</th>
					<th>신고누적수</th>
					<th>정보</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.uname }</td>
						<td>${list.uemail }</td>
						<td>${list.ucheck }</td>
						<td></td>
						<td><button class="info btn-sm btn btn-light">info</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<select>
			<option value="uname">이름</option>
			<option value="uemail">이메일</option>
			<option value="ucheck">회원등급</option>
		</select> <input type="text" name="search"> <input type="button"
			class="btn btn-primary" value="검색">
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
</div>

	<form id="pageForm" action="/porget/admin/member" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>

<jsp:include page="/WEB-INF/views/include/adminFooter.jsp" />
