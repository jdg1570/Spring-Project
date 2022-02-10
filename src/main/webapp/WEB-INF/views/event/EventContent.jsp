<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventContent.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>
	function replyCheck() {
		var eventIdx = "${vo.eventIdx}";
    	var nickName = "${sNickName}";
    	var content = replyForm.content.value;
    	if(content == "") {
    		alert("댓글을 입력하세요.");
    		replyForm.content.focus();
    		return false;
    	}
    	var query = {
    		eventIdx : eventIdx,
    		nickName : nickName,
    		content : content
    	}
    	$.ajax({
    		type : "post",
    		url : "${ctp}/event/ReplyInsert",
    		data : query,
    		success:function(data) {
    			location.reload();
    		}
    	});
	}
	
	// 댓글 삭제
	function replyDelCheck(replyIdx) {
		var ans = confirm("선택하신 댓글을 삭제하시겠습니까?");
		if(!ans) return false;
		
		$.ajax({
				type : "post",
				url : "${ctp}/event/ReplyDelete",
				data : {replyIdx : replyIdx},
				success:function(data) {
					location.reload();
				},
				error:function() {
					alert("삭제 실패");
				}
		});
	} 
	
	// 답글 입력 폼
	function insertReply(idx,level,levelOrder,nickName) {
		var insReply = "";
		insReply += "<table style='margin-top:5px; margin-bottom:5px;'>";
		insReply += "<tr>";
		insReply += "<td>";
		insReply += "<textarea id='content"+idx+"' rows='2' class='form-control' name='content' placeholder='답글입력' style='margin-bottom:5px; margin-right:20px; width: 110%; height: 80px; padding: 12px 20px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px; background-color: #f8f8f8; font-size: 16px; resize: none; margin-left: 275px; font-size: 14px;'>";
		insReply += "</textarea>";
		insReply += "</td>";
		insReply += "<td>";
		insReply += "<input type='button' style='float:right; margin-left:330px; height:78px; margin-bottom:5px;' class='btn btn-secondary btn-sm' value='답글등록' onclick='replyCheck2("+idx+","+level+","+levelOrder+")'/>";
		insReply += "</td>";
		insReply += "</tr>";
		insReply += "</table>";
		
		
		$("#replyBoxOpenBtn"+idx).hide();
		$("#replyBoxCloseBtn"+idx).show();
		$("#replyBox"+idx).html(insReply);
	}
	
	// 답글 입력 폼닫기
	function closeReply(idx) {
		$("#replyBoxOpenBtn"+idx).show();
		$("#replyBoxCloseBtn"+idx).hide();
		$("#replyBox"+idx).slideUp(400);
	} 
	 
	// 답글 저장
	function replyCheck2(idx,level,levelOrder) {
		var eventIdx = "${vo.eventIdx}";
    	var nickName = "${sNickName}";
    	var content = "content"+idx;
    	var contentValue = $("#"+content).val();
		
    	if(content == "") {
    		alert("답글을 입력하세요.");
    		$("#"+content).focus();
    		return false;
    	}
    	var query = {
    		eventIdx : eventIdx,
    		nickName : nickName,
    		content : contentValue,
    		level : level,
    		levelOrder : levelOrder
    	}
    	
    	$.ajax({
    		type : "post",
    		url : "${ctp}/event/ReplyInsert2",
    		data : query,
    		success:function(data) {
    			location.reload();
    		}
    	});
	}

 
</script>
<style>
	textarea {
	  width: 60%;
	  height: auto;
	  padding: 12px 20px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	}
	#wrapper {
	  width: 56%;
	  height: 120px;
	  padding: 12px 20px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	  margin-left: 275px;
	  font-size: 14px;
	}
/* 	#wrapper2 {
	  width: 55%;
	  height: 100px;
	  padding: 12px 20px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	  margin-left: 275px;
	  font-size: 14px;
	} */
	#wrapper3 {
	  width: 53%;
	  height: auto;
	  padding: 12px 10px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	  margin-left: 305px;
	  font-size: 14px;
	}
	#FormInput {
		height: 100px;
		
	}
</style>
</head>
<body>
<div class="container text-center">
	<input type="button" value="←" onclick="location.href='${ctp}/member/Main';" class="btn btn-dark" style="margin-top: 50px; font-weight: bolder; margin-left: -1000px;">
	<div style="width: 100%;">
		${vo.eventContent} 
	</div><br/>
	<div id=reply><hr/>
		<div style="text-align: left; margin-left: 120px; font-size: 20px;"><b>댓글 : <span style="color: #FFCD28;">${replyCnt}</span></b></div> 
		<c:forEach var="rvo" items="${rVos}">
			<c:if test="${rvo.level <= 0}">
				<div class="text-left" id= "wrapper">
					<input type="button" value="답글" onclick="insertReply('${rvo.idx}','${rvo.level}','${rvo.levelOrder}','${rvo.nickName}')" style="float: right;" class="btn btn-secondary btn-sm" id="replyBoxOpenBtn${rvo.idx}"/>
					<input type="button" value="닫기" onclick="closeReply(${rvo.idx})" id="replyBoxCloseBtn${rvo.idx}" class="replyBoxClose btn btn-secondary btn-sm" style="display:none; float: right;" />
					<span style="font-size: 16px;"><b>${rvo.nickName}</b></span><br/>
					<span style="font-size: 11px; color: gray;">${fn:substring(rvo.WDate,0,16)}</span><br/>
					${rvo.content}&nbsp;&nbsp;&nbsp;
					<c:if test="${rvo.nickName == sNickName}">
		              <a href="javascript:replyDelCheck(${rvo.idx});"><span class="glyphicon glyphicon-remove"></span></a>
		            </c:if>
				</div>
				<div id="replyBox${rvo.idx}"></div>
			</c:if>
			<c:if test="${rvo.level > 0}">
				<c:forEach var="i" begin="1" end="${rvo.level}"></c:forEach>
				<div id= "wrapper3" class="text-left">
					└ <span style="font-size: 16px;"><b>${rvo.nickName}</b></span><br/>
					<div style="margin-left: 20px;">
						<span style="font-size: 11px; color: gray;">${fn:substring(rvo.WDate,0,16)}</span><br/>
						${rvo.content}&nbsp;&nbsp;&nbsp;
						<c:if test="${rvo.nickName == sNickName}">
			              <a href="javascript:replyDelCheck(${rvo.idx});"><span class="glyphicon glyphicon-remove" ></span></a>
			            </c:if>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div><br/><hr/>
		<form name="replyForm" style="margin-left: 6%;">
	 		<textarea id="FormInput" name="content" placeholder="댓글 입력"></textarea>
			<input type="hidden" name="eventIdx" value="${vo.eventIdx}">
			<input type="hidden" name="nickName" value="${sNickName}">
		</form>
		<input type="button" value="등록" onclick="replyCheck()" class="btn btn-dark" style="float: right; margin-right: 210px;" >
</div>
</body>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>