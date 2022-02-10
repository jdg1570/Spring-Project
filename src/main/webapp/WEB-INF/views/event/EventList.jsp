<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventList.jsp</title>
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
		  <table class="table table-borderless m-0">
		    <tr style="text-align: center;">
		      <td colspan="2"><h3>이벤트 현황<br/><span style="font-size: 15px; color: gray;">${totRecCnt}개의 이벤트 진행중</span></h3></td>
		    </tr>
		    <tr>
		      <td>
		        <input type="button" value="선택삭제" onclick="selectDelCheck()" class="btn btn-info btn-sm"/>&nbsp;
		        <input type="checkbox" id="checkAll" class="form-check-label"/>&nbsp;전체선택 &nbsp;
		      </td>
		      <td style="text-align: right;">
		        <input type="button" value="이벤트 등록" onclick="location.href='${ctp}/event/EventInput';" class="btn btn-info btn-sm"/>&nbsp;
		      </td>
		    </tr>
		  </table>
		  <table class="table table-hover">
		    <tr class="table-dark text-dark text-center" style="font-weight: bolder; font-size: 17px;">
		      <th>선택</th>
		      <th>제목</th>
		      <th>이미지</th>
		      <th>종료일</th>
		      <th>참여인원</th>
		      <th>수정</th>
		    </tr>
		    <c:forEach var="vo" items="${eVos}" >
		      <tr class="text-center">
			      <td><input type="checkbox" name="select" class="select" value="${vo.eventIdx}"/></td>
			      <td>${vo.eventTitle}</td>
			      <td><img src="${ctp}/data/event/${vo.eventImage}" style="height: 100px; width: 250px;"></td>
			      <td>${vo.endDate}</td>
			      <td>${vo.eventNum}</td>
			      <td><input type="button" value="이벤트수정" onclick="location.href='${ctp}/event/EventChange?eventIdx=${vo.eventIdx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-info btn-sm"></td>
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
				  	<li class="page-item"><a href="${ctp}/event/EventList?pag=1&pageSize=${pageSize}" title="첫페이지" class="page-link">첫페이지</a></li>
				  </c:if> 
				  <c:if test="${curBlock > 0}">
				 		<li class="page-item"><a href="${ctp}/event/EventList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" title="이전블록" class="page-link">◀</a></li>
				  </c:if>
				  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				    <c:if test="${i == pag && i <= totPage}">
				   	 <li class="page-item active"><a href='${ctp}/event/EventList?pag=${i}&pageSize=${pageSize}'class="page-link text-light"><b>${i}</b></a></li>
				    </c:if>
				    <c:if test="${i != pag && i <= totPage}">
				    	 <li class="page-item"><a href='${ctp}/event/EventList?pag=${i}&pageSize=${pageSize}' class="page-link">${i}</a></li>
				    </c:if>
				  </c:forEach>
				  <c:if test="${curBlock < lastBlock}">
				  	<li class="page-item"><a href="${ctp}/event/EventList?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" title="다음블록" class="page-link">▶</a></li>
				  </c:if> 
				  <c:if test="${pag != totPage}">
				  	<li class="page-item"><a href="${ctp}/event/EventList?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지" class="page-link">마지막페이지</a></li>
				  </c:if>
			</c:if>
		</ul>
	</div>
<!-- 페이징처리 끝 -->
<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/Adminpage';" class="btn btn-info" id="back"/>
</div><br/><br/><br/>
</body>
</html>