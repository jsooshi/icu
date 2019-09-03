<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Membership Join</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

</head>

<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<form action="/porget/uploadImage/uploadImageAction" method="post" enctype="multipart/form-data">
		<input type="file" name="uphoto">
		<button id="uploadBtn" class="btn btn-primary">Submit</button>
	</form>


	
	<script>
		$(function() {
			$("#uploadBtn").on("click", function(event) {
				var formData = new FormData();
				var inputFile = $("input[name='uphoto']");
				console.log(inputFile);

				formData.append("uploadImage", inputFile);

			})

			$.ajax({
				url : "/porget/uploadImage/uploadImageAction",
				processData : false,
				contentType : false,
				data : formData,
				type : 'post',
				success : function(result) {
					alert("Uploaded");
				}
			})// ajax

		})
	</script>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>

</html>