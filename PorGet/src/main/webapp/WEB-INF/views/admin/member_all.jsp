<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/374c1883d1.js"></script>   <!--fontawesome들어가start클릭, gmail로 메일온걸로 접속하면 링크코드 나옴.-->
        <link rel="stylesheet" href="./css/main.css">       <!--부트스트랩 기초설정완료 / 부트스트랩 사이트에서 복붙-->
    <title>관리자 전체회원 조회창</title>
    <script src="/PorGet/js/jquery-3.js"></script>
    <script>
    $(function(){//document.ready
    	$('button').click(function(){
    		$.ajax({
    			url:'/admin/member_ordinary.jsp',
    			data:{//요청페이지에게 데이터 전달, 파라미터 정의
	 		           radio:$('[name=radio]').val(),
	 		           search:$('[name=search]').val()
	 		     }, 
	 		     success:function(data){//응답데이터 처리
	 		    	 $('div').html(data);
	 		     }
	 	   });//ajax권장요청
    	});//버튼 클릭
    });//document.ready
  </script>
</head>
<body>
    <h1 class="separator">일반 회원정보 관리</h1>
    <div class="container">
        <div class="row justify-content-center"> <!--justify-content-center: 컨텐트들이 가운데 모이게하기-->
            <div class="col-md4 bg-light">
                <form>
                <input type="radio" value="1" name="radio" id="radio1">
                <label for="radio1">일반회원</label>
                <input type="radio" value="2" name="radio" id="radio2">
                <label for="radio2">recruiter회원</label>
                <br>
                <input type="text" placeholder="아이디를 입력하세요." name="search">
                <input class="btn btn-primary" type="button" value="조  회">
                </form>
            </div>
        </div>
    </div>
    <br>

    <div id="d1">여기에 ajax 삽입할거야</div>

   
    
</body>
</html>