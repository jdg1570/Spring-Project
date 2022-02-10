<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file= "/WEB-INF/views/include/sCheck.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	#logo1 {
	    margin: 10px;
	    margin-top: 10px;
	    width: 120px;
	    height: 35px;
	    border-radius: 20px;
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
    footer {
        width: 100%;
        height: 250px;
        background-color: rgb(238, 250, 190);
        clear: both;
    }
     .title {
     	margin-left: 40px;
     }
    div.gallery {
	  float: left;
	  width: 150px;
	  margin-right: 25px;
	}
	div.gallery img {
	  width: 100%;
	  height: 170px;
	  border-radius: 10px;
	}
	div.desc {
	  padding: 0;
	  text-align: center;
	  font-family: fantasy;
	}
	#text1 {
     	clear: both;
     	margin-left: 40px;
     	margin-right: 40px;
    }
    .dropdown-item:hover {
    	background-color: lightgray;
    }
    .mySlides {display:none;}
    #wrapper {
    	width: 90%;
    	margin: auto;
    }
    .mySlides {display:none;}	
</style>
</head>
<body>
	<div class="w3-content w3-display-container" style="height: 300px;">
	<c:forEach var="vo" items="${eVos}">
	  <a href="${ctp}/event/EventContent?eventIdx=${vo.eventIdx}"><img class="mySlides" src="${ctp}/data/event/${vo.eventImage}" style="width:100%; height: 280px; border-radius: 7px;"></a>
 	</c:forEach>
	  <button class="w3-button w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
	  <button class="w3-button w3-display-right" onclick="plusDivs(1)">&#10095;</button>
	</div><br/><br/>
<div class="container-fluid">
	<div id="wrapper">
		<div id="text1">
			<h4><b>반가워요 ${sNickName} 님</b></h4>
			<div class="form-control" style="height: auto;" >
				밀리와 함께한지 <b>${tVo.diffTime}</b> 일째... 현재 <b>${pVO.point}</b> 밀리<br/>
			</div>
		</div><br/><br/>
		<div class="title">
			<h4><b>지금! 서점 베스트셀러</b></h4>
			<p style="color: darkgray">서점 3사 100위 내, 72권을 밀리에서 만나보세요.</p>
		</div>
		<div style="margin-left: 4%;" class="title">
			<c:forEach var="vo" items="${bestVos}" >
			   <div class="gallery" style="margin-right: 2%">
			   		<a href="${ctp}/admin/ProductContent?bookIdx=${vo.bookIdx}"><div style="width: 90%;">${vo.bookContent}</div></a>
			   <div class="desc"><b><span></span>${vo.bookName}</b><br/><span style="color: gray; font-size: 12px;">${vo.bookAuthor} 지음</span></div>
				</div>
			</c:forEach>
		</div><p></p>
		<div class="title" style="clear: both;">
			<h4><b> 당신만을 위한 ${sInterest} 도서 추천</b></h4><br/>
			<div style="margin-left: 5%;">
				<c:forEach var="vo" items="${perVos}" >
				   <div class="gallery" style="margin-right: 45px;">
				   		<a href="${ctp}/admin/ProductContent?bookIdx=${vo.bookIdx}">${vo.bookContent}</a>
				   	<div class="desc"><b>${vo.bookName}</b><br/><span style="color: gray; font-size: 12px;" >${vo.bookAuthor} 지음</span></div>
				   </div>
				</c:forEach>
			</div>
		</div>
		<div class="title" style="clear: both;">
			<h4><b>신간 도서 추천</b></h4><br/>
			<div style="margin-left: 5%;">
				<c:forEach var="vo" items="${newVos}" >
				   <div class="gallery" style="margin-right: 20px;">
				   		<a href="${ctp}/admin/ProductContent?bookIdx=${vo.bookIdx}"><span id="new">${vo.bookContent}</span></a>
				   	<div class="desc"><b>${vo.bookName}</b><br/><span style="color: gray; font-size: 12px;" >${vo.bookAuthor} 지음</span></div>
				   </div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
<footer>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</footer>
<script>
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	var myIndex = 0;
	carousel();
	
	function carousel() {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  myIndex++;
	  if (myIndex > x.length) {myIndex = 1}    
	  x[myIndex-1].style.display = "block";  
	  setTimeout(carousel, 2500); 
	}
</script>
</html>
