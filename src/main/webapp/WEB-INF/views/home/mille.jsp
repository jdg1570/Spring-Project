<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mille.jsp</title>
 <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<style>
	#logo1 {
         margin: 3px;
         width: 150px;
         height: 40px;
         border-radius: 20px;
         margin: 10px;
     }
     #btn1 {
         border-radius: 25px;
         float: right;
         margin-right: 25px;
         margin-top: 14px;
         width: 80px;
         height: 30px;
         border: none;
         font-size: 13px;
         background-color: #F3F781;
     }
     header {
         height: 60px;
         background-color: rgb(182, 175, 165);
         position: sticky;
         top: 0px;
         transition: opacity 1s;
         border-bottom: 1px solid white;
     }
     #sec1 {
         background-color: rgb(182, 175, 165);
         height: 400px;
     }
     #sec2 {
         background-color: rgb(143, 136, 128);
         height: 300px;
     }
     #sec3 {
         height: 300px;
     }
     #sec4 {
         height: 460px;
         text-align: right;
         background: linear-gradient(rgb(268, 238, 120),white);
         margin-top: 120px;
     }
     #sec5 {
         height: 600px;
         background-color: rgb(258, 258, 120);
         margin: 0 auto;
     }
     #sec6 {
     	height: 600px;
     	background-color: #F2F2F2;
     }
     #txt1 {
         font-size: 45px;
         font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
         float: left;
         margin-left: 80px;
         margin-top: 80px;   
         display: none;
     }
     #txt2 {
         font-size: 50px;
         font-weight: bolder;
         text-align: center;
         margin-top: 100px;
         margin-bottom: 25px;
     }
     #txt3 {
         font-size: 20px;
         text-align: center;
         color: #6E6E6E;
     }
     #txt4 {
     	padding-top: 60px;
     	padding-right: 200px;
     	display: none;
     }
     #txt5 {
     	text-align: center;
     	padding-top: 50px;
     	display: none;
     }
     #img1 {
         position: relative;
         border-radius: 15px;
         width: 27%;
         height: 500px;
         float: right;
         margin-top: 100px;
         margin-right: 120px;
         opacity: 0.9;
     }
     #img2 {
         width: 23%;
         height: 250px;
         margin-top: 25px;
         margin-left: 80px;
         border-radius: 20px;
     }
     .content, .content2, .content3 {
         position: relative;
         margin: 0 auto;
         width: 1225px;
         height: 200px;
         left: 0;
         overflow: hidden;
     }
     .slides {
         position: absolute;
         left: 0;
         top: 0;
         list-style: none;
         width: 2625px;
         transition: left 0.5s ease-out;
     }
     .slides2 {
         position: absolute;
         left: 0;
         top: 0;
         list-style: none;
         width: 2975px;
         transition: left 0.5s ease-out;
     }
     .slides3 {
         position: absolute;
         left: 0;
         top: 0; 
         list-style: none;
         width: 2275px;
         transition: left 0.5s ease-out;
     }
     .slides li, .slides2 li, .slides3 li{
         float: left;
     }
     .slides li:not(:last-child) {
         margin-right: 25px;
     }
     
     .slides2 li:not(:last-child) {
         margin-right: 25px;
     }
     
     .slides3 li:not(:last-child) {
         margin-right: 25px;
     }
     footer {
         width: 100%;
         height: 250px;
         background-color: rgb(238, 250, 190);
     }
     #question {
         text-align: center;
         padding-top: 50px;
         font-size: 45px;
         font-weight: bolder;
         font-family: fantasy;
     }
     .menu {
         font-size: 20px;
         font-weight: bolder;
         font-family: Arial, Helvetica, sans-serif;
         width: 850px;
         height: 55px;
         background-color: white;
         margin: 0 auto;
         border-radius: 20px;
         text-align: left;
         padding-left: 25px;
         padding-top: 13px;
         cursor: pointer;
         border: none;
         transition: 0.4s;
     }
     .menu:hover {
         border-radius: 20px 20px 0 0;
         border-bottom: 0.5px solid black;
     }
     
     .arrow {
         text-align: right;
     }
     #sec4Wrapper {
     	margin-left: 800px;
     }
     
     #qnaWrapper {
         text-align: center;
         width: 850px;
         margin: 0 auto;
     }
     .answer {
         text-align: left;
         background-color: white;
         max-height: 0;
         overflow: hidden;
         transition: max-height 0.2s ease-out;
         border-radius: 0 0 20px 20px;
         font-size: 14px;
         padding: 0 15px;
     }
     #bottom {
         margin-left: 40px;
         padding-top: 20px;
         font-family: '나눔 고딕';
     }
