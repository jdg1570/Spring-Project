<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
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
        #btnLogin {
            width: 100%;
            height: 40px;
            background-color:rgb(252, 227, 206);
            border: none;
        }
        #bottom {
            text-align: center;
            margin-top: 15px;
            color: gray;
        }
        #btnJoin, #btnPwd {
            cursor: pointer;
        }
</style>
</head>
<body>
	<div id="img1">
        <img src="${ctp}/images/서재.jpg">
    </div>
    <div id="wrapper">
        <p id="title">독서와 무제한 친해지리</p>
        <p id="title2">10만 권 속에서 인생책을 찾아보세요</p>
        <form name="myform" method="post">
	        <div class="form-group">
	            <input type="text" class="form-control" id="mid" placeholder="아이디 입력" name="mid" value="${mid}" required autofocus>
	        </div>
	        <div class="form-group">
	            <input type="password" class="form-control" id="pwd" placeholder="비밀번호 입력" name="pwd" required>
	        </div>
	        <div class="form-group form-check">
	            <input class="form-check-input" type="checkbox" name="idSave" id="idSave" checked> 아이디 저장
	        </div>
	        <div>
	            <button type="submit" class="btn btn-outline-secondary" id="btnLogin" >로 그 인</button>
	        </div>
	        <div id="bottom">
	            <a href="${ctp}/member/Join" id="btnJoin">회원가입</a>&nbsp;&nbsp;/
	            <a href="${ctp}/member/IdSearch">아이디찾기</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="${ctp}/member/PwdSearch">비밀번호찾기</a>
	        </div>
        </form>
    </div>
</body>
</html>