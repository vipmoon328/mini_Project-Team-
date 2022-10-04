<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%-- <%@ include file="../memberCheck.jsp" %> --%>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<link href="<%=context %>/css/myDelete.css?ver0.1" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrapper">
	<!-- 22.10.04 링크 연결 및 수정 [김건희] -->
	<form action="myDeletePro.do" method="post">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li>${id}님</li>
					<li><a href="<%=context%>/logout.do">로그아웃</a></li>
				</ul>
			</div> 
		</div>
		
	<!-- 22.10.04 링크 연결 및 수정 [김건희] -->
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="<%=context%>/hyojung/loginHomeView.jsp">홈</a></li>
					<li><a href="<%=context%>/JiHyeon/informationFormIn.jsp">볼링장정보</a></li>
					<li><a href="<%=context%>/reschange.do">예약</a></li>
					<li><a href="<%=context%>/JiHyeon/mapFormIn.jsp">오시는길</a></li>
					<li><a href="">게시판</a></li>
					<li><a href="<%=context%>/mypage.do">마이페이지</a></li>
				</ul>
			</div>
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_third">마이페이지</div>
		</div>
	<hr color="#90C3FF" width="70%" size="1">
		<div class="flex-container center">
			<div class="item_fifth"> 
				<form action="myDeletePro.do">
					<table width="500px" height="350px">
						<tr>
							<td><input type="hidden" name="user_id" value="${users.id}">
							<input type="hidden" name="user_password" value="${users.pw}"></td>
						</tr>
						<tr>			
							<td><span>암호 재확인  </span><input type="password" name="user_password"></td>
							<td><button type="submit" value="탈퇴하기">탈퇴하기</button></td>
						</tr>
					</table>
				</form>
			</div> 
		</div> 
		<a href="#" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
		<div class="flex-container center">
			<div class="item_end">
				<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre class="footer">이메일  choongang@naver.com</pre></div>
			</div>
		</div>
</div>
</body>
</html>
