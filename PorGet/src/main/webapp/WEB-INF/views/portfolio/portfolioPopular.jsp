<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<title>인기 게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h3>인기게시판. 뷰를 수정할지.. 기능을 좀더 고민해야 할듯함</h3>
			</div>

			<c:forEach items="${list }" var="p">
				<div class="col-md-4">
					<div class="card">
						<a href="portfolio/view?pfnum=${p.pfnum}" class="btn text-left custom-card"> <img
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