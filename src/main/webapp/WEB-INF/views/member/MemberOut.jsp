<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberOut.jsp</title>
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
			background-color: Bisque;
			border-radius: 5px;
		}
		#goHome {
		width: 100%; 
		height: 50px; 
		border: none; 
		font-size: 18px;
	}
	</style>
</head>
<body>
<p><br></p>
<div class="container">
	<form name="myform" method="post" ><hr/>
		<h3 style="text-align: center;"><i class="fas fa-exclamation-circle"></i>회원탈퇴</h3><hr/><br/>
		<p style="color: red;"><b>탈퇴 회원 유의 사항</b></p>
		<ul style="color: gray; font-size: 14px;">
			<li>탈퇴를 해도 다른 사람이 스크랩한 고객님의 포스트와 직접 작성하신 댓글은 자동 삭제되지 않습니다. 노출을 원치 않으실 경우 탈퇴 전 삭제하시기 바랍니다.</li>
			<li>탈퇴를하실 경우, 어떤 경우에도 기존 서재의 대한 복구는 불가능하며, 로그인이 필요한 모든 서비스를 이용하실 수 없습니다.</li>
			<li>탈퇴를 하실 경우 계정과 함께 밀이 소멸됩니다. 원치 않으실 경우 밀 이용 후 탈퇴해 주시기 바랍니다.</li>
			<li>탈퇴를 하실 경우 기 결제하신 서비스 이용 권한과 구매 내역을 포기하는 것으로간주됩니다. 탈퇴를 보류해주세요.</li>
			<li>정기결제 상품을 이용 중인 경우 결제수단을 등록 해지애향 회원 탈퇴가 가능합니다.</li>
		</ul><br/>
		<div class="form-group text-center" id="check"><br/>
			<p style="font-size: 16px;"><b>탈퇴하시면 밀리의 서제에서 계정이 삭제되며, 나의 계정과 나의 서재 등 모든 DB가 자동 삭제됩니다. 신중하게 선택해주세요</b></p>
				<label for="pwdCheck" ><span style="text-align: center; color: red;">비밀번호 :</span> </label>
				<input style="padding:2px 0" class="passW_font"  type="password" maxLength="15" name="pwd" />
				<input type="button" value="탈퇴 진행" onclick="pCheck()" class="btn btn-warning btn-sm"><br/><br/>
		</div>
	</form>
	<div>
  	 <button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/Mypage';"><b>나중에하기</b></button>
 	 </div><br/>
</div><br/><br/><br/><br/>
</body>
<footer>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</footer>
</html>