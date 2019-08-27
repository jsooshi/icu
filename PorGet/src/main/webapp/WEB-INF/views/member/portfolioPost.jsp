<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    <form action="" method="POST">
        제목: <input type="text" name="pfname"><br>
        사진: <input multiple="multiple"  type="file" name="filename[]" /><br>
        포트폴리오주소: <input type="text" name="pfurl"><br>
        포지션: <input type="text" name="pfposition"><br>
        <input type="submit" class="btn btn-primary"/>
    </form>


    
</body>
</html>