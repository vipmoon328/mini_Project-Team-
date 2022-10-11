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
			<!-- 2022.10.11 로그인 관련 수정 [건희] -->
			<div class="item_first">
				<c:choose>
					<c:when test="${empty id}">
					<ul>
						<li><a href="<%=context%>/GunHee/loginForm.jsp">로그인 </a></li> <!-- 22.09.29 효정씨가 링크한 부분 수정함 1 [김건희] -->
						<li><a href="<%=context%>/GunHee/signUpForm.jsp">회원가입</a></li>
					</ul>
					</c:when>
					
					<c:otherwise>
					<ul>
						<li>${name}님</li>
						<li><a href="<%=context%>/logout.do">로그아웃</a></li>
					</ul>
					</c:otherwise>
				</c:choose>
			</div> 
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
					<!-- 2022.10.11 링크 관련 수정 [건희] -->
					<c:choose>
						<c:when test="${auth eq 0}">
							<li>중앙볼링장</li>
							<li><a href="<%=context%>/mgrList.do" style="text-decoration: underline; color:#5A8DF3 "><strong>회원관리</strong></a></li>
							<li><a href="<%=context%>/managerSales.do">매장관리</a></li>
							<li><a href="<%=context%>/mgrBrdMgt.do">게시판관리</a></li>
						</c:when>
						
						<c:when test="${empty id}">
							<li>중앙볼링장</li>
							<li><a href="<%=context%>/hyojung/mainHomeView.jsp">홈</a></li>
							<li><a href="<%=context%>/JiHyeon/informationFormOut.jsp">볼링장정보</a></li>
							<li><a href="<%=context%>/GunHee/res_check.jsp">예약</a></li>
							<li><a href="<%=context%>/JiHyeon/mapFormOut.jsp">오시는길</a></li>
							<li><a href="<%=context%>/list.do">게시판</a></li>
						</c:when>
						
						<c:otherwise>
							<li>중앙볼링장</li>
							<li><a href="<%=context%>/hyojung/loginHomeView.jsp">홈</a></li>
							<li><a href="<%=context%>/JiHyeon/informationFormIn.jsp">볼링장정보</a></li>
							<li><a href="<%=context%>/reschange.do">예약</a></li>
							<li><a href="<%=context%>/JiHyeon/mapFormIn.jsp">오시는길</a></li>
							<li><a href="<%=context%>/list.do">게시판</a></li>
							<li><a href="<%=context%>/mypage.do">마이페이지</a></li>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
			<hr color="#D5D5D5" width="100%" size="1">
	</div>
	
	<!--헤더-->   
</head>
<body>
	<div id="secret_chk">
		<c:choose>
				<!-- 2022.10.11 관리자일 경우 암호 생략 기능 구현 [건희] -->
				<c:when test="${auth eq 0}">
					<script type="text/javascript">
						location.href='<%=context%>/boardContent.do?num=${board.brd_bid}&pageNum=${pageNum}';
					</script>
				</c:when>
				
				<c:otherwise>
			
					<h2>비밀글 입니다. 암호를 입력해주세요</h2>
					<form action="<%=context%>/secretCheckPro.do">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="num" value="${num }">
						암호 : <input type="text" name="passwd"><p>
						<input type="submit" value="확인">
					</form>
				</c:otherwise>
		</c:choose>
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