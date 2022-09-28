<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/loginForm.css" type="text/css" rel="stylesheet">
 
<style type="text/css">
	

	
</style>

</head>
<body>
	<div class="findId">
	
		<form action="login.do" class="findIdForm" method="post">
		
			<div class="image">
				<img alt="" src="images/icon.png">
			</div>
		
			<div>
				<input type="text" class="input" placeholder=" 이름" name="user_id" id="user_id" size="50" required="required">
			</div>
			
			<div>
				
			</div>
			
			<div>
				<input type="submit" value=" 아이디 찾기" id="sendData" class="button">
			</div>
			
			<div class="optionBox">
				<span id="findId" class="option"><a href="findIdForm.jsp">아이디 찾기</a></span>
				<span id="findPw" class="option"><a href="findPwForm.jsp">비밀번호 찾기</a></span>
				<span id="signUp" class="option"><a href="signUpForm.jsp">회원 가입</a></span>
			</div>
		</form>
	</div>
</body>
</html>