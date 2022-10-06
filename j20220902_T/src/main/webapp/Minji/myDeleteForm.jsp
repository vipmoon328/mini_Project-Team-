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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 	function chk() {
		if(!frm.user_password.value) {
			alert("암호를 입력해주세요.");
			frm.user_password.focus();
			return false;
		}
		return true;
	}; 
</script>
</head>
<body>
<div id="wrapper">
	<div class="flex-container flex-end">
		<div class="item_first">
			<ul>
				<li> ${id} 님</li>
				<li><a href="<%=context%>/logout.do">로그아웃</a></li>
			</ul>
		</div> 
	</div>
	<hr color="#D5D5D5" width="100%" size="1">
	<div class="flex-container">
		<div class="item_second">
			<ul>
				<li>중앙볼링장</li>
				<li><a href="<%=context%>/hyojung/loginHomeView.jsp">홈</a></li>
				<li><a href="<%=context%>/JiHyeon/informationFormIn.jsp">볼링장정보</a></li>
				<li><a href="<%=context%>/reschange.do">예약</a></li>
				<li><a href="<%=context%>/JiHyeon/mapFormIn.jsp">오시는길</a></li>
				<li><a href="<%=context%>/list.do">게시판</a></li>
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
			<form action="myDeletePro.do" name="frm" onsubmit="return chk()">
				<table width="500px" height="350px">
						<!-- 수정 세션 값으로 대체되었습니다 [김건희] -->
<%-- 					<tr>
							<td><input type="hidden" name="user_id" value="${users.id}">
							<input type="hidden" name="user_password" value="${users.pw}"></td>
						</tr> --%>
					<tr>			
						<td><span>암호 재확인  </span><input type="password" name="user_password"></td>
						<td><button type="submit">탈퇴하기</button></td>
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
