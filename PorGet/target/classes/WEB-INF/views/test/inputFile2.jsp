<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력폼</title>
<script src="<c:url value="/resources/js/jquery-3.js" />"></script>
<script type="text/javascript">
	$(function(){
		console.log("하이");
		$('#uploadBtn').on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			for(var i=0;i<files.length;i++){
				formData.append("uploadFile",files[i])
			}
			
			$.ajax({
				url:'input',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				success:function(result){
					alert("Uploaded");
				}
			});
		});//#uploadBtn.on click
		
		$("input[name='uploadFile']:eq(0)").on("change",function(){
			console.log("아앗 바꼈어요")
		})
	});
</script>
</head>
<%--inputFile.jsp --%>
<body>
  <h3>입력폼</h3>
  <hr>
       파일: <input type="file" name="uploadFile" multiple><br>
	<button id='uploadBtn'>업로드</button>
  <hr>
<table>
<thead><tr><th>제목</th><th>삭제</th></tr></thead>
<tbody id="dataList">
<tr></tr>
<tr></tr>
<tr></tr>
</tbody>
</table>
</body>
</html>


