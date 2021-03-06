<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<style>
	
	.jumbotron {
		background-image: url("/porget/img/main/whale.jpg");
		padding:200px;
		height: 500px;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}
	.jumbotron .pfname{
		font-size: 30px;
		text-align: center;
		background-color: rgba( 255, 255, 255, 0.1 );
	}
	.jumbotron .joa, .jumbotron .uname{
		text-align: center;
		margin-top: 15px;
		background-color: rgba( 255, 255, 255, 0.3 );
	}
</style>


<!-- body -->

	<div id="bannerimage"></div>

<!-- Banner -->
    <div class="jumbotron" >
    	<div class='pfname'></div>
    	<div class='joa'></div>
    	<div class='uname'></div>
    </div>	

<%-- <!-- 임시 -->
<p>확인</p>
 	<sec:authentication property = "principal"/>
	<sec:authentication property="principal.user"/><br>
	<sec:authentication property="principal.user.uname"/>
	<sec:authentication property="principal.user.uphoto"/> --%>
	 


<!-- Popular Content -->
	<div class="container">
        <h4>인기 게시글</h4>
        <hr>
        <div class="row" >
        <div class="card-deck" id="popular" style="min-width: 100%">
        </div>
        </div>
   	</div>
   	<br>
	
<!-- Recent Content -->
	<div class="container">
        <h4>최근 등록 게시글</h4>
        <hr>
        <div class="row" >
        <div class="card-deck" id="recent" style="min-width: 100%"></div>
        </div>
   	</div>


<!-- footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	

<script>
	$(function(){
		var bannerNum=0;
		$.ajax({
			url:"/porget/banner/selectBanner",
			success:function(banner){
				if(banner.PFNUM != null){
					bannerNum=banner.PFNUM
					var pfThumb = 'url("/porget/files/'+banner.PFTHUMB+"\")"
					$('.jumbotron').css("background-image",pfThumb)
					$('.jumbotron').children('div.pfname').html(banner.PFNAME)
					$('.jumbotron').children('div.joa').html("좋아요 : "+banner.JOA)
					$('.jumbotron').children('.uname').html(banner.UNAME)
				}
			}
		})
		$.ajax({
			url:"/porget/mainpopular",
			success: function(result){
				$('#popular').html(result);
			}
		});
		
		$.ajax({
			url:"/porget/mainrecent",
			success: function(result){
				$('#recent').html(result);
			}
		});
		$('div.jumbotron').on("click",function(){
			if(bannerNum !=0){
				location.href="/porget/portfolio/view?pfnum="+bannerNum;
			}
		})
	});

</script>

