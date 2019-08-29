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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<script src="/porget/js/jquery-3.js"></script>
<style>
#bannerimage {
	width: 100%;
	background-image:
		url(https://assets.awwwards.com/awards/sites_of_the_day/2019/07/humpback-whale-1.jpg);
	height: 405px;
	background-position: center;
}
</style>
<script>
	$(function() {
		$.ajax({
			url : "/",
			success : function(result) {
				$('#porgetBody').html(result);
			}
		})
	});
	
	window.onhashchange = function() {
	    if (window.innerDocClick) {
	        window.innerDocClick = false;
	    } else {
	        if (window.location.hash != '#undefined') {
	            goBack();
	        } else {
	            history.pushState("", document.title, window.location.pathname);
	            location.reload();
	        }
	    }
	}
	
	function portfolioBoard() {
		$.ajax({
			url : "portfolio",
			success : function(result) {
				$('#porgetBody').html(result);
			}
		});
	}

	function portfolioPopular() {
		$.ajax({
			url : "portfolio/popular",
			success : function(result) {
				$('#porgetBody').html(result);
			}
		});
	}

</script>

<body>

	<!-- Navigation 임시-->
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">
			<a href="" class="navbar-brand">PorGet</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/porget" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#" onclick="portfolioBoard(); return false;" class="nav-link">Portfolio</a></li>
					<li class="nav-item"><a href="#" onclick="portfolioPopular(); return false;" class="nav-link">Popular</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- body -->

	<div id="porgetBody">

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

			</div>

			<!-- footer -->
			<footer>
				<div class="container-fluid padding">
					<div class="row text-center">
						<div class="col-sm-6">footer</div>
						<div class="col-sm-6">footer</div>
					</div>
					<div class="col-12">
						<hr class="light">
						<h5 class="text-center">&copy; PorGet</h5>
					</div>
				</div>
			</footer>




			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
				integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
				crossorigin="anonymous">
				
			</script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
				integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
				crossorigin="anonymous">
				
			</script>
</body>

</html>