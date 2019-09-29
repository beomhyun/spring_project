<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html lang="en">
<!-- Start Head -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원정보수정</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">   
		$(function(){
			$('#_edituserbtn').click(function() {
				var st=" 입력하세요!";
				if($('#_id').val()==''){
					alert($('#_id').attr('data-msg')+st);
					$('#_id').focus();
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
					$('#signup-form').submit();
				}
			});
			$('#_deleteUserBtn').click(function(){
				var result = confirm("정말로 탈퇴하시겠습니까");
				if(result) {
					location.href="./delete.do?user_code=${user.user_code}"
				}
			});
		});
			
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
					<h1>User Info!</h1>
						<span class="image main"><img src="images/pic13.jpg" alt="" /></span>						
				</div>		
			</div>
					<br/>
					
			<div id="mainPage">
				<div class="inner">
					<section>
						<form id="signup-form" method="post" action="./update.do">
							<div style="display:none">
								<input id="_pk" type="text" name="user_code" value="${user.user_code}">
							</div>
							<input type="text" name="user_id" id="_id" value='${user.user_id }' readonly="readonly"/>
							<br/>
							<input type="password" name="user_pwd" id="_password" value='${user.user_pwd }' data-msg='패스워드를'/>
							<br/>
							<input type="text" name="user_name" id="_name" value='${user.user_name }' data-msg='이름을'/>
							<br/>
							<input type="text" name="user_address" id="_address" value='${user.user_address }' data-msg='주소를'/>
							<br/>
							<input type="text" name="user_phone" id="_phoneNumber" value='${user.user_phone }' data-msg='전화번호를'/>
							<br/>
							<span>알레르기 정보</span>
							<div class="row gtr-uniform">
								<br/>
								
								<c:set var = "String" value="${allergy}"/>
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'땅콩')}">
											<input type="checkbox" id="soybean" name="_uallergy"  value = "땅콩 " checked="checked">
											<label for="soybean">땅콩</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="soybean" name="_uallergy"  value = "땅콩 ">
											<label for="soybean">땅콩</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'대두')}">
											<input type="checkbox" id="peanut" name="_uallergy"  value = "대두" checked="checked">
											<label for="peanut">대두</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="peanut" name="_uallergy"  value = "대두">
											<label for="peanut">대두</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'우유')}">
											<input type="checkbox" id="milk" name="_uallergy" value = "우유" checked="checked">
											<label for="milk">우유</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="milk" name="_uallergy" value = "우유">
											<label for="milk">우유</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'게')}">
											<input type="checkbox" id="crab" name="_uallergy" value = "게" checked="checked">
											<label for="crab">게</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="crab" name="_uallergy" value = "게">
											<label for="crab">게</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'새우')}">
											<input type="checkbox" id="shrimp" name="_uallergy" value = "새우" checked="checked">
											<label for="shrimp">새우</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="shrimp" name="_uallergy" value = "새우">
											<label for="shrimp">새우</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'참치')}">
											<input type="checkbox" id="tuna" name="_uallergy" value = "참치" checked="checked">
											<label for="tuna">참치</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="tuna" name="_uallergy" value = "참치">
											<label for="tuna">참치</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'연어')}">
											<input type="checkbox" id="salmon" name="_uallergy" value = "연어" checked="checked">
											<label for="salmon">연어</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="salmon" name="_uallergy" value = "연어">
											<label for="salmon">연어</label>
										</c:otherwise>
									</c:choose>
								</div>								

								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'쑥')}">
											<input type="checkbox" id="mugwort" name="_uallergy" value = "쑥" checked="checked">
											<label for="mugwort">쑥</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="mugwort" name="_uallergy" value = "쑥">
											<label for="mugwort">쑥</label>
										</c:otherwise>
									</c:choose>
								</div>		
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'소고기')}">
											<input type="checkbox" id="beef" name="_uallergy" value = "소고기" checked="checked">
											<label for="beef">소고기</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="beef" name="_uallergy" value = "소고기">
											<label for="beef">소고기</label>
										</c:otherwise>
									</c:choose>
								</div>
							
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'닭고기')}">
											<input type="checkbox" id="chicken" name="_uallergy" value = "닭고기" checked="checked">
											<label for="chicken">닭고기</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="chicken" name="_uallergy" value = "닭고기">
											<label for="chicken">닭고기</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'돼지고기')}">
											<input type="checkbox" id="pork" name="_uallergy" value = "돼지고기" checked="checked">
											<label for="pork">돼지고기</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="pork" name="_uallergy" value = "돼지고기">
											<label for="pork">돼지고기</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'복숭아')}">
											<input type="checkbox" id="peach" name="_uallergy" value = "복숭아" checked="checked">
											<label for="peach">복숭아</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="peach" name="_uallergy" value = "복숭아">
											<label for="peach">복숭아</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'민들레')}">
											<input type="checkbox" id="dandelion" name="_uallergy" value = "민들레" checked="checked">
											<label for="dandelion">민들레</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="dandelion" name="_uallergy" value = "민들레">
											<label for="dandelion">민들레</label>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="col-3 col-12-small">
									<c:choose>
										<c:when test="${fn:contains(String,'계란')}">
											<input type="checkbox" id="egg" name="_uallergy" value = "계란" checked="checked">
											<label for="egg">계란</label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="egg" name="_uallergy" value = "계란">
											<label for="egg">계란</label>
										</c:otherwise>
									</c:choose>
								</div>
								
							</div>
							<br/>
							<input type="button" id="_edituserbtn" class="locateCenter" value="EDIT" />
							<input type="button" id="_deleteUserBtn" class="locateCenter" value="DELETE" />
						</form>
					</section>
				</div>
			</div>
		
		<!-- Footer -->
		<jsp:include page="./share/footer.jsp"/>
	</div>	
	
</body>

</html>