<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewType</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<style>
	#back { 
		width: 100%;
	}
</style>
</head>
<body>
<div class="container">
<br/><br/>
	<b><h4 style="text-align: center;">댓글 관리</h4></b>
	<table class="table table-hover">
		<tr>
			<td><a href="${ctp}/admin/BookReply">도서 한줄리뷰</a></td>
		</tr>
		<tr>
			<td><a href="${ctp}/admin/EventReply">이벤트 댓글</a></td>
		</tr>
		<tr>
			<td><a href="${ctp}/admin/BoardReply">게시판 댓글</a></td>
		</tr>
	</table><br/>
	<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/Adminpage';" class="btn btn-info" id="back"/>
</div>
</body>
</html>