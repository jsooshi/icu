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
        <!--부트스트랩 기초설정완료 / 부트스트랩 사이트에서 복붙-->
    <title>관리자 전체회원 조회창</title>
    <script src="/porget/js/jquery-3.js"></script>
    <script type="text/javascript">
    var i=2;
    $(document).ready(function() {
  		$.ajax({
  			url : "/porget/admin/listAll",
  			data : {
  				base : 1
  			},
  			success : function(data) {
  				$('#d1').append(data);
  			}
  		});
  		});
  		$(document).scroll(function() {

  		    var maxHeight = $(document).height();
  		    var currentScroll = $(window).scrollTop() + $(window).height();
  		    if (maxHeight <= currentScroll+1) {
  				$.ajax({
  					url : "/porget/admin/listAll",
  					data : {
  						base : i++
  					},
  					success : function(data) {
  						$('#d1').append(data);
  					}
  				});
  			}
  		});
    
    $(function(){
    	$('#ordinary').click(function(){
    		var uname = $('[name=uname]').val();
    		$.ajax({
    			url: "/porget/admin/list",
    			data:{
						uname:uname,
					},
    			success: function(data){
		    		$('#d1').html(data);  
    			}
    		});
    	});
    });
   
    
    $(function(){
    	$('#recruiter').click(function(){
    		var cname = $('[name=cname]').val();
    		$.ajax({
    			url: "/porget/admin/listR",
    			data:{
					cname:cname,
				},
    			success: function(data){
    				$('#d1').html(data);    				
    			}
    		});
    	});	
    });
    </script>

</head>
<body>
    <h1 class="separator">통합 회원정보 관리</h1>
    <div class="container">
        <div class="row justify-content-center"> <!--justify-content-center: 컨텐트들이 가운데 모이게하기-->
            <div class="col-md4 bg-light">
            <!-- 
                <input type="radio" value="ordinary" name="radio" id="ordinary" checked="checked">
                <label for="radio1">일반회원</label>
                <input type="radio" value="recruiter" name="radio" id="recruiter">
                <label for="radio2">recruiter회원</label>
             -->
                
             	<input type="text" placeholder="닉네임을 입력하세요." name="uname">
                <input type="button" id="ordinary" value="일반회원">
             	<br>
                <input type="text" placeholder="회사명을 입력하세요." name="cname">
                <input type="button" id="recruiter" value="리쿠르터">
            </div>
        </div>
    </div>
    <br>
    <hr>
		<table border="3" class="table text-center table-hover">
		<thead>
			<tr>
				<th>ID(이메일)</th>
				<th>닉네임</th>
				<th>관리자여부</th>
			</tr>
	 	</thead>
		<tbody id="d1">
   		</tbody>
	</table>
    
</body>
</html>