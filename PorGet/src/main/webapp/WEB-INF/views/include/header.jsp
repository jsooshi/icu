<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>PorGet</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/porget/css/main.css">
	<script src="/porget/js/jquery-3.js"></script>  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		var check = false;
		var loopKeyword=false;
		
		function startSuggest(){
			if(!check){
				setTimeout('sendKeyword()',200);
				loopKeyword=true;
			}
			check=true;
		}
		
		function sendKeyword(){
			console.log('>>>sendKeyword')
			if(!loopKeyword) return;
			
			var keyword = document.searchForm.keyword.value;
			
			
			if(!keyword.includes('#')&&keyword != ''){
				show('suggest');
				$.ajax({
					url:"/porget/searchKey",
					data: {keyword:keyword},
					success: function(data){
						$('#suggestList').html(data);
					}
				});
				check = false;
				loopKeyword=false;
			}else if(keyword.includes('#')){
					if(keyword.substr(0,keyword.length)=='#'||keyword.substr(keyword.lastIndexOf('#'),keyword.length)=='#'){
						hide('suggest');
						check = false;
						loopKeyword=false;
					}else{
						keyword = keyword.substr(keyword.lastIndexOf('#')+1,keyword.length);
							show('suggest');
							$.ajax({
								url:"/porget/searchTagBox",
								data: {keyword:keyword},
								success: function(data){
									$('#suggestList').html(data);
								}
							});
							check = false;
							loopKeyword=false;
						}
			}else{
				hide('suggest');
				check = false;
				loopKeyword=false;
			}
				setTimeout('sendKeyword()',200)
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
			 var key =  document.searchForm.keyword.value;
				key = key.substr(0, key.lastIndexOf('#'));
				console.log('key는 '+key);
		   document.searchForm.keyword.value= key + selectedKeyword;
				check=false;
				loopKeyword=false;
		       hide('suggest');
		}	
	
		 function select2(selectedKeyword){ //해시태그로 검색후 쌓이게
			 var key =  document.searchForm.keyword.value;
				key = key.substr(0, key.lastIndexOf('#')-1);
				console.log('key는 '+key);
		   document.searchForm.keyword.value=selectedKeyword;
		       //제시어 기능이 일단락 되었음
				/* check=false;
				loopKeyword=false;*/
		       show('suggest'); 
		}	
	
	</script>  
</head>

<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
	<a href="/porget" class="navbar-brand">
	    <img id="logo" class="d-inline-block mr-1" alt="Logo" src="/porget/img/main/dotty.svg">
        <span>PorGet</span>
	</a>
	<form name="searchForm" action="searchButton" method="post">
		<input type="text" name="keyword" size="50" onkeydown="startSuggest()" id="searchInput">
		<input type="submit" value="검색">
		&nbsp;&nbsp;&nbsp;
		<div id="suggest" style="display:; position: absolute; left: 150px;">
		<div id="suggestList"></div>
		</div>
	</form>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a href="/porget" class="home nav-link">Home</a></li>
			<li class="nav-item"><a href="/porget/portfolio"
				class="portfolio nav-link">Portfolio</a></li>

			<c:choose>
				<c:when test="${empty uname}">
					<li class="nav-item"><a href="/porget/login" class="nav-link">login</a></li>
					<button onclick="location.href='join'" class="btn btn-primary">Sign in</button>
				</c:when>
				<c:otherwise>
					<!-- <button onclick="location.href='portfolio/post'" class="btn btn-primary">Posting!</button> -->
					<div class="dropdown show">
						  <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						  	<img src="http://placehold.it/200" class="rounded-circle" style="width: 20%;">
						  </a>
						
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						    <div class="dropdown-item">${uname }님 환영합니다! </div>
						    <a class="dropdown-item" href="mypage#profile">프로필</a>
						    <a class="dropdown-item" href="mypage#portfolio">포트폴리오</a>
						    <a class="dropdown-item" href="mypage#bookmark">북마크</a>
						    <a class="dropdown-item" href="mypage">마이페이지</a>
						    <a class="dropdown-item" href="/porget/logout">로그아웃</a>
						  </div>
					</div>
				</c:otherwise>
			</c:choose>

		</ul>
	</div>
</nav>


