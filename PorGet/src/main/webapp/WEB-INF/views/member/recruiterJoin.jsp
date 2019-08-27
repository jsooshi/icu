<%@ page language="java" contentType="text/html4; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Recruiter Join</title>

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>
					Recruiter Join
				</h3>
				<hr>
				<form role="form">
					<div class="form-group">

						<label for="cName">
							회사명
						</label>
						<input type="text" class="form-control" id="companyName">
					</div>
					<div class="form-group">

						<label for="cEmail">
							이메일
						</label>
						<input type="email" class="form-control" id="companyEmail">
					</div>
					<div class="form-group">

						<label for="cPass">
							비밀번호
						</label>
						<input type="password" class="form-control" id="companyPass">
					</div>
					<div class="form-group">

						<label for="cdomain">
							회사사이트
						</label>
						<input type="text" class="form-control" id="companyDomain">
					</div>
					<div class="form-group">

						<label for="cPhoto">
							프로필사진
						</label>


						<input type="file" class="form-control-file" id="companyPhoto">


					</div>

					<button type="submit" class="btn btn-primary">
						Submit
					</button>
				</form>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>

</html>