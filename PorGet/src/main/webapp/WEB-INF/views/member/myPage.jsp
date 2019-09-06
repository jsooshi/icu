<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<hr>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h1>${vo.uname }</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->

				<div class="text-center">
					<img src="/porget/files/profile/${vo.uphoto }"
						class="avatar img-circle img-thumbnail" alt="avatar">
				</div>
				</hr>
				<br>
			</div>
			<!--/col-3-->
			<div class="col-sm-9">

				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#portfolio">포트폴리오</a></li>
<!-- 					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#bookmark">북마크</a></li> -->
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#setting">설정</a></li>
				</ul>

				<div class="tab-content">
					<!-- portfolio -->
					<div class="tab-pane row active" id="portfolio">
						<hr>
						<c:forEach items="${pvo }" var="pvo">
							<div class="card mb-3">
								<a href="portfolio/view?pfnum=${pvo.pfnum }" class="btn">
									<div class="row no-gutters">
										<div class="col-md-4">
											<img src="/porget/files/${pvo.pfthumb}" class="card-img"
												alt="...">
										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title">${pvo.pfname }</h5>
												<p class="card-text">
													${pvo.pfposition }<br> <small class="text-muted"><fmt:formatDate value="${pvo.pfdate}" pattern="yyyy-MM-dd E요일 "/></small>
												</p>
											</div>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				<!-- bookmark -->
				<div class="tab-pane" id="bookmark"></div>
				<!--/tab-pane-->
				<!-- setting -->
				<div class="tab-pane" id="setting">

					<div class="row">
						<div class="col-sm-5">
						<div class="form-group">
							<label for="uphotoFile">프로필 사진 변경(.jpg/.jpeg/.png/.gif)</label>
							<input type="file" class="form-control"
								id="uphotoFile" name="uphotoFile" placeholder="파일첨부" tabindex="6" accept=".jpg,.png,.gif,.jpeg" title="파일등록" hidden>  
							<label for="uphotoFile" class="form-control">사진을 선택하세요</label>
							<button type="button" class="btn btn-start-order" id='changeUphoto'>프로필 사진 변경</button>
						</div>
						</div>
					</div>
					<%-- 					<h5>닉네임: ${vo.uname }</h5>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
					  변경
					</button> --%>


				</div>
				</div>


			</div>
		</div>
		<!--/row-->
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content text-center">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">닉네임 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" name="uname">
				</div>
				<div class="modal-footer">
					<button type="button" id="changeUname" class="btn btn-primary">변경</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<script>
		function isImageFile( fileName ) {
		    var fileSuffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		    fileSuffix = fileSuffix.toLowerCase();
		    if ( "jpg" == fileSuffix || "jpeg" == fileSuffix  || "gif" == fileSuffix || "bmp" == fileSuffix || "png" == fileSuffix ) 
		        return true;
		    else 
		        return false;
		}//이미지 파일 확인
		var formData = new FormData();
	
		$(document).ready(function() {

			$(".nav-tabs a").click(function() {
				$('#portfolio').removeClass('active');
				$(this).tab('show');
			});

			$("#changeUname").click(function() {
				var uname = $('input[name="uname"]').val();

				$.ajax({
					url : "mypage/changeuname",
					type : "post",
					data : {
						"uname" : uname
					},
					success : function(result) {
						alert("변경완료");
					}
				});
			});
			$("#uphotoFile").on("change",function(){
					formData.delete("photo");
					var inputFile = $('#uphotoFile');
					var changeUphoto = inputFile[0].files;
					if(changeUphoto.length == 0){
						$(this).parent().children('label').eq(1).html("사진을 선택하세요")
					}else if(!isImageFile(changeUphoto[0].name)){
						alert('지정된 확장자만 등록해주세요');
						$(this).parent().children('label').eq(1).html("사진을 선택하세요")
					}else{
						formData.append("photo",changeUphoto[0]);
						console.log(changeUphoto[0]);
						$(this).parent().children('label').eq(1).html(changeUphoto[0].name)
					}
			});
			$("#changeUphoto").on("click",function(){
				var inputFile = $('#uphotoFile');
				var changeUphoto = inputFile[0].files;
				if(changeUphoto.length != 0){
					if(confirm("정말 사진을 변경하시겠습니까")){
						console.log(formData.get("photo"))
						$.ajax({
							url : "mypage/changeuphoto",
							processData:false,
							contentType:false,
							type : "post",
							data : formData,
							success : function(result) {
								if(result =="success"){
									alert("변경완료");
									location.reload();
								}else{
									alert("변경실패");
								}
							}
						});
					}
				}
			});
			

		});
	</script>

</body>
</html>