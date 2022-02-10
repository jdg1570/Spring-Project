<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyReviewList.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	div h3 {
		text-align: center;
	}
	div h5 {
	}
    #goHome {
		width: 100%; 
		height: 40px; 
		border: none; 
		font-size: 17px;
	}
</style>
</head>
<body>
<div class="container">
<br/>
<h3><b>내가 작성한 댓글</b></h3><br/>
<h5><b>게시판 댓글</b></h5>
<table class="table table-hover">
	<tr class="table-warning text-dark" style="text-align: center;">
		<th>댓글 번호</th>
		<th class="col-6">내용</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="vo" items="${vos}">
		<tr style="text-align: center;">
			<td>${vo.idx}</td>
			<td>${vo.content}</td>
			<td>${fn:substring(vo.WDate,0,16)}</td>
		</tr>
	</c:forEach>
</table><br/><hr/><br/>
<h5><b>이벤트 댓글</b></h5>
<table class="table table-hover">
	<tr class="table-warning text-dark" style="text-align: center;">
		<th>댓글 번호</th>
		<th class="col-6">내용</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="vo" items="${evos}">
		<tr style="text-align: center;">
			<td>${vo.idx}</td>
			<td>${vo.content}</td>
			<td>${fn:substring(vo.WDate,0,16)}</td>
		</tr>
	</c:forEach>
</table><br/><hr/>
<button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/MyPosts';"><b>돌아가기</b></button><hr/>
</div>
</body>
</html>