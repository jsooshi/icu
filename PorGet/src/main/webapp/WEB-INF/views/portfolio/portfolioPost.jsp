<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>포트폴리오 등록</title>
    
    
</head>
<body>

    <form action="post" method="POST" enctype="multipart/form-data">
        제목: <input type="text" name="pfname"><br>
	썸네일: <input type="file" name="uploadFile" multiple><br> 
	<table>
	<thead><tr><th>제목</th><th>삭제</th></tr></thead>
	<tbody id="dataList">
	</tbody>
	</table><br>
        사진: <input type="file" name="pffile" /><br>
        포트폴리오주소: <input type="text" name="pfurl"><br>
        포지션: <input type="text" name="pfposition"><br>
        태그: <input type="text" name="tagname"><br>
        <input type="submit" class="btn btn-primary"/>
    </form>


    
</body>
</html>