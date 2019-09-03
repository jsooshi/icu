<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		},3000)
	}	
	
		ws.onclose = function (event) {
			console.log('Info: connecion closed')
			setTimeout(function () {connect()},1000); //retry connection	
	}
		ws.onerror = function (err) { console.log('error: ', err)}
	
	}	
</script>	
<script type="text/javascript">

var realPath = "${realPath}";
$(function(){ //jquery영역
	
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
	
	$('#recommendBtn').click(function(){ //좋아요버튼
			 $.ajax({
				 url : '../portfolio/good',
				 data: {
					 pfnum : boardNum,
					 uname : accessName
				 },
				 success: function(result){
					 var recommend = $(result).find('div.recommend:eq(0)').html();
					 $('.recommend').html(recommend); 
					 }
				 })
			 });
	
	})
	
}); //ready


</script>


</head>
<body>
	<div id="socketAlert" class="alert alert-success" role="alert" style="display:none"></div>
	<div class="modal-dialog" role="document">
	
	   <div class="modal-content">
	     <div class="modal-header">
	      <h4 class="modal-title" id="myModalTitle">${list.PFNAME }</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
	     </div><!-- header -->
	     <div class="modal-body">
	       <img src="http://placehold.it/200" class="rounded-circle"
					style="width: 20%;">
				<div class="d-inline">
					닉네임: ${list.UNAME }<br> 포지션: ${list.PFPOSITION }<br> 태그:
					${list.TAGNAME }
				</div>

				[스크린샷]<br>

				<c:forEach items="${thumb}" var="thumbImg">
					<img alt="하하하" src="/porget/files/${thumbImg}"
						style="max-height: 390px; max-width: 260px;">
				</c:forEach>

				조회수: <br> <a href="${list.PFURL }" class="btn btn-primary">
					포트폴리오 링크 </a><br>

				<button class="btn btn-danger" id="recommendBtn">좋아요</button>
				<div class="recommend">
					좋아요수: ${list.JOA }<br>
				</div>
				<a href="update?pfnum=${list.PFNUM }">수정</a><br> <a
					href="delete?pfnum=${list.PFNUM }">삭제</a><br>
				<hr>
				<img src="http://placehold.it/200" class="rounded-circle"
					style="width: 20%; display: inline;">
				<div class="box-header with-border">
					<h3 class="box-title">Comment</h3>
					댓글 수: ${list.REPLYNUM }
				</div>
				<div class="box-body">
						<c:choose>
							<c:when test="${!empty uname }">
								<textarea id="replyContents" rows="3" cols="60"
									placeholder="내용을입력하세요"></textarea>
								<br>
								<span style="color: #aaa;" id="counter">(0/최대100자)</span>
								<input type="button" value="저장" id="replySave">
							</c:when>
							<c:otherwise>
								<textarea id="replyContents" rows="3" cols="60"
									placeholder="로그인하세요" readonly></textarea>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="replyArea">
					<!-- 댓글 뿌려주기 -->
				</div>
	     </div><!-- modal body -->
	     <div class="modal-footer">
	      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	     </div>
	   </div>
	 </div>
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