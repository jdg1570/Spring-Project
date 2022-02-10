<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<style>
	div.container {
		text-align: center;
	}
	#controller {
		background-color: Lavender;
		width: 100%;
		height: 100px;
		padding-top: 30px;
	}
	#wrap1 { 
		margin: 0 auto;
	}
	th { 
		font-size: 17px;
		font-weight: bold;
		text-align: center;
	}
</style>
<script>
	function searchChange() {
		searchForm.searchString.focus();
	}
	
	function searchCheck() {
    	var searchString = searchForm.searchString.value;
    	var part = searchForm.part.value;
    	var search = searchForm.search.value;
    	
    	if(searchString == "") {
    		alert("검색어를 입력하세요");
    		searchForm.searchString.focus();
    	}
    	else {
    		location.href="${ctp}/board/BoardList?part="+part+"&search="+search+"&searchString="+searchString;
    	}
    }
	
	function pageCheck() {
		var pageSize = document.getElementById("pageSize").value;
		location.href = "${ctp}/board/BoardList?page=${pag}&pageSize="+pageSize;
	}
</script>
</head>
<body>
<div class="container"><br/>
	<h3 style="font-family:arial; font-weight: bold; text-align: center;" >게 시 판</h3><br/>
	<table>
		<tr>
			<td class="text-right">
				<select name="pageSize" id="pageSize" onchange="pageCheck()" class="p-0 m-0 form-control">
					<option value="5" ${pageSize==5 ? 'selected' : '' }>5건 보기</option>
					<option value="10" ${pageSize==10 ? 'selected' : '' }>10건 보기</option>
					<option value="15" ${pageSize==15 ? 'selected' : '' }>15건 보기</option>
					<option value="20" ${pageSize==20 ? 'selected' : '' }>20건 보기</option>
				</select>
			</td>
		</tr>
	</table>
	<table class="table table-hover">
		<tr class="table-dark text-dark">
			<th>No</th>
			<th class="col-6">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th><a href="${ctp}/board/BoardList?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&menuSw=5">조회</a></th> <!-- 조회수로 조회할때는 menuSw=5 -->
			<th>분류</th>
		</tr>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td>${curScrStrarNo}</td>
				<td>
					<a href="${ctp}/board/BoardContent?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">
						<c:if test="${vo.nickName == '관리자' }">
							<font color="red"><b>${vo.title}</b>&nbsp;
							<span style="color: blue; font-size: 13px;">[${vo.replyCnt}]</span></font>
						</c:if>
						<c:if test="${vo.nickName != '관리자' }">
							${vo.title}&nbsp;
							<c:if test="${vo.replyCnt != 0}">
								<span style="color: blue; font-size: 13px;">[${vo.replyCnt}]</span>
							</c:if>
						</c:if>
					</a>
					<c:if test="${vo.diffTime <= 24}"><span class="w3-badge w3-tiny w3-red" style="font-size: 12px;">n</span></c:if>
					<%-- <c:if test="${vo.comCount != 0}">${vo.comCount}</c:if> --%>
				</td>
				<td>
					<c:if test="${vo.nickName== '관리자'}">
						<span class="badge badge-danger">S</span>
						<span style="color: red;"><i>${vo.nickName}</i></span>
					</c:if>
					<c:if test="${vo.nickName!= '관리자'}">
						<span><i>${vo.nickName}</i></span>
					</c:if>
				</td>
				<td>
					<c:if test="${vo.diffTime <= 24}">${fn:substring(vo.WDate,11,16)}</c:if>
					<c:if test="${vo.diffTime > 24}">${fn:substring(vo.WDate,0,10)}</c:if>
				</td>
				<td>${vo.readNum}</td>
				<c:if test="${vo.nickName=='관리자'}">
					<td style="color: red; font-weight: bold;">${vo.part}</td>
				</c:if>
				<c:if test="${vo.nickName!='관리자'}">
					<td>${vo.part}</td>
				</c:if>
			</tr>
			<c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"></c:set>
		</c:forEach>
	</table>
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
			<c:if test="${totPage != 0}">
				  <c:if test="${pag != 1}">
				  	<li class="page-item"><a href="${ctp}/board/BoardList?pag=1&pageSize=${pageSize}&part=${part}&search=${search}&searchString=${searchString}" title="첫페이지" class="page-link">◁◁</a></li>
				  </c:if> 
				  <c:if test="${curBlock > 0}">
				 		<li class="page-item"><a href="${ctp}/board/BoardList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&part=${part}&search=${search}&searchString=${searchString}" title="이전블록" class="page-link">◀</a></li>
				  </c:if>
				  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				    <c:if test="${i == pag && i <= totPage}">
				   	 <li class="page-item active"><a href='${ctp}/board/BoardList?pag=${i}&pageSize=${pageSize}&part=${part}&search=${search}&searchString=${searchString}'class="page-link text-light"><b>${i}</b></a></li>
				    </c:if>
				    <c:if test="${i != pag && i <= totPage}">
				    	 <li class="page-item"><a href='${ctp}/board/BoardList?pag=${i}&pageSize=${pageSize}&part=${part}&search=${search}&searchString=${searchString}' class="page-link">${i}</a></li>
				    </c:if>
				  </c:forEach>
				  <c:if test="${curBlock < lastBlock}">
				  	<li class="page-item"><a href="${ctp}/board/BoardList?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&part=${part}&search=${search}&searchString=${searchString}" title="다음블록" class="page-link">▶</a></li>
				  </c:if> 
				  <c:if test="${pag != totPage}">
				  	<li class="page-item"><a href="${ctp}/board/BoardList?pag=${totPage}&pageSize=${pageSize}&part=${part}&search=${search}&searchString=${searchString}" title="마지막페이지" class="page-link">▷▷</a></li>
				  </c:if>
			</c:if>
		</ul>
	</div>
	<table class="table table-borderless">
		<tr>
			<td class="text-right p-0">
				<a href="${ctp}/board/BoardInput" class="btn btn-info">글쓰기</a>
			</td>
		</tr>
	
	</table>
	<div class="container" id="controller">
		<form class="form-inline" name="searchForm" method="post">
			<div id="wrap1">
				<select name="part" onchange="searchType()" class="form-control">
					<option value="전체">전체</option>
					<option value="도서문의">도서문의</option>
					<option value="계정문의">계정문의</option>
					<option value="서비스문의">서비스문의</option>
					<option value="기타문의">기타문의</option>
				</select>
				<select name="search" onchange="searchChange()" class="form-control">
					<option value="title">제목</option>
					<option value="nickName">작성자</option>
				</select>
				<input type="text" name="searchString"  class="form-control">
				<input type="button" value="검색" onclick="searchCheck()" class="btn btn-info">
				<input type="hidden" name="pag" value="${pag}">		
			 	<input type="hidden" name="pageSize" value="${pageSize}">
			</div>
		</form>
	</div>	
</div>
</body><br/><br/><br/>
<footer>
</footer>
</html>