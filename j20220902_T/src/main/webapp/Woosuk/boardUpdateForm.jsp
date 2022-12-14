<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  String context = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	var maxAppend = ${fn:length(board.brd_img_src)};
	
	$(function() {
		$('#brd_secret').click(function(){
	        if ($('#brd_secret').prop("checked")) {
	        	$('#brd_secret').val('Y');
	        } else {
	        	 $('#brd_secret').val('N');
	        }
		})  
	});
	
	$(function() {
		$('._add').click(function(){ 
			if(maxAppend >= 3)
			{
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
	 
</script>

<link rel="stylesheet" href="<%=context%>/css/boardUpdateForm.css" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet" > 
</head>
<body onload="init()" style="overflow-x: hidden">
	<!-- 헤더  -->
<div id="wrapper">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li>${name}님</li>
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
	<div class="item_third">게시판</div>
	<hr color="#90C3FF" width="70%" size="1">

<div class="flex-container center">
	<div class= "content_box">
		<form action="<%=context%>/updatePro.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="brd_bid" value="${board.brd_bid }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		
		<div id="title"><!--제목  -->
			<table>
			<colgroup>
				<col width="100">
				<col width="800">
			</colgroup>
				<tr><td style="	text-align: center;">제목<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;">
				<input type="text" name="brd_title" required="required" value="${board.brd_title }" style="width:99%; border:none;"></td></tr>
			</table>
			<p>
		</div>
		<div id="content"><!-- 내용 -->
			<table>
				<colgroup>
					<col width="100">
					<col width="800">
				</colgroup>
				<tr height="300">
					<td style="text-align: center;">내용<sub>*</sub></td><td style="border: 1.5px solid #DCDCDC;	 text-align:center;">
						<textarea style="width:99%;" rows="30"  type="text" name="brd_content" id="brd_content" required="required">${board.brd_content }</textarea>
					</td>
				</tr>
				<tr height="100">
					<td style="text-align: center;">첨부파일</td>
					<td style="border: 1.5px solid #DCDCDC; vertical-align : top;">
						<ul class="__add"> 
							<li>
							  <!--  <input type="file" name="file_path" class="files" style="width: 231px; height: 46px;"> -->
							   <button id="input_ch"  type="button"class="_add" style="vertical-align: sub">추가</button>	
							</li> 					   
							   <c:if test="${not empty board.brd_img_src}">
							   		<c:forEach var="img_path" items="${board.brd_img_src }">
							   		<input type="hidden" name="exist_img" value="${img_path}">
										<li>
											<input type="hidden" name="update_img" value="${img_path}">${img_path }
											<button id="input_ch" type="button" class="_add" onclick="addDel(this);">삭제</button>
										</li>
									</c:forEach>
							   </c:if>
						</ul>
					</td>
				</tr>
			</table>
		</div>
		<div>
		<!-- 비밀글 값 여부에 따라 체크박스에 체크가 유뮤 조건 -->
		<div id="scr_box">
			<c:if test="${board.brd_secret == 0  }">
				<label><input  type="checkbox" name="brd_secret"  id="brd_secret"   value="N">비밀글 작성</label>
			</c:if>
			<c:if test="${board.brd_secret != 0  }">
				<label><input  type="checkbox" name="brd_secret"  id="brd_secret"  checked="checked" value="Y">비밀글 작성</label>
			</c:if>
		</div>
		<!-- 수정submit form통해 updateProAction 서비스 실행 -->
		<div class="submit">
				<input class="bottom_btn1" id="input_ch" type="submit" value="수정">
				<!-- 뒤로가기 -->
			   	<input class="bottom_btn2" id="input_ch" type="button" onclick="history.back()" value="취소">
		</div>
		</div>
			
		</form>
	</div>
</div>

</div>
		<!--풋터                       -->		
		<div class="flex-container center">
			<div class="item_end">
				<div><pre class="footer">쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre class="footer">이메일  choongang@naver.com</pre></div>
			</div>
		</div>
		<a href="#" title="" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
</body>
</html>