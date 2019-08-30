<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
var realPath = "${realPath}";
$(function(){ //jquery영역
	
	var boardNum = ${param.pfnum}  //열람한 게시글 번호 
	var accessName = "${param.uname}" //게시글을 열람, 접속한 사람
	function replyList (){
		
	 $.ajax({
		 url : '../replies/list',
		 data: {
			 pfnum : boardNum,
			 uname : accessName
		 },
		 success: function(result){
			 $('#replyArea').html(result);
		 }
		 
	 })
	 
	}
	
	replyList(); //댓글리스트 로딩
		
	$('#replySave').click(function(){
		var replyCon = $("#replyContents").val();
		
		var replyData={
				pfnum: boardNum,  //게시판번홈
				rcontent: replyCon, //댓글내용
				rdeep: 0,
				uname: "${param.uname}" //userID 
							
			}; 
	
		
		$.ajax({
			url: '../replies/save',
			type: "post",
			data:  replyData,
			success: function(){
				replyList()
			},
			error:function(xhr,staTxt){
				alert("에러?"+staTxt+':'+xhr.status)
			}
			
			
		})//ajax	
		
		$("#replyContents").val(''); //댓글초기화
		
	})//replySave click

	
	$('#replyContents').keyup(function (e){ //댓글글자수카운터 및 제한
		var content = $(this).val();
		$('#counter').html("("+content.length+"/최대150자)");
		if(content.length>150){
			alert('최대150자까지 가능합니다')
			$(this).val(content.substring(0, 150));
			$('#counter').html('(150/최대150자)')
		}
	})
	
	
	

}); //ready
</script>
</head>
<style>
    .inline {
        display: inline;
    }
</style>

<body>

<div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">${list.pfname }</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	
        <img src="http://placehold.it/200" class="rounded-circle" style="width:20%; display:inline;">
        <p class="inline">
            닉네임: ${list.uname }<br>
            포지션: ${list.pfposition }<br>
            태그: ${list.tagname }
        </p>
        [스크린샷]<br>

		<c:forEach items="${thumb}" var="thumbImg">
			<img alt="하하하" src="/porget/files/${thumbImg}" style="max-height:390px;max-width:260px;">
		</c:forEach>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100"
                        src="" alt="
                        First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                        src="" alt="
                        Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                        src="" alt="
                        Third slide">
                </div>
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

        좋아요수: <br>
        조회수: <br>

        <a href="${list.pfurl }" class="btn btn-primary">
		 포트폴리오 링크
        </a><br>

        <a href="">좋아요</a><br>
        <a href="update?pfnum=${list.pfnum }">수정</a><br>
        <a href="delete?pfnum=${list.pfnum }">삭제</a><br>
        <hr>
        
                [댓글] <!-- 댓글작성 -->
        <img src="http://placehold.it/200" class="rounded-circle" style="width:20%; display:inline;">
        <div class="box-header with-border">
        	<h3 class="box-title">Comment</h3>
        </div>
        <div class="box-body">
        	<div class="form-group">
        		<textarea id="replyContents" rows="3" cols="60" placeholder="댓글내용"></textarea>
        		<br>
        		<span style="color:#aaa;" id="counter">(0/최대150자)</span>
        		
        		<input type="button" value="submit" id="replySave">
        	</div>
        </div>
        <div class="box-footer" id="replyArea">
        	<!-- 댓글 뿌려주기 -->
        </div>
        
      </div>


      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>







    </div>
  </div>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous">
			
		</script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous">

</body>

</html>