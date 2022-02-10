<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardReply.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<script>
	// 전체선택
	$(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")) {
				$(".select").prop("checked", true);
			}
			else {
				$(".select").prop("checked", false);
			}
		});
	}); 
	
	// 선택 삭제
	function selectDelCheck() {
		var ans = confirm("선택된 댓글을 삭제하시겠습니까?");
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
	
	function pageCheck() {
		var pageSize = document.getElementById("pageSize").value;
		location.href = "${ctp}/admin/BoardReply?page=${pag}&pageSize="+pageSize;
	}
	
	function nickNameSearch() {
  		var nickName = myform.nickName.value;
  		if(nickName == "") {
  			alert("작성자명을 입력하세요.");
  			myform.nickName.focus();
  		}
  		else {
  			location.href="${ctp}/admin/BoardReply?nickName="+nickName;
  		}
  	}
</script>
<style>
	#back { 
		width: 100%;
	}
	#bookType {
		float: right;
	}
</style>
</head>
<body>
<div class="container">
<p><br/></p>
	<div class="m-4">
	  <form name="myform" method="post">
		  <table class="table table-borderless m-0">
		    <tr class="text-center">
		      <td colspan="3"><h3>게시판 댓글(총 : ${totRecCnt}개)</h3></td>
		    </tr>
		    <tr>
		      <td>
		        <input type="button" value="선택삭제" onclick="selectDelCheck()" class="btn btn-info btn-sm"/>&nbsp;
		        <input type="checkbox" id="checkAll" class="form-check-label"/>&nbsp;전체선택 &nbsp;
		      </td>
		      <td style="padding-left: 500px;">
		      	<input type="button" value="검색" onclick="nickNameSearch()" class="btn btn-info btn-sm" style="float: right;"/>
		      	<input type="text" name="nickName" value="${nickName}" placeholder="작성자" class="form-control" style="width: 120px; float: right; margin-right: 5px; height: 30px;"/>
		      </td>
		      <td>
		        <select name="pageSize" id="pageSize" onchange="pageCheck()" class="form-control" style="float: right; width: 120px;">
					<option value="5" <c:if test="${pageSize==5}">selected</c:if>>5건보기</option>
					<option value="10" <c:if test="${pageSize==10}">selected</c:if>>10건보기</option>
					<option value="15" <c:if test="${pageSize==15}">selected</c:if>>15건보기</option>
					<option value="20" <c:if test="${pageSize==20}">selected</c:if>>20건보기</option>
				</select>
		      </td>
		    </tr>
		  </table>
		  <table class="table table-hover">
		    <tr class="table-dark text-dark text-center" style="font-weight: bolder;">
		      <th style="width: 60px;">선택</th>
		      <th>댓글번호</th>
		      <th>작성자</th>
		      <th>내용</th>
		      <th>작성일</th>
		    </tr>
		    <c:forEach var="vo" items="${vos}" >
		      <tr class="text-center">
			      <td><input type="checkbox" name="select" class="select" value="${vo.idx}"/></td>
			      <td>${vo.idx}</td>
			      <td>${vo.nickName}</td>
			      <td>${vo.content}</td>
			      <td>${fn:substring(vo.WDate,0,16)}</td>
		      </tr>
		      <c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"/>
		    </c:forEach>
		  </table>
	  </form>
	</div>
<hr/>
<!-- 페이징처리 시작 -->
<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
			<c:if test="${totPage != 0}">
				  <c:if test="${pag != 1}">
				  	<li class="page-item"><a href="${ctp}/admin/BoardReply?pag=1&pageSize=${pageSize}&nickName=${nickName}" title="첫페이지" class="page-link">첫페이지</a></li>
				  </c:if> 
				  <c:if test="${curBlock > 0}">
				 		<li class="page-item"><a href="${ctp}/admin/BoardReply?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&nickName=${nickName}" title="이전블록" class="page-link">◀</a></li>
				  </c:if>
				  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				    <c:if test="${i == pag && i <= totPage}">
				   	 <li class="page-item active"><a href='${ctp}/admin/BoardReply?pag=${i}&pageSize=${pageSize}&nickName=${nickName}'class="page-link text-light"><b>${i}</b></a></li>
				    </c:if>
				    <c:if test="${i != pag && i <= totPage}">
				    	 <li class="page-item"><a href='${ctp}/admin/BoardReply?pag=${i}&pageSize=${pageSize}&nickName=${nickName}' class="page-link">${i}</a></li>
				    </c:if>
				  </c:forEach>
				  <c:if test="${curBlock < lastBlock}">
				  	<li class="page-item"><a href="${ctp}/admin/BoardReply?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&nickName=${nickName}" title="다음블록" class="page-link">▶</a></li>
				  </c:if> 
				  <c:if test="${pag != totPage}">
				  	<li class="page-item"><a href="${ctp}/admin/BoardReply?pag=${totPage}&pageSize=${pageSize}&nickName=${nickName}" title="마지막페이지" class="page-link">마지막페이지</a></li>
				  </c:if>
			</c:if>
		</ul>
	</div>
<!-- 페이징처리 끝 -->
<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/ReviewType';" class="btn btn-info" id="back"/>
</div><br/><br/><br/>
</body>
</html>