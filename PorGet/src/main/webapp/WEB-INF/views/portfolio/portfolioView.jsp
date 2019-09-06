<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
	 .maxSize{
		width: 925px;
		height: 500px;
	}
	.imgMaxSize{
		position:absolute;
		top:0;
		left:0;
		right:0;
		bottom:0;
		max-width:100%;
		max-height:100%;
		margin: auto;
	} 
</style>
<title>Document</title>
<script src="/porget/js/jquery-3.js"></script>

<script>
	var socket = null;
	$(document).ready(function(){
		connectWS();	
	})
	
	function connectWS(){
		var ws = new WebSocket("ws://localhost/porget/replyEcho?pfnum=1");
		socket = ws
		ws.onopen = function(){
		console.log('Info: connection opened')
	};
	
		ws.onmessage = function (event) {
		console.log(event.data+'\n');
		$('#socketAlert').html(event.data);
		$('#socketAlert').css("display","block");
		setTimeout(function(){
			$('#socketAlert').css("display","none");
		},3000)	}	
	
		ws.onclose = function (event) {
			console.log('Info: connecion closed')
			setTimeout(function () {connect()},1000); //retry connection	
	}
		ws.onerror = function (err) { console.log('error: ', err)}}	
</script>	
<script type="text/javascript">

var realPath = "${realPath}";

function delPortfolio(num){
	if(confirm("정말 삭제하시겠습니까?")){
		location.replace("delete?pfnum="+num);
	}
}
$(function(){ //jquery영역
	
	$(".carousel-indicators").children('li').eq(0).addClass("active");
	$(".carousel-inner").children('div').eq(0).addClass("active");
	$('.carousel').carousel()
	
	$.ajax({ //조회수 업데이트 
		url: '/porget/replies/read',
		type: 'post',
		data: {
			pfnum : ${param.pfnum}
		}
		
	})	 
	
	//게시글을 열람, 접속한 사람, 무조건 실행? 실행. 
	function replyList (){ 	
	 $.ajax({
		 url : '/porget/replies/list',
		 type : 'post',
		 data: {
			 pfnum : ${param.pfnum},
			 uname : "${uname}",
			 
		 },
		 success: function(result){
			 $('#replyArea').html(result);
			 
		 }
	 })
	 
	}
	
	replyList(); //댓글리스트 로딩
		
	$('#replySave').click(function(){ //댓글작성 클릭 
		var replyCon = $("#replyContents").val(); //댓글내용 
		if(replyCon===""){
			alert('내용을 입력하세요')
			$('#replyContents').focus();
			return; 
		}
		var replyData={
				pfnum: ${param.pfnum},  //게시판번홈
				rcontent: replyCon, //댓글내용
				rdeep: 0,
				uname: "${uname}" //userID 
							
			}; 
	
		var msg = "reply,${uname},${list.UNAME },${param.pfnum}"
		$.ajax({
			url: '../replies/save',
			type: "post",
			data:  replyData,
			success: function(){
				replyList()
				socket.send(msg);
				
			},
			error:function(xhr,staTxt){
				alert("에러?"+staTxt+':'+xhr.status)
			}
		})//ajax	
		
		
		$("#replyContents").val(''); //댓글초기화
		
	})//replySave click

	
	$('#replyContents').keyup(function (e){ //댓글글자수카운터 및 제한
		var content = $(this).val();
		$('#counter').html("("+content.length+"/최대100자)");
		if(content.length>150){
			alert('최대100자까지 가능합니다')
			$(this).val(content.substring(0, 100));
			$('#counter').html('(100/최대100자)')
		}
	});
	
	$('#recommendBtn').click(function(){ //좋아요버튼
		var writeName = '${list.UNAME}';
		var uName = '${uname}';
		
		if(uName == ""){
			alert("로그인 해주세요");	
			return;
		}else if(writeName === uName){
			alert('본인의 글을 추천하실 수 없습니다');
			return;
		}else {
			 $.ajax({
				 url : '../portfolio/good',
				 type: 'post',
				 data: {
					 pfnum : ${param.pfnum}
				 },
				 success: function(result){
					 $('.recommend').html("좋아요수: "+result); 
				}
			})
		}
		
	});
}); //ready
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"/>	


    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <!-- Post Content Column -->
            <div class="col-sm-12">
                <!-- Title -->
                <h1 class="mt-4">${list.PFNAME }</h1>
                <!-- Author -->
                <hr>
                <!-- Date/Time -->
                <p>${list.PFDATE}</p>
                <hr>            
            </div>
            <div class="col-lg-8">
                <!-- Preview Image -->
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <c:forEach items="${thumb}" var="thumbImg" varStatus="status">
                            <li data-target="#carouselExampleIndicators" data-slide-to="${status.count-1 }"></li>
                        </c:forEach>
                    </ol>
                    <div class="carousel-inner">
                        <c:forEach items="${thumb}" var="thumbImg" varStatus="status">
                            <div class="carousel-item maxSize">
                                <img class="d-block imgMaxSize" src="/porget/files/${thumbImg }" alt="
                                        slide">
                            </div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <hr>

                <!-- Post Content -->
                <hr>
                <c:choose>
                        <c:when test="${list.UNAME == uname }">
                            <a href="update?pfnum=${list.PFNUM }">수정</a> | 
                            <a href="javascript:delPortfolio(${list.PFNUM })">삭제</a><br>
                        </c:when>
                </c:choose>

                <!-- Comments Form -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Comment</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <c:choose>
                                <c:when test="${!empty uname }">
                                    <textarea id="replyContents" rows="3" cols="60" placeholder="내용을입력하세요"></textarea>
                                    <br>
                                    <span style="color:#aaa;" id="counter">(0/최대100자)</span>
                                    <input type="button" value="저장" id="replySave">
                                </c:when>
                                <c:otherwise>
                                    <textarea id="replyContents" rows="3" cols="60" placeholder="로그인하세요"
                                        readonly></textarea>
                                </c:otherwise>
                            </c:choose>


                        </div>
                    </div>
                    <div class="box-footer" id="replyArea">
                        <!-- 댓글 뿌려주기 -->
                    </div>

                </div>
            </div>

            <!-- Sidebar Widgets Column -->
            <div class="col-md-4">
                <div class="card my-4">
                    <div class="row">
                        <div class="col-lg-4">
                            <img src="/porget/files/profile/${list.UPHOTO } " class="rounded-circle" style="width:50px;">
                        </div>
                        <div class="col-lg-8">
                            <ul class="list-unstyled mb-0">
                                <li>
                                    ${list.UNAME }
                                </li>
                                <li>
                                    ${list.PFPOSITION }
                                </li>
                                <li>
									<c:forTokens items="${list.TAGNAME }" delims="#" var="item">
									   <a href="/porget/searchHashClick?keyword=${item}">#${item}</a> &nbsp;
									</c:forTokens>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="card my-4">
                <c:if test="${not empty list.PFURL}">
                    <a href="${list.PFURL }" class="btn btn-primary pd-4" target="_blank">
                            포트폴리오 링크
                    </a>
                </c:if>
                <c:if test="${not empty list.PFFILE}">
                    <a href="/porget/portfolio/download?fileName=${list.PFFILE }" class="btn btn-info pd-4">
                            포트폴리오 다운로드
                    </a>
                </c:if>
                    <button class="btn btn-danger" id="recommendBtn">좋아요</button>
                </div>
                <div class="card my-4">
                    조회수: ${list.PFREAD }<br>
                    <span class="recommend">좋아요수: ${list.JOA }</span>
                </div>
            </div>
        </div>
     </div>
     
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
			
		
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>

</html>