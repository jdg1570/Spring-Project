<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdResult.jsp</title>
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
            width: 49%;
            height: 50px;
            background-color:rgb(252, 227, 206);
            border: none;
            float: left;
        }
        #back {
            width: 49%;
            height: 50px;
            background-color:rgb(252, 227, 206);
            border: none;
            float: left;
        }
        #back2 {
            width: 49%;
            height: 50px;
            background-color:rgb(252, 227, 206);
            border: none;
	    }
        #btnJoin, #btnPwd {
            cursor: pointer;
        }
         #name {
        	 height: 60px;
        	 background-color: #F2F2F2;
         }
         
</style>
</head>
<body>
	<div id="img1">
        <img src="${ctp}/images/서재.jpg">
    </div>
    <div id="wrapper">
        <p id="title">아이디 찾기 결과</p>
        <p id="title2">회원님의 성명과 이메일로 가입된 아이디가 있습니다.</p>
        <form name="myform" method="post">
	        <div class="form-group">
	        <c:set var="mid" value="${vo.mid}"/>
	        <c:set var="startDate" value="${fn:substring(vo.startDate,0,10)}"/>
	        <div id="name" >
	            <p style="border: 1px solid white; padding-top: 15px; padding-left: 15px;"><span style="font-size: 18px;"><b>${mid}</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: gray;">${startDate}&nbsp;&nbsp;가입</span></p>
	        </div>
	        </div><br/>
	        <div>
	        	<p style="color: blue;">비밀번호가 기억나지 않으세요?</p>
	            <button type="button" class="btn btn-outline-secondary" id="back" onclick="location.href='${ctp}/member/PwdSearch';" >비밀번호 찾기</button>&nbsp;
	            <button type="button" class="btn btn-outline-secondary" id="back2" onclick="location.href='${ctp}/member/Login';" >돌아가기</button>
	        </div><br/>
        </form>
    </div>
</body>
</html>