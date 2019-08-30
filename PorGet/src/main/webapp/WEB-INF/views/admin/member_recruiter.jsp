<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<hr>
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