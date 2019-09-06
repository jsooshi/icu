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
	<script>
	var socket = null;
	$(document).ready(function(){
		connectWS();	
	})
	
	function connectWS(){
		var ws = new WebSocket("ws://192.168.0.124/porget/replyEcho?pfnum=1");
		socket = ws
		ws.onopen = function(){
		console.log('Info: connection opened')
	};
	
		ws.onmessage = function (event) {
		console.log(event.data+'\n');
		$('#socketAlert').html(event.data);
		$('#socketAlert').css("display","block");
		setTimeout(function(){
			$('#socketAlert').css("display","none");
		},7000)
	}	
	
		ws.onclose = function (event) {
			console.log('Info: connecion closed')
			setTimeout(function () {connect()},1000); //retry connection	
	}
		ws.onerror = function (err) { console.log('error: ', err)}
	
	}	
</script>
<style>
 body {
		font-family: 'Varela Round', sans-serif;
	}
.modal-login {		
		color: #636363;
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-login .modal-header {
		border-bottom: none;   
        position: relative;
        justify-content: center;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-login .form-control:focus {
		border-color: #70c5c0;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-login .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-login .modal-footer {
		background: #ecf0f1;
		border-color: #dee4e7;
		text-align: center;
        justify-content: center;
		margin: 0 -20px -20px;
		border-radius: 5px;
		font-size: 13px;
	}
	.modal-login .modal-footer a {
		color: #999;
	}		
	.modal-login .avatar {
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -70px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: #60c7c1;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-login .avatar img {
		width: 100%;
	}
	.modal-login.modal-dialog {
		margin-top: 80px;
	}
    .modal-login .btn {
        color: #fff;
        border-radius: 4px;
		background: #60c7c1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
    }
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #45aba6;
		outline: none;
	}

</style>
</head>

<body>
<!-- Navigation -->
<!-- 상단에  알람바 변경 -->
<div id="socketAlert" class="alert alert-success" role="alert" style="display:none;left:0px ;top:100px; position: fixed; z-index: 1;"></div> 
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
					<li class="nav-item"><a href="#myModal" class="nav-link" data-toggle="modal">login</a></li>
					<button onclick="location.href='join'" class="btn btn-primary">Sign in</button>
				</c:when>
				<c:otherwise>
					<!-- <button onclick="location.href='portfolio/post'" class="btn btn-primary">Posting!</button> -->
					<div class="dropdown show">
						  <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
 						  	<img src="/porget/files/profile/${uphoto }" class="rounded-circle" style="width: 50px; height:50px;"> 
						  </a>
						
						  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
						    <div class="dropdown-item">${uname }님 환영합니다! </div>
						    <a class="dropdown-item" href="/porget/mypage#portfolio">포트폴리오</a>
						    <a class="dropdown-item" href="/porget/mypage#bookmark">북마크</a>
						    <a class="dropdown-item" href="/porget/mypage">마이페이지</a>
						    <a class="dropdown-item" href="/porget/logout">로그아웃</a>
						  </div>
					</div>
				</c:otherwise>

			</c:choose>

		</ul>
	</div>
</nav>

<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<div class="avatar">
					<img src="/porget/img/member/avatar.png" alt="Avatar">
				</div>				
				<h4 class="modal-title">Member Login</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="/porget/login" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="uemail" placeholder="Email" required="required">		
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="upass" placeholder="Password" required="required" id="upass">	
					</div>        
					<div class="form-group">
						<button type="submit" name="login" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#">Forgot Password?</a>
			</div>
		</div>
	</div>
</div>   


