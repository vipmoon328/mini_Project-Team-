<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  String context = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="..css/mgrStyle.css">

</head>
<body>
	<div style="width: 1550px;" align="center">

		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li><strong>00점관리자님</strong></li>
					<li><a href="<%=context%>/logout.do">로그아웃</a></li>
				</ul>
			</div>
		</div>

		<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="#">회원관리</a></li>
					<li><a href="#"
						style="text-decoration: underline; color: #5A8DF3"><strong>매장관리</strong></a></li>
					<li><a href="#">게시판관리</a></li>
				</ul>
			</div>
		</div>
		<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_third">매장관리</div>
		</div>
		<hr color="#5A8DF3" width="70%" size="1">
		<!-- -------------------------------------------------------------header--------------------------------------------------------------------------------->
		
		
		<!-- ------------------------------------------------------------매장현황 조회-------------------------------------------------------------------------- -->
		<h4 style="margin-right: 60%">매장현황</h4>

		<table class="store_table" border="1">
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>레인</th>
				<th>인원</th>
				<th>예약날짜</th>
				<th>예약시간</th>
				<th>예약처리</th>
				<th>구매금액</th>
			</tr>
		</table>

		<!----------------------------------------------------------------매출조회------------------------------------------------------------------------------------>
		<h4 class="sale_title">매출정보</h4>
		<div id="sales_items">
			<ul>
				<li><pre>오늘의 방문인원     :</pre></li>
				<li><pre>오늘의 매출         :</pre></li>
				<li><pre>일평균 매출         :</pre></li>
				<li><pre>일평균 방문인원     :</pre></li>
				<li><pre>기간의 방문인원     :</pre></li>
				<li><pre>기간의 매출         :</pre></li>
				<li><pre>(선택월)의 방문인원 :</pre></li>
				<li><pre>(선택월)의 매출     :</pre></li>
				<li><pre>월평균 방문인원     :</pre></li>
				<li><pre>월평균 매출         :</pre></li>
				<li><pre>누적 방문인원       :</pre></li>
				<li><pre>누적 매출           :</pre></li>
			</ul>
		</div>

		
		<!--  구분선 -->
		<hr style="margin-left: 56.3%; margin-top: -25.7%;" color="#D5D5D5" width="28.5%" size="3">
		<hr style="margin-left: 56.3%; margin-top: 6%;" color="#D5D5D5" width="28.5%" size="3">
		<hr style="margin-left: 56.3%; margin-top: 12%;" color="#D5D5D5" width="28.5%" size="3">
		
		
		
		
		
		
s
		
		
		
		
		
		
		
		
		
		
		
		
		 <!-- <div class="flex-container center">
			<div class="footer">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div> -->

		


















		<div></div>





	</div>
</body>
</html>