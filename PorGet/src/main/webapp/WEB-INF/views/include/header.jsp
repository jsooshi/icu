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
	<link rel="stylesheet" href="css/main.css">
</head>

<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
	<a href="/porget" class="navbar-brand">
	    <img id="logo" class="d-inline-block mr-1" alt="Logo" src="/porget/img/main/dotty.svg">
        <span>PorGet</span>
	</a>
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
						    <a class="dropdown-item" href="#">프로필</a>
						    <a class="dropdown-item" href="#">포트폴리오</a>
						    <a class="dropdown-item" href="#">북마크</a>
						    <a class="dropdown-item" href="#">마이페이지</a>
						    <a class="dropdown-item" href="/porget/logout">로그아웃</a>
						  </div>
					</div>
				</c:otherwise>
			</c:choose>

		</ul>
	</div>
</nav>


