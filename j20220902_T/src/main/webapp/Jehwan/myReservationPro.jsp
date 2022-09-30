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
		var testStart = "USERNUM=" + '${ USERNUM }';
		$.ajax({
			data	: testStart
		});
		
		$(document).on("click","#prev", function(){
			var prevNum = parseInt($(".numSelect:first").val())-1;
			var sendData = "pageNum=" + prevNum + "&USERNUM=" + '${ USERNUM }';
			$.ajax({
				data	: sendData
			});
		});
		
		$(document).on("click","#next", function(){
			var nextNum = parseInt($(".numSelect:last").val())+1;
			var sendData = "pageNum=" + nextNum + "&USERNUM=" + '${ USERNUM }';
			$.ajax({
				data	: sendData
			});
		});
		
		$(document).on("click",".numSelect", function(){
			var sendData = "pageNum=" + $(this).val() + "&USERNUM=" + '${ USERNUM }';
			$.ajax({
				data	: sendData
			});
		});
		
		$(document).on({
		    mouseenter: function () {
		        $(this).css('color','white').css('background','skyblue');
		    },
		    mouseleave: function () {
		    	$(this).css('color','skyblue').css('background','white');
		    }
		}, ".change_btn");
	});
	

	
	function reserve_list(data) {
		$("#list").empty();
		var tag;
		for(var i=1 ; i < data.length ; i++){
			tag = "<tr>";
			if(data[i]["state"] == "방문전"){
				tag += "<td><input form='cancel_form' type='checkbox' name='cancel' value="+ data[i]["res_rid"] +"></td>";
				tag += "<input form='cancel_form' type='hidden' name='USERNUM' value='" + '${ USERNUM }' +"'>";
			}else{
				tag += "<td></td>";  
			}
			tag += "<form action='<%=context%>/reschange.do' id='frm"+ i +"'><td><input form='frm" + i + "' type='hidden' name='res_date' value='" + data[i]["res_date"] + "'>" + data[i]["res_date"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='brnNum' value='" + data[i]["brnNum"] + "'>" + data[i]["brnNum"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='lane' value='" + data[i]["lane"] + "'>" + data[i]["lane"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='start' value='" + data[i]["start"] + "'><input form='frm" + i + "' type='hidden' name='end' value='" + data[i]["end"] + "'>" + data[i]["start"] + ":00 ~ " + data[i]["end"] + ":00</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='customer' value='" + data[i]["customer"] + "'>" + data[i]["customer"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='cost' value='" + data[i]["cost"] + "'>" + data[i]["cost"] + "</td>";
			tag += "<td>" + data[i]["state"] + "</td>";
			if(data[i]["state"] == "방문전"){
				tag += "<td><input form='frm" + i + "' class='change_btn' type='submit' value='예약변경' style='border-radius: 5px;border: 2px solid skyblue;background-color: white;color: skyblue;width: 70px;height: 40px;'></td>";
			}else{
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
			pageInfo+="<input id='prev' type='button' value='<'>";
		}
		for(startPage ; startPage<=endPage ; startPage++){
			pageInfo+="<input class='numSelect' type='button' value='" + startPage +"'>";
		}
		if(endPage < pageCnt){
			pageInfo+="<input id='next' type='button' value='>'>";
		}
		$('#pagenum').html(pageInfo);
		
	}
</script>
<body>
	<jsp:include page="header.html"></jsp:include>
	<div class="flex-container">
			<div class="item_third"><h2>나의 예약 정보</h2></div>
		</div>		
	<hr color="#90C3FF" width="70%" size="1">
	<div id="content_container">
	<form action="<%=context%>/resCancel.do" id="cancel_form"><input type="reset" value="선택 취소" id="cancel_select"><input type="submit" value="예약 취소" id="cancel_btn"></form>
		<table id="test_table">
			<thead>
				<tr><th>예약취소</th><th>예약일자</th><th>지점</th><th>레인</th><th>시간</th><th>인원</th><th>금액</th><th>방문/취소</th><th>예약변경</th></tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
		
		<div style="text-align: center" id="pagenum">
			
		</div>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>