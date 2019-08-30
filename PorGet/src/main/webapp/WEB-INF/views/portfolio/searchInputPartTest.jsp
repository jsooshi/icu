<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${list }" var="keyword">
<div>
	<a href="javascript:select('${keyword }')">${keyword }</a>
	<%-- <a href="javascript:select('jquery')">${keyword.TAGNAME }</a> --%>
</div>
</c:forEach>
