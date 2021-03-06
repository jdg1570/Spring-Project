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
         font-family: '?????? ??????';
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
                <span style="color: yellow;">?????????, ????????????,</span><br/> <span style="color: white;">???????????? ??? ?????????... </span><br/><span style="color: yellow;">9,900????</span>
            </div>
            <img src="${ctp}/images/??????.jpg" id="img1">
        </section>
        <section id="sec2">
            <div>
                <img src="${ctp}/images/millie3.png" id="img2">
            </div>
        </section>
        <section id="sec6">
        	<div style="width: 85%; margin-left: 10%;" class="text-center">
		        <div id="txt5">
		        	<p style="font-size: 45px; font-weight: bolder; font-family: Arial Bolder;">????????? ???????????? <br/>???????????? ?????? 3??????</p>
		        	<p style="font-size: 22px; color: #6E6E6E; ma">???????????? ???????????? <br/>??? ??? ?????? ????????? ?????? ??? ???????????????</p>
		        </div><br/>
		        <div style="float: left; margin-left: 10%; text-align: center;">
		        	<img src="${ctp}/images/web.png" style="width: 120px; height: 120px; margin-bottom: 10px;">
		        	<p style="font-weight: bolder; font-size: 20px; margin-bottom: 8px;">?????? ???????????? ?????? ?????????</p>
		        	<p style="font-size: 14px; color: gray;">?????????????????????, PC????????? <br/>?????? ???????????? ????????? ????????? ????????????</p>
		        </div>
		        <div style="float: left; margin-left: 10%; text-align: center;">
		        	<img src="${ctp}/images/eye.png" style="width: 120px; height: 120px; margin-bottom: 10px;">
		        	<p style="font-weight: bolder; font-size: 20px; margin-bottom: 8px;">?????? ?????????, ????????? ??? ?????????????</p>
		        	<p style="font-size: 14px; color: gray;">????????????, ?????????, ???????????? ????????????!<br/>?????? ?????? ????????? ??????????????????</p>
		        </div>
		        <div style="float: left; margin-left: 10%; text-align: center;">
		        	<img src="${ctp}/images/memo.png" style="width: 120px; height: 120px; margin-bottom: 10px;">
		        	<p style="font-weight: bolder; font-size: 20px; margin-bottom: 8px;">?????? ????????? ?????? ?????? ??????</p>
		        	<p style="font-size: 14px; color: gray;">???????????? ?????? ????????? ??????, ????????? ??????<br/>????????? ??????????????? ??????????????????</p>
		        </div>
	        </div>
        </section>
        <section id="sec3">
            <div id="txt2">
                ????????? ???????????? <br>
                100,000?????? ??????<br/>
            </div>
            <div id="txt3">
                ??? ??? ?????? ????????? ?????? <br/>?????? ????????? ????????? ??????????????????
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
	        		???????????? <br/>
	        		?????? ?????? ?????????<br/>
		        	<p style="color: #6E6E6E; font-family: sans-serif; text-shadow: black; font-size: 22px; margin-top: 20px;">?????? ????????? ????????????</p>
		        	<p style="color: #6E6E6E; font-family: sans-serif; text-shadow: black; font-size: 22px">???????????? ????????????!</p>
	        	</div><br/>
	        </div>
        </section>
        
        <section id="sec5">
            <p id="question">?????? ?????? ??????</p>
            <div id="qnaWrapper">
                <div class="menu">????????? ?????? ????????? ?????????? </div>
                <div class="answer"><br/>???????????????. ?????? ??? ????????? ???????????? ??? ????????? ?????? ??????????????? ?????? ????????? ????????? ?????????.<br/>
                    [?????? > ?????? > ???????????? > ?????? ?????? ??????] ?????? ?????? ????????? ????????????,<br/>
                    ????????? ????????? ?????? ??????????????? ????????? ?????????.<br/><br/></div><br/>

                <div class="menu">????????? ?????? ??? ??? ?????????? ???????????? ?????????? </div>
                <div class="answer"><br/>????????? ?????? ???????????? ????????? ????????? ?????? ???????????? ???????????? ??? ????????????.<br/>
                    [?????? > ?????? > ???????????? > ???????????? ??????] ????????? ?????? ????????? ???????????? ?????? ????????????.<br/><br/></div><br/>

                <div class="menu">??? ??? ?????? ????????? ????????? ?????? ??? ?????????? </div>
                <div class="answer"><br/>???, ?????? ??????????????? ???!???!???! ??? ???????????? ?????? ??? 1??? ???????????????.<br/>
                    ?????? ???????????? ??????????????? ?????? ?????????????????? ????????? ?????? ?????????.<br/><br/></div><br/>
                <div class="menu">?????? ???????????? ????????? ??? ?????????? <br/><br/></div>
                <div class="answer"><br/>?????? ????????? ???????????? ????????? ????????? ??? ????????????.<br/><br/>

                    - ????????? / ????????? : iOS11, Android 6 ?????? ??????<br/>
                    - PC : Mac Yosemite, Window 10 ?????? ??????<br/>
                    - E ink : Android 4.4 ?????? ??????<br/>
                    (????????? ?????????, ????????? ?????????G, ????????????????????? ?????? ?????? ??????, ?????? Sam 7.8 ???)???4<br/><br/></div>
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
	// 1???
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
	
	// 2???
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
	
	// 3???
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
	
	
	// ????????? ???????????? ??????
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