<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myUp.jsp</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	#cover {
		background-image: url('${ctp}/images/mille4.png');
		background-repeat: no-repeat;
		background-size: cover;
		height: 130px;
		width: 100%;
	}
	ul {
	  list-style-type: none;
	  margin: 0;
	  padding: 0;
	  overflow: hidden;
	  background-color: white;
	  border-bottom: 1px solid #b4b4b4;
	}
	
	li {
	  float: left;
	  border-right:none;
	}
	
	
	li a {
	  display: block;
	  text-align: center;
	  padding: 14px 20px;
	}
	
</style>
</head>
<body>
<div class="container">
<div id="cover">
	<p style="margin-left: 2%; font-size: 22px; color: black; padding-top: 20px;"><b><i>${sNickName} 의 서재</i></b></p>
</div>
<ul>
  <li><a href="${ctp}/mybook/AllBook" target="myDown">전체도서</a></li>
  <li><a href="" target="myDown">책장</a></li>
  <li><a href="" target="myDown">통계</a></li>
  <li style="float: right;"><a href=""><input type="button" value="책 고르기" class="btn btn-dark btn-sm"></a></li>
</ul>
</div>
</body>
</html>