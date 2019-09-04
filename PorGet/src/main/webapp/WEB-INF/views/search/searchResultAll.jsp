<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="content">
		<h3>제목으로 검색한 결과입니다.</h3>
		<hr>
		 	<div id="content1" class="row"></div>
	 	</div>
 	</div>
 	<br>	
 	<br>	
 	<br>	
	<div class="container">
		<div class="content">
		<h3>태그로 검색한 결과입니다.</h3>
		<hr>
		 	<div id="content2" class="row"></div>
	 	</div>
	</div>
 	<br>
 	<br>
 	<br>
 	<br>
 		
<!-- 모달창 -->
<div class="modal" id="myModal"></div> 		

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	window.onload=function(){
	var input = '<%= request.getAttribute("input") %>';
	var tagOrName = '<%= request.getAttribute("tagOrName") %>';
	console.log('input>>'+input);
	console.log('tagOrName>>'+tagOrName);
	if(tagOrName=='name'){
		console.log('에이작스 들어가기전');
		$.ajax({
			url : "/porget/searchNameList",
			data : {input:input},
			success : function(data) {
				$('#content1').append(data);
			}
		});
		$('#content2').html('<h4>태그로 검색한 결과가 없습니다.</h4>');
	
	}else if(tagOrName=='tag'){
		$.ajax({
			url : "/porget/searchTagList",
			data : {input:input},
			success : function(data) {
				$('#content2').append(data);
			}
		});
		$('#content1').html('<h4>제목으로 검색한 결과가 없습니다.</h4>');
	}else if(tagOrName=='both'){
		$.ajax({
			url : "/porget/searchNameList",
			data : {input:input},
			success : function(data) {
				$('#content1').append(data);
			}
		});
		$.ajax({
			url : "/porget/searchTagList",
			data : {input:input},
			success : function(data) {
				$('#content2').append(data);
			}
		});
	}
	}
</script>