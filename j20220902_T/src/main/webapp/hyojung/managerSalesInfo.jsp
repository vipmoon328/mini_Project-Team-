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
<link href="<%=context%>/css/managerSalesInfo.css?ver0.1" rel="stylesheet" type="text/css">
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
						<li><a href="<%=context%>/logout.do"">로그아웃</a></li>
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
						<li><a href="<%=context%>/managerSales.do">매장관리</a></li>
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
					<form action="managerSalesInfo.do">
						<div class="searchbox">			
							<h4>매출정보</h4>		
						</div>								
							<div id="salesbox" >
								<div id="sales_list">							
									<table class="store" border="1" style="border: solid; border-color: #90C3FF; width: 500px;">
										<tr>
											<th>순서</th>
											<th>회원번호</th>
											<th>회원이름</th>
											<th>총구매금액</th>
										</tr>
										<c:if test="${usertotCnt > 0}">
											<c:forEach var="reserve" items="${reserveSalesList}">
												<tr>
													<td>${startNum}</td>
													<td>${reserve.usernum}</td>
													<td>${reserve.name}</td>
													<td>
														<fmt:formatNumber value="${reserve.sum_sal}" pattern="#,###"></fmt:formatNumber>
													</td>						
												</tr>
												<c:set var="startNum" value="${startNum-1}"></c:set>
											</c:forEach>
										</c:if>
										<c:if test="${usertotCnt == 0}">
											<tr>
												<td colspan="7">데이터가 없습니다.</td>
											</tr>
										</c:if>
									</table>
								</div>
								<div id="number" style="text-align: center;">
									<c:if test="${startNum > blockSize}">
										<a href="managerSalesInfo.do?infopageNum=${startPage-blockSize}">[이전]</a>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<a href="managerSalesInfo.do?infopageNum=${i}">[${i}]</a>
									</c:forEach>
									<c:if test="${endPage <pageCnt}">
										<a href="managerSalesInfo.do?infopageNum=${startPage+blockSize}">[다음]</a>
									</c:if>			
								</div>
							</div>
							<div id="moneybox">
								<table border="1" style="border: solid; border-color: #90C3FF; width: 300px;" >
									<tr>
										<td>현재 월매출 총금액 : </td><td>${monSales}</td>
									</tr>
									<tr>
										<td>현재 월방문 총인원수 : </td><td>${monVisit}</td>
									</tr>
									<tr>
										<td>현재 월평균 매출금액 : </td><td>${monAvgSales}</td>
									</tr>
									<tr>
										<td>현재 월평균 방문인원수 : </td><td>${monAvgVisit}</td>
									</tr>
									<tr>
										<td>누적 매출금액 : </td><td>${totSales}</td>
									</tr>
									<tr>
										<td>누적 방문인원수 : </td><td>${totVisit}</td>
									</tr>
								</table>
							</div>

					</form>											
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