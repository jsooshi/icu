<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>해시태그 검색결과</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var i = 2;
	var keyword = '<%= request.getAttribute("keyword") %>';
	$(document).ready(function() {
		$.ajax({
			type: "POST",
			url : "/porget/searchHashTagList",
			data : {"base" : 1, "keyword":keyword},
			//dataType: "json",
			//data : "base="+1+"&keyword="+keyword,
			//dataType : "json",
			success : function(data) {
				$('#divContent').append(data);
			}
			
		});
		$(document).scroll(function() {
		    var maxHeight = $(document).height();
		    var currentScroll = $(window).scrollTop() + $(window).height();
		    if (maxHeight <= currentScroll) {
				$.ajax({
					type: "POST",
					url : "/porget/searchHashTagList",
					data : {"base" : i++, "keyword":keyword},
					//data : "base="+i+"&keyword="+keyword,
					//dataType: "json",
					//data : {base : i++, keyword:keyword},
					//dataType : "json",
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
		<h3>해시태그로 검색한 결과입니다.</h3>
			<div id="divContent" class="row"> 
						
			</div>
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