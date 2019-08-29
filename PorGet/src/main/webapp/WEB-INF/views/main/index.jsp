<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PorGet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var check = false;
	var loopKeyword=false;
	
	function startSuggest(){
		if(!check){
			setTimeout('sendKeyword()',100);
			loopKeyword=true;
		}
		check=true;
	}
	
	function sendKeyword(){
		console.log('>>>sendKeyword')
		if(!loopKeyword) return;
		
		var keyword = document.searchForm.keyword.value;
		
		if(!keyword.includes('#')&&keyword != ''){
			console.log('여긴 에이작스 자리란다');
			show('suggest');
			$.ajax({
				url:"/porget/searchKeyword",
				data: {keyword:keyword},
				success: function(data){
					//$('#suggestList').html('');
					$('#suggestList').html(data);
				}
			});
		}else if(keyword.includes('#')){
//		}else if(keyword != ''){
			console.log('여긴 들어온거니');
				if(keyword.substr(0,keyword.length)=='#'){
					hide('suggest');
					check = false;
					loopKeyword=false;
				}
				else{
					if(keyword.substr(0,keyword.length)=='#'){
						hide('suggest');
						check = false;
						loopKeyword=false;
					}else{
						
				
						var newKeyword = keyword.split('#');
						var newNum = newKeyword.length-1;
						console.log("뉴키워드"+newKeyword);
						console.log("뉴넘버"+newKeyword);
						
						keyword = newKeyword[newNum];
						console.log("들어갈키워드"+keyword);
						
						keyword.substr(1,keyword.length);
						show('suggest');
						$.ajax({
							url:"/porget/searchTegBox",
							data: {keyword:keyword},
							success: function(data){
								$('#suggestList').html(data);
							}
						});
					}
				}
		}else{
			hide('suggest');
			check = false;
			loopKeyword=false;
		}
			setTimeout('sendKeyword()',100)
	}//sendKeyword
	
	function show(elementId) {
		var ele = document.getElementById(elementId); //ele:Element
		if(ele)//id에 해당하는 엘리먼트가 존재한다면
			ele.style.display='';
	}
	
	function hide(elementId) {
		var ele = document.getElementById(elementId); //ele:Element
		if(ele)//id에 해당하는 엘리먼트가 존재한다면
			ele.style.display='none';
	}
	
	 function select(selectedKeyword){
	       //나열된 제시어 중 선택된 단어를 <input name=keyword>에게 전달
	   document.searchForm.keyword.value=selectedKeyword;
	       //제시어 기능이 일단락 되었음
			check=false;
			loopKeyword=false;
	       hide('suggest');
	}	

	 function select2(selectedKeyword){ //해시태그로 검색후 쌓이게
	       //나열된 제시어 중 선택된 단어를 <input name=keyword>에게 전달
	   document.searchForm.keyword.value=selectedKeyword;
	       //제시어 기능이 일단락 되었음
			/* check=false;
			loopKeyword=false;*/
	       show('suggest'); 
	}	

</script>  
<style>
#bannerimage {
	width: 100%;
	background-image: url(https://assets.awwwards.com/awards/sites_of_the_day/2019/07/humpback-whale-1.jpg);
	height: 405px;
	background-position: center;
}
</style>
</head>




<body>



	<jsp:include page="/WEB-INF/views/include/header.jsp"/>

	<!-- body -->

	<article>
	
			<form name="searchForm" action="searchButton" method="post">
				<input type="text" name="keyword" size="50" onkeydown="startSuggest()" id="searchInput">
				<input type="submit" value="검색">
				<div id="suggest" style="display:; position: absolute; left: 60px;">
				<div id="suggestList"></div>
				</div>
			</form>
	
	
		<div id="bannerimage">
			<div class="text-center">인기 포트폴리오 (임시)</div>
		</div>

		<!-- Popular Content -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h3>Popular</h3>
				</div>
				<div class="col-md-4">
					<div class="card">
						<a href="#" class="btn text-left custom-card"> <img
							src="https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637_1280.jpg"
							class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">포트폴리오명</h5>
								<p class="card-text">
									<img src="http://placehold.it/200" class="rounded-circle"
										style="width: 20%; display: inline;"> 하늘다람쥐
								</p>
								<p class="text-muted">조회, 하트, 댓글수</p>
							</div>
						</a>
					</div>
				</div>
			</div>


			<!-- Recent Content -->
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h3>Recent</h3>
					</div>
					<div class="col-md-4">
						<div class="card">
							<a href="#" class="btn text-left custom-card"> <img
								src="https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637_1280.jpg"
								class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title">포트폴리오명</h5>
									<p class="card-text">This is a longer card with supporting
										text below as a natural lead-in to additional content. This
										content is a little bit longer.</p>
									<p class="card-text">
										<small class="text-muted">Last updated 3 mins ago</small>
									</p>
								</div>
							</a>
						</div>
					</div>

				</div>

	</article>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

</body>

</html>