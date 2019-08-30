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
          <th>ID(이메일)</th>
          <th>닉네임</th>
          <th>관리자여부</th>
        </tr>
      </thead>
      <tbody>			<!-- 영역저장이름  -->
           <c:forEach items="${list }" var="porget">      
      <tr>
      	
         <td><a href="/admin/upform?uemail=${porget.uemail }">${porget.uemail }</a></td>
         <td>${porget.uname }</td>
         <td>${porget.ucheck }</td>
      </tr>
     </c:forEach>
          
          
      </tbody>
  </table>
</div>