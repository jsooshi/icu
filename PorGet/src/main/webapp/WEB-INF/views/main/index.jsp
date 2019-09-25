<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- body -->

	<div id="bannerimage"></div>

<!-- Banner -->
    <div class="jumbotron" >
    	<div name='pfname'>asdfasdf</div>
    	<div name='joa'>asdf</div>
    	<div class='uname'>asdfasdf</div>
    </div>	

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
		
		$.ajax({
			url:"/porget/banner/selectBanner",
			success:function(banner){
				console.log("ㅇㅇㅇㅇ ㅁㄴㅇㄹ>> "+banner.PFTHUMB)
				var pfThumb = 'url("/porget/files/'+banner.PFTHUMB+"\")"
				$('.jumbotron').css("background-image",pfThumb)
				$('.jumbotron').children('div[name=pfname]').html(banner.PFNAME)
				$('.jumbotron').children('div[name=joa]').html(banner.JOA)
				$('.jumbotron').children('.uname').html(banner.UNAME)
			}
		})
	});

</script>

