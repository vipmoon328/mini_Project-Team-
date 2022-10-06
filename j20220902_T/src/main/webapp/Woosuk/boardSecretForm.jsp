<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%  String context = request.getContextPath(); %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=context%>/css/HeadFoot.css" type="text/css">
<style type="text/css">

#secret_chk{
	text-align: center;
}
</style>
<!-- 헤더  -->
<div id="wrapper">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li><a href="#">user님</li>
					<li><a href="#">로그아웃</li>
				</ul>
			</div> 
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="#">홈</a></li>
					<li><a href="#">볼링장정보</a></li>
					<li><a href="#">예약</a></li>
					<li><a href="#">오시는길</a></li>
					<li><a href="#">게시판</a></li>
					<li><a href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
			<hr color="#D5D5D5" width="100%" size="1">
	</div>
	
	<!--헤더-->   
</head>
<body>
	<div id="secret_chk">
		<h2>비밀글 입니다. 암호를 입력해주세요</h2>
		<form action="<%=context%>/secretCheckPro.do">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="num" value="${num }">
			암호 : <input type="text" name="passwd"><p>
			<input type="submit" value="확인">
		</form>
	</div>

</body>
<!--풋터                       -->
		<div class="flex-container center">
			<div class="item_end">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div>
</html>