<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberPwdCheck.jsp</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
	<%@ include file="/WEB-INF/views/include/header2.jsp" %>
	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">
	<script>
		function pCheck(mid) {
			if(myform.pwd.value == "") {
				alert("비밀번호를 입력해주세요.")
				myform.pwd.focus();
				return false;
			}
			else {
				myform.submit();
			}
		}
	</script>
	<style>
		#check {
			border-radius: 5px;
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
<p><br></p>
<div class="container">
	<form name="myform" method="post" >
		<div style="text-align: center; height: 100px; background-color:rgb(245,253,220); font-size: 17px; padding-top: 25px;">
			<b>안전한 개인정보 변경을 위해<br/> 비밀번호를 다시 입력해주세요.</b>
		</div>
		<div class="form-group text-left" id="check"><br/>
			<span style="font-size: 16.5px;">비밀번호 :</span><br/>
			<input style="width: 100%;" class="form-control"  type="password" maxLength="15" name="pwd" c/>
		</div>
	</form>
	<div>
	  	 <button type=button class="btn btn-warning" id="goHome" onclick="pCheck()"><b>확인</b></button>&nbsp;
	  	 <button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/Mypage';"><b>나중에하기</b></button>
 	 </div><br/>
</div><br/><br/><br/><br/>
</body>
<footer>
</footer>
</html>