<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	function changeDomain()
	{
		if($('#domain_list').val() == 'type')
		{
			$('#user_email2').val("");
			$('#user_email2').attr("disabled", false);
		}
		else
		{
			$('#user_email2').val($('#domain_list').val());
			$('#user_email2').attr("disabled", true);
		}
	}
	
	function chk
</script>

<link href="css/signUpForm.css" type="text/css" rel="stylesheet"> 

</head>
<body>
<div class="frame">
	<form action="">
		<div class="image">
			<img alt="" src="images/icon.png">
		</div>

		<div>
			<table>
			<tr>
				<th><label for="user_id">아이디</label><br><sub>* 필수항목</sub></th>
				<td><input type="text" class="input" id="user_id" placeholder="아이디를 입력해주세요!">
				<input type="button" class="button" value="중복 확인" id="user_id_chk">
				</td>
			</tr>
			</table>
			<div id="idError" class="error"></div>
		</div>
		
		<div>
			<table>
			<tr>
				<th><label for="user_password">비밀번호</label><br><sub>* 필수항목</sub></th>
				<td><input type="password" class="input" id="user_password" placeholder="비밀번호를 입력해주세요!"></td>
			</tr>
			</table>

		</div>
			
		<div>
			<table>
			<tr>
				<th><label for="user_password">비밀번호 확인</label><br><sub>* 필수항목</sub></th>
				<td><input type="password" class="input" id="user_password_chk" placeholder="비밀번호를 입력해주세요!">
				<sub><b>* 일치 확인</b></sub></td>
			</tr>
			</table>
			<div id="passError" class="error"></div>
			<div id="passLengthError" class="error"></div>
		</div>
			
		<div>
			<table>
			<tr>
				<th><label for="user_name">이름</label><br><sub>* 필수항목</sub></th>
				<td><input type="text" class="input" id="user_name" placeholder="이름을 입력해주세요!"></td>
			</tr>
			</table>
			<div id="nameError" class="error"></div>
		</div>
		
		<div>
			<table>
			<tr>
				<th><label for="user_phone_number">전화번호 </label><br><sub>* 필수항목</sub></th>
				<td><input type="tel" id="user_phone_number" class="input" required="required"
					pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-XXXX-XXXX"></td>
			</tr>
			</table>
		</div>
		
		<div>
			<table>
			<tr>
				<th><label for="gender">성별</label></th>
				<td><input type="radio" name="gender" value="M" checked="checked">남성
					<input type="radio" name="gender" value="F">여성</td>
			</tr>
			</table>
		</div>
		
		<div>
			<table>
			<tr>
				<th><label for="user_email">이메일</label><br><sub>* 필수항목</sub></th>
				<td><input type="text" class="email" id="user_email1"> @ <input type="text" class="email" id="user_email2">
					<select name="email" class="email" id="domain_list" onclick="changeDomain()">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="google.com">google.com</option>
					<option value="type" selected="selected">직접 입력</option>
					</select>
				</td>
			</tr>
			</table>
		</div>
		
		<div style=" text-align: center;">
			<input type="button" class="button"  value="가입하기">
		</div>
</form>
</div>
</body>
</html>