</style>
</head>
<body>
<div id="container">
        <header id="head">
        	<%@ include file="/WEB-INF/views/include/header.jsp" %>
        </header>
        <section id="sec1">
            <div id="txt1">
                <span style="color: yellow;">전자책, 오디오북,</span><br/> <span style="color: white;">장르까지 이 모든게... </span><br/><span style="color: yellow;">9,900원?</span>
            </div>
            <img src="${ctp}/images/정석.jpg" id="img1">
        </section>
        <section id="sec2">
            <div>
                <img src="${ctp}/images/millie3.png" id="img2">
            </div>
        </section>
        <section id="sec6">
        	<div style="width: 85%; margin-left: 10%;" class="text-center">
		        <div id="txt5">
		        	<p style="font-size: 45px; font-weight: bolder; font-family: Arial Bolder;">밀리가 알려주는 <br/>전자책의 장점 3가지</p>
		        	<p style="font-size: 22px; color: #6E6E6E; ma">전자책과 함께라면 <br/>좀 더 멋진 일상을 만들 수 있을거에요</p>
		        </div><br/>
		        <div style="float: left; margin-left: 10%; text-align: center;">
		        	<img src="${ctp}/images/web.png" style="width: 120px; height: 120px; margin-bottom: 10px;">
		        	<p style="font-weight: bolder; font-size: 20px; margin-bottom: 8px;">언제 어디서든 쉽고 빠르게</p>
		        	<p style="font-size: 14px; color: gray;">스마트폰에서도, PC에서도 <br/>언제 어디서든 나만의 독서를 즐기세요</p>
		        </div>
		        <div style="float: left; margin-left: 10%; text-align: center;">
		        	<img src="${ctp}/images/eye.png" style="width: 120px; height: 120px; margin-bottom: 10px;">
		        	<p style="font-weight: bolder; font-size: 20px; margin-bottom: 8px;">눈만 아프고, 집중은 잘 안된다고?</p>
		        	<p style="font-size: 14px; color: gray;">글씨크기, 줄간격, 배경색도 내맘대로!<br/>눈이 편한 독서를 시작해보세요</p>
		        </div>
		        <div style="float: left; margin-left: 10%; text-align: center;">
		        	<img src="${ctp}/images/memo.png" style="width: 120px; height: 120px; margin-bottom: 10px;">
		        	<p style="font-weight: bolder; font-size: 20px; margin-bottom: 8px;">쉽고 빠르게 쌓는 독서 기록</p>
		        	<p style="font-size: 14px; color: gray;">기억하고 싶은 문장은 밑줄, 생각은 메모<br/>나만의 독서노트를 만들어보세요</p>
		        </div>
	        </div>
        </section>
        <section id="sec3">
            <div id="txt2">
                당신을 기다리는 <br>
                100,000권의 도서<br/>
            </div>
            <div id="txt3">
                첫 달 무료 구독을 통해 <br/>어떠 도서가 있는지 확인해보세요
            </div>
        </section><hr/>
        <div class="content">
           <%@ include file="/WEB-INF/views/include/slide.jsp" %>
        </div><br/>
        <div class="content2">
          <%@ include file="/WEB-INF/views/include/slide2.jsp" %>
        </div><br/>
        <div class="content3">
          <%@ include file="/WEB-INF/views/include/slide3.jsp" %>
        </div><hr/>
        <section id="sec4">
	        <div style="float: left; margin-left: 20%; margin-top: -40px; margin-right: 10%;">
	        	<iframe width="550" height="400" src="https://www.youtube.com/embed/c-XG8k_w1LM?controls=0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	        </div>
	        <div id="sec4Wrapper">
	        	<div id="txt4" style="font-size: 40px; font-weight: bolder; font-family: Arial Black; text-align: left;">
	        		내돈내산 <br/>
	        		밀리 구독 이야기<br/>
		        	<p style="color: #6E6E6E; font-family: sans-serif; text-shadow: black; font-size: 22px; margin-top: 20px;">패션 브랜드 대표부터</p>
		        	<p style="color: #6E6E6E; font-family: sans-serif; text-shadow: black; font-size: 22px">고등학교 교사까지!</p>
	        	</div><br/>
	        </div>
        </section>
        
        <section id="sec5">
            <p id="question">자주 묻는 질문</p>
            <div id="qnaWrapper">
                <div class="menu">안쓰면 정말 환불해 주나요? </div>
                <div class="answer"><br/>물론입니다. 결제 후 콘텐츠 다운로드 및 열람을 하지 않으셨다면 전액 환불해 드리고 있어요.<br/>
                    [밀리 > 관리 > 구독관리 > 결제 내역 확인] 에서 직접 환불이 가능하며,<br/>
                    해결이 어려운 경우 고객센터로 문의해 주세요.<br/><br/></div><br/>

                <div class="menu">구독중 해지 할 수 있나요? 수수료는 없나요? </div>
                <div class="answer"><br/>다음달 부터 결제되지 않도록 수수료 없이 언제든지 해지하실 수 있습니다.<br/>
                    [밀리 > 관리 > 구독관리 > 자동결제 해지] 메뉴를 통해 기간에 상관없이 직접 가능해요.<br/><br/></div><br/>

                <div class="menu">첫 달 무료 헤택은 누구나 받을 수 있나요? </div>
                <div class="answer"><br/>네, 밀리 회원이라면 누!구!나! 첫 정기구독 신청 시 1회 제공됩니다.<br/>
                    아직 신청하지 않으셨다면 바로 구독신청으로 혜택을 받아 보세요.<br/><br/></div><br/>
                <div class="menu">어떤 기기에서 사용할 수 있나요? <br/><br/></div>
                <div class="answer"><br/>아래 기기와 버전에서 밀리를 사용할 수 있습니다.<br/><br/>

                    - 휴대폰 / 태블릿 : iOS11, Android 6 이상 지원<br/>
                    - PC : Mac Yosemite, Window 10 이상 지원<br/>
                    - E ink : Android 4.4 이상 지원<br/>
                    (크레마 그랑데, 크레마 카르타G, 이노스페이스원 공식 판매 기기, 교보 Sam 7.8 등)용4<br/><br/></div>
            </div>
        </section>
    </div>
