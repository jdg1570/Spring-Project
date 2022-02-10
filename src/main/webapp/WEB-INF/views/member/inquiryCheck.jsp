<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiryCheck.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	.topnav {
	  overflow: hidden;
	  border-radius: 5px;
	  border-bottom: 2px solid black;
	}
	
	.topnav a {
	  float: left;
	  display: block;
	  color: black;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 17px;
	}
	
	.topnav a:hover {
	  background-color: #ddd;
	  color: black;
	}
	#sub {
		width: 100%; 
		height: 35px; 
		border: none; 
		font-size: 17px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	 #goHome {
		width: 100%; 
		height: 35px; 
		border: none; 
		font-size: 17px;
	}
	
</style>
<script>
	// 문의글 삭제
	function DelCheck(idx) {
		var ans = confirm("선택하신 문의을 삭제하시겠습니까?");
		if(!ans) return false;
		
		$.ajax({
				type : "post",
				url : "${ctp}/member/InquiryDelete",
				data : {idx : idx},
				success:function(data) {
					location.reload();
				},
				error:function() {
					alert("삭제 실패");
				}
		});
	} 
</script>
</head>
<body>
<div class="container">
	<p style="font-weight: bolder; font-size: 18px; text-align: center;">1:1 문의</p><br/>
	<div style="height: auto; text-align: center; border-radius: 5px;">
		<div class="topnav">
		  <a href="${ctp}/member/inquiry" style="width: 50%; ">1:1문의</a>
		  <!-- <a href="#about" style="font-weight: bold;">책장</a> -->
		  <a href="${ctp}/member/inquiryCheck" style="width: 50%;">내 문의 내역</a>
	    </div>
	</div><br/><hr/>
	<table class="table table-striped" style="width: 100%;">
		<tr class="table-warning text-dark" style="text-align: center; font-weight: bold; font-size: 17px;">
			<th style="width: 60%;">내용</th>
			<th>문의 날짜</th>
			<th>문의 유형</th>
			<th>답변</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="vo" items="${vos}">
			<tr style="text-align: center;">
				<td style="text-align: left; padding-left: 15%;"><a href="${ctp}/member/inquiryUpdate?idx=${vo.idx}">${vo.content}</a></td>
				<td>${fn:substring(vo.WDate,0,16)}</td>
				<td>${vo.part}</td>
				<td>
					<c:if test="${vo.reply == 'NO' }">
						<button type="button" class="btn btn-warning btn-sm">${vo.reply}</button>
					</c:if>
					<c:if test="${vo.reply != 'NO' }">
						<button type="button" class="btn btn-warning btn-sm" >${vo.reply}</button>
					</c:if>
				</td>
				<td><a href="javascript:DelCheck(${vo.idx});"><input type="button" class="btn btn-warning btn-sm" value="삭제"></a></td>
			</tr>
			<c:forEach var="rvo" items="${rvos}">
				<c:if test="${rvo.inquiryIdx == vo.idx}">
					<tr>
						<td colspan="5" style="padding-left: 18%;">
								<div style="font-size: 13px; color: gray;"><i>${rvo.content}</i></div>
								<span style="font-size: 11px; color: gray;">${fn:substring(rvo.WDate,0,16)}</span>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
	<button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/CSservice';"><b>돌아가기</b></button><br/><br/>
</div>
</body>
<script>
</script>
</html>