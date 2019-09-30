<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
	
	.container {
		height: 70vh;
	}

	#setting {
		margin-top: 30px;
	}
</style>
<title>마이페이지</title>

	<hr>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h1 class="uname">${vo.uname }</h1>
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
   					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#like">좋아요</a></li>
					<c:if test="${sessionScope.uname == vo.uname}">
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#setting">설정</a></li>
					</c:if>
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
					<!-- like -->
					<div class="tab-pane" id="like">
						<hr>
							<c:forEach items="${like }" var="like">
								<div class="card mb-3">
									<a href="portfolio/view?pfnum=${like.pfnum }" class="btn">
										<div class="row no-gutters">
											<div class="col-md-4">
												<img src="/porget/files/${like.pfthumb}" class="card-img"
													alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h5 class="card-title">${like.pfname }</h5>
													<p class="card-text">
														${like.pfposition }<br> <small class="text-muted"><fmt:formatDate value="${like.pfdate}" pattern="yyyy-MM-dd E요일 "/></small>
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
					
					</div>
					<!--/tab-pane-->
					
					<!-- setting -->
					<div class="tab-pane" id="setting">
	
							<div class="form-group">
								<label for="uphotoFile">프로필 사진 변경(.jpg/.jpeg/.png/.gif)</label>
								<input type="file" class="form-control"
									id="uphotoFile" name="uphotoFile" placeholder="파일첨부" tabindex="6" accept=".jpg,.png,.gif,.jpeg" title="파일등록" hidden>  
								<label for="uphotoFile" class="form-control">사진을 선택하세요</label>
								<button type="button" class="btn btn-start-order" id='changeUphoto'>프로필 사진 변경</button>
							</div>
							<div class="form-group">
								<button id="breakMember" class="btn btn-warning">회원탈퇴</button>
							</div>
							
						<%-- 					<h5>닉네임: ${vo.uname }</h5>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
						  변경
						</button> --%>
					</div>
				</div>
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="col-sm-6">
					<button id="deleteMember"  class=" btn btn-danger">강퇴</button>
				</div>
			</sec:authorize>
		</div>
		<!--/row-->
	</div>
	<input type="hidden" name="userName" value="${vo.uname }"/>



	
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
					url : "/porget/mypage/changeuname",
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
							url : "/porget/mypage/changeuphoto",
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
			
			var uname = $('input[name="userName"]').val();
			
			$("#deleteMember").on("click",function(){
				if(confirm("정말로 강퇴하시겠습니까?")){
					$.ajax({
						url: "/porget/admin/member/"+uname,
						type:"delete",
						success: function(result){
							if(result == "success"){
								alert("강퇴 완료");
								window.location.href = '/porget/admin';
							}else{
								alert("강퇴 실패");
							}
						}
					})
				}
			})
			
			$("#breakMember").on("click",function(){
				if(confirm("정말로 탈퇴하시겠습니까?")){
					$.ajax({
						url:"/porget/mypage/"+uname,
						type:"delete",
						success: function(result){
							if(result == "success"){
								alert("탈퇴 완료되었습니다.");
								window.location.href = '/porget/logout';
							}else{
								alert("탈퇴 실패");
							}
						}
					})
				}
			})
		});
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
