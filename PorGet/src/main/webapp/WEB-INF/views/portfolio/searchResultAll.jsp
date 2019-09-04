<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
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
				$('#content').append(data);
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
		$('#content').html('<h4>제목으로 검색한 결과가 없습니다.</h4>');
	}else if(tagOrName=='both'){
		$.ajax({
			url : "/porget/searchNameList",
			data : {input:input},
			success : function(data) {
				$('#content').append(data);
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
</head>
<body>
	<h3>제목으로 검색한 결과입니다.</h3>
	 	<div class="content" id="content">
 		</div>
 	<br>	
 	<br>	
 	<br>	
	<h3>태그로 검색한 결과입니다.</h3>
	 	<div class="content2" id="content2">
 		</div>
</body>
</html>