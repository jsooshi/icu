<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
	 .maxSize{
		width: 925px;
		height: 500px;
	}
	.imgMaxSize{
		position:absolute;
		top:0;
		left:0;
		right:0;
		bottom:0;
		max-width:100%;
		max-height:100%;
		margin: auto;
	} 
	
	
	
	
</style>
<title>Document</title>
<script src="/porget/js/jquery-3.js"></script>


<script>
var realPath = "${realPath}";

function delPortfolio(num){
	if(confirm("정말 삭제하시겠습니까?")){
		location.replace("delete?pfnum="+num);
	}
}
var pfnum=${param.pfnum}
var uname="${uname}"
var writer="${list.UNAME }"
</script>
<script src="/porget/js/reply.js"></script>
<style>

	.maxSize{
		width: 925px;
		height: 500px;
	}
	.imgMaxSize{
		position:absolute;
		top:0;
		left:0;
		right:0;
		bottom:0;
		max-width:100%;
		max-height:100%;
		margin: auto;
	} 

	.recommendimg {
		width: 50px;
	}
	
	.rounded-circle {
		position:absolute;
		width:50px;
		top:20%;
		left:35%;
	}


</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"/>	


    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <!-- Post Content Column -->
            <div class="col-sm-12">
                <!-- Title -->
                <h1 class="mt-4">${list.PFNAME }</h1>
                <!-- Author -->
                <hr>
                <!-- Date/Time -->
                <p>${list.PFDATE}</p>
                <hr>            
            </div>
            <div class="col-lg-8">
                <!-- Preview Image -->
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <c:forEach items="${thumb}" var="thumbImg" varStatus="status">
                            <li data-target="#carouselExampleIndicators" data-slide-to="${status.count-1 }"></li>
                        </c:forEach>
                    </ol>
                    <div class="carousel-inner">
                        <c:forEach items="${thumb}" var="thumbImg" varStatus="status">
                            <div class="carousel-item maxSize">
                                <img class="d-block imgMaxSize" src="/porget/files/${thumbImg }" alt="
                                        slide">
                            </div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <hr>

                <!-- Post Content -->
                <hr>
                <c:choose>
                        <c:when test="${list.UNAME == uname }">
                            <a href="update?pfnum=${list.PFNUM }">수정</a> | 
                            <a href="javascript:delPortfolio(${list.PFNUM })">삭제</a><br>
                        </c:when>
                </c:choose>

                <!-- Comments Form -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Comment</h3>
                        <hr>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <c:choose>
                                <c:when test="${!empty uname }">
                                    <textarea id="replyContents" rows="3" cols="80" placeholder="내용을입력하세요" style="border: none"></textarea>
                                    <br>
                                    <font size="2px"><span style="color:#aaa;" id="counter">(0/최대100자)</span></font>
                                    <a name="replySave"  style="cursor: pointer;">
                                    <font color="blue" size="2px">저장</font></a>
                                    <hr>
                                   <!--  <input type="button" value="저장" id="replySave"> -->
                                </c:when>
                                <c:otherwise>
                                    <textarea id="replyContents" rows="3" cols="60" placeholder="로그인하세요" style="border: none"
                                        readonly></textarea>
                                </c:otherwise>
                            </c:choose>


                        </div>
                    </div>
                    <div class="box-footer" id="replyArea">
                        <!-- 댓글 뿌려주기 -->
                    </div>

                </div>
            </div>

            <!-- Sidebar Widgets Column -->
            <div class="col-md-4">
                <div class="card my-4">
                    <div class="row">
                        <div class="col-lg-4">
                        	<a href="/porget/mypage/${list.UNAME }">
	                            <img src="/porget/files/profile/${list.UPHOTO } " class="rounded-circle">
                        	</a>
                        </div>
                        <div class="col-lg-8">
                            <ul class="list-unstyled mb-0">
                                <li>${list.UNAME }</li>
                                <li>${list.PFPOSITION }</li>
									<c:forTokens items="${list.TAGNAME }" delims="#" var="item">
									   <a href="/porget/searchHashClick?keyword=${item}">#${item}</a> &nbsp;
									</c:forTokens>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="card my-4">
                <c:if test="${not empty list.PFURL}">
                    <a href="${list.PFURL }" class="btn btn-primary pd-4" target="_blank">
                            포트폴리오 링크
                    </a>
                </c:if>
                <c:if test="${not empty list.PFFILE}">
                    <a href="/porget/portfolio/download?fileName=${list.PFFILE }" class="btn btn-info pd-4">
                            포트폴리오 다운로드
                    </a>
                </c:if>
                
	                <div id="recommend">
						<c:choose>
							<c:when test="${recommend eq 0 }">
		<!--                     <button class="btn btn-danger" id="recommendBtn">좋아요</button> -->
								<a href="#"><img src="/porget/img/heart.png" class="recommendimg"></a>${list.JOA }
							</c:when>
							<c:otherwise>
								<a href="#"><img src="/porget/img/heartfull.png" class="recommendimg"></a>${list.JOA }
							</c:otherwise>
						</c:choose>                
	                </div>
                </div>
                <div class="card my-4">
                    조회수: ${list.PFREAD }<br>
                </div>
            </div>
        </div>
     </div>
     
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
 	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
			
		
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script> 
		
	

</body>

</html>