<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%-- <%@ include file="../memberCheck.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중앙 볼링장 마이페이지</title>
<link href="<%=context %>/css/mgrUpdateForm.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet"> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function init()
	{
		$('#user_email2').val("${email_domain}");
	}
	
	/* 지웅씨 원래 코드 */ 	
	/* 	$('#domain_list').change(function() {
		$("#domain_list option:selected").each(function() {
			
			if($(this).val()=='type'){
				$("#user_email2").val('');
				$("#user_email2").attr("disabled",false);
			}else{
				$("#user_email2").val($(this).text());
				$("#user_email2").attr("disabled",true);	
			}
		});
	}); */
	
	/* 22.10.05 [김건희] 선택시 도메인 창 변화 함수 수정  */
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
				return false;
			}
	}
		
	</script>
</head>
<body onload="init()" style="overflow-x: hidden">
	<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li><strong>${name} 관리자님</strong></li> <!-- 22.10.05 링크 및 관리자 표시 수정 [김건희] -->
					<li><a href="<%=context%>/logout.do">로그아웃</a></li> <!-- 22.10.05 링크 및 관리자 표시 수정 [김건희] -->
				</ul>
			</div> 
		</div>
		<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="<%=context%>/mgrList.do" style="color:#5A8DF3; " >회원관리</a></li>
					<li><a href="">매장관리</a></li>
					<li><a href="">게시판관리</a></li>
				</ul>
			</div>
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
<main>	
		<div class="flex-container">
			<div class="item_third">회원정보 수정</div>
		</div>
		<hr color="#90C3FF" width="70%" size="1">
		<div class="flex-container center">
			<div class="item_fourth">
				<ul>
					<li><a href="<%=context%>/mypage.do"></a></li>
					<li><a href="<%=context%>/myRes.do"></a></li>		
				</ul>
			</div>
		</div>
		<div class="flex-container center">
			<div class="item_fifth">
				<form action="<%=context%>/mgrUpdatePro.do"  method="post">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<table width="700px">
					<tr> 
						<td><figure style="margin: 0;">아이디<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="20px" name="user_id" id="user_id" value="${users.id}" readonly="readonly"><span style="font-size: 12px; color: gray;"> * 아이디 변경 불가능</span></td>
					</tr> 
					<tr>
						<td><figure style="margin: 0;">비밀번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="password" size="30px" name="user_password" id="user_password" required="required" value="${users.pw}"></td> 
					</tr>
					<tr>
						<td><figure style="margin: 0;">비밀번호확인<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="password" size="30px" id="user_password_chk" required="required" value="${users.pw}"></td>
						<div id="passError" class="error"></div>
						<div id="passLengthError" class="error"></div>
					</tr>
					<tr>
						<td><figure style="margin: 0;">이름<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="15px" name="user_name" id="user_name" required="required" value="${users.name}"></td>
						<div id="nameError" class="error"></div>
					</tr>
					<tr>
						<td><figure style="margin: 0;">전화번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="tel" size="25px" name="user_phone_number" id="user_phone_number" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-XXXX-XXXX" required="required" value="${users.phone}"></td>
					</tr>
					
					<!-- 22.10.05 [김건희] 성별 고정  -->
					<tr>
						<td>성별</td>
						<td>
							<label>
								<c:choose>
									<c:when test="${users.gender eq 'M'}">
										<input type="radio" name="gender" value="M" checked="checked"><span>남성</span>
										<input type="radio" name="gender" value="F" onclick="return false"><span>여성</span>
									</c:when>
									<c:otherwise>
										<input type="radio" name="gender" value="M" onclick="return false"><span>남성</span>
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
								<%-- <input type="text" class="email" name="user_email1" id="user_email1" required="required" value="${email_id}"> @ <input type="text" class="email" name="user_email2" id="user_email2" required="required" value="${email.domain}">
								<select name="email" class="select" id="domain_list" onclick="changeDomain()"> --%>
								<!-- 22.10.05 [김건희] 이메일 도메인을 받아오지 못하는 것을 수정 -->
								<input type="text" class="email" name="user_email1" id="user_email1" required="required" value="${email_id}"> @ <input type="text" class="email" name="user_email2" id="user_email2" required="required" value="${email_domain}">
								<select name="email" class="select" id="domain_list" onclick="changeDomain()">
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="type" selected="selected">직접 입력</option>
								</select>
							</label> 
						</td>
						<div id="emailError" class="error"></div>
					</tr>
				</table>
			</div> 
		</div>
		<!-- 22.10.05 체크 함수 관련 수정 -->
		<div class="flex-container center">
			<div class="item_sixth">
				<button type="submit" id="submitChk" onclick="return updateCheck()">수정하기</button>
			</div>
		</div>
	    </form>
		</main>
		<a href="#" title="" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
		<div class="flex-container center">
			<div class="item_end">
				<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre class="footer">이메일  choongang@naver.com</pre></div>
			</div>
		</div>

</body>
</html>
				