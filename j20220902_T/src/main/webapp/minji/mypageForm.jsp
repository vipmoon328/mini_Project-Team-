ㅣ<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%-- <%@ include file="../memberCheck.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중앙 볼링장 마이페이지</title>
<link href="css/mypage.css?ver0.1" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function init()
	{
		$('#user_email2').val("${email_domain}");
	}
	
	function changeDomain(){
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
	};
	
	function updateCheck()
	{	
		var check = true;
		
		if($('#user_password').val() != $('#user_password_chk').val())
		{
			$('#passError').text('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
			check = false;
		}
		
		if($('#user_password').val().length < 8)
		{
			$('#passLengthError').text('패스워드는 8글자 이상 입력해주세요.');
			check = false;
		}
		
		if($('#user_email2').val().indexOf('.') == -1)
		{
			$('#emailError').text('이메일 형식이 일치하지 않습니다. 다시 입력해주세요.');
			check = false;
		}

		console.log(check);
		
		if(check == false)
		{
			return check;
		}
	}

</script>
</head>
<body onload="init()">
<div id="wrapper">
	<form action="mypagePro.do" method="post">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li>${users.name}님</li>
					<li><a href="mainHome.do">로그아웃</a></li>
				</ul>
			</div> 
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="">홈</a></li>
					<li><a href="">볼링장정보</a></li>
					<li><a href="">예약</a></li>
					<li><a href="">오시는길</a></li>
					<li><a href="">게시판</a></li>
					<li><a href="">마이페이지</a></li>
				</ul>
			</div>
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_third">마이페이지</div>
		</div>
	<hr color="#90C3FF" width="70%" size="1">
		<div class="flex-container center">
			<div class="item_fourth">
				<ul>
					<li><a href="mypageForm.jsp">정보수정</a></li>
					<li><a href="">예약내역</a></li>		
				</ul>
			</div>
		</div>
		<div class="flex-container center">
			<div class="item_fifth"> 
				<table width="700px">
					<tr> 
						<td><figure style="margin: 0;">아이디<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="20px" id="user_id" value="${users.id}"><span style="font-size: 12px; color: gray;"> * 아이디 변경 불가능</span></td>
					</tr> 
					<tr>
						<td><figure style="margin: 0;">비밀번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="password" size="30px" id="user_password" required="required" value="${users.pw}"></td> 
					</tr>
					<tr>
						<td><figure style="margin: 0;">비밀번호확인<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="password" size="30px" id="user_password_chk" required="required" value="${users.pw}"></td>
						<div id="passError" class="error"></div>
						<div id="passLengthError" class="error"></div>
					</tr>
					<tr>
						<td><figure style="margin: 0;">이름<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="15px" id="user_name" required="required" value="${users.name}"></td>
						<div id="nameError" class="error"></div>
					</tr>
					<tr>
						<td><figure style="margin: 0;">전화번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="tel" size="25px" id="user_phone_number" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-XXXX-XXXX" required="required" value="${users.phone}"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<label>
								<c:choose>
									<c:when test="${users.gender eq 'M'}">
										<input type="radio" name="gender" value="M" checked="checked"><span>남성</span>
										<input type="radio" name="gender" value="F"><span>여성</span>
									</c:when>
									<c:otherwise>
										<input type="radio" name="gender" value="M"><span>남성</span>
										<input type="radio" name="gender" value="F" checked="checked"><span>여성</span>
									</c:otherwise>
								</c:choose>
							</label>
						</td>
					</tr>
					<tr>
						<td>지점</td>
						<td>
							<label>
								<c:choose>
									 <c:when test="${users.brn_uid eq 0}">
										<input type="radio" name="brn_uid" value="0" checked="checked"><span>이대</span>
										<input type="radio" name="brn_uid" value="1"><span>강남</span>
									</c:when>
									<c:otherwise>
										<input type="radio" name="brn_uid" value="0"><span>이대</span>
										<input type="radio" name="brn_uid" value="1" checked="checked"><span>강남</span>
									</c:otherwise> 
								</c:choose>
							</label>
						</td>
					</tr>
					<tr>
						<td><figure style="margin: 0;">이메일<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td>
							<label>
								<input type="text" class="email" name="user_email1" id="user_email1" required="required" value="${email_id}"> @ <input type="text" class="email" name="user_email2" id="user_email2" required="required" value="${email.domain}">
								<select name="email" class="select" id="domain_list" onclick="changeDomain()">
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="google.com">gmail.com</option>
									<option value="type" selected="selected">직접 입력</option>
								</select>
							</label> 
						</td>
						<div id="emailError" class="error"></div>
					</tr>
				</table>
			</div> 
		</div>
		<div class="flex-container center">
			<div class="item_sixth">
				<button type="submit" id="submitChk" onclick="updateCheck()">수정하기</button><button type="submit" onclick="location.href='myDeleteForm.do'">탈퇴하기</button>
			</div>
		</div>
		<a href="#" title="" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
		<div class="flex-container center">
			<div class="item_end">
				<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre class="footer">이메일  choongang@naver.com</pre></div>
			</div>
		</div>
	</form>
</div>
</body>
</html>