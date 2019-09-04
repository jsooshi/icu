<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>일반회원 상세창</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="/porget/js/jquery-3.js"></script>

</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>일반회원 상세창</h3>
				<hr>
				<form action="/porget/admin/delete?uemail=${porget.uemail }" method="post"
					role="form">
					<div class="form-group">

						<label for="mName"> 닉네임 </label> <input type="text"
							class="form-control" id="userName" value="${porget.uname }">
					</div>
					<div class="form-group">

						<label for="mEmail"> 이메일 </label> <input type="email"
							class="form-control" id="userEmail" value="${porget.uemail }">
					</div>
					<div class="form-group">

						<label for="mPass"> 비밀번호 </label> <input type="password"
							class="form-control" id="userPass" value="${porget.upass }">
					</div>

					<div class="form-group">

						<label for="mFile"> 프로필사진 </label> <input type="file"
							class="form-control-file" id="memberPhoto">


					</div>

					<input class="btn btn-primary" type="submit" value="삭제">
				</form>
			</div>
		</div>
	</div>

</body>

</html>