<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CSservice.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">
<style>
	h3 {
		text-align: center;
		font-weight: bold;
	}
	div h4 {
		text-align: left;
		font-weight: bold;
		margin-bottom: 20px;
	}
   .que {
        font-size: 16px;
        cursor: pointer;
        transition: 0.4s;
     }
 	.ans {
        text-align: left;
        background-color: white;
        font-size: 14px;
        padding: 0 15px;
        display: none;
        padding-left: 20px;
    }
    #goHome {
		width: 100%; 
		height: 40px; 
		border: none; 
		font-size: 17px;
	}
</style>

</head>
<body>
<h3>고객센터</h3><hr/>
		<img src="${ctp}/images/고객센터2.png" style="width: 100%; height: 200px;"><hr/>
<div class="container"><br/>
<h4>자주 묻는 질문 TOP5</h4>
	<table class="table table-hover">
		<tr>
			<td ><b>1</b>  밀리의 서재에는 어떤 구독 상품이 있나요?</td>
			<td>
				<i class="fas fa-plus bt"></i><i class="fas fa-minus bt" style="display: none;"></i>
			</td>
		</tr>
		<tr class="ans">
			<td style="font-size: 13px;">
				밀리의 서재 정기구독에는 4가지 종류가 있습니다.<br/>
				[전자책 월 정기구독]<br/>
				* 이용금액 : 결제수단 별로 금액 다름<br/>
					- 신용카드/카카오페이/페이코/네이버페이 : 9,900원<br/>
					- 휴대폰 : 월 9,900원<br/>
					- 아이폰 인앱 결제 : 12,000원<br/>
					- 안드로이드 인앱 결제 : 11,900원<br/><br/>
				[밀리 오리지널 종이책 월 정기구독]<br/>
				* 이용금액 : 15,900원, 신용카드/카카오페이/페이코/네이버페이/휴대폰 결제<br/><br/>
				[전자책 연 정기구독]<br/>
				* 이용금액 : 99,000원 (2개월 요금인 19,800원 할인), 신용카드/카카오페이/페이코/네이버페이 결제 가능<br/><br/>
				[밀리 오리지널 종이책 연 정기구독]<br/>
				* 이용금액 : 18,3000원 (1년에 6권), (2개월 요금인 19,800원 할인), 신용카드/카카오페이/페이코/네이버페이 결제 가능<br/><br/>
			</td>
		</tr>
		<tr>
			<td ><b>2</b>  도서 카테고리별 분류는 없나요?</td>
			<td>
				<i class="fas fa-plus bt"></i><i class="fas fa-minus bt" style="display: none;"></i>
			</td>
		</tr>
		<tr class="ans">
			<td>밀리의 서재도 카테고리 분류가 있습니다. 돋보기 모양의 검색 메뉴에서 카테고리를 확인하실 수 있어요!</td>
		</tr>
		<tr>
			<td ><b>3</b>  [환불] 정기구독 이용 도중에 구독 취소나 해지도 가능한가요?</td>
			<td>
				<i class="fas fa-plus bt"></i><i class="fas fa-minus bt" style="display: none;"></i>
			</td>
		</tr>
		<tr class="ans">
			<td>
				<p style="font-weight: bold;">1. 콘텐츠를 열람하지 않은 경우</p>
				결제 후 기간에 따라 환불 금액이 결정되며, 관리 메뉴 [관리 > 구독 관리 > 결제 내역 확인]을 통해 직접 구독 취소를하실 수 있습니다.<br/><br/>
				<p style="font-weight: bold;">2. 콘텐츠를 열람한 경우</p>
				이미 콘텐츠를 열람하셨다면 환불은 가능하지 않습니다.<br/>
			</td>
		</tr>
		<tr>
			<td ><b>4</b>  [IOS] App Store 환불 요청은 어떻게 하나요?</td>
			<td>
				<i class="fas fa-plus bt"></i><i class="fas fa-minus bt" style="display: none;"></i>
			</td>
		</tr>
			<tr class="ans">
			<td>
				1. http://reportabroblem.apple.com 접속 <br/>
				2. 구매한 Apple ID 로그인 <br/>
				3. 밀리의 서재 앱의 [문제 신고] 클릭 <br/>
				4. 문제 선택, 내용(환불 사유) 작성 후 제출 <br/><br/>
				환불 완료까지 시간이 다소 걸릴 수 있으니 참고 부탁드립니다.
			</td>
		</tr>
		<tr>
			<td ><b>5</b>  [AOS] 구글 스토어에서 환불 요청은 어떻게 하나요?</td>
			<td>
				<i class="fas fa-plus bt"></i><i class="fas fa-minus bt" style="display: none;"></i>
			</td>
		</tr>
		<tr class="ans">
			<td>
				1. play.google.com/store.account 접속 <br/>
				2. 주문 내역을 클릭 <br/>
				3. 반품할 주문을 찾기 <br/>
				4. 환불 요청에서 내 상황에 맞는 옵션을 선택 <br/>
				5. 양식을 작성하고 환불을 원한다는 메모를 등록 <br/>
				6. '신고해 주셔서 감사합니다.' 라는 메시지가 표시 <br/><br/>
				환불 가능 여부가 결정되면 영업일 기준 4일 이내 이메일이 발송됩니다.
				
			</td>
		</tr>
	</table><br/><hr/>
	<div style="height: 150px; background-color: lightgray; text-align: center; border-radius: 5px;">
		<div style="padding-top: 20px; padding-bottom: 25px;">찾으시는 내용이 없나요?<br/>1:1문의를 이용해 주시면 자세한 답변을 드려요</div>
		<input type="button" value="1:1 문의하기" class="btn btn-dark" style="width: 300px;" onclick="location.href='${ctp}/member/inquiry';">
	</div><br/><br/>
	<button type=button class="btn btn-warning" id="goHome" onclick="location.href='${ctp}/member/Mypage';"><b>돌아가기</b></button><br/><br/>
</div>
</body>
<script>
	$(".bt").on("click",function(){
	  var obj = $(this);
	  if(obj.hasClass("fas fa-plus")){
	    obj.hide();
	    obj.next().show();            
	    obj.parent().parent().next().show();
	    
	  }else{
	     obj.hide();
	     obj.prev().show();
	     obj.parent().parent().next().hide();
	  }
	});

</script>
</html>