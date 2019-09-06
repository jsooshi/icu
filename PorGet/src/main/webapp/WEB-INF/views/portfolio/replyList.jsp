<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="/porget/js/jquery-3.js"></script>
<script>
$(function(){
	var group=0;
	$('a[name=replyAgain]').on('click',function(){ //댓글 눌렀을 시 대댓글 입력 창 
		
		$(this).parent('div[name=reply]').after($('#replyReply'));
		$('#replyReply').css("display","");
		$('#reReplyCon').focus();
		group = $(this).parent().children('input[name=re]').val(); //rgroup번호 (pk) 얻기 
		
										
	})//click

	$('a[name=reReSave]').on('click', function(){ //대댓글 작성 저장 클릭 
		var reCon = $("#reReplyCon").val();
		if(reCon===""){
			alert('내용을입력하세요')
			$("#reReplyCon").focus();
			return;
		}
		var concon =  {
				pfnum: ${param.pfnum},
				uname: "${uname}",
				rcontent: reCon,
				rgroup : group,
				rdeep: 1
			}
			console.log(concon)
		$.ajax({
			url: '../replies/save',
			type: 'post',
			data: concon,
			success: function(result){
				$('#replyArea').html(result);
			}
		
		})
		
		$("#reReplyCon").val('');
	})//대댓글 저장 클릭 시 
	
	$('a[name=reReplyCancel]').on('click', function(){
		$('#replyReply').css("display","none");
	})//대댓글 작성 취소 시 
	
	
	$('a[name=replyDelete]').on('click', function(){
		if(confirm('삭제하시겠습니까? '))
		var number = $(this).parent().children('input[name=rn]').val();
		$.ajax({
			url : '../replies/delete',
			data : {
				rnum : number,
				pfnum: ${param.pfnum},
				
			},
			success : function(result){
				$('#replyArea').html(result);
			}
			
		})
		
		
	})//댓글 삭제 클릭 시
	
	
	$('#reReplyCon').keyup(function(e){ //대댓글 글자수 카운터 및 제한
		var content2 = $(this).val();
		$('#counter2').html("("+content2.length+"/최대100자)");
		if(content2.length>150){
			alert('최대100자까지 가능합니다')
			$(this).val(content.substring(0,100));
			$('#counter2').html('(100/최대150자');
		}
		
	})
	
});//ready
</script>

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
	
	<a name="reReplyCancel"  style="cursor: pointer;"><font color="blue" size="2px">저장</font></a>
	<a name="reReSave"  style="cursor: pointer;"><font color="red" size="2px">취소</font></a>
	
	
</div>
