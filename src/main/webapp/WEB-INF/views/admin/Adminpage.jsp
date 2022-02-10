<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adminpage.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<style>
	#goHome {
		width: 90%; 
		height: 50px; 
		background-color: #b4b4b4; 
		border: none; 
		font-size: 18px;
	}
</style>
</head>
<body>
<br/><br/>
<div class="container">
	<div>
		<p style="color: gray; font-size: 18px;">밀리 ${sStrLevel}</p>	
		<p style="font-size: 24px; font-weight: bolder;">${sNickName} 님</p>
	</div>
	<table class="table table-hover">
    <thead class="thead-light">
      <tr>
        <th>회원 정보</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="${ctp}/admin/Analysis">비즈니스 분석</a></td>
      </tr>
      <tr>
        <td><a href="${ctp}/admin/MemberList" target="Adminpage">회원 관리</a></td>
      </tr>
    </tbody>
    <thead class="thead-light" >
      <tr>
        <th>서비스 관리</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="${ctp}/admin/ProductInput" target="Adminpage">상품 등록</a></td>
      </tr>
      <tr>
        <td><a href="${ctp}/admin/ProductList" target="Adminpage">상품 관리</a></td>
      </tr>
      <tr>
        <td><a href="${ctp}/admin/BoardList" target="Adminpage">게시판 관리</a></td>
      </tr>
      <tr>
        <td><a href="${ctp}/admin/ReviewType" target="Adminpage">댓글 관리</a></td>
      </tr>
    </tbody>
    <thead class="thead-light" >
      <tr>
        <th>서비스 안내</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="${ctp}/event/EventList">이벤트 관리</a></td>
      </tr>
      <tr>
        <td><a href="${ctp}/admin/Inquiry">1:1문의 관리</a></td>
      </tr>
    </tbody>
  </table>
  <div style="height: 100px; background-color: lightgray;">
  	<div style="margin-left: 7.5%;">
  	 <button style="margin-top: 20px; text-align: center;" type=button class="btn btn-info" id="goHome" onclick="location.href='${ctp}/member/Main';"><b>홈  으  로</b></button>
  	</div>
  </div><br/>
</div>
</body>
</html>