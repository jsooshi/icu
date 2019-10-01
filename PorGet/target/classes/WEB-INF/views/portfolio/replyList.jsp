<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="/porget/js/jquery-3.js"></script>
<script src="/porget/js/reReply.js"></script>

<c:forEach items="${replyList }" var="reply">
	<c:choose>
		<c:when test="${reply.rdeep eq 0 }">
			<div name="reply">
		</c:when>
		<c:otherwise>
			<div name="reReply" style="margin-left: 20px">
			<img src="/porget/img/comment.PNG" height="20px" width="25px">
				<%--대댓글인경우 들여나오기 --%>
		</c:otherwise>
	</c:choose>
		<strong>${reply.uname }</strong>
	<font size="2px">	<fmt:formatDate value="${reply.rdate }" pattern="yyyy-MM-dd" /></font>
	<c:if test="${!empty uname }">
	<c:if test="${reply.rdeep eq 0 }">
		<a name="replyAgain"  style="cursor: pointer;"><font color="blue" size="1px">댓글</font></a>
		<!-- <input type="button" value="댓글달기" name="replyAgain"> -->
		
	</c:if>
	<c:if test="${reply.uname eq uname }">
	<!-- 	<input type="button" value="삭제" name="replyDelete"> -->
	<a name="replyDelete"  style="cursor: pointer;"><font color="red" size="1px">삭제</font></a>
	</c:if>
	
	</c:if>
	<br>${reply.rcontent }
	<hr>
	
	<input type="hidden" name='re' value="${reply.rgroup }">
	<input type="hidden" name="rn" value="${reply.rnum }">
	</div>
</c:forEach>

<!-- 대댓글 작성창 -->
<div id='replyReply' style="display: none; margin-left: 20px">
	<!-- 대댓글창  -->
	<br>
	<textarea id="reReplyCon" row=3 cols=57  style="border: 0" placeholder="comment">
	</textarea>
	<br> <font size="2px"><span style="color: #aaa;" id="counter2">(0/최대100자)</span></font>
	
	<a name="reReSave"  style="cursor: pointer;"><font color="blue" size="2px">저장</font></a>
	<a name="reReplyCancel"  style="cursor: pointer;"><font color="red" size="2px">취소</font></a>
	
	
</div>
