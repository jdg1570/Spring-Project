<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String nickName = (String) request.getAttribute("nickName");
  int res = (int) request.getAttribute("res");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
</head>
<style>
	body {
	text-align: center;
	}
</style>
<script>
	function sendCheck() {
		opener.window.document.myform.nickName.value = "<%=nickName%>";
		opener.window.document.myform.nickName.readOnly = true;
		opener.window.document.myform.email.focus();
		window.close();
	}
	
	function nickCheck() {
		var nick = childForm.nickName.value;
		
		if(nick=="") {
			alert("닉네임을 입력하세요!");
			childForm.nickName.focus();
		}
		else {
			childForm.submit();
		}
	}
</script>
<body>
<br/>
<div class="container">
	<h3>닉네임 중복체크</h3>
<%if(res == 1) { %>
	<h4 class="mb-3"><font color="skyblue"><%=nickName%></font>는 사용 가능합니다. </h4>
	<p><input type="button" class="btn btn-success" value="창닫기" onclick="sendCheck()"/></p>
<%} else { %>
	<br/><br/>
	<h4 class="mb-2"><font color="skyblue"><%=nickName%></font>는 이미 사용중입니다.</h4>
	<form class="form-inline" name="childForm" method="post" action="<%=request.getContextPath()%>/idCheck.mil">
		<input type="text" class="form-control mb-3" name="nickName" placeholder="새로운 닉네임을 입력해주세요."/>
		<input type="button" style="margin: 0 auto;" class="btn btn-success"  value="닉네임검색" onclick="nickCheck()"/>
	</form>
<%} %>
</div>
</body>
</html>