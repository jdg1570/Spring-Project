<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
	#logo1 {
	    margin: 10px;
	    margin-top: 12px;
	    width: 120px;
	    height: 33px;
	    border-radius: 20px;
	    cursor: pointer;
        }
    #btn1 {
        border-radius: 20px;
        float: right;
        margin-right: 25px;
        margin-top: 12px;
        width: 100px;
        font-size: 12px;
        background-color: black;
        color: white;
    }
    header {
        height: 60px;
        border: 1px solid white;    
        position: sticky;
        top: 0px;
        transition: opacity 1s;
    }
    #container1{
    	border-bottom: 1px solid lightgray;
    }
</style>
<div id="container1">
	<a href="${ctp}/member/Logout"><input type="button" value="로그아웃" id="btn1" class="btn btn-dark"></a>
   <img src="${ctp}/images/밀리black.jpg" id="logo1" onclick="location.href='${ctp}/member/Main';">
</div>	
