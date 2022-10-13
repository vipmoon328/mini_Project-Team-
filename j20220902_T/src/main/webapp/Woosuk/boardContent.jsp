<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  String context = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	console.log('현재 유저 번호: ${usernum}');
	console.log('게시판 작성자 번호: ${board.usernum}');
</script>
<meta charset="UTF-8">
<title>게시글</title>
<link rel="stylesheet" href="<%=context%>/css/HeadFoot.css" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet" > 
<style type="text/css">
#input_ch {
			height:30px;  /* 입력창 높이 */
			border-radius: 12px;  /* 테두리 모서리 둥굴게 */
			border: 1;  /* 테두리 두께 */
			border-color: #EAEAEA; /* 테두리 색상 */
	}
	
pre{
	word-wrap: break-word;
	position: top;
	 font-size: 16px;
	font-family: "NanumSquareNeo";
}

textarea{
	border: none;
}
#commentwrite{
	width: 50%;
	margin: auto;
	border-collapse: collapse;
	background-color: #D5D5D5;
}

#srh_btn {
		 position: relative;
		 top:2px;
		 background-color:#99ccff;
		color:#fff;
	}

#comment{
	width: 50%;
	/* border-collapse: collapse; */
	border-bottom : 1px solid black;
	margin: auto;

}
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
   border-bottom : 1px solid #D5D5D5;
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
</head>
<body>
<div id="wrapper">
	<!-- 헤더  -->
		<div class="flex-container flex-end">
			<div class="item_first">
			<!-- 로그인 여부에 따른 분기를 하나의 페이지로 구현하기 위해서 사용 [김건희] -->
				<c:choose>
					<c:when test="${empty id}">
					<ul>
						<li><a href="<%=context%>/GunHee/loginForm.jsp">로그인 </a></li> <!-- 22.09.29 효정씨가 링크한 부분 수정함 1 [김건희] -->
						<li><a href="<%=context%>/GunHee/signUpForm.jsp">회원가입</a></li>
					</ul>
					</c:when>
					
					<c:when test="${auth eq 0}">
					<ul>
						<li>${name} 관리자님</li>
						<li><a href="<%=context%>/logout.do">로그아웃</a></li>
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
	
	
	<!--헤더                                        -->
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

			<tr><td align="top" ><p/><p/><pre>${board.brd_content }</pre><p/><p/></td></tr>

				<c:if test="${not empty board.brd_img_src}">
					<c:forEach var="img_path" items="${board.brd_img_src }">
						<tr height="100"><td style="vertical-align : top;"><img src= "<%=context%>/fileSave/${img_path }"></td></tr>
					</c:forEach>
				</c:if>
		</table>
	</div> 
	<!-- 조건시에 삭제랑 수정 기능이 보여질수 있도록 수정 [김건희]-->
	<!-- 수정 updateFormAction 서비스 실행 -->
	<!-- 삭제 deleteFormAction 서비스 실행 -->
	<!-- 게시판 리스트로 복귀 -->
	<p>
	<c:choose>
		<c:when test="${usernum eq board.usernum}">
			<input style="margin-left:66%" type="button" id="input_ch" value="수정" onclick="location.href='<%=context%>/updateForm.do?num=${board.brd_bid}&pageNum=${pageNum }'">
			<input type="button" id="input_ch" value="삭제" onclick="location.href='<%=context%>/deleteForm.do?num=${board.brd_bid}&pageNum=${pageNum }'">
			<input type="button" id="input_ch" value="목록" onclick="location.href='<%=context%>/list.do?pageNum=${pageNum}'">
		</c:when>
		<c:otherwise>
			<input id="input_ch" style="margin-left:66%" style="margin-left:66%" type="button" value="목록" onclick="location.href='<%=context%>/list.do?pageNum=${pageNum}'">
		</c:otherwise>
	</c:choose>
	
	
	
	</form>	
	
	<!-- 댓글 기능 2022.10.09 -->
	<h4 style="margin-left:25%">댓글 ${refcnt }</h4>
	<hr color="#D5D5D5" width="50%" size="1">
		<c:forEach var="board" items="${mentList }">
			<table  id="comment">
				<colgroup>
					<col width="800">
					<col width="100">
				</colgroup>
				<tr><td style="padding:4px;">${board.brd_writer}</td>
				<td style="font-size:4px; vertical-align : bottom; text-align: right;">${board.brd_date }</td></tr><!-- 아이디 -->
				<tr><td>
				<pre>${board.brd_content }</pre>
				</td><!-- 내용 -->
				<!-- 2022.10.10 삭제가 안나옴 수정도 마찬가지   -->
			<c:choose>
				<c:when test="${id eq board.brd_writer}">
						<td style="padding:4px;"><input style="margin-left:50px;" type="button" value="삭제" onclick="location.href='<%=context%>/deleteForm.do?num=${board.brd_bid}&pageNum=${pageNum }'"></td></tr>
				</c:when>
			</c:choose>
			</table>
		</c:forEach>
	
	<form action="commentWritePro.do?num=${board.brd_bid}&pageNum=${pageNum }"method="post">
		<div>
			
			<input type="hidden" name="brd_bid" value="${board.brd_bid }">
			<input type="hidden" name="brd_ref" value="${board.brd_ref }">
			<input type="hidden" name="brd_re_level" value="${board.brd_re_level }">
			<input type="hidden" name="brd_re_step" value="${board.brd_re_step }">
			<input type="hidden" name="brd_title" value="">
			<input type="hidden" name="brd_secret" value="">
		
			<p>
			<c:choose>
				<c:when test="${empty id}">
				</c:when>
				<c:otherwise>
						<table border="1" id="commentwrite">
						<colgroup>
							<col width="900">
							<col width="45">
						</colgroup>
						<tr><td style="padding:4px;">${id}</td></tr><!-- 아이디 -->
						<tr><td>
						<textarea name="brd_content" id="brd_content" required="required" style="width: 99.6%" rows="6" ></textarea>
						</td>
						<td style="padding:4px; "><input id="comment_button" style="margin-left: 1%; vertical-align : top;" type="submit" value="답글" ></td></tr>
					</table>	
				</c:otherwise>
			</c:choose>
			
			
			
		</div>
	</form>	
		<!--풋터                       -->
		<a href="#" title="" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
		<div class="flex-container center">
			<div class="item_end">
				<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre class="footer">이메일  choongang@naver.com</pre></div>
			</div>
		</div>
	</div>
</body>
</html>