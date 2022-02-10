<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductInput.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>
 	th {
 		font-size: 17px;
 	}
</style>
<script>
	function fCheck() {
		var bookType = myform.bookType.value;
		
		if(bookType=="1") {
			alert("분류 항목을 선택해주세요.");
			return false;
		}
		else {
			myform.submit();
		}
	}
</script>
</head>
<body>
<br/><br/>
<div class="container">
	<form name="myform" method="post" enctype="multipart/form-data">
		<table class="table table-borderless">
			<tr class="text-center">
				<td><h3>상품 등록</h3></td>
			</tr>
		</table>
	  <table class="table">
	  	<tr>
	  		<th>상품 이름</th>
	  		<td><input type="text" name="bookName"  autofocus required class="form-control"></td>
	  	</tr>
	  	<tr>
	  		<th>저 자</th>
	  		<td><input type="text" name="bookAuthor" required class="form-control"></td>
	  	</tr>
	  	<tr>
	  		<th>출판사</th>
	  		<td><input type="text" name="publisher" required class="form-control"></td>
	  	</tr>
	  	<tr>
	  		<th>출판일</th>
	  		<td><input type="date" name="publiDate" required class="form-control"></td>
	  	</tr>
	  	<tr>
	  		<th>분 류</th>
	  		<td>
	  			<select class="select" name="bookType" required class="form-control"> 
                  <option value="1" >선택</option>
                  <option value="자기계발">자기계발</option>
                  <option value="IT">IT</option>
                  <option value="인문/사회">인문/사회</option>
                  <option value="자연/과학">자연/과학</option>
                  <option value="요리">요리</option>
                  <option value="에세이">에세이</option>
                  <option value="경제">경제</option>
                  <option value="예술">예술</option>
                  <option value="기타">기타</option>
                </select>
	  		</td>
	  	</tr>
	  	<tr>
	  		<th>상품 이미지</th>
	  		<td><textarea rows="10" name="bookContent" id="bookContent" class="form-control" required></textarea></td>
	  		<script>
	  			CKEDITOR.replace("bookContent",{
	  				uploadUrl: "${ctp}/imageUpload",				
	  				filebrowserUploadUrl : "${ctp}/imageUpload",
	  				
	  				height: 200
	  			});
	  		</script>
	  	</tr>
	  	<tr>
	  		<th>상품 소개</th>
	  		<td><textarea rows="10" name="bookContent2" id="bookContent2" class="form-control" required></textarea></td>
	  		<script>
	  			CKEDITOR.replace("bookContent2",{
	  				uploadUrl: "${ctp}/imageUpload",				
	  				filebrowserUploadUrl : "${ctp}/imageUpload",
	  				height: 200
	  			});
	  		</script>
	  	</tr>
	  	<tr>	
	  		<th>상품 텍스트</th>
	  		<td><input type="file" name="file" id="file" class="form-control-file border" required accept=".txt"></td>
	  	</tr>
	  	<tr>
	  		<td colspan="2" style="text-align: center;">
	  			<input type="button" value="상품등록" onclick="fCheck()" class="btn btn-info">&nbsp;
	  			<input type="reset" value="다시입력"  class="btn btn-info">&nbsp;
	  			<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/Adminpage';" class="btn btn-info">&nbsp;
	  		</td>
	  	</tr>
	  </table>
  </form>
</div>
</body>
</html>