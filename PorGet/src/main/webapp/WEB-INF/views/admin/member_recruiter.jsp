<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/374c1883d1.js"></script>   <!--fontawesome들어가start클릭, gmail로 메일온걸로 접속하면 링크코드 나옴.-->
    <link rel="stylesheet" href="./css/main.css">       <!--부트스트랩 기초설정완료 / 부트스트랩 사이트에서 복붙-->
<title>리쿠르터회원창</title>
</head>
<body>

<div class="contatiner">
  <table border="3" class="table text-center table-hover">   <!--table-hover: 마우스올리면 구분되는 효과-->
      <thead>
      	<tr>
          <th>회사이메일</th>
          <th>회사명</th>
          <th>회사도메인</th>
        </tr>
      </thead>
      <tbody>			<!-- 영역저장이름  -->
      <c:forEach items="${listR }" var="porget">      
      <tr>
        <td><a href="/admin/upform2?cemail=${porget.cemail }">${porget.cemail }</a></td>    
         <td>${porget.cname }</td>
         <td>${porget.cdomain }</td>
      </tr>
     </c:forEach>
          
          
      </tbody>
  </table>
</div>

</body>
</html>