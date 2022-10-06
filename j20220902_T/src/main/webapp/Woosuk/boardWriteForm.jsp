<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var maxAppend = 1;

	$(function() {
		$('#brd_secret').click(function(){
		
	        if ($('#brd_secret').prop("checked")) {
	        	$('#brd_secret').val(1);
	        } else {
	        	 $('#brd_secret').val(0);
	        }

		})  
	});
	
	$(function() {
		$('._add').click(function(){ 
			if(maxAppend >= 3){
			    alert("파일 업로드 최대 개수는 3개 입니다.");
			    return;
			}else{  
				$('.__add').append('<li><input type="file" name="file_path1'+ maxAppend +'" class="files"> <button type="button" class="_add" onclick="addDel(this);">삭제</button></li>'); 
			    maxAppend ++;
			}
		});
	});
	
	 function addDel(a){ 
	    $(a).closest('li').remove(); 
	    maxAppend --;
	 }
	
	function chk() {
		if (frm.brd_title.value == "" ) {
			alert("제목을 입력해 주십시오");
			frm.brd_title.focus();
			return false;
		}
		if (frm.brd_content.value == "" ) {
			alert("내용을 입력해 주십시오");
			frm.brd_content.focus();
			return false;
		}
		return true;
	}
	
</script>
<meta charset="UTF-8">
<title>게시글</title>
<link rel="stylesheet" href="<%=context%>/css/HeadFoot.css" type="text/css">
<style type="text/css">
#hrline {
	width: 84%;
	margin: auto;
	color : #99ccff; 
} 

button {
			position: relative;
			border: 0;
			height: 30px;
			width: 50px;
			background-color: #90C3FF;
			text-align: center;
			font-weight: bold; 
			color: white; 
			border-radius: 12px;
			box-shadow: 0px 3px 0px #5A8DF3; 
}

li {
	margin: 10px;
	
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
<!-- 22.10.06 코드 전반적인 수정 [김건희] -->
	<form action="<%=context%>/writePro.do"method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="brd_bid" value="${num }">
		<input type="hidden" name="brd_ref" value="${brd_ref }">
		<input type="hidden" name="brd_re_level" value="${brd_re_level }">
		<input type="hidden" name="brd_re_step" value="${brd_re_step }">
		
		<div id="hrline">
			<h2>게시판</h2>
			<hr>
		</div>
			<!-- 비밀값 여부를 ajax를 통해 넘어가게 했다. 체크시 비밀글 값을 1 안했을 시 0으로 넘어간다. -->
		<div id="scr_box">
			<label><input  type="checkbox" name="brd_secret"  id="brd_secret"  value="0" >비밀글 작성</label>
		</div>
		
		<div id="title"><!--제목  -->
			<table>
			<colgroup>
				<col width="100">
				<col width="900">
			</colgroup>
				<tr><td style="	text-align: center;">제목<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;">
				<input type="text" name="brd_title" id="brd_title" required="required" ></td></tr>
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
				<input style="width:300px; height:300px;" type="text" name="brd_content" id="brd_content" required="required" ></td></tr>
				<tr height="100">
					<td style="text-align: center;">첨부파일</td>
					<td style="border: 1.5px solid #DCDCDC; vertical-align : top;">
						<ul class="__add"> 
						  <li>
						   <input type="file" name="file_path" class="files" style="width: 231px; height: 46px;">
						   <button  type="button"class="_add" style="vertical-align: sub">추가</button>
						  </li> 
						</ul>
					</td>
				</tr>
			</table>
		</div> 
			<!-- submit 실행시 writeProAction 서비스 실행 -->
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