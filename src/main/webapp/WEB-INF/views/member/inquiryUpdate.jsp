<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiryUpdate.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
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
	function fCheck() {
		var part = myform.part.value;
		if(part ==0) {
			alert("문의 유형을 선택해주세요.")
		}
		else {
			myform.oriContent.value = document.getElementById("oriContent").innerHTML;
			myform.submit();
		}
	}
</script>
</head>
<body>
<div class="container">
<form name="myform" method="post">
	<p style="font-weight: bolder; font-size: 18px; text-align: center;">1:1 문의</p><br/>
	<div style="height: auto; text-align: center; border-radius: 5px;">
		<div class="topnav">
		  <a href="${ctp}/member/inquiry" style="width: 50%; ">1:1문의</a>
		  <!-- <a href="#about" style="font-weight: bold;">책장</a> -->
		  <a href="${ctp}/member/inquiryCheck" style="width: 50%;">문의 내역</a>
	    </div>
	</div><br/><br/>
	<p style="font-weight: bolder; font-size:20px;">문의 유형을 선택</p>
	<select class="form-control" name="part" style="height: 40px;">
		<option value="0">문의 유형을 선택해주세요</option>
		<option ${vo.part=='환불신청' ? 'selected' : ''}>환불신청</option>
		<option ${vo.part=='계정문의' ? 'selected' : ''}>계정문의</option>
		<option ${vo.part=='도서관련문의' ? 'selected' : ''}>도서관련문의</option>
		<option ${vo.part=='기타/제휴문의' ? 'selected' : ''}>기타/제휴문의</option>
	</select><hr/>
	<textarea rows="10" name="content" id="content" class="form-control" required>${vo.content}</textarea>
	<script>
		CKEDITOR.replace("content",{
			uploadUrl: "${ctp}/imageUpload",				
			filebrowserUploadUrl : "${ctp}/imageUpload",
			height: 200
		});
	</script>
	<input type="hidden" name="nickName" value="${sNickName}">
	<input type="hidden" name="idx" value="${vo.idx}">
	<input type="hidden" name="oriContent">
	<div id="oriContent" style="display:none;">${vo.content}</div>
	<input type="button" value="수 정" class="btn btn-warning goHome" id="sub" onclick="fCheck()"><br/>
	<button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/CSservice';"><b>돌아가기</b></button><br/><br/>
</form>
</div>
</body>
</html>