<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>SAFE FOOD</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
			// Load the Visualization API and the corechart package.
			google.charts.load('current', {'packages':['corechart']});
					
			// Set a callback to run when the Google Visualization API is loaded.
			google.charts.setOnLoadCallback(drawChart);
					
			// Callback that creates and populates a data table,
			// instantiates the pie chart, passes in the data and
			// draws it.

			function drawChart() {
				var data = google.visualization.arrayToDataTable([
					['Task', 'Hours per Day'],
					['나트륨', ${fooddetail.salt}/1000],
					['탄수화물', ${fooddetail.carbohydrate}],
					['당류', ${fooddetail.sugars}],
					['콜레스테롤', ${fooddetail.cholesterol}],
					['지방', ${fooddetail.fat}],
					['단백질', ${fooddetail.protein}],
					['포화 지방산', ${fooddetail.fatty_acid}],
					['트렌스지방', ${fooddetail.trans_fat}]
					]);
					
			// Set chart options
			var options = {'title':'영양 정보', colors: ['#F8CBCC', '#CAE8FB', '#FFE799', '#B5D8B5', '#E9CCE9', '#F5D6B9']};
					
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			}
			
			$(window).resize(function(){
				  drawChart();
				});
			$(function(){
				$('#_eatbtn').click(function() {
					var _quan = $("#_quantity").val();
					var st=" 입력하세요!";
					if($('#_quantity').val()==''){
						_quan = 1;
					}else{
						checkeat("${foodinfo.food_code}","${sessionScope.login.user_code}",_quan);
					}
				});
			
			});
			function checkeat(f_code, u_code,quan) {
				$.ajax({
					type: "POST",
					url: "./checkEat.do",
					async: true,
					data:
					{
						"food_code" : f_code,
						"user_code" : u_code,
					},
					success: function(u) {
						if(u==0){
							addeat(f_code,u_code,quan);
						}else{
							alert("이미 섭취한 식품입니다.");
						}
					}
				});
			};
			function addeat(f_code, u_code,quan) {
				$.ajax({
					type: "POST",
					url: "./addEat.do",
					async: true,
					data:
					{
						"food_code" : f_code,
						"user_code" : u_code,
						"quantity" : quan
					},
					success: function(u) {
						if(u.state == "success"){
							alert("등록 성공");
						}else{
							alert("등록 실패");
						}
					}
				});
			};
			
   		</script>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
<jsp:include page="./share/header.jsp"/>
				<!-- Main -->
				<div id="main">
					<div class="inner">
						<h1>${food.name }</h1>
					</div>
				</div>
				<br/>
				<br/>
				<div id="mainPage">
					<div class="inner">
						<section>
							<div class="row gtr-uniform">						
								<div class="col-4">
									<span class="image fit">
										<img src="${foodinfo.food_img}" alt="">
									</span>
								</div>
								<div class="col-8">
									<div class="table-wrapper">
									
		<table class="producttable">
    		<tbody>
    		<tr>
    		<td width="30%">상품명</td>
    		<td width="70%">${foodinfo.food_name}</td>
    		</tr>
    		<tr>
    			<td width="30%">제조사</td>
    			<td width="70%">${foodinfo.food_maker}</td>
    		</tr>
    		<tr>
    			<td>원재료</td>
    			<td>${foodinfo.food_material}</td>
    		</tr>
    		<tr>
    			<td>알레르기성분</td>
    			<td >
    			
    			<c:set var = "ual" value="${sessionScope.login.user_allergy}"/>
    			<c:forEach items="${allergy}" var="fal" varStatus="vs" >
    			<c:choose>
					<c:when test="${fn:contains(ual,fal)}">
						<span style="color: red">${fal} &nbsp;</span>
					</c:when>
					<c:otherwise>
						<span>${fal} &nbsp;</span>
					</c:otherwise>
				</c:choose>
    			</c:forEach>
    		</tr>
   		</tbody>
    	</table>
    	
	<c:if test="${not empty sessionScope.login}">
    	<form action="#" method="post">
    		<legend>섭취식품 추가</legend>
    				<input class="inputQ" type="number" value="product_Quantity" id = "_quantity" placeholder="수량" min="1" required>  
    				<!-- 입력버튼 -->
 					<input class="inputImg" TYPE="IMAGE" src="img/add-button.png" name="Submit" value="Submit" align="absmiddle" id="_eatbtn" style="display: inline;">
    	</form>
    	</c:if>
									</div>
								</div>
							</div>
						</section>
						<section>
							<div class="row gtr-uniform">
								<div id="chart_div" class="col-12 chart"></div>
							</div>
							<div class="row gtr-uniform">
								<div class="col-12">
									<div class="table-wrapper">
		<table>
			<tbody>
    			<tr>
    				<td>일일 제공량</td>
    				<td>${fooddetail.daily}</td>
    			</tr>
    			<tr>
    				<td>칼로리</td>
    				<td>${fooddetail.calorie}</td>
    			</tr>
    			<tr>
    				<td>탄수화물(g)</td>
    				<td id="carbohydrate">${fooddetail.carbohydrate}</td>
    			</tr>
    			<tr>
    				<td>단백질(g)</td>
    				<td id="protein">${fooddetail.protein}</td>
    			</tr>
    			<tr>
    				<td>지방(g)</td>
    				<td id="fat">${fooddetail.fat}</td>
    			</tr>
    			<tr>
    				<td>당류(g)</td>
    				<td id="sugars">${fooddetail.sugars}</td>
    			</tr>
    			<tr>
    				<td>나트륨(mg)</td>
    				<td id="salt">${fooddetail.salt}</td>
    			</tr>
    			<tr>
    				<td>콜레스테롤(mg)</td>
    				<td id="cholesterol">${fooddetail.cholesterol}</td>
    			</tr>
    			<tr>
    				<td>포화지방산(g)</td>
    				<td id="fatty_acid">${fooddetail.fatty_acid}</td>
    			</tr>
    			<tr>
    				<td>트랜스지방(g)</td>
    				<td id="trans_fat">${fooddetail.trans_fat}</td>
    			</tr>
    			
    			</tbody>
    		</table>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
		<jsp:include page="./share/footer.jsp"/>
		
			</div>
    	
	</body>
</html>