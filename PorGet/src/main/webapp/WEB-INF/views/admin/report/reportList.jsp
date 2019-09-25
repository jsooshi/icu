<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/porget/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/porget/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/porget/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/porget/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/porget/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/porget/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="/porget/js/jquery-3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
	body{
		overflow: scroll;
	}
</style>
</head>

<!-- ////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board List Page
				<button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover reportTable">
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
						<tr data-pfnum="${board.pfnum }" >  <!-- 포트폴리오 주소 가져옴 -->
							<td><c:out value="${board.reportNum}" /></td>

							<td><c:out value="${board.reportType}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.reportDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.reportResultDate}" /></td>
									
							<td class="nr"><p id="reportResult"><c:out value="${board.reportResult}"/></p></td>	
													
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/porget/test/reportList" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default' type="submit">Search</button>
						</form>
					</div>
				</div>


				<div class='pull-right'>
					<ul class="pagination">

						<%--             <c:if test="${pageMaker.prev}">
              <li class="paginate_button previous"><a href="#">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
              end="${pageMaker.endPage}">
              <li class="paginate_button"><a href="#">${num}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button next"><a href="#">Next</a></li>
            </c:if> --%>

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class='paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} '>
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>


					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/porget/test/reportList" method='get'>
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
				<div id="dddd"></div>
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">XX번 신고글</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="postConfirm" data-no="0">게시글 확인</button>	<!-- 버튼에 data-no 속성을 줌 -->			
							<button type="button" class="btn btn-primary" id="resultChange" class="tablefind">Save
								changes</button>
							
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
</div>
<!-- /.row -->






<script type="text/javascript">
var defendant="";
	$(document)
			.ready(
					function() {
						$('#resultChanges').click(function(){
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
							$( 'tr td:nth-child(5)' ).click(function(){
								
							});
						});
						
						$('#postConfirm').click(function(){		
							//alert($(this).attr("data-no"));
							var pfnum = $(this).attr('data-no');
							location.href='/porget/portfolio/view?pfnum='+ pfnum+'&defendant='+defendant;
						});
						
						$(".reportTable tbody tr").on("click",function(){
							/* alert("ㅇㅇㅇㅇㅇ"+$(this).find("td").eq(0).html()+"]"); */
							var reportNum = parseInt($(this).find("td").eq(0).html());
							$("#myModalLabel").html(reportNum+"번 신고입니다");
							$('#postConfirm').attr("data-no", $(this).attr("data-pfnum")); //버튼 클릭시 
							$.ajax({
								url: "/porget/test/selectReport",
								type: "POST",
								dataType: "json",
								data: {reportNum:reportNum},
								success: function(result){
									$(".modal-body").html(result.reportContext);
									console.log("리포트 경로  : "+result.reportPath)
									var pageNum = result.reportPath
									if(pageNum !== 'chat'){
										pageNum=pageNum.substring(1)
									}
									defendant=result.defendant;
									$('#postConfirm').attr("data-no", pageNum); //버튼 클릭시
								}
							})
							
							$("#myModal").modal('show')
						})
						
                        // alert('result==>${result}<');
						var result = '<c:out value="${result}"/>';
                            //result = '13';
						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						});

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

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>
