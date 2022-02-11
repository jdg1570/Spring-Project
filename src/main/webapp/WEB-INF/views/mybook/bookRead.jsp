<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.cjs2108_jdg.vo.MyBookVO"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookRead.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script> window.jQuery || document.write('<script src="booklet/jquery-2.1.0.min.js"><\/script>') </script>
<script src="${ctp}/js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="${ctp}/js/jquery.booklet.latest.min.js" type="text/javascript"></script>
<link href="${ctp}/js/jquery.booklet.latest.css" type="text/css" rel="stylesheet" media="screen, projection, tv" />
<%
	int i = 0;
	List<String> arrays = new ArrayList<String>();
	List<String> arrays2 = new ArrayList<String>();
	try {
		String bookText = request.getParameter("bookText");
		String filePath = application.getRealPath("/resources/data/text/")+bookText;
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
		String str ="";
		while((str = reader.readLine()) != null) {
		String arr[] = str.split("<br/>");
			for(String item : arr) {
				arrays.add(item);
			}
		}
		reader.close();
		String fsize= "";
		for(i=0; i<arrays.size(); i++) {
			fsize += arrays.get(i);
			if(i%7 ==0) {
				arrays2.add(fsize);
				fsize="";
				request.setAttribute("arrays2", arrays2);
			}
		}
	} catch (IOException e) {
		e.printStackTrace();
	}
%>
<script>
	$(function() {
		$('#mybook').booklet({
			covers: true,
			overlays: true,
			width: 1000,
			height: 800,
			pageSelector: true
		});
	
	});
	
	function allread() {
		var ans = confirm("이 책을 완독하셨나요?");
		if(!ans) {
			return false;
		}
		else {
			myform.submit();
		}
	}
</script>
<style>
	#mybook {
		font-size: 16px;
		line-height: 35px;
	}
</style>
</head>
<body>
<div class="container">
<br/><p><br/>
	<div id="mybook">
	<c:forEach var="btxt" items="${requestScope.arrays2}">
		<div>
			<div>${btxt}</div>
		</div>
	</c:forEach>
	</div>
<hr/>
<input type="button" value="완독" onclick="allread()" class="btn btn-dark" style="float: left;">
<input type="button" value="닫기" onclick="window.close()" class="btn btn-dark" style="float: right;">
<form name="myform" method="post">
	<input type="hidden" name="nickName" value="${sNickName}">
	<input type="hidden" name="bookIdx" value="${vo.bookIdx}">
</form>
</div>
</body>
</html>
