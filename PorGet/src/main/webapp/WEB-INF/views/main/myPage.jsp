<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="img cwontainer-fluid">
		<div class="row">
			<div class="img col-md-12">
				<img alt="Bootstrap Image Preview"
					src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg"
					class="rounded-circle" />
			</div>
			<button class="button btn btn-primary" type="submit">사진변경</button>
		</div>
	</div>
	<div class="mx-auto container" align="left">
		<div class="jumbo-bar jumbotron">
			<span class="badge badge-default">닉네임</span>
			<div class="input-bar input-group mb-3">
				<div class="mx-auto input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><img
						src="/porget/image/id.jpg"></span>
				</div>
				<input type="text" class="form-control" placeholder="Username"
					   aria-label="Username" aria-describedby="basic-addon1">
			</div>
			<span class="badge badge-default">비밀번호</span>
			<div class="input-bar input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><img
						src="image/pass.JPG"></span>
				</div>
				<input type="password" class="form-control" placeholder="Password"
					   aria-label="Password" aria-describedby="basic-addon1">
			</div>
			<span class="badge badge-default">비밀번호 확인</span>
			<div class="input-bar input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><img
					  	  src="image/pass.JPG"></span>
				</div>
				<input type="password" class="form-control"
					   placeholder="New Password" aria-label="Password"
					   aria-describedby="basic-addon1">
			</div><br>
			<input class="btn btn-primary" type="submit" value="수정하기">
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
