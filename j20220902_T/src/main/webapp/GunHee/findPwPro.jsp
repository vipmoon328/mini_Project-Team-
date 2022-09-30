<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	console.log(${usernum});
	function chkPw()
	{
		var check = true;
		
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
		
		if(check == false)
		{
			return false;
		}
	}	
</script>
	<link href="<%=context%>/css/findPwPro.css" type="text/css" rel="stylesheet"> 
</head>
<body>
	<c:if test="${usernum eq 0}">
		<script type="text/javascript">
			alert('해당되는 정보가 존재하지 않습니다.');
			location.href = "<%=context%>/GunHee/findPwForm.jsp";
		</script>
	</c:if>
	
	<div class="frame">
	<form action="<%=context%>/changePw.do" method="post"  class="LoginForm">
		<div class="image" style="text-align: center">
				<img alt="" src="<%=context%>/images/icon.png" >
		</div>	
		
		<div><h3 style=" text-align: center;">${id}님의 변경하실 비밀 번호를 입력해주세요</h3></div>
		
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
						
		<div style=" text-align: center;">
			<input type="submit" class="button" value="확인" onclick="return chkPw()"> 
			<input type="button" class="button" value="취소" onclick="location.href='<%=context%>/GunHee/loginForm.jsp'">
		</div>
	</form>
	</div>
</body>
</html>