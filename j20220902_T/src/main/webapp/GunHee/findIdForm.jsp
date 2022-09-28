<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style type="text/css">
		
	</style>
	
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="../css/loginForm.css" type="text/css" rel="stylesheet">
	</head>
	<body>
	<div class="findId">
	
		<form action="login.do" class="findIdForm" method="post">
		
			<div class="image">
				<img alt="" src="../images/icon.png">
			</div>
			
			<div>
				<table>
				<tr>
					<th><label for="user_name">이름</label><br><sub>* 필수항목</sub></th>
					<td><input type="text" class="input" name="user_name" id="user_name" placeholder="이름을 입력해주세요!" required="required"></td>
				</tr>
				</table>
			</div>
		
			<div>
				<table>
				<tr>
					<th><label for="user_phone_number">전화번호 </label><br><sub>* 필수항목</sub></th>
					<td><input type="tel" id="user_phone_number" name="user_phone_number" class="input" required="required"
						pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-XXXX-XXXX"></td>
				</tr>
				</table>
			</div>
			
			<div style=" text-align: center;">
				<input type="submit" id="submitChk" class="button" onclick="return signUpCheck()" value="가입하기">
			</div>
			
		</form>
	</div>
		
	</body>
</html>