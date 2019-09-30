<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>	
<style>
	.container {
		width: 600px;
		height: 60vh;
	}
	
	.modal-title {
		text-align: center;
		margin-bottom: 30px;
	}
	
	.avatar {
		margin-top: 50px;
		text-align: center;
	}
</style>


<div class="container">
		<div class="avatar">
			<img src="/porget/img/logo.png" alt="Avatar" style="width:20%;">
		</div>				
		<h4 class="modal-title">Member Login</h4>	
	<div class="content">
		<form action="/porget/login" method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="uemail" placeholder="Email" required="required">		
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="upass" placeholder="Password" required="required" id="upass">	
			</div>        
			<div class="form-group">
				<button type="submit" name="login" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
			</div>
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		</form>
	</div>
</div>
		
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