</body>
<footer>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</footer>
</html>
	<script>
	$(document).ready(function(){
	    $('#txt1').fadeIn(3500);
	}); 
	
	$(document).ready(function(){
	    $('#txt4').fadeIn(4500);
	}); 
	
	$(document).ready(function(){
	    $('#txt5').fadeIn(4500);
	}); 
	
	var scrollmove = window.pageYOffset;
	window.onscroll = headToggle;
	function headToggle(){
	    var head = document.getElementById("head");
	
	    var currentScroll = window.pageYOffset;
	    if(scrollmove <  currentScroll) {
	        head.style.opacity = 0.3;
	        
	    }
	    else {
	        head.style.opacity = 1;
	    }
	}
	// 1번
	var slides = document.getElementById("sls");
	var slide = document.getElementsByClassName("item");
	var currentIdx = 0;
	var slideCount = slide.length;
	var preBtn = document.getElementById("prev");
	var nextBtn = document.getElementById("next");
	
	function moveSlide(num) {
	    slides.style.left = (-num * 180) + 'px';
	    currentIdx = num;
	}
	var timer = undefined;
	
	function autoSlide() {
	    if(timer == undefined) {
	        timer = setInterval(function(){
	            moveSlide(currentIdx +0.07);
	        }, 320);
	    }
	}
	autoSlide();
	function stopSlide() {
	    clearInterval(timer);
	    timer = undefined;
	}
	
	slides.addEventListener('mouseenter', function(){
	    stopSlide();
	});
	slides.addEventListener('mouseleave', function(){
	    autoSlide();
	});
	
	// 2번
	var slides2 = document.getElementById("sls2");
	var slide2 = document.getElementsByClassName("item2");
	var currentIdx2 = 0;
	var slideCount2 = slide2.length;
	var preBtn2 = document.getElementById("prev");
	var nextBtn2 = document.getElementById("next");
	
	function moveSlide2(num) {
	    slides2.style.left = (-num * 180) + 'px';
	    currentIdx2 = num;
	}
	var timer2 = undefined;
	
	function autoSlide2() {
	    if(timer2 == undefined) {
	        timer2 = setInterval(function(){
	            moveSlide2(currentIdx2 + 1);
	        }, 3300);
	    }
	}
	autoSlide2();
	function stopSlide2() {
	    clearInterval(timer2);
	    timer2 = undefined;
	}
	
	slides2.addEventListener('mouseenter', function(){
	    stopSlide2();
	});
	slides2.addEventListener('mouseleave', function(){
	    autoSlide2();
	});
	
	// 3번
	var slides3 = document.getElementById("sls3");
	var slide3 = document.getElementsByClassName("item3");
	var currentIdx3 = 0;
	var slideCount3 = slide3.length;
	var preBtn3 = document.getElementById("prev");
	var nextBtn3 = document.getElementById("next");
	
	function moveSlide3(num) {
	    slides3.style.left = (-num * 180) + 'px';
	    currentIdx3 = num;
	}
	var timer3 = undefined;
	
	function autoSlide3() {
	    if(timer3 == undefined) {
	        timer3 = setInterval(function(){
	            moveSlide3(currentIdx3 + 0.05);
	        }, 300);
	    }
	}
	autoSlide3();
	function stopSlide3() {
	    clearInterval(timer3);
	    timer3 = undefined;
	}
	
	slides3.addEventListener('mouseenter', function(){
	    stopSlide3();
	});
	slides3.addEventListener('mouseleave', function(){
	    autoSlide3();
	});
	
	
	// 비회원 자주찾는 질문
	var acc = document.getElementsByClassName("menu");
	var i;
	
 	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("mouseenter", function() {
		    this.classList.toggle("active");
		    var answer = this.nextElementSibling;
		    if (answer.style.maxHeight) {
		    answer.style.maxHeight = null;
		    } else {
		    answer.style.maxHeight = answer.scrollHeight + "px";
		    } 
		});
	} 
 	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("mouseleave", function() {
		    this.classList.toggle("close");
		    var answer = this.nextElementSibling;
		    if (answer.style.maxHeight) {
		    answer.style.maxHeight = null;
		    } else {
		    answer.style.maxHeight = answer.scrollHeight + "px";
		    } 
		});
	} 
	</script>