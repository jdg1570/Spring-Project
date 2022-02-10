<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InquiryInput.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>
	.goHome {
		width: 100%; 
		height: 40px; 
		border: none; 
		font-size: 17px;
		margin-bottom: 10px;
	}
</style>
<script>
	/* function replyCheck() {
		var content = myform.content.value;
		if(content.trim() == "") {
			alert("댓글을 입력하세요.");
			myform.content.focus();
			return false;
		}
		else {
			myform.submit();
		}
	} */
</script>
</head>
<body>
<div class="container">
<br/><p></p><br/>
<table class="table">
	<tr>
		<th>내용</th>
		<th>문의 날짜</th>
		<th>문의 유형</th>
	</tr>
	<tr>
		<td style="width: 65%">${vo.content}</td>
		<td>${fn:substring(vo.WDate,0,16)}</td>
		<td>${vo.part}</td>
	</tr>
</table><br/><hr/>
<form name="myform" method="post">
	<h4 style="text-align: center;">답변 작성</h4><hr/>
		<table>
			<tr>
				<td>
					<textarea rows="10" name="content" class="form-control" required></textarea>
					<script>
						CKEDITOR.replace("content",{
							uploadUrl: "${ctp}/imageUpload",				
							filebrowserUploadUrl : "${ctp}/imageUpload",
							height: 200,
							width: 1100
						});
					</script>
				</td>
			</tr>
		</table><hr/>
		<input type="hidden" name="nickName" value="${vo.nickName}">
		<input type="hidden" name="inquiryIdx" value="${vo.idx}">
		<input type="submit" value="답글 등록" class="btn btn-info goHome" ><br/>
		<input style="width: 100%" type="button" value="뒤로" class="btn btn-info" onclick="history.back()">
</form>
</div>
</body>
</html>