<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=context%>/css/myResStyle.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajaxSetup({
			type 	 : 	'POST',
			url		 :	'<%=context%>/myCheck.do',
			//dataType :	'json',
			success	 :	function(data){
				var data1 = JSON.parse(data);
				console.log(data1);
				reserve_list(data1);
			}
		});
		show_reserve('${ currentPage }');
		
		$(document).on("click","#prev", function(){
			var prevNum = parseInt($(".numSelect:first").val())-1;
			show_reserve(prevNum);
		});
		
		$(document).on("click","#next", function(){
			var nextNum = parseInt($(".numSelect:last").val())+1;
			show_reserve(nextNum);
		});
		
		$(document).on("click",".numSelect", function(){
			show_reserve($(this).val());
		});
		
		$(document).on("change","#page_amount", function(){
			show_reserve(1);
		});
		
		$(document).on({
		    mouseenter: function () {
		        $(this).css('color','white').css('background','skyblue');
		    },
		    mouseleave: function () {
		    	$(this).css('color','black').css('background','white');
		    }
		}, ".change_btn");
	});
	
	function show_reserve(pageNum) {
		var sendData = "pageNum=" + pageNum + "&pageAmount=" + $("#page_amount").val();
		$.ajax({
			data	: sendData
		});
	} 
	 
	function reserve_list(data) {
		$("#list").empty();
		var tag;
		for(var i=1 ; i < data.length ; i++){
			tag = "<tr>";
			if(data[i]["state"] == "방문전"){
				tag += "<td><input form='cancel_form' type='checkbox' name='cancel' value="+ data[i]["res_rid"] +"></td>";
			}else{
				tag += "<td></td>";  
			}
			tag += "<input form='cancel_form' type='hidden' name='currentPage' value="+ data[0]["currentPage"] +">";
			tag += "<form action='<%=context%>/reschange.do' id='frm"+ i +"'><td><input form='frm" + i + "' type='hidden' name='res_date' value='" + data[i]["res_date"] + "'>" + data[i]["res_date"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='brnNum' value='" + data[i]["brnNum"] + "'>" + data[i]["brnNum"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='lane' value='" + data[i]["lane"] + "'>" + data[i]["lane"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='start' value='" + data[i]["start"] + "'><input form='frm" + i + "' type='hidden' name='end' value='" + data[i]["end"] + "'>" + data[i]["start"] + ":00 ~ " + data[i]["end"] + ":00</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='customer' value='" + data[i]["customer"] + "'>" + data[i]["customer"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='cost' value='" + data[i]["cost"] + "'>" + data[i]["cost"] + "</td>";
			if(data[i]["cancel"] == "1"){
				tag += "<td style='color:red;'>예약취소</td>";
				tag += "<td></td>";
			}else if(data[i]["visit"] == "0"){
				tag += "<td style='color:blue;'>방문전</td>";
				tag += "<td><input form='frm" + i + "' class='change_btn' type='submit' value='예약변경' style='border-radius: 5px;border: 2px solid skyblue;background-color: white;color: black;width: 70px;height: 40px;cursor: pointer;'></td>";
			}else{
				tag += "<td style='color:green;'>방문완료</td>";
				tag += "<td></td>";
			}
			tag += "<input form='frm" + i + "' type='hidden' name='res_rid' value='" + data[i]["res_rid"] +"'></tr></form>";
			$("#list").append(tag);
			
		}
		var pageInfo ="";
		var startPage = parseInt(data[0]["startPage"]);
		var endPage   = parseInt(data[0]["endPage"]);
		var blockSize = parseInt(data[0]["blockSize"]);
		var pageCnt = parseInt(data[0]["pageCnt"]);
		if(startPage > blockSize){
			pageInfo+="<input id='prev' type='button' value='<' style='border-radius: 5px;border: 2px solid skyblue;background-color: white;color: black;width: 30px;height: 30px;cursor: pointer;'>";
		}
		for(startPage ; startPage<=endPage ; startPage++){
			pageInfo+="<input class='numSelect' type='button' id='" + startPage + "' value='" + startPage +"' style='border-radius: 5px;border: 2px solid skyblue;background-color: white;color: black;width: 30px;height: 30px;cursor: pointer;'>";
		}
		if(endPage < pageCnt){
			pageInfo+="<input id='next' type='button' value='>' style='border-radius: 5px;border: 2px solid skyblue;background-color: white;color: black;width: 30px;height: 30px;cursor: pointer;'>";
		}
		$('#pagenum').html(pageInfo);
		$("#" +  data[0]["currentPage"]).css('color','white').css('background','skyblue');
	}
</script>
<body>
<div id="wrapper">
	<!-- 헤드 부분을 제거하고 수정 -->
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
					<li><a href="#">게시판</a></li>
					<li><a href="<%=context%>/mypage.do">마이페이지</a></li>
				</ul>
			</div>
	</div>		
	
	<hr color="#D5D5D5" width="100%" size="1">
	<div class="flex-container">
			<div class="item_third"><h2>나의 예약 정보</h2></div>
		</div>		
	<hr color="#90C3FF" width="70%" size="1">
	<div id="content_container">
	<form action="<%=context%>/resCancel.do" id="cancel_form"></form>
		<table id="test_table">
			<caption>
				<input form="cancel_form" type="reset" value="선택 취소" class="cancel_btn"  id="cancel_select"><input form="cancel_form" type="submit" value="예약 취소" class="cancel_btn" id="cancel_btn">
				<select id="page_amount">
					<option value="3">3개씩 보기</option>
					<option value="5">5개씩 보기</option>
					<option value="10" selected="selected">10개씩 보기</option>
				</select>
			</caption>
			<thead>
				<tr><th>예약취소</th><th>예약일자</th><th>지점</th><th>레인</th><th>시간</th><th>인원</th><th>금액</th><th>방문/취소</th><th>예약변경</th></tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
		
		<div id="pagenum">
			
		</div>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</div>
</body>
</html>