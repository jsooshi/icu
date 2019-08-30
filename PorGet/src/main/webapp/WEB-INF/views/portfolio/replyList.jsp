<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="/porget/js/jquery-3.js"></script>
<script>
$(function(){
	var group=0;
	$('[name=replyAgain]').on('click',function(){ //댓글 눌렀을 시 대댓글 입력 창 
		
		$(this).parent('div[name=reply]').after($('#replyReply'));
		$('#replyReply').css("display","");
		group = $(this).parent().children('input[name=re]').val(); //rgroup번호 (pk) 얻기 
		
										
	})//click

	$('button[name=reReSave]').on('click', function(){ //대댓글 작성 저장 클릭 
		var reCon = $("#reReplyCon").val();
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
	
	$('input[name=reReplyCancel]').on('click', function(){
		$('#replyReply').css("display","none");
	})//대댓글 작성 취소 시 
	
	
	$('input[name=replyDelete]').on('click', function(){
	var number = $(this).parent().children('input[name=rn]').val();
		
		$.ajax({
			url : '../replies/delete',
			data : {
				rnum : number,
				pfnum: ${param.pfnum},
				uname: "${uname}"
			},
			success : function(result){
				$('#replyArea').html(result);
			}
			
		})
		
		
	})//댓글 삭제 클릭 시
	
	
	$('#reReplyCon').keyup(function(e){ //대댓글 글자수 카운터 및 제한
		var content2 = $(this).val();
		$('#counter2').html("("+content2.length+"/최대150자)");
		if(content2.length>150){
			alert('최대150자까지 가능합니다')
			$(this).val(content.substring(0,150));
			$('#counter2').html('(150/최대150자');
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
	<div name="reReply" style="margin-left:20px"> <%--대댓글인경우 들여나오기 --%>
	</c:otherwise>
	</c:choose>
		작성자: ${reply.uname }
		 작성날짜:<fmt:formatDate value="${reply.rdate }" pattern="yyyy-MM-dd" />
		<br>
		<textarea rows="3" cols="60" placeholder="comment" disabled >${reply.rcontent }</textarea><br>
		<c:if test="${reply.uname eq uname }">
		<input type="button" value="삭제" name="replyDelete">
		</c:if>
		<c:if test="${reply.rdeep eq 0 }">
		<input type="button" value="댓글달기" name="replyAgain"><br>
		</c:if>
		 <input type="hidden" name='re' value="${reply.rgroup }">
		 <input type="hidden" name="rn" value="${reply.rnum }">
	</div>
	</c:forEach>

<!-- 대댓글 작성창 -->
<div id='replyReply' style="display: none; margin-left: 20px">
	<!-- 대댓글창  -->
	
	<br><textarea id="reReplyCon" row=3 cols=57></textarea>
	<br>
	<span style="color:#aaa;" id="counter2">(0/최대150자)</span>
	<button name="reReSave">저장</button>
	<input type="button" value="취소" name="reReplyCancel"><br>
</div>
