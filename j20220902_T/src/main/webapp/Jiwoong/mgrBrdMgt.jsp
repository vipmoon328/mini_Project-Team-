<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%  String context = request.getContextPath(); %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
<link rel="stylesheet" href="<%=context%>/css/mgrBrdMgt.css?v=<%=System.currentTimeMillis() %>" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet" > 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() { // 삭제 버튼 동적 생성
		$("#delete_btn").hide();
		$(document).on("change",".brd_bid,#all_chk", function(){
		if(	$(".brd_bid").is(':checked')){
			$("#delete_btn").show();
		}else{
			$("#delete_btn").hide();
		}
		});
	});
	
	function allChk() { // 전체체크 및 해제
		
		if($("#all_chk").is(':checked')){
		 	$("#delete_btn").val('전체삭제'); 
			$("input[name=brd_bid]").prop("checked",true);
			
		}else{
			 $("#delete_btn").val('선택삭제'); 
			$("input[name=brd_bid]").prop("checked",false);		
		}
	}	
</script>
</head>
<!-- 22.10.11 링크 관련 수정 [김건희] -->	
<body style="overflow-x: hidden">	
<div id="wrapper">
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
				<li><a href="<%=context%>/mgrList.do" >회원관리</a></li>
				<li><a href="<%=context%>/managerSales.do">매장관리</a></li>
				<li><a href="<%=context%>/mgrBrdMgt.do"style="color:#5A8DF3"><strong>게시판관리</strong></a></li>
			</ul>
		</div>
	</div>
	<hr color="#D5D5D5" width="100%" size="1">
	<div class="flex-container">
		<div class="item_third">게시판 관리</div>
	</div>
	<hr color="#90C3FF" width="70%" size="1">
	<div class="flex-container center">
		<form name="chk_delete" method="post" action="<%=context%>/mgrBrdDeletePro.do">	
			<div class="boardList">	
				<table>
					<colgroup>
						<col width="80">
						<col width="80">
						<col width="80">
						<col width="600">
						<col width="140">
						<col width="140">
						<col width="80">
					</colgroup>
					<tr bgcolor="#90C3FF">
						<th><input type="checkbox" name="all_chk" id="all_chk" onclick="allChk()" ></th>
						<th>번호</th>
						<th>구분</th>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>작성일자</th>
					    <th>조회수</th>
				     </tr>
				<c:if test="${totCnt > 0}">
					<c:forEach var="board" items="${list}"><!--반복문을 통해 리스트 출력  -->
						<tr>	
							<td><input type="checkbox" class="brd_bid" name="brd_bid" value="${board.brd_bid}"></td>  
							<td>${startNum }</td>
							<td>${board.brd_name }</td>
							<td class="left" width=100 height="20">
							 	<c:if test="${board.brd_secret > 0}"><!--비밀글 값이 1 인 게시물은 잠금 이미지가 나타난다  -->
									<img src='images/Lock_icon.png'>
								</c:if>
								<!-- 지정한 게시글을 불러오기 위한 ContentAction.service 진행 -->
								<c:if test="${board.brd_secret > 0}">
									<a class="list_title" href='secretCheckForm.do?num=${board.brd_bid}&pageNum=${currentPage}'>${board.brd_title}</a>
								</c:if>
								<c:if test="${board.brd_secret == 0}">
									<a class="list_title" href='boardContent.do?num=${board.brd_bid}&pageNum=${currentPage}'>${board.brd_title}</a>
								</c:if>
							</td>
							<td>${board.brd_writer}</td>
							<td>${board.brd_date}</td>
							<td>${board.brd_view}</td>
						</tr>
						<c:set var="startNum" value="${startNum - 1}" />
					</c:forEach>
				</c:if>
				<c:if test="${totCnt == 0}">
					<tr>
						<td colspan=7>게시글이 존재하지 않습니다.</td>
					</tr>
				</c:if>		
				</table>
			</div>
				<!-- 게시글 삭제 및 공지사항 작성 버튼 -->
			<div class="flex-container.right" id="brd_Btn">
				<input class="button" id="wr_btn" type="button" value="글쓰기" onclick="location.href='<%=context%>/brdNoticeForm.do'"> 
				<input class="button" id="delete_btn" type="submit" value="선택삭제" >  <!-- 삭제버튼 -->
			</div>
			<!-- 페이징 -->
			<div class="page" style="text-align: center;">
				<c:if test="${startPage > blockSize}">
					<a class="page" href='<%=context%>/mgrBrdMgt.do?pageNum=${startPage-blockSize}'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a class="page" href='<%=context%>/mgrBrdMgt.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a class="page" href='<%=context%>/mgrBrdMgt.do?pageNum=${startPage+blockSize}'>[다음]</a>
				</c:if>
			</div>
		</form> 
	</div>		

		<!-- 검색기능  -->
	<div class="flex-container.center">
		<form action="<%=context%>/mgrBrdMgt.do?pageNum=${pageNum}" method="post">
			<div id="search">
				<select id="srh_select" name="srh_select">
					<option value="brd_title">제목</option>
					<option value="brd_writer">작성자</option>
				</select>
				<input id="srh_input" name="srh_input" type="text" placeholder="검색어 입력">
				<input class="button2" id="srh_btn" type="submit" value="검색">
			</div>
		</form>
	</div>
</div>
	<!--풋터-->
	<a href="#" title="" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
	<div class="flex-container center">
		<div class="item_end">
			<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
			<div><pre class="footer">이메일  choongang@naver.com</pre></div>
		</div>
	</div>
</body>
</html>