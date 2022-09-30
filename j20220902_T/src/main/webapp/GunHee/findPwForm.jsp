<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>

<!DOCTYPE html>
<html>
	<style type="text/css">
		.button {
			width: 400px;
			position: relative;
			right: 40px;
		}
		
		h3 {
			position: relative;
			right: 33px;
		}
	</style>
	
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<link href="<%=context%>/css/loginForm.css" type="text/css" rel="stylesheet"> 
	</head>
	
<body>
	<div class="findPw">
		<form action="<%=context%>/findPw.do" class="findPwForm" method="post">
		
			<div class="image">
				<img alt="" src="../images/icon.png">
			</div>
			
			<h3 style="text-align: center">비밀번호 찾기</h3 >
			
			<div>
				<table>
				<tr>
					<th><label for="user_id">아이디</label><br><sub>* 필수항목</sub></th>
					<td>
					<input type="text" class="input" name="user_id" id="user_id" placeholder="아이디를 입력해주세요!" required="required">
					</td>
				</tr>
				</table>
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
				<input type="submit" class="button" value="비밀번호 찾기">
			</div>
			
		</form>
	</div>
</body>
</html>