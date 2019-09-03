<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
	<script src="/porget/js/jquery-3.js"></script>
	<script src="/porget/js/ajax.js"></script>
	
	<script>
	$(function(){
		$('#companyName').keyup(function(){
			$.ajax({
				url:"checkCname", 
				data:{
					companyName:$(this).val()
				},
				success:function(data){
					$('#companyNameMsg').html(data);
				}
			});	
		});
		
		$('#companyEmail').keyup(function(){
			$.ajax({
				url:"checkCemail",
				data:{
					companyEmail:$(this).val()
				},
				success:function(data){
					$('#companyEmailMsg').html(data);
				}
			});
		});
	
	$('#btnJoin').click(function(){
		
		if($('#companyName').val() == ""){
			alert("회사명을 입력해주세요!");
			$('#companyName').focus();
			return false;
		}else if(!/^[a-zA-Z0-9]{2,20}$/.test($('#companyName').val())){
			alert("회사명은  한글, 영문 20글자 이내로 입력해주세요! (공백,특수문자X)");
			return false;
		}
		
		if($('#companyEmail').val() == ""){
			alert("이메일을 입력해주세요!");
			$('#companyEmail').focus();
			return false;
		}
		
		if($('#companyPass').val() == ""){
			alert("비밀번호를 입력해주세요!");
			$('#companyPass').focus();
			return false;
		}else if(!/^[a-zA-Z0-9]{6,10}$/.test($('#companyPass').val())){
			alert("비밀번호는 영문, 숫자 6~10글자로 입력해주세요 ")
			$('#companyPass').val("");
			$('#companyPass').focus();
			return false;
		}else if($('#companyPass').val() != $('#companyPassCheck').val()){
			alert("비밀번호가 일치하지 않습니다!");
			$('#companyPass').val("");
			$('#companyPassCheck').val("");
			$('#companyPass').focus();
			return false;
		}
	});
	
	
	});
	</script>

</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>
					Recruiter Join
				</h3>
				<hr>
				<form role="form" method="post">
					<div class="form-group">

						<label for="cName">
				회사명
						</label>
						<input type="text" class="form-control" id="companyName" name="cname">
						<div id="companyNameMsg"></div>
					</div>
					
					<div class="form-group">
					<div class="check_font" id="email_check"></div>

						<label for="cEmail">
				이메일
						</label>
						<input type="email" class="form-control" id="companyEmail" name="cemail">
						<div id="companyEmailMsg"></div>
					</div>	
									
					
					<div class="form-group">

						<label for="cPass">
				비밀번호
						</label>
						<input type="password" class="form-control" id="companyPass" name="cpass">
					</div>
					
					<div class="form-group">

						<label for="cPass">
				비밀번호 확인
						</label>
						<input type="password" class="form-control" id="companyPassCheck" name="cpassCheck">
					</div>
					
					<div class="form-group">

						<label for="cdomain">
				회사사이트
						</label>
						<input type="text" class="form-control" id="companyDomain" name="cdomain">
					</div>
					<div class="form-group">

						<label for="cPhoto">
				프로필사진
						</label>


						<input type="file" class="form-control-file" id="companyPhoto" name="cphoto">


					</div>

					<button type="submit" class="btn btn-primary" id="btnJoin">
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