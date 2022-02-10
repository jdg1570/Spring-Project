<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>MemberList.jsp</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <%@ include file="/WEB-INF/views/include/header2.jsp" %>
  
  <script>
	  // 회원 등급변경을 ajax로 변경
	  function levelCheck(obj) {
	  	var ans = confirm("회원등급을 변경하시겠습니까?");
	  	if(!ans) {
	  		location.reload();
	  		return false;
	  	}
	  	var str = $(obj).val();
	  	var query = {
	  			idx : str.substring(1),
	  			level : str.substring(0,1)
	  	}
	  	
	  	$.ajax({
	  		type : "post",
	  		url  : "${ctp}/admin/MemberLevel",
	  		data : query,
	  		error:function() {
	  			alert("처리 실패!!");
	  		}
	  	});
	  }
  	
  	// 회원 탈퇴처리(정보삭제)
  	function memberReset(idx) {
  		var ans = confirm("탈퇴 처리 하시겠습니까?");
  		if(!ans) {
	  		return false;
	  	}
  		var query = {
	  			idx : idx
	  	}
  		$.ajax({
	  		type : "post",
	  		url  : "${ctp}/admin/MemberReset",
	  		data : query,
	  		success:function() {
	  			location.reload();
	  		}
	  	});
  		
  	}
  	// 회원 등급별 검색
  	function levelSearch() {
  		var level = adminForm.level.value;
  		location.href="${ctp}/admin/MemberList?level="+level;
  	}
  	//개별검색
  	function midSearch() {
  		var mid = adminForm.mid.value;
  		if(mid == "") {
  			alert("아이디를 입력하세요.");
  			adminForm.mid.focus();
  		}
  		else {
  			location.href="${ctp}/admin/MemberList?mid="+mid;
  		}
  	}
  	
  </script>
  <style>
  	#back {
  		width: 100%;
  	}
  </style>
</head>
<body>
<p><br></p>
<div class="container-fluid">
	<form name = "adminForm">
		<table class="table table-borderless m-0">
			<tr>
			  <td colspan="2">
			  	<c:choose>
			  		<c:when test="${level==99}"><c:set var="title" value="전체"></c:set></c:when>
			  		<c:when test="${level==1}"><c:set var="title" value="정"></c:set></c:when>
			  		<c:when test="${level==2}"><c:set var="title" value="우수"></c:set></c:when>
			  	</c:choose>
			  	 <c:if test="${!empty mid}"><c:set var="title" value="${mid}"/></c:if>
			  	<h3 style="text-align: center;">${title} 회원 리스트</h3>
			  </td>
			</tr>	
			<tr>
				<td style="text-align: left">
					<input type="text" name="mid" value="${mid}" placeholder="검색할 아이디 입력" class="form-control" style="width: 180px; float: left;"/>&nbsp;
					<input type="button" value="개별검색" onclick="midSearch()" class="btn btn-info btn-sm"/>
					<input type="button" value="전체보기" onclick="location.href='${ctp}/admin/MemberList';" class="btn btn-info btn-sm">
				</td>
				<td>
					<select name="level" onchange="levelSearch()" class="form-control" style="width: 120px; float: right;">
						<option value="99" <c:if test="${level==99}">selected</c:if>>전체회원</option>
						<option value="1" <c:if test="${level==1}">selected</c:if>>정회원</option>
						<option value="2" <c:if test="${level==2}">selected</c:if>>우수회원</option>
					</select>
				</td>
			</tr>	
		</table>
	</form>
  <table class="table table-hover">
  	<tr class="table-dark text-dark text-center" style="font-size: 15px;">
  		<th>번호</th>
  		<th>아이디</th>
  		<th>별명</th>
  		<th>성명</th>
  		<th>성별</th>
  		<th>생일</th>
  		<th>연락처</th>
  		<th>주소</th>
  		<th>이메일</th>
  		<th>관심분야</th>
  		<th>정보공개</th>
  		<th>탈퇴신청</th>
  		<th>포인트</th>
  		<th>회원등급</th>
  		<th>가입일</th>
  		<th>최종접속일</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}">
  		<tr class="text-center" style="font-size: 12px;">
				<td>${curScrStrarNo}</td>
				<td>${vo.mid}</td>
				<td>${vo.nickName}</td>
				<td>${vo.name}</td>
				<td>${vo.gender}</td>
				<td>${fn:substring(vo.birthday,0,10)}</td>
				<td>${vo.tel}</td>
				<td>${vo.address}</td>
				<td>${vo.email}</td>
				<td>${vo.interest}</td>
				<td>${vo.userInfor=='비공개'?'<font color=blue>비공개</font>':'공개'}</td>
				<td>
					<c:if test="${vo.userDel =='OK'}"><a href="javascript:memberReset(${vo.idx})"><font color=red>탈퇴신청</font></a></c:if>
		    	    <c:if test="${vo.userDel !='OK'}">활동중</c:if>
				</td>
				<td>${vo.point}</td>
				<td>
					<select name="level" onchange="levelCheck(this)">
						<option value="2${vo.idx}" <c:if test="${vo.level==2}">selected</c:if>>우수회원</option>
						<option value="1${vo.idx}" <c:if test="${vo.level==1}">selected</c:if>>정회원</option>
						<option value="0${vo.idx}" <c:if test="${vo.level==0}">selected</c:if>>관리자</option>
					</select>
				</td>
				<td>${fn:substring(vo.startDate,0,16)}</td>
				<td>${fn:substring(vo.lastDate,0,16)}</td>
  		</tr>
  		<c:set var="curScrStrarNo" value="${curScrStrarNo -1}"></c:set>
  	</c:forEach>
  </table><hr/>
 <!-- 페이징처리 시작 -->
<div style="text-align:center">
	<c:if test="${pag != 1}"><a href="${ctp}/admin/MemberList?pag=1&level=${level}&mid=${mid}" class="btn btn-secondary btn-sm">첫페이지</a></c:if>
	<c:if test="${pag > 1}"><a href="${ctp}/admin/MemberList?pag=${pag-1}&level=${level}&mid=${mid}" class="btn btn-secondary btn-sm">이전페이지</a></c:if>
	<c:if test="${pag < totPage}"><a href="${ctp}/admin/MemberList?pag=${pag+1}&level=${level}&mid=${mid}" class="btn btn-secondary btn-sm">다음페이지</a></c:if>
	<c:if test="${pag != totPage}"><a href="${ctp}/admin/MemberList?pag=${totPage}&level=${level}&mid=${mid}" class="btn btn-secondary btn-sm">마지막페이지</a></c:if><br/>
	${pag}Page / ${totPage}pages
</div><br/>
<!-- 페이징처리 끝 -->
<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/Adminpage';" class="btn btn-info" id="back"/>
</div>
<br/>
</body>
</html>