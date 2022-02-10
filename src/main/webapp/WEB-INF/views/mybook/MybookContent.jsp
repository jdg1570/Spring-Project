<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MybookContent.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">
<style>
	div.gallery {
	  margin-right: 15px;
	  float: left;
	  width: 180px;
	  text-align: center;
	}
	
	div.gallery:hover {
	  border: 1px solid #777;
	}
	
	div.gallery img {
	  width: 100%;
	  height: auto;
	}
	
	div.desc {
	  text-align: left;
	}
	textarea {
	  width: 85%;
	  height: 60px;
	  padding: 12px 20px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  font-size: 16px;
	  resize: none;
	  margin-left: 30px;
	}
	#Like, #noLike {
		cursor: pointer;
	}
</style>
<script>
	function replyCheck() {
		var bookIdx = "${vo.bookIdx}";
		var nickName = "${sNickName}";
		var content = replyForm.content.value;
		if(content == "") {
			alert("댓글을 입력하세요.");
			replyForm.content.focus();
			return false;
		}
		var query = {
			bookIdx : bookIdx,
			nickName : nickName,
			content : content
		}
		$.ajax({
			type : "post",
			url : "${ctp}/admin/ReviewInsert",
			data : query,
			success:function(data) {
				location.reload();
			}
		});
	}
	
	// 리뷰 삭제
	function replyDelCheck(reviewIdx) {
		var ans = confirm("선택하신 리뷰를 삭제하시겠습니까?");
		if(!ans) return false;
		
		$.ajax({
			type : "post",
			url : "${ctp}/admin/ReviewDelete",
			data : {reviewIdx : reviewIdx},
			success:function() {
				location.reload();
			},
			error:function() {
				alert("삭제 실패");
			}
		});
	} 
	
	// 리뷰 좋아요
	 function likeBtn(idx) {
    	var query = {
    			idx : idx,
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/admin/GoodCheck",
    		data : query,
    		success:function() {
    			location.reload();
    		}
    	});
    } 
	
	function bookOpen() {
		var url= "${ctp}/mybook/bookRead?bookText=${vo.bookText}&bookIdx=${vo.bookIdx}&bookName=${vo.bookName}";
		var name = "bookRead"
		var left = ((window.screen.width - 1100)/2);
		var top = ((window.screen.height - 900)/2);
		var option = "width= 1100, height=900, left='+left+', top='+top";
		window.open(url,name,option)
	}
	
</script>
</head>
<body><br/>
<div class="container">
	<input type="button" value="←" onclick="location.href='${ctp}/mybook/Main';" class="btn btn-dark" style="margin-bottom: 20px;">
	<input type="button" value="책 보기" class="btn btn-dark" id="bookRead" onclick="bookOpen()" style="float: right;">
	<table class="table">
		<tr>
			<td style="width: 15%;">
				${vo.bookContent}
			</td>
			<td>
				<table class="table-borderless" style="text-align: left;">
					<tr style="height: 150px;">
						<td>
							<span style="font-size: 20px; font-weight: bolder;">${vo.bookName}</span><br/>
							<span style="color: gray;"><i>${vo.bookAuthor}</i></span>
						</td>
					</tr>
					<tr>
						<td>
							<span style="color: gray; font-size: 13px;">이 책이 담긴 서재</span><br/>
							<a href="${ctp}/admin/AddList?bookIdx=${vo.bookIdx}"><span style="font-size: 15px; font-weight: bolder; color: black;">${mCnt}개</span></a>
						</td>
						<td>
							<span style="color: gray; font-size: 13px;">한 줄 리뷰</span><br/><span style="font-size: 15px; font-weight: bolder;">${reviewCnt}개</span> 
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr >
			<td colspan="2">
				<span style="font-size: 17px;"><b>책소개</b></span>
				<p>${vo.bookContent2}</p><br/><br/>
				<table>
					<tr style="background-color: honeydew;">
						<td style="width: 8%; "><span style="color: gray; font-size: 12px;">카테고리</span><br/><span style="font-size: 15px;"><b>${vo.bookType}</b></span></td>
						<td style="width: 8%; "><span style="color: gray; font-size: 12px;">출판사</span><br/><span style="font-size: 15px;"><b>${vo.publisher}</b></span></td>
						<td style="width: 8%; "><span style="color: gray; font-size: 12px;">출간일</span><br/><span style="font-size: 15px;"><b>${vo.publiDate}</b></span></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span style="font-size: 17px;"><b>한 줄 리뷰</b></span><hr/>
					<c:forEach var="bvo" items="${bVos}">
						<p style="font-size: 13px; margin-left: 20px;">
							<c:if test="${bvo.nickName == sNickName}">
				              <a href="javascript:replyDelCheck(${bvo.idx});"><span class="glyphicon glyphicon-remove" style="float: right;"></span></a>
				            </c:if>
							<i>${bvo.nickName}</i><br/>
							<span style="font-size: 10px; color: gray; margin-top: -5px;">${fn:substring(bvo.WDate,0,16)}</span><br/>
							<span style="font-size: 15px;">${fn:replace(bvo.content,newLine,'<br/>')}</span>
								<c:if test="${bvo.likeSw != 1}">
									<c:if test="${bvo.likeSum != 0}">
										<span style="float: right; padding-right: 10px; ">${bvo.likeSum}</span>
									</c:if>
									<c:if test="${bvo.likeSum == 0}">
										<span style="float: right; padding-right: 10px; display: none;">${bvo.likeSum}</span>
									</c:if>
									<i class="far fa-heart" id="Like" onclick="javascript:likeBtn(${bvo.idx})" style=" float:right; color: red; "></i>
								</c:if>
								<c:if test="${bvo.likeSw == 1}">
									<span style="float: right; padding-right: 10px;">${bvo.likeSum}</span>
									<i class="fas fa-heart" id="noLike" onclick="javascript:likeBtn(${bvo.idx})" style=" float:right; color: red; padding-right: 10px;"></i>
								</c:if>
						</p><hr/>
					</c:forEach>
					<div>
						<form name="replyForm" style="margin-left: 6%;">
					 		<textarea id="FormInput"  name="content" placeholder="한 줄 리뷰"></textarea>
						</form>	
						<input type="button" value="등록" onclick="replyCheck()" class="btn btn-dark" style="float: right; margin-top: -65px; width: 60px; height: 60px; margin-right: 50px;">
					</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span style="font-size: 17px;"><b>이런 책은 어때요?</b></span><br/><br/>
				<c:forEach var="rvo" items="${rVos}">
					<div class="gallery">
						<a href="${ctp}/admin/ProductContent?bookIdx=${rvo.bookIdx}">${rvo.bookContent}</a>
						
					  <div class="desc">
					  	<span style="font-size: 14px; font-weight: bolder;">${rvo.bookName}</span><br/>
					  	<span style="font-size: 12px; color: gray;"><i>${rvo.bookAuthor}</i></span>
					  </div>
					</div>
				</c:forEach>
			</td>
		</tr>
	</table><br/><br/>
	<form name="myform" method="post">
		<input type="hidden" name="nickName" value="${sNickName}">
		<input type="hidden" name="bookIdx" value="${vo.bookIdx}">
		<input type="hidden" name="bookName" value="${vo.bookName}">
		<input type="hidden" name="bookAuthor" value="${vo.bookAuthor}">
		<input type="hidden" name="bookType" value="${vo.bookType}">
		<input type="hidden" name="bookText" value="${vo.bookText}">
		<textarea name="bookContent" style="display:none;">${vo.bookContent}</textarea>
	</form>
</div>
</body>
</html>