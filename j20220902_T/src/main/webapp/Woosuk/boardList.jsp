<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%  String context = request.getContextPath(); %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판리스트</title>
<script type="text/javascript">
	$('#srh_select').val('${srh_select}').prop("selected",true);
	console.log('현재 유저 번호: ${usernum}');
	function length_check() {
		if(search_frm.srh_input.value.length<2){
			//value는 이 태그안에 값(id에 값을 안넣었다면)
			alert("검색어는 2글자 이상 설정해주세요");
			search_frm.srh_input.focus();//해당 요소로 대기상태옮겨줌
			return false;
		}else{
			return true;
		}
		return true;
	}
</script>
<link rel="stylesheet" href="<%=context%>/css/boardList.css" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet" > 
</head>
<body style="overflow-x: hidden">
<div id="wrapper">
	<!-- 헤더  -->
		<div class="flex-container flex-end">
			<div class="item_first">
			<!-- 22.10.06 [김건희] 로그인 여부에 따라 화면 출력 차이 구현  -->
			<!-- 로그인 여부에 따른 분기를 하나의 페이지로 구현하기 위해서 사용 [김건희] -->
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
				<ul>
					<!-- 22.10.06 [김건희] 로그인 여부에 따라 화면 출력 차이 구현  -->
					<!-- 22.10.11 [김건희] 관리자일떄의 분기 수정  -->
					<!-- 로그인 여부에 따른 분기를 하나의 페이지로 구현하기 위해서 사용 [김건희] -->
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
				</ul>
			</div>
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_third">게시판</div>
		</div>
	<hr color="#90C3FF" width="70%" size="1">
	<div class="flex-container center">
		<form action="">
			<div class="boardList">
				<table>
					<colgroup>
						<col width="100">
						<col width="100">
						<col width="600">
						<col width="150">
						<col width="150">
						<col width="100">
					</colgroup>
					
					<tr bgcolor="#e9ecef">
						<th>번호</th>
						<th>구분</th>
				        <th>제목</th>
				        <th>작성자</th>
				        <th>작성일자</th>
				        <th>조회수</th>
			        </tr>
			        
			        
			        <c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }"><!--반복문을 통해 리스트 출력  -->
				<tr>
					<td>${startNum }</td>  
					<td>${board.brd_name }</td>
					<td class="left" width=100 height="20">
					 		<c:if test="${board.brd_secret > 0}"><!--비밀글 값이 1 인 게시물은 잠금 이미지가 나타난다  -->
							    <img src='images/Lock_icon.png'>
						   </c:if>
						<!-- 지정한 게시글을 불러오기 위한 ContentAction.service 진행 -->
						<c:if test="${board.brd_secret > 0 }">
							<a class="list_title" href='secretCheckPro.do?num=${board.brd_bid}&pageNum=${currentPage}'>${board.brd_title}</a>
						</c:if>
						<c:if test="${board.brd_secret == 0 }">
							<a class="list_title" href='boardContent.do?num=${board.brd_bid}&pageNum=${currentPage}'>${board.brd_title}</a>
						</c:if>
					</td>
					<td>${board.brd_writer}</td>
					<td>${board.brd_date}</td>
					<td>${board.brd_view}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			<%-- 	<c:set var="numbering" value="${numbering + 1 }" /> --%>
			</c:forEach>
					</c:if>
					<c:if test="${totCnt == 0 }">
						<tr>
							<td colspan=7>데이터가 없네</td>
						</tr>
					</c:if>					
				</table>
			</div>
			<!-- <input id="wr_btn" type="button" value="글작성" class="active" href="writeForm.do"> -->
			
			<!-- 22.10.06 [김건희] 로그인 여부에 따라 화면 출력 차이 구현  -->
			
			<c:choose>
					<c:when test="${empty id}">
					</c:when>
					
					<c:otherwise>
						<div class="flex-container.right">
							<p><input class="button" type="button" value="글쓰기" onclick="location.href='<%=context%>/writeForm.do'">
						</div>
					</c:otherwise>
			</c:choose>
			
			<!-- 페이징 -->
			<div class="page" style="text-align: center;">
				<c:if test="${startPage > blockSize }">
					<a class="page" href='<%=context%>/list.do?pageNum=${startPage-blockSize}&srh_input=${srh_input }&srh_select=${srh_select}'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a class="page" href='<%=context%>/list.do?pageNum=${i}&srh_input=${srh_input }&srh_select=${srh_select}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<a class="page" href='<%=context%>/list.do?pageNum=${startPage+blockSize}&srh_input=${srh_input }&srh_select=${srh_select}'>[다음]</a>
				</c:if>
			</div> 
		</form>
	</div>
		<!-- 검색기능  -->
	<div class="flex-container.center">
		<form action="<%=context%>/list.do?pageNum=${pageNum }" id="search_frm" method="post" onsubmit="return length_check()">
			<div id="search">
				<select id="srh_select" name="srh_select" >
					<option value="brd_title">제목</option>
					<option value="brd_writer">작성자</option>
				</select>
				<input id="srh_input" name="srh_input" type="text" placeholder="검색어 입력" value="${srh_input }">
				<input style="margin-right: 20px;" class="button" type="submit" value="검색">
				
			</div>
		</form>
	</div>
</div>
		<!--풋터                       -->
		<a href="#" title="" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
		<div class="flex-container center">
			<div class="item_end">
				<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre class="footer">이메일  choongang@naver.com</pre></div>
			</div>
		</div>
</body>
</html>