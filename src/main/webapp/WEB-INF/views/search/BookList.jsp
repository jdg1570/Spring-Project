<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">

<style>
	#search {
		border: 2px solid #ccc;
		border-radius: 4px;
		background-color: white;
		height: 45px;
		width: 80%;
	}
	
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
	
	.row, .row > .column {
	  padding: 8px;
	}
	
	.column {
	  float: left;
	  width: 20%;
	}
	
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	.content {
	  background-color: white;
	  padding: 10px;
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
	.sub {
		color: gray;
		font-size: 11px;
	}
	img {
		border-radius: 5px;
		width: 25%;
	}
	#wrapper {margin-left: 3%;}
</style>
<script>
	function Search() {
		var sWord = myform.sWord.value;
		if(sWord == "") {
			alert("검색어 입력하세요.");
			myform.sWord.focus();
		}
		else {
			location.href="${ctp}/search/BookList?sWord="+sWord;
		}
	}
	
	
</script>
</head>
<body>
<div class="container">
	<form class="example" name="myform" >
		<div style= "text-align: center; margin-top: 20px;">
  			<input type="text" id="search" name="sWord" value="${sWord}" placeholder="검색어를 입력하세요">
  			<button type="button" onclick="Search()"  style="border: none; background-color: white;"><i class="fas fa-search" style="font-size: 30px;"></i></button>
		</div>
	</form><br/><hr/>
	<span style="font-size: 20px; font-weight: bold;">카테고리</span><br/><br/>
	<div id="wrapper">
	  <div class="w3-row-padding">
	    <div class="w3-third w3-container w3-margin-bottom">
	      <a href="${ctp}/search/BookList?bookType=자기계발"><img src="${ctp}/images/자기계발.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>자기계발</b></span>
	        <p class="sub">영어, 말하기, 협상, 프레젠테이션, 시간 관리, 습관, 글쓰기, 독서</p>
	      </div>
	    </div>
	    <div class="w3-third w3-container w3-margin-bottom">
	      <a href="${ctp}/search/BookList?bookType=IT"><img src="${ctp}/images/IT.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>IT</b></span>
	        <p class="sub">백엔드, 프론트엔드, 데이터, 메타버스, 영상편집, 컨텐츠</p>
	      </div>
	    </div>
	    <div class="w3-third w3-container">
	   	  <a href="${ctp}/search/BookList?bookType=인문/사회"><img src="${ctp}/images/인문.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>인문/사회</b></span>
	        <p class="sub">인문학, 문화, 강의, 언어, 사회, 정치, 교육, 환경, 세계, 노동</p>
	      </div>
	    </div>
  	  </div>
	  <div class="w3-row-padding">
	    <div class="w3-third w3-container w3-margin-bottom">
	      <a href="${ctp}/search/BookList?bookType=자연/과학"><img src="${ctp}/images/과학.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>자연/과학</b></span>
	        <p class="sub">물리학, 공학, 지구과학, 인체, 뇌, 화학, 수학</p>
	      </div>
	    </div>
	    <div class="w3-third w3-container w3-margin-bottom">
	      <a href="${ctp}/search/BookList?bookType=요리"><img src="${ctp}/images/요리.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>요리</b></span>
	        <p class="sub">한식, 일식, 양식, 베이킹, 쿠킹, 제빵, 자취</p>
	      </div>
	    </div>
	    <div class="w3-third w3-container">
	      <a href="${ctp}/search/BookList?bookType=에세이"><img src="${ctp}/images/에세이.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>에세이</b></span>
	        <p class="sub">시, 일상, 위로, 직업, 관계, 여행, 사랑, 가족, 나이듦</p>
	      </div>
	    </div>
  	</div>
	  <div class="w3-row-padding">
	    <div class="w3-third w3-container w3-margin-bottom">
	      <a href="${ctp}/search/BookList?bookType=경제"><img src="${ctp}/images/경제.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>경제</b></span>
	        <p class="sub">4차 산업혁명, 마케팅, 세계 경제, 한국 경제, 경영, 부자, 주식, 투자</p>
	      </div>
	    </div>
	    <div class="w3-third w3-container w3-margin-bottom">
	      <a href="${ctp}/search/BookList?bookType=예술"><img src="${ctp}/images/예술.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>예술</b></span>
	        <p class="sub">음악, 미술, 공예, 대중문화, 클래식</p>
	      </div>
	    </div>
	    <div class="w3-third w3-container">
	      <a href="${ctp}/search/BookList?bookType=기타"><img src="${ctp}/images/mybook.jpg" class="w3-hover-opacity"></a>
	      <div class="w3-container w3-white">
	        <span><b>기타</b></span>
	        <p class="sub">역사, 철학, 학습서, 어린이 도서, 청소년 도셔, 판타지, 무협</p>
	      </div>
	    </div>
  	</div>
  	</div><hr/>
	<c:if test="${bookType != ''}">
		<p style="font-size: 20px; font-weight: bold;"><span>${bookType}</span> 분야 베스트 샐러</p>
	</c:if>
	<div class="row">
		<c:forEach var="vo" items="${vos}">
			  <div class="column">
			    <div class="content">
			      <a href="${ctp}/admin/ProductContent?bookIdx=${vo.bookIdx}"><span style="width:100%; height: 200px; border-radius: 10px;">${vo.bookContent}</span></a>
			      <font size="2"><b>${vo.bookName}</b></font><br/>
			      <font size="1" style="color: gray"><i>${vo.bookAuthor}</i></font><br/>
			    </div>
			  </div>
		</c:forEach>
	</div>
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
			<c:if test="${totPage != 0}">
				  <c:if test="${pag != 1}">
				  	<li class="page-item"><a href="${ctp}/search/BookList?pag=1&pageSize=${pageSize}&sWord=${sWord}&bookType=${bookType}" title="첫페이지" class="page-link">첫페이지</a></li>
				  </c:if> 
				  <c:if test="${curBlock > 0}">
				 		<li class="page-item"><a href="${ctp}/search/BookList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&sWord=${sWord}&bookType=${bookType}" title="이전블록" class="page-link">◀</a></li>
				  </c:if>
				  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				    <c:if test="${i == pag && i <= totPage}">
				   	 <li class="page-item active"><a href='${ctp}/search/BookList?pag=${i}&pageSize=${pageSize}&sWord=${sWord}&bookType=${bookType}' class="page-link text-light"><b>${i}</b></a></li>
				    </c:if>
				    <c:if test="${i != pag && i <= totPage}">
				    	 <li class="page-item"><a href='${ctp}/search/BookList?pag=${i}&pageSize=${pageSize}&sWord=${sWord}&bookType=${bookType}' class="page-link">${i}</a></li>
				    </c:if>
				  </c:forEach>
				  <c:if test="${curBlock < lastBlock}">
				  	<li class="page-item"><a href="${ctp}/search/BookList?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&sWord=${sWord}&bookType=${bookType}" title="다음블록" class="page-link">▶</a></li>
				  </c:if> 
				  <c:if test="${pag != totPage}">
				  	<li class="page-item"><a href="${ctp}/search/BookList?pag=${totPage}&pageSize=${pageSize}&sWord=${sWord}&bookType=${bookType}" title="마지막페이지" class="page-link">마지막페이지</a></li>
				  </c:if>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>