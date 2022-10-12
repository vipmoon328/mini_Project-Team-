<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중앙 볼링장 매출관리</title>
<link href="<%=context%>/css/managerSales.css?ver0.1" rel="stylesheet" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet" >

</head>
<body style="overflow-x: hidden">
<c:if test="${loc eq 0}">
	<c:set var="locName" value="이대"></c:set>
</c:if>
<c:if test="${loc eq 1}">
	<c:set var="locName" value="강남"></c:set>
</c:if>

	<div id="wrapper">	
		<form action="mypagePro.do" method="post" onsubmit="return updateCheck()" >
			<div class="flex-container flex-end">
				<div class="item_first">
					<ul>
						<li>${name} 관리자님</li>
						<li><a href="<%=context%>/logout.do">로그아웃</a></li>
					</ul>
				</div> 
			</div>
		</form>
			<hr color="#D5D5D5" width="100%" size="1">
			<div class="flex-container">
				<div class="item_second">
					<ul>
						<li>중앙볼링장</li>
						<li><a href="<%=context%>/mgrList.do">회원관리</a></li>
						<li><a style="color: #5A8DF3" href="<%=context%>/managerSales.do">매장관리</a></li>
						<li><a href="<%=context%>/mgrBrdMgt.do">게시판관리</a></li>
					</ul>
				</div>
			</div>
			<hr color="#D5D5D5" width="100%" size="1">
			<div class="flex-container">
				<div class="item_third">매장관리</div>
			</div>
			<hr color="#90C3FF" width="70%" size="1">
			<div class="flex-container center">
				<div class="item_fourth">
					<ul>
						<li><a href="<%=context%>/managerSales.do">매출현황</a></li>
						<li><a href="<%=context%>/managerSalesInfo.do">매출정보</a></li>		
					</ul>
				</div>
			</div>
			<div class="flex-container center">
				<div class="item_fifth"> 
					<div class="searchbox">
						<form action="<%=context%>/managerSelectDate.do" name="frm"> 
						<h4>매출현황</h4>
						<label>조회기간  :  </label><input type="date" name="startDate" id="startDate" value="${startDate}" >  -  <input type="date"  name="endDate"  id="endDate" value="${endDate}"> 
												 <input type="submit" value="조회">
												 <input type="reset"  value="새로고침">
												 <input type="button" value="전체조회"  onclick="location.href='managerSales.do'">
																		 
						</form>
					</div>
					<br>
					<div id="table_box">
					<table class="store" border="1" style="border: solid; border-color: #90C3FF; width: 900px;">
						<tr>
							<th>순서</th>
							<th>회원번호</th>
							<th>회원이름</th>
							<th>레인</th>
							<th>인원</th>
							<th>예약날짜</th>
							<th>예약시간</th>				
							<th>예약처리</th>
							<th>구매금액</th>
						</tr>
					<c:if test="${totCnt > 0}">
					<c:forEach var="reserve" items="${reserveList}">
						<tr>
							<td>${startNum}</td>
							<td>${reserve.usernum}</td>
							<td>${reserve.name}</td>
							<td>${reserve.res_lane}</td>
							<td>${reserve.res_customer}</td>
							<td>${reserve.res_date}</td>
							<td>${reserve.res_startTime} ~ ${reserve.res_endTime}</td>
							<td>
								<c:choose>
									<c:when test="${reserve.res_cancel == 0}">
										<span style="color: blue;"><c:out value="결제"></c:out></span>
									</c:when>
									<c:otherwise>
										<span style="color: red;"><c:out value="예약취소"></c:out></span>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<fmt:formatNumber value="${reserve.res_sal}" pattern="#,###"></fmt:formatNumber>
							</td>							
						</tr>
						<c:set var="startNum" value="${startNum-1}"></c:set>
					</c:forEach>
					</c:if>
					<c:if test="${totCnt == 0}">
						<tr>
							<td colspan="9"> 조회 데이터가 없습니다.</td>
						</tr>
					</c:if>
					</table>
					</div>
					<div id="number" style="text-align: center;">
						<c:if test="${startPage > blockSize}">
							<a href="managerSelectDate.do?pageNum=${startPage-blockSize}&startDate=${startDate}&endDate=${endDate}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="managerSelectDate.do?pageNum=${i}&startDate=${startDate}&endDate=${endDate}">[${i}]</a>
						</c:forEach>
						<c:if test="${endPage <pageCnt}">
							<a href="managerSelectDate.do?pageNum=${startPage+blockSize}&startDate=${startDate}&endDate=${endDate}">[다음]</a>
						</c:if>						
					</div>						
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