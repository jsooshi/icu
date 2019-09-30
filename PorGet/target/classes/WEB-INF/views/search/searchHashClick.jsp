<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="content">
		<br>
		<h3> #${HashTag }</h3>
		<hr>
			<div id="divContent" class="row">
		</div>
			</div>
		</div> 
	
		<!-- 모달창 -->
		<div class="modal" id="myModal"></div>


	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	
<script type="text/javascript">
	var i = 2;
	var keyword = '<%= request.getAttribute("HashTag") %>';
	$(document).ready(function() {
		$.ajax({
			url : "/porget/searchHashClickContent",
			data : {"base" : 1, "keyword":keyword},
			success : function(data) {
				$('#divContent').append(data);
			}
			
		});
		$(document).scroll(function() {
		    var maxHeight = $(document).height();
		    var currentScroll = $(window).scrollTop() + $(window).height();
		    if (maxHeight <= currentScroll+1) {
				$.ajax({
					url : "/porget/searchHashClickContent",
					data : {"base" : i++, "keyword":keyword},
					success : function(data) {
						$('#divContent').append(data);
					}
				});
			}
		});
	});
</script>
	
