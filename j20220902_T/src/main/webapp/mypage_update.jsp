<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="css/mypage.css?ver0.1" rel="stylesheet" type="text/css">
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
						<td><input type="text"><span style="font-size: 12px; color: gray;"> * 아이디 변경 불가능</span></td>
					</tr> 
					<tr>
						<td><figure style="margin: 0;">비밀번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="30px" required="required"></td> 
					</tr>
					<tr>
						<td><figure style="margin: 0;">비밀번호확인<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="30px" required="required"></td>
					</tr>
					<tr>
						<td><figure style="margin: 0;">이름<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="15px" required="required"></td>
					</tr>
					<tr>
						<td><figure style="margin: 0;">전화번호<figcaption style="font-size: 10px; color: gray;">* 필수항목</figcaption></figure></td>
						<td><input type="text" size="25px" required="required"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<label><input type="radio" name="gender" value="men"><span>남성</span></label>
							<label><input type="radio" name="gender" value="women"><span>여성</span></label>
						</td>
					</tr>
					<tr>
						<td>매장선택</td>
						<td>
							<label><input type="radio" name="store" value="E"><span>이대</span></label>
							<label><input type="radio" name="store" value="Gangnam"><span>강남</span></label>
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
				<button type="button" class="" onclick="">수정하기</button><button type="button" class="" onclick="">탈퇴하기</button>
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