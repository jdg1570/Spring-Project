<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String sToday = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
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
	var idCheckOn = 0;
	var nickCheckOn = 0;
	
    function idCheck() {
    	var mid = $("#mid").val();
    	if(mid=="" || $("#mid").val().length<4 || $("#mid").val().length>20) {
    		alert("아이디를 체크하세요!(아이디는 4~20자 이내로 사용하세요.)");
    		myform.mid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/member/IdCheck",
    		data : {mid : mid},
    		success:function(data) {
    			if(data == "1") {
    				alert("이미 사용중인 아이디 입니다.");
    				$("#mid").focus();
    			}
    			else {
    				alert("사용 가능한 아이디 입니다.");
    				idCheckOn = 1;	
    				myform.mid.readOnly=true;
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    function nickCheck() {
    	var nickName = $("#nickName").val();
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
    				nickCheckOn = 1;	// 닉네임 검색버튼을 클릭한경우는 nickCheckOn값이 1이 된다.
    				myform.nickName.readOnly = true;
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }

	function fCheck() {
		var mid = myform.mid.value;
    	var pwd = myform.pwd.value;
    	var pwdCheck = myform.pwdCheck.value;
    	var nickName = myform.nickName.value;
    	var name = myform.name.value;
    	var email = myform.email.value;
    	var tel = myform.tel.value;
    	
    	let regex1 = /\s/gm;
    	let regMid = /[^0-9a-zA-Z]/gm;
    	let regPwd = /[!@#$%^&*()]/gm;
    	let regName = /[^가-힣a-zA-Z]/gm;
    	let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    	let regTel = /[^0-9]/gm;
    	
    	if(mid == "") {
    		alert("아이디를 입력하세요");
    		myform.mid.focus();
    	}
    	else if(regMid.test(mid)) {
    		alert("아이디는 영문/숫자만 가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(pwd == "") {
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
    		return false;
    	}
    	else if(pwdCheck != pwd) {
    		alert("비밀번호가 일치하지 않습니다.");
    		myform.pwdCheck.focus();
    		return false;
    	}
    	else if(nickName == "") {
    		alert("닉네임을 입력하세요");
    		myform.nickName.focus();
    		return false;
    	}
    	else if(regex1.test(nickName)) {
    		alert("닉네임에 공백이 존재합니다");
    		myform.nickName.select();
    		return false;
    	}
    	else if(email == "") {
    		alert("이메일을 입력하세요");
    		myform.email.focus();
    		return false;
    	}
    	else if(!regEmail.test(email)) {
    		alert("이메일을 확인하세요");
    		myform.email1.focus();
    		return false;
    	}
    	else if(name == "") {
    		alert("성명을 입력하세요");
    		myform.name.focus();
    		return false;
    	}
    	else if(regName.test(name)) {
    		alert("성명은 한글/영문만 가능합니다.");
    		myform.name.focus();
    		return false;
    	}
    	else if(regTel.test(tel)) {
    		alert("연락처는 숫자만 입력가능합니다.");
    		myform.tel.focus();
    		return false;
    	}
    	else {
	    		if(idCheckOn == 1 && nickCheckOn == 1) {
    			var postcode = myform.postcode.value;
    			var roadAddress = myform.roadAddress.value;
    			var detailAddress = myform.detailAddress.value;
    			var extraAddress = myform.extraAddress.value;
    			var address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress
    			if(address=="///") address = "";
    			myform.address.value = address;
    				
    			myform.submit();
    		}
    		else {
    			if(idCheckOn != 1) {
    				alert("아이디 중복체크를 해주세요");
	    			return false;
    			}
    			else {
    				alert("닉네임 중복체크를 해주세요");
    				return false;
    			}
    		}
    	}
    }
</script>
</head>
<body>
	<section class="h-100 h-custom" style="background-color: #8fc4b7;">
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col-lg-8 col-xl-6">
	        <div class="card rounded-3">
	          <img src="${ctp}/images/mille4.png" class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;">
	          <div class="card-body ">
	            <h4 class="text-center">회원가입</h4><br/>
	            <form class="px-md-3" name="myform" method="post">
	              <div class="form-outline mb-2">
	                <label class="form-label"><b>아이디</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder" >*</span>&nbsp;&nbsp;<input type="button" value="중복체크" class="btn btn-success btn-sm" onclick="idCheck()"></label>
	                <input type="text" name="mid" id="mid" class="form-control"  placeholder="영문/숫자" required autofocus />
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
	                <input type="text" name="nickName" id="nickName" class="form-control"  required/>
	              </div>
	              <div class="form-group">
				      <label for="email"><b>이메일</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder">*</span></label>
						<div class="input-group mb-3">
						  <input type="text" class="form-control" placeholder="이메일입력" id="email" name="email" required/>
						</div>
					</div>
	              <div class="form-outline mb-3">
	                <label class="form-label" ><b>성명</b>&nbsp;&nbsp;<span style="color:red; font-weight: bolder">*</span></label>
	                <input type="text" name="name" class="form-control" required placeholder="한글/영문만 가능"/>
	              </div>
	              <hr/>
	              <div class="form-outline mb-3">
	                <label class="form-label" ><b>연락처</b></label>
	                <input type="text" name="tel" class="form-control" placeholder="(-)없이 입력" maxlength=11/>
	              </div>
		          <div class="form-group">
				    <label class="form-label"><b>주소</b></label><br/>
				    <input type="hidden" class="form-control" name="address"/>
				    <input type="text" name="postcode" class="mb-2" id="sample4_postcode" placeholder="우편번호">&nbsp;
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text"  class="mb-2" name="roadAddress" id="sample4_roadAddress" size="50" placeholder="도로명주소">
						<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="mb-2" name="detailAddress" id="sample4_detailAddress" size="30" placeholder="상세주소">
						<input type="text" name="extraAddress" id="sample4_extraAddress" placeholder="나머지 주소">
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
			        <span><b>성별 :</b></span> &nbsp; &nbsp;
						<label class="form-check-label">
						    <input type="radio" class="form-check-input" name="gender" value="남자" checked>남자
						  </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" name="gender" value="여자">여자
					 </label>
					</div>
  				  </div>
	              <div class="mb-3">
	              	<label class="form-outline mb-2"><b>관심분야 :</b></label>&nbsp;&nbsp;
		                <select class="select" name="interest">
		                  <option value="" >선택</option>
		                  <option value="자기계발">자기계발</option>
		                  <option value="IT">IT</option>
		                  <option value="인문/사회">인문/사회</option>
		                  <option value="자연/과학">자연/과학</option>
		                  <option value="요리">요리</option>
		                  <option value="에세이">에세이</option>
		                  <option value="경제">경제</option>
		                  <option value="예술">예술</option>
		                  <option value="기타">기타</option>
		                </select>
	              </div>
	              <div class="form-group">
     				 <div class="form-check-inline">
	       				 <span><b>정보공개 : </b></span>  &nbsp; &nbsp; 
						  <label class="form-check-label">
					  	  <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
				 		 </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
			  			  <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
			  		  </label>
					</div>
    			</div>
	              <div id="btnWrapper">
		              <button style="margin-right: 10px" type="button" class="btn btn-success btn-md mb-1" onclick="fCheck()">회원가입</button>
		              <button style="margin-right: 10px"type="button" class="btn btn-success btn-md mb-1" onclick="location.href='${ctp}/member/Login';">취소</button>
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
</html>
