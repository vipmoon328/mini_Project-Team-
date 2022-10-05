<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<link rel="stylesheet" href="<%=context%>/css/HeadFoot.css" type="text/css">
<style type="text/css">

	#hrline {
	width: 54%;
	margin: auto;
	color : #99ccff; 
} 

 #title{
    width: 50%;
  /*   border: 1px solid #444444; */
   /*  border-collapse: collapse; */
    margin: auto;
  }
  #content{
    width: 46%;
  /*   border: 1px solid #444444; */
   /*  border-collapse: collapse; */
    margin: auto;
  }
 th, td {
	border-color: #DCDCDC;
  }
 	 

label {
	width: 50%;
	text-align: left;
}

sub {
	color: red;
}


input {
			position: relative;
			border: 0;
			height: 30px;
			width: 60px;
			background-color: #90C3FF;
			text-align: center;
			font-weight: bold; 
			color: white; 
			border-radius: 12px;
			box-shadow: 0px 3px 0px #5A8DF3; 
	}
	input:active { 
			box-shadow: 0 0 #90C3FF; 
			background-color: #90C3FF;
			top: 3px;
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
	
	<!--헤더                                        -->
	
</head>
<body>
	<!-- 게시판 출력 -->
	<form action="">
		<div id="hrline">
			<h2>게시판</h2>
			<hr>
		</div>
	<!-- <div id="scr_box">
		<label><input  type="checkbox" name="secret" value="1" >비밀글 작성</label>
	</div> -->
	
	<div id="title"><!-- 게시글 제목  -->
		<table>
		<colgroup>
			<col width="800">
			<col width="100">
			<col width="100">
		</colgroup>
		<tr><td style="vertical-align : bottom;">${board.brd_title }</td><td style="font-size:4px; vertical-align : bottom;" >${board.brd_writer }</td><td style="font-size:4px; vertical-align : bottom;" >${board.brd_date }</td></tr>
		</table>
		<!-- Content action으로 통해 db 값을 적용 -->
		<p>
	</div>
	<hr style="width: 50%;">
	
	<div id="content"><!-- 내용 -->
		<table>
			<colgroup>
				<col width="800">
			</colgroup>
			<!-- 게시글 내용 출력 -->
			<tr height="300"><td style="vertical-align : top;">${board.brd_content }</td></tr>
			<tr height="100"><td style="vertical-align : top;">파일</td></tr>
			
		</table>
	</div> 
	<!-- 수정 updateFormAction 서비스 실행 -->
	<input style="margin-left:66%"  type="button" value="수정" onclick="location.href='<%=context%>/updateForm.do?num=${board.brd_bid}&pageNum=${pageNum }'">
	<!-- 삭제 deleteFormAction 서비스 실행 -->
	<input type="button" value="삭제" onclick="location.href='<%=context%>/deleteForm.do?num=${board.brd_bid}&pageNum=${pageNum }'">
	<!-- 게시판 리스트로 복귀 -->
	<input type="button" value="목록" onclick="location.href='<%=context%>/list.do?pageNum=${pageNum }'">

	
	</form>		


		<!--풋터                       -->
		<div class="flex-container center">
			<div class="item_end">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div>
</body>
</html>