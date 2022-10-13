<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%-- <%@ include file="../memberCheck.jsp" %> --%>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제</title>
<link href="<%=context%>/css/mgrDeleteForm.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet">
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
<body style="overflow-x: hidden">
	<div class="flex-container flex-end">
		<div class="item_first">
				<ul>
					<li>${name} 관리자님</li>
					<li><a href="<%=context%>/logout.do">로그아웃</a></li>
				</ul>
			</div> 
		</div>
		<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="<%=context%>/mgrList.do"  style="color: #5A8DF3;">회원관리</a></li>
					<li><a href="">매장관리</a></li>
					<li><a href="">게시판관리</a></li>
				</ul>
			</div>
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
<main>
		<div class="flex-container">
			<div class="item_third">회원정보 삭제</div>
		</div>
		<hr color="#90C3FF" width="70%" size="1">
		<div class="flex-container center">
			<div class="item_fifth">
			<form action="<%=context%>/mgrDeletePro.do" method="post" onsubmit="return chk()"> 
				<table width="500px" height="350px">
						 <tr>
							<td><input type="hidden" name="user_id" value="${users.id}">
							<%-- <input type="hidden" name="user_password" value="${users.pw}"> --%></td>
						 </tr>
						 <tr>			
							<td><span>회원 암호 재확인  </span><input type="password" name="user_password"></td>
							<td><button type="submit" value="삭제하기">삭제하기</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>	
	<a href="#" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
	<div class="flex-container center">
		<div class="item_end">
			<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
			<div><pre class="footer">이메일  choongang@naver.com</pre></div>
		</div>
	</div>
</body>
</html>
					
