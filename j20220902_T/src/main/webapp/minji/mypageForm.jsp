<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중앙 볼링장 마이페이지</title>
<link href="../css/mypage.css?ver0.1" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrapper">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li><a href="">user님</a></li>
					<li><a href="">로그아웃</a></li>
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
					<li><a href="">정보수정</a></li>
					<li><a href="">예약내역</a></li>		
				</ul>
			</div>
		</div>
		<div class="flex-container center">
			<div class="item_fifth"> 
				<table width="500px">
					<tr> 
						<td><figure style="margin: 0;">아이디<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="20px" id="user_id"><span style="font-size: 12px; color: gray;"> * 아이디 변경 불가능</span></td>
					</tr> 
					<tr>
						<td><figure style="margin: 0;">비밀번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="password" size="30px" id="user_password" required="required"></td> 
					</tr>
					<tr>
						<td><figure style="margin: 0;">비밀번호확인<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="password" size="30px" id="user_password_chk" required="required"></td>
					</tr>
					<tr>
						<td><figure style="margin: 0;">이름<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="15px" id="user_name" required="required"></td>
					</tr>
					<tr>
						<td><figure style="margin: 0;">전화번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="tel" size="25px" id="user_phone_number" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-XXXX-XXXX" required="required"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<label><input type="radio" name="gender" value="M"><span>남성</span></label>
							<label><input type="radio" name="gender" value="F"><span>여성</span></label>
						</td>
					</tr>
					<tr>
						<td>지점</td>
						<td>
							<label><input type="radio" name="loc" value="0"><span>이대</span></label>
							<label><input type="radio" name="loc" value="1"><span>강남</span></label>
						</td>
					</tr>
					<tr>
						<td><figure style="margin: 0;">이메일<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td>
							<input type="text" required="required">
							<select name="email" class="select">
								<option value="naver">@naver.com</option>
								<option value="daum">@daum.net</option>
								<option value="google">@gmail.com</option>
							</select>
						</td>
					</tr>
				</table>
			</div> 
		</div>
		<div class="flex-container center">
			<div class="item_sixth">
				<button type="submit" id="submitChk" onclick="">수정하기</button><button type="submit" class="" onclick="">탈퇴하기</button>
			</div>
		</div>
		<div class="flex-container center">
			<div class="item_end">
				<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre class="footer">이메일  choongang@naver.com</pre></div>
			</div>
		</div>
</div>
</body>
</html>