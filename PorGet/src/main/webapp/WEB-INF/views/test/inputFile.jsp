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
	var fileCount =0;
	var fileList = new FormData();
	$(function(){
		console.log("하이");
		$('#uploadBtn').on("click", function(e){
			var formData = new FormData();
			/* var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files); */
			for(var i=0;i<fileCount;i++){
				formData.append("uploadFile",fileList.get($("#dataList tr").eq(i).children("td:eq(0)").html()));
			}
			
			$.ajax({
				url:'input',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				success:function(result){
					alert("Uploaded");
					$('#dataList').html("");
				}
			});
		});//#uploadBtn.on click
		
		$('#dataList').on('click','button',function(){
			console.log("삭제하라우");
			$(this).closest('tr').remove();
			fileCount -= 1;
		});
		
		$("input[name='uploadFile']:eq(0)").on("change",function(){
			console.log("아앗 바꼈어요");
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			var fileIn =0;
			if(fileCount>2){
				console.log("파일이 이미 3개있습니다");
				$(this).val("");return;}
			console.log("f+f : "+(files.length+fileCount));
			fileIn = ((parseFloat(files.length)+parseFloat(fileCount))>3) ? (3-parseFloat(fileCount)) : files.length  ;
			fileCount += fileIn;
			console.log("filecount : "+ fileCount);
			for(var i=0;i<fileIn;i++){
				fileList.append(files[i].name,files[i]);
				//$("input[name='uploadFile']:eq(0)").val().split("\\")
				$('#dataList').html($('#dataList').html()+"<tr><td>"+files[i].name+"</td>"+
					"<td><button>삭제</button></td></tr>");
			}
				console.log("3 : "+$('#dataList tr:eq(0) td:eq(0)').html());
			$(this).val("")
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
</tbody>
</table>
</body>
</html>