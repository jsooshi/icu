<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		
<script> // 임시 //
	$(function() {
		$(".custom-card").click(function() {
			$.ajax({
				url : "portfolioView.html",
				success : function(result) {
					$('#porgetBody').html(result);
				}
			})
		})

		$(".custom-card").click(function() {
			$.ajax({
				url : "portfolioView.html",
				success : function(result) {
					$('#porgetBody').html(result);
				}
			})
		})

		$(".create").click(function() {
			$.ajax({
				url : "portfolioPost.html",
				success : function(result) {
					$('#porgetBody').html(result);
				}
			})
		})
	})
</script>


<!-- banner -->

<div id="bannerimage">
	<div class="text-center">인기 포트폴리오 (임시)</div>
</div>

<button class="create btn btn-primary">글 생성(임시)</button>

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