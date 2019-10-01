<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<style>
		.container-fluid {
			margin-top : 20vh;
			height: 60vh;
		}
	</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">
					</div>
					<div class="col-md-2">

					</div>
					<div class="col-md-6">
						<h2>
							Recruiter
						</h2>
						<p>
							채용담당자이신가요?<br>
							porget에서 소중한 인재를 찾으세요
							무료로 가입하세요
						</p>

						<button type="button" class="btn btn-block btn-lg btn-primary" onclick="location.href='/porget/recrujoin'">>
							Join
						</button>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-6">
						<h2>
							Member
						</h2>
						<p>
							구직자이신가요? <br>
							내가 만든 포트폴리오를 자랑하고싶나요? <br>
							무료로 가입하세요

						</p>

						<button type="button" class="btn btn-block btn-lg btn-primary" onclick="location.href='/porget/userjoin'">
							join
						</button>
					</div>
					<div class=" col-md-2">

					</div>
					<div class=" col-md-4">

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>

</html>