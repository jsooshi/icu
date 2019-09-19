<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${list }" var="porget">
				<tr>
					<th><a href="/porget/admin/upform?uemail=${porget.uemail }">${porget.uemail }</a></th>
					<th>${porget.uname }</th>
					<th>${porget.ucheck }</th>
				</tr>
</c:forEach>
	