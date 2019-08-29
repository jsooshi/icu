<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet"> <!-- google font -->
  <style>
    .btn{  
      text-decoration: none;
      font-size:2rem;
      color:white;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
      font-family: 'Lobster', cursive; <!-- google font -->
    }
    .btn:active{
      transform: translateY(3px);
    }
    .btn.tag{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
    }
    .btn.tag:active{
      border-bottom:2px solid #165195;
    }
  </style>
<c:forEach items="${list }" var="keyword">
<div>
	<a href="javascript:select('${keyword.TAGNAME }')" class="btn tag">#${keyword.TAGNAME }</a>
	<%-- <a href="javascript:select('jquery')">${keyword.TAGNAME }</a> --%>
</div>
</c:forEach>
