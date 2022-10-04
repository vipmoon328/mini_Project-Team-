<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<link rel="stylesheet" href="HeadFoot.css" type="text/css">
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

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#brd_secret').click(function(){
		
	        if ($('#brd_secret').prop("checked")) {
	        	$('#brd_secret').val(1);
	        } else {
	        	 $('#brd_secret').val(0);
	        }
			
	         

		})  
	});

</script>

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
	<form action="writePro.do?pageNum=${pageNum }" method="post">
	<input type="hidden" name="brd_bid" value="${num }">
	<input type="hidden" name="brd_ref" value="${brd_ref }">
	<input type="hidden" name="brd_re_level" value="${brd_re_level }">
	<input type="hidden" name="brd_re_step" value="${brd_re_step }">
	
	
		<div id="hrline">
			<h2>게시판</h2>
			<hr>
		</div>
	<div id="scr_box">
		<label><input  type="checkbox" name="brd_secret"  id="brd_secret"  value="0" 
		               required="required" >비밀글 작성</label>
	</div>
	
	<div id="title"><!--제목  -->
		<table>
		<colgroup>
			<col width="100">
			<col width="900">
		</colgroup>
		<c:if test="${num==0 }">
			<tr><td style="	text-align: center;">제목<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;">
			<input type="text" name="brd_title" required="required" ></td></tr>
			</table>
		</c:if>
		<p>
	</div>
	
	<div id="content"><!-- 내용 -->
		<table>
			<colgroup>
				<col width="100">
				<col width="900">
			</colgroup>
			<tr height="300"><td style="text-align: center;">내용<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;	 text-align:center;">
			<input style="width:300px; height:300px;" type="text" name="brd_content" required="required" ></td></tr>
			<tr height="100"><td style="text-align: center;">사진</td><td style="border: 1.5px solid #DCDCDC; vertical-align : top;">1</td></tr>
		</table>
	</div> 
	
		<table><tr><td><input type="submit" value="확인"></td></table>
	

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