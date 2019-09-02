<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<hr>
<div class="container">
    <div class="row">
  		<div class="col-sm-10"><h1>${vo.uname }</h1></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        <img src="/porget/img/${vo.uphoto }" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo</h6>
        <input type="file" class="text-center center-block file-upload">
      </div></hr><br>


          <div class="panel panel-default">
            <div class="panel-heading">소셜 미디어</div>
            <div class="panel-body">
            	<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> 
            	<i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> 
            	<i class="fa fa-google-plus fa-2x"></i>
            </div>
          </div>
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
    		
    	
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#profile">프로필</a></li>
                <li><a data-toggle="tab" href="#portfolio">포트폴리오</a></li>
                <li><a data-toggle="tab" href="#bookmark">북마크</a></li>
              </ul>
			
              
          <div class="tab-content">
            <div class="tab-pane active" id="profile">
                <hr>
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="form-group">
                          <div class="col-xs-12">
                            <label for="nickName"><h4>닉네임</h4></label>
                              <input type="text" class="form-control" name="nickName" id="nickName" placeholder="${vo.uname }">
                          </div>

                          <div class="col-xs-12">
                              <label for="password"><h4>비밀번호</h4></label>
                              <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                          </div>
                          
                          <div class="col-xs-12">
                            <label for="password2"><h4>비밀번호 확인</h4></label>
                              <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                          </div>	
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               	<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                            </div>
                      </div>
              	</form>
              
             </div>
             <!-- portfolio -->
             <div class="tab-pane row" id="portfolio">
             	<hr>
              	<div class="card mb-3">
				  <div class="row no-gutters">
				    <div class="col-md-4">
				      <img src="" class="card-img" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">title</h5>
				        <p class="card-text">포지션</p>
				        <p class="card-text"><small class="text-muted">등록일</small></p>
				      </div>
				    </div>
				  </div>
				</div>
             </div>
             <!-- bookmark -->
             <div class="tab-pane" id="bookmark">
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div>
    </div><!--/row-->
 </div>   
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>   
<script>

$(document).ready(function() {

	 $(".nav-tabs a").click(function(){
		    $(this).tab('show');
		  });
	
    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(".file-upload").on('change', function(){
        readURL(this);
    });

    
});
</script>                                                      

</body>
</html>