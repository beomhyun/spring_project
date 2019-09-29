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
	<title>회원가입</title>

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var ischecked = false;

		$(function(){
			$('#_checkidbtn').click(function() {
				var _id = $("#_id").val();
				var st=" 입력하세요!";
				
				if($('#_id').val()==''){
					alert($('#_id').attr('data-msg')+st);
					$('#_id').focus();
				}else{
					checkDuplicateId(_id);
				}
			});
			
			$('#_signupbtn').click(function() {
				var phone = $("#_phone").val();
				var st=" 입력하세요!";

				if($('#_id').val()==''){
					alert($('#_id').attr('data-msg')+st);
					$('#_id').focus();
				}else if(ischecked == false) {
					alert("중복체크를 하세요!");
				}else if($('#_password').val()==''){
					alert($('#_password').attr('data-msg')+st);
					$('#_password').focus();
				}else if($('#_name').val()==''){
					alert($('#_name').attr('data-msg')+st);
					$('#_name').focus();
				}else if($('#_address').val()==''){
					alert($('#_address').attr('data-msg')+st);
					$('#_address').focus();
				}else if($('#_phone').val()==''){
					alert($('#_phone').attr('data-msg')+st);
					$('#_phone').focus();
				}else{
					checkDuplicatePhone(phone);
				}
			});
			
		});
		
		function checkDuplicateId(id) {
			$.ajax({
				type: "POST",
				url: "./checkDuplicateId.do",
				async: true,
				data:"userid="+id,
				success: function(u) {
					showResult(u);
				}
			});
		};
		
		function checkDuplicatePhone(phone) {
			$.ajax({
				type: "POST",
				url: "./checkDuplicatePhone.do",
				async: true,
				data:"userphone="+phone,
				success: function(u2) {
					showResult2(u2);
				}
			});
		};
	
		function showResult(msg) {
			if(msg=='') {
				alert("사용할 수 있는 아이디 입니다.");
				ischecked = true;
			}
			else {
				alert("사용할 수 없는 아이디 입니다.");
				$('#_id').val('');
			}
		};
		
		function showResult2(msg2) {
			if(msg2==="") {
				$('#signup-form').submit();
			}
			else {
				alert("이미 등록되어 있는 전화번호 입니다.");
				$('#_phone').val('');
			}
		};

	
</script>

<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Header -->
		<jsp:include page="./share/header.jsp"/>
		
		<!-- Main -->
			<div id="main">
				<div class="inner">
					<h1>Join US!</h1>
						<span class="image main"><img src="images/pic13.jpg" alt="" /></span>						
				</div>		
			</div>
					<br/>
					
			<div id="mainPage">
				<div class="inner">
					<section>
						<form id="signup-form" method="post" action="./signup.do">
							<div style="display:none">
								<input id="_pk" type="text" name="_upk" value="${pk}">
							</div>
							<input type="text" name="_uid" id="_id" placeholder="Id" data-msg='아이디를'/>
							<input type="button" id="_checkidbtn" value="중복확인"/>
							<br/>
							<input type="password" name="_upwd" id="_password" placeholder="Password" data-msg='패스워드를'/>
							<br/>
							<input type="text" name="_uname" id="_name" placeholder="Name" data-msg='이름을'/>
							<br/>
							<input type="text" name="_uaddress" id="_address" placeholder="Address" data-msg='주소를'/>
							<br/>
							<input type="text" name="_uphone" id="_phone" placeholder="Tel" data-msg='전화번호를'/>
							<br/>
							<span>알레르기 정보</span>
							<div class="row gtr-uniform">
								<br/>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="soybean" name="_uallergy"  value = "땅콩">
									<label for="soybean">땅콩</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="peanut" name="_uallergy"  value = "대두">
									<label for="peanut">대두</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="milk" name="_uallergy" value = "우유">
									<label for="milk">우유</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="crab" name="_uallergy" value = "게">
									<label for="crab">게</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="shrimp" name="_uallergy" value = "새우">
									<label for="shrimp">새우</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="tuna" name="_uallergy" value = "참치">
									<label for="tuna">참치</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="salmon" name="_uallergy" value = "연어">
									<label for="salmon">연어</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="mugwort" name="_uallergy" value = "쑥">
									<label for="mugwort">쑥</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="beef" name="_uallergy" value = "소고기">
									<label for="beef">소고기</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="chicken" name="_uallergy" value = "닭고기">
									<label for="chicken">닭고기</label>
								</div>
								<div class="col-4 col-12-small">
									<input type="checkbox" id="pork" name="_uallergy" value = "돼지고기">
									<label for="pork">돼지고기</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="peach" name="_uallergy" value = "복숭아">
									<label for="peach">복숭아</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="dandelion" name="_uallergy" value = "민들레">
									<label for="dandelion">민들레</label>
								</div>
								<div class="col-3 col-12-small">
									<input type="checkbox" id="egg" name="_uallergy" value = "계란">
									<label for="egg">계란</label>
								</div>
							</div>
							<br/>
							<button type="button" id="_signupbtn" class="locateCenter">SIGN UP</button>
							<button type="reset">RESET</button>
							
						</form>
						
						<!-- <input type="button" id="_signupbtn" class="locateCenter" value="SIGN UP"/> -->
						
					</section>
				</div>
			</div>
		
		<!-- Footer -->
		<jsp:include page="./share/footer.jsp"/>
	</div>		

</body>

</html>