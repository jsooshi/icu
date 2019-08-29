<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<c:forEach items="${list }" var="popular">
		<div style="background-color: yellow; border: 1px solid green; height: 150px">
		${popular.UNAME },
		${popular.PFNAME },
		${popular.REPLYNUM },
		${popular.PFTHUMB },
		${popular.PFREAD },
		${popular.UPHOTO },
		${popular.JOA }
		</div>
		</c:forEach> 
		<!-- 값 들어오는거 확인했습니다. 나중에 부트스트랩으로 카드형식 만들면 됩니당 -->
