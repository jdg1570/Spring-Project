<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardInput.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>
	th {
		width: 15%;
		text-align: center;
	}
</style>
<script>
	function fCheck() {
		var title = myform.title.value;
	  	var part = myform.part.value;
	  	
	  	if(title.trim() == "") {
	  		alert("게시글 제목을 입력하세요");
	  		myform.title.focus();
	  	}
	  	else if(part.trim() == "0") {
	  		alert("게시물 유형을 선택해주세요");
	  	}
	  	else {
	  		myform.submit();
	  	}
	}
</script>
</head>
<body>
<div class="container" >
	<form name="myform" method="post"><br/>
		<h3 style="font-family:arial; font-weight: bold; text-align: center;">게시판 글쓰기</h3><br/>
		<table class="table">
		  	<tr>
		  		<th>작성자</th>
		  		<td>${sNickName}</td>
		  	</tr>
		  	<tr>
		  		<th>게시물 유형</th>
		  		<td>
		  			<c:if test="${sNickName=='관리자'}">
			  			<select name="part" class="form-control">
			  				<option value="공 지">공 지</option>
			  			</select>
		  			</c:if>
					<c:if test="${sNickName!='관리자'}">
			  			<select class="form-control" name="part">
			  				<option value="0">게시물 유형을 선택해주세요</option>
			  				<option value="도서문의">도서문의</option>
			  				<option value="계정문의">계정문의</option>
			  				<option value="서비스문의">서비스문의</option>
			  				<option value="기타문의">기타문의</option>
			  			</select>
					</c:if>		  		
		  		</td>
		  	</tr>
		  	<tr>
		  		<th>글 제목</th>
		  		<td><input type="text" name="title"  placeholder="글제목을 입력하세요." autofocus required class="form-control"></td>
		  	</tr>
		  	<tr>
		  		<th>글 내용</th>
		  		<td><textarea rows="10" name="content" id="content" class="form-control" required></textarea></td>
		  		<script>
		  			CKEDITOR.replace("content",{
		  				uploadUrl: "${ctp}/imageUpload",				
		  				filebrowserUploadUrl : "${ctp}/imageUpload",
		  				height: 250
		  			});
		  		</script>
		  	</tr>
		  	<tr>
		  		<td colspan="2" style="text-align: center;">
		  			<input type="button" value="등록" onclick="fCheck()" class="btn btn-info">&nbsp;
		  			<input type="reset" value="다시입력"  class="btn btn-info">&nbsp;
		  			<input type="button" value="돌아가기" onclick="location.href='${ctp}/board/BoardList';" class="btn btn-info">&nbsp;
		  		</td>
		  	</tr>	
		  </table>
		  <input type="hidden" name="nickName" value="${sNickName}">
		  <%-- <input type="hidden" name="level" value="${sStrLevel}"> --%>
	  </form>
  </div>
</body>
<footer>
</footer>
</html>