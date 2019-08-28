<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>포트폴리오 수정</title>
</head>
<body>

    <form action="update?pfnum=${p.pfnum }" method="POST">
        제목: <input type="text" name="pfname" value="${p.pfname }"><br>
        사진: <input type="file" name="pffile" value="${p.pffile }"/><br>
        포트폴리오주소: <input type="text" name="pfurl" value="${p.pfurl }"><br>
        포지션: <input type="text" name="pfposition" value="${p.pfposition }"><br>
        태그: <input type="text" name="tagname" value="${p.tagname }"><br>
        <input type="submit" class="btn btn-primary"/>
    </form>


    
</body>
</html>