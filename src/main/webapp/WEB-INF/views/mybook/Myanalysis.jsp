<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Myanalysis.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%@ include file="/WEB-INF/views/include/mybook.jsp" %>
<style>
	.wrapper {
		margin-left: 100px;
		font-size: 17px;
		line-height:30px;
		border: none;
		border-radius: 5px;
		background-color: #f0e5f0;
		width: 450px;
		height: auto;
		padding: 10px 10px;
		font-family: serif;
	}
	.wrapper2 {
		margin-left: 100px;
		font-size: 17px;
		line-height:30px;
		border: none;
		border-radius: 5px;
		background-color: #f0e5f0;
		width: 650px;
		height: auto;
		padding: 10px 10px;
		font-family: serif;
		margin-bottom: 100px;
	}
</style>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript">
   google.charts.load("current", {packages:["corechart"]});
   google.charts.setOnLoadCallback(drawChart);
   
   function drawChart() {
	   var data = google.visualization.arrayToDataTable([
	       ['Task', 'Hours per Day'],
		       <c:forEach var="i" begin="0" end="${items.size()-1}">
		       	["${items[i].bookType}", ${items[i].cnt}],
		       </c:forEach>
	     ]);

     var options = {
       pieHole: 0.4,
     };

     var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
     chart.draw(data, options);
   }
    
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawBasic);

    function drawBasic() {
    	
	    var data = new google.visualization.DataTable();
	    data.addColumn('timeofday', 'Time of Day');
	    data.addColumn('number', '?????? ??????');
	
	    data.addRows([
	        <c:forEach var="i" begin="0" end="12" varStatus="st">
		    	[{v: [${i+9}, 0, 0], f: '${i+9} am'}, ${pcnts[i]}],
	        </c:forEach>
	    ]);
	
	    var options = {
	      hAxis: {
	        title: '??????',
	        format: 'h:mm a',
	        viewWindow: {
	          min: [8, 30, 0],
	          max: [21, 30, 0]
	        }
	      },
	      vAxis: {
	        title: '?????? ??????(??????)',
	        viewWindow: {
	        	min: [0],
	        	max: [10]
	        }
	      }
	    };
	
	    var chart = new google.visualization.ColumnChart(
	      document.getElementById('chart_div'));
	
	    chart.draw(data, options);
	  }
 </script>
</head>
<body>
<div class="container"><br/>
	<div style="margin-left: 30px;">
	<div style="font-size: 18px;"><b>??? ?????? ??????</b></div>
	<div id="donutchart" style="width: 800px; height: 400px;"></div>
		<div class="wrapper">
			<c:forEach var="i" begin="0" end="${items.size()-1}">
				${i+1}. ${items[i].bookType}&nbsp;<b>${items[i].cnt}</b> ???<br/>
			</c:forEach>
		</div><br/><br/><hr/>
	
	<div style="font-size: 18px;"><b>?????? ??????</b></div>
	<div id="chart_div" style="width: 900px; height: 400px;"></div>
		<div class="wrapper2">
			<c:forEach var="vo" items="${bdate}">
				<b><c:if test="${vo.bday ==1}">?????????</c:if></b>
				<b><c:if test="${vo.bday ==2}">?????????</c:if></b>
				<b><c:if test="${vo.bday ==3}">?????????</c:if></b>
				<b><c:if test="${vo.bday ==4}">?????????</c:if></b>
				<b><c:if test="${vo.bday ==5}">?????????</c:if></b>
				<b><c:if test="${vo.bday ==6}">?????????</c:if></b>
				<b><c:if test="${vo.bday ==7}">?????????</c:if></b>
				??? ?????? ?????? ??????,<br/>
			<b>${ptimes[0].ptime}</b> ?????? ?????? ????????????
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>