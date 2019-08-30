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