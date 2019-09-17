<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	</head>
	<link rel="stylesheet" href="/porget/css/admin.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<body>
	<!--  jquery  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- ajax script file -->
	<script src="/porget/js/ajax.js"></script>
	<script>
	$(document).ready(function () {
		
	    $('#sidebarCollapse').on('click', function () {
	        $('#sidebar').toggleClass('active');
	    });
	    
	    $('.memberPage').on('click',function(e){
	    	e.preventDefault();
	    	$.ajax({
	    		url:"admin/member",
	    		success:function(result){
	    			$('#adminBanner').html(result);
	    		}
	    	});
	    })
	    
	});
	
	</script>
<div class="wrapper">

    <!-- Sidebar -->
    <nav id="sidebar">
	    <!-- Page Content -->
	    <div id="content">
	    
	    <div class="wrapper">
	    <!-- Sidebar -->
	    <nav id="sidebar">
	        <div class="sidebar-header">
	            <h3>관리자 페이지</h3>
	        </div>
	
	        <ul class="list-unstyled components">
	            <p>관리자님 안녕하세요</p>
	            <li class="active">
	                <a href="#">DashBoard</a>
	            </li>
	            <li>
	                <a href="#" class="memberPage">회원 관리</a>
	            </li>
	            <li>
	                <a href="#" class="bannerPage">배너 관리</a>
	            </li>
	            <li>
	                <a href="#" class="">신고글 관리</a>
	            </li>
	            <li>
	                <a href="/porget">Home</a>
	            </li>   
	        </ul>
	    </nav>

		</div>
	    </div>
    </nav>
    
    <!-- Sidebar toggle -->
    <div id="content">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-info">
                <i class="fas fa-align-left"></i>
                <span></span>
            </button>

        </div>
    </nav>
	</div>	
	<!-- ajax 배너 -->
	<div id="adminBanner"></div>
</div> 








	<!-- Bootstrap javascript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	


</body>
</html>