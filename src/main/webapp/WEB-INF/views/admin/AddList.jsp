<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddList.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	.container {
		text-align: center;
		margin: 0 auto;
	}
</style>
</head>
<body>
<div class="container"><br/>
		<input type="button" value="←" onclick="history.back()" class="btn btn-dark" style="margin-bottom: 20px; float: left;">
		<table class="table table-hover">
			<tr style="color: black; background-color: honeyDew;">
				<th style="width: 10%;">번호</th>
				<th>닉네임</th>
				<th>담은 날짜</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
			<tr>
				<td><i>${vo.idx}</i></td>
				<td><i>${vo.nickName}</i></td>
				<td><i>${fn:substring(vo.bookDate,0,16)}</i></td>
			</tr>
			</c:forEach>
		</table>

</div>
</body>
</html>