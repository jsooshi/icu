<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style type="text/css">
label {font-size: 30px;}
</style>
</head>
<body>
<br><br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<img alt="Bootstrap Image Preview" src="/porget/img/member/${uphoto}" class="rounded-circle" />
		<!-- 이미지 사이즈 조정해야함  -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="uName" style="font-weight: bold">${uname }</label>
		<br>
		<br>
		<br>
		<h4>포트폴리오</h4>
		<br>
		<br>
		<c:forEach items="${list }" var="my">
		<div>
		${my.UNAME },
		${my.PFNAME },
		${my.REPLYNUM },
		${my.PFTHUMB },
		${my.PFREAD },
		${my.UPHOTO },
		${my.JOA }
		</div>
		</c:forEach> 
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>