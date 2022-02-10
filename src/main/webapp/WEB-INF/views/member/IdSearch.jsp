<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdSearch.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<style>
		#img1 img {
            width: 65%;
            height: 100%;
            float: left;
            margin-top: 5px;
        }
        #wrapper {
            width: 30%;
            height: 400px;
            float: right;
            margin-right: 45px;
            margin-top: 80px;
            padding: 0;
        }
        #title {
            font-size: 22px;
            font-weight: bolder;
            font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
        }
        #title2 {
            color: gray;
            margin-top: -15px;
            font-size: 16px;
        }
        #btnSearch {
            width: 48%;
            height: 50px;
            background-color:rgb(252, 227, 206);
            border: none;
            float: left;
        }
        #back {
            width: 48%;
            height: 50px;
            background-color:rgb(252, 227, 206);
            border: none;
        }
        #btnJoin, #btnPwd {
            cursor: pointer;
        }
        #toMail, #name {height: 50px;}
</style>
</head>
<body>
	<div id="img1">
        <img src="${ctp}/images/서재.jpg">
    </div>
    <div id="wrapper">
        <p id="title">아이디 찾기</p>
        <p id="title2">가입시 입력한 성명, 이메일을 입력하세요.</p>
        <form name="myform" method="post">
	        <div class="form-group">
	            <input type="text" class="form-control" id="name" placeholder="성명" name="name" required>
	        </div>
	        <div class="form-group">
	            <input type="text" class="form-control" id="toMail" placeholder="이메일" name="toMail" required>
	        </div>
	        <div>
	            <button type=submit class="btn btn-outline-secondary" id="btnSearch" onclick="idSearch()">아이디 검색</button>&nbsp;
	            <button type="button" class="btn btn-outline-secondary" id="back" onclick="location.href='${ctp}/member/Login';" >돌아가기</button>
	        </div><br/>
        </form>
    </div>
</body>
</html>