<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중앙 볼링장 로그인</title>
<link href="../css/loginForm.css" type="text/css" rel="stylesheet"> 
</head>
<body>
	<div class="Login">
	
		<form action="login.do" class="LoginForm" method="post">
		
			<div class="image">
				<img alt="" src="../images/icon.png">
			</div>
		
			<div>
				<input type="text" class="input" placeholder="  아이디" name="user_id" id="user_id" size="50" required="required">
			</div>
			
			<div>
				<input type="password" class="input" placeholder="  비밀번호" name="user_password" id="user_password" required="required">
			</div>
			
			<div>
				<input type="submit" value=" 로그인" id="sendData" class="button">
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