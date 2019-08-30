<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PorGet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script>
	$(function(){
		$.ajax({
			url:"/porget/mainpopular",
			success: function(result){
				$('#popular').html(result);
			}
		});
		
		$.ajax({
			url:"/porget/mainrecent",
			success: function(result){
				$('#recent').html(result);
			}
		});
	});

</script>
<style>
#bannerimage {
	width: 100%;
	background-image: url(https://assets.awwwards.com/awards/sites_of_the_day/2019/07/humpback-whale-1.jpg);
	height: 405px;
	background-position: center;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- body -->

	<div id="bannerimage"></div>

<!-- Popular Content -->
	<article>
		<div id="popular" class="container"></div>
	</article>
	
<!-- Recent Content -->
	<article>
		<div id="recent" class="container">
			
		</div>
	</article>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

</body>

</html>