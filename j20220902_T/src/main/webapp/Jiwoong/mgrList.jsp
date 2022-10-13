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
<link href="<%=context%>/css/mgrList.css?ver0.1" rel="stylesheet" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet" >
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		if('${searchField}'!=null && '${searchField}'!=""){
			$('#searchField').val('${searchField}').prop("selected",true);
		}
	});
</script>
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
						<li><a style="color: #5A8DF3"href="<%=context%>/mgrList.do">회원관리</a></li>
						<li><a  href="<%=context%>/managerSales.do">매장관리</a></li>
						<li><a href="<%=context%>/mgrBrdMgt.do">게시판관리</a></li>
					</ul>
				</div>
			</div>
			<hr color="#D5D5D5" width="100%" size="1">
			<div class="flex-container">
				<div class="item_third">회원관리</div>
			</div>
			<hr color="#90C3FF" width="70%" size="1">
			<div class="flex-container center">
				<div class="item_fourth">
					<ul>
						<li><a></a></li>
						<li><a></a></li>		
					</ul>
				</div>
			</div>
			<div class="flex-container center">
				<div class="item_fifth"> 
					<div class="searchbox">
						<form method="post" name="search_form" action="<%=context%>/mgrList.do" >
						<center><h3>회원목록</h3></center>
						<label></label><select class="form_control" id="searchField" name="searchField" onclick="searchOption()">
											<option value="" disabled selected>--선택--</option>
											<option value="name">이름</option>
											<option value="id">ID</option>
										</select>	
												 <input type= "text" placeholder="검색어 입력" id="query" name="query" value="${query }" maxlength="50" >
												<input type="submit" value="검색" class="btn_success"></input>
																		 
						</form>
					</div>
					<br>
					<div id="table_box">
					<table border="1" style="border: solid; border-color: #90C3FF;  ">
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>성별</th>
							<th>연락처</th>
							<th>이메일</th>				
							<th>회원여부</th>
							<th>회원관리</th>
						</tr>
					<c:if test="${totCnt > 0 }">
			<c:forEach var="users" items="${list }">
				<tr>
				    <td>${startNum }</td> 
					<td>${users.id }</td>
					<td>${users.pw } </td>
					<td>${users.name}</td>
					<td>${users.gender}</td>
					<td>${users.phone}</td>
					<td>${users.email}</td>
					<td>
						<c:choose>
							<c:when test="${users.deleted==1}">
								<span style="color: blue;"><c:out value="회원"></c:out></span>
								</td>
								<td>
								<button type="button" onclick="location.href='<%=context%>/mgrUpdateForm.do?id=${users.id}&pageNum=${pageNum}'">수정</button><button type="button" onclick="location.href='<%=context%>/mgrDeleteForm.do?id=${users.id}&pageNum=${pageNum}'">삭제</button> 
							</c:when>
							<c:otherwise>
								<span style="color: red;"><c:out value="탈퇴"></c:out></span>
								</td>
								<td>
								<button type="button" onclick="location.href='<%=context%>/mgrUpdateForm.do?id=${users.id}&pageNum=${pageNum}'">수정</button><button type="button" onclick="location.href='<%=context%>/recoverUser.do?userNum=${users.usernum}&pageNum=${pageNum}'">복구</button> 
							</c:otherwise>
						</c:choose>
					</td>
						
				</tr>
						<c:set var="startNum" value="${startNum + 1 }" />  
						</c:forEach>	
					</c:if>
				<c:if test="${totCnt == 0 }">
					<tr>
						<td colspan=9 align="center">조회 데이터가 없습니다.</td>
					</tr>
				</c:if>		
				</table>		
					</div>
					<div id="number" style="text-align: center;">
						<c:if test="${startPage > blockSize }">
							<a class="number" href='<%=context%>/mgrList.do?pageNum=${startPage-blockSize}&searchField=${searchField }&query=${query}'>[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a class="number" href='<%=context%>/mgrList.do?pageNum=${i}&searchField=${searchField }&query=${query}'>[${i}]</a>
						</c:forEach>
						<c:if test="${endPage < pageCnt }">
							<a class="number" href='<%=context%>/mgrList.do?pageNum=${startPage+blockSize}&searchField=${searchField }&query=${query}'>[다음]</a>
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