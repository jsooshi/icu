<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="WEB-INF/js/jquery-3.js"></script>
</head>
<body>
	<h3>회원가입</h3>
	<form method="post">
	닉네임:    <input type="text" name="uname"><br>
	비밀번호:   <input type="password" name="upass"><br>
	이메일:    <input type="text" name="uemail"><br>
	<input type="submit" value="입력">
    <input type="reset" value="취소">
    </form>
</body>
</html>