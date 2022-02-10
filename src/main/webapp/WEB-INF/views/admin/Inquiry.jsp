<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<style>
	#back { 
		width: 100%;
	}
</style>
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
		var ans = confirm("선택된 게시물을 삭제하시겠습니까?");
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
	
	function boardSearch() {
  		var nickName = myform.nickName.value;
  		if(nickName == "") {
  			alert("작성자의 닉네임을 입력하세요.");
  			myform.nickName.focus();
  		}
  		else {
  			location.href="${ctp}/admin/Inquiry?nickName="+nickName;
  		}
  	}
</script>
</head>
<body>
<div class="container">
<p><br/></p>
  <form name="myform" method="post">
		  <p style="font-size: 28px; text-align: center;"><b>1:1 문의 내역</b></p>
		  <table class="table table-borderless m-0">
		    <tr>
		      <td>
		        <input type="button" value="선택삭제" onclick="selectDelCheck()" class="btn btn-info btn-sm"/>&nbsp;
		        <input type="checkbox" id="checkAll" class="form-check-label"/>&nbsp;전체선택 &nbsp;
		       </td>
		       <td style="padding-left: 80px;">
				<input type="button" value="개별검색" onclick="boardSearch()" class="btn btn-info" style="float: right;"/>
	       		<input type="text" name="nickName" value="${nickName}" placeholder=" 작성자 입력" class="form-control" style="width: 160px; float: right; margin-right: 5px;"/>
				<select name="part" id="part" onchange="partCheck()" class="form-control" style="width: 110px; margin-right: 5px; float: right;" >
				  <option value="전체" <c:if test="${part=='전체'}">selected</c:if>>전체</option>
                  <option value="환불신청" <c:if test="${part=='환불신청'}">selected</c:if>>환불신청</option>
                  <option value="계정문의" <c:if test="${part=='계정문의'}">selected</c:if>>계정문의</option>
                  <option value="도서관련문의" <c:if test="${part=='도서관련문의'}">selected</c:if>>도서관련문의</option>
                  <option value="기타/제휴문의" <c:if test="${part=='기타/제휴문의'}">selected</c:if>>기타/제휴문의</option>
				</select>
		      </td>
		    </tr>
		  </table>
		  <table class="table table-hover">
		    <tr class="table-dark text-dark text-center" style="font-weight: bolder;">
		      <th style="width: 60px;">선택</th>
		      <th style="width: 300px;">내용</th>
		      <th style="width: 100px;">작성자</th>
		      <th style="width: 150px;">작성일</th>
		      <th style="width: 95px;">분류</th>
		      <th style="width: 95px;">답변</th>
		    </tr>
		    <c:forEach var="vo" items="${vos}" >
		      <tr class="text-center">
			      <td><input type="checkbox" name="select" class="select" value="${vo.idx}"/></td>
			      <td>${vo.content}</td>
			      <td>${vo.nickName}</td>
			      <td>${fn:substring(vo.WDate,0,16)}</td>
			      <td>${vo.part}</td>
			      <td>
			      	<button type="button" class="content-show btn btn-info btn-sm" onclick="location.href='${ctp}/admin/InquiryInput?idx=${vo.idx}';">등록</button>
			      </td>
		      </tr>
		      <c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"/>
		    </c:forEach>
		  </table>
	  </form>
<hr/>
<div class="container">
	<ul class="pagination justify-content-center">
		<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
		<c:if test="${totPage != 0}">
			  <c:if test="${pag != 1}">
			  	<li class="page-item"><a href="${ctp}/admin/Inquiry?pag=1&pageSize=${pageSize}&part=${part}&nickName=${nickName}" title="첫페이지" class="page-link">첫페이지</a></li>
			  </c:if> 
			  <c:if test="${curBlock > 0}">
			 		<li class="page-item"><a href="${ctp}/admin/Inquiry?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&part=${part}&nickName=${nickName}" title="이전블록" class="page-link">◀</a></li>
			  </c:if>
			  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
			    <c:if test="${i == pag && i <= totPage}">
			   	 <li class="page-item active"><a href='${ctp}/admin/Inquiry?pag=${i}&pageSize=${pageSize}&part=${part}&nickName=${nickName}'class="page-link text-light"><b>${i}</b></a></li>
			    </c:if>
			    <c:if test="${i != pag && i <= totPage}">
			    	 <li class="page-item"><a href='${ctp}/admin/Inquiry?pag=${i}&pageSize=${pageSize}&part=${part}&nickName=${nickName}' class="page-link">${i}</a></li>
			    </c:if>
			  </c:forEach>
			  <c:if test="${curBlock < lastBlock}">
			  	<li class="page-item"><a href="${ctp}/admin/Inquiry?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&part=${part}&nickName=${nickName}" title="다음블록" class="page-link">▶</a></li>
			  </c:if> 
			  <c:if test="${pag != totPage}">
			  	<li class="page-item"><a href="${ctp}/admin/Inquiry?pag=${totPage}&pageSize=${pageSize}&part=${part}&nickName=${nickName}" title="마지막페이지" class="page-link">마지막페이지</a></li>
			  </c:if>
		</c:if>
	</ul>
</div>

<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/Adminpage';" class="btn btn-info" id="back"/>
</div>
</body>
</html>