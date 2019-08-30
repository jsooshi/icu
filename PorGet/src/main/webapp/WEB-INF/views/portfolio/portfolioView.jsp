<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<script src="/porget/js/jquery-3.js"></script>
    <title>Document</title>
<script src="/porget/js/jquery-3.js"></script>    
<script type="text/javascript">

$(function(){ //jquery영역
	
	$.ajax({ //조회수 업데이트 
		url: '../replies/read',
		type: 'post',
		data: {
			pfnum : ${param.pfnum}
		}
		
	})	 
	
	//게시글을 열람, 접속한 사람, 무조건 실행? 실행. 
	function replyList (){ 	
	 $.ajax({
		 url : '../replies/list',
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
		
	$('#replySave').click(function(){
		var replyCon = $("#replyContents").val(); //댓글내용 
		
		var replyData={
				pfnum: ${param.pfnum},  //게시판번홈
				rcontent: replyCon, //댓글내용
				rdeep: 0,
				uname: "${uname}" //userID 
							
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
	
}) //ready


</script>
</head>
<body>

<div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">${list.PFNAME }</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
	    <img src="http://placehold.it/200" class="rounded-circle" style="width:20%;">
        <div class="d-inline">
            닉네임: ${list.UNAME }<br>
            포지션: ${list.PFPOSITION }<br>
            태그: ${list.TAGNAME }
        </div>

        [스크린샷]<br>
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

        조회수: <br>

        <a href="${list.PFURL }" class="btn btn-primary">
		 포트폴리오 링크
        </a><br>
		
		<button class="btn btn-danger" id="recommendBtn">좋아요</button>
		<div class="recommend">
	        좋아요수: ${list.JOA }<br>
		</div>		
        <a href="update?pfnum=${list.PFNUM }">수정</a><br>
        <a href="delete?pfnum=${list.PFNUM }">삭제</a><br>
        <hr>
        
                [댓글] <!-- 댓글작성 -->
        <img src="http://placehold.it/200" class="rounded-circle" style="width:20%; display:inline;">
        <div class="box-header with-border">
        	<h3 class="box-title">Comment</h3>
        	댓글 수: ${list.REPLYNUM }
        </div>
        <div class="box-body">
        	<div class="form-group">
        	<c:choose>
        		<c:when test="${!empty uname }">
        		<textarea id="replyContents" rows="3" cols="60" placeholder="내용을입력하세요" ></textarea>
        		<br>
        		<span style="color:#aaa;" id="counter">(0/최대100자)</span>
        		<input type="button" value="저장" id="replySave">
        		</c:when>
        		<c:otherwise>
        		<textarea id="replyContents" rows="3" cols="60" placeholder="로그인하세요" ></textarea>
        		</c:otherwise>
        	</c:choose>	
        		
        		
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