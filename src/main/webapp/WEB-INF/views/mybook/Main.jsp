<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/mybook.jsp" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">
<style>
	
	* {
	  box-sizing: border-box;
	}
	
	body {
	  padding: 20px;
	  font-family: Arial;
	}
	
	/* Center website */
	.main {
	  max-width: 1000px;
	  margin: auto;
	}
	
	h1 {
	  font-size: 50px;
	  word-break: break-all;
	}
	
	.row {
	  margin: 12px;
	}
	
	/* Add padding BETWEEN each column */
	.row, .row > .column {
	  padding: 8px;
	}
	
	/* Create four equal columns that floats next to each other */
	.column {
	  float: left;
	  width: 20%;
	}
	
	/* Clear floats after rows */ 
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Content */
	.content {
	  background-color: white;
	}
	
	@media screen and (max-width: 900px) {
	  .column {
	    width: 50%;
	  }
	}
	
	@media screen and (max-width: 600px) {
	  .column {
	    width: 100%;
	  }
	}
	.container { 
	
	}
</style>
<script>
	function sortCheck() {
			var sort = document.getElementById("sort").value;
			location.href ="${ctp}/mybook/Main?sort="+sort;
	}
	
	function selectDelete() {
		var ans = confirm("선택한 도서를 삭제하시겠습니까?");
		if(!ans) return false;
		var delItems = "";
		for(var i=0; i<myform.select.length; i++) {
			if(myform.select[i].checked == true) delItems += myform.select[i].value + "/";
		}
		
		$.ajax({
			type : "post",
			data : {delItems : delItems},
			success:function() {
				location.reload();
			},
			error:function() {
				alert("삭제 실패");
			}
		});
	}
</script>
</head>
<body>
<div class="container"><br/>
	<form name="myform" method="post">
	<div>
		<select name="sort" id="sort" onchange="sortCheck()" class="form-control" style="width: 140px; float: right;">
			<option value="0" <c:if test="${sort==0}">selected</c:if>>최근 담은 순</option>
			<option value="1" <c:if test="${sort==1}">selected</c:if>>최근 읽은 순</option>
			<option value="2" <c:if test="${sort==2}">selected</c:if>>책 제목 순</option>
			<option value="3" <c:if test="${sort==3}">selected</c:if>>저자명 순</option>
		</select>
		<input type="button" class="btn btn-dark" value="선택 삭제" onclick="selectDelete()" style="float: left;">
	</div><br/><hr/>
	<div class="row" style="clear: both;">
		<c:forEach var="vo" items="${vos}">
		  <div class="column">
		    <div class="content">
		    <input type="checkbox" value="${vo.idx}" name="select" class="select">
		      <a href="${ctp}/mybook/MybookContent?bookIdx=${vo.bookIdx}"><span style="width:100%; height: 200px;">${vo.bookContent}</span></a>
		      <font size="3"><b>${vo.bookName}</b></font><br/>
		      <font size="2" style="color: gray"><i>${vo.bookAuthor}</i></font><br/>
		    </div>
		  </div>
		</c:forEach>
	</div>
	</form>
</div>
</body>
</html>