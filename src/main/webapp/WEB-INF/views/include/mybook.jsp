<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mybook.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<style>
	#cover {
		background-image: url('${ctp}/images/mille4.png');
		background-repeat: no-repeat;
		background-size: cover;
		height: 130px;
		width: 100%;
	}
	* {box-sizing: border-box;}

	body {
	  margin: 0;
	  font-family: Arial, Helvetica, sans-serif;
	}
	
	.topnav {
	  overflow: hidden;
	  border-radius: 5px;
	  border-bottom: 2px solid black;
	}
	
	.topnav a {
	  float: left;
	  display: block;
	  color: black;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 17px;
	}
	
	.topnav a:hover {
	  background-color: #ddd;
	  color: black;
	}
	
	.topnav a.on {
	  border-bottom: 2px solid black;
	  color: black;
	}
	
	.topnav .search-container {
	  float: right;
	}
	
	.topnav input[type=text] {
	  padding: 6px;
	  font-size: 17px;
	  border: none;
	}
	
	.topnav .search-container button {
	  float: right;
	  padding: 6px 10px;
	  margin-right: 16px;
	  background: #ddd;
	  font-size: 17px;
	  border: none;
	  cursor: pointer;
	}
	
	.topnav .search-container button:hover {
	  background: #ccc;
	}
	
	@media screen and (max-width: 600px) {
	  .topnav .search-container {
	    float: none;
	  }
	  .topnav a, .topnav input[type=text], .topnav .search-container button {
	    float: none;
	    text-align: left;
	    width: 100%;
	    margin: 0;
	    padding: 14px;
	  }
	  .topnav input[type=text] {
	    border: 1px solid #ccc;  
	  }
	}
	
</style>
</head>
<body>
<div class="container">
	<div id="cover">
		<p style="margin-left: 2%; font-size: 22px; color: black; padding-top: 20px;"><b><i>${sNickName} 의 서재</i></b></p>
	</div>
	<div class="topnav">
	  <a class="" href="${ctp}/mybook/Main" style="font-weight: bold;">전체도서</a>
	  <!-- <a href="#about" style="font-weight: bold;">책장</a> -->
	  <a  href="${ctp}/mybook/Myanalysis" style="font-weight: bold;">통계</a>
	  <div class="search-container">
	  </div>
	</div>
</div>
</body>
</html>