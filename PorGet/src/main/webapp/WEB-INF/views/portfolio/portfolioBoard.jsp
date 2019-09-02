<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PorGet</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	/* 	function portfolioView(pfnum) {
	
	 console.log(pfnum);
	
	 $.ajax({
	 url : "portfolio/view",
	 type: "get",
	 data: {
	 pfnum: pfnum
	 },
	 success : function(result) {
	 console.log(result);
	 $('#myModal').html(result);
	 }
	 }); 
	 } */
	 
	var i = 2;
	$(document).ready(function() {
		$.ajax({
			url : "/porget/portfolio/partPopular",
			data : {base : 1},
			success : function(data) {
				$('#divContent').append(data);
			}
		});
		$(document).scroll(function() {
		    var maxHeight = $(document).height();
		    var currentScroll = $(window).scrollTop() + $(window).height();
		    if (maxHeight <= currentScroll) {
				$.ajax({
					url : "/porget/portfolio/partPopular",
					data : {base : i++},
					success : function(data) {
						$('#divContent').append(data);
					}
				});
			}
		});
	});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<article>
		<div class="content">
					<h3>게시판</h3>
					<a href="portfolio/post" class="btn btn-primary">글 생성</a>
				<!-- <div id="div01"	style="text-align: center; border: 1px solid #5AAFFF; height: 500px; overflow-y: scroll;"> -->
					<div id="divContent" class="row"> 
						
					</div>
				<!-- </div> -->
		</div> 
		<!-- 모달창 -->
		<div class="modal" id="myModal"></div>
	</article>


	<jsp:include page="/WEB-INF/views/include/footer.jsp" />



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous">
		
	</script>
</body>
</html>