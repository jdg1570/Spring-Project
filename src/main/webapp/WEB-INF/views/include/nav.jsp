<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.dropdown-item:hover {
  	  background-color: lightgray;
    }
</style>
<%
	int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
%>

	<div class="w3-nav w3-border-bottom w3-border-top" >
	  <div class="w3-row w3-large w3-white w3-center">
	    <div class="w3-col s2">
	      <a href="${ctp}/member/Main" class="w3-button w3-block"><b>Home</b></a>
	    </div>
	    <div class="w3-col s2">
	      <a href="${ctp}/board/BoardList" class="w3-button w3-block"><b>게시판</b></a>
	    </div>
	    <div class="w3-col s2">
	      <a href="${ctp}/search/BookList" class="w3-button w3-block"><b>검색</b></a>
	    </div>
	    <div class="w3-col s2">
	      <a href="${ctp}/mybook/Main" class="w3-button w3-block"><b>내 서재</b></a>
	    </div>
	    <c:if test="${sLevel!=0}">
		    <div class="w3-col s2">
		      <a href="${ctp}/member/Mypage" class="w3-button w3-block"><b>My Page</b></a>
		      <%-- <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/member/MemberUpdate">회원정보변경</a>
				      <a class="dropdown-item" href="<%=request.getContextPath()%>/MemberOut.mil">탈퇴신청</a>
			   </div> --%>
		    </div> 
	    </c:if>
		<c:if test="${sLevel==0}">
		    <div class="w3-col s3">
		      <a href="${ctp}/admin/Adminpage" class="w3-button w3-block"><b>관리자 페이지</b></a>
		    </div>
	    </c:if>
	  </div>
	</div><br/><br/>