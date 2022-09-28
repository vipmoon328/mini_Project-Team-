<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="HeadFoot.css" type="text/css">
<style type="text/css">
	table {
    width: 80%;
	border-top: 2px solid #444444;
	border-bottom: 2px solid #444444;
    border-collapse: collapse;
    margin: auto;
 	 }
  	th{
  		padding: 10px;
  		text-align: center;
 	 }
  
	td {
	border-bottom : 1px solid black;
    padding: 10px;
    font-size: 75%;
    text-align: center;
  }
  
  	input{
  		border: 1px solid #bbb;
	 	border-radius: 8px;
	  	padding: 8px 10px;
	  	font-size: 14px;
  	}
  	input :active{
  	
  	}
	#hrline {
	width: 84%;
	margin: auto;
	color : #99ccff; 
} 
	#wr_btn{
	margin-right: 100px;
	margin-top : 20px;
	float: right;
	background-color:#99ccff;
	color:#fff;
	}
	
	#wr_btn :active{
	margin-right: 100px;
	margin-top : 20px;
	float: right;
	background-color:#1E90FF;
	color:#fff;
	}
 
	#search{
		position: relative;
  		width: 400px;
  		margin: auto;
  		margin-top: 50px;
  		
  		
	}

	#srh_input{
		width: 200px;
	  	border: 1px solid #bbb;
	 	border-radius: 8px;
	  	padding: 10px 12px;
	  	font-size: 14px;
	  	
	}
	
	
	#srh_btn {
		 position: relative;
		 top:2px;
		 background-color:#99ccff;
		color:#fff;
	}
	
	#srh_select{
		border: 1px solid #bbb;
	 	border-radius: 8px;
	  	padding: 8px 10px;
	  	font-size: 14px;
	}
	
	.page_wrap {
	text-align:center;
	font-size:0;
	margin-top: 30px;
	margin-left: 110px;
	 }
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .pprev {
		background:#f8f8f8 url('images/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('images/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('images/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('images/page_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation a.active {
		background-color:#1E90FF;
		color:#fff;
		border:1px solid #42454c;
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
	
	
	
</head>
<body>
		<form action="">
			<div id="hrline">
				<h2>게시판</h2>
				<hr>
			</div>
			
			<div class="boardList">
				<table>
					<colgroup>
						<col width="100">
						<col width="1000">
						<col width="300">
						<col width="200">
						<col width="200">
					</colgroup>
					
					<tr bgcolor="#e9ecef">
						<th>번호</th>
				        <th>제목</th>
				        <th>작성자</th>
				        <th>작성일자</th>
				        <th>조회수</th>
			        </tr>
			        
			        
			        <c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${startNum }</td>  
					<td class="left" width=200>
						 <a href='content.do?num=${board.brd_bid}&pageNum=${currentPage}'>
							${board.brd_title}</a>
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
			      <!--   <tr>
			          <td>1</td>
			          <td class="title">공지사항</td>
			          <td class="name">글쓴이 이름</td>
			          <td class="date">2008/02/14</td>
			          <td class="see">1214</td>
			        </tr> -->
					
				</table>
			</div>
			<input id="wr_btn" type="button" value="글작성" class="active" href="writeForm.do">
			
			<div class="page_wrap">
			   <div class="page_nation">
			      <a class="arrow pprev" href="#"></a>
			      <a class="arrow prev" href="#"></a>
			      <a href="#" class="active">1</a>
			      <a href="#">2</a>
			      <a href="#">3</a>
			      <a href="#">4</a>
			      <a href="#">5</a>
			      <a href="#">6</a>
			      <a href="#">7</a>
			      <a href="#">8</a>
			      <a href="#">9</a>
			      <a href="#">10</a>
			      <a class="arrow next" href="#"></a>
			      <a class="arrow nnext" href="#"></a>
			   </div>
			</div>

			<div id="search">
				<select id="srh_select">
					<option value="작성자">작성자</option>
					<option value="제목">제목</option>
				</select>
				<input id="srh_input" type="text" placeholder="검색어 입력">
				<input id="srh_btn" type="button" value="검색">
			</div>
		</form>
		
		<div class="flex-container center">
			<div class="item_end">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div>

</body>
</html>