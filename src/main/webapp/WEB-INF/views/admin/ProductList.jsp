<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductList.jsp</title>
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
		var ans = confirm("선택된 상품을 삭제하시겠습니까?");
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
	
	function typeCheck() {
  		var bookType = document.getElementById("bookType").value;
  		location.href = "${ctp}/admin/ProductList?page=${pag}&pageSize=${pageSize}&bookType="+bookType;
  	}
	
	//개별검색
  	function bookNameSearch() {
  		var bookName = myform.bookName.value;
  		if(bookName == "") {
  			alert("상품명을 입력하세요.");
  			myform.bookName.focus();
  		}
  		else {
  			location.href="${ctp}/admin/ProductList?bookName="+bookName;
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
	  <form name="myform" method="post">
		  <p style="font-size: 28px; text-align: center;"><b>상품 리스트(총 : ${totRecCnt}개)</b></p>
		  <table class="table table-borderless m-0">
		    <tr>
		      <td>
		        <input type="button" value="선택삭제" onclick="selectDelCheck()" class="btn btn-info btn-sm"/>&nbsp;
		        <input type="checkbox" id="checkAll" class="form-check-label"/>&nbsp;전체선택 &nbsp;
		       </td>
		       <td style="padding-left: 80px;">
				<input type="button" value="개별검색" onclick="bookNameSearch()" class="btn btn-info" style="float: right;"/>
	       		<input type="text" name="bookName" value="${bookName}" placeholder=" 상품명 입력" class="form-control" style="width: 160px; float: right; margin-right: 5px;"/>
				<select name="bookType" id="bookType" onchange="typeCheck()" class="form-control" style="width: 110px; margin-right: 5px;" >
				  <option value="전체" <c:if test="${bookType=='전체'}">selected</c:if>>전체</option>
                  <option value="자기계발" <c:if test="${bookType=='자기계발'}">selected</c:if>>자기계발</option>
                  <option value="IT" <c:if test="${bookType=='IT'}">selected</c:if>>IT</option>
                  <option value="인문/사회" <c:if test="${bookType=='인문/사회'}">selected</c:if>>인문/사회</option>
                  <option value="자연/과학" <c:if test="${bookType=='자연/과학'}">selected</c:if>>자연/과학</option>
                  <option value="요리" <c:if test="${bookType=='요리'}">selected</c:if>>요리</option>
                  <option value="에세이" <c:if test="${bookType=='에세이'}">selected</c:if>>에세이</option>
                  <option value="경제" <c:if test="${bookType=='경제'}">selected</c:if>>경제</option>
                  <option value="예술" <c:if test="${bookType=='예술'}">selected</c:if>>예술</option>
                  <option value="기타" <c:if test="${bookType=='기타'}">selected</c:if>>기타</option>
				</select>
		      </td>
		    </tr>
		  </table>
		  <table class="table table-hover">
		    <tr class="table-dark text-dark text-center" style="font-weight: bolder;">
		      <th style="width: 60px;">선택</th>
		      <th>상품</th>
		      <th style="width: 90px;">상품번호</th>
		      <th>상품명</th>
		      <th style="width: 80px;">저 자</th>
		      <th style="width: 90px;">출판사</th>
		      <th style="width: 95px;">분류</th>
		      <th>텍스트</th>
		      <th>수정</th>
		    </tr>
		    <c:forEach var="vo" items="${vos}" >
		      <tr class="text-center">
			      <td><input type="checkbox" name="select" class="select" value="${vo.bookIdx}"/></td>
			      <td>${vo.bookContent}</td>
			      <td>${vo.bookIdx}</td>
			      <td>${vo.bookName}</td>
			      <td>${vo.bookAuthor}</td>
			      <td>${vo.publisher}</td>
			      <td>${vo.bookType}</td>
			      <td>${vo.bookText}</td>
			      <td><input type="button" value="상품수정" onclick="location.href='${ctp}/admin/ProductChange?bookIdx=${vo.bookIdx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-info btn-sm"></td>
		      </tr>
		      <c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"/>
		    </c:forEach>
		  </table>
	  </form>
<hr/>
<!-- 페이징처리 시작 -->
<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
			<c:if test="${totPage != 0}">
				  <c:if test="${pag != 1}">
				  	<li class="page-item"><a href="${ctp}/admin/ProductList?pag=1&pageSize=${pageSize}&bookType=${bookType}&bookName=${bookName}" title="첫페이지" class="page-link">첫페이지</a></li>
				  </c:if> 
				  <c:if test="${curBlock > 0}">
				 		<li class="page-item"><a href="${ctp}/admin/ProductList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&bookType=${bookType}&bookName=${bookName}" title="이전블록" class="page-link">◀</a></li>
				  </c:if>
				  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				    <c:if test="${i == pag && i <= totPage}">
				   	 <li class="page-item active"><a href='${ctp}/admin/ProductList?pag=${i}&pageSize=${pageSize}&bookType=${bookType}&bookName=${bookName}'class="page-link text-light"><b>${i}</b></a></li>
				    </c:if>
				    <c:if test="${i != pag && i <= totPage}">
				    	 <li class="page-item"><a href='${ctp}/admin/ProductList?pag=${i}&pageSize=${pageSize}&bookType=${bookType}&bookName=${bookName}' class="page-link">${i}</a></li>
				    </c:if>
				  </c:forEach>
				  <c:if test="${curBlock < lastBlock}">
				  	<li class="page-item"><a href="${ctp}/admin/ProductList?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&bookType=${bookType}&bookName=${bookName}" title="다음블록" class="page-link">▶</a></li>
				  </c:if> 
				  <c:if test="${pag != totPage}">
				  	<li class="page-item"><a href="${ctp}/admin/ProductList?pag=${totPage}&pageSize=${pageSize}&bookType=${bookType}&bookName=${bookName}" title="마지막페이지" class="page-link">마지막페이지</a></li>
				  </c:if>
			</c:if>
		</ul>
	</div>
<!-- 페이징처리 끝 -->
<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/Adminpage';" class="btn btn-info" id="back"/>
</div><br/><br/><br/>
</body>
</html>