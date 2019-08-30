<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>리쿠르터회원 상세창</title>

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="/js/jquery-3.js"></script>

</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>
					 리쿠르팅회원 상세창
				</h3>
				<hr>
				<form action="/admin/deleteR?cemail=${porgetR.cemail }" method="post" role="form">
					<div class="form-group">

						<label for="cName">
							회사명
						</label>
						<input type="text" class="form-control" id="companyName" value="${porgetR.cname }">
					</div>
					<div class="form-group">

						<label for="cEmail">
							이메일
						</label>
						<input type="email" class="form-control" id="companyEmail" value="${porgetR.cemail }">
					</div>
					<div class="form-group">

						<label for="cPass">
							비밀번호
						</label>
						<input type="password" class="form-control" id="companyPass" value="${porgetR.cname }">
					</div>
					<div class="form-group">

						<label for="cdomain">
							회사사이트
						</label>
						<input type="text" class="form-control" id="companyDomain" value="${porgetR.cdomain }">
					</div>
					<div class="form-group">

						<label for="cPhoto">
							프로필사진
						</label>


						<input type="file" class="form-control-file" id="companyPhoto">


					</div>

					<input class="btn btn-primary" type="submit" value="삭제">
				</form>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>

</html>