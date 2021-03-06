<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PorGet</title>

</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<article>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h3>인기게시판</h3>
				</div>
	
				<c:forEach items="${list }" var="p">
					<div class="col-md-4">
						<div class="card">
							<a href="view?pfnum=${p.pfnum}" class="btn text-left custom-card"> <img
								src="${pageContext.request.contextPath}/resources/img/${p.pfthumb}"
								class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title">${p.pfname }</h5>
									<p class="card-text">
										<img src="http://placehold.it/200" class="rounded-circle"
											style="width: 20%; display: inline;"> ${p.uname }
									</p>
									<p class="text-muted">조회 ${p.pfread } 하트, 댓글수</p>
								</div>	
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
	</article>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>


		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous">
			
		</script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous">
			
		</script>
</body>
</html>