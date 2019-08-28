<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scrollTest</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var i=2;
	$(document).ready(function(){
		$.ajax({
			url:"/porget/partPopular",
			data: {base:1},
			success: function(data){
				$('#divContent').append(data);
			}
		});
	    $('#div01').scroll(function(){
	        var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
	        var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
	        var contentH = $('#divContent').height(); //문서 전체 내용을 갖는 div의 높이
	        if(scrollT + scrollH +1 >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
	        	$.ajax({
	        		url:"/porget/partPopular",
	    			data: {base:i++},
	    			success: function(data){
	    				$('#divContent').append(data);
	    			}
	        	});
	        }
	    });
	});
</script>
</head>
<body>
		<h3>Popular</h3>
		<hr>
		<div id="div01" style="text-align:center; border: 1px solid #5AAFFF; height:200px; overflow-y:scroll;">
   		<!--나중에 여기있는 height크기 조정하면 됩니다 테스트용으로 200넣었습니다 -->
   		<div id="divContent">
		</div>
		</div>
		
</body>
</html>