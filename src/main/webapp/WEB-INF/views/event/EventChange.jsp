<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventChange.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>
 	th {
 		font-size: 17px;
 	}
</style>
</head>
<body>
<br/><br/>
<div class="container">
	<form name="myform" method="post" enctype="multipart/form-data">
		<table class="table table-borderless">
			<tr class="text-center">
				<td><h3>이벤트 수정</h3></td>
			</tr>
		</table>
	  <table class="table">
	  	<tr>
	  		<th>이벤트 제목</th>
	  		<td><input type="text" name="eventTitle" value="${vo.eventTitle}"  autofocus required class="form-control"></td>
	  	</tr>
	  	<tr>
	  		<th>이미지</th>
	  		<td>
	  			<input type="file" name="fName" required class="form-control-file border" accept=".jpg,jpeg,.gif,.png"><br/>
	  			<img src="${ctp}/data/event/${vo.eventImage}" style="width: 150px;">
	  		</td>
	  	</tr>
	  	<tr>
	  		<th>종료일</th>
	  		<td><input type="date" name="endDate" value="${vo.endDate}" required class="form-control"></td>
	  	</tr>
	  	<tr>
	  		<th>이벤트 소개</th>
	  		<td><textarea rows="10" name="eventContent" id="eventContent" class="form-control" required>${vo.eventContent}</textarea></td>
	  		<script>
	  			CKEDITOR.replace("eventContent",{
	  				uploadUrl: "${ctp}/imageUpload",				
	  				filebrowserUploadUrl : "${ctp}/imageUpload",
	  				height : 400
	  			});
	  		</script>
	  	</tr>
	  	<tr>
	  		<td colspan="2" style="text-align: center;">
	  			<input type="submit" value="이벤트 수정" class="btn btn-info">&nbsp;
	  			<input type="reset" value="다시입력"  class="btn btn-info">&nbsp;
	  			<input type="button" value="돌아가기" onclick="location.href='${ctp}/event/EventList';" class="btn btn-info">&nbsp;
	  		</td>
	  	</tr>
	  </table>
	  <input type="hidden" name="eventImage" value="${vo.eventImage}">
  </form>
</div>
</body>
</html>