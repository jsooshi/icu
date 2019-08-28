<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="/porget/js/jquery-3.js"></script>
<script>
$(function(){
	$('#reply_reply').on('click',function(){
		
		$('#div').append('<div><textarea></textarea><br><button>저장</button></div>');
		
		
	})//click
	
});//ready


</script>


<c:forEach items="${replyList }" var="reply">
<div id="div">
	작성자: ${reply.uname }
	작성날짜: <fmt:formatDate value="${reply.rdate }" pattern="yyyy-MM-dd"/><br>
	<textarea rows="3" cols="60">${reply.rcontent }</textarea><br>
	<input type="button" value="삭제">
	<input type="button" value="댓글달기" id="reply_reply"><br><br>
	
</div>
</c:forEach>
