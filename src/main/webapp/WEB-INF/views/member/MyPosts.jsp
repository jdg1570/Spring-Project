<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPosts.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">
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
</head>
<body>
<div class="container">
<br/><p></p>
<h3><b>내 활동</b></h3><br/>
	<div style="border: 1px solid lightgray; border-radius: 5px; padding-left: 20px;">
		<p style="font-size: 18px; font-weight: bolder; padding-top: 15px;"><i>${sNickName} 님의 게시물들</i><p><hr/>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/MyBoardList">${bcnt}</a></b> 개</p>
		<p style="color: gray; font-weight: bolder;">작성한 게시물</p>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/LikeBoardList">${acnt}</a></b> 개</p>
		<p style="color: gray; font-weight: bolder;">내가 좋아하는 게시물</p>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/MyReplyList">${rcnt}</a></b> 개</p>
		<p style="color: gray; font-weight: bolder;">작성한 댓글</p>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/MyReviewList">${ocnt}</a></b> 개</p>
		<p style="color: gray; font-weight: bolder;">작성한 리뷰</p>
		<p style="float: right; margin-right: 20px;"><b><a href="${ctp}/member/LikeReviewList">${ecnt}</a></b> 개</p>
		<p style="color: gray; font-weight: bolder;">내가 좋아하는 리뷰</p>
	</div><br/>
	<button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/Mypage';"><b>돌아가기</b></button><hr/>

</div>
</body>
</html>