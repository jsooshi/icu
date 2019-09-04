<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Membership Join</title>

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
		//회사명 중복체크
		//$('선택자').action();
		$('#userName').keyup(function(){//id값으로 키값
			//alert('체크'+ $(this).val())
			//String msg='<font color=red>'+ $(this).val() +'는 사용불가능한 닉네임입니다</font>'
			//$('#userNameMsg').html(msg);
			$.ajax({
				url:"checkId", //리퀘스트매핑과 일치: 사용자가 지정
				data:{
					nickName:$(this).val()// nickname의 값을 가져옴 사용자 지정 데이터변수
				},
				success:function(data){
					$('#userNameMsg').html(data); //div안으로 집어넣어줌
				}
			});	
		});
		
		$('#userEmail').keyup(function(){
			$.ajax({
				url:"checkEmail",
				data:{
					Email:$(this).val()
				},
				success:function(data){
					$('#userEmailMsg').html(data);
				}
			});
		});
		
		
		$('#btnJoin').click(function(){			
			if($('#userName').val() == ""){
				alert("닉네임을 입력해주세요!");
				$('#userName').focus();
				return false;
			}else if(!/^[a-zA-Z0-9]{3,10}$/.test($('#userName').val())){
				alert("닉네임은 한글, 영문 3~10글자로 입력해주세요! (공백,특수문자X)");
				return false;
			}
			
			if($('#userEmail').val() == ""){
				alert("이메일을 입력해주세요!");
				$('#userEmail').focus();
				return false;
			}
			
			if($('#userPass').val() == ""){
				alert("비밀번호를 입력해주세요!")
				$("#userPass").focus();
				return false;
			}else if(!/^[a-zA-Z0-9]{6,10}$/.test($('#userPass').val())){
				alert("비밀번호는 영문, 숫자 6~10글자로 입력해주세요! (공백,특수문자X)")
				$('#userPass').val("");
				$('#userPass').focus();
				return false;
			}else if($('#userPass').val() != $('#userPassCheck').val()){
				alert("비밀번호가 일치하지 않습니다!");
				$('#userPass').val("");
				$('#userPassCheck').val("");
				$('#userPass').focus();
				return false;
			}
			
			if($('#userName').val() == $('#userPass').val() ){
				alert("같은 아이디와 비밀번호는 사용불가능합니다.");
				$('#userPass').val("");
				$('#userPass').focus();
				return false;
			}else if(!unamePattern($('#userName').val())){
				alert("확인");
				return false;
			}
		});
    
	});//document
	
	</script>
</head>

<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h3>
                    Membership Join
                </h3>
                <hr>
                <form role="form" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="mName">
                            닉네임
                        </label>
                        <input type="text" class="form-control" id="userName" name="uname">
                        <div id="userNameMsg"></div>    
                    
            		<div class="check_font" id="id_check"></div>

                        <label for="mEmail">
                            이메일
                        </label>
                        <input type="email" class="form-control" id="userEmail" name="uemail">
                    	<div id="userEmailMsg"></div>
                    </div>
                    
                    
                    <div class="form-group">

                        <label for="mPass">
                            비밀번호
                        </label>
                        <input type="password" class="form-control" id="userPass" name="upass">
                    </div>
                    
                    <div class="form-group">

                        <label for="mPass">
                            비밀번호 확인
                        </label>
                        <input type="password" class="form-control" id="userPassCheck" name="upassCheck">
                    </div>



                        <label for="file">
                            프로필사진
                        </label>

                        <input type="file" class="form-control-file" id="file" name="file">
                    <button id="uploadBtn" class="btn btn-primary">
                        가입
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
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