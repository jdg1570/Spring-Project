<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<style>
	#goHome {
		width: 100%; 
		height: 50px; 
		background-color: #b4b4b4; 
		border: none; 
		font-size: 18px;
	}
	.thead-light tr {
		height: 10px;
	}
</style>
<script>
	function subscribe() {
		var query {
			nickName="${sNickName}";
		}
		$.ajax({
    		type : "post",
    		url : "${ctp}/member/Subscribe",
    		data : query,
    		success:function() {
    			alert("구독을 시작합니다.");
    			location.reload();
    		}
    	});
	}
</script>
</head>
<body><br/><br/>
<div class="container">
	<div>
		<p style="color: gray; font-size: 18px;">밀리 ${sStrLevel}</p>	
		<p style="font-size: 24px; font-weight: bolder;">${sNickName} 님</p>
		<div style="border: 1px solid lightgray; height: 100px; padding-left: 20px; border-radius: 3px;">
			<div style="padding-top: 20px; ">
				<span style="font-size: 20px; font-weight: bolder;">정기구독을 시작하세요</span><br/>
				<span style="color: #6E6E6E; font-size: 16px;">어려운 독서, 시작하면 습관이 됩니다.</span>
			</div>
		</div><br/>
	</div>
	<!-- <div style="border: none; background-color: #AD46E0; border-radius: 3px; height: 50px; text-align: center; padding-top: 12px; font-size: 16px; color: white; font-weight: bolder;" onclick="subscribe()">
		첫 달 무료로 시작하기
	</div><br/> -->
	<table class="table table-hover">
    <thead class="thead-light">
      <tr>
        <th>기본 설정</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="${ctp}/member/MemberPwdCheck">개인 정보수정</a></td>
      </tr>
     
      <tr>
        <td><a href="${ctp}/member/MemberOut">회원 탈퇴</a></td>
      </tr>
    </tbody>
    <thead class="thead-light" >
      <tr>
        <th>서비스 관리</th>
      </tr>
    </thead>
    <tbody>
       <tr>
        <td><a href="${ctp}/member/MybookInfo">서재 현황</a></td>
      </tr>
      <tr>
        <td><a href="${ctp}/member/MyPosts">내 활동</a></td>
      </tr>
    </tbody>
    <thead class="thead-light" >
      <tr>
        <th>서비스 안내</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="${ctp}/member/Terms">이용약관 및 정책</a></td>
      </tr>
      <tr>
        <td><a href="${ctp}/member/CSservice">고객센터</a></td>
      </tr>
    </tbody>
  </table>
  <div>
  	 <button type=button class="btn btn-secondary" id="goHome" onclick="location.href='${ctp}/member/Main';"><b>홈  으  로</b></button>
  </div><br/>
</div>
</body>
</html>