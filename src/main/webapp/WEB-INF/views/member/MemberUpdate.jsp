<%@page import="com.spring.cjs2108_jdg.vo.MemberVO"%>
<%@page import="com.spring.cjs2108_jdg.dao.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String sToday = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdate.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${ctp}/js/woo.js"></script>
<style>
@media (min-width: 1025px) {
.h-custom {
	height: 100vh;
  }
}
#btnWrapper {
	text-align: center;
}
h4 { margin-bottom: -5px;
}
</style>
<script>
	var nickCheckOn = 0;
	
 function nickCheck() {
    	var nickName = $("#nickName").val();
    	if('${sNickName}' == nickName) {
	  		alert("닉네임을 수정하지 않으셨습니다.")
	  		nickCheckOn = 1;
	  		return false;
	  	}
    	if(nickName=="" || $("#nickName").val().length<2 || $("#nickName").val().length>20) {
    		alert("닉네임을 체크하세요!(닉네임은 2~20자 이내로 사용하세요.)");
    		myform.nickName.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/member/NickCheck",
    		data : {nickName : nickName},
    		success:function(data) {
    			if(data == "1") {
    				alert("이미 사용중인 닉네임 입니다.");
    				$("#nickName").focus();
    			}
    			else {
    				alert("사용 가능한 닉네임 입니다.");
    				nickCheckOn = 1;	
    				myform.nickName.readOnly = true;
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
	
	function fCheck() {
    	var pwd = myform.pwd.value;
    	var pwdCheck = myform.pwdCheck.value;
    	var nickName = myform.nickName.value;
    	var email = myform.email.value;
    	var tel = myform.tel.value;
    	
    	let regex1 = /\s/gm;
    	let regMid = /[^0-9a-zA-Z]/gm;
    	let regPwd = /[!@#$%^&*()]/gm;
    	let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    	let regTel = /[^0-9]/gm;
    
    	
    	if(pwd == "") {
    		alert("비밀번호를 입력하세요");
    		myform.pwd.focus();
    		return false;
    	}
    	else if(!regPwd.test(pwd)) {
    		alert("비밀번호는 1개 이상의 특수문자를 포함해야합니다.");
    		myform.pwd.select();
    		return false;
    	}
    	else if(pwdCheck == "") {
    		alert("비밀번호 확인란을 입력하세요");
    		myform.pwdCheck.focus();
    	}
    	else if(pwdCheck != pwd) {
    		alert("비밀번호가 일치하지 않습니다.");
    		myform.pwdCheck.focus();
    	}
    	else if(nickName == "") {
    		alert("닉네임을 입력하세요");
    		myform.nickName.focus();
    	}
    	else if(regex1.test(nickName)) {
    		alert("닉네임에 공백이 존재합니다");
    		myform.nickName.select();
    	}
    	else if(email == "") {
    		alert("이메일을 입력하세요");
    		myform.email.focus();
    	}
    	else if(!regEmail.test(email)) {
    		alert("이메일을 확인하세요");
    		myform.email1.focus();
    		return false;
    	}
    	else if(regTel.test(tel)) {
    		alert("연락처는 숫자만 입력가능합니다.");
    		myform.tel.focus();
    	}
    	else {
    			if(nickCheckOn == 1) {
    			var postcode = myform.postcode.value;
    			var roadAddress = myform.roadAddress.value;
    			var detailAddress = myform.detailAddress.value;
    			var extraAddress = myform.extraAddress.value;
    			var address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
    			if(address=="///") address = "";
    			myform.address.value = address;
    			myform.submit();
    		}
    		else {
    			if(nickCheckOn != 1) {
    				alert("닉네임, 중복체크버튼을 눌러주세요!");
	    			return false;
    			}
    		}
    	}
    }
</script>
</head>
<body>
	<section class="h-100 h-custom">
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col-lg-8 col-xl-6">
	        <div class="card rounded-3">
	          <div class="card-body ">
	            <h4 class="text-center">회원정보변경</h4><br/>
	            <form class="px-md-3" name="myform" method="post" action="${ctp}/member/MemberUpdate">
	              <div class="form-outline mb-2">
	                <label class="form-label"><b>아이디</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder" >*</span>&nbsp;&nbsp;</label>
	                <input type="text" name="mid" class="form-control"  value="${sMid}" placeholder="영문/숫자" required readonly  />
	              </div>
	              <div class="form-outline mb-2">
	                <label class="form-label" ><b>비밀번호</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder">*</span></label>
	                <input type="password" name="pwd" class="form-control" placeholder="1개이상의 특수문자" required/>
	              </div>
	              <div class="form-outline mb-2">
	                <label class="form-label" ><b>비밀번호 확인</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder">*</span></label>
	                <input type="password" name="pwdCheck" class="form-control" required/>
	              </div>
	              <div class="form-outline mb-3">
	                <label class="form-label" ><b>닉네임</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder">*</span>&nbsp;&nbsp;<input type="button" value="중복체크" class="btn btn-success btn-sm" onclick="nickCheck()"></label>
	                <input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control"  required/>
	              </div>
	              <div class="form-group">
				      <label for="email"><b>이메일</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder">*</span></label>
						<div class="input-group mb-3">
						  <input type="text" class="form-control" placeholder="이메일입력" id="email" name="email" value="${vo.email}" required/>
						</div>
					</div>
	              <div class="form-outline mb-3">
	                <label class="form-label" ><b></b>성명&nbsp;&nbsp;<span style="color:red; font-weight: bolder">*</span></label>
	                <input type="text" name="name" class="form-control" value="${vo.name}" readonly />
	              </div>
	              <hr/>
	              <div class="form-outline mb-3">
	                <label class="form-label" ><b>연락처</b></label>
	                <input type="text" name="tel" class="form-control" placeholder="(-)없이 입력" value="${vo.tel}" maxlength=11/>
	              </div>
		           <div class="form-group">
				    <label for="address"><b>주소</b></label><br/>
				    <input type="hidden" class="form-control" name="address"/>
				    <input type="text" class="mb-2" name="postcode" value="${fn:split(vo.address,'/')[0]}" id="sample4_postcode" size="30" placeholder="우편번호">&nbsp;
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success btn-sm"><br>
					<input type="text" class="mb-2" name="roadAddress" value="${fn:split(vo.address,'/')[1]}" id="sample4_roadAddress" size="30" placeholder="도로명주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" class="mb-2" name="detailAddress" value="${fn:split(vo.address,'/')[2]}" id="sample4_detailAddress" size="30" placeholder="상세주소">
					<input type="text" name="extraAddress" id="sample4_extraAddress" value="${fn:split(vo.address,'/')[3]}" placeholder="나머지 주소">
   				 </div>
	          <div class="row">
                <div class="col-md-6 mb-4">
                  	<div class="form-group">
				   		<label for="birthday"><b>생년월일</b></label>
						<input type="date" name="birthday" value="<%=sToday%>" class="form-control"/>
				    </div>
             	 </div>
              </div>
                <div class="form-group">
			      <div class="form-check-inline">
			        <span>성별 :</span> &nbsp; &nbsp;
						<label class="form-check-label">
						    <input type="radio" class="form-check-input" name="gender" value="남자" ${vo.gender=='남자' ? 'checked' : ''} >남자
						  </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" name="gender" value="여자" ${vo.gender=='여자' ? 'checked' : ''}>여자
					 </label>
					</div>
  				  </div>
	              <div class="mb-3">
	              	<label class="form-outline mb-2"><b>관심분야 :</b></label>&nbsp;&nbsp;
		                <select class="select" name="interest" value="${vo.interest}">
		                  <option ${vo.interest=='1' ? 'selectecd' : ''} >선택</option>
		                  <option ${vo.interest=='자기계발' ? 'selected' : ''}>자기계발</option>
		                  <option ${vo.interest=='IT' ? 'selected' : ''}>IT</option>
		                  <option ${vo.interest=='인문/사회' ? 'selected' : ''}>인문/사회</option>
		                  <option ${vo.interest=='자연/과학' ? 'selected' : ''}>자연/과학</option>
		                  <option ${vo.interest=='요리' ? 'selected' : ''}>요리</option>
		                  <option ${vo.interest=='에세이' ? 'selected' : ''}>에세이</option>
		                  <option ${vo.interest=='경제' ? 'selected' : ''}>경제</option>
		                  <option ${vo.interest=='예술' ? 'selected' : ''}>예술</option>
		                  <option ${vo.interest=='기타' ? 'selected' : ''}>기타</option>
		                </select>
	              </div>
	              <div class="form-group">
     				 <div class="form-check-inline">
	       				 <span><b>정보공개 : </b></span>  &nbsp; &nbsp; 
						  <label class="form-check-label">
					  	  <input type="radio" class="form-check-input" name="userInfor" value="공개" ${vo.userInfor=='공개'  ? 'checked' : ''}/>공개
				 		 </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
			  			  <input type="radio" class="form-check-input" name="userInfor" value="비공개" ${vo.userInfor=='비공개'  ? 'checked' : ''}/>비공개
			  		  </label>
					</div>
    			</div>
	              <div id="btnWrapper">
		              <button style="margin-right: 10px" type="button" class="btn btn-success btn-md mb-1" onclick="fCheck()">정보수정</button>
		              <button style="margin-right: 10px"type=button class="btn btn-success btn-md mb-1" onclick="location.href='${ctp}/member/Mypage';">취소</button>
		              <button type="reset" class="btn btn-success btn-md mb-1">다시작성</button>
	              </div>
	            </form>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  </section>
</body>
<footer>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</footer>
</html>
