<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />

<div class="col-9">
	<h2>신고글 관리</h2>
	<hr>
	<div class="memberTable">
		<table class="table table-spriped reportTable">
			<thead>
				<tr>
					<th>#번호</th>
					<th>유형</th>
					<th>신고일</th>
					<th>처리일</th>
					<th>처리결과</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="board">
					<tr data-pfnum="${board.pfnum }">
						<!-- 포트폴리오 주소 가져옴 -->
						<td><c:out value="${board.reportNum}" /></td>

						<td><c:out value="${board.reportType}" /></td>

						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.reportDate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.reportResultDate}" /></td>

						<td class="nr"><p id="reportResult">
								<c:out value="${board.reportResult}" />
							</p></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.startPage-1 }">이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':'' }">
					<a class="page-link" href="/porget/report/reportList?pageNum=${num}&amount=10">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.endPage+1 }">다음</a></li>
			</c:if>
		</ul>
	</nav>
	<!--  end Pagination -->
</div>

<form id='actionForm' action="/porget/report/reportList" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

	<input type='hidden' name='type'
		value='<c:out value="${ pageMaker.cri.type }"/>'> <input
		type='hidden' name='keyword'
		value='<c:out value="${ pageMaker.cri.keyword }"/>'>
</form>


<!-- Modal  추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">XX번 신고글 //</h4>
			</div>
			<div class="modal-body">
				<ul>
					<li name="reporter">신고자 : <b></b></li>
					<li name="defendant">피신고자 : <b></b></li>
					<li name="reportType">신고 유형 : <b></b></li>
				</ul>
				<p name="reportContext"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="postConfirm"
					data-no="0">게시글 확인</button>
				<button type="button" class="btn btn-primary" id="chatConfirm"
					data-no="0">채팅확인</button>
				<!-- 버튼에 data-no 속성을 줌 -->
				<button type="button" class="btn btn-primary" id="resultChange" disabled="disabled" dataNum="">처리완료</button>

			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script type="text/javascript">
	var defendant = "";
	$(document)
			.ready(
					function() {
						$('#resultChanges').click(function() {
							/* $("table tr td").click(function(){
							 var txt = $(this).text();
							 alert(txt);
							}); */

							/* if($('#reportResult').html() == '처리중') {
								$('#reportResult').html('처리완료');
							}else{
								$('#reportResult').html('처리중');
							}  */
							/* $(".tablefind").click(function(){
							    var $item = $(this).closest("tr")   // Finds the closest row <tr> 
							                       .find(".nr")     // Gets a descendent with class="nr"
							                       .$('#reportResult').html("처리완료");         // Retrieves the text within <td>
							    
							}); */
							/* var $row = $(this).closest("tr"),        
							$tds = $row.find("td:nth-child(2)"); 

							$.each($tds, function() {         
								alert("dasd");
							console.log($(this).text("asd"));         
							}); */
							$('tr td:nth-child(5)').click(function() {

							});
						});

						$('#postConfirm')
								.click(
										function() {
											//alert($(this).attr("data-no"));
											var pfnum = $(this).attr('data-no');
											var reporturl = '/porget/portfolio/view?pfnum='
													+ pfnum
													+ '&defendant='
													+ $("li[name='defendant']").children()
															.html();

											var win = window.open(reporturl,
													'_blank');
											win.focus();
										});

						$('#chatConfirm')
								.click(
										function() {
											var reporturl = "/porget/report/reportChatting?reporter="
													+ $("li[name='reporter']").children()
															.html()
													+ "&defendant="
													+ $("li[name='defendant']").children()
															.html();
											var win = window.open(reporturl,
													'_blank');
											win.focus();
										});

						$(".reportTable tbody tr")
								.on(
										"click",
										function() {
											/* alert("ㅇㅇㅇㅇㅇ"+$(this).find("td").eq(0).html()+"]"); */
											$("#myModalLabel").html("");
											$("li[name='reporter']").children().html("");
											$("li[name='defendant']").children().html("");
											$("li[name='reportType']").children().html("");
											$("p[name='reportContext']").html(
													"");
											var reportNum = parseInt($(this)
													.find("td").eq(0).html());
											$("#myModalLabel").html(
													reportNum + "번 신고입니다 // ");
											$('#postConfirm').attr("data-no",
													$(this).attr("data-pfnum")); //버튼 클릭시 
											$.ajax({
														url : "/porget/report/selectReport",
														type : "POST",
														dataType : "json",
														data : {
															reportNum : reportNum
														},
														success : function(
																result) {
															var rDate = new Date(
																	result.reportDate)
																$("#resultChange").attr("disabled","disabled")
															if(result.reportResult == "처리중"){
																$("#resultChange").removeAttr("disabled")
																$("#resultChange").attr("dataNum",reportNum)
															}
															$("#myModalLabel")
																	.append(
																			rDate
																					.getFullYear()
																					+ "년 "
																					+ (rDate
																							.getMonth() + 1)
																					+ "월 "
																					+ rDate
																							.getDate()
																					+ "일");
															$(
																	"li[name='reporter']")
																	.children().append(
																			result.reporter)
															$(
																	"li[name='defendant']")
																	.children().append(
																			result.defendant)
															$(
																	"li[name='reportType']")
																	.children().append(
																			result.reportType)
															$(
																	"p[name='reportContext']")
																	.append(
																			result.reportContext)
															var pageNum = result.reportPath
															if (pageNum !== 'chat') {
																pageNum = pageNum
																		.substring(1)
																$(
																		"#chatConfirm")
																		.hide()
																$(
																		"#postConfirm")
																		.show()
															} else {
																$(
																		"#chatConfirm")
																		.show()
																$(
																		"#postConfirm")
																		.hide()
															}
															defendant = result.defendant;
															$('#postConfirm')
																	.attr(
																			"data-no",
																			pageNum); //버튼 클릭시
														}
													})

											$("#myModal").modal('show')
										})

						history.replaceState({}, null, null);

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();
									//--> <a>태그 이벤트 속성 무력화!!
									//--> <a href="hello.jsp">안녕</a>

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						
						$("#resultChange").on("click",function(){
							var reportNum = parseInt($(this)
									.attr("datanum"));
							$.ajax({
								url: '/porget/report/updateResult',
								type: "post",
								data:  {reportNum:reportNum},
								success: function(result){
									if(result){
										location.reload();
									}
								}
							})
						});

					});
</script>

<jsp:include page="/WEB-INF/views/include/adminFooter.jsp" />
