<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Analysis.jsp</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	.wrapper {
		margin-left: 100px;
		font-size: 17px;
		line-height:25px;
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
		line-height:25px;
		border: none;
		border-radius: 5px;
		background-color: #f0e5f0;
		width: 600px;
		height: auto;
		padding: 10px 10px;
		font-family: serif;
	}
	#back { 
		width: 100%;
		margin-bottom: 100px;
	}
	div h4 { text-align: center;}
</style>
<script>
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	  var data = google.visualization.arrayToDataTable([
		  ['Task', 'Hours per Day'],
		  <c:forEach var="i" begin="0" end="${bVos.size()-1}">
	       	["${bVos[i].bookType}", ${bVos[i].bcnt}],
	      </c:forEach>
	  ]);
	
	  var options = {
	    is3D: true,
	  };
	
	  var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	  chart.draw(data, options);
	}
	
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

      var data = google.visualization.arrayToDataTable([
	        ['City', '회원들의 총 도서횟수'],
      	<c:forEach var="i" begin="0" end="${mVos.size()-1}">
	        ['${mVos[i].bookType}', ${mVos[i].ocnt}],
        </c:forEach>
      ]);

      var options = {
        chartArea: {width: '50%'},
        hAxis: {
          title: '도서 횟수',
          minValue: 0,
          maxValue: 100
        },
        vAxis: {
          title: '도서 분야'
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
	
	google.charts.load('current', {'packages':['table']});
    google.charts.setOnLoadCallback(drawTable);

    function drawTable() {
      var data = new google.visualization.DataTable();
      
      data.addColumn('string', '도서 이름');
      data.addColumn('number', '완독 수');
      data.addRows([
    	<c:forEach var="i" begin="0" end="${fVos.size()-1}">
        	['${fVos[i].bookName}',  {v: ${fVos[i].rcnt}, f: '${fVos[i].rcnt}'}],
        </c:forEach>
      ]);

      var table = new google.visualization.Table(document.getElementById('table_div'));

      table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
    }
</script>
</head>
<body>
<div class="container"><br/><br/>
<h4><b>비즈니스 분석</b></h4><hr/>
<div style="font-size: 18px;"><b>밀리의 서재 분야별 도서 보유량</b></div>
	<div id="piechart_3d" style="width: 900px; height: 350px;"></div>
	    <div class="wrapper">
			<c:forEach var="i" begin="0" end="${bVos.size()-1}">
				${i+1}. ${bVos[i].bookType}&nbsp;<b>${bVos[i].bcnt}</b> 권<br/>
			</c:forEach>
		</div><br/><hr/>
<div style="font-size: 18px;"><b>분야별 회원들 총 도서횟수</b></div>
	 <div id="chart_div" style="width: 900px; height: 350px;"></div>
		 <div class="wrapper2">
			<c:forEach var="i" begin="0" end="${mVos.size()-1}">
				${i+1}. ${mVos[i].bookType}&nbsp;<b>${mVos[i].ocnt}</b> 권<br/>
			</c:forEach>
		</div><br/><hr/>
<div style="font-size: 18px;"><b>완독수 TOP 10</b></div><br/>	
	<div id="table_div" style="height: 200px; font-size: 17px;"></div><br/><hr/>
<input type="button" value="돌아가기" onclick="location.href='${ctp}/admin/Adminpage';" class="btn btn-info" id="back"/>
</div>
</body>
</html>