<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>

    .wrap-loading {
        height: 100vh;
        
    }


    .wrap-loading img{
        
        position: relative;
        top: 10%;
        left: 400px;
        width: 100px;
    }
</style>

<br>
<div class="container">
	<div class="content">
		<h3>Portfolio</h3>
		<hr>
		<!-- <div id="div01"	style="text-align: center; border: 1px solid #5AAFFF; height: 500px; overflow-y: scroll;"> -->
		<div class="wrap-loading"><img src="/porget/img/Spin-1s-200px.gif"/></div>
		<div id="divContent" class="row"></div>
		<!-- </div> -->
	</div>
</div>

<!-- 글작성 버튼 -->
<div class="bg-white p-4 rounded shadow-sm h-100">
	<button class="btn-post btn btn-primary btn-circle btn-circle-xl m-1">+</button>
</div>

<!-- 모달창 -->
<div class="modal" id="myModal"></div>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />




<script type="text/javascript">
	/* 	function portfolioView(pfnum) {
	
	 console.log(pfnum);
	
	 $.ajax({
	 url : "portfolio/view",
	 type: "get",
	 data: {
	 pfnum: pfnum
	 },
	 success : function(result) {
	 console.log(result);
	 $('#myModal').html(result);
	 }
	 }); 
	 } */

	var i = 2;
	$(document).ready(function() {
		$.ajax({
			url : "/porget/portfolio/partPopular",
			data : {
				base : 1
			},
			success : function(data) {
				$('#divContent').append(data);
			},
		    beforeSend:function(){
		        //(이미지 보여주기 처리)
		        $('.wrap-loading').removeClass('display-none');
		    },
		    complete:function(){
		        //(이미지 감추기 처리)
		        $('.wrap-loading').addClass('display-none');
		    }
		});
		$(document).scroll(function() {

		    var maxHeight = $(document).height();
		    var currentScroll = $(window).scrollTop() + $(window).height();
		    if (maxHeight <= currentScroll+1) {
				$.ajax({
					url : "/porget/portfolio/partPopular",
					data : {
						base : i++
					},
					success : function(data) {
						$('#divContent').append(data);
					}
				});
			}
		});
		
		// 글작성버튼 유효성
		$('.btn-post').click(function(){
			if('${uname}'===""){
				alert('로그인 해주세요');
				return;
			}else {
				location.href = 'portfolio/post';
			}
		})
	});
</script>

