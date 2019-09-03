<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
	<script src="/porget/js/jquery-3.js"></script>
	<script src="/porget/js/ajax.js"></script>
	<script>
		var str = '${msg}';
		if(str!=''){
			alert(str);
			location.replace('recruiterLogin'); 
		}
	</script>
</head>
<body>
	<br>
	<br>
	<form method="post">
		<div class="container-fluid">
			<div class="col-md-12">
				<h3 class="text-center">Recruiter 로그인</h3>
				<h6>이메일</h6>
				<input type="text" placeholder="이메일을 입력해주세요." name="cemail"
					id="cemail"> <br> <br>
				<h6>비밀번호</h6>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="cpass"
					id="cpass"> <br> <br> <br>
				<button type="submit" name="recruiterLogin" class="btn btn-primary btn-sm btn-block">로그인</button>
			</div>
		</div>
	</form>
				<br> <br> <input type="submit" value="비밀번호 찾기"> <br>
				<br> <input type="submit" value="회원가입" onclick="location.href='join'">
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