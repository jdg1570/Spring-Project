<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContentShow.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<script>
</script>
<style>
	.container {
		width: 750px;
	}
	#content {
		overflow: hidden;
	}
</style>
</head>
<body>
<div class="container"><br/><br/><br/>
	<h4>게시글 내용</h4><hr/>
	<table>
		<tr>
			<td id="content">${vo.content}</td>
		</tr>
	</table><hr/>
	<input style="width: 100%" type="button" value="뒤로" class="btn btn-info" onclick="history.back()">
</div>
</body>
</html>