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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#brd_secret').click(function(){
		
	        if ($('#brd_secret').prop("checked")) {
	        	$('#brd_secret').val('Y');
	        } else {
	        	 $('#brd_secret').val('N');
	        }
			
	         

		})  
	});
</script>

<link rel="stylesheet" href="<%=context%>/css/HeadFoot.css" type="text/css">
<style type="text/css">

	#hrline {
	width: 84%;
	margin: auto;
	color : #99ccff; 
} 

 table {
    width: 80%;
  /*   border: 1px solid #444444; */
   /*  border-collapse: collapse; */
    margin: auto;
  }
 th, td {
	border-color: #DCDCDC;

  }
 	 

label {
	width: 80%;
	text-align: left;
}

sub {
	color: red;
}
/* input{
	width: 98%;
	border: none;
	border: 1.5px solid #DCDCDC; 
	vertical-align : top;


} */

#scr_box{
	position: relative;
	left: 79%;
}

</style>



<!-- 헤더  -->
<div id="wrapper">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li>${id}님</li>
					<li><a href="<%=context%>/logout.do">로그아웃</a></li>
				</ul>
			</div> 
		</div>
	<hr color="#D5D5D5" width="100%" size="1">
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="<%=context%>/hyojung/loginHomeView.jsp">홈</a></li>
					<li><a href="<%=context%>/JiHyeon/informationFormIn.jsp">볼링장정보</a></li>
					<li><a href="<%=context%>/reschange.do">예약</a></li>
					<li><a href="<%=context%>/JiHyeon/mapFormIn.jsp">오시는길</a></li>
					<li><a href="<%=context%>/list.do">게시판</a></li>
					<li><a href="<%=context%>/mypage.do">마이페이지</a></li>
				</ul>
			</div>
		</div>
			<hr color="#D5D5D5" width="100%" size="1">
	</div>
	
	<!--헤더                                        -->
	
</head>
<body>
	<form action="<%=context%>/updatePro.do" method="post">
	<input type="hidden" name="brd_bid" value="${board.brd_bid }">
	<input type="hidden" name="pageNum" value="${pageNum }">

	
	
		<div id="hrline">
			<h2>게시판</h2>
			<hr>
		</div>
		<!-- 비밀글 값 여부에 따라 체크박스에 체크가 유뮤 조건 -->
	<div id="scr_box">
		<c:if test="${board.brd_secret == 0  }">
			<label><input  type="checkbox" name="brd_secret"  id="brd_secret"   value="N">비밀글 작성</label>
		</c:if>
		<c:if test="${board.brd_secret != 0  }">
			<label><input  type="checkbox" name="brd_secret"  id="brd_secret"  checked="checked" value="Y">비밀글 작성</label>
		</c:if>
		
	</div>
	
	<div id="title"><!--제목  -->
		<table>
		<colgroup>
			<col width="100">
			<col width="900">
		</colgroup>
			<tr><td style="	text-align: center;">제목<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;">
			<input type="text" name="brd_title" required="required" value="${board.brd_title }" ></td></tr>
			</table>
		<p>
	</div>
	
	<div id="content"><!-- 내용 -->
		<table>
			<colgroup>
				<col width="100">
				<col width="900">
			</colgroup>
			<tr height="300"><td style="text-align: center;">내용<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;	 text-align:center;">
			<input style="width:300px; height:300px;" type="text" name="brd_content" required="required" value="${board.brd_content }" ></td></tr>
			<!-- 사진 내용 추가 예정 -->
			<tr height="100"><td style="text-align: center;">사진</td><td style="border: 1.5px solid #DCDCDC; vertical-align : top;">1</td></tr>
		</table>
	</div> 
				<!-- 수정submit form통해 updateProAction 서비스 실행 -->
		<table><tr><td><input type="submit" value="수정"></td>
				<!-- 뒤로가기 -->
			   <td><input type="button" onclick="history.back()" value="취소"></td></tr></table>
		
	

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