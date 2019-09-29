<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>계정찾기</title>
	
</head>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#_findidbtn').click(function() {
				var _fin = $("#_fi_name").val();
				var _fit = $("#_fi_phone").val();
				
				var st=" 입력하세요!";
				if($('#_fi_name').val()==''){
					alert($('#_fi_name').attr('data-msg')+st);
					$('#_fi_name').focus();
				}else if($('#_fi_phone').val()==''){
					alert($('#_fi_phone').attr('data-msg')+st);
					$('#_fi_phone').focus();
				}else{
					//$('#_loginForm').submit();
					findId(_fin,_fit);
				}
			});
			

			$('#_findpwbtn').click(function() {
				var _fpn = $("#_fp_name").val();
				var _fpi = $("#_fp_id").val();
				var _fpt = $("#_fp_phone").val();
				
				var st=" 입력하세요!";
				if($('#_fp_name').val()==''){
					alert($('#_fp_name').attr('data-msg')+st);
					$('#_fp_name').focus();
				}else if($('#_fp_id').val()==''){
					alert($('#_fp_id').attr('data-msg')+st);
					$('#_fp_id').focus();
				}else if($('#_fp_phone').val()==''){
					alert($('#_fp_phone').attr('data-msg')+st);
					$('#_fp_phone').focus();
				}else{
					//$('#_loginForm').submit();
					findPw(_fpn,_fpi,_fpt);
				}
			});
			
		});
		function findId(name, tel) {
			$.ajax({
				type: "POST",
				url: "./findId.do",
				async: true,
				data:
				{"user_name":name, 
					"user_phone":tel},
				success: function(u) {
					alertResult(u);
				}
			});
		};
		function alertResult(user) {
			if(user.user_code==null) {
				alert("해당 사용자가 없음");
			}
			else {
				alert("아이디 : " + user.user_id);
			}
		}
		function findPw(name, id, tel) {
			$.ajax({
				type: "POST",
				url: "./findPw.do",
				async: true,
				data:
				{"user_name":name,
					"user_id":id,
					"user_phone":tel},
				success: function(u) {
					alertResult2(u);
				}
			});
		};
		function alertResult2(user) {
			if(user.user_code==null) {
				alert("해당 사용자가 없음");
			}
			else {
				alert("비밀번호 : " + user.user_pwd);
			}
		}
	</script>


<body class="is-preload">

<!-- Wrapper -->
	<div id="wrapper">

	<!-- Header -->
		<jsp:include page="./share/header.jsp"/>


	<!-- Main -->
		<div id="main">
			<div class="inner">
					<h1>FIND ACCOUNT!</h1>
						<span class="image main"><img src="images/pic13.jpg" alt="" /></span>						
			</div>
		</div>
			<br/>
			
		<div id="mainPage">
			<div class="inner">
			    <div>
					<form id="_findidform" action="#" method="post">
						<fieldset>
							<h2>아이디 찾기</h2>
					      	<div>
					          	<label>Name </label>
					          	<input id="_fi_name" type="text" data-msg='이름을'>
					        </div>
					        <div>
					          	<label>Tel </label>
					          	<input id="_fi_phone" type="text" placeholder="xxx-xxxx-xxxx" data-msg='전화번호를'>
					       	</div>
					       	<br/>
					       	<button id="_findidbtn" type="button">아이디 찾기</button>
				       	</fieldset>
				 	</form>
				</div>
				
			 	<br/>
			 	<br/>
			 
				<div>
					<form id="_findpwform" action="#" method="post" >
						<fieldset>
				      		<h2>비밀번호 찾기</h2>
				      		<div>
				          		<label>Name </label>
				          		<input id="_fp_name" type="text">
				        	</div>
				        	<div>
				          		<label>Id </label>
				          		<input id="_fp_id" type="text">
				        	</div>
				        	<div>
				          		<label>Tel </label>
				          		<input id="_fp_phone" type="text" placeholder="xxx-xxxx-xxxx">
				        	</div>
				        	<br/>
				        	<button id="_findpwbtn" type="button">비밀번호 찾기</button>
				      	</fieldset>      
				      </form>
			     </div>
	      
	    	</div>
	   	</div>

		<!-- Footer -->
		<jsp:include page="./share/footer.jsp"/>

	</div>
</body>

</html>
			