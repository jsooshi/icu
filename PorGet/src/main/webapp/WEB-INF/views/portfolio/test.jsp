<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<div class="modal-dialog" role="document">
	   <div class="modal-content">
	     <div class="modal-header">
	      <h4 class="modal-title" id="myModalTitle">${list.PFNAME }</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
	     </div><!-- header -->
	     <div class="modal-body">
	       <img src="http://placehold.it/200" class="rounded-circle"
					style="width: 20%;">
				<div class="d-inline">
					닉네임: ${list.UNAME }<br> 포지션: ${list.PFPOSITION }<br> 태그:
					${list.TAGNAME }
				</div>

				[스크린샷]<br>

				<c:forEach items="${thumb}" var="thumbImg">
					<img alt="하하하" src="/porget/files/${thumbImg}"
						style="max-height: 390px; max-width: 260px;">
				</c:forEach>

				조회수: <br> <a href="${list.PFURL }" class="btn btn-primary">
					포트폴리오 링크 </a><br>

				<button class="btn btn-danger" id="recommendBtn">좋아요</button>
				<div class="recommend">
					좋아요수: ${list.JOA }<br>
				</div>
				<a href="update?pfnum=${list.PFNUM }">수정</a><br> <a
					href="delete?pfnum=${list.PFNUM }">삭제</a><br>
				<hr>
				<img src="http://placehold.it/200" class="rounded-circle"
					style="width: 20%; display: inline;">
				<div class="box-header with-border">
					<h3 class="box-title">Comment</h3>
					댓글 수: ${list.REPLYNUM }
				</div>
				<div class="box-body">
						<c:choose>
							<c:when test="${!empty uname }">
								<textarea id="replyContents" rows="3" cols="60"
									placeholder="내용을입력하세요"></textarea>
								<br>
								<span style="color: #aaa;" id="counter">(0/최대100자)</span>
								<input type="button" value="저장" id="replySave">
							</c:when>
							<c:otherwise>
								<textarea id="replyContents" rows="3" cols="60"
									placeholder="로그인하세요" readonly></textarea>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="replyArea">
					<!-- 댓글 뿌려주기 -->
				</div>
	     </div><!-- modal body -->
	     <div class="modal-footer">
	      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	     </div>
	   </div>
	 </div>
