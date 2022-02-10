<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MybookInfo.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	div h3 {
		text-align: center;
	}
	
	#goHome {
		width: 100%; 
		height: 40px; 
		border: none; 
		font-size: 17px;
	}
</style>
<script>
</script>
</head>
<body>
<div class="container">
<br/><p></p>
	<h3><b>내 서재 현황</b></h3><br/>
	<div style="border: 1px solid lightgray; border-radius: 5px; padding-left: 20px;">
		<p style="font-size: 18px; font-weight: bolder; padding-top: 15px;"><i>${sNickName} 님의 서재</i><p><hr/>
		<p style="float: right; margin-right: 20px;"><b>${mCnt}</b> 권</p>
		<p style="color: gray; font-weight: bolder;">서재에 기록된 도서</p>
		<p style="float: right; margin-right: 20px;"><b>${vo.point}</b> 포인트</p>
		<p style="color: gray; font-weight: bolder;">적립된 밀 포인트</p>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/FinishBook">${fCnt}</a></b> 권</p>
		<p style="color: gray; font-weight: bolder;">완독한 도서</p>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/NotYetBook">${rCnt}</a></b> 권</p>
		<p style="color: gray; font-weight: bolder;">아직 읽지않은 도서</p>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/NotReadBook">${iCnt}</a></b> 권</p>
		<p style="color: gray; font-weight: bolder;">읽는 중인 도서</p>
	</div><br/>
	<button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/Mypage';"><b>돌아가기</b></button><hr/>
	
</div>
</body>
</html>