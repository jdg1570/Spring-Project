<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardContent.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">
<style>
	th {
		width: 200px;	
		text-align: center;
		font-size: 17px;
		font-weight: bolder;
	}
	h3 {
		text-align: center;
	}
	#com {
		text-align: right;
	}
	.container {
		width: 900px;
	}
	textarea {
	  width: 80%;
	  height: auto;
	  padding: 12px 20px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	  margin-left: 50px;
	}
	#wrapper {
	  width: 80%;
	  height: auto;
	  padding: 12px 20px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	  margin-left: 70px;
	  font-size: 14px;
	}
	#wrapper3 {
	  width: 76%;
	  height: auto;
	  padding: 12px 10px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	  margin-left: 105px;
	  font-size: 14px;
	}
	#Like, #noLike{
		cursor: pointer;
	}
</style>
<script>
	function delCheck() {
		var ans = confirm("게시글을 삭제하시겠습니까?")
		if(ans) location.href = "${ctp}/board/BoardDelete?idx=${vo.idx}&page=${pag}&pageSize=${pageSize}";
	}
	
	function replyCheck() {
		var boardIdx = "${vo.idx}";
    	var nickName = "${sNickName}";
    	var content = replyForm.content.value;
    	if(content == "") {
    		alert("댓글을 입력하세요.");
    		replyForm.content.focus();
    		return false;
    	}
    	var query = {
    		boardIdx : boardIdx,
    		nickName : nickName,
    		content : content
    	}
    	$.ajax({
    		type : "post",
    		url : "${ctp}/board/ReplyInsert",
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
				url : "${ctp}/board/ReplyDelete",
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
		insReply += "<textarea id='content"+idx+"' rows='2' class='form-control' name='content' placeholder='답글입력' style='margin-bottom:5px; margin-right:20px; width: 620px; height: 80px; padding: 12px 20px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px; background-color: #f8f8f8; font-size: 16px; resize: none; margin-left: 70px; font-size: 14px;'>";
		insReply += "</textarea>";
		insReply += "</td>";
		insReply += "<td>";
		insReply += "<input type='button' style='float:right; margin-left:-15px; height:78px; margin-bottom:5px;' class='btn btn-secondary btn-sm' value='답글등록' onclick='replyCheck2("+idx+","+level+","+levelOrder+")'/>";
		insReply += "</td>";
		insReply += "</tr>";
		insReply += "</table>";
		
		
		$("#replyBoxOpenBtn"+idx).hide();
		$("#replyBoxCloseBtn"+idx).show();
		$("#replyBox"+idx).html(insReply);
	}
	
	function closeReply(idx) {
		$("#replyBoxOpenBtn"+idx).show();
    	$("#replyBoxCloseBtn"+idx).hide();
    	$("#replyBox"+idx).hide();
	}
	
	// 답글 저장
	function replyCheck2(idx,level,levelOrder) {
		var boardIdx = "${vo.idx}";
    	var nickName = "${sNickName}";
    	var content = "content"+idx;
    	var contentValue = $("#"+content).val();
		
    	if(content == "") {
    		alert("답글을 입력하세요.");
    		$("#"+content).focus();
    		return false;
    	}
    	var query = {
    		boardIdx : boardIdx,
    		nickName : nickName,
    		content : contentValue,
    		level : level,
    		levelOrder : levelOrder
    	}
    	$.ajax({
    		type : "post",
    		url : "${ctp}/board/ReplyInsert2",
    		data : query,
    		success:function(data) {
    			location.reload();
    		}
    	});
	}
	
	// 댓글 수정
	function replyUpdateCheck(replyIdx,content) {
		var content = replyForm.content.value;
		
		query = {
			replyIdx : replyIdx,		
			content : content,
		}
		$.ajax({
			type : "post",
			url : "${ctp}/board/replyUpdateCheck",
			data : query,
			success:function() {
				location.href= "${ctp}/board/BoardContent?idx=${vo.idx}&page=${pag}&pageSize=${pageSize}";
			}
		});
	}
	
	
	// 좋아요...후..
	function likeBtn(idx) {
		var query = {
				idx : idx,
		}		
		
    	$.ajax({
    		type : "post",
    		url : "${ctp}/board/LikeUp",
    		data : query,
    		success:function() {
    			location.reload();
    		}
    	});
    	
	}
	
	
</script>
</head>
<body>
<div class="container"><br/><br/>
	<div style="margin-bottom: 10px;">
		<c:if test="${sw != 'search'}">
			<c:if test="${!empty pnVos[1]}">
				<a href="${ctp}/board/BoardContent?idx=${pnVos[1].idx}&pag=${pag}&pageSize=${pageSize}"><input type="button" value="다음글" class="btn btn-info" style="float: right; margin-left: 10px;"></a>
			</c:if>
			<c:if test="${!empty pnVos[0]}">
				<a href="${ctp}/board/BoardContent?idx=${pnVos[0].idx}&pag=${pag}&pageSize=${pageSize}"><input type="button" value="이전글" class="btn btn-info"></a>&nbsp;
			</c:if>
		</c:if>
			<input style="float: right;" type="button" value="목록" class="btn btn-info" onclick="location.href='${ctp}/board/BoardList?pag=${pag}&pageSize=${pageSize}';"/>
	</div><hr/>
	<table class="table-borderless" style="width: 100%;">
		<tr>
			<td style="padding-left: 20px;" width="80%">
				<span style="color: green; font-size: 17px;"><b>${vo.part} ></b></span><br/>
				<span style="text-align: left; font-size: 30px;">${vo.title}</span><br/>
				<span><b><i>${vo.nickName}</i></b></span>&nbsp;&nbsp;<span style="color: gray;">${bLevel}</span><br/>
				<span style="font-size: 11px; color: gray;">${fn:substring(vo.WDate,0,16)}</span>&nbsp;&nbsp;<p style="font-size: 11px; color: gray;">조회 : ${vo.readNum}</p>
			</td>
			<td>
				<span style="float: right; padding-right: 35px;"><i class="far fa-comment-dots"></i>&nbsp;댓글&nbsp;&nbsp;${replyCnt}&nbsp;&nbsp;</span><br/>
				<c:forEach var="bvo" items="${lVos}">
				<c:if test="${bvo.likeSum == 0}">
					<span style="float: right; padding-right: 25px;">${bvo.likeSum}</span>
				</c:if>
				<c:if test="${bvo.likeSum != 0}">
					<span style="float: right; padding-right: 25px;">${bvo.likeSum}</span>
				</c:if>
				<span style="float: right; padding-right: 10px;">좋아요</span>
					<c:if test="${bvo.likeIdx != 1}">
						<i class="far fa-heart" id="Like" onclick="javascript:likeBtn(${bvo.idx})" style=" float:right; color: red; padding-right: 5px;"></i>
					</c:if>
					<c:if test="${bvo.likeIdx == 1}">
						<i class="fas fa-heart" id="noLike" onclick="javascript:likeBtn(${bvo.idx})" style=" float:right; color: red; padding-right: 5px;"></i>
					</c:if>
				
				</c:forEach>
			</td>
		</tr>
	</table><hr/>
	<div style="padding-left: 20px; w">
		<div style="width: 100%; height: auto; padding-left: 5%; overflow: hidden;">${vo.content}</div> 
	</div><hr/>
	<div class="text-center" style="margin-bottom: 100px;">
		  <c:if test="${sw != 'search'}">
			<c:if test="${sNickName == vo.nickName || sNickName == '관리자'}">
				<input type="button" value="수정" class="btn btn-info" onclick="location.href='${ctp}/board/BoardUpdate?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';">&nbsp;
				<input type="button" value="삭제" class="btn btn-info " onclick="delCheck()">
			</c:if>
		  </c:if>
		  <c:if test="${sw == 'search'}">
			<input type="button" value="돌아가기" class="btn btn-info" onclick="history.back()"/>
		  </c:if>
	 </div>
	 <!-- 댓글 출력 -->
	  <div id=reply>
		<c:forEach var="rvo" items="${rVos}">
			<c:if test="${rvo.level <= 0}">
				<div class="text-left" id= "wrapper">
					<input type="button" value="답글" onclick="insertReply('${rvo.idx}','${rvo.level}','${rvo.levelOrder}','${rvo.nickName}')" style="float: right; margin-left: 5px;" class="btn btn-secondary btn-sm" id="replyBoxOpenBtn${rvo.idx}"/>
					<input type="button" value="닫기" onclick="closeReply(${rvo.idx})" id="replyBoxCloseBtn${rvo.idx}" class="replyBoxClose btn btn-secondary btn-sm" style="display:none; float: right;" />
					<span style="font-size: 16px;"><b>${rvo.nickName}</b></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${rvo.nickName == sNickName}">
		              <a href="javascript:replyDelCheck(${rvo.idx});"><span class="glyphicon glyphicon-remove"></span></a><br/>
		            </c:if>
					<span style="font-size: 11px; color: gray;">${fn:substring(rvo.WDate,0,16)}</span><br/>
					<div style="margin-left: 5px;">${fn:replace(rvo.content,newLine,'<br/>')}</div>&nbsp;&nbsp;
				</div>
				<div id="replyBox${rvo.idx}"></div>
			</c:if>
			<c:if test="${rvo.level > 0}">
				<c:forEach var="i" begin="1" end="${rvo.level}"></c:forEach>
				<div id= "wrapper3" class="text-left">
					└ <span style="font-size: 16px;"><b>${rvo.nickName}</b></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${rvo.nickName == sNickName}">
			              <a href="javascript:replyDelCheck(${rvo.idx});"><span style="flex: right;" class="glyphicon glyphicon-remove"></span></a><br/>
			            </c:if>
					<div style="margin-left: 20px;">
						<span style="font-size: 11px; color: gray;">${fn:substring(rvo.WDate,0,16)}</span><br/>
						<div style="margin-left: 5px;">${fn:replace(rvo.content,newLine,'<br/>')}</div>&nbsp;&nbsp;
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div><br/><hr/>
	  
 	<!-- 댓글 입력창 -->
 	<span style="font-weight: bold; font-size: 18px; margin-left: 20px;">댓 글</span><br/>
	<form name="replyForm" style="margin-left: 6%;">
		<textarea id="FormInput" name="content" placeholder="댓글 입력"></textarea>
		<input type="hidden" name="boardIdx" value="${vo.idx}"> 
		<input type="hidden" name="nickName" value="${sNickName}"> 
		<div style="margin-bottom: 100px;">
			<c:if test="${empty replyContent}"><input type="button" value="등록" onclick="replyCheck()" class="btn btn-dark" style="float: right; margin-right: 115px;" ></c:if>
		</div>
	</form>
</div>
</body>
</html>