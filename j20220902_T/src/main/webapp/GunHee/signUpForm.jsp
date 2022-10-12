<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String context = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>중앙볼링장 회원가입</title>
	<link href="<%=context%>/css/signUpForm.css" type="text/css" rel="stylesheet"> 
	<link href="<%=context%>/css/font.css" rel="stylesheet" > 
	<style type="text/css">
		.error {
			color: red;
			position: relative;
			left: 160px;
			font-weight: 700;
			padding: 0px;
			font-size: 13px;
		}
		
		#idCheck{
			font-weight: 500;
		}
		
		img { 
	    	width: 500px;
	    	height: 400px;
	    }
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		var id_check = false;
		
		/* 아이디 중복 체크를 알려주는 ajax 구현 [김건희] */
		$(function(){
			$('#user_id_chk').click(function(){
				var id = $('#user_id').val();
				$.ajax({
					url			: '<%=context%>/chkId.do',
					type 		: 'get',
					data		: "id="+id,
					success		: function(data){
						console.log("결과 : "+ data);
						if (data == 'Exist') {
							$("#idCheck").text("사용중인 아이디입니다");
							$("#idCheck").css("color","red");
							id_check = false;
						} else if (data == 'Length Error'){
							$("#idCheck").text("아이디 길이가 부족합니다.");
							$("#idCheck").css("color","red");
							id_check = false;
						} else {
							$("#idCheck").text("사용 가능한 아이디입니다");
							$("#idCheck").css("color","blue");
							id_check = true;
						}
					}
				});
			});
		});
		
		/* 이메일 가입시 특정 도메인을 사용시 자동으로 값을 입력해주는 함수 [김건희] */
		function changeDomain()
		{
			if($('#domain_list').val() == 'type')
			{
				$('#user_email2').val("");
				$('#user_email2').attr("readonly", false);
			}
			else
			{
				$('#user_email2').val($('#domain_list').val());
				$('#user_email2').attr("readonly", true);
			}
		}
		
		/* 아이디 입력시 변경이 감지되면 알려주는 함수 -> 아이디 체크후 중복체크 유효성의 오류를 체크를 통과한 후 아이디를 변경해서 가입을 하는 경우를 방지하기 위함
		[김건희] */
		function changeId()
		{
			id_check = false;
			$("#idCheck").text("아이디 체크를 부탁드립니다.");
			$("#idCheck").css("color","red");
		}
		
		/* 회원 가입시 유효성 체크하는 함수 [김건희] */
		function signUpCheck()
		{	
			var check = true;
			
			if(id_check == false)
			{
				alert("아이디 중복 체크 여부를 먼저 확인해 주세요!");
				check = false;
			}
			
			$('#idError').text('');
			$('#passError').text('');
			$('#passLengthError').text('');
			$('#emailError').text('');
			
			if($('#user_id').val().length < 5 || $('#user_id').val().length > 20)
			{
				$('#idError').text('아이디는 최소 6자리 최대 20자리까지 입력해주세요.');
				check = false;
			}
			
			if($('#user_password').val() != $('#user_password_chk').val())
			{
				$('#passError').text('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
				check = false;
			}
			
			if($('#user_password').val().length < 8)
			{
				$('#passLengthError').text('패스워드는 보안상의 이유로 8글자 이상 입력해주세요');
				check = false;
			}
			
			if($('#user_email2').val().indexOf('.') == -1)
			{
				$('#emailError').text('이메일 형식이 일치 하지 않습니다. 다시 입력해주세요');
				check = false;
			}
	
			console.log(check);
			
			if(check == false)
			{
				return check;
			}
			
		}
		
	/*  테스트용 초기값 함수 [김건희] */
	/* 	function init() {
			user_id.value = "woo";
			user_password.value = 12345678;
			user_password_chk.value = 12345678;
			user_name.value = "김우석";
			user_phone_number.value = "010-1234-5678";
			user_email1.value = "woo123";
			user_email2.value = "naver.com";
		} */
		
	</script>
</head>
<body onload="init()" style="overflow-x: hidden">
<div class="frame" >
	<form action="<%=context%>/signUp.do" method="post">
		<div class="image">
			<img alt="" src="../images/icon.png">
		</div>

		<div>
			<table>
			<tr>
				<th><label for="user_id">아이디</label><br><sub>* 필수항목</sub></th>
				<td><input type="text" class="input" name="user_id" id="user_id" placeholder="아이디를 입력해주세요!" required="required" onchange="changeId()">
				<input type="button" class="button" value="중복 확인" id="user_id_chk"><span id="idCheck"></span>
				</td>
			</tr>
			</table>
			<div id="idError" class="error"></div>
		</div>
		
		<div>
			<table>
			<tr>
				<th><label for="user_password">비밀번호</label><br><sub>* 필수항목</sub></th>
				<td><input type="password" class="input" name="user_password" id="user_password" placeholder="비밀번호를 입력해주세요!" required="required"></td>
			</tr>
			</table>
		</div>
			
		<div>
			<table>
			<tr>
				<th><label for="user_password">비밀번호 확인</label><br><sub>* 필수항목</sub></th>
				<td><input type="password" class="input" id="user_password_chk" placeholder="비밀번호를 입력해주세요!" required="required">
				<sub><b id=pwcheck></b></sub></td>
			</tr>
			</table>
			<div id="passError" class="error"></div>
			<div id="passLengthError" class="error"></div>
		</div>
			
		<div>
			<table>
			<tr>
				<th><label for="user_name">이름</label><br><sub>* 필수항목</sub></th>
				<td><input type="text" class="input" name="user_name" id="user_name" placeholder="이름을 입력해주세요!" required="required"></td>
			</tr>
			</table>
			<div id="nameError" class="error"></div>
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
				<td><input type="text" class="email" name="user_email1" id="user_email1" required="required"> @ <input type="text" class="email" name="user_email2" id="user_email2" required="required">
					<select name="email" class="email" id="domain_list" onclick="changeDomain()">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="type" selected="selected">직접 입력</option>
					</select>
				</td>
			</tr>
			</table>
			<div id="emailError" class="error"></div>
		</div>
		
		<div>
			<table>
			<tr>
				<th><label for="loc">지점</label></th>
				<td><input type="radio" name="loc" value="0" checked="checked">이대
					<input type="radio" name="loc" value="1">강남</td>
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