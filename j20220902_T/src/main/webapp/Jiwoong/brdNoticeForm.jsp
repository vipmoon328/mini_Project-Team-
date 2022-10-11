<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  String context = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=context%>/css/brdNoticeForm.css?v=<%=System.currentTimeMillis() %>" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"></script>
<meta charset="UTF-8">
<title>공지사항 작성</title>

</head>

<body>
	
	<!-- header -->
	<div id="wrapper">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li>${id}님</li>
					<li><a href="<%=context%>/logout.do">로그아웃</a></li>
				</ul>
			</div> 
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="<%=context%>/mgrList.do">회원관리</a></li>
					<li><a href="#">매장관리</a></li>
					<li><a href="<%=context%>/mgrBrdMgt.do" style="color:#5A8DF3 ">게시판 관리</a></li>
				</ul>
			</div>
		</div>
			<hr color="#D5D5D5" width="100%" size="1">
	</div>
	
		<div class="flex-container">
			<div class="item_third">공지사항</div>
		</div>
	<hr color="#90C3FF" width="70%" size="1">
	
	
	<form action="<%=context%>/writePro.do"method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="brd_bid" value="${num }">
		<input type="hidden" name="brd_ref" value="${brd_ref }">
		<input type="hidden" name="brd_re_level" value="${brd_re_level }">
		<input type="hidden" name="brd_re_step" value="${brd_re_step }">
	
	
	
	
	
	<!--풋터  -->
		<div class="flex-container center">
			<div class="item_end">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div>
	
</body>
</html>