<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#_loginbtn').click(function() {
			var st=" 입력하세요!";
			if($('#id').val()==''){
				alert($('#id').attr('data-msg')+st);
				$('#id').focus();
			}else if($('#pw').val()==''){
				alert($('#pw').attr('data-msg')+st);
				$('#pw').focus();
			}else{
				$.ajax({
					type: "POST",
					url: "./ajlogin.do",
					async: true,
					data:
					{"user_id":$('#id').val(), 
						"user_pwd":$('#pw').val()},
					success: function(u) {
						isloginsucess(u);
					}
				});
			}
		});
		$('#_findaccountbtn').click(function() {
			location.href="./findaccount.do";
		});
	});
	function isloginsucess(user) {
		if(user.user_code==null) {
			alert("해당 사용자가 없음");
		}
		else {
			alert("로그인성공");
			location.reload();
			}
	}
</script>

		<header id="header">
			<div class="inner">

			<!-- Logo -->
				<a href="./main.do" class="logo">
					<span class="symbol"><img src="images/header-logo.jpg" alt="" /></span><span class="title">SAFE FOOD</span>
				</a>

			<!-- Nav -->
				<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
				</nav>
			</div>
		</header>


<!-- Menu -->
<nav id="menu">
			<c:if test="${empty sessionScope.login}">
				<h2 class='login'><a href="#">LOGIN</a></h2>
					<div id='loginForm'>
						<form id="_loginForm" method="post" action="./login.do" >
							<input type="text" id="id" name = "user_id" placeholder="ID" data-msg='아이디를'/>
							<input type="password" id="pw"name = "user_pwd" placeholder="PASSWORD" data-msg='패스워드를'/>
						
							<br/>
							<input type="button" id="_loginbtn" value="ENTER" class="primary"/>
							<input id="_findaccountbtn" type="button" value="FORGOT?" class="primary"/>
						</form>
					</div>
							
				<h2><a href="./signupbf.do" class="keep">JOIN</a></h2>
					</c:if>
					
			<c:if test="${not empty sessionScope.login}">
				<h2><a href='./userdetail.do?user_id=${sessionScope.login.user_id}' class="keep">${sessionScope.login.user_name}</a></h2>
				<h2><a href='./logout.do' class="keep">Logout</a></h2>
			</c:if>
				<br/>
					<h2>MENU</h2>
						<ul>
							<li><a href="foodinfolist.do" class="keep">홈</a></li>
							<li><a href="gonotice.do" class="keep">공지사항</a></li>
							<c:if test="${not empty sessionScope.login}">
								<li><a href="godiet.do" class="keep">식단 관리</a></li>
							</c:if>
							<li><a href="goqna.do" class="keep">Q&A 게시판</a></li>
						</ul>
</nav>
		


<!-- css -->

 	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
 
	


<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
