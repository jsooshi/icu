<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
<script src="/js/jquery-3.js"></script>    
<script type="text/javascript">

$(function(){
		
	$('#replySave').click(function(){
		var replyCon = document.getElementById('replyContents').value;
		var boardnum = 1 //게시판 번호로 추후 변경 ${param.pfnum}
		var replyData={
				pfnum: boardnum, //게시글번호 
				rcontent: replyCon,
				rdeep: 0,
				uname: 'gildong'
							
			};
		
		console.log(replyData);
		
		$.ajax({
			url: '../replies/save',
			dataType: "json",
			type: "post",
			data:  replyData,
			success: function(result){
				alert('성공')
			}
			
			
		})//ajax	
	})//replySave click
}) //ready



</script>
</head>

<style>
    .inline {
        display: inline;
    }
</style>

<body>

    <div class="container">
        <img src="http://placehold.it/200" class="rounded-circle" style="width:20%; display:inline;">
        <p class="inline">
            닉네임: 하늘다람쥐<br>
            포지션: 웹개발자<br>
            태그: Java, Js, Spring
        </p>

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
                        src="https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637_1280.jpg"" alt="
                        First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                        src="https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637_1280.jpg"" alt="
                        Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                        src="https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637_1280.jpg"" alt="
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

        좋아요수: 100<br>
        조회수: 500<br>

        <a href="" class="btn btn-primary">
            포트폴리오 링크
        </a><br>

        <a href="">수정</a><br>
        <a href="">삭제</a><br>
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
        		<br>
        		<input type="button" value="submit" id="replySave">
        	</div>
        </div>
        <div class="box-footer">
        	--댓글리스트공간-- 
        </div>
        




    </div>



</body>

</html>