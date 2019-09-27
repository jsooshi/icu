<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Membership Join</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">


<
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<script src="/porget/js/jquery-3.js"></script>
<script src="/porget/js/ajax.js"></script>
<style type="text/css">
body {
	color: #999;
	background: #f3f3f3;
	font-family: 'Roboto', sans-serif;
}

.form-control {
	border-color: #eee;
	min-height: 41px;
	box-shadow: none !important;
}

.form-control:focus {
	border-color: #5cd3b4;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #5cd3b4;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form label {
	font-weight: normal;
	font-size: 13px;
}

.signup-form input[type="checkbox"] {
	margin-top: 2px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #5cd3b4;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
	background: #41cba9;
	outline: none !important;
}

.signup-form a {
	color: #5cd3b4;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #5cd3b4;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}
</style>


<script>
	$(function() {
		//회사명 중복체크
		//$('선택자').action();
		$('#userName').keyup(function() {//id값으로 키값
			//alert('체크'+ $(this).val())
			//String msg='<font color=red>'+ $(this).val() +'는 사용불가능한 닉네임입니다</font>'
			//$('#userNameMsg').html(msg);
			$.ajax({
				url : "checkId", //리퀘스트매핑과 일치: 사용자가 지정
				data : {
					nickName : $(this).val()
				// nickname의 값을 가져옴 사용자 지정 데이터변수
				},
				success : function(data) {
					$('#userNameMsg').html(data); //div안으로 집어넣어줌
				}
			});
		});

		$('#userEmail').keyup(function() {
			$.ajax({
				url : "checkEmail",
				data : {
					Email : $(this).val()
				},
				success : function(data) {
					$('#userEmailMsg').html(data);
				}
			});
		});

		$('#btnJoin').click(function() {
			if ($('#userName').val() == "") {
				alert("닉네임을 입력해주세요!");
				$('#userName').focus();
				return false;
			} else if (!/^[a-zA-Z0-9ㄱ-힣]{3,10}$/.test($('#userName').val())) {
				alert("닉네임은 한글, 영문 3~10글자로 입력해주세요! (공백,특수문자X)");
				$('#userName').val("");
				$('#userName').focus();
				return false;
			}

			if ($('#userEmail').val() == "") {
				alert("이메일을 입력해주세요!");
				$('#userEmail').focus();
				return false;
			}

			if ($('#userPass').val() == "") {
				alert("비밀번호를 입력해주세요!")
				$("#userPass").focus();
				return false;
			} else if (!/^[a-zA-Z0-9]{6,10}$/.test($('#userPass').val())) {
				alert("비밀번호는 영문, 숫자 6~10글자로 입력해주세요! (공백,특수문자X)")
				$('#userPass').val("");
				$('#userPass').focus();
				return false;
			} else if ($('#userPass').val() != $('#userPassCheck').val()) {
				alert("비밀번호가 일치하지 않습니다!");
				$('#userPass').val("");
				$('#userPassCheck').val("");
				$('#userPass').focus();
				return false;
			}

			if ($('#userName').val() == $('#userPass').val()) {
				alert("같은 아이디와 비밀번호는 사용불가능합니다.");
				$('#userPass').val("");
				$('#userPass').focus();
				return false;
			} 
			document.getElementById("userJoinForm").submit();
		});

	});//document
</script>
</head>

<body>

	<div class="signup-form">
		<form id="userJoinForm" role="form" method="post"
			enctype="multipart/form-data">
			<div class="col-xs-8 col-xs-offset-4">
				<h2>Sign Up</h2>
			</div>
			<div class="form-group">
				<label for="mName" class="control-label col-xs-4">Username</label>
				<div class="col-xs-8">
					<input type="text" 	class="form-control" id="userName" name="uname">
				</div>
					<div id="userNameMsg"></div>
						<div class="check_font" id="id_check"></div>
				
			</div>
			<div class="form-group">
				<label for="mEmail" class="control-label col-xs-4">Email Address</label>
				<div class="col-xs-8">
					<input type="email" class="form-control" id="userEmail"
						name="uemail"><div id="userEmailMsg"></div>
				</div>
			</div>
			<div class="form-group">
				<label  for="mPass" class="control-label col-xs-4">Password</label>
				<div class="col-xs-8">
					<input type="password" class="form-control" id="userPass"
						name="upass">
				</div>
			</div>
			<div class="form-group">
				<label  for="mPass" class="control-label col-xs-4">Confirm Password</label>
				<div class="col-xs-8">
					<input type="password" class="form-control" id="userPassCheck"
						name="upassCheck">
				</div>
			</div>

			<div class="form-group">
				<div class="col-xs-8 col-xs-offset-4">
					<p>
						<label class="checkbox-inline"><input type="checkbox"
							required="required"> I accept the <a href="#">Terms
								of Use</a> &amp; <a href="#">Privacy Policy</a>.</label>
					</p>
					<button type="button" id="btnJoin" class="btn btn-primary btn-lg">Sign
						Up</button>
				</div>
			</div>

		</form>
		<div class="text-center">
			Already have an account? <a href="/porget">Login here</a>
		</div>
	</div>


<!-- 
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>Membership Join</h3>
				<hr>
				<form id="userJoinForm" role="form" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="mName"> 닉네임 </label> <input type="text"
							class="form-control" id="userName" name="uname">
						<div id="userNameMsg"></div>
						<div class="check_font" id="id_check"></div>

						<label for="mEmail"> 이메일 </label> <input type="email"
							class="form-control" id="userEmail" name="uemail">
						<div id="userEmailMsg"></div>
					</div>


					<div class="form-group">

						<label for="mPass"> 비밀번호 </label> <input type="password"
							class="form-control" id="userPass" name="upass">
					</div>

					<div class="form-group">

						<label for="mPass"> 비밀번호 확인 </label> <input type="password"
							class="form-control" id="userPassCheck" name="upassCheck">
					</div>



					<label for="file"> 프로필사진 </label> <input type="file"
						class="form-control-file" id="file" name="file"
						accept=".jpg,.jpeg,.gif,.bmp,.png">
					<button type="button" id="btnJoin" class="btn btn-primary">
						가입</button>
				</form>
			</div>
		</div>
	</div>
 -->

	<!--      	<script>
		$(function() {
			var formData = new FormData();
			formData.append("uname",$("input[name=uname]").val());
			formData.append("uemail",$("input[name=uemail]").val());
			formData.append("upass",$("input[name=upass]").val());
			
			$("#uploadBtn").on("click", function(event) {
				var inputFile = $("input[name='file']").val();
				console.log(inputFile);

				formData.append("file", inputFile);
			})

			$.ajax({
				url : "/porget/userjoin",
				type: "post",
				processData : false,
				contentType : false,
				data : formData,
				type : 'post',
				success : function(result) {
					console.log(result);
					alert("Uploaded");
				}
			})// ajax
		})
	</script> -->
</body>

</html>