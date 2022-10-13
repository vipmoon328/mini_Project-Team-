<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  String context = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=context%>/css/brdNoticeForm.css?v=<%=System.currentTimeMillis() %>" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet"> 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var maxAppend = 1;

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
<title>공지사항 작성</title>
</head>
<body  style="overflow-x: hidden">
	<!-- header -->
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
					<li><a href="<%=context%>/mgrList.do">회원관리</a></li>
					<li><a href="#">매장관리</a></li>
					<li><a href="<%=context%>/mgrBrdMgt.do" style="color:#5A8DF3 ">게시판 관리</a></li>
				</ul>
			</div>
		</div>
			<hr color="#D5D5D5" width="100%" size="1">
	</div>
		<div class="flex-container">
			<div class="item_third">공지사항</div>
		</div>
	<hr color="#90C3FF" width="70%" size="1">
	<form action="<%=context%>/brdNoticePro.do"method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="brd_bid" value="${num }">
		<input type="hidden" name="brd_ref" value="${brd_ref }">
		<input type="hidden" name="brd_re_level" value="${brd_re_level }">
		<input type="hidden" name="brd_re_step" value="${brd_re_step }">
	
	<div id="title"><!--제목  -->
			<table style="width: 80%;">
			<colgroup>
				<col width="100">
				<col width="900">
			</colgroup>
				<tr><td style="	text-align: center;">제목<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;">
				<input type="text" name="brd_title" id="brd_title" required="required" style="width:99%;" ></td></tr>
				</table>
			<p>
   </div>
	<div id="content"><!-- 내용 -->
			<table style="width: 80%;">
				<colgroup>
					<col width="100">
					<col width="900">
				</colgroup>
				<tr height="300"><td style="text-align: center;">내용<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;	 text-align:center;">
				<!-- <input style="width:300px; height:300px;" type="text" name="brd_content" id="brd_content" required="required" > -->
				<textarea style="width:99%;" rows="30" name="brd_content"  required="required" ></textarea> </td></tr>
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
				<tr><td><input id="enroll_btn"  type="submit" value="등록" ></td></tr>
			</table>
			
		</div> 
		
	</form>
	<!--풋터  -->
		<div class="flex-container center">
			<div class="item_end">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div>
</body>
</html>