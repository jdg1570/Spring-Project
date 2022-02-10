<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FinishBook.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	#goHome {
		width: 100%; 
		height: 40px; 
		border: none; 
		font-size: 17px;
	}
	.gallery {
	  float: left;
	  margin-right: 5px;
	}
	.gallery img {
	  width: 100%;
	}
</style>
</head>
<body>
<div class="container"><br/><br/>
	<div style="border: 1px solid lightgray; border-radius: 5px; padding-left: 20px;">
		<p style="font-size: 18px; font-weight: bolder; padding-top: 15px;"><i>${sNickName} 님의 완독한 도서</i><p><hr/>
		<div style="width: auto; height: auto;">
			<c:forEach var="vo" items="${fVos}">
				<div class="gallery">${vo.bookContent}</div>
			</c:forEach>	
		</div>
	</div><br/>
	<button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/MybookInfo';"><b>돌아가기</b></button><hr/>
</div>
</body>
</html>