<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>	
<style>
	.container {
		width: 50%;
	}

</style>

<div class="container">
		<div class="avatar">
			<img src="/porget/img/defaultMan.png">
		</div>				
		<h4 class="modal-title">Member Login</h4>	
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
		<a href="#">Forgot Password?</a>
</div>
		
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
